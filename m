Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A4E4A3867
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461905; cv=none; b=LBDh8OUYS8jI4GGZele4XuE4f/7l9DVq9G5G/bmj6eGlJsiy2T9UOYuLZNSp5pKSr0J+DHiGeG1+/pT/+qhAZiBkfr3LLZ72V/3TTnX9eTsQkKi40b/AHItWGZUlzVYkc2zlaN1//QpD+q+2BQcP35YyEQHtQadwwqAPc0nqHOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461905; c=relaxed/simple;
	bh=pHulsae2A1FoJKTNELVUWZMuiXc5Ybs7Ufw1lrQ9joY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewBPSa4I7q0aS0SsRyqAdSNYcdvWNlJ2EuUKHhmMxJwwUE+JN1XfMiF/9/GSHBSBZ3QexUJGDAzz1hniVngkz1E6k1SFxr5GLp6dEi5IYeSlhQ/eVxT6NkjQ1RHzBVua5sJVJKHtQPcHDiZl0GNAAf15QEYU95KkB+3NJK2Qqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IETcJdxu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IETcJdxu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so15211a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461904; x=1790066704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4z1tVkLKQ0TsrkmOyzBSx9X1Dw+Zr6ZbUQ5wODCWnk=;
        b=IETcJdxuK/N2DrZVAL7C3K4uQWja6YVVHht/k8UkABr+iS9N5dcvuhLLP/jYL1bEII
         G+qskPU8LtlRpJu9FXrQc81pwXipv8v+X9Zc9zBZZhGG5xu9iQP1Z7ICS/c7JQq1fyP7
         cebEJppNfue4P18h7gr9CmLfI97fWqEqPIjtxSyF/BaN4WI53jIki3a2bVrE/fWfFC0C
         WqOa6h1zoxI2WelY2K3g0faBO1tx12X1JopbQSJmGtxESpvtMI8r8agOvvVALjryOBDK
         UUdjLF5kCTRjC3eOQYQz7XbBcW3P9KZaCz9qPzJJpgI+cEb2oUQTtNQfJ3OEHoDgrbJ7
         dbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461904; x=1790066704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4z1tVkLKQ0TsrkmOyzBSx9X1Dw+Zr6ZbUQ5wODCWnk=;
        b=Wmx54j46tbvGNjHMRay1Bgoch6QXOA00LTKpytMjzuOsMonCjDnlvmv/F8sSOD4/cY
         1kNA6/ztvapXplkDTs/0zURZv7OVBnaEnNDi2YV3L6Y7r1RYt+y3/J5ZvHksOfLesjUc
         TkeDtNqe08bFNZ1C4VijEgczkUVxAwsFrHVUwA2qfJuEt5506w3P8EOArqYzXbaPBBey
         HwzDFNl5CAsicpTIs6GHJigP0a4Ek+VE1AHsyQMQHdW0QzJr3r1+CQ87lSFdA/siKa7U
         0lYAYSZgWYh0y5RY1w2GsSAlCSNzjpjkLC6PSqWutAShD9teeL8dpm39JLxf0AGqEa1A
         TpEA==
X-Forwarded-Encrypted: i=1; AKwUvBxjrXCGJW7AUjvLZdMblaaPzrGtoVXiGZgX56GExXGJAqyH6Ss5UV2uhzXVHwZ02lcFuV6F16g8+mAEdKg=@vger.kernel.org
X-Gm-Message-State: AFuF++nfO5Edftvu2jaRqwYqisChrPQiNTlNVAQLuR51ouR+sbUAserM
	crIo9GDCNt82SfwzSnH9alDfMleOvccqpFUxayf3LCtbUZmd6n70MPc24VcAQYvd
X-Gm-Gg: AYBFou1Ap8yww46xiDaJuqJVyND8gEdN3KKs7WnmBCZRLY2bB7TuZY2mSfdNJXqavhA
	Xk1yf/XzMGZs0gkgsvDL92OBbYMLe9tA+0yGiVHS1VK9UDq0pwb8CfGzlYn/GlE1y4+AfwUI3qk
	P8P26rAnE6UmBhxXvIE65s1ot2Jz+E9ZHG8JOF+NArn7yTzlwPbpEWwuYUUV5DzkpwQPKJ1P984
	v7vobTXq4qWOK9wpSLNBapxLY84/fsxR5hdSkzD4lNi7BbLnCp0hwXFPKwD9eyPZN4wW6HU+ztB
	OKnlkHnjpac6iejmZj5XiQ6MBUqzjiTkU4o3j6yAzeeG5CPZbSjhVdA+EsneTXin1XC4PuBLGNl
	TZ6Jdi6EpJJvHYxGqwKlkGXGgFEJyhT+FuiLOZQE6nCPlLEgWAHK8g2KR11HEcrMxNiNWgPRcoH
	vYq8IGoswJOP9NtYIetqnLT0kx0sV+mSZ/mRuljYLCXAuUQqb5SBlRUr6+7chaXvmZngio5CB8t
	4a9hSjYtBGPVWuAAnY5z9LTuQ==
X-Received: by 2002:a05:6a20:a10a:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3dd5284c0c8mr454796637.16.1789461903331;
        Tue, 15 Sep 2026 01:45:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:02 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 12/23] ALSA: au88x0: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:13 +0530
Message-ID: <20260915084424.1007757-13-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/au88x0/au88x0.h        | 2 +-
 sound/pci/au88x0/au88x0_mpu401.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.h b/sound/pci/au88x0/au88x0.h
index 6cbb2bc4a048..f97a0303da3e 100644
--- a/sound/pci/au88x0/au88x0.h
+++ b/sound/pci/au88x0/au88x0.h
@@ -28,7 +28,7 @@
 
 /* Vortex MPU401 defines. */
 #define	MIDI_CLOCK_DIV		0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define	MPU401_RESET		0xff
 #define	MPU401_ENTER_UART	0x3f
 #define	MPU401_ACK		0xfe
diff --git a/sound/pci/au88x0/au88x0_mpu401.c b/sound/pci/au88x0/au88x0_mpu401.c
index 164f6b7039ab..dff4bf80ab96 100644
--- a/sound/pci/au88x0/au88x0_mpu401.c
+++ b/sound/pci/au88x0/au88x0_mpu401.c
@@ -22,7 +22,7 @@
 
 /* Vortex MPU401 defines. */
 #define MIDI_CLOCK_DIV      0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define MPU401_RESET		0xff
 #define MPU401_ENTER_UART	0x3f
 #define MPU401_ACK		    0xfe
-- 
2.48.1

