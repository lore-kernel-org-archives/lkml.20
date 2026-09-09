Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D5559CBE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982127; cv=none; b=nKxXRPq7GISzqeUAhTUXLqvmSB5wEVIGmYH3ZXQ/uOGlRX09YGmaa7dHiKVbJHvhk8uGeHXiXJaZD7lupNPqY/VJMY91/uYnGbDagRjKK2XRweJOPY38cUewStmzPw8Q2pG9aeyR2kOXL1u2ybDpDSEwevtOszImBW24Q9riCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982127; c=relaxed/simple;
	bh=A8qxlRXuy/YiFdgZ3P2x3hGFE7XWWF87El/GwvSysYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2X34BqrU5Q0yZpmvw0Y4UfdYvYGbgArwGc0O4vC60EtK9MZPUcP9J1b4OEldcfvmtfxQK5el8ztbMJ1cZTVk7urGGW9kWcjCROLKvokbae9bY/SOTn5CTJL7VfoCdYaqXR+VgFJlSLq8XTYyBBKxSZQwcVuyUWHuWSGNsS4A2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hxo6gHHO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hxo6gHHO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so26859865e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982123; x=1789586923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OqLNu4tTJ8NtFG6KAdKCHnZlkuKkQ1EKyLuMpgNzJ0=;
        b=Hxo6gHHODMWOyhlLn3l7wB0y0lGzQaXAoySXjcU3iX1R9Q6CMX0JF70PcBgZjkRKWI
         yZFzg3opXTrrrIEbF+wjG6oqBTnF65ygTnzqUMEnlm2NWQx5UPt8opLTyfLpTMh4fmyZ
         8EuUU269uvUgCq5MlWtRH27+FvKSQZAYYyOS3ShVdI8Q248uIF+KfCdKc9z6/lg1i3s9
         6dEUCtr89yCuFe9r1Ts5HsQckV0jQAvK+4G0gy5DtZ8shWMjKW2ESOniZjUxbT6/bTeL
         knPzh5iPcmWBHr/+tTpJH4w2vblfL9YhBjuuFR0dtl1V2wEr0aT3FwXE/RrKpNgUYyt6
         jPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982123; x=1789586923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OqLNu4tTJ8NtFG6KAdKCHnZlkuKkQ1EKyLuMpgNzJ0=;
        b=JtNyoA3iArOv4feyR2wJXppI3P3+4UWyh6Es0gocNMBanXWUgPK/bClAKjuYTHw8wk
         ZC9V279h/KFVbzIqG4kgizN2IP95zWW+cMGtd9rzv7bsMX772IfNO8On/mXUHf/t71oS
         75EijnL9++1K9bCYP6BgygzIY6m8+M5OApUzNVUitUNuqQSULMJClzAaEcqfyEifkacQ
         N56g+tiAQXYFUlkce8Dfka6uoy10DAtwEEuGFNijVstMp/hMMm+FNMkoFY7ODry9m09C
         Xpi4OThyD7Z+rtWjWLE0YJyxj3MlV9RlH5imP9ZDBYJRVBm4VGyDmlMXczP/ltKHQqNF
         5QBA==
X-Forwarded-Encrypted: i=1; AKwUvBzT7+vWSw33yCGSSwffipy44CS2vP/8omtZ8XhMvYCca0Kdnw8kin4L53nkhPbscxPmnLz9ir2ns2xo1s4=@vger.kernel.org
X-Gm-Message-State: AFuF++kL/SmingD5RfHeadZr86pa4e0H/Tn/MWTReUPiWd3P6IiAQ8vG
	Bjz0aFb4iYpIhvcktTvl+FTJ4/bh76fTssYbsbwZd8hxtodeqCf0ykCV
X-Gm-Gg: AYBFou1BD3pxgO295K8UZzdHDQ1gjruaiLi9FKo25zJDWGEQ++/kM2ablXFkyzbUI+s
	mAoEnDA0M4peG9hE/KeVNoMkmb+E/lZ1FL7j6h1jGze2PxF1Me47wLfY9hCDkmuU4ukRX13BMfa
	m8mtSBj9SP3UC8/0zXLSVrwJMkhBwIAcWsByka2oyJXgfqKC/Wg8kGayNwD717bA+aiSGbVw3CF
	j26Ar80k/fl88G8m+Xdv2eC2JZJdEW6hMmkoyBA6cBExsYmpm8jYyxOqDim8l1A8+8qLNfuS9/m
	l6rT5bvrQrTlXddLvyOBuaBK0mHIOqe3NrCV9M327xXj1A3+7kzGRA+2lCtnWcgyt3ckpy904hU
	0ktQDP9MbPQ5mAKsrJ0fhifo+FLui0fjSpHZzVHTO0Je4P6DxXseBhIwiXb1w+6KHLhh6WTyy1b
	Ilc7U3/8Mw/OCPzgtDQ/GAnN01+DcD9rDZAk0WCim02Cf2V6hJFk/hH27saWSeDBPbKdWRJvgLt
	6biVqpeMDCASjJCKapRv8yKXn+/EsCzHV9A
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr385537435e9.15.1788982123211;
        Wed, 09 Sep 2026 12:28:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm68962995e9.3.2026.09.09.12.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:28:42 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:28:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909202838.28071bff@pumpkin>
In-Reply-To: <8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
	<20260909093831.095b89cb@pumpkin>
	<8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 06:43:01 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-09-09 01:38, David Laight wrote:
> >>
> >> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> >>  
> <broken code removed>
> 
> >>
> >> On 64 bits it compiles to:
> >>
> >> 0000000000000000 <memcmp>:
> >>    0:   48 89 d1                mov    %rdx,%rcx
> >>    3:   31 d2                   xor    %edx,%edx
> >>    5:   31 c0                   xor    %eax,%eax
> >>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
> >>    9:   0f 97 c2                seta   %dl
> >>    c:   0f 92 c0                setb   %al
> >>    f:   29 d0                   sub    %edx,%eax  
> > 
> > That isn't the object code from the source ...
> >   
> And that's the ultimate hint that a cut and paste error had happened.
> 
> This was the actual source code.
> 
> int memcmp(const void *s1, const void *s2, size_t len)
> {
>     int lt, gt;
> 
>     /*
>      * Note: for the benefit of 64-bit code, xDI and xSI are reversed
>      * compared with what CMPSB uses; hence SETA and SETB are also reversed.
>      *
>      * The XOR statements set ZF = 1, CF = 0, which is required to handle
>      * the case len == 0 correctly.
>      */
>     asm volatile("xor %[lt],%[lt] ; "
>                  "xor %[gt],%[gt] ; "
>                  "repe cmpsb ; "
>                  "seta %b[lt] ; "
>                  "setb %b[gt]"
>                  : "+D" (s1), "+S" (s2), "+c" (len),
>                    [lt] "=&q" (lt), [gt] "=&q" (gt)
>                  : : "cc", "memory");
>     return gt - lt;
> }
> 

Try:

int memcmp_2(const void *s1, const void *s2, unsigned long len)
{
    signed char lt, gt;

    asm volatile("repe cmpsb ; "
                 "seta %[lt] ; "
                 "setb %[gt]"
                 : "+D" (s1), "+S" (s2), "+c" (len),
                   [lt] "=&q" (lt), [gt] "=&q" (gt)
                 : : "cc", "memory");
    return (signed char)(gt - lt);
}

https://www.godbolt.org/z/6hrxGxb18

Saves the XORs - go away completely in the usual case of 'if (memcpy(....))'.
The 'mess' on the return statement moves the sign extend after the
subtract.

David
