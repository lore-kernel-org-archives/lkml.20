Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E872F7EFE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694460; cv=none; b=dEOKWhUv3bAhxc2HE963q5YNfJB6sw1RRXqljLHnMVLHUdyysqPI6YwLVDLmee+kkIQzlk/R/oYYVPnvvFRITgXIf3FgE4gwlodB0WVosspY7nAxtyefsRbzvbqNCkIPIX3Tm0/B/7wrcpwPDNl5kXYHD5gKgB5xi2LOKjYqrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694460; c=relaxed/simple;
	bh=PajRC5vUMiRr6CbTVl3zKRdEDLQRI778cFy62JClji8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVdEXQ0AZ/EESipHarovub9DruAkaBQE0bwPIwKcfkdl/VmsVwyLzeg9r4FOhRAVG0be26K+xuCeFQph80l2GmsM5wkR725wvjlr3yxTvAMnGjaHYwYteO0TSGr/RHUmrYTkJrAIDj6VrZzHE3mU8VSL6tiKkBfDJIejxErIKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUO73iaP; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUO73iaP"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so1379949eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694458; x=1792299258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=auMfHamRfTcV/GZLqeZ5Y5LbcqKOtpZq3cZN7xkwVsI=;
        b=fUO73iaPK05Xn94AFMEpHFtZ0nJle9zw7fsi/K1ZBoT4zE9tpfQ4AxlGdF83QiZ+dy
         CSxWLPVd4uTa88J10SAdAkXte9cYQA11+SBt2OsWxRoaIFkcrq79uRnVBRYQ/xoNEyu8
         ce8NmF0KJiLehtcOFSiBLIdF3KVDLEhHDjgo9T0vtp0uOM7h3IkT7pAIp/Gtkkylwnq6
         2dro/8MWeK8BMh7r2qDAzgKVJKxbr6qNz4I4RYqucu3YKa2lGQMw0b4+f9iKebBf7oka
         mvOn/Q7CTNJmuvw98MDEvU2hbzJ7LhScTYDmsuqWSyBBKxTDKaVh0C6IeFc2XTtSM41a
         fzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694458; x=1792299258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auMfHamRfTcV/GZLqeZ5Y5LbcqKOtpZq3cZN7xkwVsI=;
        b=Ou1rk9JECvZ9HswVJX5qX/P0eMHaC6vkDzvBBqz1MaFA1frTBhVC80IX1XRTfYv4eR
         dFG6IWrbCb8hgTVzfGE23CeVCFKsJm3n0c8CE9WsaV2YLngjX7bzpQyYVErMx3MDnu9l
         Z/wyO5hq7aQGWfSb0oYLqsC8l8mp5WY9zO7Tvjx7I8QdcbqSuC4zeeibe4HEutFklHgi
         B1LijVHbZ13omG0rGwMj4KKzy61eVk1TcnroR9FzA2kBHDcco1GSSrvDdI2siSRyqZLa
         bvhT9B6ly45SAER5PrVUGdDOID5mu3jGoZs7/7zWUiI06NSJdwCcEZFH6wpkduVWtcHJ
         hndg==
X-Forwarded-Encrypted: i=1; AKwUvBzCbQnw5hzkb8bB0TpQL2r9AOpgPAtprA6WL1MyXPQXoZQXRDq6edPV/ixLwJIp9D+txt0F8XHE9cp0nNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtqDmvL1zZ5sC/4jP8IW3BMw6FRjP5YMPOSRh1OAOmiSP6Xy7w
	wadbEUeu0ayTVzT7X4nAIBSnobMkYPaoPlPU0sTvZpmhUM9RIbXKracb
X-Gm-Gg: AYBFou0SQAn1ZDpi1GTe9DyA85T4xt7qtzZpwgf3Fkqs0JLxw6wP989+qNas3UJiN6a
	p92DcSsvPMwsLx1OWu1jsr3Swl53GWlhiVqSF4QCch9jkU4iJ7ybi4tH4QYgb5m/EnJMU9osYNW
	rBj1vyyNAvrBWsteog8c6m8oxifS2ifDtSMBYpXnqcQDzvD9Hm1trE1O7zcOgxPtlvaX681GqLb
	p4HMAJ1dRNXSsIX4eFHt/ynvpHYpSzXok5DrZthxpgV8OvisZgxAgOn6Cq0w38UG1vj0XcxF6Hx
	l0VdrVHuCf/Pu6bHpb2UiLVd6coxb/EiGT+XkB3/wMmoUBOtdCMxdLD6pD0INxRhvemeL3TXEtJ
	IExX2EsNkb1HJ8qjRYJqWBdsaJBtP+2vAlNvNS9FkAnqIktaq35CFEfW4lxnBUkzjEIfwG5Jsh4
	55MAhmX0LrqNY8fpab0L7+L3ZGu7IGLK0orYjvMgqcFVs9W00M6RZeTOTN7nwsJEQgP7VdMKB8k
	iQzD4YaDvSHl2DeO+YZdAvSUJhg65BpzFywMUtqjmPlOVk2IfZC4qmbX4LvyjS9jR3I1B/h1lYu
	5jxMjljRoZ11NGiZnUIEnPp4ZDW/8g==
X-Received: by 2002:a05:693c:820e:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-3537e0be0dcmr8619947eec.24.1791694458226;
        Sat, 10 Oct 2026 21:54:18 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm20678181eec.16.2026.10.10.21.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:54:17 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union member for CALIBSCALE
Date: Sun, 11 Oct 2026 10:24:08 +0530
Message-ID: <20261011045410.356156-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IIO_CHAN_INFO_CALIBSCALE read and write paths send
MOTIONSENSE_CMD_SENSOR_SCALE, but set the flags through the
sensor_offset member of the request union, while the scale values in
the write path are filled through sensor_scale.

This only works because the sensor_offset and sensor_scale structs of
struct ec_params_motion_sense happen to place flags at the same offset.
Use the sensor_scale member that matches the command, so all fields of
the request are set through the same struct.

No functional change.

Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have ChromeOS EC hardware. Both
union members place flags at the same offset, so the generated host
command is unchanged.

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 551b86236abc..2839714f5bc8 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -70,7 +70,7 @@ static int cros_ec_sensors_read(struct iio_dev *indio_dev,
 		break;
 	case IIO_CHAN_INFO_CALIBSCALE:
 		st->core.param.cmd = MOTIONSENSE_CMD_SENSOR_SCALE;
-		st->core.param.sensor_offset.flags = 0;
+		st->core.param.sensor_scale.flags = 0;
 
 		ret = cros_ec_motion_send_host_cmd(&st->core, 0);
 		if (ret == -EPROTO || ret == -EOPNOTSUPP) {
@@ -178,8 +178,7 @@ static int cros_ec_sensors_write(struct iio_dev *indio_dev,
 		/* Send to EC for each axis, even if not complete */
 
 		st->core.param.cmd = MOTIONSENSE_CMD_SENSOR_SCALE;
-		st->core.param.sensor_offset.flags =
-			MOTION_SENSE_SET_OFFSET;
+		st->core.param.sensor_scale.flags = MOTION_SENSE_SET_OFFSET;
 		for (i = CROS_EC_SENSOR_X; i < CROS_EC_SENSOR_MAX_AXIS; i++)
 			st->core.param.sensor_scale.scale[i] =
 				st->core.calib[i].scale;
-- 
2.53.0

