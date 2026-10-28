Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221755;
	b=W7k2X17T1YNrH7EaY+bK9wbJS18Rwtvrb53wbNVfB7AphjuBPRbZpgCsWMIqE1Gi2CY+
	 YK9wNxDj2GKLNapXNA7w1z8J7yn4Qq8jvYuRiHhQHGcdcg1BK3BS2xYsBLloHiPOq4uMD
	 QooYI0fZLyVQOE7afAFK38007woIFV9fI4aggGf6pSexdF/lwJ6Hc+HnVVYQwRDLTe5Bg
	 2YXSadRjb0R7R7/oNws1cD1Mw5LsLn3Zps1d/+/QGq46hAI/7CBWp84/1rTepYPl0ZFEA
	 fSSVqJboO4OhMRrYalDnwELAiFR8JaH/7WVO/d/QNnQEajZ75qfB5iTIGBLMzgS2YEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=b9Ue7Amy9dAWOngMe9Pw0Kk0KAocM2Q9voQibH/OirU=;
	b=XmA+ybCu7J276unUmNYDIMqxgZeeXcXvLZT9Kor3AkPdD+7VJRR1j4KPr2JXruylXtul
	 Zxiv5UcLDaC+AsR0HgbJ/DvDON+vDnuK1RnJ8vT7cgoVMC5oy3smvR8QDtnuTknAxTCax
	 RCTUDvfVvbDEeHwjYaQBT+zr7zB4Y4skbax+I91bZPr45PEqoJynSThtHGpUFWV1AwxDA
	 RjVxtqG9LPjcPO3CkJ4VVONjje1Tl3aIhrHLrQ87ZXyK9BTB9wxRRPDqsjtEQr9zOTUmU
	 iorLB/eGspP4UZ6XU8B5rm07hjEX13vffgJ7tmvivYEmNI6pp+Sl4B3iO0ag4VjGhfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYpPdQMK;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85121606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85121606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYpPdQMK
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11210695e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221753; x=1793826553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b9Ue7Amy9dAWOngMe9Pw0Kk0KAocM2Q9voQibH/OirU=;
        b=lYpPdQMKb567K7Gcw8lAVZu0HbfmVC9X/z1iRKMq1P1CbFM1/B9/PYj70+JtzadMVC
         7yKjRdneV3HesBPbPtayTidUfKDRj8zK/78nrBfD3dKsaMZjIT/1DQSpIWw7S/w1MQD5
         VdhxflrOnAtV+3nZybKuumlrxFIQWiXyFzXNmLfgd9QLtlpnlnvTQrfDzAORBh4UCQ6c
         I/QrPcCBFIoPijM5QjZlw72+qdNiLjjg1ZsJiJmRne+Gy3orRQFo5gdRr2JC3NatTnyG
         f376m6J2Cq9qIGSEmgBkmM9RzAva2Uv+2O4yO3s1ord3aGepQOBRO1jtCUVSEYqrZMJN
         AqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221753; x=1793826553;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9Ue7Amy9dAWOngMe9Pw0Kk0KAocM2Q9voQibH/OirU=;
        b=b4h5X30KZbwE9Yu5bFU9ubi+NIkDVUCCRm13mzjVllcw6KBQel0aYxKPDm6ND9Zz96
         ZEgehtKcoTsfWT2ug8r+0FcZgyCYu2EpgW9syMeZ10Gd9h2MAxhTvZYSoUXRlYp0FwJp
         a7PZdcu6pg+/sLuILc/nEqHNqNvtXHaIbg8qXB7M5omlaImlQwbBPioZQp2xY2gggrr5
         S9V4LMqNqlTVFJ2xkvez4b2aCj/JXXNInnULyDwPCCNp4s/cjXSCoUzRRHAfe5k500EL
         a7aPMNfPx/g/1ISJT4avw86+BvYUxAlGuAnOJdFmeABVqx0nT9PcfAAyL9D0QNw5s9uf
         tR+A==
X-Forwarded-Encrypted: i=1; AKwUvBybdK3DbcR1VE2sIadQzNSgXn7P394JivD4TtDTwt0hBjZ5TpAb4/IUM2W1OcCxXa4GG23QTGUtJ0/5AdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIo9fg8B+eyui3W0IpX0cFvITN8s6SiSGubB8F8vX4I35uzh6a
	4oJ6lz2O/UDw/pL7aWlZz9UKuwkZyQUjvxcpB+DfctU3axBMlJl9bXBdEKNBJezv
X-Gm-Gg: AYBFou17guTiFxfVREl7QiDgX3qlc6lb7EIarOv+p/uNxyG/vN98x1L/W/oCbERvRTx
	A4oYQ0tf21Pe1CHAoRzRteawuO5rhWrdp5cNsmBt2L1giZARHUPKX0c39w3BtVZueXzjVWy6T8c
	MVG+6imFi/cp6SKWyh+fEITWomJq0m82xPi/VDZvvsiRJxeIEWKKggAIk7wkndtlKmoCPQZTP+a
	6A4eN+ED1X+7/AAKioY7QWj1SBp3cpePdgzC878oaFPrfUdoxm3yCqI4/wWJVHsobbv0HDCNXIt
	Qp1Mhu2M2rcd3Coqfgu2HgKiHtgOwmaqjpDGTw3VnnKxNVDiLjCG3uKDYu6rP9yIUBQoykmbKa/
	ap3TAaJzVDpWGuUAnHxM8iuoQzJRh4Z4j3XW60jXuahgiOzvnrd7T7/myt8INtJGRV54Jc7dExq
	uHgk4qf+sZfSfsrbg0CfaF+MagI7Km3CTQb/wUTzm1KPWV8gimewekFSsdUBMWTvIsAQzkmmN/1
	O+QHx+l5Fk6PHW0YCzJuQNC6HMWC9+ibuL1JSGg3iV3AJ4mOx5Ux4G8VS8e/qukeVaVB+AQi4rY
	pblKqmXvJ7CHj20wItZp9MWY23LekZDFg5Mbdu6C2T42wh4E45BJrMPNKpyBre2hxg==
X-Received: by 2002:a05:600c:524c:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a9661ab662mr83304295e9.9.1793221752843;
        Wed, 28 Oct 2026 14:09:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm20027845e9.9.2026.10.28.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:09:12 -0700 (PDT)
Date: Wed, 28 Oct 2026 21:09:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: wen.yang@linux.dev
Cc: Joel Granados <joel.granados@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/39] sysctl: replace overloaded extra pointers
 with typed bounds and context
Message-ID: <20261028210911.30a8100d@pumpkin>
In-Reply-To: <fec089bb7a3ea62a5e2006cf578b1efec2df4aff.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
	<fec089bb7a3ea62a5e2006cf578b1efec2df4aff.1793204511.git.wen.yang@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 00:34:40 +0800
wen.yang@linux.dev wrote:

> To: Joel Granados <joel.granados@kernel.org>
> Cc: Wen Yang <wen.yang@linux.dev>,  linux-fsdevel@vger.kernel.org,  linux-kernel@vger.kernel.org
> Subject: [RFC PATCH 01/39] sysctl: replace overloaded extra pointers with typed bounds and context
> Date: Thu, 29 Oct 2026 00:34:40 +0800
> 
> From: Wen Yang <wen.yang@linux.dev>
> 
> struct ctl_table has two untyped misc pointers, extra1 and extra2, whose
> meaning depends on the handler that reads them. In-tree use has grown to
> cover at least seven unrelated jobs: a fixed bound, a bound read through a
> pointer on every call, an object or namespace pointer, a small integer
> cookie encoded into the pointer, a lock signal, NULL standing for "no
> bound", and a value the core itself casts to unsigned int while validating
> a u8 range. Nothing in the entry says which job applies, so readers and
> writers have to infer it from the handler, and the core itself gets it
> wrong where it treats extra1 as an unsigned int.
> 
> The overloading is also a memory-safety hazard. An entry that stores
> handler context in data cannot be handed to a standard handler without
> first restoring the real storage, because proc_dointvec() writes through
> data. Every call site has to remember the restore, and one that forgets
> turns a user-supplied integer into a write over a kernel pointer. nf_log
> reaches the same problem from the other side: it replaces data with a
> local buffer inside a single handler, so data means two things within one
> function.
> 
> Replace both jobs with two fields that cannot be confused:
> 
>   - min/max hold numeric bounds by value. Signed handlers read them as
>     signed longs; an absent endpoint is the type limit, not NULL, so zero
>     stays a real bound. A range that changes at run time is refreshed
>     before every call instead of being snapshotted at registration.
> 
>   - priv holds handler context. The core never reads it, standard handlers
>     never touch it, and registration rejects it on a standard handler so
>     context cannot be silently ignored. data and maxlen keep the meaning
>     their handler gives them, including proc_dostring() name lengths and
>     proc_do_large_bitmap() bit counts.
> 
> The range converters read min/max whenever extra1 and extra2 are both
> clear, and keep reading the pointers while they are set. That lets callers
> migrate one subsystem at a time without renaming handlers or adding a
> parallel API: the existing proc_*_minmax entry points keep their names and
> gain numeric semantics as entries drop their extras. Entries that already
> relied on NULL meaning "no bound" now state their type limits explicitly,
> so their behaviour does not change and the meaning of zero stays
> unambiguous.
> 
> This patch is the refactor itself. The next patch converts the debug test
> module to numeric bounds as the first user, and the KUnit suite after it
> makes the contract executable; everything after those is migration of
> existing users and adds no new semantics: fixed bounds become numeric
> values, run-time bounds are refreshed per call, context moves off data, and
> the extra pointers and the compatibility read are removed once the last
> user is gone. Owners that can still be recovered from data keep using
> container_of(); priv is only for entries where no derivation exists.
> 
> Replacing the two pointers with unsigned long min/max follows Eric
> Biederman's suggestion; priv is added here because the same pair of fields
> also carries handler context, which a numeric bound cannot express.
> 
> Suggested-by: Eric W. Biederman <ebiederm@xmission.com>
> Suggested-by: Joel Granados <joel.granados@kernel.org>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
...
> 
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index b5c2abd12432..294897f3fbb5 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -10,6 +10,7 @@
>  #define pr_fmt(fmt) "mobility: " fmt
>  
>  #include <linux/cpu.h>
> +#include <linux/limits.h>
>  #include <linux/kernel.h>
>  #include <linux/kobject.h>
>  #include <linux/nmi.h>
> @@ -61,6 +62,8 @@ static const struct ctl_table nmi_wd_lpm_factor_ctl_table[] = {
>  		.maxlen		= sizeof(int),
>  		.mode		= 0644,
>  		.proc_handler	= proc_douintvec_minmax,
> +		.min		= 0,
> +		.max		= UINT_MAX,
>  	},

You could save a lot of churn by not adding the '.min = 0' line
and making the function treat the 'silly' case where both min and max
are zero as meaning 'no upper bound'.

As well as saving a lot of diffs, it will be less error prone.

David
