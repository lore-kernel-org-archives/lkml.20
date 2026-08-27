Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FA4749E2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842299; cv=none; b=IJUhsgxKOyZ/ARYzgZvKT00vpkYGMVWFl5dDU9ycSn3DRRzu0yI5w+2ONC0hHqOi6QA//F3l7S1tqQaT2xyn1BVBgOEbPFXfXjpX8xfvh77orfKx2RoFkBvouz0aIx31OTqiyHg6YQ43c6o3IzOMi1WQStASm3VvXhtIQO4xWPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842299; c=relaxed/simple;
	bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8IZkOMXlSSzO9OitWFaWJss7prcC1RX9IL5Me5REyzUTU+Xd79HyhcUse8o+23CDfTnBwOSwljOWzXj4vxXFR+AiWU1AHEyUkl09fuqBQ437T64HN8iHnnyiHAMlRNpBG5UQvKNgnQIN1q6YziAui80fhlzfbmyyiV9oLM6Qo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McCKq9lw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McCKq9lw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so27832735ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842289; x=1788447089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=McCKq9lw2evRtvRZ9avefG51qCIndWuHPR4ocYGhcop9GEIb0YhlSIMnoQXOTlrHKn
         2AxHXyqLcEUFvmscL7XHruJbjrpj7sdP0FlI/5paaKIqJTIh1ZnWtvihshLyqWzhzI2w
         Ps4uwlXsvSIyrubwt71jtejQwk3f+dUzESIRXGk6BeGWwhalQ4tOnCiFT/uOl04CoKud
         ygrHh2Cy8kLBsuJbkcYTuHNpBPLOj6CyxpqSzDQzuaKBssVhkCQsH83xH6QXVIaMvqMq
         7ZPQFGcYCbKwRnXE+R6YDb20iOOeOChPZqKF8xB3+QVYssY9CYuj3roNKh9DfjwEagtY
         iE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842289; x=1788447089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=LTO1DV4vZGaTI23cropyXS1V99cxfJiuwIaaBxPmXaZOJvKqg1uHMAaTK61j6saiN9
         ai/QzIPiHNBr32Ad8mx1HaDY270vet5FalgDy3ThzdOWp6ldXG63UNyznbpx+eUUarAu
         AxX9DGFTQcyNVpoWOqrxlS/CUXzy8kgOmFsrWQgWhzAWR9pMfOLnAi4dEfDntmZeV6yo
         TbyUS/gr11Zw4cdk5NLvVG6Ic8WuWU7PdVm1G3cNw5hAV1Q38ucHKAfMffbvMAk4jQan
         BioFMr1q+r828w197c4gdsNe8lGfRflJzQsztM/LKbqJxO6rYTTgJBoHRWA4iyxe/gqB
         hdOg==
X-Forwarded-Encrypted: i=1; AHgh+RrNCRV8VD/73lWtpGaLUS4jxeKlb1JoSruvCC/BYbtCR+Qbb67nH9mW/oXLPvfpq4InWKSAWnocRiJB1jQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m71b2IP0+AOOR08Np1+8qBAElTdLJSluD9+BpOa26v4CVmr9vj
	tjfLVkRxSjC4m0FgSCPfV09wfJvjvXozipYiyomhRs6INEnY90a1uzx8
X-Gm-Gg: AR+sD10KVNXRM9Iuwd9y9iMFGKFI+yvxQycS9IDid+4ZBfnCh3OX4GyaWSbOwHIARA6
	5SkjvbFkbGExhPyWD0qW5RnxIyc/f7yN7yvSx+mso+uiQjLjY+Ju54m2kw4MqJkVRf4E1ppijHa
	IkWyR74kKXGbB9MKi9Vmy4hi8z2+uDgSBcT086bR1TaT+AE1iucQQxfZIKnk0bNeslCmEyHwB7F
	9RFEKo1X0wNch/HBiCKrGRSKe2DNScXxWYHHy6TAproO7LOycm+hNW0w9wHT3T9QQuwzOfctWDB
	zgJAVrWsc5HBlkeKE6vXS1w8YHrHXzGGHWvXAgcIxVctBRSsIAZhy8wxpDXdGM70MPI7NJgN67D
	oZSZYEi9idZ3nsNQwS0MYzT1QpGO2UqnmFLSHMIxhBtr+HWImpxGL5dTIcJ341vLbOGz07UTxuU
	MWh54TXkdws/VPgrnqDwhJTRIbCq17Mlo3qAKfr9XVFErGfIe+XsFYHqtj/h6aYAkvJ3eyb9rm1
	A==
X-Received: by 2002:a17:902:e54f:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d707a2f08bmr279793485ad.2.1787842288946;
        Thu, 27 Aug 2026 07:51:28 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bfb684sm18063645ad.62.2026.08.27.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:51:28 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: anmuxixixi@gmail.com
Cc: exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: validate vendor allocation directory entries
Date: Thu, 27 Aug 2026 22:51:08 +0800
Message-Id: <20260827145108.979738-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820150508.736275-1-anmuxixixi@gmail.com>
References: <20260820150508.736275-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A gentle ping on this patch.

When you have time, I’d appreciate any review or feedback.

Thanks!
