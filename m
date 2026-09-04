Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6038A734;
	Fri,  4 Sep 2026 03:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493050; cv=none; b=krka2KLgXzzOiUkSXp5Ze0TmdD21Ed3S8Qb5vm2/fDYrgOL6R4M4wrvrYT9X+RYmbHezC2e7CaRhV2WvbOGbHVIwtG+n4pD98f0qENHOT01XzzS7w4zfOTaZMYQiTUhqQ/FL+cUJk0VFdmj5t4j288uAmHH8f4FR0feLMT0DIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493050; c=relaxed/simple;
	bh=iG4xhvwpyn0mUG5F9kgfH1IlHOda8aWCkvFsoumb8KE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/Uk7MLzC1AVeN8nbXJ9WCd6AnkSXmt1Sb3YF4GTcKB9TCyNqvoK5WIR+CVbvNflo09SfZWOP+PL0kOIUaikeB5Gdwv/yaIw1yw/1QFru1+EnQuX8sKBOUaVA/7DG6Z8tWREqB2T9yOIXzcYfwZcyAdSg6Nc9JSi6N+EfYZlTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e8bd2e4ca81111f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2395e2af-0c29-4e0d-9846-b5e1cc9f27cc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:2ad675b60dda10f76224ad2b3975a187,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e8bd2e4ca81111f19a56ed5b684f684d-20260904
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1720470805; Fri, 04 Sep 2026 11:37:09 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Cc: Huang Wei <huangwei@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: fix teardown races with late notifications
Date: Fri,  4 Sep 2026 11:37:05 +0800
Message-Id: <20260904033705.725405-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903030356.58597-1-ivanrwcm25@gmail.com>
References: <20260903030356.58597-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Iván,

I've been poking at the ucsi teardown path lately so I took a closer
look at this. The race is real, and moving acpi_remove_notify_handler()
ahead of ucsi_unregister()/ucsi_destroy() is clearly the right call for
the ACPI path.

One thing I couldn't convince myself of: does acpi_remove_notify_handler()
wait for a handler that's already running on another CPU? From what I
can tell ACPICA removes the handler node under the device lock but
doesn't flush an in-flight dispatch, so a notify that's already entered
ucsi_acpi_notify() could still dereference ua->ucsi after the handler
is gone and ucsi_destroy() has freed it. The reorder handles new
notifies fine, I just wasn't sure it handles the one that's already
mid-flight. Did you look at that?

On the ucsi.c changes: setting ntfy to 0 before NULLing the connector
array looks right to me, ucsi_connector_change() bails on ntfy before
it touches the connector. But ucsi_notify_common() also does
complete(&ucsi->complete) and the backend's read_cci(), neither of
which is gated by ntfy. So for the non-ACPI backends (glink, ccg)
that can't be fixed by reordering the ACPI handler -- is the ucsi.c
part actually enough on its own, or do they need their own teardown
ordering? Put differently, is the ACPI reorder the only real fix and
the rest belt-and-suspenders?

Only build-tested too -- would help to know how the race was found
and what makes the reorder sufficient on its own.

Not objecting, I'd just like to understand the in-flight case.

Thanks,
Huang Wei
