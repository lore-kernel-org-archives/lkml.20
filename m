Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776696;
	b=QUHU5SYRUWZJeGKynHxRbdmNkIkL4Z9PJr+VONPsMJytDwWixQgGmn13S6/ghAj4IGo0
	 U3ypVTGZ/FsC529O4nM0AcTAdb9va+887y0QdjAMJvFAGavAWID+wwRMl2Pb3Fkq2sBOa
	 QqTumsZMd5+ECxRgsG3yN4dqivVBCqWhQ0iB3r2t/Rzg7FZVg6xqLeOzeHnBxJHqzuk9W
	 KMKqKyR++qDxRc+IKVzwp4pCn3e5ym2VPLJs6dwpONBWPT60IFg3mhvJzxc2f3FPCo1G9
	 XYERQ1O/qI1UKKQreSH9jk/fwZB+IKlzftM2meCsiQzwsoDwn8S1Vre/5YFhT5ytNTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
	b=z1jAsvzg4iBbTUuZvufvx2Pe4bf2MZ89j/Vm5bh3/AJY3uJ/d2yiRq2TpXLwGdGkDdaL
	 m/297CYczSG5ycOPX2G3ZT//v93XR5Z254RvMuDb0VGRK8RTRVrPes6rkpOZhP1WeY65T
	 gj0njM7vDTkISzRAEy7565o7Adqe4r0CvEenYn1RQC67bxui3LS9vkXQk1R2LxClIj+pf
	 xw7q5kdo1plywjzgDvLLeGexGJ0AyCBLxrXPx8fU++NKRyAdBJIGYEsk0rLosJJU9Coko
	 wdS8QLklbOcOzP14V0dq8NxcBZLsMXGUfwF+WzjNv572jSqmGN6nBSFoTuQhIwMr2CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUuUe4b6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5891606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5891606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUuUe4b6
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c423b145922so49885066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793776694; cv=none;
        d=google.com; s=arc-20260327;
        b=JWmhJMg2+K6i2/f6sky0BD7F5ArOqDo96jiJNpvjq+i8EMtoxsQRngBCYR5Al+joY0
         PSzacYVokfYYbdUleCP0dJV3oOYEFp1wu3WkPxcjKpSZF+DaiQQQNeCTV0PvzhqZuDrI
         QG0sbiTCavkcHgSq0RohGExKrJ5dLWkzqlPwE+BRsYm7xqy4KcR06Dz4Iv3vyH9S6Nvf
         s+yiR6lFJJYtKWfnMBdfslyZmstHrCne4wsJg5S6TIEQCHpccUhLhq86c0K1b01bc3OB
         a2O3GS7S3hqcbjYNI+JuoGfxbDq2GuP4cXf6IMqlCpGunA5ZNmD41pn58UTmqd9D00JE
         ndmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        fh=u1+CuK0TirKXpCXNtBR7RPrnMLFdRmRgrlB0RDXoToY=;
        b=onJ9Wpq07Y5lQxb//5Y7UinXorRXotCLJ6zGFDi80Z2QBSbvAGRabbsKRFoaLVXYED
         q7epTOU8mMGSEj0XXqa0vecVmIckF/zHV5+ZBBWMwFhor6nqX/1rSRoDfq20lEz8BzZV
         Rtg/16NWHarvQjZlnj2Ia0vt4blWlbPOeKr6RXKD6iiAXLEIrqlfJWrt/4CUgPI2l6sU
         MPRJNkcj8QwxlnezMAust5AcLN4g/YyZrgldOR76TnDHVOdDqR0NqvJ7xvQBzlactB+V
         fokLvIRu+o8YTACJgx7U4tL5BGh9ua81oSWfE10O+I+slBNvQH0Ol34ioTbi3kF5/qfN
         IE5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776694; x=1794381494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        b=CUuUe4b6MHCUuoDH+JCLUflnnhJGxOkM8cr7E1a5bm+LaznUg29VuRmEDOqekOSX9I
         dAU5feK3Fzm7oBNbPPOGWJkWmItiVtotinxBoMVJ3bUuYW/KoODyhCJWOQGKFTUg8Q/i
         PV42UPIlmC4dbCIIufjHhV7daYJmDPTdmdBizqzaGsSFhNju9RZmuxL5OBzT4qbxxiKq
         8g80mlPftxYHvP8F82gd9P2FMYOPruo2UM0c3RlVUboivfIic/GcvCylc0cUYi772m/I
         LVoKvjC0bbMHJZnTQZ6X7j9M8053ef/gJc5KBYdSl95VtfORuVYWdnC6KS59UyhRcroi
         zmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776694; x=1794381494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        b=GG/Ss11GAOMV4BmFt65XmDQBDfAsRxdOtJFelKuBOIxM3DENkHKPLIUGmv1YQRmc3p
         cw4E9p+IlkyBNpq0DDO1bVoTKW3oceoDkhbrU2loguAQPNfnOA7ZYc3LMCOo6McQ/DP2
         awRoH/QUv0PIYTe6x5JXCJ2fY3197xHib0R8Tzq3zl5LryGvKv+uRpx/ZRwKG7HlSvSp
         3dN++7HgOcJDnEAPKRcCbZ1aCN0uap9Q589SRkkoDGfXPxlZOhdLKAa6YVVTQrpsASld
         8Ujn+CTvfvz09+psmnaN4g4HTEtJcEEhZLwSgRuauuHRBZqjEpaxP3cSe0K2jsLr/czi
         mf4w==
X-Forwarded-Encrypted: i=1; AKwUvBzVFqW1VPhoCBoKgg+TykJ/5T53ATVQ8/0WblrOnSpL+9/T3JhbQSz5EVBFkqjr2IZ41fyYe01BnPGs+ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xSE1WGZNLGqidyZcDl+awXsf2CI6SDMGka6RB1V15i6jyEXCu
	ifkfFyELPTFQKmOxzeZ/m3qSuoeQISL1P9HrvuQ6XpEOsNNISCDHsaS3bJx6hSfek5X0Ycagybo
	LestiNwB6LGyMWyC2ClIa3lD+6yNACjQ=
X-Gm-Gg: AYBFou0UJHpavdrYB4+cAp6Cqvtg4FiCJ75Afx8BZ0HrERYyGFJzLYbkiGP7DNNZ7G1
	u6dbR5tjV4+DNNwYboJIcAyISISwOA9yIqLh2iyMBSImJHXj6B8113XU3FHmAHQZijokV6SGiiP
	GD/tb4yyN5iU3Z8jmUC7OEAZsnWvxCHeh2JZkEu1ypUuCs8jyTOb3rnLhUIMOdRy/u60mJXL9fM
	bg8KPfm+7bsURsa171coijvZya00SsHFaKTzITbXFtwCUREDX8wOpXOQAAh8rSnXLzHwlYGaSdn
	jO8NWsELoDeCqK9l4kYSUatXO7VLmnJxCQ7z1voLt5gVozlgEOijoK2WO77uzEfCmpAcE8inWJ7
	t32V1dGUKXJmFbvzCW9206uykhwzWIfkuz6qHC6EDBtUhslo1bqVQ6HlpxpqMEcCJsj3t+w==
X-Received: by 2002:a17:906:ef0b:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c4ca7a878bamr1390172766b.23.1793776693850; Tue, 03 Nov 2026
 23:18:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com> <auqNT3yNeA1ujmW3@tassilo>
In-Reply-To: <auqNT3yNeA1ujmW3@tassilo>
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Date: Wed, 4 Nov 2026 08:18:01 +0100
X-Gm-Features: AclHuK9zC-OrowJyDsUEWnW6UL1USeGbybY_wgM3WfrYF13CrvohZ2o801ipwC8
Message-ID: <CAAFOosbXR=eF=sj9Ap7y3odVgLEPx83rXPE0dWwf-=+f3VH9Qg@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>, Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

> One thing you should check if the inline assembly pessimizes the code on
> gcc. Normally builtins can be better optimized. Or keep using the builtin
> on gcc to be safe.

I built an x86-64 defconfig vmlinux with and without the patch with
gcc 16.2.1, and
compared them function by function. The .text size is exactly the same, both
have exactly 62 prefetcht0 in the binary, and instruction count differs by just
one: 7365619 without the patch, 7365620 with it

23 functions of 130789 actually differ: 21 only in the order of instructions,
where prefetcht0 comes mostly 1-4 instructions earlier, and tcp_ack() and
e1000_clean_rx_irq_ps() differ in register allocation, the latter has
an extra mov.

I timed system calls that reach 8 of the 23 functions in a KVM guest with one
CPU, 10 boots per kernel. The differences are very small and within
the noise, in
range from -0.7% to 0.0%. So the asm might be slightly faster, but
it's too close to
say for sure.

So I'd keep one prefetch() for both compilers. The other 15 functions
that differ
are mostly NIC receive paths, which would require real hardware to measure.

Martin
