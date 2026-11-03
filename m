Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716268;
	b=n0riyPLBi7/66ctpsl+JzmQLLFb8U2gMfJnpjkJM2lDnNe8ujx4aspxFYRqh2BsPldI7
	 n/Z7tK2xa98M9KcZ6om+ijzTjPvg7kGD2Zeuxz7rDkfJwcoE8uUJjxztnA3dXOGbOdgR6
	 uiLjSysvIbiyukZhNskpo+YP/2N2WJbl0b/bBJ07+PMmbPDV7XUF5z+NRBb5E5V5IrEoT
	 3uOY3NSA+mU611Yu6alkw+i4H7GVIH4jxtiTRAbf2cF5foEgi2PaS9G4g/t4HA2g7rTrh
	 CMJwrueHyEJBmCmv0r+SCMcQOQplZcQsXiYrfl4E5UaGBabdkmmXqWZH+tO1OiW/upw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=TDYXubwg/R2YZMIkfVjvc0zCht1CRa4fwx87fBOfgn0=;
	b=XFSYb1OjJl2i3YBuFZ9Ul1x8hFHxeRSqPdP3OtqayvvqMs76UOEy9e4IADDYQpQdaMTt
	 IGPlcH6EsyhjztSzmrmdlPEpFvSV30ll108bDC61tHfxhDJLntNg48xRygNKSS8+Hv29I
	 fwpLWkuIrCtbPxoLS9/UDVkgw2pUtnK7cQPj00EMPEHOctjZjkelIpeOcpezMsIRthhUX
	 cADhBW1enYPHuizlySdBaUTyOlWuL2Oe9f4eFEVcvlscMnIouZayZsNYOgl1t5khjLlDF
	 ggfBYSvgyl9LBBhjswwzS319VjMY329j5J7G1CPREU/3mdLlZ1IZZpIue+OVi/8jlZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uZnFdR+L;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAF606D812
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FAF606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uZnFdR+L
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9b69so3126732c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716267; x=1794321067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDYXubwg/R2YZMIkfVjvc0zCht1CRa4fwx87fBOfgn0=;
        b=uZnFdR+L3OPiUEGDCpAZ63X/Q7vx/nNunWYSlDlH2EK35tSe3/smu88ZJx1AAwhuo5
         Q3CY1EAeDaqHnBoDcUJf+EULvzzko0oZXnKZzrnGGQwHTPuAh+o3bw8khaiYMnrkIv8t
         eMstjo6slcdCOXlnXjN1s6rYEEDvcCJWXrVkoSD/QJYsKUgURH1wYAKmqhkZ/hTIMQQl
         teAmWmffecIYuTso12x4VaZ4o678Rc+KMOm906DK4yLeZdXtJrz+xd6Js1hkpyR/cqFM
         lLT4B9F2fL5tjKpWgo0RSY72MlPKzPHeTh+czDsAr8I05RofyJ13fG9FTr4P1goSvM2i
         ryNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716267; x=1794321067;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDYXubwg/R2YZMIkfVjvc0zCht1CRa4fwx87fBOfgn0=;
        b=PNnMJu/8bwyMiA4sH0BoQ/RRGZ640POUMK9OFZjqkllgN0le7s8zjtHipSjO/Gbjew
         AO7MOtlyw/MuaPtZiOOt9L+3r6LARwL7adTujgHV7uQ2+A2VI7IObmqZQulB7HRS52W3
         y5ADQz3qMZCeER++/GKCAZyQZBK/BNC641snPfLf74I4CcFraPV2+GnHsHBBy1z9qzJX
         mUZknIhPumrzlzHLe61r54yLxKRBSNr4osRTSXIdgwy8Aq0pdT+jFAIu2HjcM/+WyU5Q
         2SabfbrI12WwB5TlP90m49cuXM9BSykSFZl2dHC77PGn5QFK67D3tOYJTMQAh57mVxQq
         6F5g==
X-Forwarded-Encrypted: i=1; AKwUvBy7x28U6v35LYj44jFHxtSTnt1HFu+Z211YM0PbGmGybeww5B+Xmmvihig+zLc6zRtp+zzsG01O1YgwX7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fOpxKjJfHoZP7Wm79M3jTWs7t9m8Pa8Xkak9j3dl+0OMVcxbQ
	7as/o5jTgRvPn6rCGJixoDM27HAgijd99OJdMyWXZNQ02a0pUTRSXHjirNkmrkpTwzg=
X-Gm-Gg: AYBFou3QjAu5yo9NhSdVeu12GbeCKJPcMp95QQMDe9A+gB/SW4oLmib+0rKJekgaY2f
	rsfSiikDy+IfaygHxwho2pla4xxJ7tun6lo6h31BjJU2O6nQ/v29xLrZNytbnsQYdaNRz4aTDMU
	hTpKpVQRw8NplOrUnLGwLnD2Zjcjw/T+AEnQADntRUdOVsmFIaFOrJL1u47kqP2dLBs58s8h/Uj
	hhZWm1aLv/UymI9JDwaOdWVa4VC86Bj8zkcWJdJE7LHRl9cEJ18QIx7efLZVOW8NIM8uFBC+6Zo
	GpqcG3Q+I7uaADW/Vmh64FC6HgtY3NMo2ZkWsGiJij6D1OrAmrOLO1RYjsFezNjAfDF+IZc3SG1
	NpYoVXvVM1ynaU/BDBKtxtMzDwenpDf7/4yXx989rkznNxFZFh7VRqvTPBLp/wGtY1cKVg+aIAl
	QKBhGh62zoCU6a9zDY7nB+OpHD8UXwHQafnedVivowxIVPXeokPdPNJLrPnhizYT23GwM/Ae0GM
	Aj7W9cz/1EzHHe3+f9erHSEaLdg3r6TQc/oLmh1Je6rL+9truCPDc7nt+7kgzok5dbXURs5CS4J
	kz5oQSUAhiPQBTvjlKNQ+mRk9TCu5vdseb0wNFqn+Q6HQXotmalO1liGYSciBYrV3tcawKSks4Y
	6CedU2DfQzO6Llhxtob1wXDcFpBsUpMWClw==
X-Received: by 2002:a05:7022:f908:b0:14c:d84c:7182 with SMTP id a92af1059eb24-1ac5da75597mr17665992c88.22.1793716266905;
        Tue, 03 Nov 2026 06:31:06 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:06 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: arnd@arndb.de, ben.hutchings@codethink.co.uk, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261023153645.37546-1-dennylin0707@gmail.com>
References: <20261023153645.37546-1-dennylin0707@gmail.com>
Subject: Re: [PATCH] block: Return the soft block size for compat BLKBSZGET
Message-Id: <179371626606.3691261.1284483179085449929.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:06 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 23 Oct 2026 15:36:45 +0000, Hungyu Lin wrote:
> BLKBSZGET returns the block device's soft block size, while BLKSSZGET
> returns its logical sector size. The compat BLKBSZGET_32 handler uses
> bdev_logical_block_size(), so it returns the wrong value when these
> sizes differ.
> 
> For example, on an x86_64 kernel a native query of a RAM or loop device
> with 512-byte logical sectors returns the initial soft block size of
> 4096 bytes, but an i386 process gets 512 bytes. This makes 32-bit
> blockdev --getbsz and the BSZ column of --report disagree with native
> queries, even without a preceding BLKBSZSET.
> 
> [...]

Applied, thanks!

[1/1] block: Return the soft block size for compat BLKBSZGET
      commit: 57cd1a08717690e5ea01d7ac7a96bb33a2dca117

Best regards,
-- 
Jens Axboe



