Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5B30E85B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330971; cv=none; b=Nc7WnmssPoHqTdPrmFMKY1hfMFU3xzyrg3yvjh3beexGqmnzuFXFvr0S1L999KKgY2snRWzTDYmM3v3rlS3kwsrflR8E/xS+KzUvy4SfQH+TWOYg9IdyeApbg107v2SjFCLabihfxxBdFSPlBxqgmTxlYxwCeWPt3oKSySVyu+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330971; c=relaxed/simple;
	bh=SJjF5p/ZDyMHTVt9OKuLlmGpY3+l1iTzxv1hT0WwQdo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qISyQYeLWgucNTCF8h+ZS9LTGsoSMekqZpNTaAYM7JAH34y0Voelu5wT/XJAoqHzhaQHfnTszOj2iHSbxGzw6MkpjrV4vTZJpvgF+PEGfrCkQ7D/YU88zoGuj/lZZbnfdA2R+i3UWJnojnlK/dMtglMG3eC91dO4Xz7KsSPihHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Ho0EJZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Ho0EJZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6275115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330968; x=1788935768; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dndd7gYsW7vJgSBytdiT+H9xhB6mbAnJCpsEkGAE7Ac=;
        b=B6Ho0EJZbDT8CjVZqNRunnY8sIf9JMFammrgO5zCLZxdVoG7UZ0u9huRZvoKJx9MWn
         lXTrmIXUv8ubydUeHqCmtqCcjjxEYR3T1DDJZt9yxsi0NBEvYNmSy9pj7VGzlMoqUZBJ
         cwwiyvVRQN1R5KQj82JgFqchOeQ8ZBk4Vg5XFoCKGv1gGHfENxQR+EjfKUQwE61IXm1N
         dEZeM7Uk/nS4PhWY/I16ut3fVFfUwOP+W4x5MjlS27F2jJ9wGcQpa0zwE11afFxpwpJu
         PIKApMEcmBNmiUFk7LrsH7KWqEA/T/4gDGLe0UIAxX4goIwuajKIlxtYMSuSakuwd0eW
         KM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330968; x=1788935768;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dndd7gYsW7vJgSBytdiT+H9xhB6mbAnJCpsEkGAE7Ac=;
        b=qmv9udbPboeFxgV8JxpQkKT55gTaSAQpJAk1DXrryQ7BkMFycVteiFJgvt+1mMIyX0
         ztx0X4QmZQebrhWcLko0TtXN4qYV1+1Kv4gShwiCx3pfa+bHtJbQD/+6+bpYuE0hybna
         8qGSO/P9tJZ1FiwydKV6ZIUrbvje8ui/WNrb5J0xdbVblQpTHDopHub2FLniF6WSAotO
         kPS6qEzsg8EwqlhdRZnBiZUE8EeexHtfY8hjBo0yKXD/1qBCzSiFPnWP1L2YebA/P/Uk
         HtYHXULpKYmZpazCH8gZS1uZS0ZWh3P0Slahu02hugl40cc6fpvTzCHCYpXgnfuTu6Nt
         EAyw==
X-Forwarded-Encrypted: i=1; AHgh+RojA18AKkJ2MpPzm2Sb5lzsUNGK9EQzqx1TUJoGywXhSIwStoxONAkNFAL9KK5RmIZJsDQn4LeUBGkgHkI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQGB4pDM6g3dz5R4gekC5VMtZs1KhsTe2wA1m+oDlJTh4obI9V
	B/xpmU6KzpRjVs3VlJiT7T96PiHmwWYK2/Q5q4sPN18EXQFmAojyGhlTiblp3ORkeEQ=
X-Gm-Gg: AR+sD11cJ6JZhz2J3U3FsfcaPVZHbmCRuO3DFsXqKPT7S+yZVKgk7+YA7qUw0xYyRQn
	A8czZNniMN02HtuBwD8NyjcmUlhmAEbm6GD0Ik0FUEpM+roJ8NPzEVxWYZuHk8oPRLD7OAVMakf
	CFPHNUiUHfA1U4P2YtCgXOTT0Zn6hdKdPC0pq/Y3VPbEdLg/XeCAbOpy5wJUXUlHJ65QBeNycgQ
	DNgj7CMAdl+ehn1NdbXUIWM2TYD25Cf5e29YOgsPXQ92A5rFisbnOSmUKBVnpwyl5QHzCPiXI/v
	0wGxfNQDfInm+nd1gJrrfT2Ejo7m1jUct3G8cYFMCBi4M5fRRp+ebFbnv6Dnox6nj5m3Yc+xm7u
	WTBo3Df6p6Mi4nssE8hN/JpGz2IH6BSWDMmXAWP+KhGI0g8ulG7QC15ok7OsHvPu4RRlObw4foR
	1jDQ5GbEhpjd1UvnDHgQMkkaAQacPrO9kxgsuFLxNHf7OLMGUsxXD6fiuLqSA+lVCy5xHJL0BNb
	4pUT+k7oit2pXmzEpCJLtsptSRseHhz+g==
X-Received: by 2002:a05:600c:c170:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49ce57f072fmr49595015e9.8.1788330967618;
        Tue, 01 Sep 2026 23:36:07 -0700 (PDT)
Received: from valmpani.valmpani ([2a02:587:f24:b00:967a:9200:4108:5b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce478daf6sm76906625e9.15.2026.09.01.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix double close of the
 ALSA devices
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Felipe Balbi <balbi@ti.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+df868600fe111c5ff79f@syzkaller.appspotmail.com
In-Reply-To: <20260731-alsa-v1-1-95eb93ba32ec@gmail.com>
References: <20260731-alsa-v1-1-95eb93ba32ec@gmail.com>
Date: Wed, 02 Sep 2026 08:35:27 +0200
Message-Id: <178833092702.758419.14598038877762182896.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788330965; l=1847;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=SJjF5p/ZDyMHTVt9OKuLlmGpY3+l1iTzxv1hT0WwQdo=;
 b=MTtgXtWG8L9XwK5/xDY0y+RWuias+3K9RWG+imEAtPb7nP1entgsByJkhISnM7HQxjs/Ky3gm
 nXDVL/3ww0VDt6s8fE0aHUgoiLxLUoqf6IvvDLoAB4o0t+CmEgTJWVI
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

> f_audio_bind() records that the ALSA files are open in the function
> instance flag opts->bound, but keeps the file pointers in the
> per-function gaudio card. Its error path calls gaudio_cleanup(), which
> closes the files without clearing the filp pointers or opts->bound.
> A failed bind does not destroy the usb_function, configfs_composite_bind()
> puts it back on cfg->func_list, so the next write to UDC binds the same
> f_audio, skips gaudio_setup() because opts->bound is still set, and on
> failure closes the files a second time. Dropping the config symlink after
> a failed bind closes them again via f_audio_free().
> 
> BUG: KASAN: slab-use-after-free in filp_flush+0x31/0x190 fs/open.c:1464
> Read of size 8 at addr ffff888045f01990 by task syz-executor659/5617
> Call Trace:
>  filp_close+0x1d/0x40 fs/open.c:1484
>  gaudio_close_snd_dev drivers/usb/gadget/function/u_uac1_legacy.c:263 [inline]
>  gaudio_cleanup+0x54/0xf0 drivers/usb/gadget/function/u_uac1_legacy.c:305
>  f_audio_bind+0x4a0/0x630 drivers/usb/gadget/function/f_uac1_legacy.c:792
>  usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
> 
> Clear filp, substream and card in gaudio_close_snd_dev() so cleanup is
> idempotent, and close the devices on the bind error path only if that
> bind opened them, resetting opts->bound as well.
> 
Hi everyone,

Just following up on this patch. It has been already been tested with
syzbot and the issue appears as fixed with this patch. Could you please
take a look when you get a chance?

Kind regards,

-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>
