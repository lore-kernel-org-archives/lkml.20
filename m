Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4C1BD9C9;
	Sun, 13 Sep 2026 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308458; cv=none; b=YPfaD4UlklOoNw5uzF3+NUrp4NKd1WoX/IXo0gEzJaTLReYzDAGOAl1jHErBnJ1WuOm0fFA39tA0qHUdPBUcXc9tflbafqZ2rLSn+QIlpklSBJfPQTfn49mp3wf4FC9aJBpTT011spLjBgmi9yRFSCU7bfTyL5K09EOqPadh3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308458; c=relaxed/simple;
	bh=ixc7W2hEoJHFHQTWH/TSY9pqmLaZyw3GY8SzVD68ZTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQpYGuUvAIbBo+2cfI6tIFSex8/yfPS6j4yfmjhAWlhnrRVhaxliB+42qu0d22xw7pQlOrUr7H2whZLSV0uGbJ6j8mpsYWxzLsGNxKh75htLPid55GrC/l/aX4d1CS7TE3d8gbgm9OM8plALIExp7bPcLjnWRXfM/krvxrnutKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Dfq0amYD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XvtL4TNd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Dfq0amYD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XvtL4TNd"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789308422; bh=d/FolRGNwV32g+HDDqmcEuE
	qeqSAhKnzy/VVhQSphPs=; b=Dfq0amYD7lqUXWfFx93w4ioc3qhc+HEuljkNQpRBpXb4Ixfms3
	yqh/Sdety5Q+OHNvY8dPP+DRbzt4j9INnUML2CM4vPlMJuCw01bbtbHbRyJci5PiAfteBa9o480
	f/J/BaAlSabfFZdDsPOgQ4jZdWGSjuo5ES8rgYzc1CGcLiPIf3tTh4agQKoCQy4AbqQ4qZkdruG
	ZFj4n2zEHkibItCLSVFcfd+QPWgqHGS/wXnKLvDyii2oLo6bX8z2elT/UgJOMsPmw7oRVZs9wey
	HWoCnsOaPABY+GaajFK/AShljO1TAVrRwtfCRcR8MZof9uXZt6/fFs+1+r4/Mx8OyyQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789308422; bh=d/FolRGNwV32g+HDDqmcEuE
	qeqSAhKnzy/VVhQSphPs=; b=XvtL4TNdgfsTIiFHDl2M1wEhabYb8ybL7dnap4Ui7FyTxyTJWE
	e7DggnBYSjnYrV0PgOAaTNI8N7/xVUTAKYBw==;
Message-ID: <0c8527cc-2ed9-444f-b113-223f117e635b@mainlining.org>
Date: Sun, 13 Sep 2026 17:07:00 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
To: Ryan Brue <ryanbrue.dev@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


12.09.2026 21:22, Ryan Brue wrote:
> This series depends on the following series:
> [PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
> https://lore.kernel.org/all/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org/
>
> The BOE TV101WUM-NM0 is a 10.1" panel present in the Amazon Fire HD 10
> (2017) tablet. It differs from the BOE panels in the dependent series in
> key ways:
>
> - The pin count is 51 instead of 46
> - The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock=1 instead of
> burst mode.
> - Different timings and flags expected.
>
> The init sequence, flags and timings are mostly adapted straight from
> Amazon's vendor kernel.
>
> Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
> at 62.5 Hz across a cold boot, display off and on cycles and a
> suspend/resume, with the MIPI TX PLL reading back at the intended rate
> every time.
>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Ryan Brue (2):
>        dt-bindings: display: panel: add the BOE TV101WUM-NM0
>        drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
>
>   .../bindings/display/panel/novatek,nt51021.yaml    |  1 +
>   drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 66 +++++++++++++++++++++-
>   2 files changed, 65 insertions(+), 2 deletions(-)
> ---
> base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
> change-id: 20260912-add-boe-tv101wum-nm0-da01c4474db6
> prerequisite-message-id: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
> prerequisite-patch-id: d8b58f07dc5c9e1fcf7c51a14b48eddca2e09090
> prerequisite-patch-id: 79dfdac7b7fa79f7d05a5f3849909c9a7f956398
> prerequisite-patch-id: 79c01de4e67563772dde152cd4c4d0c568b14d17
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
I will incorporate this series into my series and add Co-developed-by to 
the patches and your name and email to maintainers.

-- 
Best regards,
Nickolay

