Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794507904;
	b=E5sN3gMQoMt/Na6yPT6a50g05p/dj0uWqnrfp16gNT9KpIy07stl0KlQR5d28i2QRwPS
	 EOZ6k8MKfJEwAbanbd1/YtbTynX7v9p0M5I1zouUmWTGxwAls1Q/H5BAaByKr+oourgb9
	 zb4g4utf8yrZiYATMkaOj4kMajuDkxH8DHEzrUuR7Hl8lWImjAbLBRPP3lKwSeO9iiGVh
	 s75hx9tKVqTNk+/Wh+Ux2kHEA3hSZB+6WFEi35Ofv65g8aZOngUbB6Q+OyiPGy/aZxieI
	 hzy8vCpKGUYmBzaY2vrCKWs3I2FFvWoBCbiHRs1FADY+2LVG59ZbHwLBrqAFl8lBHbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tzBmIcpghOYCP+r03HK0N7KGo+wgnlo6db5N340fGPI=;
	b=XE+HbYfoAIStQJYfFZY5UoevNwE05S2+aNzWaDYESn1+5791pI69jmiSyZtxW+yJSVRh
	 W1JKz5qdyj45YgdJUsNy1chR/yBT6TY4Rq64h1jfJ8sGWFMe43fqZOoOXeMWMkjgAmduB
	 2KoR5Zq5gmUYhYTPAmGHSup4kGFTH2TWO5i7XXLQYusZ8cUFNDHG6FwSCUR46WPY2fuxx
	 iQ6kM3T0AyUaISz+X0pIGZ4kcYRmlpxqiqCeheT+Fo7BVh5dxXfd/SbVhzZejpUaxmxrA
	 Uds2NHoWFqQxveznzD4cPQPs+xKD0Thq2N70OvhGFRyBoAIQJH9ra2VhRX+CilDLGhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BVkx6KPI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BVkx6KPI
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so54478241.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794507903; cv=none;
        d=google.com; s=arc-20260327;
        b=PNTSPCrI14gWsDfZhNtBdYeHLg4VtybK88oxrrjquJgFuS8scsIUpmwvnuy1MpSDmz
         dENqxcqgp62ndNGWyXempKDVhCW9T1+Jupcip0ntWuFU7J3f6M4Mo3MycjgYvptUtzW2
         Du1miHCi/CbjUQgIyUnp99ijmngkIXBTmfoAolxR41D8+QmaioSmPf1476YBdh92hGU8
         Kuz/PFjejlf8T2CffCZ5VdLz9L2Eb+s+kuATmPy5nTPMpheBIIr1MvHllqQdU3YziDHR
         K3YeD856ghU2jVDOZAqNi9rx8VcW1Djh9VfS6sWymaIV+qG+ZfOT04Ens4PJQiWuxJgf
         hOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzBmIcpghOYCP+r03HK0N7KGo+wgnlo6db5N340fGPI=;
        fh=Lz80qgPFpndqDQIh4DRJ8qpa66cfNppqXRm1v1IaTGE=;
        b=Iqb/yjCLE1uYveUoo/ZOYDjyH79fzLilnVNzgSyBvfa8UkmZFzQRDpyvcrCtT0BaNP
         dPVD1405Wce2ifFKsInCNAt19Tpu+XyV+Jm3C0KQADg1RINxhn3518hLJuUcj4QuWoPl
         9VugenupuLV/07R77UZ+Y3FTqxL4LAsr8FB+/TAyJ4Pm6LXrqo78U1LFCIuYubfpWelu
         /4Ei8bkzt1tGNikbaTQ+31CwJLz+x2vaFAGxvmnwTd1/LiSZY+Dmyr14w8qn2yfZSzLU
         yccAnLknM7fe5pZZK4eKbTCSfoxWyv4egsICcYEY879CWpF0FlzKDs8Gf91/xMFUe+DC
         ypzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794507903; x=1795112703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzBmIcpghOYCP+r03HK0N7KGo+wgnlo6db5N340fGPI=;
        b=BVkx6KPIfOrWlIonj0+rgg5nNJzXHoUbUSp0K8GIDNsrBudiOXyiZ7bRc1/kFjDdKL
         OaV7GFdm9nihZ8tQJ0HBcsVap4KpD8CwkJDhH3YJ7GB5uU0ou2fEc9w2wyVtIwnEZ1ru
         VFQG3ZiARBtjqYTMQCH392by9JNI3/ZSBMjD53m3SigBJ/VXbJ0+Wy3kC48n9W1Rqrrb
         W3D7CxIF7Hx1FDFcTWIAQzyifwjrGKJpVXBJe5chge/PzyPiUIhyA8ncy3uSUbN+7x+d
         8u7pWWY2vN9LN1DuqfxIWRi7aiGCme+FSuLDplzDNWtWDc3uQgZE4uucASTsXC90Dxd1
         Aifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507903; x=1795112703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzBmIcpghOYCP+r03HK0N7KGo+wgnlo6db5N340fGPI=;
        b=0DIeECjtVJESQjZAqf1Deu/ep75i+o56liUX8jeC+s1tYcGb6bRqUeLsGsT93YTL22
         A+MYeRxPc+cpQStK8bqCPOT3w+7OjNvAI1sEqGWUho6E9Kddk6OLhmCDv5eOUp4WD7dx
         0lAhNADV+PpjiBGtc8laFSnJymLe/zROTzOqx4YE5+yn/wbXbAbZKqc7Sio/nX6Y3429
         1XycgoOdcHRECjluTlrKNpwdj62VxVySPR4W/NHE4eMTpcx1DMtF6WhcpJUnJmuhRkLF
         mHfBgaeBYVD8Q5O2fboP232vvVDGOkb4arV0z86n1+roUMxOR84+9nMlskYEbn7bHXXx
         N5kA==
X-Forwarded-Encrypted: i=1; AL+hErH3Znfqec2Kahq+UDk1D2aUlriOfFwM+/7Ao/QPySBzECs2zBtbjd/bVg+wlUwspBeveclZT8dzciSdrog=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dh3FplBTGTN5MpTpfp8+jUDr73WXBHksRDk8raN4TbTHKjb7l
	IZVWC8BCze4ms7zZHQ5OkRFs+HXmq0US0/7yNEAw/wWOgG+9PfiaZe/8rnzi0iQI+ZwTA1zT/iv
	mxs7adKwHEX7/ILZq8YfGqVOydza/wxIBhgOt4iJaWa35wi/TkN8nhEZrcpc=
X-Gm-Gg: AYBFou3SVS7dh9CBDzhsPqpAgU5uRFz12rJHmntNjbV40gUIb5baVtfEZmcc+J8qbVX
	wIlvpHbEaq+Al9Dn8kJvCzgpx7j08tB5IxnUgAtovX0bnz/t7iG9PkHckSaT9Kd8fYIAKeZl3Gh
	4zQd6ap9uR0QHnbgzLfA2BTrn+IKyeZNegssgJtx5dlbeCRx4x7WgmS+O0EcEs7I+AUXVCoqXme
	BECcXe+WSZlyyP5Qn0AbJ5q03WmGm0Zi+Bfj3WnCf50hn1YzssDMXE5SRuwISVcLEy2FOT6YRCt
	TdIG8BCJI/PyHE1KKBTVPFLn8h42FwSnOUbFCkJWTeCVt0G5ZKuiK/8vKL6FL/wSefmdnO2Lvs1
	ZqdtQHHprD+1+Q+XWOhDC/Wa1a5RXCrXO/iPELR56knUgNf/yEkybVHZ/S2yFmJb9tw==
X-Received: by 2002:a05:6102:a4d:b0:7cc:828b:41f4 with SMTP id
 ada2fe7eead31-7d64db190fbmr4854137.35.1794507902539; Thu, 12 Nov 2026
 10:25:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103233909.1364531-1-dylanbhatch@google.com> <avVYkcbr6ah9IzYX@jpoimboe>
In-Reply-To: <avVYkcbr6ah9IzYX@jpoimboe>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 12 Nov 2026 10:24:49 -0800
X-Gm-Features: AclHuK-_TAArpRaO2jf5A6e-8RRqPo51or4oUVcum6Bw0xcFyHqgOMVe5Q1IMsE
Message-ID: <CADBMgpzH8Ogwvr6ORx5PebB=0-2gLNXM96U9=jKa5+PwnapjAA@mail.gmail.com>
Subject: Re: [PATCH] klp-build: Allow passing options to make via '--'
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:14=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Tue, Nov 03, 2026 at 11:39:09PM +0000, Dylan Hatch wrote:
> > Livepatch builds rely on reproducing the original kernel build
> > environment. Currently, klp-build invokes bare 'make', which drops any
> > command-line variables or flags used during the original build (such as
> > 'LLVM=3D1', 'CC=3D...', 'KBUILD_BUILD_TIMESTAMP=3D...', or custom wrapp=
er
> > Makefiles via '-f').
> >
> > Refactor the make invocations to use a common MAKE array and allow
> > passing arbitrary make options after '--' on the klp-build command line=
:
> >
> >   klp-build [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
>
> Does this enable anything that's not already possible via setting those
> variables in the environment (or MAKEFLAGS), e.g.:
>
>   LLVM=3D1 klp-build
>
> ?

Ah, I hadn't tried MAKEFLAGS, thanks for the pointer.

Since Makefiles override env vars by default I had some issues with
our internal Makefile-based build tool, but trying with MAKEFLAGS it
does seem to work. In which case, this patch doesn't really add any
new optionality.

I would argue the [-- MAKE_OPTIONS] still has some value in that it
makes for a slightly more intuitive command line interface, but that
is just my subjective opinion.

Thanks,
Dylan
