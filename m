Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793693216;
	b=zhSfdevc6ycb0zsPxwQA7nJpHcag37Hv4aeKRtd2PWQ6PK7QdlaDpea4DCpCOIVHc+KV
	 RVWaPby89JnWSN3664aae+vZJyDFzWx3sIoMsRRo3++hZtwe4pp0zHcwjugZqR3yMFyY9
	 Ca072ssCsqchEeNIyouCvGMk3XC7kUgVfGmA+SSpQrhQMgI6rhDycFbJXHUBsqqyEs/sN
	 oxAQ8oHYgxXTxzZLo+OGwwoFkKmNermvzIIQOnWJB4J8OZLGtend3N7sjZkoMRlTyTOUO
	 BFzjTrG/K6GtCB8WjBhs3hoDAz4Y+koy1uOhJDZlNLAILZ6JUABpbEaH3P5VHTOtQ3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693216;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Zoho-Virus-Status:
	 X-Zoho-AV-Stamp;
	bh=nk85AM+HkE1b0zI5BIMwWuCLEDNQGSrFyxjCS1XNFVM=;
	b=meif2GBtM8SG95x+/GUlBE2VZVad5+lGFSfrvE4owJowfZRbcbkWC+0ry4AS7BFfZgXl
	 /cQRLkWpqGMAU47xH6C7jXwF4MpnK45Ot6Xrf6Ygu+2kXrDF/jTqrjlehjoxeYCfQqp9K
	 Bc8Ht/Jd9VNrWY2Ni1Q3P28IlVshn0/tWBxjdJy3DSkbb46hTYiutXqe8vCNxPXudxeNX
	 6pnC7yK7U3hvKCtKeQQl3yJk1h3HHZ8Q7roLrNwqDOfHWZ9a2Au/4IjiA1s/0VaieXJgo
	 IMWZ9t8E4gmX8b7aqKGXzebkcSyPgUHWdGP6YzHpBeD/TzqJE+rQ4swhNe1l4uP9r6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HVgBcr6v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F5606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HVgBcr6v
ARC-Seal: i=1; a=rsa-sha256; t=1793693201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CdLeY91reDnG8amu/0RuQDYRp67nFoAIk0ITmBuRr0SkqZeHMl2i2Rm+vUUmaOwO2by8RlcQQUvJFTdxeVY1L7QW2IgNEuSzTNi7PDiVYAmPmzkKwvjA/5jMl8NA/aOePv4m1gP4WQddXs31pBYD4qfzs0eGhxGRkTUY5ssr8FY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793693201; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nk85AM+HkE1b0zI5BIMwWuCLEDNQGSrFyxjCS1XNFVM=; 
	b=DT5yrCacOrkv7owKXS18/CdQiO9mu6XO97QnLlLzaNYlyPscpSUyXP+WAlV9BOAm2F/5geqTmdvsfqDaRAfad2i/QZOXIN1k6gjnF69pwto2NNOVKyCxCHfUzwg2ieP2O5k0TzSrM2QrR6lmylXdDdIEAOkapZjcyh5pE4LwhZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: a=rsa-sha256; b=HVgBcr6vB1CCvScU/aH9T1KFfN5pygh5maWSOa5zq22hlRYMBWCCjfv9/Uq0XadkiMvW2lCmCbvzso3wa7LOG1KWiv9G6xraKiDkA0hq6ISAFguv5JKP7WJ0IiPEIS4OTF7UdGT0/v/CAZ+pzDO1PoT0baD9NlD6sPZFOhxRGZo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=nk85AM+HkE1b0zI5BIMwWuCLEDNQGSrFyxjCS1XNFVM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793693200258298.5766441195434;
	Tue, 3 Nov 2026 00:06:40 -0800 (PST)
Date: Tue, 3 Nov 2026 08:06:36 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panfrost: Enable cycle counting when perfcnt is
 enabled
Message-ID: <aumU0iSeeVF8CAg4@sobremesa>
References: <20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com>
 <20261015-panfrost-reset-races-fixes-v1-1-bb74c1786a0b@collabora.com>
 <20261016092336.10ed78da@fedora-21.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016092336.10ed78da@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.674.36

Hi Boris,

On 16.10.2026 09:23, Boris Brezillon wrote:
> On Thu, 15 Oct 2026 19:22:31 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > If we don't do that, we end up with invalid timestamps in the block
> > headers.
> > 
> > Fixes: 7786fd108777 ("drm/panfrost: Expose performance counters through unstable ioctls")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Let's make sure this is merged in the same release the perfcnt uAPI
> changes are in, so userspace can check the driver version to know if
> the fix is present or not (we have a workaround in mesa for that which
> we can drop when the fix is in).

Sorry about not having handled this at once, but I think I submitted
this series right before going away for a long while. I think it's been
two days since Linus published 7.4-rc1, so I guess we can still submit
fixes for the Panfrost patches that made it into the merge window. In
that case, would I push the commits into drm-misc-fixes or drm-fixes? I
remember we already dealt with a similar controversy some time ago, and
that there's a flowchart somewhere in the docs for either dim or the DRM
subsystem.

Anyway, I'll post v2 at once and figure out the right branch, although
maybe dim will tell me where it should go.

Cheers,
Adrian

> > ---
> >  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > index a9def452d5ef..b26da057a1a0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > @@ -17,6 +17,7 @@
> >  #include "panfrost_device.h"
> >  #include "panfrost_features.h"
> >  #include "panfrost_gem.h"
> > +#include "panfrost_gpu.h"
> >  #include "panfrost_issues.h"
> >  #include "panfrost_job.h"
> >  #include "panfrost_mmu.h"
> > @@ -52,6 +53,7 @@ static void panfrost_perfcnt_hw_disable(struct panfrost_device *pfdev)
> >  	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
> >  
> >  	if (perfcnt->owns_as_ref) {
> > +		panfrost_cycle_counter_put(pfdev);
> >  		panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
> >  		perfcnt->owns_as_ref = false;
> >  	}
> > @@ -84,6 +86,7 @@ static int panfrost_perfcnt_hw_enable(struct panfrost_device *pfdev)
> >  		return ret;
> >  
> >  	perfcnt->owns_as_ref = true;
> > +	panfrost_cycle_counter_get(pfdev);
> >  
> >  	as = ret;
> >  	cfg = GPU_PERFCNT_CFG_AS(as) |
> > 

Adrian Larumbe
