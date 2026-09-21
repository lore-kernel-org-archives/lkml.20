Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A82BE02C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957137; cv=none; b=IQgDcxfUxRNdb9Z8Fm0//VX/j2L6yuIPzs4XNhVxLmFZqqbRPn0IhClWZgQqrHAHVcZonDxTqvAsRzHFDm2k+9knu/LmWUiy+pT8m5BbHlVHIgpHsEn5oS1u2LfYMwfNVlRRtdLNZ2UYqJQQn7jzrieFQf6t8ZiXFKp1DwZoW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957137; c=relaxed/simple;
	bh=ku65rsPht3NcHWbtasZ1Z5T+6hj8oFsmXcolUVc3gcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQ6k2MvvoXhfeUtdP/6MjSFh64iNMeugzK37iQ1fn0rIqhIxUyCwXEzt/cdhU5KZpVXJUKSbPgmUapTUf5bGwSB75qDVl/hS1MZLvjwTr5MUNrldFr5qwBeqeN1dJ1dLcTE9nh6n69cjt0KpnuEyjLjVwv4V8f8XP2o6H73z+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQepAVDo; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQepAVDo"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9107051ba26so17381756d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957134; x=1790561934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vzx8L98Gb7Fp0ZMYaE1k4F3qR4UqlmOOTj29Xnzad1I=;
        b=mQepAVDoRfnFMlJYovoN1xu2A0IT4DvscwEMSkz+QbaPI8jCUN88v7ZwGhUc3VovrF
         tlBZJDauW9rXfH324YHdJGtymt6DfORU21cDg1h5ZY9wKbDVMXieEppCpeibaoUzQkCP
         QTYhJDBc+0C+MNpRcbAR7R5GE+lV/YajVRMQIPzuZHYTKg0gZt9qiNu4y5XyBpUmGh0r
         BwgYulN7FP4A4gcZCZRx1jk1DjPnqOYZF1RVP8pFJTWHvncI09gx8PrLv6HFrSMe35FA
         qsxxEg4Rtv6G+zBcoPM6xrJ93jjQWNn+YuPxTss6sCcvc6KjfDSWDwqy8KsBxJZNbf+U
         JFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957134; x=1790561934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vzx8L98Gb7Fp0ZMYaE1k4F3qR4UqlmOOTj29Xnzad1I=;
        b=B8kuxEmWTaUHRmAvQuIvQurWdZCIazidloAmJottavES7OJEsXiPQM+wWsY52BBRY6
         Zv+y1sq6AW9sS3bOXg/yNBnz8s1zuOgW7DQNhOUWZD4Gzi8PdORgaIWhW9ioXTawKHC4
         RWUw/H1p+H8QZqVPR2iPoUWxjk/wNKMsMZgh+u7kKYU0hknoQfg67VK/D4tp3v+ZLfql
         SkdeuzQ4A7obADgWV6C0P/yxYioUxr3FrDDgV/R7xeuujLTJEN59LSpPGtr2lUooH5SR
         dRmSMRwCZp+aVuBQJdCYGl5+VB173d8gFPr5ow8HNWA+FIj5c22/WHAatsal2iHV+lPu
         AlSQ==
X-Forwarded-Encrypted: i=1; AKwUvByiHJepnbvjRW4aqfFL09puqbAyd9pd970jePXUpnfHqe89NlutOi+nqkltqIzkwjWWOjhDdoLStOpvORE=@vger.kernel.org
X-Gm-Message-State: AFuF++ldaNQmR2fEFGx0oKF0NwoQu3bdx7+gU3oX1N/jDs7jukINe1MQ
	M02kZPhUWhurhiPoaseWPZKAVQ9Ph682DFrQwvw4bE9SclMkAIWOGio=
X-Gm-Gg: AYBFou0iVPE8nNrl424OjPnMuwyNO4oWsRnpLnQAehkkXxzAi78Qks/JW86fybT/kIz
	O6MdHb6MknYqR0H8QywxEsLQPVLktfrryS0wFaBPUT1ohETHeNEpvsPuCdBuD5GxdIubO0Hd+7o
	WmH0krfN53TuG2OtRTP7eidZgtqwQD6om+Ys6XLQlxeptaAUZftiXhOO65GNOb7TaFk6ARkbB1s
	BhYssvGg7QYR6h67MY8T2s4F3tMM/Rbo5W5Kwf8KzvMRMFtp+ubfM6W4WxHnLiuHIPhSb9fhi5w
	pp5lccNv2hGjgaDv+9/foQOwoSZoO/0zSg7oxv2teXsT2pZEngPTe3/t8Ked373nSkhgQCHI2nA
	ZrZbNyjIM8paHlEsiCb+ubi/uyKdO5mUr+xLkb6hT/1qK+Fp+Ng2d0MkDtuYU59dLUgky52T+Lr
	PTNJjx6dUEz5SEAgNfet9mg09UfrJeV730Zru/0/LX79tBxeOox3/GucbEkV0hKEUI7DqQbydAJ
	+4ZG7IkzbvVGh8GfXXzdyIv9LpNLVXEhUDtMCoSaVb0X6iI3E7aYZr7VjseflT5pg/xjasnkIde
	leMbFDcONxP/AG9/EX5bLJP0eV2fEGONEuqmD0I=
X-Received: by 2002:a05:6214:5882:b0:912:517b:7be4 with SMTP id 6a1803df08f44-912a803845amr92378216d6.47.1789957134416;
        Sun, 20 Sep 2026 19:18:54 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm56221876d6.41.2026.09.20.19.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:18:53 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: asus-wmi: Remove unused platform_profile_support member
Date: Sun, 20 Sep 2026 22:17:19 -0400
Message-ID: <20260921021720.5976-3-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support member of struct asus_wmi is assigned
during platform profile setup but is never read anywhere in the driver.
Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 711f59c1aa6..3e630312139 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -320,7 +320,6 @@ struct asus_wmi {
 	struct fan_curve_data custom_fan_curves[3];
 
 	struct device *ppdev;
-	bool platform_profile_support;
 
 	// The RSOC controls the maximum charging percentage.
 	bool battery_rsoc_available;
@@ -4332,7 +4331,6 @@ static int platform_profile_setup(struct asus_wmi *asus)
 		return PTR_ERR(asus->ppdev);
 	}
 
-	asus->platform_profile_support = true;
 	return 0;
 }
 
-- 
2.47.3

