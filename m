Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015789;
	b=UkXfWdxSO0WpHw32NO0dl1YLA7R9VDc0Q1M+uI/HLnEeZK3I9NkIFMmoqxaL1LuFlIli
	 U6ZWyOYw0pOU+TTEXlPi+I/g/bGzN6SUFMWvUOM+AyphOCML7a0C8TNSt5mUveReocKo+
	 0qEoZOw/S9AugPO49kOtJAI9IQF5Iwn6SmmeSf9WR+p8oGCTEs8NLq5Xl5TVQZjTPkFEN
	 yQTwfzU/D2H5aSqNYE8/abWL6lq9Yx1fbhb85CifaVo4elAMR/5sz9+qNE2LatVAwBymK
	 bLfG5qCIcuiROrXdh/J6yEmFsF+cWTkRdUUV1twZQAEeuT/Z3c9SOrpKzJRQSIz4P5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=liq9i1NHSAISsV3yGKXncG3NwcdaWrLis28fjxbXbCA=;
	b=GzH1+FeNFLK/jobOTiP57L6TcUxVar8IFXwF41tlr3w4uXpe95lyGmpg0RsecuHqPJ3V
	 uVs3DP9PliyohZ2qh9DxqHfi1NUGmh2XVMTk96uPyP4kHD+PE7laN2HK+Bz6KlVOMJzvr
	 6H5R3TGHCsCZTfB0A/jHaIVJ1A1XzylWVyT67yu8AbVevPpCGUJpylVSiD/Sls1L/f5mH
	 wzf2IE8Yh4XyiZu3umcZFo3qY/OKczB6uO5nPDghZFCd6OQuJnj45WLwykfNF758pWMvB
	 VmK53Sxi9Wqt465r5uS4MnTK6mPib5JZVJN7SqDUrCMUSuRO7OtuqzJvOTLOVoGbr8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQmQ6DTu;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A70606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A70606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQmQ6DTu
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso1002139a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794015788; x=1794620588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liq9i1NHSAISsV3yGKXncG3NwcdaWrLis28fjxbXbCA=;
        b=RQmQ6DTubDOAzk8n7m56LQAfgRngkquenUkYypU2PKFSo8EDOzAq5m4368raD158bE
         bcl1tT9EWcZ3XDOaZ3mAsCwMw232H8H0Na1XnMcUzXOZInbHtJcEUDw0V4MjixHTboNT
         vcNBYO5uhtjkqL1r5boO+D9HAqUzqeujZCuFQILNu+wBIhSNcqJdFygiekah2lJ6mugU
         Aqt3iGahoLYWFQe+G858BkyAgWIEU6vKebTEg7gQVfwJKbvTVxoXBBsL1+ku968poh3N
         W1DvJekXrVlFVh1IXTlygtkrLvh/MEFLatHbbUXKjmEqWq96DsjQ8HAD7+VkkmYcq2O1
         LPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015788; x=1794620588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=liq9i1NHSAISsV3yGKXncG3NwcdaWrLis28fjxbXbCA=;
        b=r184ykZLxA1auDyEqambTnr8P9dWDOlOhjl+SzUctd/lw/4JptG16iZBeXyhzEZDqQ
         +F6QzKATexpvL+O/1/pALNsz6PINtqVxCmXXM4SP6MmduxUJN5HBTQLvZTtcB8tcr4f8
         XX/dmdMup39QZ+eUKoaiu/U8ze7tcziAPaAoWgbBdZyLmNZAivR6NVZJvDe/nWrT0ajO
         ERDbGQ4EBCqW3rvThpfs6VGJCpEOvd/VAK3a6yN7c4e4/fMfWRCsBlfi6c7ebmX+Bzkf
         EQU3WiukTQUZjFM1CXU1GXfMd9X5qA2wFrhjiE5VejxXS6Oc4SAClmHsNo3UfVxM41RM
         mulQ==
X-Forwarded-Encrypted: i=1; AL+hErFgZ8RsD6SGY5szPlEpgE15G0nNvg3BY3Zk1Bw4QW+deZZeebz7dmgdNZxM6MZ38IEOXAx4e/e9n346fzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b/2peB/epv7vhH+kaDmDBYND+i9rvGDJbkgcHiVSK8HmxDV1g
	isIFykjD+Z6XaNn1yCIWKhBpSVgjUQ2Jz2ODxAdigppxvUPK+5AO/I6yIrhGxE40cOs=
X-Gm-Gg: AYBFou3klbXJ7iZ6SPoasKwq62t8Q89YzCiepnxugiB/qhkapDyMN5906B24V/2gC+b
	Ayy6N1V8PDJbHomz1NVzcMq9wky8ivo59/zIgYgbApp7d3t6whTYPtC8ysbnhlyJsG4Qkfh2gCm
	V7yqzDEGEM2ipkc1UIpwGKFpAzANKf9BbQBHXf48I3kNn2Vpm11+JhOWRlNngsWUpbbd+12S5F8
	g15SqdbHkNuIzxp4asaEqzb5JlsVxZB/AD5yVMY6gVUiFXOo7HObMrhmQrsuxEaSS+YlLq7qhj5
	sJWTEFGY4NHKuAIyQETXgGG1NYB1OnNIJEjR8lSRrh7kRUjStTmjWtDI648GRZkFZnLGiYc6E7t
	P/3IyoRuEbUFB1ecNs6bqxWaq5GxDLa5DgSvYrIhWHp77PZtL9jBmGORfIqA7W8riofFrkOKM5C
	U0nlw+wvdvRXSlndMD6g4wm2vlVEYr643m1D8oUkLic1bFgIaPoD1FckpqwAa5hiPUFt01Jfkg6
	QNHDjpavlvO6p2//bopU3dXctjDSX/a7arTRfb0VPTalN3gvOCbgedfXUEYJEFzAsUI/YrdGENM
	dq1Ry+CuS8alEqUeYTCjuPWE8dxb0eS/AFUungLqcCwttZTrwDb7mHe07/sk9XQElsLVXh/heai
	OvYHGMnnCOSs0
X-Received: by 2002:a17:90b:48cf:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3b0db6f8c35mr3611174a91.28.1794015788435;
        Fri, 06 Nov 2026 17:43:08 -0800 (PST)
Received: from ChanningdeMacBook-Pro ([240b:253:9800:600:5d6b:2954:53b8:c089])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105817ce1sm1130620a91.9.2026.11.06.17.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:43:07 -0800 (PST)
From: Chengyuan He <channing1ne@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Cc: linux-nvme@lists.infradead.org,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: add NO_NS_DESC_LIST quirk for SSSTC CL1 SSDs
Date: Sat,  7 Nov 2026 10:43:05 +0900
Message-ID: <20261107014305.16442-1-channing1ne@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <au4BIz7NMY0eMWky@kbusch-mbp>
References: <au4BIz7NMY0eMWky@kbusch-mbp>
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

On Fri, Nov 06, 2026 at 09:32:35AM -0700, Keith Busch wrote:
> On Thu, Nov 05, 2026 at 10:45:26PM +0900, Chengyuan He wrote:
> > Signed-off-by: Chengyuan He <channing1ne@gmail.com>
>
> Your sign off email doesn't match the patch's author. Which one should
> be used?

Sorry about that, please use channing1ne@gmail.com. Both addresses
belong to the same Gmail account, which was renamed recently, and
Gmail's SMTP server rewrote the From: header to the old address.

If it's easier for you, I can resend the patch with an in-body From:
line instead.

Thanks,
Chengyuan
