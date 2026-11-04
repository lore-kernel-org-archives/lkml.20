Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793819661;
	b=YuitBBHIivjkMQTpE1JfEHhWuljBBicCHfCzTfbjomE6wzBwetM4GzoXOXR5Gl9ExxJ5
	 KG+GRLKGPpBYr16rpALHXaow30pK8mAKD4Vv8ySZR2HGZdpPsVsl92SHhwgvLyU/61ghy
	 a1BXumrhtvqm7jhLnD1RzEWVg2rCMkn3Aj7m4a4NpldNJnCEo+9C3RMHKWWQtiiQQzuEe
	 enE5T7pmtfnZFe1ZKAkoCm5K+W5NDVtJPDZmeInZkUM4F4eNz86ci7srb/17H7Tw37eyO
	 aECRFTuYRJUYUSmBvh5BU/L+nInbpxkgU+CdAP5GLPYCmzHRbI2eGGJOexs3CNENpJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ke/7n0XLIEYiHaAKGZFuuKbcPuEg3xzGKtrQJnxCMlA=;
	b=DSCwt2iPD5kQvZ9jrpG8YA+o2rqJkbNtBDuFEpUw8HRr52KOIifiUb2Pnxk713hWme5T
	 HCIxDOK2/H0PkglwwLwRRM3Lx+vAVB96bTymckwOP6Jgh19QizRElQe74vb5i2N6desCp
	 Vv76ek87jNoSkMAAKHXdtFca85MPkVaW4U2+To8ajZSTXnj1hcZ3b6zaWMSCQ56Hj2XHF
	 Qc2djwChbcQ4/uoyHc6x9wWDWD6jBV5z4WaWZgL9itLJwe3Y7me6KKGsSF0ZH0oGBtgU8
	 CViOhjF5qGaNWb4wPsYx/AT1yiNPjlNwL56Ff1yNSmT72h1nzT4N031duYGNi8BH91w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=criticallink.com;
	spf=pass smtp.mailfrom=criticallink.com;
	dkim=pass header.d=criticallink.com header.i=@criticallink.com header.a=rsa-sha256 header.s=google header.b=KyPOF0j4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50881606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50881606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=criticallink.com header.i=@criticallink.com header.a=rsa-sha256 header.s=google header.b=KyPOF0j4
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac9d666d4eso13443207b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793819659; cv=none;
        d=google.com; s=arc-20260327;
        b=HO/oF8vmM42KS+oj/4KExcVcMu6udp6gyBEU2xcr3fGfRl3TYxjz6f5LbByf2iuYqj
         gougmsZjR4T5Q1+MBaUSUI8u3ADDiD3yF9sEneGaoBHGb/XEN9Y9UtLve7SCJSsrv5WB
         v1f6v0aVw0xUGfPXxTABXRLGg7KQ6qAI3dLZVIJ8lexIaM+mIUEaFeXeBoXUsCeL8p+T
         sFz2RWj8+zlfSMHjJXktYj6p7POy/0Dk9UkyczFfnuuQCucWywcF/1GtO+9nKmeeEiep
         8ETcpfTPHRHLrWWguHxrUSq/AZEKvgbv/55ByRfHBHeIE/OiOS6TqNs9B9Xr2M+IHWA3
         TFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ke/7n0XLIEYiHaAKGZFuuKbcPuEg3xzGKtrQJnxCMlA=;
        fh=+DH0hnHuvqmxsF1YM9Y8Ao7HfKNrBw2/Nqfp3faKOso=;
        b=X56QjCWtI4K6PnNMBtyreXSiWSZ6ogws27MKIKdYY8WFSEFlBoQhAyAicKI2VXfp81
         hLDSJhtftoZi5vLw248PgohqrauL14b5NWuNKtPE4yBvVT4BaDiVU8kIkSbY/xz38qUc
         LGJQcsU7wBI4HEzYOwtut5csMVEGLUeZxv6fX9klX/GwzgJIaHU3xhHziQI/1vyACL6w
         kHkY20nHy5BuawI6vnJ1LBQ86va98O2yj14jkITSkWeu//UFkaTRLnsocfzi38+MRfBP
         WybDTPCMNYq6Oeg+43Zd+1OXesfJ3ORmekAriVdDTGwkcaNtzm6s9aMGNReEDOPy2RPK
         EUBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1793819659; x=1794424459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ke/7n0XLIEYiHaAKGZFuuKbcPuEg3xzGKtrQJnxCMlA=;
        b=KyPOF0j4HfonU6LaDyDbWBtub+I/n+ff+iKTumhe8EbWz6taew+Mhbaa17Irr8zjLL
         jSimCbaDOGMrERtDuQScolSF7LlR1K4VgWajwNRMI85kqBL4+xXxjOrBScEkCl46ZMGL
         ++pc7MrSy3xIss3WdW1LIqleuASAVnMD84pvPhyFsSVexneQR++peFoqpvRVXZpI8mvY
         e5p0gS/4DRC4jHoD7sQcgkvjOby9V80BOFg6o4gbSWQ3pZBxHpyFoRUJuIuKTJVUcUHW
         ow+RfnMEYF8yKe2mwkFLk7Xm8LBZclX/JhJwwq8rx4VgYgst2+4X178kgh0A1hVSVfE/
         0ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819659; x=1794424459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke/7n0XLIEYiHaAKGZFuuKbcPuEg3xzGKtrQJnxCMlA=;
        b=px9mpkcnjCH3IJUl2mv+c9UhG5QMrwS4IUKSxEp1kGGZtg7A9gyJrDpd+5Y84jUbtf
         Oh3XIWBMxxekEI9eUdkV3QNvnivlpaMUydSdppPD/LGzxdhe4J2CUeNTC6KKaUu+RawU
         NjL/afVvEc+zH/z7AzFeutoSMabQ3KTV+jEOGca3MB8B/iNS02AF9nO5iHo+efIKxGd+
         w2D1/8ss4BURknk3prt/73VHt/TaAtwCh33TjLB3xW3s+istlRwBgWyTv25llaN97S3Q
         6CvM7D26qKYVB1vcgkOej6lZ+WrktgZ54eZ775N8Y86ie/rZQDZXpMLai9NtLmfLsfap
         LPVQ==
X-Forwarded-Encrypted: i=1; AKwUvByQn8EAYKy4yQa5oyfPEAgr010mqvFt1oge45+IJa6cBZHh4f96sOB8/Yn2W6cKIN/pTd65pFKJksCyvqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z89xpV5pHWq0KW64XnqMoE+L11uVTM51tohA2yCJ8pENDPDpHpE
	ji+aR5/TAbtqnCUhod3pd2BgtFvTiJ3NfLtqBRqNN34dcFiS7ZcGIr/Y88K/bMzojGC0IoBEdKC
	8tRZ+fxo17MYfiAZep+cVsX5tsW5oWDlziwtrK1bO
X-Gm-Gg: AYBFou1KyS5YeF6liG5qrCIC15YeQyvRNBB0H6dd19HBZ+gZCacN0wHrv1IMDl4N9a6
	CwnQveFotuPNCdyuG28nhuMGOcoj2qjkcgjU2VIAn6vHVdVzyBk6D5UatHd1xwhPUW/ooZL+dNt
	zc6821S2Zzg1Xq+FBLpY3lPauI/lQpBPyxTUTN8HaYck378XHEfHOjG+Gly8sWQCRlombY9UUz0
	lukrobsyRaT/d5SbzlnXrejX4TH1wjAw9s5sKsJUn8i4xMBoXdCOWNTLNQpXInvOyHSlgHqM6Gn
	1NUEltJ1uFQPTReMm6QpWNeY86jbWvQqwG1EgwZ1gS7j9KBmk/oUC/LbKAKldU0VdMdC/WcRpqF
	yI5ANC6bqKpAyUA3nDixllU8wPTnmAGlZ/x4=
X-Received: by 2002:a05:690c:6604:b0:8b0:e680:615f with SMTP id
 00721157ae682-8b2b65aebecmr111771367b3.9.1793819659192; Wed, 04 Nov 2026
 11:14:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250901101525.1090334-1-a-dutta@ti.com> <20260603191259.3723777-1-jcormier@criticallink.com>
In-Reply-To: <20260603191259.3723777-1-jcormier@criticallink.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 4 Nov 2026 14:14:06 -0500
X-Gm-Features: AclHuK9TU28yjjkJtRYMVXwCpIjDK5UJp8IOoxReP5fQzz76P4ZZMUxg_o-GJ44
Message-ID: <CADL8D3bBHupbuEFCMOFnFMEh7h-wDs9Eu4LqQDSQpzWO3TnjgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] AM57 timer fixes
To: Anurag Dutta <a-dutta@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, vigneshr@ti.com, 
	sinthu.raja@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 3:13=E2=80=AFPM Jonathan Cormier
<jcormier@criticallink.com> wrote:
>
> Tested this series on a Critical Link MitySOM-AM57x board (AM572x /
> DRA752-GP, 20 MHz SYS_CLK1).  With counter_32k disabled and DMTimer 12
> registered as the system clocksource via these patches, system clock
> drift dropped from +553 ppm (counter_32k 32,787Hz instead of 32,768Hz)
> to +2 ppm over a 50.8 h measurement window
>
>   /sys/devices/system/clocksource/clocksource0/available_clocksource:
>   dmtimer
>
> Note: to make the fix apply to non-beagle-x15 DRA7/AM57 boards, I moved
> the &timer12_target and &counter32k overrides from am57xx-beagle-x15.dts
> into dra7.dtsi.  Worth considering for v3 so other boards (MitySOM,
> am57xx-idk, AM572x-EVM, etc.) pick up the fix automatically rather than
> each needing the same per-board override.
>
> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
Conflict, dmtimer12 is used by the secure software on the secure boot
processors...
>
> Thanks,
> Jonathan



--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
