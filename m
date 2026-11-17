Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906039;
	b=gm3gKgco0IFbjeJ9RKpemVQqtU3o9jN8ltvqiw07ySCuV94zkvcPISa69N1JA1XX98tR
	 MLh9TFYgMuaPdsgcZGSbXESH/jR7NlEQJH3l1s71itYGv1pz9ihVP5fPGsN6XptF3wDN1
	 AH79/r4TPxheV+zXTYfNWS5h8gS9FmNZq6T7T2CRygNN5SRdPOxMy4TiDNSFcfiMI9E6N
	 Alp0c1vUFmmnDhw+hMuUgQcK7ScEN5HgTzmVGG/LGD45UONiMjc2HTUgsiqW1dw9PqaXv
	 Z28C/ct6Ww+tb3+FEgf7FUAzuaaJxAdOxkgmHLjfgWXIV9e8gRwXSIeziSHfmyTFbxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5u5bJSzXugShbfEp5UR1gFg7szWoYhbTfjqpcPqVFWA=;
	b=vqUXsL6WhlirvYKwRugpC8x1iYWM+Zo+b9r1DLgpAPSLzAPdUPo3mylZuXQmIIesjFxI
	 vNxuib2H859wOi6QsptTqMpr2oK7UIE7Jkei8HyeFl5xwrxgpNNsRSBd13opPavZo/q0g
	 9Q6tcFxaOErja1lmuBJNJBp3QJbi9NhaRXPYiZjeMWo0Ar+CJQt9MNmNHFlvzI/GEnug1
	 qpTNVwGYeuUaluy7IMZpaFa8YpvaKqHzPQhn4YXzrRtGj9fQu4Rh1VLfW6ms/HD3vqku9
	 dt8I7Cg26MO35QTHyYEXYdhzifY8LHf2eX64INH7uVEgYiPmTZGzoBBl4wijuNDqXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAn7hM23;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB486606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB486606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAn7hM23
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso36590345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906034; x=1795510834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5u5bJSzXugShbfEp5UR1gFg7szWoYhbTfjqpcPqVFWA=;
        b=QAn7hM23baxfPhsDQ0jl0gZPWe5fEMGa6ZBQjqmz88PU18LSSpYy2ZYYf4UU4Kxw3U
         MJjdsLi68eBdm1OAxC5msfHNhlR+npmI5j5yrmtuPKbbVKJ8qsK7GfbJOiiuylMxOKMh
         3+g3VPyoIhWaZ4C9QXK4L67uKqIa1sDq+chZ42oomLTUL19MKjCDEqlAmwUN/Zc5Jl43
         J4nD3GrPUoEPzmifvNax4rIbSS7BEde0F4gdNc8mIxaMj3AUMsgoxcIji4eAXQdu6dSM
         edoOZwX13+K+D7PZ74LpqLtCXQYdeRwTjkQddJrQ8R+ns+fmAxPSRmZgTS4L3Oj2U1Z5
         w04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906034; x=1795510834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u5bJSzXugShbfEp5UR1gFg7szWoYhbTfjqpcPqVFWA=;
        b=ah0AGGcuJ05sHXf54X2QlkS4G94gqxGgh6jeg5LD4oTExsXdWmFmDGq8m2R6/et0FG
         cxneeA3F7uDMHlhZ6S/Bj5YVjjbA6mqRbYgUnTjw9/A7ANhBDk6jwOmP+CK43kTSrb0N
         WPSe5RlgbX/XBbzY6EbW8elMxOAxQRRjof9vKNM1VcR6EZUfc+XnlKmAqyp5eB/RrNy5
         +gzu6uDqMDSWubMcVRuqjlaBexJR0Gu2v+Z7qKoF8cp7Q65jq5PWbSrwsnWJKmPEnJN7
         qigg0po3hRgSf5P5frG2bu2M80qXN3nB0p1C559lHV5evncRgrcQCcA8kiNRPpXTvUL9
         IEqw==
X-Forwarded-Encrypted: i=1; AL+hErEiD/D7kpPXAweidVqNWVpPn1Rq3Qxv+Kqgm5SI/VJigy2qsrmyktmlQwKcobN9pXcrSq3s6HeusYw39z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mtFtvt+KVLUDuRU3L1WpBhhT4Me6gLKawJdbLrGHdwFgz4rlh
	Ko/DW3H6grbHh2KR/2zkl7+NkuoW/xGkry2cJChRhofm6JETKhVkf/fw
X-Gm-Gg: AYBFou3EA0Q0Il4cggRMvOBHV8EDYZ8iVmTBc1IL/i/wtAy01ZEemj5aeOGox6dTlWS
	KQ3zF4FUdQjvB+U8cVs/hgybUGv7sQvvg7qHQvJJ48BpATSDzjfmLX0aXp0BpUhN0l2BHOjPAEH
	eBn9tww2n74EGk/q7d0Bjg1OACBPc30vBaFZoZRIJ4bmwzIS9/YKRCui5bNRi43Q656o5RY866x
	kIKqePMBrZ3VRKY02zSzULIuNe4a2h2GNGH16AS1gR6BK8cPVlY70KTgBwV5/e5/4AhzsBH/+re
	8iqbzbTyN1nVlOnxOZItA0oX6w89b/8uU+240x7AQgvagUJwwXFZziudGAQD9zoKBxBqr7hdyGE
	nWXA3QeEj9FFHg+ddpvCxf8PmZtPd88Opa3waHaCCSY0DrVxJuDr5tWMG3RQXAUCtJniznk0DDL
	1QwHWlJ5p0oK2tNcm//VVbYL/i8z4IjkTGuMaM9FaEXZPFGEykEYD0PKeKQc6flWrXxw8E/UdKg
	J2NgkLbCJ2uAfcXUQBKPqPaOkeZZvZxvvQJ3pJhhONDzHb9OQd/8tIqVCHvrwi4Gw9okwY9Ipkg
	2Y38aCnzyy9is6f3YwRwkJq1rb9Y3b/CPdXiH2FednbJrXg7dX+1J+Fsu2xSHN6hIw==
X-Received: by 2002:a05:600c:3b93:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb6f67caf0mr164847925e9.29.1794906033976;
        Tue, 17 Nov 2026 01:00:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm46768355e9.2.2026.11.17.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:00:33 -0800 (PST)
Date: Tue, 17 Nov 2026 09:00:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Shreesh Adiga <16567adigashreesh@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme
 implementation
Message-ID: <20261117090032.0abf7198@pumpkin>
In-Reply-To: <20261114172955.1598929-1-16567adigashreesh@gmail.com>
References: <20261114172955.1598929-1-16567adigashreesh@gmail.com>
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

On Sat, 14 Nov 2026 22:59:51 +0530
Shreesh Adiga <16567adigashreesh@gmail.com> wrote:

> Add a 4x-folding implementation for CPUs with FEAT_SHA3 which benefits
> newer ARMv9 CPUs like Cortex-X925.
> Usage of EOR3 from SHA3 extension improves performance by 20% compared
> to the regular PMULL without EOR3 on Cortex-X925 measure in userspace
> application via libbenchmark for 512 byte input size.
> Measured about 3x speedup for 512 byte input compared with the existing
> NEON single fold implementation on Cortex-X925 in userspace.
> 
> Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> ---
> Changes in v2:
>   Improved the 4x to 1x reduction by using x^255 and x^319 x2 reduction.
>   Added static keys for the CPU feature checks instead of regular
>   branches.
> 
>  lib/crc/arm64/crc64.h | 24 +++++++++++--
>  lib/crc/crc64-neon.c  | 83 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
> index c7a69e1f3d8f..e5be0ef21140 100644
> --- a/lib/crc/arm64/crc64.h
> +++ b/lib/crc/arm64/crc64.h
> @@ -9,20 +9,38 @@
>  #include <linux/sizes.h>
>  
>  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
> +
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_eor3);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>  
>  #define crc64_be_arch crc64_be_generic
>  
>  static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
>  {
> -	if (len >= 128 && cpu_have_named_feature(PMULL) &&
> +	if (len >= 128 && static_branch_likely(&have_pmull) &&

Would it be better to swap the order of the checks?
Otherwise I think you get the 'len >= 128' conditional branch
even when the static branch is false.

David

>  	    likely(may_use_simd())) {
>  		size_t chunk = len & ~15;
>  
> -		scoped_ksimd()
> -			crc = crc64_nvme_neon(crc, p, chunk);
> +		scoped_ksimd() {
> +			if (static_branch_likely(&have_eor3))
> +				crc = crc64_nvme_neon_pmull_eor3(crc, p, chunk);
> +			else
> +				crc = crc64_nvme_neon(crc, p, chunk);
> +		}
>  
>  		p += chunk;
>  		len &= 15;
>  	}
>  	return crc64_nvme_generic(crc, p, len);
>  }
> +
> +#define crc64_mod_init_arch crc64_mod_init_arch
> +static void crc64_mod_init_arch(void)
> +{
> +	if (cpu_have_named_feature(PMULL)) {
> +		static_branch_enable(&have_pmull);
> +		if (cpu_have_named_feature(SHA3))
> +			static_branch_enable(&have_eor3);
> +	}
> +}
> diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
> index 4753fb94a4be..767e55edc0e0 100644
> --- a/lib/crc/crc64-neon.c
> +++ b/lib/crc/crc64-neon.c
> @@ -10,6 +10,17 @@
>  
>  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
>  
> +#ifdef CONFIG_ARM64
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
> +
> +/* x^575 mod G, x^511 mod G */
> +static const u64 fold_consts_4x_val[2] = { 0x0c32cdb31e18a84aULL,
> +					   0x62242240ace5045aULL };
> +/* x^319 mod G, x^255 mod G */
> +static const u64 fold_consts_2x_val[2] = { 0xb0bc2e589204f500ULL,
> +					   0xe1e0bb9d45d7a44cULL };
> +#endif
> +
>  /* x^191 mod G, x^127 mod G */
>  static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
>  					0x21e9761e252621acULL };
> @@ -45,3 +56,75 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
>  
>  	return vgetq_lane_u64(v0, 1);
>  }
> +
> +#ifdef CONFIG_ARM64
> +#define SHA3_TARGET __attribute__((target("arch=armv8.2-a+crypto+sha3")))
> +
> +SHA3_TARGET
> +static inline uint64x2_t fold_single_round(uint64x2_t fold,
> +					   uint64x2_t temp,
> +					   uint64x2_t consts)
> +{
> +	uint64x2_t temp1 = pmull64(consts, fold);
> +	uint64x2_t temp2 = pmull64_high(consts, fold);
> +
> +	return veor3q_u64(temp, temp1, temp2);
> +}
> +
> +SHA3_TARGET
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len)
> +{
> +	/* Assumes len >= 64. */
> +	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
> +	uint64x2_t fold_consts_4x = vld1q_u64(fold_consts_4x_val);
> +	uint64x2_t fold_consts_2x = vld1q_u64(fold_consts_2x_val);
> +	uint64x2_t v0 = { crc, 0 };
> +	uint64x2_t zero = { };
> +	uint64x2_t v1, v2, v3;
> +
> +	v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
> +	v1  = vreinterpretq_u64_u8(vld1q_u8(p + 16));
> +	v2  = vreinterpretq_u64_u8(vld1q_u8(p + 32));
> +	v3  = vreinterpretq_u64_u8(vld1q_u8(p + 48));
> +
> +	p += 64;
> +	len -= 64;
> +	while (len >= 64) {
> +		uint64x2_t t0 = vreinterpretq_u64_u8(vld1q_u8(p +  0));
> +		uint64x2_t t1 = vreinterpretq_u64_u8(vld1q_u8(p + 16));
> +		uint64x2_t t2 = vreinterpretq_u64_u8(vld1q_u8(p + 32));
> +		uint64x2_t t3 = vreinterpretq_u64_u8(vld1q_u8(p + 48));
> +
> +		v0 = fold_single_round(v0, t0, fold_consts_4x);
> +		v1 = fold_single_round(v1, t1, fold_consts_4x);
> +		v2 = fold_single_round(v2, t2, fold_consts_4x);
> +		v3 = fold_single_round(v3, t3, fold_consts_4x);
> +		p += 64;
> +		len -= 64;
> +	}
> +
> +	v0 = fold_single_round(v0, v2, fold_consts_2x);
> +	v1 = fold_single_round(v1, v3, fold_consts_2x);
> +	v0 = fold_single_round(v0, v1, fold_consts);
> +
> +	while (len >= 16) {
> +		uint64x2_t t0 = vreinterpretq_u64_u8(vld1q_u8(p));
> +
> +		v0 = fold_single_round(v0, t0, fold_consts);
> +		p += 16;
> +		len -= 16;
> +	}
> +
> +	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */
> +	v0 = vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
> +
> +	/* Final Barrett reduction */
> +	uint64x2_t bconsts = vld1q_u64(bconsts_val);
> +	uint64x2_t final = pmull64(bconsts, v0);
> +
> +	v0 = veor3q_u64(v0, vextq_u64(zero, final, 1),
> +			pmull64_hi_lo(bconsts, final));
> +
> +	return vgetq_lane_u64(v0, 1);
> +}
> +#endif

