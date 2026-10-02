Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CD472F89
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932587; cv=none; b=ajC88XRIAcbqNTz6L6ZU5v5YQ5cqM3/Ep56crq7W3DdKVTluS1NucSeS6pANRoql94+wcjKYgjiH4ERg3oh7Syh/E8HMEva3UwlRWlsijzF7W+k4thaPp3m4bqivi4WiitKeflUMfshJZKwZCSDFkzXO4s3djxUSA2wVZQTrQ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932587; c=relaxed/simple;
	bh=MEreik6J3EAEudynI1ROkdNWYq3JQgGtrAgtA06FjWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mxnexdk3mopPn86eFHFI+XMyrfvpbNmzI/It7J72bNZX6+sJv4uAwhNdNQ371g2fGgyaOI6FDQGE3xHjNNZpOvIWJRTFGhw2CAIFFBzYAFOQSl32EzfVOpKYf7ynbYzWYg+lqwK9yaIY4RKvPFuXa+c6LFarcUuAEGzTyPptzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDLu+I1s; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDLu+I1s"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0591cf85so1213156f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932584; x=1791537384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=DDLu+I1sXWyctHrsxcuYFld752NSkl2FA/GHFKjSN3PkTO3gUgxb6KnIvkQ9gKEvsf
         otrQdJKfaLN7GjXPjpLcIV11rSECwIDIyd3CfirONe16XxfHO8bUDaCjG2UQb6Ax2cIM
         EEQD/uODrQVWcVTU4sGc40WlLRDdo4OKKURxM5IBXLmO+Igr9TwnCHLcqNE+ldzWiyiW
         Yqzh45wfOeZWpY7k1z3B7Ynvw8WpVgutRWBJpmO465kScHwiBca5GBZO8+bBzlh1ps61
         v1sdJrsOPSdBWRgVQ1nPpQliCEiINBd0p9DdzbiC1yIW+95fSTELoMVlWSMMWO6zUwzW
         nZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932584; x=1791537384;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=fu5gUIt2tlJ0Hswq000//3mgpiv3JEoQQxae/+eSiNy8zd8BG7bu9Plyqq2RjaMYgG
         GvTibhHhrt0Ufqy5nenhY/fUdEnJA6UgS6VuOXeE3lWfD3/v7fvowpxAOalqeiVTFQMb
         WBudUZZqQp8lwuGasbD/gQSHZg5QCRGItbhO6RRIfTrvw2SQi6zdhvmjcggQBjF0MZEc
         3GpyyD1QJiGWpUSM33Yxfh34qcfuL0iLtOiwL3p4BzapZg1KNDSv73XqnqT+ids5wAxf
         pYrucoEKxZuSI2r1Omyz8jDNkhc2SEuJ0yxf2ENNorEE/TpEvL5NvqwlzJSSAk8YcKps
         hYEA==
X-Forwarded-Encrypted: i=1; AKwUvByTGDzJtuMyYYqiLzdpBqtMnaiE8jNomLXNsPnf2AZgJGJh1HV0iE/7fGxglYMUhHCk9XDYazsxp6MudEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr4Y9HHFovCyU5a2wzH2oearzMsHZtafKcCeTYBaj+p1gRDDdg
	YTZX6Xo2pBB1tueKS49bK5EfLeP51NS/KVUeFLOYkrhfIBw3iuQE3HAdT7y/t0FFVA4=
X-Gm-Gg: AYBFou0vCixckbn63rT+drdNPOrnJkri1UGqU2UvCpSw9DPBi/7OBGuQY6DIL1XZJLb
	LwKeQqsTRnjRe4DUxyekdV5nS4Uo4LWMAsz38nqLYCndo4nA0iBVphy8TA6EVW6aq0ojUp5TTnX
	tDUPmTGPx4qdMeCg2csbB/RpSWqniE1QHqNEbGHhNnhhcYMyQgkycOZMSE39IIy28UhHQQEhcJG
	CUe8TJjmpwvcD7JalDYp/uprQJNzkQQVB6+rqu1IYlDaJXUgJQFZL4Qi+P5ESCvNZHrmLio90WD
	O6CBoERRXu8edQNScATOp2QViAmLjGcVYq4e7wNGk0cbZbQeSCD9licP7qmewa0oz6OI0E+CScx
	/QGGl71T2McDfhK+GYnyvHJpd27G4tGC+WAtO6yB7copOOZmziyB3cqeAh1QjwGk3eICTUVx3Nc
	JSHd6gBJzL84tMBW5D773ZDrel91hL3LLqBQjxc7/LQ2FzImGnxsRUQKTI7eJ4i2WSpPlAN08tr
	T2jMEbceO0yfkcTeesw
X-Received: by 2002:a05:6000:4816:b0:488:79e5:cb2b with SMTP id ffacd0b85a97d-48b127297c5mr3802494f8f.43.1790932584104;
        Fri, 02 Oct 2026 02:16:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
Subject: Re: [PATCH v5 0/3] Novatek NT51021 DSI panel IC driver
Message-Id: <179093258297.2282096.1579513931131957273.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1

Hi,

On Thu, 24 Sep 2026 18:08:13 +0300, Nickolay Goppen wrote:
> This series adds support for Novatek NT51021-based panels
> for upcoming xiaomi-clover submission.
> 
> Although according to datasheet, the IС has three power rails
> in the use case of xiaomi-clover, all of them are wired to one
> fixed regulator.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Novatek NT51021
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7d2dffd72625784945b8a467b6d47fbed6fe7d74
[2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/94e45e3ad539291bdddb3cbf8f1803d42786c70f
[3/3] MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/27282474cd58e274bc866fb881643cf93a1c01c5

-- 
Neil

