Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD53AFB07
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822904; cv=none; b=rI8qoaC1QcvVBNpkFvVY2RNuel4ybjzUjVo0iUAYzyov2zVSAwV1EEFqnic79gviTkL3BeLfuQwAMyxgrMDloSzo+NDnpXX3YHfcLRIa/V6Jp28swj0iR058h1eCCurqJXVfs8nJUC2spw6y/cr6Zz3AxuCLmm6xHAgTJet/y4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822904; c=relaxed/simple;
	bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yh/q7ZW8WVbugsqb/sWW8Ycbqm5plRp6lENhiYIns4qPgb5CKUy/bb50wWpHayIcHYkmRDu/cWmnCtxXdpCyW1VcSO9AEpIsbG28dQ+rG6BXoT409f2xGJtajTs7DVuWAKMyu0tZ7uGRA/ZF1tKGs8f1DGi4I9gnR9LEvoji3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXdyBIrb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXdyBIrb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12071485e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822900; x=1790427700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=UXdyBIrbzpBh1E77+g/CtssQ1/m0/osSFpCQH/9bZhhZnbwji0JMcFCd6vr7zWjhhu
         OSco+zmhnmhSdrtj7TLuXYa4zUB1KZuuUiD9md2H6d3s3LlAdfHs3SVUd2otPG42+9GC
         ViJeidk3BhQZbRR3/D3O111KYtdV3ltjfVd3YflSDFj8ggT3XzlgPhMD4SKHnYFXOkCK
         La6EKZT4EhFxybk8b5vg/Rb9oBOYUYWv/THvvU9VDQHmkXmmEmUgNOF9k613ITleCx46
         g2xkt6I1YgdhF/5JJmFyHpubOzCiWhT6puaw1n6nR27QjkWX+MqEQoua/o2nkgCcAlbE
         4zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822900; x=1790427700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=xeynJ0ZhBB5MaiQHDVeV7at3+v63PqgbIsUaEVIpRvI6ebXYSYv+58hmMRm/TPKqHT
         I2BAA9PbL/iGFFnS9l9A2vLo/4AcAM8U5mBaJ9l7nv4hyrGXXIs5WFhm9QuWw6dddp1V
         gAsKGwD5fOExE86Q1h6Cyzm99yT7OCMO7RmQKySQ+u48EctBwx8aS9zWLjW+ywWa389D
         W4A0HNLVfuq0yI5Ht98wh1Yur7g6/R7vDuu4ulQeYElU0Nr0W+vrrr9st0cKWpEuHVDV
         0XArm0Slnruh6nlKpzOoCAiapFKoAIH0P8DdXOkW0gJ4KrURN+4PHsHGFAPVD9pUgynO
         5aYQ==
X-Forwarded-Encrypted: i=1; AKwUvByt0+0ACJoqYMK2p0jl7YWLlap1nBNNdeWaFwvmq0ylZi6l77f6JTo6yyqS3w+rt05gS46d7uOAl5hPRR8=@vger.kernel.org
X-Gm-Message-State: AFuF++n0SgMRYgI//HVho1S8zfqvedZO98WJPQ6AsM/6mtDq6dWpmnZf
	AhZI9OGdaW4/bpa+4W7F7ab7ErKWN2l0M8TIhYWpAfPQaeqFDEM4hYG0
X-Gm-Gg: AYBFou1W/Xu6gpqadT5lIMT6lVTVG41WRJipk0bsinRvoYeAAjlg1kZzWsa1BIGn8JY
	lwHu2XcoJX8JiMojStJEsdWVZF8nWWvOEsG7U8GdnXt/LaWnH776Abtf4KSCgvYSt7T0bW4rOEA
	6b3yJrEbpgiF81Ol1JExe1EBzKUlIISQygq2mSK8WQqzc8gBeQv6B03CCbnn3W4XMRe81r3YM28
	mYuvO4XGOo1smcSVUIMtZD4whAWlF/FIOgA1/I0Y727eUd2ncF4gB1nQ4/NqqlCYtSxi6j7acKh
	3z/RVUvI/Q5S5hDNeBa/kkMfwOSEQeCjAQeqR4sfkrEHPg2oT0uq6hze04wUlhV/KXJp5niKbTY
	u79XfeDzGoW5zVRRFEySMX28XcHYhD/H1PkqmeR5C8IT9syiJD3PrR80Mg/W8y/5k5rbHv34UzK
	cHyPGfD9lRL6SIAgrTt+x78IAQxOlVgbA+0TBU5drhZHiiaiE+ZZDL7H7R3C1ICzlex0f8d4nVk
	JL+XwjL
X-Received: by 2002:a05:600c:3b05:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fc574194amr69801595e9.32.1789822899376;
        Sat, 19 Sep 2026 06:01:39 -0700 (PDT)
Received: from localhost.localdomain ([185.40.61.191])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm65037995e9.4.2026.09.19.06.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:01:38 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 19 Sep 2026 15:01:28 +0200
Message-ID: <178982288839.2267.636188297415440296@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jishnu,

On Fri, Sep 18, 2026, Jishnu Prakash wrote:
> PM8010 is the next generation PMIC following PM8008 and has similar
> functionality, providing 7 LDOs that power camera sensors and associated
> hardware, with some differences from PM8008 LDOs. The series also adds
> support for skipping interrupt configurations which is needed to support
> SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

PM8010 at 0x8 on the camera CCI bus with no interrupt line, on
next-20260918. The MFD and the regulator probe, L2, L4 and L7 power an
ov08x40 and the camera streams with libcamera.

Thanks,
Oleg
