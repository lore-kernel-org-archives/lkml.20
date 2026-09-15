Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940DB3921DE;
	Tue, 15 Sep 2026 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468777; cv=none; b=O3/NSVIX1Ev9gwrvNo+6BY8+++fFANR5prmyfc4WVTl89XcddmoVFgBWgcUMecMejNooEGeRg4t6moEnl3EDCBiKNP7RtX2Q6xcqiwBIhfgvgxT8zpEycrPzMClcsgQZHb/024SwbBDlkVRHtusvnXP2Y7wyO3TBJu/Uh2is8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468777; c=relaxed/simple;
	bh=tTTo1b2FHnBApOFProxdU0vyMhrX5kO/AGRkhlVKgLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCX+rMYbJ4KpiDhY1an1bFE7r08SHpLWz1aD589mx+8/DOxCdlCEHNm9JAJMmHD4qKdZFgiIl/KgDK2CU1CPqaZqmaofrgOh5zxwaxBrGuwS3YNZusnm6vKTDC4/rDG8KmkFJlYWiAf2qqFJ+9R9zgiqt4GPOT+fAAbrfZH5KuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsvJHjde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsvJHjde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED021F000FF;
	Tue, 15 Sep 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468776;
	bh=tTTo1b2FHnBApOFProxdU0vyMhrX5kO/AGRkhlVKgLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DsvJHjde5hRHbDp8UkbkUBf8VNrGZjHlbZQwjOtedLCOrq152tR3KVyn30JdNeswi
	 zw0gh56h0HBNySyqrmF/AHyqo9tF8tBVhxY+fSmMNsQa40BViuy6bbZSUIaBxKtEPM
	 tWM8fMZaxcR9++ZWx7dwYk3/sJIrW/M4AhCHIbE+lm3e7K3vfEZ3eaFg/ral1jy7nl
	 KSiKtGzvTpCxqYD/5JlZKGt/F+7MQaLQeCiFxScmhYoyznEQvZO8UTa28sC3IuFVtV
	 hzW5dLs4PDuv7W5MwPBhYkcm2heFTLyt/A6Gw2BcHpuv14396ySS5is+Gz6v905GRb
	 ylGGoMtgsWhMA==
Date: Tue, 15 Sep 2026 12:39:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
Message-ID: <20260915-funky-hot-lobster-2eeee8@quoll>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>

On Sun, Sep 13, 2026 at 12:23:46PM -0500, Ryan Brue wrote:
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017),
> boe,tv101wum-nm0

This tag is applicable only to one patch out of tree, so just respond
there instead of causing scripts to get this tag to all patches.

Best regards,
Krzysztof

