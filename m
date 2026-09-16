Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520C514779
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569425; cv=none; b=U3sqaQ6zHu2EvwXJcq4E3Z2CoYIw59XkhLCM2lgukSiIeGZKV6/SzD0Hyh8+oD2p29DetV9db+ACE8TvkcSN/9NOWvobLiLVuDnJz75w8jMzTZwN6wZOoFkx+v0wCSxRwtrUvai1j9pykBS6vfMKdkZ28NlnKHvxxlyFcBdm7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569425; c=relaxed/simple;
	bh=wLAj26g8Fos9OKny+J7HvStcJwwB6OXhbJxZsU6y7UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RskLk4VM1bMlBcSoc06zJJ1sczpJGO6/0nQ9aXOecuXAIDom+zlUsmF81zGEVLd+5ufkVUDTVFoHP+3d37S2fyuR/+VUi9C1wKsz1/lPuuhHOK7c2wBNUNHZqMGnl8dA9u6TSztpy3NXlPnaj7121rAHIo+0utrt+TFjbmLvb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoqyUKM2; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoqyUKM2"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so960437e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569420; x=1790174220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcRcL2F4/Q4OrY5UlSptZLs19ltKf0kc/HWNriLcOWA=;
        b=UoqyUKM2Pgs2WOtA5p9ZpLx88i0+s6bTPSRLmJMJky93qdHMYOK8atbhyrXsvVgkOB
         GeweBHn8tEccTH7NGzaWrP3MA30vv11rgwmlNR5YT0+dukxGvWT3hp1c/pbXfK0NxQQA
         wZbIuISSyEsZmSrPfnukYSLrl22ZdeZCXpX6oXy1e2hMtZuc08tkIHi5F+daICHNLfMa
         Tq6lm7jNoBy3eyHPgjHngLR+Uy0h9G0wLTwEN3i4gUnrPVat6sQD/Etp5FrqYZaecyxk
         Si/0Vk5rcOMCHof6sbjt1peU3XHcKA6sVTN+uVkomSdGzeBBWBA9xWm0uW2YU0PiFvBK
         rfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569420; x=1790174220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcRcL2F4/Q4OrY5UlSptZLs19ltKf0kc/HWNriLcOWA=;
        b=Zr0ap02/wmmV2iNlWHLJuDh6Br/Wsen0G36UFCJm3Sr723FqYoa6tmH1EibGm11Shq
         3PF+TT/Nqrwd9zSM/XRv2PZJrzRzXzOJ76oJMRZeH7NGoxyYfo2eWTv2VZGpJQRyZ5sF
         5DdTWg6PV1pGt5PgGJW05pWWIHcXogBib1WdBJX7Gye5DC7/8aIDV7h07QJWqmBtpOxz
         2NM1TtAU4TcwL33rQImJ9RZoV7ZfABOl5GZAi88HQ8lZF7f/md64gIheWOd8HINbstUi
         oVi6fZs+KcZiIwoxZThRC21Ke8lpd7UDAdpJfwfuMkNKqHRZGbeb5COy3CxsyXABp2gO
         mtug==
X-Forwarded-Encrypted: i=1; AKwUvBxu+7vq2al9EIb/U0dI/JeZJVdDSX/846Ww5+R5KI79Sqklau/ybmYAeUa0MeCGiX+IhuMdSMIuybrqHbw=@vger.kernel.org
X-Gm-Message-State: AFuF++kXNh/xCtT9RXvL/R2wC7aNDrAVkkaqmfslqzY5qSkeTQGtBFDN
	m6TUqYW3i7FJFSUNbixoRBAZXwKiCGAfhdB2BVxrpxB8voN20PCOPuw=
X-Gm-Gg: AYBFou26Un/oaSw98ZwJI0Nd0t3nhweLg0KLL8gIwNh/zHDL8VKgZwvXus8J4k8huW0
	odYeKIzJw0cPHsobZS/L+goGTJwnCIbgPE0WgKWJIyJoKKkxrrvgLHh0pGnw9sXR78hM2SSOxgI
	vmCHXuK7Ho4MLkbwyemxTftFKdPefDcM4UeGah/Fb5/q7P7yTc2kSZ0rf8z5jgM9GhcZ05ZDdvA
	0itsLFk8jy8SqNdRyFFRVQnuzEoTckv7JFrzCZAgm0VpRZ/zoXEXUUuKJoD5SrODdysmkeuh2cO
	mxrIPGGFxKUIi8qSP1obYv5QsVjNcsAfGT1TvuE1QfJFjJSwes57UvDFxBSLPNCBATms2AHmVL1
	da7SHBKD2Ui3jN4uGWRkJXT8oHyvwZTqM6373MJGoN4CaiLFEdghCfrF+lub/FCKweVm7iJJ/sR
	nEzJajstJXfiO9LmY/1IsfFLjkDFp9OzELsQlTgjLgBqgV7h/b36YctFVn2Q+PBh8p6vjJWr0NM
	8QZH3TkgFSJithFDlMa0C0HXLS+dZD9fkg=
X-Received: by 2002:a05:6512:1322:b0:5b6:1a7d:5539 with SMTP id 2adb3069b0e04-5b8b666a871mr805388e87.64.1789569419597;
        Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:40 +0500
Subject: [PATCH v6 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=wLAj26g8Fos9OKny+J7HvStcJwwB6OXhbJxZsU6y7UI=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHdpqItY15gmUalc/Z7UMorhspKomLGbzhV
 eL7oiRKRAuJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 ovFTD/4vs6R6cJMl56Z2k7M+arjdgZbW5RedAlHmvCnHsfHbLLcSjgvCWRVqM9jXkNHen+Itd6d
 dg7L9hIBHzWV38UZp6yaWb6qxrTL2ufdSvD/NckBnY7bZUhdey3PIHQVNABOyqzN+dokmynOc2z
 g2zuCl9zhuLMdLP2ZIVa0r8/GUADmvFIq8bkgFw8yeQOGLFqIakbUAT8xQAeuFe9Jy5L/6gujUT
 lBxhwfk4OkSbQexi8M2Erl8eidiCBVCisdPehnsvvLIWZNVmBxArnL352crlBNt9GFuccEpModh
 31bVdRtY5RXoiR8X5eXkK7dxyH3SJeDYMC2PVQ5Et0sH6+yQK55xZyx6Nij8ujJ1IcZRFlgtIp3
 lqAYiL9phB3cZmdtefseDvilZ19n229OXwpu/vcwuPG6rbXsUlXF3XGL0Uyr2LHk6PhQER0j4yR
 JcKJ+EQ4IoJ0MIN1xCvCZvitT7wWdfSvouZ1YW95TFYd88SejJkzxxBKwJRDxZlcXcTCrsXdcSy
 oTuDsOygzKxKFK95PaX9Sts9V5LrpPymcLzxOok4ebjwejf0HIFqBxkU2tr0UmegS61eqx/eqVs
 MCiVLT9opNgPfYhREBtG0in9h6VOxSSAeZbdbicbYmZ50Ahildo3cn4LNznewTmSQijB2bOcdvW
 pEerLfZ/bnkxFcg==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

S_IRUGO macro is obsoleted and not recommended to use,
therefore replace it with plain octal values.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index b6958e99cf54d3c8eeca1ba38055a9389678f6c3..190de88d146aae9418566adf36a47d11afa90b2a 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -151,9 +151,9 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
+	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
 }

-- 
2.47.3

