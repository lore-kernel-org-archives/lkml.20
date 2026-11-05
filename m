Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872931;
	b=I+8Q2kg4Rn04etNthUbVBKaaqwF6WTgKB96WXgHD0bnG8DV/LhDAP/vHnd3wOg+pb2k+
	 s1h58j0Bf4kHBPS4diornJ8PSmyYHZ0G+C1dRAy68+S2aC3aZsr23TBspa+SyKATrVHMS
	 rvgqoC37I4mojb9eSdnUuxbLYnsdpKzup3exyinh9QHdhi/xQqcGSDmDjmF5ESY5U0vxL
	 af8gwHCkblT1eW3OC3Ac1XrLtZQWZFnP6aj4vxFRZ88WRLDVVF4xqlL1RHs3JSVZawhB3
	 uWQRpCIHA4kiO7sW5myWI8NcgKLoXuVWqpvXfurPXBdd/8aSuzh+VKMeL6qI77D6tEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872931;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
	b=GYxfJD2XD0BtCLoJa3JosznvV5DiJ8ABpsYyKly+oVqwIa55iLMOyA12trP21dkH98bT
	 FfML+q41z732WXVFAzs2QFMG3EXEQ3mI8VpxsgVyyaZ6CemYXZKxHtCnTXuDwWbfUDYqa
	 Mn7PIlSM9S0f2xc/4IYduYR/SJHb2IsPHgmGP+d/X/XMgCaT0ucpj+t4BrXSuuzvOQWaG
	 ldE0A5lutI4vhZlMLfuvSGpqaURqsN4NsmvJngHS0j2yQJXKJ2DMXN8LCMXeFUVbaSBMM
	 A6XyA0Q4TTB4O7MOVmdDNFuzuagENQYLnd3FE8edODBcrFOxW0nRZQ9xRdHaPqoOP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-84e513874f8so1243925a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872930; x=1794477730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
        b=Npkt7CnOqnVvWV9RkSlAFhXuUFMrMhIpfnkKC3KOEmtK+k3CkoYBXE7o4bsKPSTnmX
         L+v9d73Jk6cPvOwUsTSvrMG8Aq9XbBGC0WnIEEqgE1Vm7BMYkQFP2xWpX2kqa2GEs8Zd
         cevTzRQFGnmjmaDgm2GpIhsFquWCOsf2ykc/RghwlO+h+CzuaaMpi+M3RzQicm82Cb9R
         lPG7bLyudgTvZqBAmyI1ykKXItmwSYdv3TkgOlcihEKf4dipBtlP2Qdpu7KpMENZOP3d
         vhwtxZZ3f/Ra4a2lQhwguwDQTr2Q8ko4lbQ9QtsPaxmIj7Z+2+E2Mmf9bTWMOP8XKjFY
         1TMg==
X-Forwarded-Encrypted: i=1; AKwUvBxV99D9h6QrnqiH9klutTHaRDSHgI/8OvV3pcyEt+gOROLsz2tljQaxz6fVPY5H3Zc408i8RyVRq3WTgT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yrnteQWBlks9QvDTP81KjNK9gubvTRU/g6p7m7H50YO2Fohul
	I6snxvWfWAOIFiHGZo1fSPph9cSJyUwXk7qZ/gGv3gxYY7CXtg6oXEijWmcji9WDxtc=
X-Gm-Gg: AYBFou3cRRqiW5PfI5t3hLNPmfJ0A+eFUPNUT6AblEFNCeu6aGVyPvyTm3Yf1hoQQEj
	XpAmnfjY0txGUKZMFrJGmQ717nO1rxgvmYjWsYkahdnqlN9Kv9PdhROiFn+JGGFfl3fSfKzt3VZ
	xH/9UNKakxXZco1oUu8i85SobwB9Bqy2tLF6yE1ME8U+aJyK6YhtVuJv68aW18jsiuvmwi/3urx
	dHJsc9zSYIqKSVvKB5lVm1YR02JnFim+RGqu/fBjWzH3j19wAF819fEluSF1ivmEBBg3bJxHLgx
	ZDLyC/VpLUGKWjGaLOLFNfLzXre4V32LhU6zuYRsW3BesWrpEZ10EC1Vun14p+DH0WyjgbYzNEi
	s1Ciusm16haR/Ra1krjl106Rwp509nWBLIdJaRwYPKeN1AgNWpF67fCm2DFj7Dsn4RW2umsCEh3
	2WqLrG2eVVJDKof1YJ+jyPzShW2RCm0/P/8a1gYiCh7SfFhutB43qjzztnYfCtdi1UIz/nnPORu
	GHsTetyNAUGJCjNVo5ox+6GvmfSqRc/IVKpelAOU5rZnH1LjHQZSPWRlyNqP9DnCry+lCcr8a4y
	jYmoA0TTRQ/3V1sd+dIsBGisblF36p6GqBjReADyv8NvNSNIPQJKkLeVv+eQzi7b+79rEg==
X-Received: by 2002:a05:6830:4487:b0:7f4:d16e:45f9 with SMTP id 46e09a7af769-85d364bb459mr16189321a34.7.1793872930329;
        Thu, 05 Nov 2026 02:02:10 -0800 (PST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e0e964sm4188681a34.13.2026.11.05.02.02.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:02:09 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4d198f1a591so982176b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByB8d1nxVzFfVnQVCbHEKPysyqIJI1LBWH03Lxa1LgUcV0LKoPqKhlt2rVEpx+V06WEXXtooHeHYopnt30=@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr8218716137.13.1793872596997; Thu, 05 Nov 2026
 01:56:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-cleanup-v2-0-1e6687e226b1@kernel.org> <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
In-Reply-To: <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
X-Gm-Features: AclHuK_YSG69l_UQ8CXymziWm2hhXR-Ce9gvdG6ZGXmuBEE26IV_RBgt33sxH_I
Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] proc: drop the _buf suffix from the new methods
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 22:16, Christian Brauner <brauner@kernel.org> wrote:
> The _buf suffix told them apart from ->proc_write(), ->proc_read() and
> ->proc_ioctl(), which copied to and from userspace themselves. Those
> are gone now. So drop the suffix. ->proc_write(), ->proc_read() and
> ->proc_ioctl() are the methods that work on procfs' buffers from now
> on, which is what kernfs calls its read and write as well.
>
> Done with sed. The flags and helpers in fs/proc that go with them are
> renamed to match.
>
> No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

>  arch/m68k/kernel/bootinfo_proc.c                   |  2 +-
>  drivers/zorro/proc.c                               |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k/zorro

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
