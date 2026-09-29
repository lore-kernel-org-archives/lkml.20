Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CF3FE652
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662457; cv=none; b=OvPyb2LgaumFGBltj5KWZsC9WJgYDOZoRZV88O5eLJs4OvaPBS0Ur1fwAMmk+pek6rA5s+xgPcCRWI1w90Eh8fDrrrtNmyRR1QPY4uVkSCYW7wM8KnwclY/0SOH3Ri24J5U+shjnAhFlBPYLh2RmUX5fodQ6P0RWYgLnC6Uh2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662457; c=relaxed/simple;
	bh=ZENhFoZdyP/NKGY9rYObjkgY30/JK0bKqC5VklTKHj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsoozJhJ40s89achywn5sB3Cd9hjknkba7i8+btw6QlSFaagVo2f7BztKfY6fCwmGS4rB3cCTpA72fg440co1z6C8BUMO0yz83J3jmbnG0YNVrhyda070WFp3eS/ntmN0jgOLNCHSU/MAzLDoHKDcg92mjuR3cqHe5B6YM8AP/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=uAvSOMAj; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="uAvSOMAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790662453; x=1791267253; i=deller@gmx.de;
	bh=80l5/GvUAnlUZxx03vy6GNYtJilVaov804rlFhnV9FA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uAvSOMAj6T5KjKcamZfcgumf+hSveHqrNLTY5mA5K0PNbL2/b6oOMFbl7mZSzAld
	 rR3gRaC5wQWQsRKD4xxZlp0jC1P3QynU/o8m4kXOFJV4F7M0cxBsJduF02JyPQnoB
	 O+erKh4JsGlPkT5WAyQ1c/XOWbO+HK0CKyDPH7i3Fn5pIW4Ewa8I1ZJcemmCGroS4
	 yYE15y8C5v+1oc+9baaNYWk3YWxHz6dN9t+iBwL7VwkcsAcBGusHpSECpi0wpNuOB
	 SwNYc5npj4jnkwJHXN5M6H0sX2NAGxXln2USW/LmIne+C+btfLSawG7WOpyYuAR9a
	 lW/066EUQV4OCgb2LA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3He-1ww3x709ns-00DJb1; Tue, 29
 Sep 2026 08:14:13 +0200
Message-ID: <c3feb4b4-4561-424c-b3a4-0998d9ac95e4@gmx.de>
Date: Tue, 29 Sep 2026 08:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes
 address space '__iomem' of expression
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Schmitz <schmitzmic@gmail.com>
References: <202609261313.kgFtkz2t-lkp@intel.com>
 <CAN5rfbReCmhwCdRjXD6SXQp__Zy-HgXi4EG2PuMGhKgAqBCKyw@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAN5rfbReCmhwCdRjXD6SXQp__Zy-HgXi4EG2PuMGhKgAqBCKyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:njDWaiSZ5gbti5NKiX89Ny1R2nvgF+imJ/TkWd3pRxgz8L47oNa
 v8pPEpgeocj07kBYDngIjjLDcLicu1+oLrbf71JmZXu65QfwmZDjZlQXAMV/8fMW9EMYfqe
 YnJMeLKFaHWlQHpIeclveihcHKboiW26Of1FdDgwawA/+KmNb5aodBc9g+LskJ+TRJ10EFY
 8fbgKhKp3C5X3DaUY//Yg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3UEgX5bpN2s=;b2xpFfH+tK6Ji3eXg2zHT2IuE27
 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
 3Qws9AkCdfg04z3qA==

On 9/29/26 01:43, Miro Krop=C3=A1=C4=8Dek wrote:
> Helge,
>=20
> if I read this correctly, your patch fixed the two other warnings (the
> dead atafb_ioctl and pclock =3D 0). Since you mentioned "Fixes:
> d463633d63e6" pointing at my commit, maybe you can take a look at the
> line 2457, too? I'm too unfamiliar with the whole process but since I
> got the warning email, I just wanted to point your attention to it.

I just send a patch to fix this to the mailing lists and added it
into my for-next tree. You may respond to the patch with an Acked-by
or Reviewed-by tag if you like.

Thanks!
Helge
 =20
> Thanks,
> Miro
>=20
> On Sat, 26 Sept 2026 at 15:09, kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
>> head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
>> commit: d463633d63e6aa10384683bf39971a4b00780c56 fbdev: atafb: Add supp=
ort for SuperVidel's SuperBlitter
>> date:   5 weeks ago
>> config: m68k-randconfig-r1308-20260926 (https://download.01.org/0day-ci=
/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 16.1.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260926/202609261313.kgFtkz2t-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
>> the same patch/commit), kindly add following tags
>> | Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's Supe=
rBlitter")
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609261313.kgFtkz2t-l=
kp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>     drivers/video/fbdev/atafb.c:2824:9: sparse: sparse: switch with no =
cases
>>     drivers/video/fbdev/atafb.c:1092:34: sparse: sparse: Using plain in=
teger as NULL pointer
>>>> drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes add=
ress space '__iomem' of expression
>>     drivers/video/fbdev/atafb.c:2641:27: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected char [noderef] _=
_iomem *screen_base @@     got void * @@
>>     drivers/video/fbdev/atafb.c:2641:27: sparse:     expected char [nod=
eref] __iomem *screen_base
>>     drivers/video/fbdev/atafb.c:2641:27: sparse:     got void *
>>     drivers/video/fbdev/atafb.c:2815:32: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *dst @@    =
 got char [noderef] __iomem *screen_base @@
>>     drivers/video/fbdev/atafb.c:2815:32: sparse:     expected void *dst
>>     drivers/video/fbdev/atafb.c:2815:32: sparse:     got char [noderef]=
 __iomem *screen_base
>>     drivers/video/fbdev/atafb.c:3353:38: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected void *static [to=
plevel] external_screen_base @@     got void [noderef] __iomem * @@
>>     drivers/video/fbdev/atafb.c:3353:38: sparse:     expected void *sta=
tic [toplevel] external_screen_base
>>     drivers/video/fbdev/atafb.c:3353:38: sparse:     got void [noderef]=
 __iomem *
>>     drivers/video/fbdev/atafb.c:3424:33: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void [noderef] _=
_iomem *addr @@     got void *static [toplevel] external_screen_base @@
>>     drivers/video/fbdev/atafb.c:3424:33: sparse:     expected void [nod=
eref] __iomem *addr
>>     drivers/video/fbdev/atafb.c:3424:33: sparse:     got void *static [=
toplevel] external_screen_base
>>     drivers/video/fbdev/atafb.c:3428:34: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void [noderef] _=
_iomem *addr @@     got void * @@
>>     drivers/video/fbdev/atafb.c:3428:34: sparse:     expected void [nod=
eref] __iomem *addr
>>     drivers/video/fbdev/atafb.c:3428:34: sparse:     got void *
>>
>> vim +/__iomem +2457 drivers/video/fbdev/atafb.c
>>
>>    2436
>>    2437  static void svblit_fillrect(struct fb_info *info,
>>    2438                              const struct fb_fillrect *rect)
>>    2439  {
>>    2440          u32 bytespp =3D info->var.bits_per_pixel / 8;
>>    2441          u32 pitch =3D info->fix.line_length;
>>    2442          u8 *line;
>>    2443          u32 pix;
>>    2444
>>    2445          svblit_wait();          /* the CPU is about to touch t=
he fb */
>>    2446
>>    2447          if (rect->rop !=3D ROP_COPY || rect->height <=3D 1 ||
>>    2448              rect->height > 4096) {
>>    2449                  cfb_fillrect(info, rect);
>>    2450                  return;
>>    2451          }
>>    2452
>>    2453          pix =3D (info->fix.visual =3D=3D FB_VISUAL_TRUECOLOR) =
?
>>    2454                  ((u32 *)info->pseudo_palette)[rect->color] : r=
ect->color;
>>    2455
>>    2456          /* draw the first line with the CPU ... */
>>> 2457          line =3D (u8 *)info->screen_base + rect->dy * pitch +
>>    2458                 rect->dx * bytespp;
>>    2459          switch (bytespp) {
>>    2460          case 1:
>>    2461                  memset(line, pix, rect->width);
>>    2462                  break;
>>    2463          case 2:
>>    2464                  memset16((u16 *)line, pix, rect->width);
>>    2465                  break;
>>    2466          default:
>>    2467                  memset32((u32 *)line, pix, rect->width);
>>    2468                  break;
>>    2469          }
>>    2470
>>    2471          /* ... and let the blitter replicate it into the other=
 lines */
>>    2472          svblit_copy(external_addr + rect->dy * pitch + rect->d=
x * bytespp,
>>    2473                      external_addr + (rect->dy + 1) * pitch +
>>    2474                      rect->dx * bytespp,
>>    2475                      rect->width * bytespp, 0, pitch, rect->hei=
ght - 1);
>>    2476  }
>>    2477
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>=20
>=20
>=20

