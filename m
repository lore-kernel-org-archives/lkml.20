Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB32931DF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666857; cv=none; b=eQWjsmpM6fwn8GMRGRo7QkJylGkuO40g+uYTog4aHJhl6xAsw+N5KXTXImbv7HBerLLb/1qcRHKHdv4x8WjPcO5x3+Q5BMrzoTj6H7qQKp+/OCUK/eQmfESVNdM1KC5HrdO8gwLS1e/qKmOqjHfvh4HdX/bsKqI98va6YVvLwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666857; c=relaxed/simple;
	bh=49Am23hAdfEpTj9ehuFle7Y3si9Vy+hKZjjfmohidsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLMEc1xVDALmaPz+B/FH6D86qNZ8RX3azRMoym7cB/dBcMx2b0kCA7Zeb6MElqAnP0ua46LjfOFnY/z2cMKzS/GvxBWCmCtyZNewPxxkB1zjAipwBXRhgOyO79nm32Hr3MDIPUFpvYOFCJls81XmV1i0M2GXroWR8Jlmmmwkj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-03 (Coremail) with SMTP id rQCowAC3tjRRaLtqNVgdCQ--.1183S2;
	Tue, 29 Sep 2026 15:27:13 +0800 (CST)
Message-ID: <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Dominique Belhachemi <domibel@debian.org>
Cc: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter
 <simona@ffwll.ch>,  Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski
 <m.wilczynski@samsung.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 ganboing@gmail.com
Date: Tue, 29 Sep 2026 15:27:12 +0800
In-Reply-To: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
References: <20260505042631.1916555-1-domibel@debian.org>
	 <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
	 <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAC3tjRRaLtqNVgdCQ--.1183S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18Gw15GFyUWw1DKw4kZwb_yoW8CF1rpa
	yfKwn0yF4vqwn7Ar42kw48XFWrZ393Jry3u345Gry8ZrZ8uFyrKr40vryagF1jgrnrC34r
	ZFs2gFykXw1kCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-28=E4=B8=80=E7=9A=84 01:21 -0400=EF=BC=8CDominique Belhac=
hemi=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Sep 11, 2026 at 11:33=E2=80=AFAM Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> >=20
> > I am still thinking how to decide whether to use dirty-tracking-
> > based
> > cache coherent maintenance or writecombine/uncached mapping.
> >=20
> Hi Icenowy,
>=20
> I looked into this again and writecombine/uncached mapping is the way
> to go.

I think drm/imagination really requires it (because the correspoding
userspace driver advertises only one memory type with
`HOST_COHERENT_BIT` set), however in the future it could also add cache
maintenance support for performance reasons.

> I used Bo Gan's XPbmtUC series and Michal Wilczynski's jh7110 display
> series and finally got the integrated BXE-4-32 GPU to work.

The XPbmtUC series is problematic -- it "supports EIC7700" "with a
hypervisor", which means it cannot run on EIC7700 natively. This
severely restricts its usage.

Samuel Holland from SiFive is working on patching the PTE on-the-fly,
but that will change all code accessing PTE in the kernel and thus is a
heavy work.

P.S. For the JH7110 rascal+dust power issue, I did a try-and-error hack
at [1]. The basical register definition of this register (called
RGX_CR_POWER_EVENT) is available in their KM volcanic part (but it
seems to apply for rogue too), but the individual bits for domains are
undocumented, and the highest 8-bit seems to be some kind of multi-core
mask on Rogue.

Thanks,
Icenowy

[1]
https://github.com/Icenowy/linux/commit/09db317c9c229ef359e35463f8c08efd3e2=
3c685

>=20
> https://lore.kernel.org/all/20260316060328.1173634-1-ganboing@gmail.com/
> https://lore.kernel.org/all/20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@=
samsung.com/
> https://github.com/domibel/visionfive2_gpu_bringup
>=20
> Best
> -Dominique

