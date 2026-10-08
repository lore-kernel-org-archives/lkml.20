Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0C392C27
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469646; cv=none; b=nwSMBsE/n+K6512o6+mqqbTgZPQ+oUGXgERb2dDo4MqXrxYZRUc0WEmYP29IQcKLrK7xP/3gBJVOjHhmkUV1HM++HTKm3i28oAR3TNgtBhLfhyx1AWESZsRUXL3WLaGLHTA1YxQY8iyziO92egzyL1i1ccsTaDNqMa65Jgz711g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469646; c=relaxed/simple;
	bh=oFAZ/jV4xaWEMD9CDG7BLeEjq1GEmlEGKP/LQHYRKAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tn3kzGsO4RhTSbmByGVw4GNauFWZau49AeiX4+aG/L1CxfgGYBkdYF0p1Wd5KkDN2ZmIJiRlMy/X2PrIk59npwLHFGY8DQBrVWF3BVUcs/1HbSaiBThI3R4d+9nqsPYF69+8E5W7Jl8MLvKf7x2wUrSFvDL5k0QiBGYYIDyF8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC3mlwCW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC3mlwCW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c399641so30631465e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469643; x=1792074443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li4bEStGW1XmD4NtazXRCTVmKu1+NCEmq2GR+ASd2mQ=;
        b=aC3mlwCWTCJFbci62RtmdCOObmTNzRD7dwafPdvf0aRp5mn1VmQNU3yrn5WkbtQfgs
         5bUVnCPfDJWilBfLurEkAu81WBGhUz967nVITRJIhEmLSXXY86OLbgHGjaBVwUKa7r3d
         smerQQJxNliLTpu8cK2go52uDbKiaNXhovivMSmeC3GsiCr38RkL5fz6df0BTJO6F6ZO
         lFxF8QIBFkrIRLeGQNiszQMx/oKGtlN/O5x3/0l/E/2dK/oU8By3BJUYTzPJRc9f846Y
         4q7nulFFoabQ3hXrIEJuZCw6RxhMNW9YXqa3Xb/yJ/A0dOS/xhNag6clPwmyfHDTIP2t
         gwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469643; x=1792074443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li4bEStGW1XmD4NtazXRCTVmKu1+NCEmq2GR+ASd2mQ=;
        b=BKvPD+eV7jxxccOnOJGwrIJJMuUaoQMdYIFMBv8yrb4GcTTWfFXuGqgZYWF0rOaClu
         l98KylQnlqHxG9UJKEgRU0AoufcwpXIyC/QZmJyB01w/7CpG1TaVOr7aFF0zcZHop9vy
         +iWfqps7Ttl5jfh3Ki6e4KWMauxzbiIbd3pLozzVVmpb4ANI919XSIQ71Pq2TetSzm04
         FvN6MeW7CutX2mD38fFJr4Rk3BK3fraOWsrUQUTihFEZrjHJkvSdZotlI6tLFPL/Vc6N
         fmMCw7Nen2s2ApYXkkg64Iex1FqdRITIJeoTJ2SDpq+clf+aNPqQ89NkvjQNDKDnEE4J
         kAHA==
X-Forwarded-Encrypted: i=1; AKwUvBzIhtLONOhEHbFFxVZ1YQXSMgqkUelKhVP5ayrpBLqCt7XiBiZBzY49mvoRuUBjSpHCaxT6lgr1ZPs4IuE=@vger.kernel.org
X-Gm-Message-State: AFuF++nctcCs4A3yBj89tCxn/t8w8d511DJIr5NN8ntfHf1GaAzW0mNX
	xL0xWwYXXPyi8sha82LaFWbRfM4Ho25GEfDaZB4tQdSFl4VjN2GdEx0T
X-Gm-Gg: AYBFou2C9HIrJTKJlm5xH4vo2XIbViInnRJ6Ba7/twZpU6USXI8y0BAkxjAggf3bYl8
	+Y9/LgAiZf/s0DUPJ9PSxbeRB6DWB7paPJE/oQiSU68vLlpPuTgfctY2SJ67q17+8Q35y4pUDNi
	pK6TMpBwGS/orDV/iZgis7tFxFwINPg6DLi6OGFe40CONviPYX3M9x58+cgduX1gpd13pzXhnnd
	FmD8nlelLXnIqON77arIy9K9BQPSzR7w+noPZwLjjicJIm0OIcOrv/STsGhM718TAGhL0yVQVf3
	agNSdyEZ0GyDdvzmyQo+uoWF1n2+02RMQDmUWVkz8oi7i6cnZ5XhKIZHckUNobfx8KgFC2koU7z
	IcuJzv4U5SYIk1TNjPRkha0fjpPsbhN1LcnUYJB8ObSgXNxIpWj45ugC65imjDUm/T0HVsKdp9U
	kHfJI6EESUgaBNsPdnVTMzEyxZ+e05LgnaEDfOSCG9wyz/d/qt4vyL3MrZrwp8Xj17sZ9CbElOi
	KtJwcBxnaD1gW0vh5gCzPk=
X-Received: by 2002:a05:600c:3b0a:b0:4a1:70da:3350 with SMTP id 5b1f17b1804b1-4a180679e58mr97462045e9.32.1791469642770;
        Thu, 08 Oct 2026 07:27:22 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm10776052f8f.56.2026.10.08.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:22 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/27] selftests/landlock: Check errno for combined VERSION and ERRATA flags
Date: Thu,  8 Oct 2026 16:25:45 +0200
Message-ID: <20261008142604.39107-18-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The errata test checks that combining LANDLOCK_CREATE_RULESET_VERSION
and LANDLOCK_CREATE_RULESET_ERRATA fails, but not the resulting errno,
unlike the other checks in this test.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index e486e557f453..5f10300a60cd 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -136,6 +136,8 @@ TEST(errata)
 			      NULL, 0,
 			      LANDLOCK_CREATE_RULESET_VERSION |
 				      LANDLOCK_CREATE_RULESET_ERRATA));
+	ASSERT_EQ(EINVAL, errno);
+
 	ASSERT_EQ(-1, landlock_create_ruleset(NULL, 0,
 					      LANDLOCK_CREATE_RULESET_ERRATA |
 						      1 << 31));
-- 
2.56.0

