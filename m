Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153750;
	b=URGlwDun1iQtweKOUcyKRt5iEb912sw5tnGvjgpuiFA+o3xi6XrlL0wLpsil/6dc11yz
	 uVv2V4t6DIpxpzlrecUOXbQIxXx6+fctqIrVShzUJNoc2PYWQghsAfY+S5BtQFGYSuJ3y
	 ihFFXgGHBI1citjbnfw4JERYqvj0Tau5pszJwLHbi1qZcgi1u5ncjox8710M0aTYdHHwb
	 SaDcJTngV6PND2yKjnzjtVR+OcvOSKw8ZlEFaIdFqPZnZD0RZphhRB4jpWF1VX67HnjHI
	 WlIqhiHP33Ep+wrJrQ2+JUBvs9Z8w57eWaoI3OJk5/FVd9EU5MJpTew6PeTqb3FOqXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153750;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VFkGiQSXn99lAyTMYrSvbj/rm7ZqlYj+LcHweNzcxzU=;
	b=G8mucXYtKurHLcY/syQij56HBwh+xPdGQkdI3BzPoVtlZfQEHC8Iu6w9UDVOh7WCN3eB
	 ACyoFz6Cg0RkC6F1XkAx6MKd+blKhXWfLOTlBd6pEK+C4c8JKpxwOPcVZr/7yJ6FuB2Oa
	 Jq8aZDJ1dQcRDckeaBCKsqKkl8jN0Jy5C2kjPRm2YHTNNHILTdL3bAvgFF6Ei7RNNhlB3
	 CuBaHuMuoooVbIm4s1TJUoRs9ZWQdrC4yS61BnOKkSpU1UryzRNikDbGZ/M4grNfTor6m
	 UBD7Tz98rpl8kL1Z0CcokTsmYN9QAqXDld+TA4ujfVBrRc9xnBWO1kwUpllRQBi4l9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C3606A31E;
	Wed, 28 Oct 2026 02:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7a062132d27511f19a56ed5b684f684d-20261028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0def37ea-b7ac-4943-94e9-5902cd1f7323,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:10511418d5a62f49f176b818f3576898,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a062132d27511f19a56ed5b684f684d-20261028
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1306354554; Wed, 28 Oct 2026 10:15:42 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Wed, 28 Oct 2026 10:15:38 +0800
Message-Id: <20261028021538.792127-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015025456.3927808-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <20261015025456.3927808-1-huangwei@kylinos.cn>
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

Hi Johan,

Gentle ping on this one. The v2 keeps the full-tuple match from v1
(now verified against both device descriptors - the VDS1022 dump
kindly provided by leStoppe confirmed that a class-only match would
not discriminate), reworks the commit message per your review, and
carries leStoppe's Tested-by. Anything else you need before taking
it?

Thanks,
Huang Wei
