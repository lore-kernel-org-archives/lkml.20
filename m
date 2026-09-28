Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBB495032
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639001; cv=pass; b=M7zv6xAwuG9gHFLdfCLpIoaMLulsWxqp3lYt4qh3N1eNtBv9qehtZjgTcsMUDHED2WAXmWH1v84Qu8L0XACImGoMzsOVVUjuKslRTX7OqDgqyjw/yo2EnOdRRWExIjazHF6RRu59s0HkZpMBSlAaXlucd7k5xWWNzJD1QAFesCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639001; c=relaxed/simple;
	bh=5ynqZFtARzy4/UiXIBasA48ciZPqgZS98dfTbePs/AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlezEp+Py0+LCB/lUBOZ7Dmi+UaPrqIBlNfaEvp+9GNLfmDWeDSpWf7nr0VPVs4h/BMMOEn7shHlvbLB6trqvjN+ZqIu62U90X1GBrI8AvnhK96IbEbx3kaf5lBUVzBRwZIjirzKczel8ATMIY6GUcvW92bJr0y6pZvEVlrUPhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIkM73rj; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIkM73rj"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-66e4ab2029eso3188083d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790638999; cv=none;
        d=google.com; s=arc-20260327;
        b=PE2q/tPb3EBBDSPFq00YFNyQu+h7uh3HIGZk/oOMVFEY2ESJGci8HNQ73YFbocefmF
         6dIHCWowg7p0LP3FwjCVD/6Tnz86BXaUnAriFr1pRGAO40oPKQ2wUWoAeiQR06LwrgjY
         M4qHlsUN/BVsZfHWOXbRPs/PZ5tW0hQfb3aq6xZ4t7hea6ArObDFWIc4K66u79Ea8tQU
         G4VfW86Tb3aLMxptDbTA9BSnB+3prkb0WmV+T2uPD7plWslADiaj6rp7WruZpXLMc9XZ
         K/kScEaIgB8xMLPBgVBai1jOCVac5uGbAPXUsii79tuUVvYw8qcL2m60yI04q3scbKau
         rf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        fh=L2Rr8JQk9gUrXV7EkxapJjNpbu9vPVucA6H4WIPtxGo=;
        b=F3gj0/j3NiTN+dXCDS8vyGDZr4lAByupHyKDwY2NfLrLP0S7EzWdi9lby+LtwA8J6H
         zKF2DXEw5ixAAO9RbHcCxz16lfVUf0DUDkxFrkMi3A7a7XU7SX7DvhqPIHIzua27HBLQ
         C+PCGXXyuUdlgsY0cCeHj6StGvtNDY0UAHk1TJC24vGKTEDTqdg20bjzIEKWd6VLB9r5
         ClD5rg0IeXJd0N2/kaGxaay1hd+WI5us+pYDtfhUDZMvyUlKZ6zT+IMm8WWXmNn6L2y4
         4nyQQXCb0phJ9Ghng7EqScBd0xZ1Fn9ECaFlRQZsqb+qSaY60VqtUoiNNAppkJLC0hGS
         cVEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790638999; x=1791243799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        b=UIkM73rjMY14YaYU5nBkwCfY1h/Rz4ZGVyEJyLF9/+bGiJMLIHxAWATxH+tKhzxcua
         wh9eJRkvbfsO7bmZmDckkGe2ladyNnCrsVqjmFBeNmrJ7aC0im0idjWq6TyLVZPDaPw4
         JiP+wVw0yxLEwCzPJUAaxf7nCRdTJew7QsfvSp4PHX5YW9bcRHPB65DRRFlU6F/nMbvs
         jZFxj6om7Tl8Jn/oUKVZVGTM0azW6IGpcelbMbX58OgS+5v3B37S7eilXkZNIuXVy1yZ
         j/K6zahTiFVbt3DZ2hLqOhAnMIlId+mo/7aoz5C4mUmP426ub3pUSfcvp48gDDDzkraG
         MVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790638999; x=1791243799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        b=r9eXGVdIxR1GPSjuYtrup2kyQL3x5lXk337TZqxTKEPy4EJPVWZJAsey4kTBvintDq
         WeEINVVN5oEQI2ysLqaNV57nBgJAB7s9zBEuAHF2vZe4501hiPvdhgLmL1XKavz2h2cm
         JnPZhMGcn/JZYYyCDYvHgJmpfXC837PMJbWJsggRtGAIkh6NReHJUtrXwxOaxNR3ke3I
         036yZ5aRfHU65CkgHhHY9FNlBF23ZBlluN0Xb3+X1KSFXGsVbAZ3dbeTPWZaZdz8ippI
         ha1RrFFOc5/9FtPqf2VWsCzM42W/rgmzlSkzX63qGJXwDCoXhClNu8PXCVW2AIdyn83G
         vAEg==
X-Forwarded-Encrypted: i=1; AKwUvByvZDNFd3s+SnFGTUbXqVWUqiwRMI/hrAtfryRJqF7SaT8QO+IjTuMHVGnuvUam/e4TLoLUB1/sabEZLIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwJopyFZyx06y5JGmocwbVfbSE4hrXd4wqPz4LdJLaxXLn7Ra
	kM8rJxUGEZkW6tAm4JcHUqK5JR+3osW4iMCMuPb+6uCdTdzy3aWM5MLGTn3bZv569tBzlHAIyPC
	yFciaNSWp3YV6uaVzqmk8TtthAV18d54=
X-Gm-Gg: AYBFou07oWi5q7IeOhzRwJ6/dvB6DWVIY8YlCGp18q13L9GZdr32QI13BZcs3Q5LajO
	cMOx5INxUqbI11NkZTcuGxUuYMrw88eu+sqscyIryv/xeosICcs300S2LD/WYCCSmCMKWkhRM0R
	qQo/hdAOVvXTATgT11REAMyNfiM5H47qlTSzBeujjWBZ2gth85wlmIggCL/1UfStEFgLS4ET8qw
	XSUkHSuafWZAU/40RhJp2tISRFcEuXMusM1+cjA5FK+h75weewRuPbyz7b1D/IUFTS/zeKX1GY5
	ZyCx+YVKMzAIZoiN3cg7V4BF+OHlTC5LwB9pCAng/M5XgnTK9+iIBf0bi3Qy2EJE2owBOVN8lDB
	PTJqhSOl5bQzvT4xlene8i0IcBk2apPVhiRBdssJ6AoU7+fNj1rgILKCojB9KZMvpGy4HrXSFn+
	05VkAU/jr9pCP5tysPX61Pi3i0cHZR8IMR4lY58vf1NkWzmoO63UfbRA==
X-Received: by 2002:a05:690e:262a:b0:672:99e1:11cf with SMTP id
 956f58d0204a3-672ed49377cmr4145065d50.108.1790638998596; Mon, 28 Sep 2026
 16:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609261313.kgFtkz2t-lkp@intel.com>
In-Reply-To: <202609261313.kgFtkz2t-lkp@intel.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Tue, 29 Sep 2026 09:43:02 +1000
X-Gm-Features: AclHuK-09VUyswb_ykHWdQTzYGpKAOWq2dd5z6j8JhQoovFv5Wwllc3aL0t0vX0
Message-ID: <CAN5rfbReCmhwCdRjXD6SXQp__Zy-HgXi4EG2PuMGhKgAqBCKyw@mail.gmail.com>
Subject: Re: drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes
 address space '__iomem' of expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Helge,

if I read this correctly, your patch fixed the two other warnings (the
dead atafb_ioctl and pclock = 0). Since you mentioned "Fixes:
d463633d63e6" pointing at my commit, maybe you can take a look at the
line 2457, too? I'm too unfamiliar with the whole process but since I
got the warning email, I just wanted to point your attention to it.

Thanks,
Miro

On Sat, 26 Sept 2026 at 15:09, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
> commit: d463633d63e6aa10384683bf39971a4b00780c56 fbdev: atafb: Add support for SuperVidel's SuperBlitter
> date:   5 weeks ago
> config: m68k-randconfig-r1308-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609261313.kgFtkz2t-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    drivers/video/fbdev/atafb.c:2824:9: sparse: sparse: switch with no cases
>    drivers/video/fbdev/atafb.c:1092:34: sparse: sparse: Using plain integer as NULL pointer
> >> drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes address space '__iomem' of expression
>    drivers/video/fbdev/atafb.c:2641:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
>    drivers/video/fbdev/atafb.c:2641:27: sparse:     expected char [noderef] __iomem *screen_base
>    drivers/video/fbdev/atafb.c:2641:27: sparse:     got void *
>    drivers/video/fbdev/atafb.c:2815:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got char [noderef] __iomem *screen_base @@
>    drivers/video/fbdev/atafb.c:2815:32: sparse:     expected void *dst
>    drivers/video/fbdev/atafb.c:2815:32: sparse:     got char [noderef] __iomem *screen_base
>    drivers/video/fbdev/atafb.c:3353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [toplevel] external_screen_base @@     got void [noderef] __iomem * @@
>    drivers/video/fbdev/atafb.c:3353:38: sparse:     expected void *static [toplevel] external_screen_base
>    drivers/video/fbdev/atafb.c:3353:38: sparse:     got void [noderef] __iomem *
>    drivers/video/fbdev/atafb.c:3424:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *static [toplevel] external_screen_base @@
>    drivers/video/fbdev/atafb.c:3424:33: sparse:     expected void [noderef] __iomem *addr
>    drivers/video/fbdev/atafb.c:3424:33: sparse:     got void *static [toplevel] external_screen_base
>    drivers/video/fbdev/atafb.c:3428:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
>    drivers/video/fbdev/atafb.c:3428:34: sparse:     expected void [noderef] __iomem *addr
>    drivers/video/fbdev/atafb.c:3428:34: sparse:     got void *
>
> vim +/__iomem +2457 drivers/video/fbdev/atafb.c
>
>   2436
>   2437  static void svblit_fillrect(struct fb_info *info,
>   2438                              const struct fb_fillrect *rect)
>   2439  {
>   2440          u32 bytespp = info->var.bits_per_pixel / 8;
>   2441          u32 pitch = info->fix.line_length;
>   2442          u8 *line;
>   2443          u32 pix;
>   2444
>   2445          svblit_wait();          /* the CPU is about to touch the fb */
>   2446
>   2447          if (rect->rop != ROP_COPY || rect->height <= 1 ||
>   2448              rect->height > 4096) {
>   2449                  cfb_fillrect(info, rect);
>   2450                  return;
>   2451          }
>   2452
>   2453          pix = (info->fix.visual == FB_VISUAL_TRUECOLOR) ?
>   2454                  ((u32 *)info->pseudo_palette)[rect->color] : rect->color;
>   2455
>   2456          /* draw the first line with the CPU ... */
> > 2457          line = (u8 *)info->screen_base + rect->dy * pitch +
>   2458                 rect->dx * bytespp;
>   2459          switch (bytespp) {
>   2460          case 1:
>   2461                  memset(line, pix, rect->width);
>   2462                  break;
>   2463          case 2:
>   2464                  memset16((u16 *)line, pix, rect->width);
>   2465                  break;
>   2466          default:
>   2467                  memset32((u32 *)line, pix, rect->width);
>   2468                  break;
>   2469          }
>   2470
>   2471          /* ... and let the blitter replicate it into the other lines */
>   2472          svblit_copy(external_addr + rect->dy * pitch + rect->dx * bytespp,
>   2473                      external_addr + (rect->dy + 1) * pitch +
>   2474                      rect->dx * bytespp,
>   2475                      rect->width * bytespp, 0, pitch, rect->height - 1);
>   2476  }
>   2477
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



-- 
http://mikro.atari.org
