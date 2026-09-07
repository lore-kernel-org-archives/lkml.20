Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0E49CF46
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781336; cv=none; b=NlBRIy6vPTnOzWaaPNvle+vdxGWaptcQMFkjN3tXHpPaGfrgUZ1tigpAjp6gnEZ7cma26pdFu27yqJVT7DRJ4BB4t4eJnjbbZUMLVLyFdeEPcs2uKJCvoVZb/gitsJra+QrJSxVAsnZ6wcs0CZFfrfVCU8eXbsOR7o6F3gP7n6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781336; c=relaxed/simple;
	bh=hHeiRqmB1FRpX+KG71zvP3RGgMVickO36D/WYtf2o1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQuPN+q8xE+ru5EEafjQzhZi2d5lZtdk4/isRix/JokmwmM+68D5uu3gsU/h/yS+USjgM1il+BR9BoyVId+yuJAfS0sMx3qdvx6RWdQb6zcczkdDbX9OMiKrOETT4h/Xi7nleNF/Uch7jP3ecDyAk5Uk/qNdmZ60/xeeKyPYOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyrUwi7+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyrUwi7+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2379527a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781334; x=1789386134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqStjuc2LDPUV/Q2Nk12Wd/b6K/JeFHmcf3IRlK3lXc=;
        b=oyrUwi7+WQsCr5e+q+D0l5Ir59jMiPK9ATkIEGb3yH37DCQrW9t1vKhCO+g0+RutN2
         eAYHxp403PB/snN47pqKcE8mBr2WpSn4Qg2zJJIUwwhqRJM0VslRFqqJkpRbDACaYn6R
         KdMIPSpphw0jADLuHXKN9ikMk5qkp9IGU8ap445dBT1DKf/aD+IwggqTOTQaXvnl2nsn
         wsKpm09o2l8lSC88EaybFaj52xU0F4TitjQDiWv2Ie6Jr8fx7+YN4UXawv/6vxsuWDws
         GCem7w1XNsaI1cFaYcaNc5pFAB6FeTKyUNk7CJtyK8ITPmOwBvJOq5bFI9hRRPNYn9Yz
         KF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781334; x=1789386134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqStjuc2LDPUV/Q2Nk12Wd/b6K/JeFHmcf3IRlK3lXc=;
        b=YIWXOdTlQGH0CM+QttQcvrtTTQdM6J+t2c/ESBfDPaoPqKIYJjDTpL7kpBsU2vq6+A
         S8XjLC6UphF6HUeMA2Nl6AURNiSWaF/SmaGvXUH6wrpHonbV/wpTbtEEvp1jEtP2oGpJ
         hgp3go/8CjsaIAgxKoxgJdKmx2ytQXP0MUbjcs+jxFj2UqRxmaesMwHox9YoQ+EgX3K8
         79xZML6lrorkxUj2kZvV8Kj7Ye2rjRuXNPHYsMS+0ML7LunB9MNwofmWZ5oDcTXxGwuc
         ptY+yCvzZtX5H8dUT/f0VXWkTgq9odbsUm+7rp4WFvzbwgwxlcVcUtRe6B76DwWGRQQr
         BhYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKWsYqX2jVFikMhxcmuWR0ltejcTILJk7D7EFPaLdTLfTl7rIYwVy9KbeUQbbeSYIqVhkZtZOBudU7taU=@vger.kernel.org
X-Gm-Message-State: AFuF++mdF0JWyB+YrqK6LgT8U5F+jOLjSTd79TAKLCLRHVrob1E39Fla
	9aTTuu7L3cMnVAIkeltx1EiHBnWOP20WR7lxI2DpqMzH3N1DQPGReB4T
X-Gm-Gg: AYBFou3yNhQ5YLpqgnRp9HaxFLMj578cq90HVRmcpYiLchNGXkMbCSlvXNaKEMmyM8C
	R6bKUTebUBjdIPx+paEAd1ugKcKiu7u4VY/RDxVbqLPsGWAAeMGRiTdAUbU4gr/yrKuqSGxdiXE
	o9hruXN0IBeU8KO23KZwWSbB7V9p6Fu719+U5iOEFFKl8F/ECbOHPyINKeBhyH8O1tqed2ur0ti
	Nnj0i/FT8DnGcCIy5mI2Gy9/qtOt0ZWHSQ/G0FlTHoer1cExm0VDh3bSTCG7K7u5hlZckXtVVdl
	SmhGJ+GuHOFcYwQUso+tkDx+aO02kM9MuqLLzgQAo36TemZRxDe67A1+AqJ2rSaUgEPGWgal4AU
	afiGOjZ6686VzEoxKAG/GLCNLfDsAzAV7vH/P5UmThrf3LDutijI2Lb4m63RHtIeaZhDSoSYDyn
	bF7dfeB4CyRWnCdG3ESoINd/N3uBASrwn0VjP/7VYOD0Ql30GgkAXaF4eI997vPtE49CgrnbcnB
	S3FiYo76NJwIA==
X-Received: by 2002:a17:90b:35cb:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39b261ae617mr38801924a91.11.1788781334237;
        Mon, 07 Sep 2026 04:42:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm5249874eec.3.2026.09.07.04.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:42:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v2 1/2] Drivers: hv: vmbus: fix typo "substract" in comment
Date: Mon,  7 Sep 2026 17:12:03 +0530
Message-ID: <20260907114203.40171-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <f307de11-8915-47f9-a743-250296f10804@linux.microsoft.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com> <20260907044946.10813-2-hemanth.selam@gmail.com> <f307de11-8915-47f9-a743-250296f10804@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 07 Sep 2026, Naman Jain wrote:
> The change-log (these 3 lines) go after "---" line as a comment so that
> these do not get propagated to the git log in kernel tree.

Understood, thanks for the pointer and the example.  The changelog belongs
below the "---", not in the commit message.  I have moved it there for the
respins that went out after this one.

Since the diff itself is unchanged and Michael's Reviewed-by still stands,
please just drop the three lines when you apply it.  Happy to send a v3
with the changelog in the right place if you would rather have that.
