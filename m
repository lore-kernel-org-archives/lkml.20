Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793635902;
	b=I+FyGIDN1PekGzjhaSN7hZcmmQa9eikUIi2yCarycL+xlwTO9lvX8bZotNZ6wSa7QsVN
	 JO3Ut2I5MhP0bIZSQf9PLJlkMDsPv4QOk9IEbGzwC06g9XyF0oD75UT7EGS/zv0nECDK7
	 CfgPzH5Oaa2LfghNSaHSpqA8uxUZKT7reo3EWoglXiFVZTF6OKeKzOL/yaZwkgXML1lrL
	 3SCbPR91qVGYAmf92XVE09tZWp8mFQThoTj20dBgSa/zLnjTc9vkilviileGC4c/k1O6u
	 /EEbs1ltYBXKfbLPDoRORtnfp+Y3haHeDfZeEuQvinYmCY+KR7tzFprt25XURyJ/vRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
	b=Qm97ppqhmVblHhDC/QQ9AhyCll6cEERpechef+yKJhw2gludTVCA5Wy8NEaeiuLhHnfH
	 tDE07uN3wj6KWjAF2+f1geO4ftDOmEggqNckVQXnIjtGXkv+s9azhxgo7Y7VIgWU+askf
	 mqE1syTE+SQk3q1UZ0JN8X7KOF/N3q48SjHv7YNTY16AlyTs1EzcadSYUJRGkPVyPp8ok
	 OJvhZdadp72OZoPXyBu9rns0a4Sbkllr5Z/QSRah7/UZ780k4ZOgdNo02CvzYDWuhYn1J
	 HfjCerFUUG7f75jhHLyHsR3JGZ8+/v1RKc8O0EeDRAiaSIwOaQMJ2BR37n2cbBOpbHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UVShwcRQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7435D6070C8F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7435D6070C8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UVShwcRQ
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so460011cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793635901; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFGYgEx6IGCzlTcmmDHweEvZvOtCzgu4aq712XYr47936+FvQvVYeVZyA+DP4v56cg
         LtSc6kwvC+okzNFO0ojo3GJseAgt+vNPag2IS5ZlTkyqXpJaTayTkZvKUvz/A6lLuVAI
         ISc7Ay2bTLtWuqwFp448GSXTVFoGYaVIA5VIe3euIAYHW0K5lX1tfMxFz18JM0TMFKNo
         TDg2yELSf4vX96d1/MjhJMv8SNvGIuEw/Fv0ggVklywSbF+9uRN0So0Mo8DRRoimKami
         H9ntGozlVovGb2GE5ugueEk8NroAWkNaSsOT5FJq980zCsNvxRPb3LUP2w26NO57AFz4
         ohBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        fh=vmiBD2c+tzLN21vJE6bwSL1tug5NkP3/IJorPEcLlGA=;
        b=OKK4okP9wiKJ/NXC1xEURqRtlcnk+YCZpZJRtUhk/guXcvWT4Dv5uew/i91lnOW13o
         y3LgYzLqjxWpvTIV8SE2jLfIuGpLoCOk76zenYxhLLRwURmZw2PHWBrF8whuM1x2l3Fu
         jCg0qq2IXzirzSFLkm0lJdPw/HvvEnTW/oQjApiWMSh44/g4KZih5Dsb58wkFHZxMmQ8
         eIaz6qUcIguCXCk5gldN6LkRjYApYqNxpeub3xQS2PcqKjLmN7uuqmNJ5QaaRSm2rJaw
         /LyLa2AjhiBatPsYNVSPICFMfNmjUlcjc2dQkXm6P17US2Xk4ktAqNjhKXCzANfed+/7
         GbAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635901; x=1794240701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        b=UVShwcRQgQcFvI78rGXvjmJNJ5jGiyxdNlYitzKvC90onJMRPN6vJmAdgmfOh56rvV
         q1LUnlMPBCUk+9GhMncjTbB/QpMn8t8BKt8ENL5qJr7N7+wLA994/gSuKa9SV7uC+G/g
         xnCOgSLDlLGDlD6RbNJvT6QtObRDeqImMAKSWmrRm9l09RPpQFScFxnPQraGSnK1j9HO
         BZVP/RiJ/DURRx/QWflVJ788P96U/sUHI+41MWIm8XoVipfjJ/YPFAFdm+gvJLsnAeyE
         +H+AW5pw1DnZgtL5Cvnrz0vzU4NFO2aQBJLr3mPNmXox40a6nuD6BypvDkP7QF0/wCiq
         KMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635901; x=1794240701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        b=KtYyGfqOuYwuVa1Hhv8aiIBGJFC61N3LORgEN7XXHh4vxIl43f0+LgGws9/FspPOOm
         dEwDy1Y3uDWGE52pWPfhimwu4mabOxoh5JEcrpe4bJkUREeLCc+eJlUcH89gPscQW2Cw
         E2mbmaS1P2udMdEPiWYMX2hYHbrdRm85P00V4a5pEM/sIurgQUfOZrHDKLng6PrPhDpM
         gxcmrU4KBf/LuaPJpkh1jWpx626ocINngs5t67cE8d3pffpkGaK1vRoISGC9Np8ksJ2f
         nOxIemaF9flueQBXsqNn2Fd8QnZTTYFirKhjC3JnajpAh0Njm3PZNuIFZN5x2xdWIArZ
         BQVA==
X-Forwarded-Encrypted: i=1; AKwUvBwScR+rk/NFgHQUXrAeA+XKy1XlqdWV//YlyN3LoACttsWMN4UympiaAvgycmNmHYzPxUtws+QlZk6qvBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0nlk+oYrDVI6T4FcaLH1linvpX03sPEKMjWoRIJUMR1EX1lOl
	IzF+1hA2xTYAxxBR7k5cddnRwYWUUW0EDhGGeqKAHLo566fhkBAcQ9p0Mh/AlzsgLFth/SpBNz8
	8FvTzCxugW+fEjjENPPdVTP7bCuttVNebEHJ3Wjgs
X-Gm-Gg: AYBFou3VT4Igxe6Hsoury4nINyZTZluaBPPWyuFSH5pr8akJTlu+S/+s8Kwcxf11QQ9
	0mv0x7dy0iAz02tehE7bkwD0A8HhOO5KZl45QPoHE7P2OfTDId55Co5/Oah7zGWfM20TVXW7sAQ
	H+9cB25S2FiPesOp5srnJjz76yhglLtvRVDF4Nwmgvsb4aVds56ZiC+tUHeoiD0m5dOq54LUx/3
	h5F+Xb8QdRRh8H7dOcPQrt5nSPzOobe6Oa6d4osisK5hpqXer5wL2L2jNcPqbqwQDvPJ7ZRX/nW
	QTQrh5g697Bg189kWdERIbMFSUaVSrdNr+JRkGEXjZPKJ1LboFsYz//s41/Rz+VGLOUn+Zajpoi
	k8x6F9n8a7dD1yl8d5D96e/prG6y5/nn3kV0m
X-Received: by 2002:a05:622a:488d:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-5412d50d069mr12637281cf.4.1793635900706; Mon, 02 Nov 2026
 08:11:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com> <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
In-Reply-To: <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 08:11:16 -0800
X-Gm-Features: AclHuK9GAGsiZrN9317-LnzYplCUiian6VttOAS32aZ3eING8-O8jgvJChN1NXY
Message-ID: <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:01=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 2 Nov 2026 07:43:17 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
>
> > > :
> > > : The patched userspace test passed all six cases on an existing
> > > : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kernel
> > > : predates ca5480fb53fa, so this checks selftest behavior, not the
> > > : intended kernel's procfs changes. Separate syscall tests on that
> > > : kernel confirmed the EXEC-merging and memlock failure cases.
> >
> > I'm guessing your bot was using personality() to make the tests fail.
> > Again, I'm not sure we should handle such use case. Should we?
>
>
> : The concern is pre-ARMv6 CPUs, where READ_IMPLIES_EXEC is set by
> : default. Nobody needs to call personality() to encounter this there.
> :
> : We already addressed this in 0685630fdccb ("selftests/proc: make
> : proc-maps-race work with READ_IMPLIES_EXEC"):
> :
> : https://lore.kernel.org/r/20260808200312.6326-1-kmehltretter@gmail.com
> :
> : That fixed split_vma(). Alternating PROT_EXEC in setup introduces the
> : same assumption elsewhere: RW and RWX both become RWX, allowing adjacen=
t
> : mappings to merge. The parent then cannot find the expected three-page
> : VMAs and the test fails during setup, before testing procfs tearing.
> :
> : Yes, the focused x86-64 check explicitly enabled READ_IMPLIES_EXEC to
> : exercise this behavior. It wasn't tested on old ARM hardware. But I
> : think we should preserve the existing support for those machines.
> : Populating writable, then removing write permission from alternate
> : mappings, preserves both RSS and the required VMA boundaries.

Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
is important here?


>
