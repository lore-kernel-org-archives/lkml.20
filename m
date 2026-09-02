Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C484A92C6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363690; cv=pass; b=gxSAHkGi6d0SF1ZPwjh4QOftBKvc/m88GEPSPFy/uMSaV9NkB/vpK3Q3gbvZ7oEF2OD/MmtAMX9P3YECZRPy1+q/D8dB7zzG4eKKwyENVDY085Wb2Y34bvDZaBOHRh4U4i1YHavgW3CwG7sIH1Cths4JduC5kshKVKnVaA0stW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363690; c=relaxed/simple;
	bh=z9ZJ4I9SphRaOVGyNXkKxfWeFf6wFiJ+eVrfy2ku6yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ap+8UHHZf5VIinMSItwICdyTdViDSBVr1A4AaeyOQ33UVcn2djleMV512vFmuNSi13vOCH0hmJinlyzOQSJ60aL8Kk9XvHuDDlZOp+uiFX00l9hx0tng1WNl67NLZSdrsKsXLlCbt+hkjWhMSDwEGOwMp6TmH6tggSaxe/u5p2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=jkNXlx62; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jkNXlx62"
ARC-Seal: i=1; a=rsa-sha256; t=1788363641; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ILCIbY9Qtl+4SN8TsR0Q8EkU7PO2wG7DDY24PhJB6w76lz7Uh2gI2NS69Lc6LigxGp9QabyvaDZTjSNzM4Ky8rsKeesKbHUs4rQeNrPe6te/gL9jCyqU9ZW6XlZzuMpp0PU9EkemZjOhF6MSmwpzn5QHM1zO4b1kt3QwKvRQvAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788363641; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J3INOkfEBcY2jrUN32fay3pZ8r/lpRUuqtPv/+3HQmw=; 
	b=krOrEa0nbpGHZVhfoA0H5NCvgZ7DDuSbJ281NvhWQAMXgoN2Y4HLsjeWtpOTGgvsEAnjUOysPR94Uu7QC+lrYRMgWekOVzqsdmI16HUs6ON5heM82t+JEOb4eMsS7LBlM/81OtvDc/zzwWs0fB0QDo+4/0T5Jkd/y6327aZuf+I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788363641;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=J3INOkfEBcY2jrUN32fay3pZ8r/lpRUuqtPv/+3HQmw=;
	b=jkNXlx62mBk6t4LO/YAPV5ruhcemaYR8Z1YFEbQ8Ll5ONzBDZUgXGnSz30t6ZYsy
	4hQTG88oUYB5M73QyS2X7DLoEmS1rtZlxvw58fLNPYrLwGMSbH+pVkU8rtatMJvliFt
	tSjjzjrrEQ8WILjZVHjKWiMPJiTyAAtyZ3rwTKbs=
Received: by mx.zohomail.com with SMTPS id 178836363895380.82453922758862;
	Wed, 2 Sep 2026 08:40:38 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:40:32 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
	"Marty E. Plummer" <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
	Eric Anholt <eric@anholt.net>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Collabora Kernel Team <kernel@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 04/17] drm/panfrost: Move debugfs initialisation to
 relevant subsystems
Message-ID: <aphDVUj4HLQqBKZr@sobremesa>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
 <20260828-claude-fixes-v7-4-72a13b2c125d@collabora.com>
 <20260901143057.47497b30@fedora-21.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901143057.47497b30@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.352.18

On 01.09.2026 14:30, Boris Brezillon wrote:
> On Fri, 28 Aug 2026 21:56:44 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > @@ -757,4 +758,28 @@ void panfrost_gem_debugfs_print_bos(struct panfrost_device *pfdev,
> >  	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
> >  		   totals.size, totals.resident, totals.reclaimable);
> >  }
> > +
> > +static int panfrost_gems_show(struct seq_file *m, void *data)
> > +{
> > +	struct drm_info_node *node = m->private;
> > +	struct panfrost_device *pfdev = to_panfrost_device(node->minor->dev);
> > +
> > +	panfrost_gem_debugfs_print_bos(pfdev, m);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct drm_info_list panfrost_debugfs_list[] = {
> > +	{"gems",
> > +	 panfrost_gems_show, 0, NULL},
> > +};
> > +
> > +int panfrost_gems_debugfs_init(struct drm_minor *minor)
> 
> 
> nit: I would rename that one panfrost_gem_debugfs_init().

Will do.

> The rest looks good
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> > +{
> > +	drm_debugfs_create_files(panfrost_debugfs_list,
> > +				 ARRAY_SIZE(panfrost_debugfs_list),
> > +				 minor->debugfs_root, minor);
> > +
> > +	return 0;
> > +}

Adrian Larumbe
