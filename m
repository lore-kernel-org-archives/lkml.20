Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B930325483
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268624; cv=none; b=YVEVll+8gBTeNq4+tXRmNfX3/sMGGUPcU7vMNHlBAIOqlmWIav4IMyXc9unYH7nvdyRu12DqsU7cT/09+wtOHfIlUo5nATxJevRSbhN0UWNoUA1AQYgJKtXL+YcoA4aVcUDV2MzKEIb3XlY0z3rL1PZbM3Jy/f14HHGkYA2RNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268624; c=relaxed/simple;
	bh=dHuK6ca7Ih3mXEL7pY9LEI+9QrmZYD/dCXCFNqGOn2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHmemnDyd8kMHSeDJof0D1GusLYVDAkthJ38FIwaqrf6QXB1iYzU6Dri3eYecsV1lxt8NYsreOCrs8efBcuK3upgyxJ7/4MqBt9a6TP4usD3OcblNwZRbEj/CMgvdD+K7O1QfprSuh9qId5qMjvLrb61+T/dUAmrNuGT4shBnro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L7WI7aqD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L7WI7aqD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso32320535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788268621; x=1788873421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHcJZ7qe8EHcanx4NmTqt9bQxkl+VRDPvbq2agGEMR4=;
        b=L7WI7aqDRRnvYfa4CbtMrURZ6NzBKSvEgr1Wu+ZzL0QjtpnMprzdXfBq36xHmxwZqe
         VH2N6MscmN4Apv56+gcec5g8yAXkVQH+opif/aIvUK47jNntSh7SbxFt+kdeKT90ACAv
         titLFUdSlrvMcwtHnjXz9CJfF3Nrcqi58/gyeDYLxKTCro93pHiFHOBF5sLJMabXAjch
         3dh8EyYbECZD5hWiyc2HuWafqOsDgbEHaEV6Z514eMhXqSuaRH0/ICWKnk3vBbO98LEN
         wXUyrXn0glTrS/uO8m7JgG59nRUDC1Rx0qaygShWFePopj5wyZ3rk+Z3JlxoJ2YXV8X7
         QOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268621; x=1788873421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHcJZ7qe8EHcanx4NmTqt9bQxkl+VRDPvbq2agGEMR4=;
        b=DBTEP6ioIruTrN2pOtZHtQ/4UuatYxsXYQP8GSVaQglMiNQroVAVf5AeFuvWAyoc2e
         alNJJnaxfJtNqdkjqu6fHkU3cJdBn7eJUQjSj/V4mt4vntcBKJXwT3F13QhoACGAJ1nh
         jBg7PIAyZjwa5T0zdvDENdg9PZdOU+toYzzIZQvm4nENy95q+MHK3sT8quYveY3LWjYY
         m0qkoSFiufvazIdRFz0NkUs2yaIQvrNVsVHZvXFcG2S2iuz/6G5J3RTzBoG62vdKLEfa
         cjyZJujCBzhU5+jQbPek1GbjE0BYv+GiCUgNLgb16e1lrMJUhvkJA3TLgyLAm8lAF4oz
         9ppA==
X-Forwarded-Encrypted: i=1; AHgh+RoJU3QFTXGXsENPByR8Z93waF0VOAhojKB0PZu2cNa4z6G9yCg88IDBjbH3v0ME1j02/o8d/izoMM2CN7E=@vger.kernel.org
X-Gm-Message-State: AFuF++nhV1klIhqXYYILJQxnPK2+tPJbkzVWbKYATV0ImnwPGQhx8cp5
	/cE2DxpqN+LoA7ef37ZJL/E5avVsFOyT/hRUo+bjbpTOENCz2IMHFclKbCEJNa0smg==
X-Gm-Gg: AR+sD113xciHn9j9DvWsazCuyN7I8H+VYIQadjjbXrH3FqP6qOStW/yDOeH/W9BKtl3
	244OUnnzsRpW1tB30VvE96bnPTwBe3JqWkb2d3qLY2ZL4wt4KyMV32x2jt34ucgMn/uKrk7P6Qv
	P4ZL7+dD6S1QM913neiDvCYBAJnxvczhqT2y8SbtrP3Cwoz5+I1CJRJKQJR0xcu4hFRTCN7RsG1
	PiF8RXojxnnebA0DvnEhkw3UbEyQUa1+F8bcD9y40aTGImUcgeYgnBLizSCCurR1zPldKhngEg7
	B82P9eBLZx6dYcZVhOrEYi7PdiEhGxuNpvmDQoCMz98DVv9KODXOMKYF1IOg/HtFe72AMwhjDZZ
	iUzOq2jgZcA8phpeKzwd1xUx+XC6snwfF3SS0fDsHHYI5c09RJU+zcYCOA0pVVit20M+0J49coR
	AASNAtb8l5Mb7GiXtgE1Vda9nAqTNtsFbCpdkDoHs/ykMZ/Va0E+CwgYEzmHAg0lSLIVEcSATm8
	T0ySr22Fh0NfGgx/85DWbKEwCyZaZQM4OhAFqDw6tOkP78UsG9f
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr603425715e9.7.1788268621206;
        Tue, 01 Sep 2026 06:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm70718595e9.12.2026.09.01.06.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:17:00 -0700 (PDT)
Message-ID: <16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
Date: Tue, 1 Sep 2026 15:16:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2026 20:33, Mauricio Faria de Oliveira wrote:
> According to the GCC documentation, conditions in the flags register
> (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
> 
> Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
> 
> Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> "=@ccnz" output operand.
> 
>     """
>     6.11.2.4 Flag Output Operands
> 
>         On some targets, a special form of output operand exists by which
>         conditions in the flags register may be outputs of the asm. [...]
> 
>     6.11.2.6 Clobbers and Scratch Registers
> 
>         While the compiler is aware of changes to entries listed in the
>         output operands, [...]
> 
>         Clobber descriptions may not in any way overlap with an input or
>         output operand. [...]
>     """
> 
> Reported-by: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
> Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-Operands [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1 [2]

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len)
>  	asm volatile("test %3, %3\n\t"
>  		     "repe cmpsb"
>  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> -		     : : "cc", "memory");
> +		     : : "memory");

In fact I'm using a modified gcc which properly rejects such conflicting
uses of output and clobber. ("cc" clobbers are redundant on x86 anyway.)

Jan
