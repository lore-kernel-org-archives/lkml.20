Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651883148B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273660; cv=none; b=A38fo9ilgAzFQD/YTPZPKdxUAZwto3R0dAONWparqSxE4uTW9R1oyjc8qjiR/BLiKUc6QxfwZMsdyKckiNEqypiLZVlHYoGPbjvq2fst+GrRfLP6MIvRTJRo7raKHWRvI1TtSoBXIXWJbOmwa9IvDyB7M5A3EZIK/FXNeFhT9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273660; c=relaxed/simple;
	bh=Ezvosh3epb6WJpYM2KLXc2S+pP6dIFTIRWSni20yIT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJv/k1JlosZG/pqvsjT0ChnIWGYHZ5W9cILQs+R7j6em/KQNLfpWpsDrcBwS4eN+1gm+A5wKogOiBKdnlY1nNYAFCih9kDgGUCfEXKUA1pjEEQywKKoC4yCNRB209OjMsWWavlxw7HnKFucIZcylMh3CB5/PQkOHv0hfTyyVk/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P72qjCbF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P72qjCbF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3773511a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273659; x=1788878459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XjVam93oa3spMQHjTS09LkSETmO0biyQOMZVXxMvCA=;
        b=P72qjCbFrqn3yw8Wh4O+iBDGNn9KhR9qgOchFWMdaIEVQl9ke/i3NNQiZdSEFLjGke
         zm+EitRWyXpOE7Axn7i3BFqX77AbdktSchbVKP/+w5mYW+jFqFU6HiOXljza850YszPG
         yKYSVeu3ctAJbPnPgwmGfHTLU3hvD1q0M3FcBIbqhvPvH2HRIBrfsEGY7sLgeCQY3nCC
         UrEicKxmzljXaiTIyr+uwdECeIu+CVQXRmFXM4Cr8R4YctQRU1WjUFb+dIknJUZooxNx
         xFo+vJdfQEua2mrZrUQNuASgBZkOn3osdoRlj1VhSGBZ5nS76NRm6xy6EnLPQvzKNLQS
         cmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273659; x=1788878459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XjVam93oa3spMQHjTS09LkSETmO0biyQOMZVXxMvCA=;
        b=WkyqFxWnYmosBShMhkwYaA/WjdfXF2Q0JNKwKgZQ3796pVOQgNpqy3N3rpL59Iku0P
         wnVpkZf7UR1hzDEdwNb/YxrnuGZKx1GJCZkxbNBvc6q5UvDVE41uustipxWGUM/gOMeD
         TJYhaH3V7MuuMyJR2aYc+Zwo22GXMUevx+jmocv8qxEmDIDrIevRyZvjP5xEoPUHB72d
         I2utgHdIHso3k7/97ipA2Bu5JjFyDUdCVH68LNCFVwwHsxR4eOS55BeMprb3ULLg/055
         4a6FAH/PDtpzl5EoohBm5gjeUqAmk0JHSYzSBqVHwu44RPr6mbiRmWVYFN0OI8gZ7A7W
         Pq1g==
X-Forwarded-Encrypted: i=1; AKwUvBxRTxM+1gl3EJFHKFsBbThUBLvSaVmeGRsxPFuiEHJto46wWzfVd6bmOJDAy2+nTeqM9syitbvdRJmS3J8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+0wavByFeKuuuaLm8d1u1HvkuZ3rIABuVrTINMH9xrLXkoE8G
	IgilG6nsMD/rC1IdxFejNpZvkd87yOCMDykvX1BkGaPgMwaM20Taq7Sf
X-Gm-Gg: AYBFou2dU7ckFbfFzTeyJt80VU4VE03gER41tS5YaFGoV1HcBgZklZTk0rbuqNFNiqG
	hYjOGTL0m/2JMEW1AbhZXDYZtvVx/lY2iGMGBYNZXdcIbFpv4sTqSFYlUMKC+s6EakHK+sSKraq
	Wagpp84bCeW2fDjjRL/iVhZrBJzoPAUSWLW2xKpDku9lkeYLh3gQScXsyvfVRVWUyp3rOA7wdX8
	K+vwBanxqFkexPfPvb649OWlgiyPYFpQEglX0FtQHyX4TArL9FtCjS4koTbBiF6BwuDDUnjvEld
	RK4bwBoK82uXuDNHcP6gUIBIF16UxDlUZFtiHEUBo711D9DAF9bg1Ec4aO/2vJdHpabPK4AGrNN
	b4ilmGzZVmRzKGGMnWAek0cjuINls9DsGStN63de6V0yS5QRE2vqhJDirSX1EFPjrzFmaVGBxe2
	g5iTrR/F4U/0c5DIkf80rA57y9kgFy0/aeZNbL6hslDfk5Bfp3CGL2ZMvbwg==
X-Received: by 2002:a17:90b:3985:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-398e46eb068mr20470492a91.23.1788273658460;
        Tue, 01 Sep 2026 07:40:58 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:bf00:62c:e311:6048])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d7casm21027a91.10.2026.09.01.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:40:57 -0700 (PDT)
From: mdshahid03@gmail.com
To: jic23@kernel.org
Cc: marcelo.schmitt1@gmail.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iio: adc: bcm_iproc_adc: use device-managed resources
Date: Tue,  1 Sep 2026 20:10:30 +0530
Message-ID: <20260901144030.509802-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Thanks for the reviews and suggestions.

For v3, I will incorporate the following changes:

Patch 2/5:
-Add the direct includes for <linux/bits.h>, <linux/types.h>, and <linux/array_size.h>.
 Keep <linux/device-id/of.h> and <linux/iio/types.h> out, as these are already provided through the appropriate headers.
Patch 5/5:
-Remove the now-unnecessary platform_set_drvdata().
-Return devm_iio_device_register() directly.
-Remove the unnecessary backticks around function names in the commit message.

For patch 3/5, I understand that splitting the ADC cleanup into a follow-up patch would be preferable from a patch-scope 
perspective.I will split this into a separate patch for v3.

Please let me know if I have misunderstood any of the review comments.

Thanks,

Shahid
