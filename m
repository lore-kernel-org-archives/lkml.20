Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15EC4E3EEC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368214; cv=pass; b=SQJYwpSHgBF1gh6ba02jOj1DxOZxUOneZT8AsF/E2RIRPeqt8GvFtarXXmQSMf2PkUmUrSJ+Ls1dHzuxbq4WLpCbSfskmBA+T9trmjXqHdczYwFz/BYzJM/hkbVmNPOMG5QYP3nnmVYb1m81+8gMLNHNmxtSKgHlZST6GakA2bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368214; c=relaxed/simple;
	bh=f2G3rIcVbUkPXRw3yL1RsO+v6Cd5VpLS11PIe+5qkBs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nDVErM862ouCf1j8x2qdpY9MKmjCWOFt8M7IlA3UPVtQcdT4ELaZNAnoxlxOCFXQkIpQjpMEepdalL1y3aWNnNsTRUDOT8bE3emraYQfv0E5R1VucY862wwrZ/h+t9alQ4E1VbVk9kTPi8T4egpqJ/oAixxcSo/czOj9P/Nlj+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=JkDTBBn6; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="JkDTBBn6"
ARC-Seal: i=1; a=rsa-sha256; t=1790368181; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VeLWciMwTMVVK+lpjTa9TkDt4m/KIlR81Q9C4+lt33yAEDku2dUblLkqtHJ6IibeHioljeQ2SoeyzRTyctvCzCaKfihNTvMX/qGD9hp2BHNcHTOIq2pQHqXQnyY/UedCuTa4b46a//z8NpxC3DuVYc+4+i58vCxIov6CAFoTILQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790368181; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oXVsbnHCfHgZRtmigu6uQYFIon/PekNJDyCxr6hMBQs=; 
	b=mVw6ce0WYYM8RVMyNElyD+h8WjdEDA4m/NTy6a2rgwn2L2IhgY4oPOkBbVuM7nvw1dMHTT4FitvyaqdzJ4M1zjG4wto2zYiDsx8jCFIpFOp2dcZYdkF0J5t/o0ISql/EH53/VCjsfqTDnf0M9AhLbIy3bPdwxw72F1BNh9g5L6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790368181;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Date:Date:Message-Id:Message-Id:Reply-To;
	bh=oXVsbnHCfHgZRtmigu6uQYFIon/PekNJDyCxr6hMBQs=;
	b=JkDTBBn6Rj7HsyEvP3TnlwSEHDGs8bxBI90+Shnf6gs8RU4J/yxYe0B4hG9z38s+
	EdQ7NM9RXHGOB3Ot5hYcUOtPTdL1BrkJqwKyk1o2fI3Vo4XJ2jlzyTnMZg/rhLHXRyt
	7jFkjGrT2gWDETawdv5AJTFTQyoXu4xCDaKbLKTk=
Received: by smtp.zohomail.com with SMTPS id 1790368180560498.8332627282434;
	Fri, 25 Sep 2026 13:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v11 15/15] drm/panfrost: Fix races between perfcnt and
 reset sequence
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260925-claude-fixes-v11-15-0dbf5a58e7ce@collabora.com>
References: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
 <20260925-claude-fixes-v11-15-0dbf5a58e7ce@collabora.com>
Date: Fri, 25 Sep 2026 21:29:30 +0100
Message-Id: <179036817030.2217255.13352963220274511347.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=f2G3rIcVbUkPXRw3yL1RsO+v6Cd5VpLS11PIe+5qkBs=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqttmv2JKgZOwq8GLSCnmvXG24cb6Hyav9EM/lH
 TpTeJHIksGJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarbZrwAKCRAOJn5M7lND
 PUn9DACr88FMBpXFQ+BkcC96tjw2V59YOO76pnbVFIyBmG/2LpSv9lY2Nv0lcvUzpclobJ62Ckt
 kkp9GgsON+IdZQZFUAAHdDBwe1fJk9jKK2KdSaGkGYxCg2rjle0nRCzj41RIDvwQoCVhHPq/xOL
 01gZoaHM5v6yg/25LmFf3gczctu4U9ZR3PzDbIR/plj0v1zYxvvuxQ6tHNvOGFD1QeWjEcjCaTq
 hImHmgfV3BlcxIsoMklVK7rdKO4vQNnb1j6TfjQhDjijVQDVNRxKi9LGv56hauuMdjUt7WXILG6
 Qm2P/XnsxzLkmZx7uDgsGqsemaMOPpYtk5JM5y+rX8N0zwMl5HjX29oqoggY97NCYsdQKsxUIkb
 +FdYEpnQqItG49PxqgsquVpObYESkure5xuadvbPMa+GjQcu1tJsFDUECCwYwVY6zXtHjXlmJzD
 xCiViO3qoqz9+gQ4XimHy+WEeUlVz33X2InTIw6BcYvSH517Y43zA8V/uzn4Ff0TTTjdI=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

On Fri, 25 Sep 2026 19:45:36 +0100, Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index b3f71d7fd82a..96c3c41cd269 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -58,44 +70,154 @@ void panfrost_perfcnt_sample_done(struct panfrost_device *pfdev)
>  		complete(&pfdev->perfcnt->dump_comp);
>  }
>  
> -static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)
> +static int panfrost_perfcnt_hw_enable(struct panfrost_device *pfdev)
> +{
> +	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
> +	u32 cfg, as;
> +	int ret;
> +

I might add a lockdep_assert_held(&pfdev->reset.lock); here.

> [ ... skip 152 lines ... ]
> +		if (perfcnt->user != user)
> +			return -EBUSY;
> +
> +		if (perfcnt->state & PANFROST_PERFCNT_SESSION_DEAD)
> +			drm_WARN_ON(&pfdev->base,
> +				    panfrost_perfcnt_disable_locked(pfdev, file_priv));

Forgot to add an 'else return 0'. Also checking the state flag here is racy with the reset sequence,
which could keep coming through, because perfcnt->user hasn't changed.
Also, on a second thought, it seems going through  perfcnt_disable to recreate a whole new session
from scratch is an overkill, since the only thing we need is an MMU reference for the perfcnt
BO's AS. On top of that, panfrost_perfcnt_disable_locked() might power the device off and then
getting a PM reference right below might power it up again, a completely pointless cycle.

So maybe:

if (perfcnt->user == user) {
	scoped_guard(rwsem_read, &pfdev->reset.lock) {
		if (perfcnt->state & PANFROST_PERFCNT_SESSION_DEAD) {
			ret = panfrost_perfcnt_hw_enable(pfdev);
			if (!ret)
				perfcnt->state = 0;
			return ret;
		}
	}

	return 0;
}

if (perfcnt->user != NULL)
	return -EBUSY;

An alterantive would be expecting UM to issue a perfcnt_disable before being able to enable a new session.

-- 
Adrián Larumbe <adrian.larumbe@collabora.com>
