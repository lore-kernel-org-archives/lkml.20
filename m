Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38E475357
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099508; cv=none; b=HTpzN3/dOQ9bMcKh5PNlMa1dpYWi/MFMMO25PYY0IiQjc6CAtUbBug6ol7akAGHaf3A5Dm6GxZ8wL0Uc6rKgwwih/PMy8EhRehQMX1LdT+cIQpj5qa6j9KqQx1f0OPkpfafAopoJy0zuYGe9EE3K9ImV58Vfo3Awm4xH+Mk2Kvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099508; c=relaxed/simple;
	bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uuil+q1Sr6flMdeTbgJGtf6t+LuxoEVbv/8axFNbtGvx2kO/Lv7XG7Z3seSVtw+c0bMRTEoJIATgpu+W8RB0ovKu6zXLlw++ziBPIZC42/OOGsh5WE1wjlw1gtKIFkK07oEtkRUvdq40pUK0KKILoNjALcSDhalqP29hg7EV0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ur/msL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4ur/msL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so467805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099505; x=1790704305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=T4ur/msLvaIvLk1TDYJtusmbXGtVSgX+6zHarAzlEKJzmwcgkHjf5tt0izYJqx/G87
         iR5LLMMPup68k08zxxYu+R2EQTMiseF9Gt3P0F6HvWja0A69sXpwzKMIouOLG1YFrbM1
         RXBkFq+u349ag8qGr2ADCUjXK50cKnpCgXi35AEdNMGxrGsWmaGk2R4Ib3dUEE5yOu1n
         X/Mq6XVCrV75EVPZUBZPUJgn8NLgow1aiMluLhbxOTCh+yws4GflGI+GLUZwzV1EtCMO
         4Rc+ny2RHizoi8ORV6zweprezCyFGxsA6KGdSuT49HitXDzVKNF9ZRzy2Uswjr/U8/Au
         k+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099505; x=1790704305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbP1v3Oa6Pp3U3S6vdLzzYTTcSx5iO6uWXxoR5VqFYM=;
        b=I1K7lYQnHLNmAEbZPOVcNOrtcz9OEwTxum4hAEtOK0HmEWuA0YCl40Y3F0IqdI6qDe
         dNagPgo0yXEMvlyc0Z31IjRDWsSmHx3MAZce4FY0NopPv6x4N//tTvNkcz8IfNAocvM3
         MVyShnJ0P5H9UPzQaIAWGWx+ywQuOTDboP1FVgQSuUmgLJ5JRO57ZmmgyTSXj+JklQ8s
         Nxaq83o7GiswkZREq5SXmqSE3D+z1Wp1OfKKS6ynKqYaRNUpn2VVTR/tgNaI13uBltX7
         LFgugtJu3pk/AGWCO2Lk3h1YS3jMXDAwGiQmnqOkWuMNyK+rzCZv19TRcCool8vpK5bJ
         Nuhg==
X-Forwarded-Encrypted: i=1; AKwUvBxmWouSvNyVbvPjdRxPubqQeuPRcW3qftlkU1etMIHY16/gBij+RrnIUtKqLrdM6FXZ1B/Pv07ADSNF/f4=@vger.kernel.org
X-Gm-Message-State: AFuF++k60fv+DX4EXGJ+O5PZFoUxn3jdCL1fw1BdjUMd223IaKBt8mFF
	jRAjm1RCgfC9hD+CLIoleB0BwWkiTz+bfO1ViVq8T/kNKacHXiVV8Qd+
X-Gm-Gg: AYBFou3wofByj2qMW5M6xUq3XA8PxuHc31zWfT+t2c/MBaMktrm/yZ+4157+gVbtGst
	D3JQ70wYnjT4VYYIPTSBWMF1574Ky+LwYlzZuECiIldNSIv8MAFaTrkyx9zGfKSKaVUruUuk0XS
	HZBI+FwTBy7tkoMaldTKcpH/Q0vixPOCNh2kivRqT9/Pd2reDLDBnyOAbSy/9TudjvcTQsUJ1Av
	ijfDbgr9MyW8S9qk4G9GPkQiCZvOxQIAbZOIKPaBlcpRxcrz9wBuGOov/UmlidcSsnqhV0d1rDm
	rJ0YLFZ+7raMJnGBixft4mB4eIkWJ+DZwsyyHDSClFWKKVfoflT7HyAeS6RKIR3sR9mesRdxiQO
	NBLBnWyh50NySj8Z+dqL76W+baYw4Y/JxyJlbXhmTEc6wD14fmTRo7ObXtAN6iBw5IBExib/SIY
	kGxk+l2GScBcCj8VljNLFywSifudbhwdTtmwAhB8yX6ucVOA8YPSoEAYKkNRstZJFygWnIZzs0j
	+9fMZs=
X-Received: by 2002:a05:600c:83cd:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49fc573fa97mr180249605e9.27.1790099504457;
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde18555bsm8294835e9.2.2026.09.22.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:51:44 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Tue, 22 Sep 2026 19:51:34 +0200
Message-ID: <179009949426.334909.8218450300346111724@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
References: <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad reviewed this patch on v3 [1], a few hours before v4 went out;
the patch is unchanged since, so the tag applies here:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[1] https://lore.kernel.org/all/69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com/
