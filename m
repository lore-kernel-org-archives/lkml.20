Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626842;
	b=1ZW0ijGaMWyxhJ96fZZ78yY7Pse07itzE9tfAc/xO6Qi6y7ohOfzVtLM5hxsTdOhXLHH
	 mZvcIGKlSxDRcOIQp53ikSfqmFMFu/EjxemYZ6n4E9J26lFO3Obui78cjhLflSyoftFws
	 b+0iekfJwgGqZrqNGwvvv3xyHcV7A8zJ6PO+kPbdz0Map55dkbQYsny/sWs29F1Zqycrx
	 HqsqCl662h3wqXJxxN9HukwtHXBCAavWUkCuhs+xmA9QmUGyBExcYuzC1fbZ3uHy9CGh8
	 c5I2RVWKbbrhK2xDEF1WUPwXLpHuZYz4iRbX5baxXC+KFPuQCMdo926rhx08WGDytvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
	b=XYk8AYsHu6zzEZSp2a6UuhdldWqnQqTid98tjmtfn5JfILSz8vLbMX0oEYHC+/fPNkqO
	 A+BecoUWfTgn4ZiCt9OMPoN1RNCfhiGtZaspz+V0y/2xz4Z4pF+YZyD21cCsMdDHpW+kD
	 NIc8+ZUtmGDocfg0HlcnTRbuYXg0iKaqa+qYt7Qjjm76aUebIwUJZBjIvDaMvYrP4hLJx
	 ia+TbWJWM5wmczpluMDRWAPRUg41O47XRfghojHOjzNrh7GxDJabJ2GMCA9//0yAwCDhv
	 QsPErMH9iyPPbNjkUrC0C7jBUQ1N1tmlnXpULC0FeHdhboX9FL6J4msJpu0BEDz2Mww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D460A2621
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79D460A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25672105e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626840; x=1794231640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=I2qGGkHVM4HOQZrV0J9GsfZjA1PIAXAjcif1FjfLQhtZnQs4/DCNQ/EY9a5LgSrzgJ
         Z0DSLQsudURUez4E0NvnsFmBHuSDyc6X+eaTj7IxYPC2h69jy0iO7Gh20XAewo/iBLzm
         GxMNurdLGea3F1McaXdinIeDuCpkfqgRAri9wGBroMPjU3nzOFceCtR97AZhPgCZk1wu
         gwPuXoDMC+ifI9WHgnrBvHvxVfb+YyOwjKyDqjBasw3ovSkk7JW4b8hrNOIF13b0OJAz
         eA2v3FUVws+AirBAw+ekXENF4yDmNP3UcD1PyTwMSIJPIqUhCWpA60w/4OPEa7jT8XrM
         rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626840; x=1794231640;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=uL72jxUorq3OQpVLDjdhZ1enWvL1jnk+1Im37j83kGWoedLAZuTJIT8b4KX/woHDuA
         va1mZ2G5kPrvmVrjcegbaqWvoPe/+yNAGF+UE5GVlT4fNsiERqxiKmWGk6hiQOQStzfL
         NwWC77Ui3o0z84K3uuPag2kGyzv++8BrCbJ7+sNPc7ofuVKGDY16mCdmiKXNBOpJncIR
         vPDBieCIhRmrj8sF/xhWKwF6xJV/ek8hp7Ewuh5UDw3bMlzqqWNAQiS2xcJq8KdGeBNV
         wf0dhCgdglp5IQTrfSfp6fj25A67juJigJs5KFxU5jsPnm5+EWBvrxI/X1zlm4qT21q9
         stSg==
X-Forwarded-Encrypted: i=1; AKwUvBxMf3JsCkfHvGfU5c0yvnWR9g2A3f/IST0jPPiztWhZu/r9XV7qJtzVZ8DdZfRNSmY1XE0QtQ9BetXc7YQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb65OLVGHRauY51fk87wwDsTKgRvo6dEbR0XICgF/M67IVbKno
	2fPXx9S3a4GDsDkxoi/cy7QRvONTdge5dubyfPcsznCC80pIhTwQqNi//QGRd3643iA=
X-Gm-Gg: AYBFou2ABFMPkF1NUi5+K7bfsf1jthXuq4RE9nAHj4CDv5brLnExs738nziMk6LeGlf
	r2/X7qr6mMEHwSgFqMqm4Ub3JqH5cXprh8//yA1PwcEs0gT7QodJYpV/vuyTx29wQjK847wXbSX
	ywELKW0amdbVE251C7hD/ikDay12rlrUW/LaUfovIRZtL2sF4Ta+rq0qUKYT+ZZ/78sJrsqAMl2
	0htiwKFYKpaBHGJcf3RG/9VO5Sn/fKT8iNR+2yA6Vh/CQip2Us/MdyOPbipNR1DJZCa1H9jBzLu
	hvwomkqQMnLE4xMoQQfJkryMasnMtu8dL+OJCfQHYyhiftIk7t7r/SWFLmKiJFcGHeuB+Ki8IAO
	tBcNmiS4Byu1K79J9dIaiqYrhe1h/dxuXupS8zQGnUi/iL+ApV4Ez1E+AUwtZs6DZHXimpQs0fW
	Z0zgy6aXONyZp4Z44N61lhmVgvT8x0xjVGgHtEy67g50tKZMlu3OzIqlK64HDnLAVAaUVTHBo7h
	kQ1jFk0yEO6TbPIC0lTgroy7Gn7FK9Uc9gAfzGLdNhsVY0NHW7yu3LrYbXRdz81pc/9W7Vme1l1
	HTtCvR2Bfsi1UD3fEgDaXsaBDDjxk7Y5J2nE0/oPU4vd77Wo5w==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ac14fbdd04mr230324575e9.4.1793626839961;
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/4] Add Novatek NT37705 panel driver for
 Fairphone (Gen. 6)
Message-Id: <179362683894.3310106.5892756542563969007.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 09 Oct 2026 13:24:59 +0200, Luca Weiss wrote:
> Add bindings and a panel driver for the NT37705, and then enable display
> on the Fairphone (Gen. 6).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Novatek NT37705
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8ddbace1197498d7e32d36db66641b7e1dff868e
[2/4] drm/panel: Add driver for Novatek NT37705 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9ffe0df0262b573c276cc17089d15a08b9b4306d

-- 
Neil

