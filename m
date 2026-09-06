Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F48246778
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659365; cv=none; b=uSxSRRQot9vwtWoIeEPxXFVe2yypB1yO2hdyjG/8+IUleGzSz49dDrR82g7Jk2oYimRdzc21Rh86apizFmdetIwidDoXuuJmso+L92J820NUqWmMkgl4bVv3WgDAyPsdz5U7LOscFsDXkR6r5w586T7tapQssSLfJImiXmb5m6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659365; c=relaxed/simple;
	bh=A3BWN2pQX6u909yRMUdmP0zxqeTmYPA47VdZHSAX85I=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=O8JGXyZf/pqVjCIPVq8JiTf0aUPNmfGGop3rms4wXcwVhMy++mTN1Fk2fPjU5Ehmp9ogWDrWbAj4mEPgJdu3FJWshesQ4rqfkDH7piwXYhyoXX5/6oSsu1IwQR0b0hZoPOU/+/0eFHLTpf4/lQexS6gsU2IIYS4r70c5HbbWOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF91JWVL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF91JWVL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d94c868ea5so24025435ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788659363; x=1789264163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0KhFClpzBCgstI8o1AR/vkilR/o3vMPMYTkXSYpO4U=;
        b=EF91JWVL37ekkQgPFYsZV/MfGjzcBF4Yrw4Eu8qOF/4MGx4JzCG0F3YzjQ/7l3hsxt
         6uAXaPLTNK6kvFBk+wkZrdhkSRWorjUWRUhV8P3sQ7tVbzkLFw+dMlA9JpDeN/dNu9Bt
         gIFR0zBXV8TMdaGFW3gqOkMPsyza+7wVt48h1icBi3nak6xzQIztgl5U41DPgSj7jIsC
         UxjndWGLxBLPdIlU0GS26nj4q3a7ambCqqx2ZtMDnd6oaJbDumX7hlvcMjAOmiDxY40v
         p+P0MgE06bfhO2D5mGv2YGZ5gD/Hn5HCk+f0NwHkmKNju7bqSNpOrZqJAEH2UyIvlxPg
         q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788659363; x=1789264163;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0KhFClpzBCgstI8o1AR/vkilR/o3vMPMYTkXSYpO4U=;
        b=nvdCJ1SF1olxDrLUAwAwP7J2DxyDWUMfKEE1BqaMhff7DGFPYz+kujCvCZNuOY673f
         G7wvXcP0xSdGn/bNRP66wuO9PJxtl4jgzflW6+LAegTunJzv8Ax9FWINYxBzGC9W73Aa
         bkLZFdtVZhnYJRu2nsaLcMmFplj9HyGUp66oOK18U/rBt7OT8VbFAe40+KeF6x4vhFMx
         FY/ZcvgJU2OfVJJ7v/FK78yF6Iqi1M7W6/T/YntldQDBMrVgkXZ1TJgP56INLHPVXK5B
         ZB8puTwODXl+XW5OlT95M/Xpw+uHmtmw9BuCUDyHeOFkFSD7vu5znK2AoVY3Te37Yw49
         TwUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1rElmjA/sjnMtUIxhv0sBYLoeTCKGtElcuEU4R84jAT6HgX75jr7ClQWnqvE8KwqUyeq+2XS78WMfDaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kvvE/ZzZNOIDQJHvrUVc4DSM1u9LLpgSWgKDNIj+rGuwTJxaJw
	vh9w9yZhGrwfE6ximNco74U8choLA+ivZd82hRqFJJ5V4qzaEcG0eNE0
X-Gm-Gg: AYBFou0cLRTmobe5Zl8ozNSHM39fVRPbpRmHXEeTotonb4M9bYnNZMLgFdYY9w6CJEN
	FakpYW3S7H3NcI1lyd30mL5MkVz2iIos06E/SCHs4IlrFpKFUqitEiuiHToYJ/T5t3wPUN2Ytfh
	d8KUYk5PGUQf9wH7OpZWYMHHYoRpNPat8q4pCr6x6+MyQzYFxhWaFQ8Jq20hG+mdRmJEbFfMx2w
	TJx+wUuEKs0k/y2cvqRIxHKKbmVEX4DVz9WEK1iR1lirv5AZjFqRFQnbtR+457CwcfsEY9eViX7
	U3eYUVChD/4arqjL86VV8weH5DTBGHHaG69JTHclAWBhQF9AhcGK/4E+InLeH3SG7sE3+1sUgQD
	Y+yr9/FQlFUIDeDsTQgO8MAuB+OvXc5pHJ41UewICd5rTyXtiSvBGji6f5fEx3+/R3vEFZP4Elm
	np5W/kn9jCOepZ1C5OU3Xx+514+udW6MCVMXbEQgFOChRLXRbX94NSBVIgQ1zcfd55e1mc9gXwL
	4OFYD8FHpeLiUkrnj0=
X-Received: by 2002:a17:902:ebc3:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2db20fa96d6mr161492935ad.13.1788659362933;
        Sat, 05 Sep 2026 18:49:22 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ccf2esm27008175ad.73.2026.09.05.18.49.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 18:49:22 -0700 (PDT)
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de,
 linux-fbdev@vger.kernel.org
References: <20260827093948.2825531-1-lilinmao@kylinos.cn>
Cc: miro.kropacek@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
Date: Sun, 6 Sep 2026 13:49:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260827093948.2825531-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linmao,

thanks for your patch!

Am 27.08.2026 um 21:39 schrieb Linmao Li:
> The SuperBlitter operations derive an integer byte count per pixel.  The
> accelerated fill path handles only one-, two- and four-byte pixels.
> However, the operations are currently installed for every external
> framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
> truecolor modes accepted by the external video parser.
>
> For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
> nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
> incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
> despite advancing addresses by three bytes per pixel.  These cases can
> corrupt the framebuffer beyond the requested rectangle.

I believe 24 bpp mode can be rescued using something like this (entirely 
untested):

--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
         case 2:
                 memset16((u16 *)line, pix, rect->width);
                 break;
+       case 3:
+               memset(line, pix, ((rect->width * bytespp) % 4));
+               line += ((rect->width * bytespp) % 4);
+               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);
+               break;
         default:
                 memset32((u32 *)line, pix, rect->width);
                 break;

Can't test this on hardware, and would need Miro to confirm it works as 
intended.

>
> Enable the SuperBlitter operations only for the layouts they implement:
> 8-bpp packed pixels and 16/32-bpp truecolor.  Keep the existing software
> operations for all other external formats.
>
> Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/video/fbdev/atafb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
> index 5bca34c45cef3..c3011b61a94b9 100644
> --- a/drivers/video/fbdev/atafb.c
> +++ b/drivers/video/fbdev/atafb.c
> @@ -3360,7 +3360,11 @@ static int __init atafb_probe(struct platform_device *pdev)
>  		memset (screen_base, 0, external_len);
>
>  		/* framebuffer in SV RAM: enable the SuperBlitter */
> -		if (external_addr >= 0xa0000000) {
> +		if (external_addr >= 0xa0000000 &&
> +		    ((external_pmode == FB_TYPE_PACKED_PIXELS &&
> +		      external_depth == 8) ||
> +		     (external_pmode == -1 &&
> +		      (external_depth == 16 || external_depth == 32)))) {
>  			svblit_regs = ioremap(SVBLIT_REGS_PHYS, 0x100);
>  			if (svblit_regs) {
>  				svblit_fw = svblit_rd(SVBLIT_VERSION) & 0x1ff;
>

Otherwise, LGTM.

@Geert: can you remember if pixel format or bit depth of an external 
framebuffer can be changed at runtime using fbset??

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
