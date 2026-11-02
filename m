Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612742;
	b=nUPVwzXsFQjxtlB8EFD10+36fA1NrKF4AJOoI0ogpikVm9vWJ2+t9e1jylmLw33s+2KH
	 nlZL/s/oUpg7d15N5PnxkqCjfJOXobVAcbegD0P+Lj7GNa3Od5C/K2NXl2KtHj5muG0Tf
	 0YMs9LmdNuoIrEqc6hDpwPMYVs9kng2HMO1O7yXt1eozVBsj9VKO8yG+70gLtjBQXudZZ
	 NZj8qlDHU07HH0BrP22lBLs1QdkUhfpNDGGoSuoU2Q4lgFLpKtofT6hMbpEIw0ZC3FIa/
	 4npBExK2JD0PUNRc/oyqM8Y/cdhZKS+snm+NZGx027tDdQ+1S7VFWGWdrKfX60YveDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
	b=IXbbAjHRwzfPW4ZAQZuWcL4XUTTLFXZS39B5aC0imj95LpseDj7VwLGbUDgO86YAl1yV
	 bMTno/7ciEyhccN4NvyYEp8tfqsJZX0uoGD4xYGGiE9rwGV47a4pgzF1L9FVX5w1ceLqx
	 E9WBoQZTZWzFDwAsW7irOrCD64OEnk2szoodc/K8WkOnwiLRTQn4QOtJzJNTqL69MXzh/
	 cXdqamlvL2SbAAYova7RZUjdteztVovmdjkZg3LBuEQwBXgNYPKwKYTpn6ukty2IeGt8M
	 Uf65vGZZgUNlZNPn0iv1UZeYfm1pQFPa+0nlWvyV3tgwzWUEZNpfBpEumW2nmCq7L6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OI6TnrpY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C55606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C55606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OI6TnrpY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso459005966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612740; x=1794217540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=OI6TnrpYqG7qyy3J6+90wx0M38+qvWLpSIbBI86J0zBkW1gHrtNRBmlHQWdm4Afr2R
         YKCtGbkurXgX5p7REF07zQXuFAzBbii619u7sNSUEeR2kluxciptjnG2LX3D0NiA1cxW
         uhY6RrhoEblu24TVFKnAnGZUVhsHvrEp3SLzrMjBAzjzt3UDZauR5hrLyeGrS+VNQObN
         fz82jhA3hV7cNvfYy4Z7D4OXkOkvppgiuR/rXENPSSR4sOQvfwTgwtbp3qZSvELJz5fo
         AI1QRiyz2Adi7n156pOReiQ5Kye/gnkY1YNl0ZhMOR/dMaFWjiC80MbFpN0ncFDEQbRM
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612740; x=1794217540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=Jpi9tzXROpUoDyN+Gq86JbDuKKzbIkwTdvWjOlNFFFYxBQgcxsy32Hs7E+CgXEs7B0
         zRl50B5kL7TbmtiJGrjSUNlnMPg+0VmZKrNXj/quT1aMuV2rC2e79DEequQ/qNAjCkFB
         o6dx+Dv2EDlViHj6ZdFGUcWgAigrin/N3SHSNAsNS1n9TpBQGWT6FKrZJ0ChodqPdSSD
         pgSExWbMs04FM+Xy9JYhfGLyhbgODfY0FOdcs6KiN1A8eOylGcGjtWclnyMNwJpt2M59
         3nwE25I9LhCl52P3NtaAMKeEprvhd66X+0a9hd7aPls3M6zoivtw5qq9G0yGuOUkqcJc
         Gf4w==
X-Forwarded-Encrypted: i=1; AKwUvBxU8YgI2BE82xBjM19llz9GilaczWaV2GDFVVNOLq0QuuzklYN1XQrI/Yedw/kbJNAHxiMTPaypwf2w+Ck=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu5Pd7VCNOn/LvWdlTTuXZ6UfN+tN6aiPV3cMmTSv+KBMTICBC
	as1AMbPSIJYIPUL5HRVEASLaOW+h46edDjM0U9FNZHGtNZbKo2NuWP5u
X-Gm-Gg: AYBFou0rlJT+99B2TvHGUWlquTu3781UIHAkzSdu2/6ycPXATXK9WC6Y9YKoFrV4av6
	aQd9GmFv95S/biA1RyGxQgREbWMUfgjQWsQoNG8QS0c7HD8rntGUMnliQa2jopn8fxNPfQOBzVd
	j8XNgX6TPQybScMSn+0nJxF5lVzLH8QP9B1CG8Frf6G563N6mEClB5cwK7rj19kPgGdXJoKSnO4
	1UfiCDsyI3VnsGpHgg7hh02hU7LPKKLVS0euvhMi7q9BcFD1MqGwyFtvt1WqpZCcQfVVA+kGyQl
	N2wNtN9jtamPK7b3zDLg+FpBDb8YsM4YjPQVJIwIPa1DPyekhkgpzxz/vz1Qnap29bZwhXS7X8/
	kNdnfmf1g9PUkUU7nznw3ci6Pu2CN3RReJrC/tqnrbRPjG5OU2bKjXoZTvqboXuCsEjK1xU/QZq
	kjF0DbVkHgYhX2tGhE3qWRZqbhUvbAJEaZwrE1m8rNrIFJnfbaXv5FYvQu1cfHvm1X4IG3oSklJ
	UC6U+MV7Pa5LgV7u5anxhNcCKOQbjoWRE2GTiRWMMXpC5vsBp6A38E8aWml60/an+zxH4bKn63o
	NLcCDpzq7gFcHMko6KCNzJC0xii8ad1ev5PKWqa5gUk+xjwLAAbnUSBhCgSCfdr+F7IU5h1N+eX
	9vQJpWKpgGObPku6aS9ryV6WahKs+caBwLvjHqGQ980gk
X-Received: by 2002:a17:907:6e93:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c4ca7aac4e2mr783350066b.31.1793612740250;
        Mon, 02 Nov 2026 01:45:40 -0800 (PST)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm369796766b.4.2026.11.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:45:39 -0800 (PST)
Message-ID: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 10:45:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Jacob Procee <sn125164@gmail.com>
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Language: en-US
In-Reply-To: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 08:35, Jacob Procee wrote:
> Thanks for the ack and the extra background info. I would love to take a
> look at a race-free version of admac_cyclic_read_residue() as a separate
> follow-up patch; v2 of this fix follows shortly.
Hello Martin,

I looked into this using REG_DESC_RING. It only contains descriptors
that the hardware hasn't fetched yet, and its read slot is effectively
the hardware's fetch pointer.

Unfortunately, it isn't updated atomically with the residue reload
either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
DESC_RING still showed the old state even though the residue had already
reloaded. In another case, DESC_RING had advanced while the residue was
still 0 and no report had been posted. So I don't see a way to get a
consistent, retry-free read from these registers.

One could make the retry check more comprehensive by using three
counters: outstanding = queued + playing + reported, with playing being
1 unless the residue is 0. This would also catch the reverse ordering,
where the report is posted after the descriptor is loaded, which the v2
check doesn't cover.

However, I left the debug module running overnight (10.65 h, with music
playing through the speakers), and never observed that reverse ordering.
There were no XRuns or backward steps. The speaker channel had 96.6 M
reads and 15,483 boundary hits; the second channel had 29.3 M reads and
86 hits.

All 1,498 snapshots that failed the three-counter check were explained
by read skew: 822 where DESC_RING was read before the fetch while the
residue was already full, and 676 where it was read after the fetch
while the residue was still 0. The positions returned to ALSA never
stepped backwards.

Given that the more complicated check would only handle a case I haven't
observed, I'd prefer to stick with the simpler v2 retry.

Unless you know something about the hardware ordering that these traces
wouldn't show, I'd prefer to stick with the simpler v2 retry.

Kind regards,
Jacob
