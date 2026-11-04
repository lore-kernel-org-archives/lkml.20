Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801301;
	b=as5kOq013eEqkxapaV13M9OHrDojn9zgwt65Ix8O89cobYZAh0TQ136M3B6w9m8LpV2O
	 ev/mJSfmcVPLeQUc1n72S8JnM5noboDzBsroagKS5vA1NYysBKOAPLn9oAr9wfRU6UUvL
	 t+PudlqjMQ85W1nW7YZktwfMCyT77zF+ptARtP7NgSZzakZuHJRsqcw2WsRsIVHLRiJmK
	 MEjN0qZ/dHg7cMdpAlSGvWr27fTBR7b5T9CpYnnSjBMVZYTl1dcsBIprsb2CJvX9aPxYo
	 aN66+Qcvja+2t71iaddJhD9ZnGgspLsTTYHKpdEoqcPSrYTR5sF/JNA2frDvFIfV8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=M3Hzv5kDhkXzamwAmpF1JE8azdda1/6idfHsuWT3Guk=;
	b=w6WglmWHFmi3b73KFpvopyEGhAxaloNrIMdvvwbgDPPnyJBxNZZuG+rVaaGyOv1W+ZfF
	 uF7JTL9wQv1S18Y1xX/QpFq4Xly7nIFUZXnTjhhwKVXpWHTXM1M4HaFN+WIP+BzDzo5Rx
	 i9+QpyiSCSOwoYDA8OR1R7JUfW91d2itNgjPoipWBRWKYRb4AYLD46s+xEaDWHE5F0EIE
	 +8omEfGafWCSDTXr+wkBa8Jkr7Ui+N/0YEauBdwKwT2JUZdxm9r1M2I6dU1aMDsFKg4A0
	 zmQWCHl24qq/sHWz5G13OEsoT75cUA5ir9Pl2mZ8NMzSD0n8zrURwwxDq5WF2lrhbKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lc0ULAma;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24C0606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lc0ULAma
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1026658b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801300; x=1794406100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M3Hzv5kDhkXzamwAmpF1JE8azdda1/6idfHsuWT3Guk=;
        b=lc0ULAmafTcWMpNJAJJkxlVLaXiw0vRycCUzrspZhNdJl6rP19qwERwfFLeq1KGmjp
         q1C77h2mHDe23t2weD91eovzE9K6B/gc2cHLaTXu7exWrakUKVAYDePcMFoPJrLdONFL
         H3rP/1mqsPpem4Q/vqjVYch6rE4Jq4miBNnRE+rSvBFN1N8JC2YguEzMewvZIJLtbfFt
         3UVEXY0we/bS4e0vz+dz+wjn5S24SDn0FXi0SKX9pRPI56CXztCUTKiis9RtDglirXLD
         9emJFbGDH9S1y9R2EtjWHtaIpxUVYz9Ut4AiNon/870J1j5NJMcm7j619EqlhoYcJWuA
         f/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801300; x=1794406100;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M3Hzv5kDhkXzamwAmpF1JE8azdda1/6idfHsuWT3Guk=;
        b=YnSYakhwyBQk6PdrRLPEpptCVGFlzMZvIfF/3xMuqfRXL6FGCv8DXNGA4hLO44enq2
         ps+DE+i6+O++VenM6OD1JArumS955cn0qMrbK/ItcIN9j/NI0wv1eFaEaeq8SqaZcrKB
         EFdKeiVFNY2/5xQXTvN3CcCti5gbJUeCwq2dEminYVkLwjpyxhb3IjtT8G1Zm+7IXZia
         YW0voIIc3iGyTWJvpozBp/3twS1dKrOCfaiEa0tScIZyIjPeOWS7p1O6RG3nldtn8wbm
         e6b21pOXYOZ1G7GhUu+bCAHqjbt8p3AtpcjAGtkuycgGnSXzXkqcN4aQAztH6rGCMedS
         SSxw==
X-Forwarded-Encrypted: i=1; AKwUvBwKVL1FuKkvhZ/IjoqEVkwexn7650jLz5gzLEnqOOG+TZdZrB5YvC1Y7Ai/NIEpkFtq+sZER/Z7AXqdsDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eVQIsz4wdnQm9bFYgdCwG+VabAbXZFBb3lV419tSDT+4k6MWq
	xUSvT342bmp7Vmu6JSHwXF220fRfBQxm5OwuKzw+5p1yL3NyaXEKOlTh
X-Gm-Gg: AYBFou3n8XPkQPl1db7SZUWHLlA6PA5sC6XYBANB/5qh3j75f7BMCbY/Zxn82bRVWFy
	Hgfjf5tK5Wjz41jgGs2IQUWtsQtwKqDfL4uM55u7my4kW28pHvkd4wbG53FiTy1iLvQOixgGCoN
	cXkr6G7ClxyrwB506dDtZCrCPbj4A6n4+yDc87SJaBIJDImyYh/tz+LzexLij5JkTGfnavTI5vb
	xOgYqYnn5SL21ux1lutPfvKxy5W8O8D+lFLIr5gwRqZd60sDXGbhkWVCuEm4iv7NpIF6D/eGef3
	pgPaojaGwMsVlFCoaAkgk+jT9dm9qQ0C4FRBwr9oKPoBI4d0xlQCA3Qfni81a8WfqKtsGXr2eZn
	4gnTx+h4Dt1NEotwXmT3pHaBlvciBaWRfGNKIoUwF32+WMNy6HsDiR2PQq+sWJdoJcCPgomNSSi
	8mTxCOg2n0Lm+MTbwRL7k8xHmGxCmTYn6kTZ88iudQVHG/kWEIHnTcb0blF7T/ynXeqXBiPERvi
	0aHERK0M6uNGgtpx86Y6pL+bnuahoEJoTxJdMYnIbkvV5nfLB6IqUxek4k/1lPCl18kkN7h30N8
	vcAmCKDreI8DGxo2gkmBsiv8Egh/4mUwRMtf3gliPmRM8EJ3St0fJ8dtAYuHx20twra+k0Oz9wa
	0NB5NMvMAtANpony+vOcWjyU=
X-Received: by 2002:a05:6a00:12dc:b0:8a0:18bd:ddb0 with SMTP id d2e1a72fcca58-8a9bf71b34fmr9870643b3a.26.1793801299832;
        Wed, 04 Nov 2026 06:08:19 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.167.147.108])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b09ba508fasm990259b3a.48.2026.11.04.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:08:19 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/3] spi: ti-qspi: three cleanups
Date: Wed, 04 Nov 2026 22:08:09 +0800
Message-Id: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3ZJM3cLigkxdQwvjNDMLA8NEC2NzJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tANJDC0BrAAAA
X-Change-ID: 20261104-ti-qspi-183f6801a837
To: Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Sourav Poddar <sourav.poddar@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801296; l=561;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=D3/LH8qAA0zBSfhisBUCO3o1cN3tFfKgYIe06BF6I/g=;
 b=gqWmuzlOL9ygJjGbIb3dN/2O2/ZQ25nad2bffTv1b0bo/ds/jBPKAO5SG0vYAKcqfzVj/aVT8
 nCh6ujmU/v1C/73uxeuK2Ub2zyT+stUS3+K1iyDjtLkPzkMbR/K5Yjj
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

This series contains three small cleanups for drivers/spi/spi-ti-qspi.c.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (3):
      spi: ti-qspi: Remove unbalanced runtime PM put on removal
      spi: ti-qspi: Abort probe when clock lookup fails
      spi: ti-qspi: Correct runtime PM error message

 drivers/spi/spi-ti-qspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-ti-qspi-183f6801a837

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

