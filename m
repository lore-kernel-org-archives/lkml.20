Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ED9581226
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202335; cv=none; b=s/LN+BWeJ3snV4hacr5CYKz73JjHEV0ezMqIntDwJPltkFsbmeglVNSSK1PVFBRoIPcDQ94Azi5rseo0dD9iHrMq9CktjMLuSrI3BCeUqAjMxcAQxgVFPdy4R5+fPX36e75NflsT+DtTsHEjAxPIdCp+HE6eDUWD77rtWOZNrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202335; c=relaxed/simple;
	bh=Sq1ys/pcaUDWy4lVzStpIlZs0Pe2mQbVBLmjN5cJ418=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpVnASBh03SAecoMFioPlDT9yO1VR215fohkXDiuSZxpp8LAgcjKN+nv6G+YsXM0XlJMFwREVnBhl5sjUR4haWbOaBpiHnN7+fRGzqUR6NxHpcyFnjE4jBT1PZx0ahhfH5niTeYTbX2BDVWR6CiClgwFbw63/C64e9vJPir6qvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijtb7S1s; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijtb7S1s"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so491705f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202331; x=1790807131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+jQCVrYZyXr3HsKGilur7CRVT4WUdAll7jn608CdBo=;
        b=Ijtb7S1sYCur//OBdjwx9HqUQSNq7hqdeNelc4Q+SYyfbwW0Ew7mA9l4FR3KzFiQ+t
         RbPNZ1EUNeP9KgxmvKbR7WOrrark0hfhmf3NvBmbWYg1GDCIcbrd+KJHJPYMome97cNK
         9jJezpIQQ2xVJoeKC37NegsiJFUPxbxpD0QTXlwSwNYlLNgwMCzPhydGs+Y/FxUxxqk6
         yElHbDM9NdVZlFmj+KnFUvX4Ul6LQonHQgc2ojVa0EjDfypnKAuboLWNUtBnUti0B7Dp
         HSf76+8ooOTRAn6Q+b1elKdVBo/hxr8DAD+xeAWvfLDjxdyZGuJd8aJ9MR8kcbqzla3u
         J9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202331; x=1790807131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+jQCVrYZyXr3HsKGilur7CRVT4WUdAll7jn608CdBo=;
        b=KelUNbxRzSm7mwhzgEnmDpNjSK+/B/xq9Vq+ozCYwUJNZMO+UJlwYM1Q8n+Y3oPCTh
         SqmlhOKVQRunvk+u4xjOOnOR158MRTXjVWsJFZALlldkT2II2LfHdQ7zUcSzlJ0qgcTU
         JT4Cvc6Xc1rkbr8VjX1PjVNEWvltfP2EEd8rnhlLw7/tLCSK1EY9HFl9D8wIi03Bn/qY
         h2uc7de6agyZ2KNUEW5ZOif5rSxwKQ5w+IgllDqG2i/Z8TouRzXArlYA+I4+1zm8b7DH
         A4EjpQkV8yVbx9xTKc1vWBJRCm79AdLZANxLJnB/CVcec/ChrYlGUpVrjNNbEcTwgFch
         pIYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEhPqRQyNCX+LzfHk0lPZIm1uWPj9AHOtWDEDdp8CiFnXlyOKSgX7jFhFen3ZvI43ajNvSJYwbjwNpcuw=@vger.kernel.org
X-Gm-Message-State: AFuF++nYLn71WibQ3MBgwC8xQA7zfNa7tdX9F2eromJhBSta/XKKGv+/
	tlUBOB8/aev97YDDmN9K3YIINiFxX0wjMGpj8mvH9tLK8a8l75Tc1eIp
X-Gm-Gg: AYBFou2R3GxBlJQAvV6egepzZnEakUSWZL7/TMn70zgT7gtmGXqRBOOw/fItcvcrQcU
	OxMPSklamCMNqU21Z8+bJFtcHal3Tta/xVZNyQ1a5lAxoLKyn+plSpzr4GipjxtJftZ+AFlC0Ym
	qODAQr4oUgd9yqXPFajWgXvYs4ch33MFGzcbnr9w/3ZhmYWJ7H8y8TAJVIa8jXXe+8O4ff0qc8I
	rH7U6Zb/4ZLP3ijcdofR1qTX9sPzPCuzLPB3heNc+s0jPXci70Y8bQy3OCHVE22hCR8xTmdoXl1
	XQLOSm2oXGF/LanfDBmE3ylIwbaAP3akv/gJquUdbZTKUEnl+707fyafR0cTwdLJBVSRzcWXOPq
	noDTqayrZQOS90nUdpEyybuM7zkNpLSIt8Uhdmg8agmwVgatrjLu5fE8PRrHwM9mwjjSgPovCr+
	BVfXDZlED02CMDlWn9GMEXkjBUk1iZ17eU02ujRK0Avc6Wsx/8e2KX+sD8ztEA0jeMxswJQAYi7
	Uiw9ITsOZwvKmF7v5NEdqLLAblEXuuAiw==
X-Received: by 2002:a5d:5f8c:0:b0:488:5589:d358 with SMTP id ffacd0b85a97d-488716ca7b6mr877328f8f.18.1790202330461;
        Wed, 23 Sep 2026 15:25:30 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm9726748f8f.29.2026.09.23.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:25:29 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm845-samsung-starqltechn: Update
Date: Thu, 24 Sep 2026 00:25:20 +0200
Message-ID: <20260923222521.188197-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index bd59f1dcd96dc..c156ed3733b4e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -262,23 +262,23 @@ &mdss {
>  	status = "okay";
>  };
>  
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l26a_1p2>;
>  	status = "okay";
>  
>  	panel@0 {
> -		compatible = "samsung,s6e3ha8";
> +		compatible = "samsung,s6e3ha8-amb577px01";

I guess that keeping the original "samsung,s6e3ha8" would cause that ABI break ABI, right?

compatible = "samsung,s6e3ha8-amb577px01", "samsung,s6e3ha8";

Anyway, LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

>  		reg = <0>;
>  		vci-supply = <&s2dos05_ldo4>;
>  		vddr-supply = <&s2dos05_buck>;
>  		vdd3-supply = <&s2dos05_ldo1>;
>  		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  		pinctrl-0 = <&dsi_default &dsi_te>;
>  		pinctrl-1 = <&dsi_suspend &dsi_te>;
>  		pinctrl-names = "default", "suspend";
>  
>  		port {
>  			panel_in: endpoint {
>  				remote-endpoint = <&mdss_dsi0_out>;
>  			};
> 
