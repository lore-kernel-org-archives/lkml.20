Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E94472F75
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848262; cv=none; b=E+jbTR5LjbZ3JNyLUpP6uKI6+NAIi6pYjRDvyQPzKwyi3iLds8nNeyI53lTg+h7H5+tNInkfLnQhAC5ZANqo0Us5da9ED/vGsPQAz7r8hGdGMb51kjiy1twFeDiUZg3IO69BYOu0PBFtmMekb7JZ1PkCFhADUFuxjn0jHdy6tY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848262; c=relaxed/simple;
	bh=1N6AHvApy7G/ZYAR4JX1g8TL5MbzzGoa4Zmf8cdN5Fw=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=OzHy+Agynrytd7AtgclXhj44VeolEYV7WaPe57OyamLkUcDmUyRBHQs8NwAuR553wRDRYrSYqyilfi1qSQ3EJbL9sW1FEyQPrWKWz2dXeZDXhsz9g85y2jUxZwGZ36BLwtvMqk6mqMIm6LFu5NW86EjGX2Hw/LWmXzMN/bu5PDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TN/Vs8mQ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TN/Vs8mQ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52fa6005224so597321cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1787848259; x=1788453059; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BQqLdPEbctnOJcoRx8H6SH9gQ3ki0NmAYqsyTGA1uQ=;
        b=TN/Vs8mQABhoGOODLWBZkAdSObKsGK1PV/vngn11f6ks3YEw/XRuTUQ4V5cPAZAJOq
         6E2Bu0uIjK7yRdKs3rtSontduc5RLW9bf0RVDN74T9Us8YP497InrvN5eUCX6wNdIgSU
         JTOG2LP3pSErBcZBL/r4X2x3yeeD6tNN7UFfaR/qZNEMFVUV0YuEty8Uz6o0CAGdUIuU
         Ohrqi2as1Dre7iPR6C7RDO2gmum8AHrqYNAkD9VTV9TOTRJKFopMKP8MAZPXIHu8PekK
         A/4CyvjkYeqCwdb2jdTNoSlcgNdPJoapAFCOTJND160TDFAzhdxnWILHy7klaGPDb0NK
         2VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848259; x=1788453059;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BQqLdPEbctnOJcoRx8H6SH9gQ3ki0NmAYqsyTGA1uQ=;
        b=pMwq7piK6P/Fj/xMFhp94FvjJkkMvXTQIwZAHBNeVrjAxaJSmdAewZRBS4WRrfprVl
         7tzDuHwTJk+Ss3liOjHzz4gAlfplMu6ZvqE4PIOQtlENZ/LD3bO5A/YkpSqT75f8Ncsh
         WRkgJReQ0IUi4Ra0/6eGIpohpCYMxW65b9718lsehNX3OVtccKUxohb+Hqpe4d+GcnbT
         JQH1ChzhqpOuvyaGfxarWXoEN9BDVBNZvE//Fi6+2H5hibklbfXxU17pDEJaXSE8kZuM
         SNkZVVUBSRpMf21zPNs229HhfisO+vv0BrSGGYl3vs1b0c5QIDspXx6e1ugmhvSiuBZc
         lv+g==
X-Forwarded-Encrypted: i=1; AHgh+RoRKDOM0XoMXRZcWb0Aqs0TzAnlrBjV0VBhWb6bjqQ5CzqYj28v9X1v5byG9T1hiYHH6Uibu7xrr/LvWXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ke72eBq2WLSa0Bgrtp850po5rssZMxPp62PWWbPPwtjqm7tXLf
	r0jlIHcmjlUDli39jzgw1vHba+vmLBUAVu1rJbMlKzTak4kfp1vY29/CRaIhlokuFg==
X-Gm-Gg: AR+sD11kbYiX9URCvxq7dE9lTeHMQigXLrHIdeXDlE1hPA6Ei2r7EMfLklImXOmy/kI
	GRQ1GLJqz+CX5iNhCgj6AI7pVihkZFTfAMf3+FOk1ajz3+ytb+oRiS4PHD2I6Swiv54g1SSEesU
	yLL08ZoecU2czBrgtQi+nqMRovPyY/pIm8Ku0tPHPJdlSNx5k0GfUZs1Bg4KToeOViXUiHNeMnL
	KHZ5SovorWMgW4fIjd69e2AV8N52DNw3msT84o15YpSYagX7VAf9B3accupCxWlaQI1+Tbb+7Zb
	ewCigPdfW3/q7ipqlX286ZT9wWOEX7Tku8oK0ycRvXAX2uGefn3mIHIj60No0x8b/go2RgEeeUJ
	2uBFMQV4UhZUpUgm2wt6Rd3f1c2WZN/BGrSryN1JViYvto53cczUT8+pCINq81xObjr6dDOV9Oo
	tNaLC5IY8rVRd1lpuugmu3qC6lcD9i0D7j77/Jl95mifGZGzHLOEbr+vNEF5AucFSWbiBBOVis8
	JRi+RqjGoU9DIyeysd+Qigo4MxQIb1FnwI=
X-Received: by 2002:a05:622a:1e05:b0:52d:6e05:88a5 with SMTP id d75a77b69052e-52fb93d2780mr3450571cf.5.1787848258523;
        Thu, 27 Aug 2026 09:30:58 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e4270a950sm39982521cf.15.2026.08.27.09.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:30:57 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:30:55 -0400
Message-ID: <e94ebd7547b7c28a7caaf6948d3d4953@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260827_1122/pstg-lib:20260826_1402/pstg-pwork:20260827_1122
From: Paul Moore <paul@paul-moore.com>
To: Cai Xinchen <caixinchen1@huawei.com>, <jmorris@namei.org>, <serge@hallyn.com>, <amir73il@gmail.com>, <brauner@kernel.org>, <caixinchen1@huawei.com>
Cc: <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <lujialin4@huawei.com>
Subject: Re: [PATCH v2 1/2] security: Delete dumplicate assignment
References: <20260707080615.1235830-2-caixinchen1@huawei.com>
In-Reply-To: <20260707080615.1235830-2-caixinchen1@huawei.com>

On Jul  7, 2026 Cai Xinchen <caixinchen1@huawei.com> wrote:
> 
> Delete a blobs variable with duplicate assignment.
> 
> Signed-off-by: Cai Xinchen <caixinchen1@huawei.com>
> ---
>  security/lsm_init.c | 1 -
>  1 file changed, 1 deletion(-)

Merged into lsm/dev-staging and I'll plan to move it to lsm/dev once the
merge window closes, thanks!

--
paul-moore.com
