Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF540F72E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575649; cv=none; b=UWyWySPsZ8lHMLw0ssW9pvGhMRu4n22WVhFrL1WnmXOLOTLGBoJ21cXJhDOSRy/GQmJ6odnlD7XHW/FHLGG52Nn5P6d3t+D6gbyFBxKppXMdgfEQp7Vksk3kLRsBp5ONmthAXC8DgWIk6jOhSA2gMl2lvRn7zRitCv1XkjJvQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575649; c=relaxed/simple;
	bh=YPCJnyNJ12A9jnCHKjDKZ9NGt82rboxnhlTUuEMZZKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkZjxo4mLPOWNYjDS6ySCXC+ZmRUvPyd94rIksXsyKE2cNCsvMLSaQ/KQgepha/8Fvm3dwDQUzZyq1iABUX0zPqBprfVwzscOuLY+DB+tORS2bAMyC1cjX4YF9C+tXY/RYmniZq/Ad3dVEgF4F5HrKy2WCs/myoRM2Uz4do5SMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HE8y/RMo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE8y/RMo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so7091015e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790575646; x=1791180446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+FDVerP9oAliRZl88sc0pX2EXGksgQKocsyfp2c8Zo=;
        b=HE8y/RMoC6JzgoMeEJ0ZgCa7OUONRVZaVTy2LWqlg1UDzdAtcUHhlGOJktmc4g8J/9
         E0CMRvExGQ/P8HsEiOwde3Y1G6m5EIa7tg+dF0xK8J5sELvG6JtYdUCjKhxaMRpe77Tq
         6rX0njHWwFiwAu2JVy2tlqqR2IimNeFRcGAi3k2lruBbhuDmrb9FoDJ0GmBtixs0tUSt
         f4jTK2g1n6YgWuLvf4pbIrKBFZZqAattVGlv9OvPb6h7hDz8fVr5UXTR3OcC7IguJdXL
         FTZKFBp1+vatSoHY3/jw/8ccS9DDk34fS2iHqM2aR/f1+S9kHmqp4wPT0AwS8URbLj6I
         U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575646; x=1791180446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+FDVerP9oAliRZl88sc0pX2EXGksgQKocsyfp2c8Zo=;
        b=uyOCkvsj4tdTcQPIx3YZPuvm439PY2ep7iNJx+3yLIb6I4Gh3GFjgu+SkEkGmXCbFX
         JQ3kG3DP0KTCz4x10iFuHX015LacLHbCc5igrXVaSxd8LOq6PDXNUObX8DqO3UHGNlh0
         IanzSrLvDFAk/cXf4ms3M9XvS8oG3LBgHMElY48qQAtCwBW8VXaGbY7WoxsZywRROya9
         HIEQK6N9268sGu3kp3/Mvb5Vkgd6mtmjQ53Ii04JvO85MG2mFk/UC2BBV5VS85AmM9x/
         CsI4HMYOt2IfVK5Z9EOGVnu94wDnQUaqPexlMTsr1CYt70fZatj25R6VtA2I4dwd9+jK
         +boQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGoype4eDlrshPdJjbzz8eS1TVTPL+sqawSZE+dcFmDYe6eUDqqvyl60WrteqCkYjsGvFUazQq+MyZMpM=@vger.kernel.org
X-Gm-Message-State: AFuF++lxRM4jDBLfZMO8OONszYfKr0wAQvXywWBbLwqt3DlmMXmdT+FZ
	PzqkIx9zbT/KTI8DE5tYIj1lyBhFidhYwh8yxuJCnPM+ShGTITPnFw7h
X-Gm-Gg: AYBFou2lYJ/IvmqVTLvC5VFxVEraegIpn9SOW4wo5yIE5UmKgequ71rLYG0Wfx+Xjyh
	P4reN3rQD64QJhbZ032Pr/JS/2GRr5KF2H0xoNN08ACU6EiO7GPSbSPyZbzeyKEPNKbNoxRu0vA
	oGeiwumhJwV/87ROVvBoB7RkfH2dwtxxYKk2bBAt12UBRwbWW6+cVOGyg/rI2q6PWocTbFVpBet
	kJ1l3O8GGi0pfwszDPpAVip15sDGyf6TwxPbhogMfknwR/QlBRNZJr0CeYancwBw091mVRnkFja
	Ak4sjpwOltahDWCu0m27zUS4bipQwAdpfDhoxw97McEacGzNhYrYZH3CVqLM+5g3vxP731rh1/q
	VgjAFdV00TPZzI+sYzVxR8hzMALxA1dYhXNJbOUyOsCHPFlxaJUNdNDHS8LzwWQzP1ZCT7i/Tcs
	g67cdRsWt3+KoezD9E+tLmrOnvtIt3S7zqmb4zQ4cJ+EnWQ22Mve7N2IkajAUTQ6yxGQBlp+G17
	0YJ4oHkAXhe9UgBtbCWLqdIna3AYT3+vMzb8u/ObqK16hZ8penoGojE8xG5xOjElaUGOKAOpLNr
	8FyaJ3ixPrEzpbL1tvXsBPDjwoSHrsVxevCzIZUDAidGKh6i/cnwCDkt5rAB03Ncf4SnlbXkrWa
	Bd5zL5O7RELP8gg==
X-Received: by 2002:a05:600c:870c:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fe7bd0128mr202295575e9.33.1790575645445;
        Sun, 27 Sep 2026 23:07:25 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm122878225e9.11.2026.09.27.23.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:07:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:07:20 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Artur Rojek <contact@artur-rojek.eu>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/jcore-aic: Fix lost IPIs on SMP
Message-ID: <aroDuGZBLsAw7tMS@gmail.com>
References: <20260928035408.25871-1-kmehltretter@gmail.com>
 <92e110eef6dac0c6ddceb6ddda1658aeeaf1f0ec.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92e110eef6dac0c6ddceb6ddda1658aeeaf1f0ec.camel@physik.fu-berlin.de>

On Mon, Sep 28, 2026 at 07:57:27AM +0100, John Paul Adrian Glaubitz wrote:
> Can you tell me what toolchain you used to build the kernel for J2?
> 
> Last time I tried to use the one provided by Rob Landley, the build
> failed due to an internal compiler error so I couldn't actually build
> a kernel to test it on my J2 Turtleboard.
> 

Hi Adrian,

musl.cc's sh2eb-linux-muslfdpic toolchain (GCC 11.2.1, binutils 2.37):

  https://musl.cc/sh2eb-linux-muslfdpic-cross.tgz

Your ICE is probably the one in kernel/nstree.c. Since listns() went in
(v6.19), every GCC I tried ICEs there with j2_defconfig. The 64-bit
put_user() asm prints %T (address + 4) of an "m" operand, and GCC can
pick an indexed address that cannot be offset. The asm needs "o".
GCC should still error out instead of crashing, so I filed a GCC bug
too:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127639

Fix below, formal patch follows. With it, j2_defconfig with SMP=y
builds fine with the musl.cc toolchain.

Would be great if you could test on your Turtleboard!

Karl

-- >8 --
diff --git a/arch/sh/include/asm/uaccess_32.h b/arch/sh/include/asm/uaccess_32.h
index 5d7ddc092afd7..879d262489219 100644
--- a/arch/sh/include/asm/uaccess_32.h
+++ b/arch/sh/include/asm/uaccess_32.h
@@ -92,7 +92,7 @@ __asm__ __volatile__( \
 	".long	1b + 2, 3b\n\t" \
 	".previous" \
 	:"=&r" (err), "=&r" (x) \
-	:"m" (__m(addr)), "i" (-EFAULT), "0" (err)); })
+	: "o" (__m(addr)), "i" (-EFAULT), "0" (err)); })
 #else
 #define __get_user_u64(x, addr, err) \
 ({ \
@@ -116,7 +116,7 @@ __asm__ __volatile__( \
 	".long	1b + 2, 3b\n\t" \
 	".previous" \
 	:"=&r" (err), "=&r" (x) \
-	:"m" (__m(addr)), "i" (-EFAULT), "0" (err)); })
+	: "o" (__m(addr)), "i" (-EFAULT), "0" (err)); })
 #endif
 
 #define __put_user_size(x,ptr,size,retval)		\
@@ -196,7 +196,7 @@ __asm__ __volatile__( \
 	".long	1b, 3b\n\t" \
 	".previous" \
 	: "=r" (retval) \
-	: "r" (val), "m" (__m(addr)), "i" (-EFAULT), "0" (retval) \
+	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
         : "memory"); })
 #else
 #define __put_user_u64(val,addr,retval) \
@@ -218,7 +218,7 @@ __asm__ __volatile__( \
 	".long	1b, 3b\n\t" \
 	".previous" \
 	: "=r" (retval) \
-	: "r" (val), "m" (__m(addr)), "i" (-EFAULT), "0" (retval) \
+	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
         : "memory"); })
 #endif
 
