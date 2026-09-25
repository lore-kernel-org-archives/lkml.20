Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0B3CC303
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364493; cv=none; b=f8lKo4e+eJmXiLuwsNGMKwteAzlRIIcrXnbVfg+dok4U5pGFR3Ej51K4MAk9NntKO4pp3yqjCyLFpFpQokIaF9ClCkRgqujXzYFMdbvd9STfrc7vQLS4fklJtpAZX2zyeF993A941K+FLux3jcAuK8AzmTjjaDp/LPSZfV5BxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364493; c=relaxed/simple;
	bh=kxURIRZzgPTJfdLg5CzkMpeoAgOAG8CcHM4nRKTEVRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtJQwYC7XZEj+TS6zAboB7uL1K1tCB1OMLs2QCu1NSgonlsp/1citILEs2zGOINjHt/uhGHky0PxHo7FsONyl/8GbCMrSishDdiX1JTaZse1agY606Zd/yPx7EAP1CQdSwd/W1pABUGuymrAPJfNyA/257/JsKUIB0KobwUrDNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC+1nhFS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC+1nhFS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1013362f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364490; x=1790969290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLkp8tKPyA53T/OKC2x3SgMSN2485FWk3XxTVjLfsT4=;
        b=QC+1nhFS+BzkrCUK7Wskk7yNFQpF9SqmWt1XUVkSfT3bwa1jYwGQimUnFeP+2JrRHo
         sesnXt5ftg0+lT2sZiWjre1N+DYI2dccYG1cQWCdLzmC7YHWcVDoFCmMxNeIzfTzwZJd
         IWbUCFU1bqk6wT9v8OByF9YKBCso1lM0CzC3VyN1jvUWrLFCnHtPbsGN1qPagMRsfvH8
         qPJAzGJLeehg44XU5k1I68vnH7Yyj+z6JwQHV/GsO9oApMuHIl+ZfsX7gaAeNeSD4ImZ
         GJVejEcoBbmhPurDBP5wNxD7OT9A+pwkul5CpbybRYXyr3HE8S/77YbuzfmXPst8ePyP
         Kxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364490; x=1790969290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLkp8tKPyA53T/OKC2x3SgMSN2485FWk3XxTVjLfsT4=;
        b=b+M1AtfDP3q5j6uDq+dfDmW3mo3SXF2FI/RUaK4Op3/nhfQblacKa5367Y4gk2uziv
         7pNL24MRQg2bFUcO0Lm/e4AEpjW80uD5nMzTT49Ny3A0Wk5lNtjtLRdWfiG+IDFjSOoO
         JZu8zX+Di6ufzxGfjkqVDr71XtHQjji5ZMx5XeKTGI3AbsxQ8bO67voUS2lULS8VUpGI
         ZaUdktmcHH0tIGCKaatXi0EgSbTGZoT6kv9yJ+jBgWMjcq7NR+asaKnvL0PgtbggvM7m
         GMJWmTofPsVrckDXzleNWoB3NlMuJaEilADVDcvpaEh58Tlz82Bvw6rzj+pRRKqodeaX
         XzlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXwYCCF7iuzPXa/DvXUlYKcMmRb4NkZK2HiyX/oRpqIvmKgkpuUDCM446pt853zjEVjlQ8hDqJxUc5V2E=@vger.kernel.org
X-Gm-Message-State: AFuF++n6mVV2iIF2+Xw5FBKfZxBaOBjYptl+T9+SzKwHRBmAqnKaqn7+
	QcosTOdtX4tfiSfxMK5KC1tPa6+ghOqFXvEsAvVSDQrZsfG1otvRvEYT
X-Gm-Gg: AYBFou0WD0xVDa1Dg/YRQpeKXTJd5pBsV+k2dCl3Bpd7rKuMf5l7AJ+YLQpnF9AuRTN
	RDGj2wdWIQBPbrFYptFe6z0AmPbYfesUuvkk75/znrWVwzKut3vAm5pWZKrl52NytvTsqLKaYDH
	PxeuGAOQuYdjVFFylGccFYA1a2rn9EQZc1lrSqcnN8aK+CXVyGZCYa6nv0FemfN0Y7D+fEFiZqg
	hA2wTUfuexYbxdVFZG+GfCJQfS9por981Pb2ol9pOJGH2UUqA5eONNS7+us8ZwdVD11XGPmRls0
	ApqRWVk4QJy68X0TgwO1l1V3OJu5rsXB5UCUjNw99KfYCOH+OlK6IaI3Qam0N3u6m9i+ATjfUbc
	onoi6erK+boW8UaKd5xfM1vkfDrELrygNaDpk9PtvVEE6g8YUi0gWs7US5DU2d0KOoXWZk8um/a
	nHLtToORHzXLGhUe52LfZ57WmrX9yk6IbbUjDc8GFXrR5yWaZVSa1NE+fX5/bll1IbMa40uTFQo
	jDwEojBW3ifd6lHKYfqNjgdNAbY3onRDeRa1U8zQVAeaS+v45WwDQ==
X-Received: by 2002:a05:600c:8b71:b0:49f:dd6d:79a1 with SMTP id 5b1f17b1804b1-49fe6701ee2mr106024745e9.26.1790364489603;
        Fri, 25 Sep 2026 12:28:09 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21c38a4sm39369075e9.2.2026.09.25.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:28:09 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dave.stevenson@raspberrypi.com,
	germanpapulindez@gmail.com,
	kieran.bingham@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
Date: Fri, 25 Sep 2026 21:28:08 +0200
Message-ID: <20260925192808.8114-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921124444.79396-1-lsa.uz@pm.me>
References: <20260921124444.79396-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in https://lore.kernel.org/linux-media/20260913185735.6607-1-germanpapulindez@gmail.com/ a previous patch involved in the correction of the orientation of the camera, didnt manage to correcly flip the camera specifically in qcam. This patch seems already upstream (or at least in linux-next) and solves part of the problem, but not entirely

After applying the patch, the orientation was the expected and the same as previous test with firefox and gnome snapshot, i also tested both apps again and no new bug or error ocured apart from the debayer bug not related to this series of patches

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>


