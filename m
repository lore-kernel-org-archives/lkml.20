Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794004906;
	b=Bg0x5N6Kds2SSG7JtCK111s57imsj1O06yT79sPwFx9VachCMdVG/SOG2E1nLylEhSEQ
	 ASqWqr1wnIEsHveANl7gfaWy/ikHItT1rfrmEow6lIfm3cZCxvnR6rrpZFoDDnCtiG16q
	 9rKBMmDUEiCEGc0uCqvMol9lV4O99seu6xmOrlX1AfqET6JXYAVG9frvIuu9qqG6K5gfs
	 aeX3z5JjI0+LCNo0qwbTlt/dyD/9NwK4FdjC0lIN45mwZ9Db7KlalJCZZ8oz8NiY+wH12
	 XqT99+Zs39dzYs5PlREhBZymtIgPJAL2v5So2H7ynk8xn+s/bMHE1ucwLo84kNiVDlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xDdVmSgPWBsW29mq/W8l7c0d98Ur3czuYIjbAl/YHDU=;
	b=zx9YL4/z84Gitv57Z3uLgjy6hrrrQIlGYHANlhI6xfFlvWCQnttxZV6xTt+vA6aphiD3
	 wekCtW/h/xGrpFARXohwQSp2umMGzgtTD5oME1qPgrhnj+HAcfMK22Y5r/be3ULey0N1J
	 f/SeWv6hHjXmxST4apeaqB2YfdQiTCjtMWyfZyFv6NkBpKc91f1LkNedmSb208Fk9EqUh
	 y/4Vd/bA1wMcjXNOLib6gUhjagRiAqvgjOkRC7kDTAIC8WVCgc3wb4B0eQyVRJZcxKgUq
	 Vhq0luPmJfvGj2Cag5nRxANO809RNA9oLg61A2HrXmXMrEJHPwq1CI/F+PIHMoQTcgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyNR10nL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C30606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C30606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyNR10nL
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so575980a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794004906; cv=none;
        d=google.com; s=arc-20260327;
        b=h5DhWFV964VOQHr2L/FHvIM9VRs7oLbUjO2v/tMI3cJZpd7VLwvYmljNN36uedl/7U
         ojcErZkEP2bCvygtfs77qVPzdhONomcFL1lToLCio0GUyrrSb3CK36ta/HgK2yy5s7ha
         oGJubt8g6GBFShgDd8GEgUOSmnB6BRKX++kPbyv+nD746r7h/TFZ4/LmRCiaz56U2QJ4
         OIICH3QqUEOZGHOtLOt0nDD/j3BKU97tPBD9X5/swv3j8POAvVLgdoEPGVQa85YPsX54
         HUi9p2bNNqMsE+G2FtFBhLGHqCuafHKvVhwaXLiTBR9rz51D/Almn4yAfTNFuJRCYamP
         X7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xDdVmSgPWBsW29mq/W8l7c0d98Ur3czuYIjbAl/YHDU=;
        fh=Id+Jk9or3VcNphZZ6RXieVuch9CE4dDoprx8YXNZk/s=;
        b=le8SYNkv4RARsATAzpwr94+OO+7TP9pLx22aYdpzJ0opGjLH0qkvaYImdr/IprA85p
         1gHkiIoI84aEJqokPd8izBGA5r6W/y6mVbYp/myRqGtANVbTIiS2fIgpLjILhOVKkD0h
         gIsFo/CqYmkScmpxU6+tn12aOoJqszotyaPbvQ4hg3ocrq2Jn9aVhw8sA2VatojTLoja
         qegPqIggMZKwk+Jgpf8N3ME/WMVXEJ8sGNzccG59GsjDWBMS/PPc24I1M/i+qlvCdaw3
         RKXKFGxBa5ByyaG2bgJaKkfGNAp5lS+SrmJzkMH4NEZdOGVszp48HmfDx7w3E3SJdBQT
         FtPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794004906; x=1794609706; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDdVmSgPWBsW29mq/W8l7c0d98Ur3czuYIjbAl/YHDU=;
        b=zyNR10nL0R3mtb0Yu0fMWATzA3i+2ykM5nx5vK2gqYL89fhUcv0ZdpIhvP3yKIScsT
         U0yB99AjgJ2LKGbZvYm0Rx6hT38oMac7164iSSzORCSZQ60SUikYXZZJsl0FdTiClI3c
         wsv/DLQ1nPFHcPvCxuzcLTUoKDse6YbINpn+UD1YTqxBMieR+VyZ8lGcvgPn0pWipCfF
         dxhH8KQ8nezn1UYJ3hpLkIW0dpdHsVKQKjoK/CeQCO1kWqgZwUPaLszcSAXNArGvqcCY
         mt4j1iFTOG0Ta++IUz9G9nk3DxCp+ww61mSqhO3gXk6gSCbgWr0bOo2R55tUteDeLR6X
         4LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004906; x=1794609706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xDdVmSgPWBsW29mq/W8l7c0d98Ur3czuYIjbAl/YHDU=;
        b=p6yWB7mIrxTLjqtpp0+DRiHxMMBJTyMwWn5z88mV65yrv1Ht18zFjl5IWIyy6sdEri
         y5sqRNz2P96nGxH7yeyRvet+nrBWNy3sOHArwDpJnO1sLmAj4h0pEw1WNaJGxswaxKGe
         +xK1mUieA3OSTdqI0Q0MKURp/Iy6riBBtLnJABpd6GNpavasoKVBHwafXH4OKwd/UR9F
         R+N43XdXHwEQ+RbDV8+DWfH195l3aUuaKX/PI/tzSg1L2ap7N01mGnGpcvpVyvSGCBkq
         0KyWstQ4GDM/uz3X0vOhXhDayC+lvCe5ZcAp6MP5zxMU60XlZk0mnBlv4hlrsdRZbOpS
         y4+A==
X-Forwarded-Encrypted: i=1; AL+hErH+8XL1oEss0jZ32mtCdDKBze2sf2fGKuD24RHRu8jEnN1E5S0MFclBVsEQB+VGr0beHpn9yiDMFbSBzD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4g/z6IoffjUYsYEa1NGimQbmMkQvOMy+JUWItItTwlM6MfBlG
	4XOH3FZCcgoj2zhfk8dOHIv4O+CEmPhDpFV+RuCdr+/MoFW8Ud/dyp13prGLvOln7l2JPoHDHe4
	7RffJJn65Lqz17iYtTImHYYfdz8XUb+o=
X-Gm-Gg: AYBFou03xrvv9OKmN9UhTQkqdIYModMIrtAKw+H1wELywd+yw/deoM5CvHg6vGFq40r
	/vdlttb0rDSLwEsaYkEDEpx7wqt4wYHE4T0kBRAn3TsH55c0c5c5dd+xL9HlQ6nJNcy2b/8www7
	m0KEcYLussF+VsWKTw+/VJzLQqIX8yu0PYiBMap1N47sg7JCEcXfH7AsMP5F/g7OKxwhjzq+EuL
	pvMLpxJ30bvZPON/Oh+6sDqGcYT35qk5FLtuj0wYk3o7u5TFNuUP00H0YUfVzushVQgf93CsOQI
	D+mbC93JH+IrCXdWEl5TwoepodLYq9uaRKuTVakSzKdJjAkt4jdeDAt7in+aZVsA5VhFzcGmYG1
	w9OtjQ8X8Gz68wC6nhNc3oOIHGakSxHoH2gr/3QDzXNVULNm+CRjBYCapTrvR7KxeR6pcXpRmYX
	WQ3XBi
X-Received: by 2002:a17:90b:180d:b0:3ad:93b4:718f with SMTP id
 98e67ed59e1d1-3b0db722366mr3867947a91.65.1794004905717; Fri, 06 Nov 2026
 14:41:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-fl2000-upstream-v1-0-bb163ecb2309@gmail.com>
 <20261105-fl2000-upstream-v1-4-bb163ecb2309@gmail.com> <8387cec8-cdb3-4854-9558-16b0802ebf5c@suse.de>
In-Reply-To: <8387cec8-cdb3-4854-9558-16b0802ebf5c@suse.de>
From: Angel Gabriel Crispin Valdivia <angelcrispinvaldivia@gmail.com>
Date: Fri, 6 Nov 2026 17:41:34 -0500
X-Gm-Features: AclHuK8n8lF66XuY82ir_ixNmmEcpG6vcGXhy2GuvV7QuQd3jCyvVB0XxXfb-yQ
Message-ID: <CAOFFMboCd4As6F5RRG=NDkSkDufjK7KwZxfbMhONVKqOGwF6Vg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] drm/fl2000: Add KMS display pipeline
To: tzimmermann@suse.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

thank you for the review. I have applied all of it for v2 and tried it
on the adapter. One change has a cost that you should know about before
I send it, and the answers to your questions are below.

> I assume that XRGB2101010 is the hardware's native or preferred format?

It is not. The vendor's API has RGB888, RGB565 and RGB555, and the mode
bits I know of in the chip's control register are for 565, 555 and 332.
I have no datasheet, but nothing I have seen has a 10-bit mode. The
driver accepted the 10-bit formats and reduced them to 8 bits, because
Mutter renders in them.

v2 offers XRGB8888, converted to RGB888, and RGB565 as it is. I saw
RGB565 work at 1280x720 on HDMI and at 1024x768 on VGA.

Dropping the 10-bit formats has a visible cost here. With an amdgpu
laptop, kernel 7.2.11 and Mutter 51.1:

- With XRGB8888 and RGB565 only, gnome-shell logs "Zero-copy disabled
for /dev/dri/card2, import failed: drmModeAddFB2 failed (Invalid
argument) [...] format=0x30335241 (AR30)". mem_info_gtt_used went from
96 MB to 6251 of 6939 MB in under a minute on VGA at 1280x720, and was
at 1922 MB two minutes after boot on HDMI at 1920x1080. On an earlier
version of the driver, the same message was followed by a desktop
stall after about 30 minutes ("bind failed" in
amdgpu_dm_plane_helper_prepare_fb).
- With XRGB2101010 and ARGB2101010 accepted, there is no such message,
and GTT stays between 107 and 134 MB over 45 minutes.

This is Mutter's: issue #5101 reports its copy path leaking a framebuffer
per frame on a DisplayLink output. Its main branch already releases that
framebuffer, since 15 October, but no release has it yet, as 51.1 was
tagged on 12 October. So I plan to send v2 without these formats, as you
asked, and GNOME users will have this until the next Mutter release. Tell
me if you see it differently.

> How large a value could you write into the registers?

The register definitions I inherited from Artem Mygaiev's driver have
12-bit active and total fields, so 4095, and v2 takes its limits from
them instead of the number I had made up. I don't have the manual, and
reading back does not confirm it: these registers return all 32 bits as
written.

> Once that is up, do you receive interrupts? If so, it would better go
> after drm_mode_config_reset().

Yes. v2 only starts polling the interrupt endpoint after
drm_dev_register(), which also lets the state you asked to drop go away.

> I'm not quite sure what this does. It looks like it's code for the
> encoder/connector.

It makes the chip believe that a monitor is connected to its analog
sense input, whatever the input says. The driver keeps it set while HDMI
is driven, and clear on VGA, where it would hide the cable being
unplugged. The vendor driver only sets it while programming the HDMI
transmitter, and I have not tried that yet. It is in the encoder in v2.

> I think it's better to resume mode setting first before resuming
> hardware. Otherwise the incoming interrupt might run on a suspended
> pipeline. (Not sure about the resume logic.)

v2 starts the interrupts after drm_mode_config_helper_resume(), so no
event runs on a suspended pipeline. The chips are still set up before
it: the adapter may have lost power, the register caches have to be
dropped, and restoring the state writes to those registers. Tell me if
you would rather see it done differently.

Best regards,
Angel
