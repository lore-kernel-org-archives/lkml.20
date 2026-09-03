Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0A3C5832;
	Thu,  3 Sep 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424815; cv=none; b=muPxWdGUmwYpc6/8JHs4Nclj5UBvD/vQl4Ij+fmIWrrSp1MNe9Ja6QGTnBdHPd4cl05ceoarnEwWn15Fa79h6uEe7p2FJhwnNqd2NNZepFWbKHPshHvfzmT78Qee0CdhZA35e1K/YpdHLkMAZ3GFAKac6+rxze0sJ4kYydBmbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424815; c=relaxed/simple;
	bh=iG4xhvwpyn0mUG5F9kgfH1IlHOda8aWCkvFsoumb8KE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKt0TyCUdfwNSfwNUds1D7p43xEtUnLRhOPuHf3sJ8+ESP08+995QiG/ZR65p040B8OoDvAtA18d7cF8MEq6Gc8uwPtnhwdqOWN7JseMD7sQ4Xa5ix0rAbjkaV4jvGUL/mRxBYW/j1N2qbCPzGdCL3TPbHAo3Q3VF7HQTK5I3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1040678aa77311f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e4bb56b8-267a-4301-88e6-df4a7ac4434c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:e4e3d05f10b7d8ab5d55921fcbdcd6df,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1040678aa77311f19a56ed5b684f684d-20260903
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1115636491; Thu, 03 Sep 2026 16:40:06 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Cc: Huang Wei <huangwei@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: fix teardown races with late notifications
Date: Thu,  3 Sep 2026 16:40:00 +0800
Message-Id: <20260903084000.3507309-1-huangwei@kylinos.cn>
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
