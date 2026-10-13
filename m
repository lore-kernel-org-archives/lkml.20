Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B451476C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902426; cv=none; b=hUH17ozJwpDB5IYyY/tAFHdJGeiSAOnAE8/xlwXeJgrMwckpXAZ4K7x26HECZSFiSdO4ROjREI4afnnxMN3dqmM12B8PxhESuB/0DDAaQsk6bBkGZofhYf9LMbBhW8pNGYEVsYJKZSBWLK8TG7NZt/I+rNi8SqIOOquoNGftIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902426; c=relaxed/simple;
	bh=r7eQ6d7qv9Fd/ilFwfypCuQphuUz0Yf0KwiBkvXRmi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2MfKh5M8Abc1ouCozdi9VHbQCU2GyEYMvGz2bclwYXc8WP9uv6+UkdsYob2pi6pg5PmeZrpvw8AGdJUxDSTS1hJRRbLoTVuPHtDFZIN3A8S5yfwNyrvbXq9jNd4zHINg4JcTlHOyfWQnnaqI1/MC5HnQqN6nnP5Wb2ve4dMOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGGV+QLl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGGV+QLl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so24740535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902423; x=1792507223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNT9oQ/aVECKcLKoY8+HP5EF3DzEU06F5k2iH3LR0AU=;
        b=dGGV+QLlqM1B89e3MlVPOiUJJ9NrU52VUymwmD8RRKivO8rKTMRfpH/cwsKTFUQNBn
         4eoE7/Lyt/cxRnx+7Yozw/tolVaylqjEMK0dvvYS4MzlUeMiPsLdPCI6onpeUTYgk75E
         htotsYuVewbUdWaGknveK/8OF0hMqDJ+vtVjbRxvI4+3/qw2e9pfoQTz2St7gQheryea
         IG3ioyfdbZtG8tdsljA8VlIvqpCsPWe6I3aysIOuHn8/wPdaFQ449loQcMwP6LCCCIwt
         2ZHyJHsQeW3eWOCY/iAb6zaeae65oDA1hvLoXOjOB2VHESh3dKiq3gsIzT6/ylDe6gX5
         XMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902423; x=1792507223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNT9oQ/aVECKcLKoY8+HP5EF3DzEU06F5k2iH3LR0AU=;
        b=zrsUeEjcd/Fdyj64RcB5sMafrdtVJoe9Eq4EQLjDlZbYS5Ox9ba5/ZycQhJawWADGS
         3NLNUsyxfc3Y1q8LTFWu6jO5JDWgcS+GBlIdXUfWSVoLsPBXCjr6poERk5VD7zbjN2Kq
         Vop0QIKNvPYNAq7U+K6Lgdl3/8lrECsOAos0vCoVaV2pefyvQl6AJfI/OVGdz72trYlD
         dZjxQdpAZcQJiwTtntn040GhyXTHhGRdMJ02kMi3MldFq8lot3miVpZmRE7y26USwpuu
         ZKHNPJ4/wuSr2e4Cr802vODgKSbyA86vRNCjrFvHcuMcbiR1ZClfWibs3qIKmWR9m5q9
         pF7g==
X-Forwarded-Encrypted: i=1; AKwUvBwot8Lg+UCQAOZa9NMxoVHn6wDx31ROfGRdoxKyFmpDhErznwS5juFqGPHVpa6IIC6QoURjLwhpwV5yFi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIef4KSoywx81ds5xE+0KAFaiKyO00lU98Nx36xL2tt6KfPB4A/
	xhGLzTJZCs6NuukQ+ii8RYZMVmrN91k2PUkevi+KaIwZ6KLH2Fr4AeDO
X-Gm-Gg: AYBFou30rAn344lVi5++v/MGOPGM5DVWwUtWO1+W7vxYiKig+INYvoIypKVZ6BHPJNk
	SyYioI8bRBgBGvtSXTTK5UJyvgxVXiCTcIW1kSuscJjzqON1NQd5g/1CoqJgy7Q5ALPz0ptb9r1
	5pgpFGyp3MDNJM9M+eERHJCco1bJfyPfLi3/dqLBzk7HTsdgI6RhRj3Hxt/yDhs1UofAdT9rNrE
	/yVUecJtSv9CWhlABItjEDcbhL5CC05yaUFRssb9a54hgypsvepWrsCc+ucD8M6TsDX1Ja23Abc
	1KW0Q53jWYOTXUk/hpbI6g1MJQqXGWHZfxVtO9A6j1hV2ahf05+9oxHqFARmVfkLWicNN7zoOGq
	h6yDkJKPMwn/rnTLvVB1RKpzMrJ4CXqDfkJKP/Tk7NRVhnGdRkFTs3klcCU95TIURRHIR3rZoEh
	o5gsJrwE6DhptDE1GTjkzmGIgo2Z/k5ajLwCA3iD9zFW8ReUp6kq1AdrV9D7ZR8WlhENTmQKnFs
	mpHsvHIZ3h6KaRT4EUJA2ApNnytEsYY
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1b027a161mr22345015e9.18.1791902423006;
        Tue, 13 Oct 2026 07:40:23 -0700 (PDT)
Received: from mm-ntb-00805 (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm294892585e9.0.2026.10.13.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:40:22 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: [PATCH 2/4] iio: light: tsl2591: add I2C device ID table
Date: Tue, 13 Oct 2026 16:39:41 +0200
Message-ID: <20261013143943.436816-3-ciakval@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013143943.436816-1-ciakval@gmail.com>
References: <20261013143943.436816-1-ciakval@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Remes <jan.remes@mycroftmind.com>

The TSL2591 has only the device-tree matching table, so it cannot be
probed on a kernel with CONFIG_OF disabled.

Add I2C device ID table so that the sensor can be probed.

Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index f56d31404c25..d9c94ca5aa26 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -1149,7 +1149,14 @@ static const struct of_device_id tsl2591_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tsl2591_of_match);
 
+static const struct i2c_device_id tsl2591_id[] = {
+	{ "tsl2591" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tsl2591_id);
+
 static struct i2c_driver tsl2591_driver = {
+	.id_table = tsl2591_id,
 	.driver = {
 		.name = "tsl2591",
 		.pm = pm_ptr(&tsl2591_pm_ops),
-- 
2.53.0

