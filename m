Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E433A0B05
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770086; cv=none; b=rMqT6Kc/0F5qhgrfCvvOuEX2HkdAHoeBZm4Ypd12IccvH2z6zJXtJmNYMG2Q1ZfOpihJ3iZ4hzm1X1/i5YH6QkUxf2QDOJDn291jvSDfp2VoATmh76xOzJNLLvd9lLVfQ60HU1JxCKf7DHpqZOxZynFeNag5dBXG+UOhpzY91tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770086; c=relaxed/simple;
	bh=1Hm5k9fnEVwBaXvX+rrl1XNH/vHieND2jPcZRb7RxS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiyfMmr4TZr+KhPDfFvNRtK7f1rNWNc2pRnOoIUgR9YMnABa/1XtM8Xo18rrViaXldJ1r8jSveIOVeKVvgqgfaO89hlIcNsRox5M6cZKIHMWVy4zh7cikf5eSzH+h6kZfo5cNEypnPb4P+Lus+/y4IZyNPAOlVbbSybGplt+j+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JncePQQh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JncePQQh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so169032066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770074; x=1788374874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=JncePQQhLnU98nB52uDJUobQC5sHIuc92Y1gCh4fG8qwE3NuabHpwM4nDrrjEmXP7u
         9cI8OW9W0o2nzSAe6ZcHqf48DEouhOZUXyxarbYoeECxRj75ouOar20IHcKY+NwVi7CO
         f3U18RysXhA7TAwQjEL5sUccXRk31q1eg9s0LxPMOUqsLURaFKmQG8EvFsXUo+mMTsmC
         GUeJbbZ5bubwXBqxEV9cZaFMkKnWLQlb7RpkNuafzYVdCJJVpg6Qmaxgam9SsM+/lA9D
         fKJMZRfc8t8hvD6WIZkRORofevUuwEf6pOC471URppWksLctWplmsRCsUGYWeNBuzhg9
         hGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770074; x=1788374874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYxeX5UfuTCRGRCYmJDrUw0DxeZXUagnvzMWA/KuGYY=;
        b=kdL80ZucxK9C3vuTScDHFEQX4MBr/F6JoGa/QmM3u2HWVutu2/FXz1qM1eRpivG9IJ
         SImxbGZjVpF5sxyfTVu60JBKjdlfwDkrx4KDw1v4YsWHhqpyPQRscfgEMr56k+Z0puOB
         WRK6CTck2dFOMJfLL9JuEfE52jEcIC8z9VeOwGOl7W6i3bXxtWt99DqbbIxwmOTz5xxy
         p9R66MH/5zUu3WGeUIdG18L3nUvczZmzp4PaxIFzKm1y9w9EQofTt/w4YMjKE0LyYorM
         SyarGFvOKWYWAq30/uxNtUGKsUD7Dbvno7aH/1tw4SBuN+6CTUBg6sXNNsJvv2eB1syn
         3nNw==
X-Forwarded-Encrypted: i=1; AHgh+RqcOu12NwGPz/e+UBhaw4lCXrtwLm57Hy1Lf8NCApxLQsz8SbgIgnHL0bZoa5RPPvzrcyL65naBzuECnpw=@vger.kernel.org
X-Gm-Message-State: AFuF++kH+FSuSZ8s3vPy43aJdik7q/9WuaI+6aWNchgXvBj8cCYQDoGx
	zx20M9xnpvpvlKef/kG/GS4zne94KcytD8V7ZfIb5i6y766QxBTTQLlT
X-Gm-Gg: AR+sD13spAox15VRv+2CpgOTOUObIp8F+TwvF32CinO4IZRf22hZIX3pmE1NmvZ2Low
	C2mxnwYhs7bkZmoxUg6KywVJumATdTRasgIcDFDlBX20RUCfbqW3wnBZKWkMiU4nGh46CtQdByU
	e7DbeMRDMxAN/+cvfj/JoyaQYL8uxBAL8P9e2Eqoc6oYAgRnioR8T/+t/XPgxsAiaqFM86HWx+T
	cdWDttMtLtntupASM93Z2OS6MIlpTa23fHv8EX5TL2JO44k7SwDSime6o5ToFF71FnKzMTyx1M+
	R/lul2JLI0ARREwmOMspqfZ0gBNRAjHqb1nH59SecxmCRS+gBJ578Tky4ZM4s68ymR93b4vdc4g
	mLVWRJputSzdOoD/Qh1ol7lkeEsT9JnrJoJAcJtyU3iXAXn+NWYEdAXAfWZwuS+tdAtMYUxNDx0
	gQIj1WNQ5wmsLvkT5MMO2/zlVIWU+1bcjGJT/v62uL4pnoB71+fnwCGoN4EFGni4EegNZJJ6f17
	EWUFsdI0ZusT+iXd7VrXKmNTrxT1U20CWKt8g==
X-Received: by 2002:a17:907:7249:b0:c21:792:8257 with SMTP id a640c23a62f3a-c250bc37bb2mr1060199866b.15.1787770073799;
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:53 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: lm90: Fix DT channel constraints and reject unsupported channel 2
Date: Wed, 26 Aug 2026 21:47:47 +0300
Message-ID: <20260826184750.4798-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of this patch series is to fix DT channel constrains in the
dt-bindings and inprove the driver to reject unsupported channel 2.

dt-bindings:
Forbid temperature-offset-millicelsius on channel@0 (local sensor).
Rejecting of assigning temperature-offset-millicelsius for channel@0 is
already implemented in the driver.
Reject channel@2 for compatibles that have only one remote sensor.

driver:
If the sensor have only one remote channel, reject a possible unsupported
channel 2 and return an error, similar to miss-assigment of temperature
-offset-millicelsius property to channel@0.

Flaviu Nistor (2):
  dt-bindings: hwmon: national,lm90: Fix channel constraints for
    temperature offset
  hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

 .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
 drivers/hwmon/lm90.c                          |  5 ++++
 2 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.34.1

