Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673147;
	b=NBoAb57BnEEFbqYDrdUlTxWr1sMNdbCfVLq1c3pb1loonJJJ44zSHoMvu3c3NEfxn3Y4
	 MU/8w7n/8L9zi10eGur3jCTwGWb/LA5MM5fYV7hYdiTwJ7++S7f/t37Ahh4hRD7vWnARh
	 9vO+JNhm1bjNKhCkAMoqvdikeVZ714HPfWLaxE5HLBe9fH2O7NL2UJk0b1uI3pxPDySRp
	 YX6sYOkeTKN3oofIpz0UUvLiCzLARb/+2VI01GpMxxfRToNJ4gIwqIKcxvahUosivMDjZ
	 wrjuIIl6g0dlVDgCNqdGjld22cvVh1BQsHIIahU7tSraAyvKjGvVwlGm4FQ8qgei9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673147;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JCDCkpZpZx3msxFpU0K7Bh+oLFZlG0e5BdfbB0gsogA=;
	b=GmxK1vOv4Qs7L4HtPAEvCvB8orLab6/NwHqKX6z6YsEpDN4DM/Hkwpfv754YGbn7BpPC
	 9M+9UYqK/v2zQcVWii4/3MZwNEPklZ03ArfY6ChDxn3FXnbZEacqEOSG4Uebu9YTwKody
	 kIk945TwHDicKWKpmif5gmDBVzt/r0I5m6+S1anMsRGQQqfk4Mlclz8DbglB2iVlWShUH
	 TYFqV+WxHHuuTR964+COgTSUMpvyRBcGOtt3AP0+cZoqb9oJPmhyxwznRmiRZwTeb65S/
	 VE9D8IfCexhHsH5PmFuID+wfRtSafyrHXZVQ9DLsC4HTlDabHeDIOFa0G2xsa/WnXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VYCQKKLo;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E3606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20E3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VYCQKKLo
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id S3znxxxy2JFmFSGT3xyZtz; Sat, 14 Nov 2026 16:19:05 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGT2xeCsB0288SGT3xZvrs; Sat, 14 Nov 2026 16:19:05 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af889f9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=mn8VwWfJFaLlvHgQrZwA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JCDCkpZpZx3msxFpU0K7Bh+oLFZlG0e5BdfbB0gsogA=; b=VYCQKKLoer5ezSDEIGlp3u7A8x
	uZ+iLGexfw8yPMd4Jqau/5dc4FCpE6Gkm/7E2ngLDLCgjG6ayuR1bg0xzdrn7FRmmeMSG75JU2YT3
	5wZz6E1m3UPfUSYBxj8XNBPRUeYvfprWvdZlChJngSPMxyc8avaKc5Xfx3QbAQQCPr3exTidfXcKu
	gJ7/0HF/oWlRQ60ttF2Zu9U4EFo8X5DhRlwzB/MuJktN87pR1zuJPl7ioqLkZ+ea6b4hwg0E1zCVL
	c0xIWvF2wgQtK5xTCrnv+X1eY1NgPJCYlTTIP+jMr6p9St1xhOSNOTQRZXFmbjPLnG+qnzQfE/My+
	yBH7uNGw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43562 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGT2-000000008Gd-2VUG;
	Sat, 14 Nov 2026 21:49:04 +0530
Date: Sat, 14 Nov 2026 08:19:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 6/7] hwmon: (nct6683) Name the fan headers of the
 ASRock B850 Steel Legend WiFi
Message-ID: <1155bf6d-9a68-42cd-91d2-d336f345a020@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-7-jdahlin@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111082838.1418051-7-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGT2-000000008Gd-2VUG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43562
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 56
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC+pSd0Z9Yol/YzYCyKgM3gOFYf8haOcR4Mr4DLBHHcrasLIh7wVFQPmns8sXtl5eO+LYEBMQI0TUsqDOTBNFZHcVWfS/MY7EZx372llBuDAyjc8iRmX
 wW6vwzJmN7EXwdes5B7Qtnn3MxVAGce2J7OdKecUqEQVuwRGzRqVFCWHBxqADQ8QaC0x8V/EG2/HoE1hX9MlHX4ME851GMULEs2X37yG2DOepIbegKxuDS1S

On Wed, Nov 11, 2026 at 09:28:37AM +0100, Johan Dahlin wrote:
> With fan control available, users need to know which pwm channel drives
> which header. The driver has no fan labels.
> 
> Add a fanN_label attribute, visible on boards with a name table, and name
> the channels of the ASRock B850 Steel Legend WiFi after the headers
> printed on the board: CPU_FAN1, CPU_FAN2, AIO_PUMP and CHA_FAN1 to
> CHA_FAN3. The order was inferred from the readings and the BIOS defaults.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Again, please add per-board sensor names to sensors3.conf.

Thanks,
Guenter
