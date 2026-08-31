Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D14361972
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205279; cv=none; b=VSH1U3BCbPSbwKXyV9lgjpNMtMAhbEdA3lVjN8k5VbkRM+wdcR9i2fu6WQsI6J4SK5T7DtmM6wuYg8ovRibeidEG1b20R1k/OFTpFOIzw1joQFN9UGK16QuT09EEQxXdkZl5zm72AC9ZP7gtiKdbyrxvtvbj5nXkALEAJpdsUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205279; c=relaxed/simple;
	bh=3lDcvEcgr4+onaFRlYHaSNZV0ZlWUMowCmDvvcquADU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfzUOouwdzHDnDch5LkVIunozmngHynhSv3HXVWj6xKrPO2/43ObEihjY2rcGXeRqZirlmSFlT4gmFdnGqUi1UAEcSfCN3sNX5YSt6CPzxJ4krc4t/8ZqZt3rVpBHWEOics5jnTRBhONIICaedJaXTcbZpj0XNf4YgRa2VPTh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=E6ffMjkp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="E6ffMjkp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so46236405e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788205275; x=1788810075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhxWwWFcvK+eSFYY3JAtOiS/hfjCxl8syl0ArgsjgOA=;
        b=E6ffMjkpH6EYrTlCIcro7lCi7NOn8PfwtU1YUC0BMqu2TNhlMh54QxqkqdbxnmcPmI
         hPGDwAjd86HgT1vl92nugTsolwob3W1FGDUPiwPEOGm9ow0cHJofXWZEpMfZ3HOq/0Be
         K/0FXbu3E/mgY3oa99qOMmHfXxB6E3VqAf6T9HytTT073mJBmWhxnA3EB/8Mj0Bnwj0u
         XRVcujkym7dBUkLv2ip8hOXQcISMYp83W/BwvNKc0YRiYCoxkh6trldtviOxUKdTfGti
         /ORmVCOHlpm8yay9VaUM4UBdKYmCjAd0M4okU9qVeoYbLVMR9eAewSGrSIAEb11JDIlI
         1oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205275; x=1788810075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhxWwWFcvK+eSFYY3JAtOiS/hfjCxl8syl0ArgsjgOA=;
        b=ifhdfSNXtAQhC5RVOkn1EFdwhgZlEbzO8XXDdvd/6d7udJdiSl9Bx4EO3uQTVGAgLp
         PEoIdKpFg9MBtxFMShB3daRn10v9rXhCoSm711Wp2i+Hdq3Xq4Ed4jmgEP9ltbmorxQB
         sllm4NsL387mfkwebJvuO1+VQ9vvXqMP45e8amlalxFoUZ1uT/8F3k116ob/+wnJKrPi
         zA9KImxb71ZOHDl6VQTf/QkqSEtq1y5FKB5nP4aqzz2y1kmwGFC/PoA/2fHGGN4tHT2W
         3XKkfjM1tT8ogN8/+VHJvjXNLU5/jvcfVflL7uo7tCN3R39KWXaMIsfJYxkcZ4aOOIVx
         CniA==
X-Forwarded-Encrypted: i=1; AHgh+Rr25UmpDiPReS2LCX1BVc/z1zUD1EsLRH43KatGGYcKwzX3drgIlX5K1TDDsKsh91UJkaz1OyJlMre2cx0=@vger.kernel.org
X-Gm-Message-State: AFuF++n4++ziTp+ZLvQr/RWMQ39aJO7cwxF2MI9dVfonbL9f/5DGNOVg
	11mxuiplYBLZbpdArktN4ZH25Z2KK/qLBzB9YhLlrYf+cJlICz0RO0Q=
X-Gm-Gg: AR+sD11UyAgNM/7euM3EetklQ4JdpuS2RYJm15KSjFNd3ZKCoROxMi/G/8oHeHCtTSx
	9ITmCv2+4lwklipxtC7KOLBdErEorRkC4MuwLTbvipgXpdd5BBYeyUmheZkKVt/FmohauPnmIdJ
	uzbOj2FyZo2goLlI1SZaCQ04kwHawKANbOfNrewphIw+q8HJ3c/pq261CpsGOoKG16DlPSbQLO0
	3wfCsqEwg/z3O6SSn8SEiO5UyJ30ZkCr2Bcu1G6CxsfVDobE22XJFwXDtOUcAv1W91k8rYUmgES
	6gyu0NAMzPOE8x//dS0jt0OVYyYrxhxgWntlTrLLa45+UP58I/ATYmDtGkhUoIA/YBsf/jcPd2k
	LdKVS5rN3bKtX/NqJZM+kJjFs3aiiYNhNYQS+puAeKQWtVkVNcWWTWFacK4BHvHDt5XWs7pqmem
	WsKGFtuDdFFR/Wvg2Hgl18a/hoxa3mE8eDMT1S6mbbsbVMELeTUWirnBn+QRX13hDULjsQJr4lI
	ETy7Fp8uVDpAKfuVGUB9Y+UVV1q/NU+572/dTA7jYoMm5B5Fw==
X-Received: by 2002:a05:600c:198b:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49b91c24e71mr452535615e9.7.1788205275377;
        Mon, 31 Aug 2026 12:41:15 -0700 (PDT)
Received: from [192.168.1.3] (p5b057bfe.dip0.t-ipconnect.de. [91.5.123.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52fdbsm232753215e9.0.2026.08.31.12.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:41:15 -0700 (PDT)
Message-ID: <15a79ea7-cac2-483e-8dca-60568fe76502@googlemail.com>
Date: Mon, 31 Aug 2026 21:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.1 00/92] 6.1.187-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.482388899@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260831133359.482388899@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.08.2026 um 15:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.1.187 release.
> There are 92 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
