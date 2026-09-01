Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8ED4734E3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252434; cv=none; b=RVlhZ3U4aiiA/ywYiAX0N67KrCYzv4gReEUAKV+8gPUE91CWY347OxFD+RlKnRs5esl6RJEiE0u7cO2kPbGQblvEqOb2hRqlFApRVgh4mwtMp2JNygnIsvQC1R6vDvU79hz8Mpifn5EjRQGLbmYGPyrMvi16cgNBop5lQHVk7kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252434; c=relaxed/simple;
	bh=MEmG7l6iAdmI/YvyQpJhnyCrhkiaMBMLYTPObVeQeUw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QINBFwSAST9A96OA++MqZm85/T1UoRxWue9YnXw+1oQqAvgS8n2x463pG1tjtVcyVIAK3Oi5iL3Cl3hPG1lAwlSwLpQ9w2+yGyHragivt1oa7gTX4rH0OMM1K4oTmmzRyWID6aGDtDemCrQZcDEe6nVAKMQhsI/+PmCWAnlkOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNDLS9Su; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNDLS9Su"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F921F00ACA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252432;
	bh=QLpnt7YiCYJrEgAeUHHIu6Qg8BdH0qYhZiNPfO0ubZ4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hNDLS9Sun5SXZIITGxOwVjAzJvcmtfQJCa2ITOMszNfr5254TYWlRcD0yzsE63iZF
	 IoIfbpNogBNCkao1+2uTM7E7vIxOunAgvb2urlS+UjsVF+ps9JZXl2CWmsZNTHsr2D
	 bsHWaGNkp7TE56giMnxyXB5eTwCXH1mr3NyIY/KIrQe8aqXIzPK8xrtCt7Qx7pECJH
	 ihvOnt1ljxZGvt4y6BQ8D7t7N/bxtssLXM4OCD3Y2/UsjsEdYJ5+bQLMVKk1cOD9/y
	 nBkklWj7yarNU4taeLmuLh89MlfkoEcdnwQCRadlCzkggpWctbx0S7xCw1OtiWDinb
	 DcfWtVUipgu/g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so4855775e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:47:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwYYIuYncbcerVQiBTvwJaBu1oYglvC9j1T4FSXHmcIegr5CdYoTPhfrfD2SfKhDnQKs/RsdHRVQmymfGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMam/ed5JxN1ZKnzKOz4GEaTK1d+4Vgq6yhqAQZZ2Upgjj19y2
	zXyBYxsFMDt7x3y0/qPyU+Jdhq56QR8pKh1oFum6iWJAepEuvH/jnx+SFK9O1FP26uwJKjE8vdx
	EU9z1fMlPHcnE4Y1umESJE3U2v5cCZGIvUY6TqgZN2A==
X-Received: by 2002:a05:6512:31ca:b0:5b6:423:9fa7 with SMTP id
 2adb3069b0e04-5b60423a1b8mr350826e87.31.1788252431238; Tue, 01 Sep 2026
 01:47:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:47:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:47:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 01:47:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc9vsL-dzsR=ykJB=-y9erh9h2bx3Uzqu2Yda_Lydow-A@mail.gmail.com>
X-Gm-Features: AcwNN1V-3V4PuVTIv9RVJ2LYEGZyvIJ02blZc6Wj9UEP5px39IwtttMbEUsI_4U
Message-ID: <CAMRc=Mc9vsL-dzsR=ykJB=-y9erh9h2bx3Uzqu2Yda_Lydow-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Aug 2026 05:47:19 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>
> Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.
>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 5e0ed30a9a46..f6534e9e9912 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -74,6 +74,7 @@ properties:
>            - qcom,pm8994
>            - qcom,pm8998
>            - qcom,pma8084
> +          - qcom,pmau0102
>            - qcom,pmc8180
>            - qcom,pmc8180c
>            - qcom,pmc8380
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
