Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572571;
	b=kivTkaWl6pH/+Y+4+OV+T4KN/B7NPS9/A2hKHUMu8jbUwuEtG4hHGoneR5WFre/Dv1SQ
	 ftx+s2bcP+eW8MO3J6meu/ygwEBmsiQ9m/2j0E85ikXvpQFT5qiear2B61PUUcgZbgCYU
	 DTJydCjn3zs7xd81VPFHp0E4uLNdj1lA0IVuT54k8b8ml3lZYGGvOPq6ETGae2xv3cMlJ
	 BXckC/ydo69fJgCN2YU/JXDKBeT8t6mW/PQRVsYGPO3OoYQ9+MrobMDTh8GW73XMAJ/Gh
	 YwbtvDd1Wi7swHPXDmqdVm56+CA64MjpxAr1yA6BbRn4BlqB15E4Y+2f0O4ax/dMr4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572571;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=BEs1T6eGVRMqoqkfx4PrUPG/Ol/brz0In30AXV2t9ms=;
	b=uzPMyQSML7RqpTBxCQjAPWJzYlF7RIvFjbE6rrdnYNoCA/Phzm5q40bh6qNWW8YKVym+
	 QiBiqp1hu0/7rpJnet2m6B/Gqgx6T/z/ww503OxrJy5Q7Iikte3NYOlXDK8kicc77EmDC
	 WZN9sdFV+1yKOxqVagK3ulO80CPz6nL7he0+UBJ/tYS5x2+HUDMX/v7PMmomKAwgi0XFP
	 T3IcyrNebH8RLjtCUMNDwBb6IIrvwOdi048gkW5PHaFzdHqGB2YhAb4xt7/OQw1dORxuN
	 muIWFF0p81gcJnV0PF3OeMx1tKQZGNJ90yrWja3siffywgSoNUkG7129kIZYqXGU38Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BmMXwOB4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ov8AhrSX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E760A2635
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5E760A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BmMXwOB4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ov8AhrSX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794572570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BEs1T6eGVRMqoqkfx4PrUPG/Ol/brz0In30AXV2t9ms=;
	b=BmMXwOB4dBrmnkburZhek6xbL1gt58BmXDN2X5DZGQ0z9YIHXuz+qtYEwsV+KF28QeE6X5
	FTpLhAfnc851VWvPLuDKj7dH8Mti/SWI9/x4yRBcfRBFAf20LphYqTu9Uf15ri010g8mX6
	whUTKr6W9+9vZi7Ov7P7Szq3xWj4UYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-i8sQrmlmOuWBdi6j75fCdw-1; Fri, 13 Nov 2026 07:22:48 -0500
X-MC-Unique: i8sQrmlmOuWBdi6j75fCdw-1
X-Mimecast-MFC-AGG-ID: i8sQrmlmOuWBdi6j75fCdw_1794572567
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so6107405e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794572567; x=1795177367; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEs1T6eGVRMqoqkfx4PrUPG/Ol/brz0In30AXV2t9ms=;
        b=Ov8AhrSXKlp9INNFYY+syMY1ZmuEmZIlU7PbRpSntM1TImbkhJenYnKCCGCGrdSafS
         iSwnVMAsDMJTRPWL+ny1qvQUU+h3IKgDSHrV66JKtyPrOsDLEwOcst0EKr+9u/7OY7MU
         DYUwEDoZwboKICoUoF0zjil8y45vzX4hmPLwj+8RQqOLJL3COY4Vvlh0XPs+6Pn9+pTq
         N+0WTqvcnpgD/ySECeGaZpHrvaY7fBC7kXBPOtipc7ye38Y8rs5Btut7bJsg7MptUNGm
         B5V6Xb+EkRshw+6qY1p/iHb0j/B4hsl0nOa5bNXAVijvJk6p9sRRXN78MPgp9e8XbMle
         wQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572567; x=1795177367;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEs1T6eGVRMqoqkfx4PrUPG/Ol/brz0In30AXV2t9ms=;
        b=lSvDqIVBAt4cyLkltRi8XnPzaQrw25w2GSM97zqwqZJakDDV3WELpAJP8APv0UPuS6
         VAI0BeZnLCSMxuARwFpfTW8quOmRA9Q3sowsBqdB4bQCetnmkT4R2lMVRuInyUnNxP1I
         gqHxTRpnBptuouZ/B0tidDvJyFQNkoWJPG/81nGlbKT60+Akh+h0kp5TIEQ95DFCL16W
         SeGBaj4BgCVAgtVWB5htlywWP7kSzIvlWWTbqnY/k30pqBpiHGIHLYJq0sQ0itBJVRRq
         b+nFugUNIyOBe9+b7q9s9kDzPEnX+cRQwId56BZm9kGxQLXZz96NjQ4P7g4l/kat+dHG
         W2tg==
X-Forwarded-Encrypted: i=1; AL+hErHrg+1gfA2Jvn1v0+P4Da7ysYaBZc/9GrtmSLTS1HuDihG2HgryXt20W6SfP8D/mv7sFg4S9e4iYYFMNlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85VM24abwWEymUo+kkZGn+O9KvKi8GZn2UDmRqi/xucTIWjMB6
	3IyIs9hdn+NVm1mbbJkt45YafzcxhI+1him6wrBtfa48bNs7ancxhxf8KFjARBbVrWjTxPtsKio
	ANNpTRkIcuWdlivipzVxMSInzfPSEcpvpUlapWuVaYLPRSEoqjOFA87PgHKcYPBarP3EP5IB7jA
	==
X-Gm-Gg: AYBFou2rbDrfJd50B/VBXRghmg2Q9f8Cddt3KjktCiwawJ+YLhN9muq9hHCgwfYUx0Z
	IS3p82XYYeuZ+dTJqFWmQmdKSeFNiK+38673EWzuQ3sdCrgRlwnKZ+8GQ7YS/pgPivilwE5TxAn
	o43YKhvKSo3DV209RD9fDzWgcCdyk8ELvd6cYvTxpSkXQ88iDVJDT+5J4tp7E6c235e9TPK+Ben
	y1XbHNfctaZVCUJWZoERrLYght8mZo3iql9RwWE0HutGThHC/hsELC8nuMQqXr5fEBBwqRPcCor
	cDA1UIubFIrajdYjRX2964wsKI7aibUHvVN5VqK2uaRgu84DFBUBpYQAqwRcItMzKtHoxid5Q+3
	9oz9rjNtMdqrYNLqensId1uQJuIHASq7JdLaOjqrRznRRn3YULsdV4zsCLyA5kQ7THGriJ/iX/F
	kTbqO50WKm/xoZ8c22WbNQMX7kJ3hvqk2+0ueOWBM=
X-Received: by 2002:a05:600c:6095:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb55abdb5cmr48384125e9.16.1794572566873;
        Fri, 13 Nov 2026 04:22:46 -0800 (PST)
X-Received: by 2002:a05:600c:6095:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb55abdb5cmr48383175e9.16.1794572566060;
        Fri, 13 Nov 2026 04:22:46 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm64579945e9.11.2026.11.13.04.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:22:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Piparo <holofermes@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Amit Barzilai <amit.barzilai22@gmail.com>, Mario
 Limonciello <mario.limonciello@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Piparo
 <holofermes@gmail.com>
Subject: Re: [PATCH 2/2] drm/ssd130x: Add SSD1322_FAMILY and move the
 SSD1322 to it
In-Reply-To: <20261029205751.3513474-3-holofermes@gmail.com>
References: <20261029205751.3513474-1-holofermes@gmail.com>
 <20261029205751.3513474-3-holofermes@gmail.com>
Date: Fri, 13 Nov 2026 13:22:43 +0100
Message-ID: <xlv1zevcsyy4.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Fabio Piparo <holofermes@gmail.com> writes:

Hello Fabio,

Thanks a lot for your patch and sorry for the delay with the review...

> The SSD1322 has been in the match tables since commit fdd591e00a9c
> ("drm/ssd130x: Add support for the SSD132x OLED controller family") as
> a member of the ssd132x family, which was brought up on an SSD1327. The
> two controllers share the 4-bit grayscale RAM layout and many opcodes,
> but the ssd132x paths cannot produce an image on an SSD1322:
>

Yes, I wrongly assumed that SSD1322, SSD1325 and SSD1327 were similar.
As you point out, I tested with SSD1327 because it was the only SSD132x
panel I had. I *think* that also checked the SSD1325 datasheet and saw
that were similar to SSD1327. But I did not check for SSD1322 indeed.

> - A command's parameters travel on the data path, as on the SSD1351,
>   so every multi-byte command in ssd132x_init() is read as a run of
>   single opcodes.
> - Some of the opcodes differ: 0xa4 is "entire display off" on the
>   SSD1322 and normal display mode is 0xa6, the multiplex ratio command
>   is 0xca, the contrast command 0xc1 and the precharge voltage command
>   0xbb.
> - A column address covers four Segments instead of two, the RAM only
>   accepts pixel data after a Write RAM command (0x5c), and with nibble
>   remap the leftmost pixel of a pair is the high nibble.
>

Thanks for this summary, it is very helpful to review your changes.

> Give the SSD1322 its own family, shaped like ssd135x: an init
> table, a Write RAM before the pixel data, a contrast command with its
> value in the data phase, and its own plane update, encoder enable and
> backlight callbacks.
>

I don't think that like this approach. When I conceived the per-family
split, I wanted to use the same "families" that Solomon chose for their
display controllers.

As far as I can tell, the part numbering depends on the pixel formats
that are supported by the devices. That is:

  * SSD130x: monochrome
  * SSD132x: 16 gray scale
  * SSD133x: 65k color
  * SSD135x: 262k color

So I would like the driver's family split to match the HW grouping.

Having a family for a single device would break this convention. Also,
your SSD1322_FAMILY reuses many of the ssd132x helpers and the ssd1322
ones you are adding are just a slight variation of the existing ones.

Instead, what about adding an .init and .set_contrast function pointers
to struct ssd130x_deviceinfo ? That way, you could for example use the
same ssd132x_encoder_atomic_enable() and just lookup the deviceinfo's
.init, instead of unconditionally call to the ssd132x_init() helper.

The same comment applies for the rest of your logic, I really think that
you could make extend the other ssd132x helpers to accommodate for the 
SSD1322 differences.

For example, having a device_info .nibble_hi_first, .segment_width and
.needs_write_ram fields for ssd132x_update_rect(), etc.

I believe doing it this way would make the driver more organized. But
maybe I'm missing subtleties, so I want to know your thoughts on this.

> The init sequence follows the Newhaven NHD-3.12-25664UCW2 datasheet,
> including its analog settings for the module (external VSL, precharge,
> VCOMH), with three changes: the display clock and the column offset come
> from the device tree, the contrast is the backlight brightness and is set
> after the sequence, and dual COM line mode, which the datasheet only
> allows up to 64 rows, is turned off for taller panels.
>
> Assisted-by: LLM

Please drop this, is not needed anymore since commit 1e035297ffda ("docs:
remove Assisted-by references").

> Signed-off-by: Fabio Piparo <holofermes@gmail.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x-i2c.c |   3 +-
>  drivers/gpu/drm/solomon/ssd130x-spi.c |   6 +-
>  drivers/gpu/drm/solomon/ssd130x.c     | 277 +++++++++++++++++++++++++-
>  drivers/gpu/drm/solomon/ssd130x.h     |   4 +-
>  4 files changed, 281 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index 941a2eb44c5..5b85d000c57 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -92,11 +92,12 @@ static const struct of_device_id ssd130x_of_match[] = {
>  		.compatible = "solomon,ssd1309fb-i2c",
>  		.data = &ssd130x_variants[SSD1309_ID],
>  	},
> -	/* ssd132x family */
> +	/* ssd1322 family */
>  	{
>  		.compatible = "solomon,ssd1322",
>  		.data = &ssd130x_variants[SSD1322_ID],
>  	},

This is what I mentioned, a family for a single device doesn't sound
correct to me.

>  
>  #define SSD132X_SEGMENT_WIDTH 2
> +#define SSD1322_SEGMENT_WIDTH 4
>

I think it's OK to keep this and then you could do:

+	[SSD1322_ID] = {
+		.default_width = 480,
+		.default_height = 128,
+		.default_dclk_div = 2,
+		.default_dclk_frq = 9,
+		.family_id = SSD132x_FAMILY,
+		.cmd_params_are_data = true,
+		.segment_width = SSD1322_SEGMENT_WIDTH,
+		.needs_write_ram = true,
+ 		.nibble_hi_first = true,
+		.init = ssd1322_init,
+		.set_contrast = ssd1322_set_contrast,
+
+	},

Please post a preparatory patch that sets the .init and .set_contrast
callbacks for all the other devices. It will be just set to the family
defaults currently used.

>  /* ssd13xx commands */
>  #define SSD13XX_CONTRAST			0x81
> @@ -182,6 +184,38 @@
>  #define SSD135X_SET_REMAP_COM_SPLIT		BIT(5)
>  #define SSD135X_SET_REMAP_65K			BIT(6)
>  
> +/* ssd1322 commands */

Just put it under /* ssd132x commands */, the constant defines
already are named SSD1322_* which implies is only for SSD1322.

[...]

> +static int ssd1322_update_rect(struct ssd130x_device *ssd130x,
> +			       struct drm_rect *rect, u8 *data_array,
> +			       unsigned int pitch)
> +{
> +	unsigned int col = ssd130x->col_offset + rect->x1 / SSD1322_SEGMENT_WIDTH;
> +	unsigned int columns = DIV_ROUND_UP(drm_rect_width(rect), SSD1322_SEGMENT_WIDTH);
> +	unsigned int rows = drm_rect_height(rect);
> +	struct drm_device *drm = &ssd130x->drm;
> +	int ret;
> +
> +	drm_WARN_ONCE(drm, rect->x1 % SSD1322_SEGMENT_WIDTH != 0,
> +		      "x must be aligned to screen segment\n");
> +
> +	ret = ssd132x_set_col_range(ssd130x, col, columns);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd132x_set_row_range(ssd130x, rect->y1, rows);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd130x_write_cmd(ssd130x, 1, SSD1322_WRITE_RAM);
> +	if (ret < 0)
> +		return ret;
> +

this for example would be something like the following:

          if (ssd130x->device_info->needs_write_ram) {
                  ret = ssd130x_write_cmd(ssd130x, 1, SSD1322_WRITE_RAM);
                  if (ret < 0)
                          return ret;
          }

and you could keep reuse the nibble pack logic from ssd132x_update_rect() here.
Just query deviceinfo->nibble_hi_first (or whatever you want to name it), and
use to decide whether to do (n2 & 0xf0) | (n1 >> 4) or (n1 & 0xf0) | (n2 >> 4).
  
> +static int ssd1322_fb_blit_rect(struct drm_framebuffer *fb,
> +				const struct iosys_map *vmap,
> +				struct drm_rect *rect, u8 *buf,
> +				u8 *data_array,
> +				struct drm_format_conv_state *fmtcnv_state)
> +{
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> +	unsigned int width, height, pitch;
> +	unsigned int i, j;
> +	u32 array_idx = 0;
> +	struct iosys_map dst;
> +
> +	/* Align x to display segment boundaries */
> +	rect->x1 = round_down(rect->x1, SSD1322_SEGMENT_WIDTH);
> +	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD1322_SEGMENT_WIDTH),

again deviceinfo->segment_width will be used to make ssd132x_fb_blit_rect()
usable for both ssd132x and ssd1322. 

> +			 ssd130x->width);
> +
> +	width = drm_rect_width(rect);
> +	height = drm_rect_height(rect);
> +	pitch = DIV_ROUND_UP(width, 2);
> +
> +	iosys_map_set_vaddr(&dst, buf);
> +	drm_fb_xrgb8888_to_gray8(&dst, &width, vmap, fb, rect, fmtcnv_state);
> +
> +	for (i = 0; i < height; i++) {
> +		/* Process pair of pixels and combine them into a single byte */
> +		for (j = 0; j < width; j += 2) {
> +			u8 n1 = buf[i * width + j];
> +			u8 n2 = j + 1 < width ? buf[i * width + j + 1] : 0;
> +
> +			data_array[array_idx++] = (n1 & 0xf0) | (n2 >> 4);
> +		}
> +	}
> +

And this nibble pack won't be needed anymore since ssd132x_update_rect()
will be parameterized by the deviceinfo data.

> +static void ssd1322_primary_plane_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_commit *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
> +	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_device *drm = plane->dev;
> +	struct drm_rect dst_clip;
> +	struct drm_rect damage;
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
> +		goto out_drm_dev_exit;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		dst_clip = plane_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		ssd1322_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
> +				     ssd130x_plane_state->buffer,
> +				     ssd130x_crtc_state->data_array,
> +				     &shadow_plane_state->fmtcnv_state);

Note how the only difference with ssd132x_primary_plane_atomic_update() is
the custom _fb_blit_rect() but as mentioned ssd132x_fb_blit_rect() can be
reused. So you could just drop custom SSD1322 plane helpers.
  
> +static void ssd1322_primary_plane_atomic_disable(struct drm_plane *plane,
> +						 struct drm_atomic_commit *state)
> +{
> +	/*
> +	 * Keep this empty function to avoid calling
> +	 * atomic_update when disabling the plane.
> +	 */
> +}

The ssd132x_primary_plane_atomic_disable() clears the screen. So I'm not
sure why you needed this empty callback. Can you just reuse the ssd132x
one ? Ah, you need to add similar changes to ssd132x_clear_screen().

That is, use deviceinfo->segment_width, check device_info->needs_write_ram
to send the SSD1322_WRITE_RAM, etc.

> +	[SSD1322_FAMILY] = {
> +		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +		.atomic_check = ssd132x_primary_plane_atomic_check,
> +		.atomic_update = ssd1322_primary_plane_atomic_update,
> +		.atomic_disable = ssd1322_primary_plane_atomic_disable,
> +	},

And this can all go away since the default SSD132X_FAMILY plane helpers
will be used for SSD1322 as well.

>  };
>  
>  static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
> @@ -1825,6 +2047,10 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
>  		.mode_valid = ssd130x_crtc_mode_valid,
>  		.atomic_check = ssd133x_crtc_atomic_check,
>  	},
> +	[SSD1322_FAMILY] = {
> +		.mode_valid = ssd130x_crtc_mode_valid,
> +		.atomic_check = ssd132x_crtc_atomic_check,
> +	},

and this can go away since are the same as used by the SSD132X_FAMILY.
  
> +static void ssd1322_encoder_atomic_enable(struct drm_encoder *encoder,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct drm_device *drm = encoder->dev;
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> +	int ret;
> +
> +	ret = ssd130x_power_on(ssd130x);
> +	if (ret)
> +		return;
> +
> +	ret = ssd1322_init(ssd130x);

only init is different, so the ssd132x + deviceinfo->init will be enough.

> @@ -1967,6 +2218,10 @@ static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
>  		.atomic_enable = ssd135x_encoder_atomic_enable,
>  		.atomic_disable = ssd130x_encoder_atomic_disable,
>  	},
> +	[SSD1322_FAMILY] = {
> +		.atomic_enable = ssd1322_encoder_atomic_enable,
> +		.atomic_disable = ssd130x_encoder_atomic_disable,
> +	},

Same, it goes away.
  
> +static int ssd1322_update_bl(struct backlight_device *bdev)
> +{
> +	struct ssd130x_device *ssd130x = bl_get_data(bdev);
> +
> +	ssd130x->contrast = backlight_get_brightness(bdev);
> +
> +	return ssd1322_set_contrast(ssd130x, ssd130x->contrast);

ssd132x_update_bl() + deviceinfo->set_contrast instead.

> +	[SSD1322_FAMILY] = {
> +		.update_status	= ssd1322_update_bl,
> +	},

No need for this as well.

If you do all this rework, feel free to add my:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

and I could just merge it as soon as you re-spin the series.

Thanks again for this work, it's great to know that more devices are
working with this driver!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

