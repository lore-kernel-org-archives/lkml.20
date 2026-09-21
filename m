Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEC38B7DD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023346; cv=none; b=lanBF0q+RI9QJGMB9dUltEuSoOnHIYHeZUHvwA+nnT0eQgtOpzhBDuiJYUKm/Q37Z+DGy5awoUaUflB+vn1vRtQjikI6fo5gZOMxUmfwBr3FtmRtpbfwry0W8Wg6eG3K0H6yzd9fGFmDcmeHiaH24MdnwZKTooOfTToF+9uzpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023346; c=relaxed/simple;
	bh=Cbhq5AY4F38rOC/Kyo867bYsHX9pFIIo/xsqTNuiRaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pzr6cupH7SPB24gi6ElfWVGxrr0sVJw+Hj5ZIatuYJXXi6hODPv9gckyfgsU8/XrTg9bKoN3TXOK0S0Hy9k7hRzsGXuFqIeJXh3Qr3pXitGEcr3TZJJY3pDhlvM73mUbNqKP3A1zLnAEtabBVwusFRR3sNbBDh6VW7vWHUq9nH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRkd1HPT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRkd1HPT"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso2073929a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023344; x=1790628144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=hRkd1HPTvRUFUKj4Y2mwClNkeNvSOg7nE/AKFAugdyeN8bfnqygJ74RMhz/TE6PCba
         OtCLOjn+WgnV0vLI5a8pqehPg5snvYh1URoA5dFxNgnsUSUq/EXDY6PQeYmT6RyYkdJg
         jO0LjS1Btgcq3AA0it2QbEC4kSL9Y1uHjlATDW+J+osIZoeM822So8zJvRqpZ8cA8YVH
         T3flecZ+dboTVI9BDYEyFTBXq50L9y6nmSBE2Qm9+kMDJjUTKpI/F09k2Wzwl9cXTmkf
         ZjnKA96KWrKzmYt51W8vrv6Wm+7iF43/khJXVVztrYriFgnBpr43jChiRnhwPvpNgW9O
         MDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023344; x=1790628144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=j3daYy6XBYbDdUwKm/iCSiBVWE7lD9ua1q3Jg+74g0G7S2RDy+2k6+NARqKbARgHD0
         wmLxQPRm7f3QnVZTiRqZvXE8JiTJNO0AYe55P2qLrggsEk1qaWSAfwDuFY1wStJT/wAh
         +6lRDU+DYXJhgQxhymtIOdWLYUx1FziIhO+IzbXyIerYiTmMQ3HXjlGZBxmL6DPYVYqf
         auR+X+YOTb9qdinU9pgZ3uY9RuIK1RkulIYyjx8Gxdyno2Cu9VLPU0BIIrkrt3KXCVmi
         Fo0W5rvSnk8b7d7fZXL1HYzU56X5G0z4IB3tvTuSIRg7NZWSYIdvJJQIbQI7Pfv3pipi
         zBkw==
X-Forwarded-Encrypted: i=1; AKwUvBxLcK+x827ycUFbhusV2cPNklXDo8l4L3CJ0jPdKOf+EQnvu5WJjhRPsZ1qQhh7N+wN9JWyF6fBK0Otgc4=@vger.kernel.org
X-Gm-Message-State: AFuF++nEA7xcijxssDZopcmZ9pvFoLa4na57yUALpfCXvKA1rXiklzJk
	18tYO96lY1l1NC9ABbx6FOY0InGq7XPpY6/y/rh1nm8UzF9K5GTe47SH
X-Gm-Gg: AYBFou0hucdJpt/g06CXgx4Sc0/NwKgtaLA7cFOEjlERrGQ33AWE3rBBHR2NokwMn/e
	wflEqHxAH2AGKqAlaIvBBgguHGKqfAyzZ4RW0uDMwsuD/0sotUmfLXJWwKwr4+74/YuM4FlZ1Ek
	w/4MoltnW/wHZrZgJF5WvJKW8ImIikrd1bNG1zfy6gzZqIp8w857vIGJHwx8C0pUkDFwBn9eUYj
	MKFebylZ3m82EZEHaGlZHwy9dg2/X71YmxR1I+AxsGGRs8MTv1SwahDLYK7fKzKADXZUJlHAhgQ
	sgKIxy8OI/CbAWbIIu8D78BwJm1f2Yy18jBEyGgNBKOVWUvoQfZ2f5Si78Dla/XK7y0NvxXE808
	akk9drrBmAuLtXsy9etYkxxZiRWNVOnG9QHIydZHHp24xtMwP8WPuQJKWgB9APrYiJqOjAj3fSx
	6IGge4ND0MnLc859tO7eocWxu9fwKzn4fE8r8aop+cts8bFzDoj/eWpWfk1LAJIdN975fJS6Mag
	y0IlQMURgZI75aR+bQR
X-Received: by 2002:a17:90b:4c02:b0:39e:2036:8243 with SMTP id 98e67ed59e1d1-39e54eb71f7mr17140919a91.25.1790023343451;
        Mon, 21 Sep 2026 13:42:23 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm967996a91.2.2026.09.21.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:42:22 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Mon, 21 Sep 2026 20:41:47 +0000
Message-ID: <20260921204204.797294-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Resend of the original posting, unchanged, widening Cc to the SoC tree
(drivers/platform/cznic goes upstream through it). No response to the
original posting or to the ping on Sep 9.

Build-tested on linux-next (next-20260921).

Link: https://lore.kernel.org/all/20260827113241.993923-1-khurana.ridham222@gmail.com/

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3

