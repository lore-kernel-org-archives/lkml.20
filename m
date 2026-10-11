Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B50339387
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734111; cv=none; b=eDvqBLwYxxhc/gie2bU7p59+YqYQRv5maajUu7yMuRawzae1TfHR+XGfCcOhIwIoSnR6qSYONVDbQj3Acw402JAbOTAlFXlvv5DbpC55cNmk9QCg7366/4qMgubKAGPqsFD4O7FN6lhmWSQBLNsY5Ga4/tkQveX1vkg09AoaAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734111; c=relaxed/simple;
	bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Imbq5wwBIaH7EPKOilpqcJHfzoR86dBTNRqlXMDxmbmTrtzoIlEDnfNhTKmKs9Gr56aRVH76sJ3GlCHg1Vqp5+001croVy5qYgueG4skWlzy8eBbLjQu6wkY1yxOBiyOv+3GXl3doVsX646PkJ7bRB0Cw7OjMAIzQI7TyDuv+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMMew5rK; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMMew5rK"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e9488480cfso105060e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791734107; x=1792338907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
        b=oMMew5rK84YNXcyWFdANcltK5g/jvkpetqBkO85YunfyfUa3aRwXg3Lu+VkBE7TA4G
         1DmaFSHxzc0sFWNSPRmKYWgmRmGq7PFOlTYQLQpmA7qKXUu6Mj51QQKQdtqMob4wSnZJ
         eJaEtmmX35Cf512KAEbEkR0wQEhouW5FsCF1zUq9U9Q0L/LlQpm2BCuMkLiw2we0pTMC
         KbHAmfDKtsIi+iw4L4jDbp6fkNiOpJwEDDB7w8e9ObgVnw9tWPn10ATZ040HW7ZrcDE/
         Hq2zmaSgItbu0LTn1MDMfE2Wvrh5+g2zfZY9IVAR2IDbtnstYbMOOlRdZEOy9vEYhrnZ
         il8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734107; x=1792338907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
        b=P4QS9CQmT0pv4mGqoWkTX0+dE9jrGgUwF633QgX4JSoM5CeuZjLueUxJjclPin4UIQ
         qmYWrmI6rXE/kOPP2cPkEUApFXUhPIFyeIoNqGesl+eZpn0YPxiJgnVIzdQXpU9/BM+q
         WA8onbn7PRLK1PafpCXG5wDE6iVWmzszpZx93XTtBHIer49k9B2HLeZvW4bI06pij+vC
         UY616p6hkcJpjO3PdMnn2saTtrmT8hKlUrnafR126ewDSyLKDCIvk4e+A0++bYrAcXKa
         Yr1FSDmG8ldb1InGXpd/wz4lQhiczKU3AM0XogUF7MuXrUC0b8LfKUGc7Lg5148blZvn
         e1hg==
X-Forwarded-Encrypted: i=1; AKwUvBzqX2bnV3Ar8puSM03wREi7pdWbv2JkHfCh366e426XVivQBTYDkHUF++M6mEr3F0XBJdi34wU1r5uP98k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+gJ7DOHiKIpGDJxI4qfCo8CwmW72pKeXvQzRImSJ4QZG7yT3I
	PO15rtcEZxDbBjoASPGKLw+Klsl+H6ZQ25XhQVrjqDaQcmA/BTJLtTivtHXkZ00yGa731w==
X-Gm-Gg: AYBFou3snkkRhq4v55X3bdieKsPlPYem/JOyQlp96FquuQj8oPa3PS+AY9nyVyT4Wc2
	jQ3Wi2BvErSKUrqvLXR5o/nE4gmG1CjqnYAGmBzys9cOYJ58tLQb34wwFEZBc/E8fWXtL6+8OWK
	5bkAXHRXilJNd3H0sXvkJ9iQnAHyGtyegmJnTFsHKkcADxwUVp4O6LdJlkMohMj9TitDAAv6YY7
	xeCrgNamId43ylTKjbc+VfdgXOVtxsWUBgloLl6dgfXz3IYEuWysAWYp4gmQbYKE4Xw+d/Q7Wxv
	BVeKg0Q/6rMwa44NKkR4qWnyJ76+ol/TbypDCRpn18do9qn65COLsxXOaF5oNhLcxphqDbfc/AW
	fs58E0Zx8XhCoS4g8TguIKk7u3JwHepMDsZqADU/JOhmsQJsZTAbno7MG89i980b6YUCzjy8X9s
	sDXqk6gsX0MnFjCMxyBcqJJHtX3HWE/2//Ow3jWCKQQv53qMQCvFbXieh/AZ4k8+k=
X-Received: by 2002:a05:6102:4bca:b0:7c3:fcb7:8c8c with SMTP id ada2fe7eead31-7cb3738b509mr1700102137.29.1791734107383;
        Sun, 11 Oct 2026 08:55:07 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ae1577sm5130367241.0.2026.10.11.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:55:06 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: khtsai@google.com,
	ivo.g.dimitrov.75@gmail.com,
	faqiang.zhu@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
Date: Sun, 11 Oct 2026 12:54:59 -0300
Message-ID: <20261011155459.1196100-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026101116-shortlist-trend-5e9d@gregkh>
References: <2026101116-shortlist-trend-5e9d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right. I spent a good while checking macro call sites,
tracing dev->net lifetime, and verifying scope, then used an
LLM to help draft the writeup. Clearly I'm better at reading
code than writing about it :) I'll keep it shorter next time.

The patch looks correct to me as-is.

Thanks,
Aldo
