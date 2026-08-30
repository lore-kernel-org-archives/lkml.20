Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E63BB12C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101835; cv=none; b=k5MP51yGwgg0f6w9o+TMRsl8IsCuMppI12DZ++8sQv+sF92BmvBi2bmuioaCYOujaIJBdtgZ7VjJnZpaGb20O0Nb2jUO6gSChI/+dPtBX2/ovqFtvelnXZktoxM6TzOYnLSrCTFgRy6QyS/T8lIiEhKo62dpN1q9mRhTjAY2/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101835; c=relaxed/simple;
	bh=aEjxZJwZLa+q7K9xSjUy2o9VFRy7tyW3hxCACheKEzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JG1JTBaYRzo2h/QrlltfV6CyQ1RA7bL3CQuwDjZO4rmLdsPKDwQ/08n5Bpe5CcYG6whSjfLzo1msBmoAArXgEol4mRCP1o8685Dvwe6N7ttfSIL9yBGIbbRdy6RY1bYo25ZidGCmlxYr+igFlwJ0t2XT/X4+bX4SfqSlFiV7Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZicajQin; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZicajQin"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc149372c14so1845885a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101833; x=1788706633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWOAHh0q81CutOvcz4kXnkwApjt4e2WZQIvquKf0gdA=;
        b=ZicajQinxa2vtMxCTblpqKmx+/7DS/HGvaL6BgUWdvvG9/W8nGVfs4s9pEBNuq8D9o
         dYyyKxKmUvzZ2y4WvOpSX7DgCaCq0pjZZYyyrsj2mWUeagjvDJ6XRzeTPvF+G9e2v8y5
         7uefCM2UgDQo6pQL/HK63NbVdndN6BNyQXLseU8WcKrG8xtT1tC8cXwjU2L4BshqmJPB
         waQT86taUIHKWb2kcRyBg/4Q2+4ve9unYN/aN4tw1ULgCiZStd0r4z74cd17HAVrBgTo
         EkBz3u4PLJXdaNpoLFfBhOX2LW6nmiahUa+sBn4Qg6NQT6dODIS1af8bgd4FjRw5KUTc
         mIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101833; x=1788706633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWOAHh0q81CutOvcz4kXnkwApjt4e2WZQIvquKf0gdA=;
        b=kelbZJQ8IlVuEoXyQSBhSCBm36m9q3kUGI9QnAa1yTLcgoz7XmaQrEJd0Vt7xyaPAI
         WlyhoHnYp6SLllb6AsRpPq8boH1HSALYI3TkhpjHMz7c5uV+Y7XURgQolXH3EsMD/RAd
         0JTU2j8hMBLSHl7b0062UaawvvvCla0NQpXx0sYdGxZcCCRugOc0MzKPBgz5s3rQ80k7
         +03BzeKGZdREKwi1ntsdHm4lMb+Qfmho2bRlDK9m7QHRVHpKVssa0MnCeTBvOhyYb5cq
         8gqxPLop6MEVsBaRqqTKBcWytv8fkp4HnFaYP2bW4FAv/ICxE/EYcaqceEM7jR2NXeL8
         OAxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rphqxu29Co0cds9MjTkoSK/K87mtRFrwP/bv+psFJMs3lBxyDTyzGKk/brra5b4zCKwVs70MOIHdzLdgr0=@vger.kernel.org
X-Gm-Message-State: AFuF++mp3sxOw6ZOHNlJrSqE4EBwv46OHEoPuA+DzTuVHwADdcyeAMCI
	JE6llyywxHp4+ICDK5LH5+VHq4Z/5qzAgCI0nr283PaxO6I2SYrhBetu4At+TFwM
X-Gm-Gg: AR+sD11xGUq4C8SVesIJjsupvQkps/H++qwjjRZO8ZI+ELLGsFD2SnZ3M695pi+uKLi
	Mm4o+P9wOkCb4+bsd/UtlPLZO6rhzG6oHMzvnH4/eYXlDll0Rfqe7D9JavGsdCSG5elewh50JSc
	Ky7iT8K/Irve+DTxK2crDLYncgUWsPrE2RVsa1b4V8Tk8kvWK27+hdFHmNsqvHJyRCAKhEVybRS
	3c6uKUSbF+hacaUo5ovOpvPoonEehhHKPnEQtjZx+2jcutJ1I1uCADyQ5IEzTUP3wfgLyMekpl0
	GiZv3jmoKO9A8lOyUofsFUh4AZivrMzBwdG8ZP/++neGXJlIpqf1Wq/H4+Sx6RiohzqRvoLxZRt
	8JEArDdcFi5v7ibgMGiicDv4n+G3KbBvX1NST5OwEUOkeOheTBLMjmMlaTXgfWwL13UCsTWGXJX
	1q1nGyTwUOqe92RzgeDaRq95SorwbN8st7FMElTqn2De6t/EYVU72m/hG+ssDZ+teghq1HfMu/B
	bhtVuaijV4RJSKFz/c=
X-Received: by 2002:a05:6a20:b7a7:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3d268ef9e07mr35570313637.9.1788101833386;
        Sun, 30 Aug 2026 07:57:13 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:12 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] HID: hid-lenovo-go: use the right controller selectors
Date: Sun, 30 Aug 2026 20:26:54 +0530
Message-ID: <876cc33bede49d8ed2437278f0696010df98643c.1788096667.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The right imu_enabled attribute selects FEATURE_IMU_BYPASS, and the right
reset attribute targets the left controller.

Select FEATURE_IMU_ENABLE for the right imu_enabled attribute. Target the
right controller for a right reset.

Fixes: 82cd9bc866e1 ("HID: hid-lenovo-go: Add Feature Status Attributes")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index b8248bf8965c..b937d11dd6f6 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1999,13 +1999,13 @@ LEGO_DEVICE_ATTR_RW(imu_bypass_right, "imu_bypass_enabled", RIGHT_CONTROLLER,
 		    index, feature_status);
 static DEVICE_ATTR_RO_NAMED(imu_bypass_right_index, "imu_bypass_enabled_index");
 
-static struct go_cfg_attr imu_enabled_right = { FEATURE_IMU_BYPASS };
+static struct go_cfg_attr imu_enabled_right = { FEATURE_IMU_ENABLE };
 LEGO_DEVICE_ATTR_RW(imu_enabled_right, "imu_enabled", RIGHT_CONTROLLER, index,
 		    feature_status);
 static DEVICE_ATTR_RO_NAMED(imu_enabled_right_index, "imu_enabled_index");
 
 static struct go_cfg_attr reset_right = { FEATURE_RESET_GAMEPAD };
-LEGO_DEVICE_ATTR_WO(reset_right, "reset", LEFT_CONTROLLER, feature_status);
+LEGO_DEVICE_ATTR_WO(reset_right, "reset", RIGHT_CONTROLLER, feature_status);
 
 static struct go_cfg_attr rumble_mode_right = { RUMBLE_MODE };
 LEGO_DEVICE_ATTR_RW(rumble_mode_right, "rumble_mode", RIGHT_CONTROLLER, index,
-- 
2.55.0

