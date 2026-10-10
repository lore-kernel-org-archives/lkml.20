Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81933F5A7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791618960; cv=none; b=hUccbdecmH/saMca3mBjBa848aqaFcWifd+c9BdJtHR8W/mV/WKxv6P41oJDA0qlDK9Sx6vxOf5l50iu8iE+fGatcDANmfWUVW+xUy2KbeYFHy5BdfI4HHbdh75uToCYjmLBchqk7NZia6Dp2o7Q9yy+Df1PaRNOooaEoEJY6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791618960; c=relaxed/simple;
	bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg/LO15z8NeniBi4QCR8330Iq0ccarf6hpHMQozk/QYeYkKtCUkkbVuJ+2qghV7vqCGaRmnq3gNIdJcmK5ZxPvYcX+MAv3u7k9Iy11s0T6+vxxhzS1IdeUtKdChYY3PviyZQG6ioYYpKAEDM3W6Zk+PNx0j1IbvYbZBCJ2fUK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI8HnDbj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI8HnDbj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a168355946so452285e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791618956; x=1792223756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=nI8HnDbjXlXdKPTrYt5khjXRtFYSuj5TWMI9CIkHUt6XIkrwNsWVamA1z4BoIJmYCC
         zdd1zhA8Ka/pT+Gx4/9F2ve+kYPlMU0q34oHuohP9mGLgHLgNfeMl4iU+hqiTWIsvjwt
         4YnIS6IGDvKq8Z+CNPXRqkMGHARFq+PFJnPORvPvhwxSmhjAfiKqFu26jv75MviRAmAf
         xDaHQKALT2PhUwN1SX6wmbCBSTqADTIHOT6oy23fLPoAXTODBsoJUpI1FAtnqmR8nesX
         d/gLVTh1WkOuOM2lYIHpDoRuIlALg47QI2ZAJH+hZkDj24iHImbjExQNbEyIJuR/IKUV
         j6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618956; x=1792223756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=iZlj5eQ9XK1E/uFaqQeOGn8f0vHmmN/wPJlBJDxgBjKU1bWxQW5UBtjokSneAafCD4
         ma+IHYH0wKYNTlJ62mHHmtsh8Xp/rSK6mzsdASlEDoNZvoObGNNIN1M+5AW2AvjyjLeL
         AFD3/XuEPed3IVWDw1fL4XkQZVYy/KJOloPPUovIiL6Bprat+ZX+yDCf7C4xBftq69NN
         +4MOARcF0Ap1QYC8A+PADcPSktEbHmi3/m2SLyq00W3bvB3X8SIJ7mZuhqWI4nE/eco1
         l3tDmoEu2wErFgv/dJ0bPpwbyJpgwhwAgSjFHzPTUWBuT8JNMWV5XHoeM2xVNflYtbcS
         QYJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVeYfF79ZRtEkdiSZcwB5c65D9rJYt50IysW+OgUSw0TkPWa0Dk0hw/b+3W0a8L0OK00TxN1x5U098fNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrjMX3VmAk4NfEJ2YZSLisBVXdjM/Wdt0udFjlDqqRsMLU7obn
	8pGJoY9e+mRURHUfC1RjDElebpjMSLXwMVc0lPHX4VZT1KMeEdCResec
X-Gm-Gg: AYBFou0mov7XFNznbm2zNKbkiKGZ0qWj/SSlZoPUEIbUGinN8LR2Dxb3DjQoiIQP4Nh
	JURIK8Swv7U30oDppCgruBELyizg0SOpySSkoZwmO/3Lv7CoiXsUr8XVbMn4fBlo7Mvid6+Af+V
	cy4rBn16QvI3sfNk2Dctxo6JEzbPbayu3TgSaNDHyZnMtWjTDgPtQ+zXv6QdvZEK/Km1CO/nM0j
	IBu1722EW9h6DS2Tbl6/87nPchQYLv8iV4BM/TB/nHxT91Uceo2hwMQu5ZqS5otbQ00cipylNxs
	pJNZKGdpU66A332ly1GhZO+A+fI/odj41/gkebv3WvrGmo0qj2g2OAhc2yBygiIgzz6dsBsG3e0
	Jt+YOe/sHzSGZzamloDfwBJJKbxFOqn2c09GwDwrzZP8R2sVdq/ZxIacREiQorNoveosnCaLzZa
	FhbazXrMxiRjr9md3pNy4mIkOTlIlSFN9VsJrhBZy3HZ/zNg79CRAHRDP5dIGD/gJjC3MG/XtHg
	4b6+Dk+VTCHvslJRyJI4Ty2s3kptelHmg8FGurvYkzQCoU=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr86747895e9.33.1791618956290;
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm159234285e9.3.2026.10.10.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: antti.laakso@linux.intel.com,
	bingbu.cao@amd.com,
	germanpapulindez@gmail.com,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Date: Sat, 10 Oct 2026 09:55:07 +0200
Message-ID: <20261010075507.19629-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007183311.24637-1-lsa.uz@pm.me>
References: <20261007183311.24637-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Sergey Lebedev, i experienced the same error in the same hardware regarding the IR camera, for some reason, the image displayed had horizontal lines from the previous frame, ruining the image

I have tested this patch and i havent seen the error again in qcam, i have also tested the patch on howdy (wich after the needed configuration and tweaking, now seems more precise or at least more responsive in detecting the user even in positions different from the original one configured) and if it had affected the other IPU7 cameras of the device (The other two cameras stayed as previous versions without the patch)

Reported-by: German Pablo Lindo <germanpapulindez@gmail.com>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>

