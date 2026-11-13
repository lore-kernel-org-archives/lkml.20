Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585785;
	b=1UOEgU493KyZYAXGoS8bm62jCUJRtWE3e/MC9uG8W11YWNlwGgT9DyPOvJcxISW16XBO
	 +5OpEL8fjLskhwP8KryRhjrQIfs88jvW9fuTuHOf6Z+zn+udM0nrMfSPVlB8u4hfmR75q
	 A86AqKBQRntD/0GENpICmgPnICsmlY0nMEWj5p9jggBh9HYx/KIxJ+emlmkBQdw4S+JwX
	 xA96Ktn+QnfeN5vwURsK9bkoVX/4r+YP0Ia8tCFfntwzna4nvcZbRtE/8NgHjNpjg/LFn
	 k83H/8JJRyjgOpWcngX8VFLQAScwozjvWUI+ha4wNkOV3ZNuzTCwkd6P71SzVuUaHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xXYL5W+d0RGRP5nzcrqYJh+PXlAx6hYcdUGr+rvAkGw=;
	b=I2QZtTVj27da9z36n7LdU8FgcMkD4/oSyiBzakMn7MJ/0emiOOLThmFYdghWtq4oR5+R
	 GzycHzGSMNiFYT1YQM3A97zJUx62kQm13cUVnBblwIXCz9o0EA0dYMUX/tulYEycxWyjE
	 HT8bLnfTibJm/wH3CbFcukdWJkkRw/K4hGJbiMXRNlitD47VKU0SD7pUfrNZ13pGza2P4
	 bagbDxD2E0WCc7NVeJwD4yQfwI3digMzGo6EDxtreNzFQFFEyv6m/DkGf7m17HIqoQnUH
	 NlUsFoGt7gsKol9xsJCvAPhlhwZTACuLtDLgBRIAAXrQ49+hoWZcCL7atGV8JDEgtqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrBqWbex;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A01606BA81
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A01606BA81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrBqWbex
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so4295085e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585783; x=1795190583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXYL5W+d0RGRP5nzcrqYJh+PXlAx6hYcdUGr+rvAkGw=;
        b=DrBqWbexCj9vldVtRHHK2HiX93TjgQrdJXiNDnMBTnO34qBQoMs2ivhzJnQrGyZBu2
         npHfAczxTtx1rs//hTGcqw9e9dr14cfJaGoeXAIgjwHZ45T5hEzmVJlf9KDFOWD6larF
         6f2LQy/ZFh/y3h92FguZd3hu8iXbo3X6LC/GpT+oUUzKEO6Wx53EcX97gx1QSa0rKd+j
         32WxhbVP3N7p6+jFIuRys8i9YwioZDl5vXY8ONWv5hvqKffDo4PzkkHy5dJr1YP0d2dX
         vndEh2Wr7WXYOksd3ZmBt2U3mzY+NVR+OX17aRfnf3jmf+8XKHSl1t+M8qmh/cTHOK8t
         6AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585783; x=1795190583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXYL5W+d0RGRP5nzcrqYJh+PXlAx6hYcdUGr+rvAkGw=;
        b=cwE5M3gcWZeW8nCt1qHRiz/MWA0382XhC1cN9pL1Av70nTPaZa1ZImjMXTIDseED0S
         ERErM/D+gT39gKezG3aOhKof7wIESO78F3YLaAAKj5r23d36abwXlueTIeMTq+XJ4sZt
         xQ0//psmtRMtZasgLv3DL3BykuKyzifMqHDBg7ZB3B8lJuj5dnsgAYdxB3FdtuRwsO25
         svrUIPfzv8UznAlLxe8eTGAB9i6l8tD5Vxq7VBjIXki1itPaK/9hiMqmmnyxWQVloXnk
         +EiFMIUK/5tRjGeC/X5ThkBgmsQa59eEPAFHhx8n2Uc+aCsP2T3BpStARXI+Wmcfa2aZ
         KOEQ==
X-Forwarded-Encrypted: i=1; AL+hErHS0w0CsfAQ/uQY/mcs/mJfoFP27ugXg78zJ9HTu2ICysym4cM5rA8mPMPjDzr2MSrFzoonxz9urzrpRVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5o+EF5eLmwOPeKXrDz+kNrhmDsUKYFJUQ+7IYIRfbJc/57PNO
	wSN6Mz2Ri6UtrafF+MTa0ue05fW1Rdeh8Wvr1nPxF1z273IJbGUrCnF3
X-Gm-Gg: AYBFou0ugdZgKtJkj1jjNsltZHMLoDayaAKS8dP3PhnD+qJpO7merUWfixwLsylq4O2
	DOkyfFsSvS20KqfDUcOhhpfSqdFUUnVOLzI42pLKKy0pDB28qCo+jlNRCHgoFs0uDRf0z9Xgfpz
	MVG9EG6ZjBbsFCVMTCw+Om0DyRkTZNUIUfbRybpFVKqRmC7A/4SgQG477ctudFK+CY9KV+BMNfH
	ANYdg5rASMLL37FVFoxCS+dUQ7wq+u/bdsXen0HI+SbAGtQYcFnhPsqlKjbCOxecpdrkFZ57ZXX
	D1IwLPm+9N++/cPjN2dYKsVbsGJfHpM6mmSLMYK/8Vu2Pj1RyLHWKWLE8nePx114mWeW20FSBhT
	/kMWHzeoe79B5SOCD6oXBVJFVBlxLROcU+CXhlzSaFqI9m11Y6ryz22vdPONoLaXofHLX0jz9SD
	urkgyt+J1zCOS2v/OFBkhBlRjvN1mzDxXF+qQRP0MXFQvsdpCs/vNOs8YdY+ioPJWtyUn73/6Kz
	NKPYUbErECk9bhR2hr3L13SpJTyjN/Bho5ZT3w+ZfO754vfZ7KE98FBdtfpM9JeL01szURFdHBJ
	Im+eowXSQm7DDMrI4iim3mqQAyDVeGT9fOaxCcGwJRBNVFYkpQVlTwN65bsIoOOvqw==
X-Received: by 2002:a05:600c:a30e:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4bb55a5fcd0mr52413035e9.22.1794585782862;
        Fri, 13 Nov 2026 08:03:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm64869345e9.4.2026.11.13.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:03:01 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com,
 dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261113160300.3f0d0a37@pumpkin>
In-Reply-To: <20261113141137.1113517-1-usama.arif@linux.dev>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
	<20261113141137.1113517-1-usama.arif@linux.dev>
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

On Fri, 13 Nov 2026 06:11:36 -0800
Usama Arif <usama.arif@linux.dev> wrote:

> How about something like what I have added at the end, would that be more
> acceptable in terms of maintainability?

I was thinking more of something like:
(written in the email so untested)

static always_inline void *memcpy(void *dst, const void *src, size_t len)
{
	void *orig_dst = dst;

	asm volatile(	".pushsection ".memcpy_calls\n"
			"\t.long . - 1f\n"
			".popsection\n"
			"1:\trep movsb\n"
			"\tnop; nop"
			: "+c (len), "+D" (dst), "+S" (src)
			:: ASM_CALL_CONSTRAINT);

	return orig_dst;
}

An unused return value will be optimised away at all the call sites.

That will work (maybe slowly) on all cpu.
Then some code reads all the addresses from .memcpy_calls and, if necessary,
patches the 5 bytes to a call to the appropriate function.

It might be worth giving the code one or two scratch registers so that
a short copy loop doesn't need to spill to stack (perhaps %rax and %rdx).
It'll matter less for a longer copy loop.

So you might have:
_memcpy_erms:
	cmp $nnnn, %rcx
	jb  _memcpy_words
	rep movsb
	RET

_memcpy_words:
	cmpb $nnnn %rcx
	jb  _memcpy_bytes
	mov %rax,%rcx
	or  %rcx,%rdi
	or  %rcx,%rsi
	test $7,%rcx
	jnz _memcpy_misaligned
	sub $8,%rax
1:	mov %rcx,[%rsi]
	mov %rdx,8[%rsi]
	mov [%rdi],%rcx
	mov 8[%rdi],%rdx
	add $16,%rdi
	add $16,%rsi
	sub $16,%rax
	jnc 1b:
	jz  2f
	mov %rax,[%si]
	mov [%rdi]%rax]
2:	RET

That isn't the best 2-word loop by any means.
And you may not care about misaligned pointers.
	
etc

David
