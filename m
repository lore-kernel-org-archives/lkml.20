Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805AA3B38B5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707191; cv=pass; b=PA/f2m001Md3x6vmp9hPu2p8DtqzHtRubypXHwPT9XRoGylXGnUUdSTPHLBAVdJmNmPwD+fEefla7ALrPcKJvnwCx74s6uAOBthXLE53P+oeovk9qDFMvhYQrt0F2qHywsn8O+bsYOMV4w4CBOmhl+gFus9YlJiZJ6moSQRINVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707191; c=relaxed/simple;
	bh=rnEgyIrnoWAb/6e7ikS68CV0c8AIFbE6YdzRFLpZNW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4VSwFD/sLyDdDQ9xbRy6/BCrAeBk4auqtY1K1QxCZGi+hu3+sDe9qzp8J1198oyPYrK8YYcij2lKjPQs+pVECzqMAr0TcfBTbfGBJP91jffabKwjgyea0pTnHRCaljrMRDWHWkZqGYjzn315hrnK5vJCnuFQ0/Hls4fDlXRwuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akjqnORi; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akjqnORi"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939e3so2268127b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789707188; cv=none;
        d=google.com; s=arc-20260327;
        b=o9+wdKymuzp7NZM2ypIYdHkPFCkb8bIEo2iYEjkESclB5hh0YppTQde5QoNXG1Z2Qe
         9ZG/GRwMiUYWjSzv8z50ffbRSxAasOTkk5T9nK1vNm81ixo313NypKUYtQbPWN+tyuoj
         NFpJg50FH5Oe4dQDCg81zfKlJH3yIefBQqENuZz64TImHqKVGhyWTpFh57MKYUcedJCg
         L0n2FOE2+w0ISy3mCuba0XlwoyNhcMEvzTuDK5e5UTplHKfOzYQ6tzZVZGhDUvrrKORc
         DPe4TFTKK2KGev9z6qPXPGHoYyHCVWnM/sERJ7pIphRgdggBs3TfY6wb2+MIRnCF7S9Z
         mBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        fh=z+sWqY5rVebQAMS0A/FrBSJAspBR0zCm2buOk/MMJRI=;
        b=faPgP6ripk9oDKAh1frHukUCzBNKqaFi4X3y0Y8wTeamDSDTzmfeQ0IVwfBymUquQ1
         POGE1yf5Zaq8JbTwJXDZgmbssyY9kULwVaPCLQsMXdgfrTIDKBHIpzAl1ovTL2YfOzC3
         ySYSP7TL9qcjWVmdvwKnlDgKGLqDMbL9jP9E8TZVZVEGsCUvQ79s08vapvNOmtZoRO0P
         DnuYtyoxx1VT6MUxURMEOrIOXkN0Wt43zJkysYmRcqPuMMj/OSubjSAZl7GNbrhmWwad
         SrXbhQP1vYmcqTbm9/g93ryIIW4+ka0Yz2s8Bq/wKVFTePkDjWDEJUXTBIrqWh3GjJPb
         H7rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707188; x=1790311988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        b=akjqnORiVLb8forBCcs7QrY0gyIkEJQXCe3xAr5ZbcNnXSW8pqBTsATv5M5D2Mu3xm
         MVfhibf0gLTO18i3/eoB/gcfqBAuylDRLA9lL9wqLdnv69ilnJf6iAnVdwyWe+6IXSta
         bkZONWY3W+NAFDza7DVadSP32jq5lNgg+BZe8V6KD0vCStTZI5j9lpCIN9WLiULdu9US
         pPvl1PHCQcMA2OWV9UaeU54FQgHgmphf6Ri/uhwjwcy1p7PA5GjeLfl8aLjslvsL0We4
         x2jf2FkxUKV0YnUSQHZ4eaaitq4xG5dWLqbZOPkHLDPpTwE6aCZdmdCOtDP/HraGBt6Q
         A1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707188; x=1790311988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+CZ17DpPcTIMS3JOrKadGqKlhsKxoet5cv2gSH16lc=;
        b=D74KpEstYN3qP0PUl2LdmPwiODcHY32Rae68Y3KZZYAtBK91VvCNZoLuscjcBDlDO7
         gQqgeGRumf88xgeHecJYo6Sut6rPBrUohGxYaHSB8kNq3M9h+wtFM9/ezNN9nraahfLY
         rbSr5iD/8ejwa7VJGx8L5vaGF6OOGj/Yeoee229soF4DMer+uiMz9lSJIYgHtVJuqpUv
         VcmhAHOZz1oFOOkllqRlo1HHdHL5Q+jhoAuIpyXoELiXljIuBqevpH7iVucXDZvwXld3
         92JlXkMp2pDnwdoG8lggKxNtUhAdjbNa1Qi1wpnGqGL9APdccsiL4I1kPgYqSJuL3nrz
         f1vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwO0CcLdN5ZiGoE59NS7RSYMW9E62vP3aNwhM12/fvBnMV+Soi3NSHcvM1yOkOfg2zOm8zjYt1pe8se/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lRdHPg+McQS4K/2y8Z68fy8E33zqWBDLQo2gr15Ju1xCkD9cnL
	vl5/RExy9HeTRYpma2HEu0cVeFbOXUsNi8PI/vwG1sekzvnnDG+PwD4FNwbqy6ZUg3/eAPfmG3l
	r208XKzBrzpz9pZns6rFH7zesddgo7Kc=
X-Gm-Gg: AYBFou2IfnAMCMuT6QqU69ttb325rYObm11lOW7KryDXC173o9ME+sDD8DDc8I1cRXo
	8VaA3Q1gOkjS2hGpo8l3M88oQ5IRxLYMKvAFYhUu/EA5rtNhx6e4nJ/qKbeHOLAtFZG0i+P2AmD
	8s2aBqDOX7wMNOd6qfQQfigHwd+HVpOoXCnN+sD+uKM0S12K/MJKSC0lHBTOLFe2QATFh9zbMkW
	+VHGKfbo+LAgA1BmH4JmW23gtcBoTCddKZzeetElaZMiE6BJSskaufzXYbMAe2x9ki7DbSXRWI+
	fPYTGmWzPmPqoB4yphD03bt9q+/vwLx8BVe59/vGENEMDWQHTjeRkqdhxIwT44mUSAjXvARelp0
	VFGd3uLB86eEGDBOZKHfObwmk9Vpt150OvsjBkZ4RT9VX
X-Received: by 2002:a05:690e:bc3:b0:671:541e:2bc7 with SMTP id
 956f58d0204a3-6717fd8de49mr381411d50.58.1789707188354; Thu, 17 Sep 2026
 21:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
 <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com> <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
In-Reply-To: <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
From: jim.cromie@gmail.com
Date: Thu, 17 Sep 2026 22:52:42 -0600
X-Gm-Features: AcwNN1WDOVB-bJ1pAJB3qllpj7DcCDRyteoOendxDaWbzrIb47hYb-rm-3IA-rQ
Message-ID: <CAJfuBxwq83qUNd==gu+uK73guPfohN24q2-9iNamincgpt=EOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
To: lyude@redhat.com
Cc: Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:26=E2=80=AFPM <lyude@redhat.com> wrote:
>
> On Sat, 2026-08-15 at 11:30 -0600, Jim Cromie wrote:
> > When hardware or firmware initialization fails, the graphics engine
> > (gr) or device functions may remain NULL. Attempting to access these
> > during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> > results
> > in a kernel NULL pointer dereference, causing a crash when userspace
> > (GNOME/Mesa) attempts to probe the device.
> >
> > Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> > the
> > ioctl handler. Return -ENODEV to signal the missing hardware state to
> > userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> > kernel log without risking a console flood.
> >
> > RFC:
> >
> > These crashes may not be repeatable, they happened while I was trying
> > to build nouveau as a builtin module, with binary blobs in the kernel
> > image, on a laptop with an encrypted disk.  Gemini tells me this
> > won't
> > work, so I punted.
>
> "Gemini tells me this won't work, so I punted."
>
> I'm sorry, what exactly do you mean here? And could you clarify what
> LLMs were used for in writing this series? Code generation, analysis,
> etc.?

Gemini CLI v0.50.0 - or earlier, at that time.

these were drive-by patches I did while testing a patchset on HW.
The bootlogs showed a null ptr splat
I threw the logs to gemini, it tracked down the bug.
the null ptr b4 deref was rather obvious.

at time of writing there was also some FW churn going on,
and it felt un-repeatable wo screwing with fwupd, which I wasnt gonna do.
Plus the test scenario felt like it gonna fall apart.

Since then Ive been merging it into builds for HW installs,
I recently forgot to merge them, and one occurred immediately

Sep 16 22:53:28 frodo kernel: Linux version
7.3.0-rc3-rhx-00051-g3078971ab959 (jimc@frodo) (gcc (GCC) 16.2.1
20260819 (Red Hat 16.2.1-2), GNU ld version 2.46.1-1.fc44) #>
Sep 16 22:53:28 frodo kernel: Command line:
BOOT_IMAGE=3D(hd0,gpt2)/vmlinuz-7.3.0-rc3-rhx-00051-g3078971ab959
root=3DUUID=3D66f47421-b9ff-49ca-9257-0216463436c2 ro rootflags=3Ds>
Sep 16 22:53:28 frodo kernel: BIOS-provided physical RAM map:
...
Sep 16 22:54:53 frodo kernel: BUG: kernel NULL pointer dereference,
address: 00000000000000f0
Sep 16 22:54:53 frodo kernel: #PF: supervisor read access in kernel mode
Sep 16 22:54:53 frodo kernel: #PF: error_code(0x0000) - not-present page
Sep 16 22:54:53 frodo kernel: PGD 0 P4D 0
Sep 16 22:54:53 frodo kernel: Oops: Oops: 0000 [#3] SMP NOPTI
Sep 16 22:54:53 frodo kernel: CPU: 2 UID: 60579 PID: 2445 Comm:
gnome-shell Tainted: G      D
7.3.0-rc3-rhx-00051-g3078971ab959 #10 PREEMPT(lazy)
Sep 16 22:54:53 frodo kernel: Tainted: [D]=3DDIE
Sep 16 22:54:53 frodo kernel: Hardware name: ASUSTeK COMPUTER INC.
ASUS TUF Gaming A17 FA706QE_TUF706QE/FA706QE, BIOS FA706QE.311
11/06/2025
Sep 16 22:54:53 frodo kernel: RIP:
0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
Sep 16 22:54:53 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
00 48 8b 80 70 02 00 00 <80> b8>
Sep 16 22:54:53 frodo kernel: RSP: 0018:ffffd36e025dbbb0 EFLAGS: 00010202
Sep 16 22:54:53 frodo kernel: RAX: 0000000000000000 RBX:
0000000000000020 RCX: 0000000000000020
Sep 16 22:54:53 frodo kernel: RDX: ffff8c547be52600 RSI:
ffffd36e025dbc50 RDI: ffff8c545440b800
Sep 16 22:54:53 frodo kernel: RBP: ffff8c547be52600 R08:
ffffd36e025dbc50 R09: ffffd36e025dbc50
Sep 16 22:54:53 frodo kernel: R10: 0000000000000030 R11:
ffff8c5454600098 R12: ffff8c545440b800
Sep 16 22:54:53 frodo kernel: R13: ffffffffc31569e0 R14:
ffffd36e025dbc50 R15: 0000000080306453
Sep 16 22:54:53 frodo kernel: FS:  00007fa46fa77880(0000)
GS:ffff8c576ab7a000(0000) knlGS:0000000000000000
Sep 16 22:54:53 frodo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Sep 16 22:54:53 frodo kernel: CR2: 00000000000000f0 CR3:
000000011df78000 CR4: 0000000000f50ef0
Sep 16 22:54:53 frodo kernel: PKRU: 55555554
Sep 16 22:54:53 frodo kernel: Call Trace:
Sep 16 22:54:53 frodo kernel:  <TASK>
Sep 16 22:54:53 frodo kernel:  drm_ioctl_kernel+0xae/0x100
Sep 16 22:54:53 frodo kernel:  drm_ioctl+0x2e0/0x560
Sep 16 22:54:53 frodo kernel:  ?
__pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
Sep 16 22:54:53 frodo kernel:  nouveau_drm_ioctl+0x58/0xc0 [nouveau]
Sep 16 22:54:53 frodo kernel:  __x64_sys_ioctl+0xb9/0x100
Sep 16 22:54:53 frodo kernel:  ? do_syscall_64+0xfa/0x470
Sep 16 22:54:53 frodo kernel:  do_syscall_64+0xbe/0x470

if youd like, I can trim that part of the commit - msg
or just edit out the noise.

>
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
