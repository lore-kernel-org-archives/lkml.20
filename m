Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491374;
	b=A/y8uOaKS8XVfecxTdPBN22ESJNy71c/7n1BfFcZzcvp9OzmyJHm/CGMIS7dR4Nw/E1J
	 s5/4eyxfbYm+eH/5u4UWtKI1xULS605akm9y4NcXfD5SvxP0kwXN3loEWYn8I9nCYjpzv
	 unSrw7pdN9ZLW+d5iGq6SZtt77UtbCqeo5nY46aKZy76PdG1sZ7Sgze/1Au9hNTvXiz6Y
	 xe40oe5u/VrB1RmHAr3Hx8YHJVlWAUWSJuEbv4eq1/Vco39eDzUYYwaCTu/ZzAHLCPPKP
	 SAVWQwNEA8+qvABGjPa95PaE1wzrWxU+btwChSFUTwIy3I3ajZWgfjCJSEW4sVCqutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
	b=zOmE6VkyG+cxQMZvP6L9LeLNAhHgCLHcFUIZBiCR+pONAnvnEA5/2eMmsPC5iHfPp+nN
	 0WEhSsFUGWXMdrihcQ1rm3YXdRrUt7sys0a4MYMlGSIm7p7EoauFVzO3xc5Xx9jZBQ+Bk
	 WTx7iy3HH9QtTF/HqWm3VkYvybmDV0BaOUo8QhDn+YKcs5e+c6QcyOEfFYAv7gwvU/qdo
	 TNSLSFsaG2MwSqKDwIKmDBgpms+3O0/ftN1ydpAa5IOBNQgbbXW7NgDbWvVT32cad6vCt
	 vONe/pu9m4QPjyR9eqFF6+FVbY87dlXIt3Sr4mxS5W07W0W37QzZck2bjC6NKMOUQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/0APneT";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC62606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC62606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/0APneT
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2576523a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491373; x=1795096173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
        b=G/0APneTalyZHNVJn+Orz7dqjahcrBHq3vJs0ca7CF+dDsWBekJzRxJ7E84Jn6TuXj
         ho/NduaEqmLieP1DbioyaxdUdFPdw1fQc5AqwdUDjXTEZZuh/xUF8scHsmyBkhZ5lhOQ
         gR2Vrbo6QgbNaJGFQz9h6cRGgXwXAdJjCrY23YZCgv31Zztyh8NHF9UflNNn7auHOAuk
         BbaUGUPzOVTD+ZEHKrEEB7E8Axx205z6iAQXz0A3a3QYOKEpx1UbQ+NaLlcFxAimWJXV
         AhUZ3TMPW7QhILA7tbIZ2xS4m/8QdTp1uDcT+kSnNWsXqHQ0jaP2paYGQ7JcMUMkUFrX
         NTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491373; x=1795096173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
        b=Asr+L1ouewsI04iKXsZYdVW8dmF3pAg147nsLU01RY9q6o790/wjwsEVAi63+Bfk7A
         r+EVXGFE6dsvyI6W4D5crTHDsB9zBwj3pgBB8uKgmp+p1MIeZqeI2U7MTMsnDfeG2B2q
         qS85rGE/1HnpXCwLDaiObL4j6323ABfZD6V3+zs9QYdtfCocqf8A1P7YHhOJG0HZeUTA
         PGzLqlJmQ/7NQ9+fRkOVEIFWk2XSc/Wxka0rRw6aBMqH4julPvDFOLcb+tCFByDmy7x5
         T+FEKSbeeNYmJJ4f84XUWplZXnAP1mvqY78UXDixRQht8hvGyy9Ho/JuoxRVklF/9zQh
         52cQ==
X-Forwarded-Encrypted: i=1; AL+hErEGktqUp04/dfHuVO7Ot4VT9R45QgISjCjhTMNzFzZcuTpk7IeqdjzYfYQI/Lw5eB3ArnKKsSWeL++f2d8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j/xYOuLgpNdv6SZD/8YDTN4Fa5S7GWFU8lfbW1Dr9mRUGgD9e
	UM1zfJdSKr4kD51aOZ4Fm2R1HIHPRWTWpuRsMP+N/ewWncfIIyuttRoHM1K2eVDYF1s=
X-Gm-Gg: AYBFou1qesJldghG64333zsEb6jQXUFlDltV822uXm5LDCbJgbWDOnr478Nl2D6jRS4
	0YW0U1ExvwdJuaC1Z10D35YT+863niVCT85rGjzZmqUCLOrBcKvhJIOny1j6ZxD9t6yRlI6XL9z
	hO8J3YU+mhf+0mQDy1aLkFNSYxgkgR+AQlVzAcBVmHLm05FnNaxgjNGzBD8vov1WS6brePkOQpw
	Yrf+gaTz6RUH7Sjv3n+A345R4a71Rv9XERCv/sfc/VwLZf0fbAcTuhV3wBBE9NuDvYiwRjsWci3
	KKHFkyunXE+fhIwHXWseTICrvThL2IpWQ7Cb6+t1zZxvDzYJ3PTtkGjRjeR1TmWPbSIGKso21Ar
	/nz5cQxkDJDqJH+TmWd4C1yB1ReQSsjJrLpebo4RVU4QuMNpnHdTgGRkIvFibHmfiOblfINyGmI
	U4Vu+YoFCkGh5pfP4ObRodGZPT8Xi1ZLMwxvHhrNwPi3DQDP0CS8BJzwx9eZ7YyJ8EdjtfXJFid
	5/CX/xAe1pIdcAnTzirETC/f1H1d1fO6P2v5W8j9VcSUtGFPpFmypjxMQkGX5fiaPPeDZWdKnk0
	mEXQAmSesF4I588bz+HgT8QTDlok5x21qo8vzZTy4g==
X-Received: by 2002:a05:6a21:4801:b0:3e1:8300:f6d with SMTP id adf61e73a8af0-3f2ff2d2523mr6322723637.59.1794491372834;
        Thu, 12 Nov 2026 05:49:32 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:32 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] power: supply: qcom_battmgr: Kaanapali current sign and charge current limit
Date: Thu, 12 Nov 2026 22:49:25 +0900
Message-ID: <20261112134927.95-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes the sign of the battery current_now on Kaanapali.
Patch 2 exposes the firmware charge current limit on SM8550-class
batteries as charge_control_limit and charge_control_limit_max.

Patch 1 has no code change. Its sign is still checked only on the
Lenovo Y700 Gen 5 (TB323FU, Kaanapali); Konrad asked Jingyi on v1 to
check QRD/MTP [1], and there has been no reply yet.

Changes in v2:
- 2/2: use guard(mutex) [Konrad]
- 2/2: return -ENODATA when the firmware reports a zero maximum [Konrad]
- Rebased on next-20261111

Link to v1: https://lore.kernel.org/all/20261016124806.1789-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com/

Joonhoe Kim (2):
  power: supply: qcom_battmgr: fix the battery current sign on Kaanapali
  power: supply: qcom_battmgr: expose the charge current limit

 drivers/power/supply/qcom_battmgr.c | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.53.0

