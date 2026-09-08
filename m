Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADA524B1F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859157; cv=none; b=QMeZW7fCC8AjcaWM2iGkSWXp1ewJL7IGOjnhAwHPqsdckZVJ+O3ancsKGbjIC78vvWCrc/n1xalbW5Htospnn5uimbOjESLrsGyaYdRoMHcr0RvKbS31yZXjtG/um+bttarxqbr4o7x1cJtu1KGywIvEYYBQDT9hnxxJdn3e8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859157; c=relaxed/simple;
	bh=wzHJ5AZLh1S4sbm7NQXwPNEFKn8BKSSciphvCkw+aLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/nenhHdkk+fHWEnNRi+p0+a6YTIo2BBdLFu/z72JmOuMGIVI0GuZ07kYJljQoFaSOlJ5v9zuP5WOV8uPOmB1zvnqqu5Unxu57YJEvD2ZPgZVqoxzOK6L/+IPPRa3Bv7couV5RQyDo9cMFcQtoUw3e6wjaeNhV2Km1IAU8JaOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=qmOcj4U0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="qmOcj4U0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3506463a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788859156; x=1789463956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSKG1D/i01HPr9XPX9unVriFqaH3a/5SqIW/cS7CsCY=;
        b=qmOcj4U0E6t5KqQ54AVBQUIKw1Xol4uBK0s/EXumSP5B9ETmZgbj4x6bLZhSvTqjcF
         2xLbplzVLO+HD0jG2Qpgc2wnaKlZEbRiKIZS8b42sddQVfAVIAxuX944S9kDbNBvfE3w
         yAm9X92+g6bexLWuglytjxE6Sk1Loal7RlpJYAbRIYbsP9f1IxGQZHz6pqPlIhtPZ28t
         KUlzQ7gjwZF6zqokfSL+Yd5aDOK2dLurK3eFWA81FFd8T3eGrtcsi8TyemCeDsQqTAb4
         UChozgxP0jvVypUYzmUMSgFfKT85gXk+dhiC+j1TxzxLFUi0JY4zzvjD0eRbaRHFm1tR
         ywJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859156; x=1789463956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSKG1D/i01HPr9XPX9unVriFqaH3a/5SqIW/cS7CsCY=;
        b=FN5Nv70Otd+DY7tY+X4jNrlLx/0Q3Vq1uaJeIeTRTinx4zNq4/GnV1Wrtj59m1a0MN
         fj02yl7CC+CLMGxDvOIyuc1dXi2r7lsItEgM6sm0MO6JlUkxNnwTgJA0zLFDha0JR3/y
         UbWaKYjZAaWOIVOrHPlhxBOnH2ZbiXxaIDLWQ7qEgWNMZo7Y9Tlvkc7d03/8JmPmu0hK
         rh55aXjoviJmmN5fPgwQ8kIPSbuDvaMI/bMhQWYXoD1GN9d3JyrbIatRYwph8GFJEX36
         pbdVq5JVzr5UZ8pPOjpTIAXEdNSpdvG6ofxfNJ/HxISzz9v6VBYvRUQ8BC+RwVWyGscw
         9VAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPSTLDlIcyEv5OjEX4G/isDbG/JIOXJ2X0E8H26LMvlgTFNjweZfnu6HqbicYlS57mvu369ivDblrQVFY=@vger.kernel.org
X-Gm-Message-State: AFuF++nYBDoDv4P6lZYzVsoUgjC/xPRuP9ro3PWEGCjr7tF5R4y6b45G
	tsxG8qsyvT4UDfZ54ywrmjsfmDt8k+cyrCQoD5geIjbRm11axqe3lLcHMmHZp/6Ltb8=
X-Gm-Gg: AYBFou1wm7RVK2QAuOYVpcxQZpSvfPyHh2gBX636bwFpQKeWKLT1KmFlxqlVyVWAykp
	4mmWgwWTwfBBGQ1WxZV7SiH9v+qKuWXHxniBix9IpK8YKA/cUCojqBbIwxbpkR77fkFagUVuQK1
	u7JKurxDsNCh7nsdV3qZtexw2NFFH9aOeZjjciV/SLh1vCQ7wUGEI1ws6IYecvGsLbCUjVgI1yd
	opp0x7vm6Upg3xnTITcBBp4sID3GqFvmLVfTMfMEJVR+dFel+DY6mrStu8OnnNVoowRc1CLwJ2B
	tARAU4M0EbKs5qvS6SJT+x8LHvtSH5425EV1C2Gvib7/s+kWs7F4R6wF0TT1lEX9S2qEf2xaaIY
	pQXypJ3JZXQCtv+jJ1tmKUKxkJeIkAznI3eHT17Zm5Gz0ufWD5qw3saxbsJzTcKQMLUShje2QpE
	dq1mXUM547BUcLtTr1wV//QRoU9FWFg+hN91K2FzrVJFKQZX4x2680RcYzjzrk0qb4RUvqevfhZ
	PVBMQ==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr42321906a91.0.1788859155665;
        Tue, 08 Sep 2026 02:19:15 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:75be:f01c:dde1:cb38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32015722c88.14.2026.09.08.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 08 Sep 2026 10:19:04 +0100
Subject: [PATCH 2/3] HID: i2c-hid: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-acpi-hid-v1-2-08df24c4b139@thegoodpenguin.co.uk>
References: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
In-Reply-To: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859148; l=1319;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wzHJ5AZLh1S4sbm7NQXwPNEFKn8BKSSciphvCkw+aLw=;
 b=uf+1mk4iLkcE9iwyWW0QFbX+TS2t6INT8BNRYRowZ2wjB0Qy+vICZc3tGfqptCelVoc1op7Qu
 +JpstvANQhjBdDUDg4O8bmwkOnBbsfZyd1GPeWVbke2xBQanHvE7EBK
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 13f977d6aab6..9371db200fc4 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -39,12 +39,12 @@ static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
 	 * The CHPN0001 ACPI device, which is used to describe the Chipone
 	 * ICN8505 controller, has a _CID of PNP0C50 but is not HID compatible.
 	 */
-	{ "CHPN0001" },
+	{ .id = "CHPN0001" },
 	/*
 	 * The IDEA5002 ACPI device causes high interrupt usage and spurious
 	 * wakeups from suspend.
 	 */
-	{ "IDEA5002" },
+	{ .id = "IDEA5002" },
 	{ }
 };
 
@@ -93,8 +93,8 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id i2c_hid_acpi_match[] = {
-	{ "ACPI0C50" },
-	{ "PNP0C50" },
+	{ .id = "ACPI0C50" },
+	{ .id = "PNP0C50" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_hid_acpi_match);

-- 
2.43.0

