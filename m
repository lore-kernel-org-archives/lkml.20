Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF333F787E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373954; cv=none; b=n6J2s5+lcJp0DYN4ZqaWc66N/DFmPpftybUhWpB0AK6xgfQjwt4Isgds356N7uwgokiNzg0H6nMhU1mnrKBhaoQX0e2K0d1TaU7N0BpjYZlPPZcAQ+eBnsv4154qe7PfqxjqvahwyEpcuKjuXQSAt5YLDZyZrWwjgI7XeDnqYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373954; c=relaxed/simple;
	bh=BKRDGeu9OvCqTSJJOcDI+h2SnvOE0ecpgpKwpnOvYSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LT9TmNCKImJJcwdB6+nea2M0TN5s2BYjMpXWoG8agp/70e04f0gJlHYinG+2S2q77GzsW9xB8e4jpqI6PtY1lDQRoHMc1Ussh4MiFi+CpHC5jtXttmAOKt56K90AjvOF1dnaVe3pAVAGWfKtbp9eCnShNr5rG1RyvbKMofJokys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTWI23Rj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTWI23Rj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAF41F0089E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789373952;
	bh=BKRDGeu9OvCqTSJJOcDI+h2SnvOE0ecpgpKwpnOvYSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fTWI23RjqKbU/vDwKqXiPTUEf0iRjFXvQ9G67G2SlkcUmZcFkDRsBoeF4zS2rBH9t
	 6gjXKVs5A7e16an6vjTFLSdC3S3AHlhnePfCJx5iWnkOCnZVVVdS9AHODdOBz52Bo9
	 f8ycP2+fKv+kgQqQgX3yKR6aUFIrOWK+szYn7z9syG6HmyCj1dDdJ7oO8uwXox8GaO
	 +UP8Tux+PxG9/rLJmAoQ5FQBA/5Hnt3r1OxLbGPsXrAQif1pTGu2eAbkdSCQqhT8/s
	 ESvkFbp3UiOjuY4+IuWAJ/RyPBo/DIvw+Vi6kIpnycQ2+nH7ghhLz9gNggTiOxtK88
	 gtfh28gxTl7bA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so2725764e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/EA9tCGMJakZ3iLFtmVGDZ25+4PvMdK8cMH4XZ72J8XVcxbBMloeGoFXlceUX/XStK0elO0d3jGSgQzg=@vger.kernel.org
X-Gm-Message-State: AFuF++lBySXPkHgJJXQvYyqaxPMbcFU1fV4m4ABA1iv6wTtEwVoEt0F5
	pg78C7GIkndEgmGjL/JHxl6Kyr41hZ/aLuTpXd6YEh0dAQF303zUIFkxJAPYVHrRhXHfgPik/+y
	Mv0p6AXDG3RcHkwkS3BxryO2YLZtlpgA=
X-Received: by 2002:a05:6512:b83:b0:5b6:1a7c:fd81 with SMTP id
 2adb3069b0e04-5b8ae69e682mr379688e87.39.1789373951557; Mon, 14 Sep 2026
 01:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814-drm-bridge-every-panel-v1-0-19cd5277cc8d@bootlin.com> <20260814-drm-bridge-every-panel-v1-8-19cd5277cc8d@bootlin.com>
In-Reply-To: <20260814-drm-bridge-every-panel-v1-8-19cd5277cc8d@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:18:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqFPm99r4L_3whHG1N0k1aCCJj0sDjMRTZN-7mgBaAeg@mail.gmail.com>
X-Gm-Features: AcwNN1XU1jSnsxnc26IQx4SlPy6FXnURlodugh4j4_jBv3FHCcqi7b14XgKpGIo
Message-ID: <CAD++jLkqFPm99r4L_3whHG1N0k1aCCJj0sDjMRTZN-7mgBaAeg@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/mcde: dsi: simplify device_node management
 using scoped for_each variant
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 4:07=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Before further modifying this function, simpify the struct device_node
> management using the scoped variat of for_each_available_child_of_node().
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I applied this patch (8/11) to drm-misc-next.

Yours,
Linus Walleij
