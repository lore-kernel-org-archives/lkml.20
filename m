Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175942AF82
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526226; cv=none; b=md9yE8sr+lnPuF+CsFt4o9YqNR8O1Iq/PBGBB+tCxziIEGRgtjOCQ8gB9C6kb4kM+Y+PJRYqmZwaDvHR6l/3S5FUKDltVar4GdNoAgFmplFGiU1RxoCQTK0gIpfiaokPEmDhY6O3JNPdNE+dfoPKs7cbYm+U5EcoxcAs82FjPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526226; c=relaxed/simple;
	bh=twyG+hvaeWEgfEEBBs4u/0rfGBcebog+Ejstb/fVe4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fY+tlrAYiNOEQWCk9i1PuS8dCFI49Wt9vZjordou3deGxOcKMoR6WhoHE6SbMw2Z4ft8jRua2jBPRXYf9jGpyffaFHxT2EGCTRgg5T8aYyBtM+hSwgaCUlZNh5QUoZI1QO+t38DLtFvxsa7n58XpJ31XxyKDKR0jI5hY6OZJo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaHTWuxt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaHTWuxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307571F00899;
	Fri,  9 Oct 2026 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526221;
	bh=vkRBDNZq5OcYWLk9onSjYu3HsrthG0aePTr6yUQXG68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CaHTWuxt6IErPXeOQk2i7VyB//76jOLgZC55XNz6M7Va8w85X90cBpaReuPraD8Jt
	 D3eCfCMvJvis7nV43ULVSTIGjKL+cVDVdYjEg/SVVI2hMHIgDM1N9s+osh+NdgOsiV
	 7aFikB1fq8N8QOwpAqFo9C1C9oiUqtm+dpZd4ouUPOaDqXmj2d7zgrWaIs2kQqW34m
	 Jkmp6QAYrcyM8YFAmDpIPJNRLcJPVmsaTiZZYpN/+ZVdc76hAY4VcfIFHWOcuH4Ev0
	 sTZXiPaaqkzZBcmby6/A+MpHHELBYcgttz81MBdzysKAaKAtm/tn66ov9gFTEUg76m
	 vfChNrRFsgUyg==
Date: Fri, 9 Oct 2026 08:10:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, David Airlie <airlied@gmail.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/kmb: fix bridge reference leak on probe error and
 remove
Message-ID: <20261009-adventurous-aboriginal-degu-21ed2e@quoll>
References: <20261009033537.3065836-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009033537.3065836-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 11:35:37 +0800, Haotian Zhang wrote:
> kmb_dsi_host_bridge_init() looks up the ADV7535 bridge with
> of_drm_find_and_get_bridge(), which takes a reference on the bridge, and
> stores it in the global adv_bridge. That reference is never released, so
> unbinding the driver leaves the bridge refcount permanently elevated and
> prevents the bridge driver from ever being removed. The same happens
> when probe fails after the bridge has been found.
> 
> Release the reference in kmb_dsi_host_unregister(), which is called both
> from the probe error path and from kmb_remove().
> 
> Fixes: abbe7f8144d5 ("drm/kmb/dsi: convert to of_drm_find_and_get_bridge()")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




