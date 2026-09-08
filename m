Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D7A34041E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858450; cv=none; b=nf2iUOypUWYmFcHfBrQEVz7D5kn6+eDJmVUz5pZdKXFdhRPjPPcDJ0Q6JWj5/ymw0nqOGyrwL1SBLVfYlJefX0mjFxFTTUSyGHu32C18s7iMvPo2QVDZcVfAItjT0CX8e2P8H2scaE0ZoBUHKWYnITJc3FxNfqa76pyzAlAaNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858450; c=relaxed/simple;
	bh=i94jsUvZRq+8SO9oh0wqC2rJaLnjy9REx5JOEeL2P1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXBxLE4MSW3FKB6Cr0gS8Gvtb1ReLojhiXhVFXkPxvTzeie4BbMDqAYYo9Dvtm/4YlefP71bab2ylBosNzO4+nDKJcbdJhoGVzIXE7E/gMjSWmvd9q/VWV/r0reSHpiIMfzAayNEJN4fFiPj66ITBTPWSRBqnaOvbyeo8jOSDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATBcbSfr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATBcbSfr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20ce3c118aso794247466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788858446; x=1789463246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ3TFbp27EDrida2ExbgWSsgk7vd6jvw28fnpdOrA3w=;
        b=ATBcbSfrmNhzh+EdsbpIj68KAS09QxAhT8p5YljSEmJR0Q4+9eQ1yMu9C/3kU7463B
         Z0awNT7iMvLCY95tjo0WAHVCsCENIotGrS4nrS4xayVirpLJnf3MkgK36VKvtjsOjVuA
         m2G67DWjS+e6g8DU8qELSZNj4I0Gl970cWLNl7H82xXn7HIVBGNIPRqr95fZdeO+aeWX
         leb/iQ7IHMvkd7OJ+SkvZa8f6eB4RQXxEDSqwwOD6bj8Zg3bH91rtVYuYPJf7kmBj9hU
         xUUEnuwc5AQH6T+9iwpHo9IekcHEfIcrVL/LTt32goZbW2mTvyjA73ymKzSujIbiCGOO
         agtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858446; x=1789463246;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ3TFbp27EDrida2ExbgWSsgk7vd6jvw28fnpdOrA3w=;
        b=Nk7TtOplRyhfvOIZJaWNW5Jwx8JT8FA62S76M1gaS4/N9L7wNBOMAqEP7kvFfehY2v
         2FBQjZ2enLI24hijCFMbVfZhGqxf/sj4CtBjm6hTCKB8CG8k2DXlLizFKNIbaqeoCRPc
         t3TXd0saYG19atEwcaexVFBbKlLl/Cvs4G6mBNSIa5Lve8LXaLDy6lz0C5ElmWB++Is7
         GEtqC8kfy2ovazg87xyKL4GA4hSE4imYrodfBhQNFCAkSh1CGbvS0eyq97I/rWG9LaCk
         KnHk+VSklGDp8t+NH7G4rs9xQ6779Nr80bWNf/3z6IW/orTgPv75UiqMInfyjVJjbnKz
         pYBw==
X-Forwarded-Encrypted: i=1; AKwUvBz/m5IBvM4zRErTfLNlyJJqOGxnJ6yL2hSDEiAcu5Gm8G9s/dRHS/agvR3QX3XUBZciK3iACVQWskhK4PY=@vger.kernel.org
X-Gm-Message-State: AFuF++nEu8HYZj249FfQpbScO4oO6xZQstQjajVnvoASoHvR+eSPO/YH
	CkPFss2nZsqj54rWn7HmRV6sniL28lr2c8flJmMkbIcpF4Ckqp+WuxJE2uK5Ik+WBUc=
X-Gm-Gg: AYBFou2Q32M4OP1p4kNKzbSK6HIhmA7Q3ktAoSTUAdmCPVpOpeCtTiTTitOZzxrg2qe
	J1I1+HlgA7WgaZixfb8d2ats6WAFa7GYh7P0p3TLLWZQ1eaRDU5KJFCbhxAPploHadN4uqZjeNE
	bTpCCkwVdWRc2XWxaRcj1IISyOjOUjLtZTHciClDZIORQM0epf25FZHIGT+F+DLOH5FiD/547dc
	BZvrHsWPZVDBZ6ar8SJ1BqduWaA352bXaBRK/1S3S3XWdticKHpE+x/okDEVabalx/CKUsEZGYu
	luQ3VC/mQAcFZO+h1AhrhgXPq7ezpnsBnBRpf3w4OEmphYfTaEs8cXstVVPKUlK8pwZNsS3SD+Q
	ZesvfqJxdNtLSs5Fl6GFalWFUuXqNPN9HpOyVr2kuPW8/7dgmP1Mc3PRQQrgI8VWbLBnrkAjjP7
	XM55T4WHLqsD7KeVSKAO4H63PeXrfWEUlFNiIXYoiYMm2WPcW9wzZ6xKyVVIQjD/456u2OaBojW
	Q==
X-Received: by 2002:a17:906:c38b:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c261cfd42d3mr604028766b.11.1788858445102;
        Tue, 08 Sep 2026 02:07:25 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5ace84sm575730766b.49.2026.09.08.02.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:07:24 -0700 (PDT)
Message-ID: <530717cd-ef89-412b-911c-15eda272b6e8@linaro.org>
Date: Tue, 8 Sep 2026 10:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: ov02c10: Implement get_selection
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <yPgng9jw05U4c7lvF-XKmPIHOi7YeDi6CirTKGWG528IRm2_DrMA33QIGRuDDH4jY7eCx7IG7y9gQkolM_hfNA==@protonmail.internalid>
 <20260905030732.39196-2-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-2-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> The driver does not implement .get_selection, so userspace cannot query
> the sensor's native size or active crop rectangle. libcamera reports
> "Unable to get rectangle N on pad 0/0: Inappropriate ioctl for device"
> and "The sensor kernel driver needs to be fixed" (see
> Documentation/sensor_driver_requirements.rst).
> 
> Implement .get_selection returning the fixed geometry of the sensor:
> 
>   - V4L2_SEL_TGT_NATIVE_SIZE / V4L2_SEL_TGT_CROP_BOUNDS: the full
>     1928x1092 pixel array.
>   - V4L2_SEL_TGT_CROP / V4L2_SEL_TGT_CROP_DEFAULT: the 1920x1080 active
>     area, offset by (4, 6), matching the readout window programmed in
>     sensor_1928x1092_30fps_setting[] (registers 0x3800-0x3807).
> 
> The crop is fixed, so sd_state is not consulted.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
