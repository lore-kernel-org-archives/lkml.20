Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797126;
	b=ZsmfqRjoaCsNkMMhmD7Dox9431xffsPLElkKWL2OMbkXJCOSQys0hUHlMFQuZGHxJMlR
	 GP+j+ZGDjRd4FlCJGQMJmO8ZQW1x2PfNf3nMeef+CEMX+A513OjR7pZ+NqE+81dKt9Vw1
	 8ugNURWX6ey2HeVBTFtUdRzFgx/SnD0LcHzvK6VksKcDTHgnJnpGiG4FPJUU8EdI4Q7s/
	 EvXyz78TW4QVjwUvGnWNyB/m0qCdZq8q1gH+mL4HFIHvT0jPJy5vivTruGgOw2a3TLEWw
	 wA3uSfcU2Pca0/dwQCDFAlHR6beSJLqGQy+E1dbV9RzVP3AVI19azAchpN1oKbAYszA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797126;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e25WW/amuSc0f/SwPuvo2lf7qCMr2sS7EIXdFwIzN9I=;
	b=aOBlL/h3pIZA5UdBne2qjgX6O+VFpXSebBmR3o0icgJ1MZt8pV5cBjLjwslJ3Zxwpreb
	 alx/gxh6owuf9VuXC10D7eJdNXg9MHOdVjPTAcS9CWhMhOmAo6uKYAkxv+Ms+RAk39YJ8
	 Nv9N/V2pNzbUiXARVDexwoby0mNicfth8shf4LvC8uY6kT9w2jSJdfz8SdXANsuNjpFll
	 m67olpPxCde4r3BChnudioeQ7fEwZh7aLnYmVpKkwIoTB8I82vU4LGfTd+O1pOSt9Z/16
	 zaaAAaCGTFW+Dmk+3Oq3+hJoH/0DpU3Um/nLaPxsm4uuORG1WCegXR0qgvwpgmPb7lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7C606A323;
	Mon, 16 Nov 2026 02:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bea6e4cee16711f19a56ed5b684f684d-20261116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a7ee28e0-2522-4ae8-8a7e-66e9980f0d6e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:02734c91e1313642b361f95b2c94793a,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bea6e4cee16711f19a56ed5b684f684d-20261116
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 537824501; Mon, 16 Nov 2026 10:45:12 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Mon, 16 Nov 2026 10:45:07 +0800
Message-Id: <20261116024507.2633503-1-huangwei@kylinos.cn>
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

Following up on this thread. The last open question from the November
3rd analysis is how to proceed given that the VDS1022I reports the
same interface tuple (5, 0, 0) as the HDS200 - the interface-level
narrowing doesn't reliably separate the device families.

The v2 is ready if the full-tuple approach is acceptable, but given
the new data it may need to be reverted to the original broad match
or approached differently. Could you share your preference when you
get a chance?

Thanks,
Huang Wei
