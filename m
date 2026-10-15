Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117C29BD9A;
	Thu, 15 Oct 2026 02:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032884; cv=none; b=a6OWrJP8hYrocFTqKQHN/F2cGDIIAMBfzsLPJHd3HpUJyTzgwgliqF1B09Y7Yr27090JMdYVfxa8ckyuIBIMzn1TAqtZjsEdqiXsveOwWGmblaJZSnuM4PP0Y7aUwVYEYS6Otemt0FR2PTKaaDFtJMgNV4C1PNKuooq/q+TKfjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032884; c=relaxed/simple;
	bh=p3BBM3/ASQZwgp/7YtCpXRoVuWfV685qIw5c23cdOD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDNTCAXM6Ws7k9dM/ktKO+r2puwwxQScccIyM7ZO3mQtSXi7XFjyzvtFCAQLm8FCrouUfgIPnYr6YGvUzDNedPye+fyzI8ix1wXQP4m28c+aqqnQlu84YrNi059ZLU79zU7N7CGGiTueHJdiXD2tFFBgaRg/JiOTKmKG1pYbfZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c190b198c84311f19a56ed5b684f684d-20261015
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:37f67a52-ada7-4980-9eca-80cabb2be0f2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:29d3a414a3750f921fa58b6695b78d0c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c190b198c84311f19a56ed5b684f684d-20261015
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 201491061; Thu, 15 Oct 2026 10:54:36 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: leStoppe <lestoppe@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Thu, 15 Oct 2026 10:54:31 +0800
Message-Id: <20261015025431.3927020-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014031228.1fadf3d2@delby>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <20261014031228.1fadf3d2@delby>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi leStoppe,

Thanks a lot for the dump - this settles it. Johan's hypothesis was
exactly right: the florentbr tool talks to the VDS1022 over libusb,
and the kernel driver binding is what blocks it from claiming the
interface. And the point that the VDS1022 is a headless scope where
the PC tool is the primary interface makes it clear it should stay
unclaimed.

The descriptor data also settles the match question, in a slightly
unexpected way. The two families share interface class 5, but:

  HDS272S (dump in the commit message of 4cc01410e1c1):
    class 5, subclass 0, protocol 0
  VDS1022 (your dump):
    class 5, subclass 6, protocol 0x50

So a class-only match - the USB_DEVICE_INTERFACE_CLASS() form that
came up in the August review - would still claim the VDS1022. The
full interface tuple does discriminate, which is what my original v1
used. I'll follow up with a v2 that keeps the full-tuple match and
reworks the commit message around the libusb breakage, with both
descriptor dumps as the justification.

Craig - if you happen to know whether subclass 0 / protocol 0 holds
across the HDS200 series and firmware versions, that would be a
useful confirmation; the dump in your commit message is the only
HDS200 data point I have.

Thanks,
Huang Wei
