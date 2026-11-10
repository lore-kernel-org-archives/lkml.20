Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324389;
	b=dkIGO9uAZIwwb91zALhvYmW/EZZ/efTI/dRFmmw/sTTVsDtk9WothPN2X5WiA08Yibxf
	 wDylkEvrn5WuwAggk4/ZhIYzELuhAp4GqYCJNk0BK/4qjlatyGqfFOKYSBSzIUBVziNAx
	 D+nVKyACuxNAOgB73d+mrJuH4e2JaUr4refzBvmGIR2qUjK6YnI+MGxPiKtVZPTYBe8P0
	 d5c3JKzy9+1IE/hGKsocZj4IhSsAdv51nW+l8GfYpd8jbE5zkIJBsNxuAy4Yb4Lyt2l8G
	 eMMK+/pEevsvhVspfG1uQl7Z1sIVWg7+4RL4JjSvLgXb4+EjKZlmz4EitNe1U/mmXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=/rNbcmd5Epz0U56BKGmsQmjNGEGUDaMDB1UCVAt5F+0=;
	b=cF+WTLFQGPJJWv8ia3wVHvJQBmdBm74OkpQyBpk3hI93+zY4AqB5y+73FdN6Ci+LW5dE
	 5eVQ/l9UP8Us/9HL206kPvFC89bstl/0VNKB38MgVoY2KAPblAg7MXWyvz0DD82SyBo0Q
	 kqzZl0rpxAQ4ymI4nZhdduEg2JKUDk4CGjU9KpIY+wvlrAdfAv09I5PdWj9yqEP/ffZkk
	 54FU+eAozwyYwqcBtebu5KmTU5bvPc70gNEBA0ndK7V1+Sw72K3c0Je/ubZL/Oep1FwYT
	 PyB4vnXLnakKfueJw/zi14npCvHP7kaI2krCGy+Wwf4uSZzxmXZnsjSUtUitpxn6SyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqgTwFQi;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqgTwFQi
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3720addb068so3775689eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324388; x=1794929188; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/rNbcmd5Epz0U56BKGmsQmjNGEGUDaMDB1UCVAt5F+0=;
        b=AqgTwFQi+2CQFPekQGpLKDi7nwIXsMzIxoWcYCBH/m070P1LgJxZ6GwMR4PYTqzs9X
         qBjtpEOsiK9vwBHUkXLQ9f969C3mfRq1FE5axXC87KWbEnAc2Az0S7aVPPsYkdirD6l8
         s6FBT7x0KQDtbe174H8l1OpXuPaRs21fftaukgOVAu2OfGVw2Vt6uR9phVG01SAWNkli
         gA08X5heliottdsu7Kx/jNy7l1kK0v9V5KCZUMBw36rOMs+rHRXgG6lkz0FwMdQB08jF
         UMwxaE9x0uT0iIoL8oOPveVEAHyuIPSZWX8O799AwytgM5lrFzxbaIw1iXWF00/7q4Dm
         lroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324388; x=1794929188;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rNbcmd5Epz0U56BKGmsQmjNGEGUDaMDB1UCVAt5F+0=;
        b=lMWATh5CZSN2k3QsUhqI1rdOul209SfKGyJRvVve7YbqI9ppz3GoqjBFFk3b5UmQq2
         vDfv3NMkOH8IU+m8JA3iORcQlMjQ+ZwVvxHpUPtkEBwGW9CFkI1tO3uM2TZGxAMX4cJ2
         tyAoTDqTy+GGdplWigjt8uiq/9P2gLzUZdDjAOPuG9m2zEsgyDGM/u7gYFpLvxge9xoF
         iyhXoOTbOPG3UQH3JbaeRlvQLDYV+0fy2zDX69/nDwLqFYCjAElnGmQ9S08Bl3G+ZEiH
         Cz3357FOTK3XJpZzGcWGphBjtPCXrJsOgIkmONFxNmER3l0AJ5uZ21tLCV/xMsXoFgIt
         A1WQ==
X-Forwarded-Encrypted: i=1; AL+hErE+pUgnBXN6BXrgzb4WGKQ9jKfaWL6qPXPjR5E84jyQY+35G1Ft9i4nKuYPoHUIItFI8rNXriINA6RDc0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jfo6sJBkEOxcDgHAS4EHsn3dWXR58LVk7lmKLlHqKNvrbc5Et
	cP5l85f00NLAgXE1laXgbD3N4NHYOh/iYi647JzYstXy2NBs7cLMWer3
X-Gm-Gg: AYBFou2z2lV4TmA9gxOsTdwmJde3TcbSRYjGwf9dN7CsY1srGvDWcwrAoiVz/ApDo4Q
	AhSEJIGl8nnqKeCMyCk/Ywopc69r13La3Ay7u+BA3yYI4sMEWHe+rzEbCUgN6n2dWo8eA7eMIr/
	zuCydWGPN3EmKoWPAShOLIFIb+L2D1Zm5Qpr/yMPfXzDaUj7U1AzeIj02sHKRuy14z0kdFyazCy
	3XoI+479fjEI0qxWb3laYF/47fuIua3JSqKsbs1VekruHjau3MHXbt7CIHUYNHSQrzJtnSyXMe5
	il6reIrgFuxZoxTxa0zdEJsvgpdF5lJUjj9x1j2dgW6uBJBPBdCRHq+x5WEG7ZQeA+uNLnmNk0W
	vDOdNXlAkYO6CsCTHiGcZ08l8XW9MFopzrnIlX6EKE7dRpXGq71EoODOjMzVjTVo+bBqMavVjPx
	KohmRHfZvwdXvgzBFw3sowDHePVbZAi3wPTITAZLbIZ5ivOZc9DVCyDnsa/Ap/PyRaVcMoq2vEs
	zrv4GCh6c+TuDG08abCnBod7D6UFormXySvjGhfjPkzLsYxLLx4pNkG/X1TibrFJaEbRJPv2QgU
	yuQwV5cQaEjcdceRYfy0VnvhkqU=
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr3078818eec.19.1794324388197;
        Tue, 10 Nov 2026 07:26:28 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm8049288eec.20.2026.11.10.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:26:27 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Kees Cook <kees@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc/smp: Handle of_property_count_u32_elems() error in parse_thread_groups()
In-Reply-To: <20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org>
Date: Tue, 10 Nov 2026 20:55:05 +0530
Message-ID: <mrrg90a6.ritesh.list@gmail.com>
References: <20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Nathan Chancellor <nathan@kernel.org> writes:

> After commit 0af298e62e5c ("treewide: refresh kmalloc_obj()
> conversions"), there is a warning on boot for several PowerPC
> configurations in QEMU:
>
>   WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x174/0x1b0, CPU#0: swapper/0/1
>   Modules linked in:
>   CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc1-00262-g0af298e62e5c #1 PREEMPT(lazy)
>   NIP [c0000000006074e4] ___kmalloc_large_node+0x174/0x1b0
>   LR [c00000000060782c] __kmalloc_large_node_noprof+0x3c/0x150
>   Call Trace:
>   ...
>   [c00000000369fb60] [c000000000614ff0] __kmalloc_noprof+0x490/0x690
>   [c00000000369fbe0] [c000000000051308] _kzalloc_noprof.constprop.0+0x1c/0x74
>   [c00000000369fc00] [c00000000200b450] init_thread_group_cache_map+0xc0/0x2c4
>   ...
>
> In this case, of_property_count_u32_elems() returns -EINVAL because
> there is no "ibm,thread-groups" property. When kcalloc() was used to
> allocate thread_group_array, the multiplication overflow check in
> _kmalloc_array_noprof() caught that a really large allocation was
> requested (as -EINVAL was converted to size_t) and returned NULL.
> kzalloc_objs() has no such check, so the large allocation check in
> __kmalloc_large_noprof() triggers the visible warning above.
>
> Check if of_property_count_u32_elems() has returned an error and bail
> out if so, clearing up the warning.
>
> Fixes: 790a1662d3a2 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)


Thanks for fixing it. Looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
