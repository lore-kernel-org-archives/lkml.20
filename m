Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416672;
	b=AMg32UzK2akoyLrMwwVuvso41mf664o05HPAszS1pXv7dLF00OarSmb8Y0762eEb6+EI
	 Kdr5DXS92dYZHuBrpQZB4/pkXHQW6cfB4X4imcrOlfP+ZC09Sx7tcEhDYVr6iWt9/07zP
	 zjvYjumb7DvDyU85aG/jdioHUoPIBcJVIfOaPPIrvXvRcT8t4wuhJjc7Fkg/6mvRUmzqp
	 unt8qcOJJAYYZCFCo+z5NO/+WkMPG5wtMYPZ7BKHBbqhXRUiE9gBPxZH3e+sL7799kf7+
	 fWf5CW8TJqExbsiXczWGVn8I2RIThfSqWclLhLv8CEQryuLCSS1UY94ysFnG1SPkV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
	b=Rck8Ns9MdjAG03pm10LCv36k+vjxZzDbZH7MLWSVYaRN+MptrWLWLdauGAtUbyQw1izT
	 mzYN70maJrm9hbJaHOsA6lvoUOzwd//Jkh/Q2R6xACFwLPL4J5JQEKOpB74frn2fvU6lS
	 k4lYFqkod0jPBM/v8BalgF4W/q0gCtxhUS6vzvTb+3a7bBHJ00v0uX4z8o9Uj46crnGu2
	 9vPqGw+aWwuaHt90a8UTm4GHfxb4O6PfNR5HunKnLb0Ua1BfTA1CSIDS0eqe8NxKtTjTA
	 Ygn0zOX40jIUSt+tZ3ca64RO9XOePkxzQgFM2yiY7Y8sItdw6lcyK+qdQs+ZX3/Q/8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=LuThJJ4x;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B621606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B621606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=LuThJJ4x
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3993892a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416670; x=1795021470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
        b=LuThJJ4xftzwIu1/vST1ZFUajY9pjzoD5bIyN/7qJVjfGwPoUoMAc+ICExyBqEfr6B
         tjsLdoLL9MC8XyMu4p44DcRjZ6YkCqntpRMWc7GFLOSqthUvKTHnxLjAjhA6bjpE6LLP
         N7oN0XzS5b2WzCzRDrfCYjZADs+w1ePhOmmw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416670; x=1795021470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
        b=2FAnQ9yUhIcL+9cvEVhob7/J8TZtXnXTcEre7j0N4WfBDuzuUIWM6FI1ID8NeeehUj
         G6cA8AgIDVAUmmQCrrlNYRArZrWKmiSwczDdPOmgfhlhULrs1xblBXvBOokuYV5qRBhq
         1JFIlsfevHSv8rRo+r58RWLwcjU60P/Z42M9LsjQOGc0KBhGu/WHcSf9UUpl2cM3US2j
         6O920KsyZLxGCUflZZXqZHSMbk8UAoH/xNIdIdqGa1FYIxPUljSl+Vwczr0Pm8DgCq7O
         owdhpWdIk6cA12/MJ5Vb0lJ57Wt6S0b45eevJ2PxNqJLcY7kwV9WzwkWnqoE5JmzfI4w
         0YHg==
X-Forwarded-Encrypted: i=1; AL+hErHqFzrvJ0S1b0kAHSraIaZDJlrPEYNKXzA+oY4m3CIf6VrU4TD8LYJDfyVH0iXOFhC1ko15u1KwluOCVSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jO7+PFDi2fJ4Kx93uIpb+A5UnWnxyM7Hhu0GEj+pT1gXecx8h
	VZTxscnWTD4LA/yIM0OJNab+FIZBZtPFsMgrPd/4BLtphhxMtiZ1C5gVQB0QmyYMuY8=
X-Gm-Gg: AYBFou3ZjbLu1gmMDLh0/fB2IIwkxoRxug5CLb9KJrZE01PIs0wUYkRIpyB1X8bTwcD
	YRMVDWfg+x3hQfM1lbISgy6kWHmTGOx5q44j7JnYcjHG5FaQaWwwJOxANuuc/lrQ55SIHpx/snE
	qJYGtRHxnjQY04SY+zHCP2/DNb9yQ5BQPQy15T0aE0nI0D3sZRHggUhVTLu0+1laiLkyQDwEZ/t
	u+BM8Q5s/r2YxD6awNPZbzoCFHVVUzGLGsu9LSqpQaWc0uWdwy7QFzx1fY7SScLK7JZxHTa97LF
	AmoRriuwSnU3xctV3ekQe2dpR3sJAYRNCmiuM/5ej+ABEqczqw0t4MLs0yZXVOOKMV+Fd97p4PW
	TFFZEdZn0GZVvAF+8dc7oG5bC26AjaPO1j6ROCh2hzr3+9LBuy1dHuCKcyTm36SsrPt33Nlgjlf
	V9zM2IfhTMqkl/GvpdgA/PDyR+J5MWGUyAnebXUuad6k7P2YSe+mJ+T1L2AOH2C9vYVDCIT911s
	bBFBLNO11f7IR/1uG2ZwEUZqU9T5j/mm6WmI5pGQUc0+7SyyCt5cVGoxAUX/lxmSYwfHxuUSkPz
	rKOvFWpymytZhrCQlt23xpya8cvPRwQIXGxiJOSkgsgDS4J6X/8rB9sxha3eN1/T3HvZNoj/PBI
	c3I7VKCBZjae4Ff2YGRfdc7jSbRFezVi/CNMt
X-Received: by 2002:a05:6402:4546:b0:6b5:6cd3:fd8a with SMTP id 4fb4d7f45d1cf-6b7773f4865mr2011972a12.10.1794416669480;
        Wed, 11 Nov 2026 09:04:29 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:29 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Wed, 11 Nov 2026 18:04:05 +0100
Message-ID: <20261111170406.1634428-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
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

The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
and balanced-performance are no-ops and reading the profile fails with
-EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
also aborts system suspend.

The firmware passes the mode to Intel DTT as an OEM design variable.
The DTT tables in its data vault name the modes and set the sustained
package power limit (PL1) for each, by power source. For the H484 CPU
variant (H404 has the same layout with lower limits):

  value  AC                 battery
  0x02   Silent  15-25 W    Silent  15-25 W
  0x0a   Silent  15-25 W    Silent  15-25 W
  0x09   Balance 35-45 W    Balance 32-40 W
  0x03   Smart   36-37 W    Turbo   50-58 W
  0x04   Crazy   50-58 W    no entry

Map low-power, balanced and performance to 0x02, 0x09 and 0x04, and
use 0x03 for performance on battery, where it gives what 0x04 gives on
AC. 0x0a selects the same tables as 0x02, so report it as low-power
without offering it for SET. There is no balanced-performance mode.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v5: add Mingyou's Reviewed-by, otherwise unchanged.
    
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15. Firmware mode (EC 0x68), DTT OEM
    variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 4bbf38651ed7..c25b4e4c9b3c 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -114,7 +114,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,    0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
+};
+
+static const struct bitland_mifs_quirks tm2424_quirks = {
+	.profile_entries = tm2424_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
+		},
+		.driver_data = (void *)&tm2424_quirks,
+	},
 	{}
 };
 
-- 
2.56.0

