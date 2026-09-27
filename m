Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1532A1BF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790491495; cv=none; b=uaqlOcKjBWu7vfDEWbp6TSN9Fp3qiBPi9BILZskgSJcjlI2dfgVS0kVOG7W5vvwz6GrCwmwQLYZcjXNangKyp7fO1rPlzpSvwgX/Pu2h1V/Bjs33f79Y7jcdjqR4wYfHmsBTmxiZ9ko1IhLWS/wiEY0cD8672jGjt+L93dv+/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790491495; c=relaxed/simple;
	bh=VCSr1QwLPdpGFwkBfnzDNQ4fpsZLhXC9EdlyYTtIq4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM29o4oFM8wKYToYGTJcjvgFyQIQcXcEpKMUbw2pXGranRVJbB98ex49TkgUwI7YdsDTJLJySrVH60W+K1fcSEZTPzeKQSeRBqwQYKuoNAknWW/pnXiFY9YxrhQ5yVAJ6wggdDenArn7BYEgpydLHm21cdzolZbIOmvc5wCxxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEN1yBLS; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEN1yBLS"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso15741311fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790491492; x=1791096292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq7Q91vQGo/b5qX6wq8BmyvihDyO2qxZ5pfJg2BwbSM=;
        b=cEN1yBLSHZqjSeYVZT25tM6EQlyjKlraomzt6ZMAxg+AEPWX1ltEfe3jpiQXF8yvN+
         LbnrMM8f7lspE+6h/eTYerVo/HoMPa1FRXcarWXXsbSRGrEkw9f8roE5H/38DQzMn/vY
         umZs7ImrCptym3CLX0SEnDGojiLbzeGSJWgD/fiLdMUuGYqhH3ivxseSGO2bgcqoJegB
         t5mspGyxIztMLB5ymI46CMRoyAqk0G0X82QHk79UjXOh1C4INI0wV69ZHgldcuwG5tk0
         JqVjNxo3wu4nT+8VA78S/DN6XXkj0+4KDST7VRtKSwQhzqk3ZynGSWcA6BDclVpSvmCp
         B2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790491492; x=1791096292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq7Q91vQGo/b5qX6wq8BmyvihDyO2qxZ5pfJg2BwbSM=;
        b=QNRONwwe9thYUfDgBOgnYiBYxFdyT+z8nqzHoAfUJ7OqgcWlOKYlHm3vYgqxJupyYz
         kCYm8O0fmp8p+I5iyYmNpeDuIJAbjvEo1RV3qs0GXRbfFxdPiEcj5LLcJPQGdURgwyko
         jUPH3Czbh7pFG6qwXj50WnFRt5rmY1olfFALkIgdcrSuoYkxvcubXrZdpwsyXbOPguIv
         N7zEwGnk/23dd92C4cIz6AyBLOIrN3jGdpOLoecbM8cm2gLcrBuXAyVfwCbcT3mZ5Exl
         dEMXUZsEgQJaC6E63/UBxNtZHTn9niYKxh0sgHKZoSL9pTXq0RixhXaF8Xrd2Izd4DMF
         uuXA==
X-Forwarded-Encrypted: i=1; AKwUvBwpjMDhud7UEHb3B6z74P97JXxh0ekw+f6/2h9CIFwZVexCKKcefhvdfWT+bwu3ZE7O95D7PlGIS+FgSjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB4G6m2RKH0XwlFjd5JRS2yqDivEXOzn9jUnJRMnxAOYWJDMGQ
	EigQT7nOBbLSZDiBUcZ90GriU4ovfXl1f9Kzzu++CQ7PHBQv+BinGK5p
X-Gm-Gg: AYBFou3/opYX43HeIoTQwsrU+Ow7MUzto2QKchO1nKw5klyGghOQP5K2P8lKgReCnPk
	zkujhTwiJKawH+6YYlPCPqYaQ0p/FlD95bUxxN96F80GwFhoSSJxRF9foZm5NMLywrXkuXaYI1x
	9vTyQYrIZBTyEF+HdsMWLimwbwVYQbOyygMhi4HlxhFN4lbojpA4EcA4ZLnp1z3rZ0IegIUpzYr
	zpzoVNpkU9BOqxU0EGkb8X8MmuRH/A4E4p1qv5A2WkFxfHp0l8DLuduUknaUVQYz7NJLoTA+tLM
	DT5SMPP7KJcQFW2SQ7YJ78bay4UnaUSVQ5UxET+UyuuNrKrM2HyGd2tuFZIFfMT+ICXEL3sbH2P
	Rzk8rYaKwaDmLvsnBGZer+/EWUBUfxhvVD2pV5rM8iirOd+w6+Q4piS2RCyAzr57E69aDKJcH6f
	FYYzmpZ5WnkAdm70QP0Ws4CdWe+ijqUQ+gIlbvTRhk0rLohr1Ah+501VFTv4F8lFyoTALiZGn+M
	ss=
X-Received: by 2002:a05:651c:1990:b0:3a6:3074:122c with SMTP id 38308e7fff4ca-3a63c0b0092mr27274451fa.17.1790491491540;
        Sat, 26 Sep 2026 23:44:51 -0700 (PDT)
Received: from arfa-server.perm ([37.114.244.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b3a228csm19150511fa.0.2026.09.26.23.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:44:51 -0700 (PDT)
From: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Subject: [PATCH v2] selftests: ALSA: Skip timer tests when device is unavailable
Date: Sun, 27 Sep 2026 06:44:30 +0000
Message-Id: <20260927064430.2112688-1-arfa79lg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_SND is disabled, opening /dev/snd/timer fails and the
userspace timer tests report failures even though the test environment
does not support ALSA timers.

Skip the affected tests when opening the timer device fails because the
device is unavailable. Continue to report unexpected open failures as
test failures.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218479
Signed-off-by: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
---
Changes in v2:
- Limit the change to the timer tests, leaving the PCM and mixer tests
  unchanged, as suggested by Mark Brown.

 tools/testing/selftests/alsa/utimer-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/alsa/utimer-test.c b/tools/testing/selftests/alsa/utimer-test.c
index 1a9ff010c..07aeaa777 100644
--- a/tools/testing/selftests/alsa/utimer-test.c
+++ b/tools/testing/selftests/alsa/utimer-test.c
@@ -51,6 +51,9 @@ FIXTURE_SETUP(timer_f) {
 	self->utimer_info->resolution = (NANO / FRAME_RATE * PERIOD_SIZE);
 
 	timer_dev_fd = open("/dev/snd/timer", O_RDONLY);
+	if (timer_dev_fd < 0 &&
+	    (errno == ENOENT || errno == ENODEV || errno == ENXIO))
+		SKIP(return, "ALSA timer device unavailable");
 	ASSERT_GE(timer_dev_fd, 0);
 
 	if (ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, self->utimer_info) < 0) {
@@ -156,6 +159,9 @@ TEST(wrong_timers_test) {
 	};
 
 	timer_dev_fd = open("/dev/snd/timer", O_RDONLY);
+	if (timer_dev_fd < 0 &&
+	    (errno == ENOENT || errno == ENODEV || errno == ENXIO))
+		SKIP(return, "ALSA timer device unavailable");
 	ASSERT_GE(timer_dev_fd, 0);
 
 	utimer_fd = ioctl(timer_dev_fd, SNDRV_TIMER_IOCTL_CREATE, &wrong_timer);
-- 
2.34.1
