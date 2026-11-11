Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794396644;
	b=WJzhLyFilXfQeTBdy3olZ2suDpYxnXSEECGdp84YR4/sJHad+7KMNC22Y04hIwxguGya
	 74GLyb0iD0Cgxbigac+MnrTqtlWDN/uGHMMUaw/8O19szqZFKxkKeSE3zuD8Ma0tFFh3G
	 W3dI82g1SZ7FV6mgCFWn2Mk1VrW9XeZvujGk+yKbwzPa20s3dCxNvd5OiZ4bvZskjVK2C
	 8418qQK6BCmUUfr9HXiyMDYz3PPGOuFUyioJaLFv55czK+NQ7ZkB/b+ro5nmByn/6a4wp
	 TYwKDIuecWGNyT46nOjqmK/ZRWsCF3lVggTKELB4dRXgUWchnuabjIpCABb6SJVxKHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgfkhFQDE5XUrpu/BniOwomSfmu/mN0hFz5scbETrso=;
	b=UDfQrWuFCaU3IfgTpWmjhTV7EH8uNtGrwjjUN/Tf9o0ofYYpanygM4EblHj7xB7MYGUp
	 fGGP55LKvXax9wherqpZGCVZlTRDw3Z1Mdfj+p0JEMD6e2UZAgj8VRA/1f4q6luFVX7bz
	 8xH0MKMspouOH61LJfSkNH8WBzGHR6VpetrADDysv20FreMHkPVNxXTKTUC6JBGBnrRrN
	 ylLQL9LOopkHR6bhVnsrNHg/+0WRbyhns6kjoYC925C5UuED2Y/CLgFvP0ADLshKmX3ie
	 AhUa1XBoN9rSyoitlYPeYCyl4tZ6mnOfTZJO6iqgbPS6vxDDQcg9Ywuah3TGS9ReBFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NS36bZU2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A6606A887
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38A6606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NS36bZU2
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so2892635f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794396642; cv=none;
        d=google.com; s=arc-20260327;
        b=DQoYnFDAzvcqE8t3CYt2V9sVvL/Sje2CnyPk4oRlkQ+94nMMTfEMxSi8DAJLDpNX22
         LZeYwNO4c04htawetJ8K3yj4QNw+Pwjxir2h69sgIvfLrz3ohwlniwzZWDgxkZEC8erP
         4DOX8J90lKIqiDK57fcSv4D51Oc6lo2oRIfn3DZJHDsS3Rd2XUBZUHfgMZtFSYR+opGK
         rrcFqAJhrbKCqQeiPH/Av8JVJaSj7CK9C3Ziul0N5FAxUpph0S+UKh/0SzG8DGRNtF3H
         2FiXzpa0zDDYCUuOJgaEz1g+DEL/5vCAlfn2B7aPSigq4U/7AS4UCBJiM/spbHKii8Dc
         /f6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgfkhFQDE5XUrpu/BniOwomSfmu/mN0hFz5scbETrso=;
        fh=je62G1xrNDehta0KAGJcN1uk4E6Gzainrysb9CLI4YI=;
        b=JzQPoecC7PTcTT5pwbMpkCsrDg5pTi7Bd/6YPp7hy6wHh9bwTPy8s9Chi8xlRt341T
         +fyTdrTXNWVUZrNdRWQXgOZ6hoMtJcDNDybDe7a12drm1vgx5LGIe8ON5kUWb7+rODXa
         OreRSUMDQCEmX615nMLmAdpeGTlslxM9Sc26NS86Nc8uP2PXiQQlSiPNyNEHHzvmXaFY
         bYA1QeZKhN2Yj5DzBAsZa251EnJNeb8Ep0dQGWVuLbEhrbFOJKKm93zNpg8OtkuMIQql
         /Qaeoh3qKWDsrSgZtxGi1MGzZaIjlB+Rtk/0iTCfLt7McvW+oH2d6joeW+qtLdy27PAQ
         M5lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396642; x=1795001442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgfkhFQDE5XUrpu/BniOwomSfmu/mN0hFz5scbETrso=;
        b=NS36bZU2Lp1nN7SgynVLZLw4RRYvh4TfXs2ptYnXHx49pXVEMx3uN77gfrFOQhYpcB
         5td1a3OO3EVpbd7NH5diznNdsyfLhj2pKanFjQwiIQn8bkXHD1EeLwpczd5dyqwe6vQr
         b5dEPkX0QnkeAesn6bi2CyOnDQ/IuCKZ/X1Na59/S+5rLThdGSTshxLXGW4iDIMQbCsU
         RSfWXBJhHFQtmGK8s6lXVMPhXtLakPBe5Y52OLtdksA8f/hEu/Vik1a8HnfGL7b50vji
         xzSPZoyGJQaXLaUWK8aIwDVBTvm/L7huiIZ5ayuxrevfLOyzBV/O2jHCTsWh1nzM/9Vh
         qXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396642; x=1795001442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgfkhFQDE5XUrpu/BniOwomSfmu/mN0hFz5scbETrso=;
        b=xl35SzrTkuTghtECz1yUf3kRbHgQ4HyZ0Z68GrqYUZaNGx2Dojot43r5DCSjKoQIeP
         +erVH3SKjrXtBbTxoKgJCPKs0O4OLk/X4tPv3G8CZi6KaoX3evCMt6IWDaJN0lVpjqNp
         24DKOKUEPx2FZulzB/q+4X4lYMcRKMTt80MSbs7ijc8skU5UgR/q9tPMqLOk2af7NDJp
         mA8zgEX3gy3Dra9Ux2qvNz5byVNgykQ5qcLZliXzBHG50fnHcFJHLcYStPuO20Lm5U8d
         vGrAnHV8eAVcyzMu4E/ZK3sRwVkH/ryxfBc/+IpRMxImNFE82iHteD3k4w4P0bzVb9uZ
         2uTQ==
X-Forwarded-Encrypted: i=1; AL+hErHXTHbhKFvGf0yW/65eajTB2Zkq/GyFRS9Z6wEkFokFc3vGJWSQkN47BGiJBbb3RNmcq0R3s+4UN5ak9BU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hfUPi/0Z1RErLMSNHQl81oCGgv64C7qeA07T+rbdzFQt5d5B4
	mbBUgzi4dNwnbyOI8b62sLt7pgZXDbJl7MWFmc4yFvkQ5YqOzKFoadbNGyyWf7huQ5ib/h8QZi2
	eC5hxij4CQLErYzVZUXH3z82ROu2TSV/6OYoi
X-Gm-Gg: AYBFou0XIW+vwLnh17p/uPWI5DGrJJcuo1mlEQdjUWG+lUjBS9NvMdAv0dFByptpmtL
	qifg6HXzNXqKICEhci5SiLo9UAbVU9UJzm1pC0y8J/8KecTgHerwJtnAWp8KQU82bBu0CUCplwC
	6s6Z3QbvhxxkAnSs+SBzblZ6XMjLW4DN3qT3IXSAVkDJ6tuw+QcIOOcvAnDaUyixYUCRVyZ5a4Q
	zfZpewHuCWaiE6OidKa6vN8YPshdZ800+iJgTl1sjSlG0AcRmTObHn/2psfVXHb0PEXS4Ny7qDl
	OusZ9SffdlyAlqyELkIEYGhQCjXP44h2NgVT9cIBthUNfEseAm57Yj30dA/ALd3hYf15J9uBWsw
	4JZkgEFX3WlG7wGvcpnzhv23u0P0T2g2f1BE+GAh1yqIEwE5bEAtj8mpYD2Q=
X-Received: by 2002:a05:6000:4a09:b0:48f:e879:5890 with SMTP id
 ffacd0b85a97d-499c7368708mr3693601f8f.32.1794396641750; Wed, 11 Nov 2026
 03:30:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923060924.45742-1-syedtayyabfarooq08@gmail.com>
In-Reply-To: <20260923060924.45742-1-syedtayyabfarooq08@gmail.com>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Wed, 11 Nov 2026 16:30:29 +0500
X-Gm-Features: AclHuK8l6XMFWNrCKlt8GZ3LUscrj4Ss66FjgXR0gQdCuuxpBLlr3WsNlgeFcLo
Message-ID: <CAKD4hN5rOFCczzdBzgyD15EWvcgK=KRgyXihqfE-hd1XydnLKQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: fbcon: Fix KASAN slab-out-of-bounds read in
 rotated font buffer
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Morton <akpm@osdl.org>, 
	"open list:FRAMEBUFFER CONSOLE" <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER CONSOLE" <linux-fbdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to follow up on this patch, if anyone has had a chance to review i=
t.

Thanks,
Tayyab

On Wed, Sep 23, 2026 at 11:10=E2=80=AFAM Syed Tayyab Farooq
<syedtayyabfarooq08@gmail.com> wrote:
>
> The root cause of this KASAN slab-out-of-bounds read is that fbcon fails =
to
> reallocate the rotated font buffer (par->rotated.buf) when the font
> character count changes but the font dimensions (width and height) remain
> the same.
>
> When a user changes the font via ioctl(KDFONTOP), fbcon_do_set_font() is
> called. If the user first sets a 256-character font, enables rotation, an=
d
> then sets a 512-character font with the exact same width and height, resi=
ze
> evaluates to false. The function then directly calls update_screen(vc).
> Notice that fbcon_do_set_font() never calls par->bitops->rotate_font() to
> update the rotated font buffer for the new font. As a result,
> par->rotated.buf remains sized for the old 256-character font.
>
> When update_screen(vc) is called, it eventually reaches cw_putcs_aligned(=
),
> which attempts to read the glyphs from the rotated buffer. Since
> vc->vc_font.charcount is now 512, vc->vc_hi_font_mask is set, making
> charmask equal to 0x1ff (511). If the text buffer contains a character wi=
th
> an index >=3D 256, src will point out of bounds of the old par->rotated.b=
uf
> (which only holds 256 glyphs). The subsequent read in
> __fb_pad_aligned_buffer() triggers the KASAN slab-out-of-bounds crash.
>
> To fix this, fbcon_do_set_font() must call par->bitops->rotate_font() to
> update the rotated font buffer before calling vc_resize() or
> update_screen(). If vc_resize() fails and the old font is restored in the
> error path, rotate_font() must be called again to restore the rotated
> buffer.
>
> This pattern of updating the rotated font buffer was previously establish=
ed
> in fbcon_modechanged() by commit ef7656e85f1a ("fbdev: Fix out-of-bounds
> access when rotating console after font resize"). The fix applies this
> exact idiom to fbcon_do_set_font(). By placing it before vc_resize() and
> update_screen(), we ensure the buffer is correctly sized before any
> rendering occurs. Checking con_is_visible(vc) is also correct here, as
> hidden consoles will have their rotation state updated later via
> fbcon_switch() when they become visible.
>
> Furthermore, by calling rotate_font() again in the err_out path, we ensur=
e
> that if vc_resize() fails, the rotated buffer is restored to match the ol=
d
> vc->vc_font. Without this, restoring a 512-character font to a
> 256-character font on failure would leave the rotated buffer sized for 51=
2
> characters, which wastes memory; or worse, restoring a 256-character font
> to a 512-character font would leave the buffer too small, causing an
> out-of-bounds read later.
>
> Fixes: e4fc27618b75 ("[PATCH] fbcon: Console Rotation - Prepare fbcon for=
 console rotation")
> Assisted-by: Gemini:gemini-3.6-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dbf4020519fbd94b2355d
> Link: https://syzkaller.appspot.com/ai_job?id=3D59f0d7d9-607c-4497-b2e2-0=
b16693f9502
> Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/=
fbcon.c
> index 01715873ea49..158b2f91d68e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2432,6 +2432,13 @@ static int fbcon_do_set_font(struct vc_data *vc, i=
nt w, int h, int charcount,
>         else if (!vc->vc_hi_font_mask && charcount =3D=3D 512)
>                 set_vc_hi_font(vc, true);
>
> +       if (con_is_visible(vc)) {
> +               if (par->bitops->rotate_font && par->bitops->rotate_font(=
info, vc)) {
> +                       par->rotate =3D FB_ROTATE_UR;
> +                       set_blitting_type(vc, info);
> +               }
> +       }
> +
>         if (resize) {
>                 int cols, rows;
>
> @@ -2466,6 +2473,13 @@ static int fbcon_do_set_font(struct vc_data *vc, i=
nt w, int h, int charcount,
>         else if (!old_hi_font_mask && vc->vc_hi_font_mask)
>                 set_vc_hi_font(vc, false);
>
> +       if (con_is_visible(vc)) {
> +               if (par->bitops->rotate_font && par->bitops->rotate_font(=
info, vc)) {
> +                       par->rotate =3D FB_ROTATE_UR;
> +                       set_blitting_type(vc, info);
> +               }
> +       }
> +
>         font_data_put(data);
>
>         return ret;
> --
> 2.43.0
>
