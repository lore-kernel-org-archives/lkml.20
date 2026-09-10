Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45808471414
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044281; cv=none; b=SGGI8TZhTg8LFdhj01kXFPlhJkCMBT1+waoksqESQ3VOFIEtXX3HoKCzNrbRoKLKi/E2f6n4BGCUFRyOzbRIQhgH6VpOgE49SHqPQlWUbNusBDFTDpere65xykgjNzKkmarTtVkY2aZH940LdM9DLFKqGUOev+VczbfAVGS2VhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044281; c=relaxed/simple;
	bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To58QiBEdZiomUCebQVC0h1t7MfzQIUhDNzc94uL4qrr3u4zrvn4rq53i51YFpXtNQCq7eo2sNPAvmt1xS2TMuHbI+FbiCVTFoNvkoLagIEip/w8pjns8ysKAPT5ln+2UbYWblhGnOYrmUsnTo7OzQsVJXHLATUzp4Mgy6CYzeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1z8vucA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1z8vucA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso9818675e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044276; x=1789649076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=F1z8vucAAaJS6wserE/YxUPorNq26A3L9sWyhoHpbv43UtLMoWrT1gpPSGj1ELGH1W
         eu4zdMG3s0hEUb30uy9JNUd1CrwLyNwQqq671IG38FSrKjl4K3SNjRascB565gb4RubT
         95Jj20n09J7wMdqx8Lzq6TVltlVx4X3TVQxFGzZ7wAoVa2G+AhHhEeYLtr6soK2a8+qa
         7h0SSn0gF5ZcRTQh/VqsAPSAwe/hb2ogtVGutQSuQ9ri7ItTbwuOQDY+F2/ufNKKEQLD
         Yp2oKYzV3iJ/g/9u2sDoCNq/w/z1p2dMl9hUHwPFR3K/+On4zXmtq18HME0EFu5iFqlj
         uLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044276; x=1789649076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=f5KwXIOa2V1DSDHyxrPCh0l+pzOs9LfzQeWiRAw5UABnrHrIUI/d/YmlXeHCLHONQa
         tepZlIt1W12cfUdTUeiRxUVOvPBEuLANmIUhLGq2qfTn76p9l5oT2AzC5xzhdCMLGc/x
         +Xsh+whj6XQOuEdqCGHzhGO6Yb+pkgJW8E8vqcz+U8DW3TgbD5xvyX1ruqW6gdp8vrja
         NZucR2gh/9PGg44UNKxf+YIu3jAnUCerGVb6qWwXo7qWlG+zuV1BusKiyzg3wpurJF8c
         TYEUKbCjEGUQ3Hufo3ZZvkzRFOKGsa5xHC7jsT6oYZwu1DkM9FF0bVApbUR0QCATf0uN
         uXpg==
X-Forwarded-Encrypted: i=1; AKwUvBzKQzAtwbwNhOfUUslmGPUlKoL7y3PeIMgMn3ONjojpBhSeHkFOIPFjfP80iIizsJeur1QPFthUCf0wwwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mGSI4EjLJHVIKTBPlvJ7MRTI+Ivpo0vHs1km+2w6Bqp26wQkS+
	/Ylul7XHdL1L84zhA8U2mHET0/INej0HNDExWs8SisQmwRDMbgiXW/QS
X-Gm-Gg: AYBFou2G8rvAIqPKm+d302xxEfSDfQ9sC6m0IlmPTCEZKK9Op2eNzaRkwwJNtlfW+9V
	fMk1kfI44luJny4XZcgFapPRU+z88uPXj9NcjsQCCsckfk3LMDWXJx4cLcH1uA9/tMOqnHtEzby
	xtjfTcBhb/CWDgomhhEi/31Tu2EqvOriRd6egCPaE3lUjzttr/5iX8Sf4SVfYwDt4kvw62m1hRl
	uqFx4ARnAhNDxa9NVxLM4TwssUGz0BhFR3SaRTB6L2XV6BtGSemhX/CO55s9TW5fqkcwiTaSmtt
	TiKcWY2EHcEbqpkeIiTu2UDg8PJih/M8dkk+wOzOLwLcgyLZI3U3yAqY6Cy5qBcUYHddBFQNyQs
	mjJVpWjyn1DPmQw1LSquwasinAZnIsL4LnRiedBK+KLoKhE2wBRvM7MijewXa7UvLdSt01lgbKq
	eFVk3db3jYPY3r7llbg21xM3cQaenPyy8o0waPGobXQimbRaUCyP1bPF7YJ20YqgsoKaXIn9Jhi
	RopPXD1grWSwYhL5g4gdI4x00HCH9ysJV3lrd37miMDrw==
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr135945565e9.7.1789044275597;
        Thu, 10 Sep 2026 05:44:35 -0700 (PDT)
Received: from localhost.localdomain (mob-109-113-160-48.net.vodafone.it. [109.113.160.48])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm144440305e9.3.2026.09.10.05.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jishnu.prakash@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com,
	nihal.gupta@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	drajpura@qti.qualcomm.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@gurudas.dev,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Thu, 10 Sep 2026 14:44:23 +0200
Message-ID: <178904426368.12167.11218867694394370234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
References: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 14:40:35 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Please note Mark has asked us to split the existing series, so we would
> be sending out separate patch series soon for CAMSS support and PM8010
> support.

Great, I'll test the PM8010 one as soon as it's out.

> Just asking, have you noticed any boards doing this currently ?

Only mine, and it's not upstream yet. Konrad's list is right - those are
all real PM8008s.

One correction to my earlier mail: the compatible does not change what
gets written to the rail. set_voltage_sel() writes millivolts, so 1.8 V
is 1800 in VSET either way. The wrong compatible only misdescribes the
LDO's range to the regulator core. Sorry for overstating it.

Thanks,
Oleg
