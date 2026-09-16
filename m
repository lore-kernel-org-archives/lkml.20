Received: from mail-pj2-f24.google.com (mail-pj2-f24.google.com [74.125.227.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3F3D0C07
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580946; cv=none; b=ClKEsEITedVZ8HHzxYrZZ8rFAECWF0JxV/yXBMMTmoDvDLmsV2qwEIylEy8tm6s7Jy+PJA+qzuH7/zp/a9HpH7cnMKQ7/R4Bj0gcf9XlJbohMWUhk4el3VvNSNzUo37S1zfZX5td9i6633XfTzB1gPxvhDVDSWgJGKqskEqvv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580946; c=relaxed/simple;
	bh=yFEBDTHLm27tGKV5vt9Tu/3K8m3JL0Xv1esWzL+iZlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mspTbOOfTY44OKwVUHPTom3V7DPl1CWdE5etJyHiI/di9n36rFhwq8dWlQ6fzegLVMgO3isFbx+F02hbd6rd9Ibg1fbofr0HWK9jxlQ7E/B1BCEDO8Mjh1Z0IRNFCRRG/WSjvlh7a/IC/YxsWJS/KHSTmPUtdvJC35WZ4V51qaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEWvwuDD; arc=none smtp.client-ip=74.125.227.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEWvwuDD"
Received: by mail-pj2-f24.google.com with SMTP id d9443c01a7336-2dd77300816so3487185ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580931; x=1790185731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tX/P6iDiknOSkE6HIRfZmXdsK+EZB3PqI+j0tRbaNG0=;
        b=QEWvwuDDWBUjSl9ErHnpI1YiB9iPXM/4zs2QdbNmyxR5VQnfkuZlqoIJ6SBOYjL0BZ
         O5xLIy89CDA178TUyz4xrdm7s3Iqbv7VvIavfMMehIse1nsrjVDqSvEpK0X9fCWOy99U
         X5WZgH33QQx0liqpkMkJL7OZeNB3wWVYinsX3R8e64yoSG9+k4mau/4x0mNvuga5frck
         6gEzAgjdYBligc+xhy7UJ9JA2VwTkL6UL6OkEQfYSvlrA3tk8eY7lWjypKIWdUrSLXht
         jYWIJ2QPQC+HWp2bHb8NYsCXePFr5WTBMucD2jMo5dlADCcft8nKlrI1zg7dRHpChFIs
         mlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580931; x=1790185731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tX/P6iDiknOSkE6HIRfZmXdsK+EZB3PqI+j0tRbaNG0=;
        b=uyrzdFzK1942sKD6DM9RTpQWXJS55qDmKPiAZKTuVCF//HGWdpgMnYec00MuSyDpdY
         TSlA8DQXB5oqe7f5Q47iKJZFZZWiqR6dGdAq+9foSfzxO2D23OXJrR6fFjj4g0FsHMqi
         zjPlrjY2aKTxXWIh9bi3MLhCbRA6fxoCGltxk7Wv+9ufJVFSua7aBS5WjpbY33j2tQOA
         XzcUjMthzbjmMCwDv5T0K2XKIxgSQCy6wIfJy2jwFZAs5SMW7A2XSqaXbTc0AfM5JfG6
         4BOsW+sMt3JTE1oUn8i+V4no9Lq6U1Kh8j1L+QfkVAezrSPcKWgqX0SYgkEGUQf6zG2D
         ykDg==
X-Forwarded-Encrypted: i=1; AKwUvBxTOm8zbmfXLv6bSe640b89jYhXrdHd736ZPjb0D8kJUhNAzxWW43A0Y9mtlaEJMWJFYKU41ziQ/p8m1GA=@vger.kernel.org
X-Gm-Message-State: AFuF++mWEaxtC7+B6E4Dh30wAGRR6yiuY5XBG1CVEz641y5+haUStNK5
	eLzbkc/5g1daKJPwFDoYT86edS5PsWncaWY3dyLiekYDiHIoMRmx+fjF
X-Gm-Gg: AYBFou1gaCLKHmgIXFrhA+NZlyzEXb7ksmmttslBeCqv69Uvh4eYC6CnUFAIfTNNNM4
	JQIxKvTiG4jvkBagXxEHj1g+7n+ed1WRUjfie1vt9FgBssOJVnsI/WOTjs6QOADKQrkKhDrtf/B
	I4GDdlBdbdunygUQogWdS1UDEGjk3h8YCrbd6/vXWOh8LYCSgSRXxDthxtXRnzo8ovqIblMiGV1
	i46f2LNJiLBqGAeV33H4A6YCyAa00gWb0Rq1QwZubeOVarwZNliGu4sUqW/RhWS1I8ae1R7Z2I3
	qvyN+3HoSmZFHAD+fcWXP8m+F6cOyJrFvajrGJz8DM/zHK0/dT9RBut4VvLqcH3mLun5xDL/AvC
	gXOBSqNlH2xMhI6kH5zj4uPfaDuqOzHfQT3/SaAjU6Cwh74n5vMuYUfPdw4kQxOeHiWFqDtw7gO
	N+lDm99KTlEu3NksI1CEgUmAY6L2Yhy7o4iZM7AQG+wdbORl3CbDviB9LcWkaTTWE9IiJUenWZH
	IkD
X-Received: by 2002:a17:903:b90:b0:2da:fa62:4aee with SMTP id d9443c01a7336-2dd9c7b71ffmr7717775ad.1.1789580930906;
        Wed, 16 Sep 2026 10:48:50 -0700 (PDT)
Received: from arch ([2401:4900:ccd2:8875:9d19:1309:9e6d:8926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edef89sm15919995ad.49.2026.09.16.10.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:48:50 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daasaradhi Mannava <daasaradhimannava@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI GL65 Leopard 9SCXK EC firmware
Date: Wed, 16 Sep 2026 17:48:30 +0000
Message-ID: <20260916174830.11620-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the firmware string '16U8EMS2.100' to the ALLOWED_FW_1 array.
This enables Embedded Controller support, including battery charge
thresholds, for the MSI GL65 Leopard 9SCXK (MS-16U8) laptop.

The EC memory layout of this firmware matches the existing config:
the CPU and GPU temperatures at 0x68 and 0x80 agree with coretemp and
the NVIDIA driver, the fan mode at 0xf4 reads 0x0d (auto), and the
charge control register is at 0xef.

Tested on MSI GL65 Leopard 9SCXK with EC firmware 16U8EMS2.100 and
BIOS E16U8IMS.504: with AC connected and the battery at 18%, writing 10
to charge_control_end_threshold stops charging ("Not charging", 0 A),
and writing 100 resumes it.

Assisted-by: LLM
Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..7c84ddd7e 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -122,6 +122,7 @@ static const char * const ALLOWED_FW_1[] __initconst = {
 	"17F2EMS1.104",
 	"17F2EMS1.106",
 	"17F2EMS1.107",
+	"16U8EMS2.100", // MSI GL65 Leopard 9SCXK
 	NULL
 };
 
-- 
2.55.0

