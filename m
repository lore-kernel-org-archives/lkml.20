Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323699;
	b=NZkg+cySjt4xMLaoAkOlgkRNb4bxCLEA43nfGzFAbdeXPrhJadsUXI7mGFCOIF/iGQ/z
	 8/zA6OddlJB1pvt90OtSlBUSBdM5z2reXA7Sxb0phtf/A0+9uMlXGPbbyW47/42bVBG9N
	 L+mbKVBR3u7/1v1vLxGztKHnf14EHBS5n605PTJNUlgR10n+ILk7rEOl5gLw4VFKNSqcK
	 a8BQubKD2kyZSUyDUgpQ1QknDFvz+yQcu1LPNtrZojkzcZNaYJzsLd/I2VMs9BXUqmGLl
	 N69LEQWrSD5wYWmMrfDPP/cKcrvKy/hxpyL7sNpDXTnDuoVJAkbTV/+Fka397gRT4kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323699;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ko4ls3qqVzlXNxfX8a12H6URoQecw8b9jhJGN2hC6OU=;
	b=cIeBhdZMk5wtgBLZM4HafzVLEgKkqqDouUmBr7r16aw17yjuD71pi064U+SN+24eC1Qx
	 aS/bavtEANy7odK5FK/InJ7D36zS62KqpahNxnigiuxmUql7ZLNNth70xL5E4uYvIY3S/
	 6yN2wxQ1KZLdVsyyzMbD5Cu90Fmj8v5aqMF6HTZK0OHQxoj1JIKwctKJIMceKAFbzVuBm
	 grvvfWRRVDkyvQ1RztLrpxWZ1hKHMvC9EbcKZL61dfWb8anhHaggS/DErSWI4uBHwcsEX
	 mdzx4UiyfWU2s3i1DzgfeecumlDuLHhu/fvQjKuGgW8i6XUV5NJh2wzNjNEYhz/+Asw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF6606A31A;
	Fri, 30 Oct 2026 01:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AF6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2ac56d20d40111f19a56ed5b684f684d-20261030
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d9dd9a9e-0abc-435d-bb0d-7869c202ddda,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:754df53d9fe5c0d59af7f0c20fcefc06,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ac56d20d40111f19a56ed5b684f684d-20261030
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 519817670; Fri, 30 Oct 2026 09:28:10 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Craig Hesling <craig@hesling.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Fri, 30 Oct 2026 09:28:05 +0800
Message-Id: <20261030012805.4087311-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
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

Thanks for weighing in, and for the background on the original
intent - that closes the loop on the question from August.

On binding the VDS1022's serial interface: the practical issue is
that the userspace ecosystem for it already exists and runs on
libusb - leStoppe's tool is the florentbr/Owon-VDS1022 one, and
that is exactly what made this a regression: it worked out of the
box before commit 4cc01410e1c1, and the kernel binding broke it
immediately. Pre-claiming the interface breaks real users today,
whatever the merits of a serial-based toolchain would be.

The "looks like serial" point is also subtler than it appears -
plenty of devices expose two bulk endpoints without being serial,
and the VDS1022's protocol is binary request/response with the
framing done in the tool (leStoppe mentioned even the SCPI
commands need enabling through the tool's socket, so it is not
plain-text SCPI-over-tty like the HDS200). A generic serial
binding gets you a tty speaking a private binary protocol, which
only helps if someone writes matching userspace.

Your end goal is not wrong though - if a serial-based VDS1022 tool
shows up someday, the tuple match keeps the interface available and
it can be bound deliberately at that point. What we shouldn't do is
claim it speculatively and break the existing libusb users.

On the HDS272S older-firmware check - that would be genuinely
useful whenever you get to it, no urgency. The commit-message dump
and leStoppe's VDS1022 dump are the only two data points either way.

Thanks,
Huang Wei
