Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDA412BE4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895020; cv=pass; b=Yyn8kzAcBtqGz8He4RLARCUD+hfYirjMFCG1Br7BA7mtg7O9weKraGGq1S9sRLhZjVrdnqJxRTHgTA1COsnG8hxx6bymy5+SHmQ70ccetZ+qZkBkMI37Tqc5Ov183843gNYfZGrgeVdSzbqUag48rqzGFIYYmC0fhnBcPHOcZL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895020; c=relaxed/simple;
	bh=7TymCWvJwd9v+SHxzA+YtR78RfJ/Erc64w2qD7+PdYo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=F8BlbuP0d5p5ixXcWt+fxvuNi6nmBjn4aZ+X6WoHaejD6QVwLDRRqy5myrQsykqOOUDaXKzzqaoLS8nMrZHC1mBTEaNzTScZ9/zSsc1lAiEczktHWkQ3e4NV9tCiSWEsAXIJTESB1mGBn5DbJhuoN6uCcaL05mZsjRV4H8Y+dmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Jg0Jvi7K; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Jg0Jvi7K"
ARC-Seal: i=1; a=rsa-sha256; t=1790895000; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PJQ1h8I+OJjKaWDJ+BKVgUOFoYPFiP/HSsjau++UO9UYEYuRAVaz22RiinxwR6KO9h7KmBRctEsf3G88N7QdvAm28Httb1/dcA9zLmT2JhHZSWmT6RJRJIbzQ1xsCOJin8mN3xLHsqCggJy6QQSTANq6/8xCKX2yc+AbV4Rmp+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790895000; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qh0Sfnrni8gq0oLliVbgfWQGxqvJniUx/OYBxyw/F6M=; 
	b=YmJvDcgtmB88j3vXjoWksJI6f4TJuL7zlv1Jajtoq+53aU6jYNJaMPPDKhPs0L/UeLuRLTQwpE7BQhuQenFnTeWEtojWVRPx998E1wcFiZ4ObZVOndgMmT0f4x+5GKe1+jZvzCm2QR1dXiZtOmZz7tHNkdW/PjMGswccYv+iESQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790895000;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Date:Date:Message-Id:Message-Id:Reply-To;
	bh=qh0Sfnrni8gq0oLliVbgfWQGxqvJniUx/OYBxyw/F6M=;
	b=Jg0Jvi7KbOP0xLFKJpfLD4UPuZmgO0o7N01LvLLaMhVZcjFR7hL595Szy5D0AuJk
	qc1dSMqaL74S9TNerq7cnvYj9xwkBuDNSs17HrM7aSBn3X5JsUR6dZ/aJRWF/06Xs2a
	CxRDvyTVwNf4RJF96xsvBTdtmlyf6Xq1LlsAyBa4=
Received: by smtp.zohomail.com with SMTPS id 1790894988839735.0728360045733;
	Thu, 1 Oct 2026 15:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] drm/panthor: Fix partial unmaps, again
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
Date: Thu, 01 Oct 2026 23:49:40 +0100
Message-Id: <179089498035.1205040.7457117514529267599.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=616;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=7TymCWvJwd9v+SHxzA+YtR78RfJ/Erc64w2qD7+PdYo=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqvuOIFegZLKBA7Y1GS3D3idCVxFfrPRCJXcRQH
 o3f+WaAIVqJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCar7jiAAKCRAOJn5M7lND
 PRznC/9ODJjifoR833I1eLybQJP3iGLdFjsjAE+ZNlb9yoX3nysvvLlOx1SO9zB2C82vtAn6L+u
 Vx/ROJFFhIoCIGfUZnERXtzObYOIed/FfpsMe3BTCk2ci5ApfXqwuOQ3cUhigtukZ+NcSUQ73PY
 wC5L5apmme1hLlHGurXS/BR3YKZHapGaE4zsJUW/ojpxvrta4JxjszLXum+61jl236pO7VdBzWc
 YugWY+M1O2sQE6MJKm2vBA9GIrZFzfslUfqDo/580NBeJbacVCN2ESsOa8q26bk+V0BtIRf9I3+
 D/lv5FXIRGeV7c8Oy3Uh8sm3L/aIteYT/FKE1veMJR4u/c7v8xRVhz1FY/uP00t4hAqlYz176DT
 H/30khJsqVNtF+58kFAzgmJTu9EHnKLjvuQvczkmFdgfEJQfomWItH4JuZNBqxXL9OfLJPz5kRP
 tjso/2f/yxzJcRTDcQZb/k5KfOinYtF8UvU6gwqZoUiYEX23y57eGPt/65o1wrSLtQBuA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

On Thu, 24 Sep 2026 13:04:37 +0200, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> drm/panthor: Fix partial unmaps, again
> 
> The first patch is just a theoretical perf improvement to avoid
> unnecessary unmap+map caused by false positive returned by
> iova_mapped_as_huge_page(). The second patch is a fix for a real
> bug when iova_mapped_as_huge_page() is called on an imported BO.
> The last 2 patches are just consolidating the logic to make things
> clearer.
> 
> [...]

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

-- 
Adrián Larumbe <adrian.larumbe@collabora.com>
