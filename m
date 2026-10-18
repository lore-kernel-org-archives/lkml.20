Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790232EEE92
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290450; cv=none; b=ZceMayphMxYXlQUC2L5WTdx8EIxbVOXAtVWbxCX5RLxx/O4LOz4mhNRCu4FJPNt9whhQnt3PN1MrA5ucXlEEyJu3vTrrtqxuLKU8oOVRLhsVHRuUtjGRxsQS35o4JSq/PLXa2DTuByYZrZtzw5IeOpKqonwmWKAtqEfk5Vrhg7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290450; c=relaxed/simple;
	bh=JozqsIKkMBqHrYR/iY744B/gRgb58HZl9ElHUH2x8gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzvg2Z3TfE4lgSg2ZpZlMe0irB46a2AYLh0peqY06azl6oqHWlMTfAqXogCmCb7z/5LzXe3oWc+lmCa2hS3EDulm6M7h/NrPTEFS5+pShVexITJIQKVfaIgRzrshzbD/21yeJRGXC1babA8tVh0zuTp31PPJ7cyMVSoMwtxAfC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVHB6wVI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVHB6wVI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e831e86ebfso4752325ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792290449; x=1792895249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JozqsIKkMBqHrYR/iY744B/gRgb58HZl9ElHUH2x8gA=;
        b=ZVHB6wVI+FfL157KLNgtnyIiZhRPxM3c19mNVgikD2/umW6+IyswMb7p1KytJEjXFY
         +o4BESlthiy3w2syBat9dpVJ+ZJQTBu2+FDgO4Vd1j9NCctW4Aq1PS0lECxodmKaI5dD
         6mPxUdue2bRwLPrlu15Q9b7QZ3iPYbebeHcndpy0geHb30M1IrQPecXaQT8n4ko8453Y
         Xza4y9Qwei9PePwntBIykYJY1iN7I/m/EwN0bosLcFpShjB89pEknV3Wh74JgADba+5q
         AOWMerhb/1nII1UjMpwB6EzbnlzlemPDWhcBqM59IXxbflB0D+5eIbJKXYNf3AzVp1il
         h8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290449; x=1792895249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JozqsIKkMBqHrYR/iY744B/gRgb58HZl9ElHUH2x8gA=;
        b=jLIz1eISB301Msy2leokFpSzqQNq7PFvStSIQEy8otShxrcbHPOoqQ5MrDRozFySs4
         AW0/oIkyrEfqm/dkH4kbQow1knne9V0rapfJeODRLQi8hr8JZ3dt6rDtpMz/DCNVJxsH
         gNe2BHGOLJHQasVUhpkNCj+9EQAR/lbYmq7kxsqofRf1qabkP1JOzPZfmHrOqpWfb2a7
         oXYiigdzexqy8IAaU2GLhRtQX47TvlvokOOPUKV9k4kvA/wToAOmCwoRD2DzHZC1PyDi
         ST6LywJv5KYhvSdyp2FhELp4/Rhvc7VPK8SRe9s64V6G3wXCqnvIwlK1VbQNpWJ/5XKK
         v9mA==
X-Forwarded-Encrypted: i=1; AKwUvBx1MVK/b+BpWV5Qa45SMABZUDgkNAeU8neVz/nLQT5zkVN5mtt19XJNG6ZAi7KewWtXsMc/8CNiY9uPEEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdjxKJwfg9kEvA22GCPMl9NBn3tvyTcSyCbWnVJ2nth1ZpIr2W
	xuDmeIEZ2RARaO+TDeVaXa2Efm2x+Qao/wRJ8uMncbPWTyfPPs45hGX0
X-Gm-Gg: AYBFou1mB3k16Q2dQ1UU8M97ibXP8pRIgD1i10NdB/e7c9rUSBiLcZzC1AKXjCPUPV2
	VLO08qFGci64i6VzywyczAi2JVq75iirUq7agN77JJrxbOubsU8I4cYUbXuis65NN88xGs5iiBd
	BS7DqTHoMDAkRfNjSmtdHFvdPceUO2PoqElW7zvLhjbHE6r6P1AcOc9AjtBVPlyhcfCHzfTl41m
	6Rvk0FWbKfidvMxK58T1EeDMGe4NM4qmFHWfH98IRB+ivA9hpQL5Gi0gdGi6yyVQdr7O2AnlFOx
	d9i4nudnd7XABw9jSvqkWxnUUcjMyyjYbdgav0IzrmLUyCzDshGpXxPlZgkG51pxoB0L/M4k056
	sbV4tU5PE/PvOK+o6frtRZ67irZ5bzeTh9IxvHXaUCeTGrIoMgphRmpDUC0LXDRtf1OjHXVMzpl
	4b0J6+e1usaPL3XZbqXFR0T8tbaXuIHxl5FQppkXEteV9QP8U2AnaDZKfl1KXR7PRMliW2twtz5
	sEcTc9Z+PWyrQw0qO3d7qKrh7UfMW1jMau35SmqSJbfDxbeqrI4og==
X-Received: by 2002:a17:90b:4fc2:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3aced864c6amr3928931a91.0.1792290448831;
        Sat, 17 Oct 2026 19:27:28 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f4cadsm9897014a91.12.2026.10.17.19.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:27:28 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: ruoyuw560@gmail.com
Cc: tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] drm/omap: check IRQ wait allocation
Date: Sat, 17 Oct 2026 20:27:21 -0600
Message-ID: <20261018022721.297885-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260606040620.13-1-ruoyuw560@gmail.com>
References: <20260606040620.13-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Looks good to me. Should have a fixes tag.

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

