Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958876;
	b=jsWWDFplTCQOZHUWEkQXUwH0fgLe7XsM8KEc4ZXk5Rp0Q3S9lwqzEl7ZPkT76hLLFShO
	 xPGRGXjk9+fppb+q6FFqnwtfMXUcPGtBOZYg5ft60vTEi2x2sQfUSJ9/m4vcyw+Ip7kKg
	 pRK29QRhW3Z8uMovHy6K+neL0RVisGJdVW9Qb417PtFtr5rwEzW/XF0sdAUoWKddd2rSM
	 cz4fGYGbTbfZqhQ3GLVhMvxAEu2fvcTpNRYzT5yb5Ok/cOnua+KMVCVzCAHqu6/iUOQi1
	 1HFSPMzBuPHMp9ftKz2bLgdOvs/DkY3t7NxrKAQEqyG2rshQmJPK8EHXgzkwmle7uaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4qr+2PlY+qQFgdJdxRLZFeaaZG3YUHl0t0MS0C+BIeY=;
	b=O9DJClHhG6JUItW0tzk0Bs8bCFfjIUra2TcvKf9ROfXg6H7zRfR2qmHsC2HtNFq1hg6x
	 NYO/RbQm1x1ph5HMb8naZPbaOzq3dEHiCUkbW8iiNmp63J3fgeu/bCIOupNuk0+ulORuz
	 PVklOrgHoyggsq4rDzbiqAm1JWjVm2TvDjp2hyqPK5LrQ/mPwx8S3/1tcSkLvupRj6/+Q
	 UfPmmDehxb2fz6z0sdSjp+p2cjSmKkgMUZJwtSyodg1TWK8rGj+pN4ryZDW2J4TTgupVz
	 hFao8wK93CpN17MdcuGxWxj87eEYhBDyGjAX7ku5Uj9hV0yaL0l8Knu3R+o4Y4LVciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JOMW3wT3;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8971606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8971606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JOMW3wT3
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5914675a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792958874; x=1793563674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qr+2PlY+qQFgdJdxRLZFeaaZG3YUHl0t0MS0C+BIeY=;
        b=JOMW3wT3fuT0pl12W2zC8T7DpyFaa23o+xsrhWYsARShQAAjL+otQwp1Dt29kLq0f+
         VTHFMB7GAjtLkEPbczWOs30P7MkWtxmzz2gAVRCoS/1yC1DS6D6anrbXPzGegvWJH2iK
         WjsrEes67MonRiNOTxfs5PXwI6TakCrgh4og4ZOeTMTs2XHSQFL08PdY2hQsQMdmv8K8
         wdGa9JFvYunOT9o5/DllCCHA1XdAnMrezK44J7hvS4mO3efUHKjVnNczEDlWGhmGXYW1
         2Tp9VY8Tvu3BFudDXWAamygS3Y0bTtzU4P48tK6qRlGoEWZvJOGS4Zr3WuUoPP90lLhT
         M+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958874; x=1793563674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qr+2PlY+qQFgdJdxRLZFeaaZG3YUHl0t0MS0C+BIeY=;
        b=1/D+gYvdK8RPEecL5kuJ18DhFeR+vCsx1RcAmaQMUO68wQHM+CaftnH/KHabMuylB0
         FzNyIfKeharrbwffq8GqANNwbnfTAx5Aqu1NRzVL0KQqHB+bLuRLPzq5Cpb+Y0DP0HxZ
         r+HJubAjf7MGn3FQz4ZIy7kIpkqIys33GG+IjQxlKB4u+sow/JeLG7jkdGiD29fkkvcA
         5eIIF8crCnGqjYbDeurvnjE6dWTrGApNbALzvPXCXNqzuNuZPhI3tbG3tkgd2nMIYpjE
         4XXSQDpmxRIJ6uqhInUtXaMPIvdJo9hrDysDqi3jXalKsE+sC5OdCbE2qNIZBuOCfCGC
         0Guw==
X-Forwarded-Encrypted: i=1; AKwUvBw9Y3XKBMkq4N9uIDS3fmShTXopqg6GWfDKAG/yRps/SHPvBXnHyxcCJRyYqemlhsI9RwgrPeSehEXrbNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJo5QV/btuQoHCGUPmPvT2xVma0me1jdMYmAWfeDTQJ844WtiC
	DL2rzxjhHWSS6krWT6I62719/rTYrEs8vlfwBz7fM194sv8JYBiYlFp9sw3MjA94Lsgo9Q==
X-Gm-Gg: AYBFou28hgPHgvEx7J3IkXG1/yDuEZo76ZciiEJM2tv4Td97X63Oe9TjrznQzaQI8lK
	X0tI+LQEJMwXbF8hMSptj0gY0KJqCyop+Lcual3L07yZXWhmbdDMILJnVkotIWpfzhO6M1GgTXF
	jSRLdMFFv9FuNNi6/NYvmY3G6LILK2fSEWuTSwX4NjLDqfbonfUEZ0WL7IJKsu5JJZxXjWLcKgE
	oUjg25u4CG+WPB1uBT/+Ix83ZU3nGDmMbrMd9TMLb6kA6UC3VjTQgGhWrvvbJQnNcqxaHvcQLnA
	RA3aIKAObsHVOjBe7FSKTeqCuk1F1CzDwW8zV1Kw37auBc+GTzFzxvfoo2DNMrAHlPf7kEO+O0L
	P/MowEGicNFblqQgc4ha49dVmgzBSaoeaoQAHyryenufcgenQadFKf+oG+CxeiLqZDsgmWh6DHH
	90TN7e/cPn5RZIEBGXu3q6DmQMiWspwtMF+Bl5kdwaDeUgA2SyAiizvS/do72h3leLVDQdW4Jlg
	uNsD0na4T6Jhd7Sapow+v7zZ2B6IPlwXhiR30S7XV/0ZNQbe/sQQ+ClIxdieKTj
X-Received: by 2002:a17:907:160b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c46bdbf340dmr636123666b.9.1792958874100;
        Sun, 25 Oct 2026 13:07:54 -0700 (PDT)
Received: from antekk-kvm.a.lan ([45.137.227.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm233855366b.21.2026.10.25.13.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:07:52 -0700 (PDT)
From: =?UTF-8?q?Antoni=20Kuczy=C5=84ski?= <antoni.kucz@gmail.com>
To: nathan@kernel.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antoni=20Kuczy=C5=84ski?= <antoni.kucz@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating SSE/AVX code
Date: Sun, 25 Oct 2026 21:07:35 +0100
Message-ID: <20261025200735.61814-1-antoni.kucz@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025194411.GA56787@ax162>
References: <20261025174336.8857-1-antoni.kucz@gmail.com> <20261025194411.GA56787@ax162>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nathan,

On Sun, Oct 25, 2026 at 12:44:11PM -0700, Nathan Chancellor wrote:
> This option has been in the kernel for quite some time and I am sure
> people are using it. I wonder why this has not come up sooner. Just
> unlucky timing or configuration?

Configuration, on my side, sorry for the noise. Following up on your
question I found that "gcc" in my PATH was the icecc (icecream 1.4.0)
wrapper. To be able to distribute the compilation, icecc replaces
-march=native with an explicit list of options for the local CPU:

  /usr/bin/gcc -mno-sse -mno-avx -Os -march=ivybridge -mmmx -mpopcnt
    -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx ...

so the expanded -msse/-mavx come after the kernel's -mno-* flags and
win. Plain GCC 14.2 does not have this problem: the reproducer from
the changelog built with /usr/bin/gcc-14 emits no SIMD instructions,
as explicit -mno-* options take precedence over what -march=native
enables.

So the changelog's explanation and the Fixes:/stable tags are wrong,
please drop this patch. I will report the issue to icecream instead.

> Maintaining two copies of these flags (and having them appear in the
> command line twice) seems objectively worse than just adding an extra
> 'ifdef CONFIG_X86_64' and moving the block up so that this happens in
> the naturally expected order?

Agreed, and FWIW your diff on top of current master also fixes the
icecc build here: -march=native now comes before the -mno-* flags and
arch/x86/boot/startup/gdt_idt.o contains no SIMD instructions. If you
think that ordering is worth having on its own merits, I am happy to
send it as a cleanup without Fixes:/stable, but I understand if it is
not worth the churn for an icecc-only problem.

Thanks for the review,
Antoni
