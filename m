Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647345;
	b=s3vi9IqHXHBjP6/cqidTmBjBH5tGnkllqsDyUwreOBcWB5p6+iR57Kb1tc0Tuu1yIOnc
	 nY4Sr1y8sDSM+jlnR1Clc53JpjHX7anoNZAOq8UBkl5wqnwGEVBRsPTCL/wQQQVLAG/l7
	 7eLAhAKeYtaVPgeFKenG7vmkaF5HlWPATMcU0OTrS+siwufx1bpsMUMA/kYjnd+pnDrYd
	 1tPX43ZyI/DjUt4HKt/dHv6Ot+MRq6guKaXktggitI8BTTZL2Vjf8tzYQNb+c7q7Nphth
	 jBjI0yTiElFzFo33x/k0uPxWqtaAnkaf8wz9bQ6PEiKpn8ZSr79bqb+MAzbYdanVAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
	b=WO3GbmsmZhQfW9GApe57MsYfcumGhrw37sSvwdMIp5vKl/qM+DtlHWqh7LTMObGAEr8D
	 d61kWbUFjI3v+uamZb8c5nFcX6GtngH0efxEWpCCHt35E3CEu5y4T0EQNdxfPCSkkfu1q
	 ulW5uIB4hJ65bWPpuQ/R8O6aPduflqQxoSeXyVTkcDjGXLcvCC8Zx+JbMfVY7NP8Co2YH
	 A0jjIX+xHekmCLTmLaJG0yHhHvSV69T/RaNTFm9V0km9v6tazozmwfLqo8bZgiCdF2z4B
	 BA1DEXeHa9pR5r5rvPFenRnX9ZnJRK8qXlTnrq68VeJxP587uUX90z8fizbdl7aOIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i69q62HH;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD61D606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD61D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i69q62HH
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so904411f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647343; x=1795252143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
        b=i69q62HHFhkHKTVK/qXfvHQDtYRrPDkAB+9osvNwwBzwdlTFuJHb3Bvt8HGM+i3EiG
         75rJYcCRNOzqyNzbBY8UmtEz7qDA2ywDPpBaGXfIg8yMVOz91AL4adWgp747OPpbbEmc
         r3EyGC3dnat7RRerjWsYF32siAdNIKujMMFrc1T4bCrEO4JSEonohLjQ/M3Bd+VI5x6H
         1gxZEtjz88AxMz9vst9NY343rGkNB5C/CExJhwovMzngUammcIefIDZufS8sfc9w/igm
         fCTjndUkRmhW0PEv7zdEe24SIEnRqxAC5ri17h14mULBZLLHnjp5PEhNtyygqMHySX5H
         7ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647343; x=1795252143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
        b=SsT6IgjejjV2xfJQmy3DuaTNNlNTQpGb9cJ99T/grf5X8qJllKLonIRMNBZxRzIIuY
         hP+8AZLUlq1MjyVA+e2CYbpGwsnp/VCLdxtwO+WMbXvDwj/ie9BWfp46khg4fy+yUdUw
         gmsq+5la1dogmUCjXTEMuEuy834xzcaQo7RdH9iJ6o+tnvzTm0r/iLdIweXWgS3F+J0x
         rG0o6ED/XiC4db1F8h0evIqDvPJyMxUy6Bba2dcsmcSKTaran4secXdlEJr2F3TIxoff
         Ue+gE2I05C0VTUD+lAS4D3Chd4HYC/R1SHuHgYHeHVChrk73sXY4brZw0zOnf7KlQKGv
         ft4A==
X-Forwarded-Encrypted: i=1; AL+hErHPIjjNupRoitjcb+2T19HF05mIoqoToGp/7TCXVj0/ZRic9AYWBBkLKr3ay1w7WiIIT8bQG2+xT+1Ov4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OvwE3V9QCEKm6jEsbvYPCXyFgNHrbppWUZqWEMjWa2yPJ1Vje
	NPQLbKbH574xY+XT/IGjOQ33+eAfPNTp1pxVFv79FeDG381A79Y4rCWAdODG45sU335Qhg==
X-Gm-Gg: AYBFou3S+VXG+/RNk58jRftCwTCtKNsVgZwJmv09mA/oECyPdCpaqZegPO8zevIf22a
	qb9qEfoXIZTdJMtWyrHGB9HnvEvHxh440dTlBBUnINg3AdafIdBeDXgLSLt/EFbiKgAUzj8/GVR
	LHwAdB9RP/kKagFVlE+MyVtxun23foCcXc7SsAJiwP6+jYnKJtKJG/RLTsVnmACctnY+9UpCR/D
	CwIT91A8SlO1k2SumNRaSohLB1ZvnLJvKWvNZdeeUGPKfKQAyBZqwRpSln8C0LGnoIXC328SoJV
	wnrqf4r9cZCLMqY2coFAcVy+M/BFtRmV9qVvQ+EPCNASh797w8iQG4Kj+qw4hHM0MwdaZtDGnG/
	MnRBAqJ11AcxaAAGeRu7mM4HMXkbYvQS03Zf4QV650huDfjrzVQLiLH3WCs7Vj191t0C6i4uX2x
	4hRkjSs4kYl7/Qx+bOuBhrDqZ/Yg8BmkSBmS3//Ue9qd7Kmaja3uqrDSIO7t6mGVCfkq0Ee6MV5
	tozHe4516SYVg3i1mFVVRimrfVxxWUapE7veUNTW68YMWKsEDNTc9XJx1MVgXXI7jD3t2g3yeI8
	rRiZSgZDLZ/WiJ2VE2D9JoanTcAQ7/I6u7DVHH6Ya5iPjGzJ+SBZq7OIYGT1ChWP0RtZjp799g4
	=
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr106570305e9.28.1794647342762;
        Sat, 14 Nov 2026 01:09:02 -0800 (PST)
Received: from ahmad-HP-ZBook-17-G3 ([37.63.208.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm60877895e9.15.2026.11.14.01.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:09:01 -0800 (PST)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: wireless-hotkey: Drive the HP airplane mode LED
Date: Sat, 14 Nov 2026 12:38:44 +0330
Message-ID: <20261114090844.2573200-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
References: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
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

Hi Hans, Ilpo,

A gentle ping on this patch from October 30. Is there anything you
would like me to change? It has been running on my ZBook 17 G3 since
then, across suspends and a kernel update, without problems.

Thanks,
Ahmad
