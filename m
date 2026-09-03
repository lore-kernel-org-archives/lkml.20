Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD383E4C9F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431116; cv=none; b=ZKl1IGP9N8HBzPEd1JvDmVzkWdLJBZUhekbvQ6AxcQHRtgAsqLcjJ0ADXgCW6Kk5R0rnGNGSExMjTsNqntA8PxwCRdtekitx46K5OpOgOMXAv4fAAuH0fN3fniUixuKqYtRMkh1kkPa2zHpq5R65zjQ0qj7HgW+OQr8CwVVQ7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431116; c=relaxed/simple;
	bh=RyRo+6hZHiRjffjlFStgjxryqkw/LgwQ1ceJNQmTM14=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Umg4wUDpL03namCqDRZXIKzNzQLbalpjYkEA5iwLSFzYN2BRDEiYhswSmk+zrMGIwq/PhI9dWM3Sl2OEU9aBylUZYawsZCCdEknZjB2LmoprJVS/b0PR01lbC8jFxg85tMkDbk8rALeb9mCQTGol3+A1wgFPHCaETFzh+aTVpqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGsRUb+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGsRUb+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFFC1F000E9;
	Thu,  3 Sep 2026 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431108;
	bh=m4yK/R+u3hHSAlhJd9zbO1t5Zci3f9ZtEFIxCHQsHcU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=WGsRUb+PeGQ0OJbteyDNOSIGlgLloF3Y3pNX3AJKDmfY2MOOdo/uRpca0GWljjYFA
	 OYk9Ypnnk2FWKuVoldetsyfuEk2AOXZXzZ1Oa1ihoXQ+L6xgo9UUkFCYF7DUauNPxD
	 tctdHRBXnTQQ8ridV+9CKjnPSY/h7SqzeWXz6z/Q6pBWeIdnK+eZMreXK8ReqQUg4k
	 YbOZHxfx3/nHoXIYvDhL6pqeW25RPovX4wJozjkz4Atp0iiuf2CTs/OLg7RSPIe1J0
	 UWD4hzkle4ACTValr8A3h9xapTvjD5uPdVpp9KhJR4vvPJeuFIhmql3jVpo36KQcOl
	 JXCHNqxqeQuZQ==
Message-ID: <6f748f7a63acc5516a6a9721c127b5c8@kernel.org>
Date: Thu, 03 Sep 2026 10:25:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RFC v2 17/19] drm/tve200: remove unused includes
In-Reply-To: <20260903-drm-bridge-every-panel-v2-17-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-17-2ab8ee24538e@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 3 Sep 2026 10:11:20 +0200, Luca Ceresoli wrote:
> The drm_panel API is completely unused in this file.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
