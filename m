Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C73DA5DE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872667; cv=none; b=e6GbllSM1ZxY1APAwCJU/uufkouE5oHmSERTDdpnJSOORLnJqirhwxPq2HTHx9o5LwaMS7TIochRw6JCv0OUSLIWqIsecohqM3m4n2jcy3vV4AsMpRmToGD9wWJdZgs1htfVeaqZQ41vHxBFrM4ur1NMHzq1BaS+SsXQb0SKVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872667; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfLd5IR9U+Mxac2DClX5/ptl8tz9A0cMDsmVQ+U2Z5qPc/1MXS71BWUxFBdKwjFN0kMrjmLAXXhYkS2nfOzvOlVk6GhDevbpgzwCQiVpD6XAnK9yMPZFPCUhKjSTOmxOcL43lw9yAU7V49fRZAhcdSXvm6S89G3l/RtiSyHWVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lon14yDa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lon14yDa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2536455e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872664; x=1788477464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=Lon14yDaBsFEHIMDCUjU5zXeX90ewoo9WYVPHl91NBcwYeAGxBu8GEllrBi5rFRqaf
         k3G+s1XRp8CP6ffSFyfPo7fq6owzY3l07Al7alV52/Orv6ibLTYYNSYKp1oO6629mrJi
         innaQYHcETnj1+2cjsdlq0sTkEKjvXp5bjjtcoPucdy+JJKG7N86Z5ub3+OWCsNT4YRv
         T/PKfErzWsMj8vi8FJ/I8pnGmRln3LVfETwPUMJfI20h5T+bPPkQqb15rfbNF/oITTBN
         0tHexGyeMDR3bvvaO8Lzr9fkQx21ntPTO71M6ZxKOHD8seT5kq475Kd2ZYRWe1NWpPLf
         InXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872664; x=1788477464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=hjtbacHspxDzjwO9mtqILsw/+gDHj430L8t6edUm5Amh0gTg9VLSUIkhlvhHdpGWta
         Q5saFSZsYjzsyxu1+zdI7++NMkz+SmBOXtmWAtk9nUljVP0zS5AdpLiLLXlZcg6EB5iW
         RCL8cW9ReOfuxTIqsFTwpf9SENzysB0wv1gaLZjuIgSLENfvWWAqT9yfpfzaKrwBO3WY
         Fa8eHL9IzCnHqRk1bHjih0Mcq8KVLs7in+hS5fkrHID/d2iHVvZnhdvhHyPxegH6YL+i
         lHxRGUMl11tX7K0sASEfGhU69slqP++wdLevuG/rZtHqJqkAmY3sgOomrCy4lhKqsjIy
         N6hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaxJjxnQxeeBvlCCVWW1IxErnQRzHBjPYyZ3KcunBgwairaK1LnWoID6GDk0RCbnkYqE1slnc9iyHDJ3I=@vger.kernel.org
X-Gm-Message-State: AFuF++mHyeBXYsF7DWFBFJcgvFz9LkllfVr3VsleVOZXo5LNLjnwZv3F
	/o7DbvTBoLASAitWdO/LzqB178UczB8uZAfeuvcB/800Bx7EEn7fB/9T
X-Gm-Gg: AR+sD111SIcUyWYk3geDEy7N/BlxKBHbUhjEkigw7vY6t7sE0WOM9N1oPxzHtk65bU5
	9wI6hkkzN1jrhS3IeHzAcWdOckKaQ25WQ05b4UOGH++yxY0M+L4kf9GLRoln2LxweL2zLJDn/nZ
	kXaDMUrGvXPp7H+3+qDfra3+oAAD5tHw7QgVbgMnr8bqDaUt64Bpn7yxBlivxdcI0wggPsXY5/i
	PRtPzHkN/Cv/cQEDCMYm8Mu4bAT4FB+ZTCmrGo/rNeP+j0LkOiLyQ+1jtH9UkScFm5lHIXb4tLJ
	cO1yPUmh0b+iOq2IuWYruihSd+FViodNPq38ZFsU3A6u9FlbKcZ6ydre0EkUHUUTlU+os4HlWKv
	6u9nmSrju0qohTzWm0oQUuryz4R1mwgM6rM3SLLFC/VIfefiwYw7p066NSLTPmDTgvcaPpqpVKu
	p5dAljQPpFs04GPaXSl1a341JQZONVxe2uiKmm/4M+csNm363AwOcxEBWLKyGqYUrMzqNYSpUtK
	2/fuh85JN6IUhX3+by7OIV7NcFO+8M8gNsnaRBblEeC
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr36205905e9.5.1787872663612;
        Thu, 27 Aug 2026 16:17:43 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 03/12] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 01:17:21 +0200
Message-ID: <b4d57f1498ad38e024d3c16038e4688aaf452db1.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

