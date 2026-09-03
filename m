Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC5405C3F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431094; cv=none; b=gnDJ9HDkKgKg5J1jt+9PqwIHMZd0wf3KnV5/W9oA86eH6wBoU1i+s3kKgRDOtubGufflSUBp7CQgQX46VdVp7h73brYDYd0ECnvSdBimxaQhqcCWRS3GBbyQMUpC+WydfS/ng5RI+InowiY0IPrzgkiFVPBUgrvyzOmnqrDRya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431094; c=relaxed/simple;
	bh=ooi/nY2kW/WfPGmlzDa3C7sl5KQPmdF97whi6Dhvf18=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TcgpqVbDTpjXzV2deAf/sb3DddGE7BEDAfRC8Q8tkijKn5WCN0JhRZ/Fh43OjIIu8xQbdIOYhdr9Jroih6Z+rkpxBRzuzKthv9DD6GtUgX7OD+lLoIDmtWs5ajJ60asqaAqf04FML9YQp5A7PH4lLgNXoiAW/c5po39+bMxDKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZaY8dPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZaY8dPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600541F000E9;
	Thu,  3 Sep 2026 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431086;
	bh=ZJ88O3D/dsEifJzBx7Q6Y3HL/PlLBNCk6cqXDuc6+jc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=HZaY8dPYxAlRM9l7TjTLtFaAzACMuP1K/e4GLLV9Sc+nwsBPMggk96F2Bml1aPGSA
	 kJR/ZVTei7q27WukdwkqNCbJhdcYSNRiOXVXhIgsiouSoQUILgnKzg8N/G9NMdo2Wu
	 uWBkW9Kx12ranqhZGwAgjCARSTSDlYYT5Z8KhtODA8Mag2yS5JuE6mEf/CWev+zEdt
	 q57FPsgnj3DHTxcyXkU9uOpHWCjuKVJQrAArn/xX54003nfGnUnL7lq5rxjhmJ4zFM
	 bnZJgpDbU03DLP5497OekW63OlOcGy4qc7MIv0Sj2GiRyTCTLcOuJlqmZ+9UDPzWyh
	 uHe+19fTj+l3Q==
Message-ID: <0c61b9e91fb7a710aac27f62044906fa@kernel.org>
Date: Thu, 03 Sep 2026 10:24:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RFC v2 15/19] drm/omap: dsi: remove unused includes
In-Reply-To: <20260903-drm-bridge-every-panel-v2-15-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-15-2ab8ee24538e@bootlin.com>
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

On Thu, 3 Sep 2026 10:11:18 +0200, Luca Ceresoli wrote:
> The drm_panel API is completely unused in these two files.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
