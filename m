Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672602;
	b=AU9quQJXrGmyStK9sd2QwPKogGbOT3uVO13s2yB2H1Hwiw4mtZbuIZq/u5fZuP43xG+k
	 KaZbserwZjJipLU5fGnXe6jEw9RIlPlSz4V0h6Ped/zt2FkWz967/f2o7xIDB3gUV5LeG
	 Y1KUpi3uzYYxX9koln2rK3nJzfEVw6vmui6FKH2aqvTsFOanbiZMPEqbTrTt2X9ArdS9T
	 fZgjWLE/+S890kXWGY4eLGIDiRHovH6CxKojeWajgsXkd6Xht2jZVqeIx6WmtvShj/U0i
	 xeeBsd4amD9PrLr1e6kTVKbzi2Crg7VTyHPdTtqGRllbZJWib2eByJtsDAQueGHV+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672602;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lDa4CRo0bVWLUZcEWwGEQU7uUMPS4ytlZLdUxB0z23I=;
	b=FXJYeU73BIwV97BuT5kPIh4MInNy3U7+3vr3cnyGUtt0f6/GsdkKUYhSrPLLjIIxSbay
	 DlYJyDAAAuntOhMYar86OpK/eGoK+W+90nmTszG+la4f372qjrDuoHXTdWb05xXMJ3+4c
	 5tTLRvHIoLOHgz4kXnirzstXCFEuN1aLhogXtG0MVAibYO3D5bFy2A08qiGhSJvQAQpCC
	 zR61zC6C3uWkYdPVyssVPQ57MFd7VrOZ79khs+Hv6IWZ/vP/oOUdHhXom8cxRw9muYISw
	 gcPRnbTPOdSCDzOFRIx1XFSMXfEse4SJDHiX0zDzczIbwokib9FU/+nFdbGBDyIyyvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B4606A329;
	Tue,  3 Nov 2026 02:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042B4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 860adaf6d72d11f19a56ed5b684f684d-20261103
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:55c4a896-5941-4364-b680-bb36944da79f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:750fa53f982e8e4f58d77401b07397d6,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 860adaf6d72d11f19a56ed5b684f684d-20261103
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 731410629; Tue, 03 Nov 2026 10:23:14 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Craig Hesling <craig@hesling.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Tue,  3 Nov 2026 10:23:11 +0800
Message-Id: <20261103022311.1011677-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Craig,

Thanks for the additional data points - and for the comprehensive
descriptor table. This changes the picture significantly.

The VDS1022I reporting (5, 0, 0) - the same tuple as the HDS200 -
means the full-tuple match in my v2 doesn't actually solve the
problem it was designed for. It would:

  - correctly claim the HDS200 (which wants serial)
  - incorrectly claim the VDS1022I (which needs libusb, same
    florentbr tooling as the VDS1022)

So the interface tuple is not a reliable discriminator for this
VID:PID - OWON reuses the same tuples across device families with
different userspace needs. That undermines any approach based on
narrowing the match at the interface level.

Given this, I think the options are:

  1. Keep the original broad USB_DEVICE() match, accepting that
     VDS1022/VDS1022I users need to blacklist the driver (this was
     the status quo before my patches, and users have workarounds)

  2. Remove the owon entry entirely and have HDS200 users move to
     libusb as well (uniform but breaks existing serial users)

  3. Find a different discriminator (bcdDevice, string descriptors)
     - but these seem equally unlikely to be reliable given OWON's
     firmware practices

Johan - given that the interface-level narrowing doesn't work,
what's your preference? Should we revert to the original match and
document the libusb incompatibility, or is there another approach?

Thanks,
Huang Wei
