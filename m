Received: from mail-pz2-f20.google.com (mail-pz2-f20.google.com [74.125.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1745476075
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461936; cv=none; b=F6jewivtu8WTYCIpFBj5MNutBF7I2djkT4HF+Rd15GTb7uYQLr9eKAthRpjjWdvmOu5J6rVMKBSBkxZ0XrticQvRaQDOpYU1F5sk1anBW3j0yb28/ZL0fcSH1tOTaFd36XeisKpPtioQ26+zWFTpWNcfajwQdiB25W5CuYy1lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461936; c=relaxed/simple;
	bh=H+Casj91rLGYipq8ytk6EsEcu/qT6R4LQyFeNF6gEZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjxrQ2iwLHYCDwAz0DB+QZOIKwSDTjxOiPtAmzPy9Y5ZGfEXL5S/eREstvpxfWfthOKWKO5ALIn9AY/23L6sJVGsu08iKKPruzFyI0Jpda+c6dqC0a0OFRyAfHZAyzjyPko4wvQaSvgHDGn5gbxBJns3c+qHswhM5kJmwOSZVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuFg45Vx; arc=none smtp.client-ip=74.125.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuFg45Vx"
Received: by mail-pz2-f20.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso2138536a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461934; x=1790066734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi2cJ4ErFNrHvLJxpqfCchEU0jyj0U2j6YYuxAsvr9o=;
        b=fuFg45VxWcuM9Yn9Ar4ZbLZnCcEJB7J26IoFhLX1uqzo6syLxxKzuk1Z460MygKB1d
         QjDq9ZJgy3DXbuxQvmyuz30YchcsA8CSa3po+jLW4J5GxwuurBdx6ug0kn1wUMGeThC6
         imcO8GjntsF+hkeY8JU+n1+YtZotCMnSDEf8ycaKfT9AVW1nJn2yXpQ0UqMErp201OIp
         vqxv34alDj+UKo9TK4xeEm2N0g4LlWCgjluf5TQFGikVwByiLqumkc7T0zykKBvoXbVk
         a9S1N9fiU8pvUM0CrkmJKGTBXwVH7KbQdzJauqlxcoYQmR7TANsYo9o1w+blNMyQ+Cx9
         Kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461934; x=1790066734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gi2cJ4ErFNrHvLJxpqfCchEU0jyj0U2j6YYuxAsvr9o=;
        b=My472rahfFuQ9NAYps2Iv+vMJnwcxtt7RBJO5fAc14Qm/40q9yCB2/j99EK7la/6Dj
         ZSHLN+ewO2BFVERixyUM/byb9zJt/X1UsH4xpFLGPVzbZjsmBjN8BcIOZRILe2aoDBAN
         y5DAGJT7HkPtqCRKmDoXe6eKx4L2khbDNg7tHFA4CENTiT+DCxjIhTA3p2XMtBC0OB+E
         45yb7Qp/fwyJ5FSBvwpqZkanvrcymArwdZxiO29aJ2C6pINPTdPav7cBpsomdo9JWW5G
         gfsmbr6MRYNWL1rnbo+gl+mq17oD07aihhMSZr2eYH+z6SMqi6bKsJiqx0l3x9GUUv6U
         CASQ==
X-Forwarded-Encrypted: i=1; AKwUvBw306unGTHiNH3VzIuv/9ZD4QQ8Z2tWqohzLVfy22br4+ZtJlfbHaMD/Y/yj8Qm4D25EqZQXQjJidUhsr4=@vger.kernel.org
X-Gm-Message-State: AFuF++m/JTF5MgvuBTZI+OERQlIyCQpzxWoGWXtVvDi8+FFFqbHNgDKs
	q6ZRyqhXzlKXSbi/xbQJFdIlLcs6qUATgIVCl0xjgPbZvOBCyJrmukXz
X-Gm-Gg: AYBFou33+HQ+V204oom4n2lopmuJ/Ha6BSZ49w7foV7OWTUiIm/oIcVMy9UsRDYl8b6
	YCVKTMAe6kcZinjvN6uQjo60yj85yvvImZ5jkxmo8J3B/GkHhqbD6YcKIYIJBUMrSFKEu+/+LMF
	I6EUfJHEcCufMXE3lfYjiPAmsOWs24WhiCwFUg11E0KhxXHyrXD5vV10UIpWWnDFXbmknYXTJ9A
	W3ylsD/W4DRk1CvhKYbGS2P5x43JAgdx7aQQVxdoYyz2E57M6J2qbUHPKjiV08QzNps5VfYnthx
	u2eyWFtwrTFZx8eYi5AYmTu2QHVnHt30FFqG2oE98lqsWRJGUCS20OSR0kFHzGYBwpPc+z1J7hf
	Qt8UMKnbq7Tn1tAo3e52ZONP6GNsv7+J7ZNadP4C1rNjH7fKindpDoaFgsyLYBsPMF417ZWmuMb
	Ke0bxQLWpt4K9o1yt9ohxemXRPkdjFnOYbw7BIZOc0beOMvi1IStR+a9D7qqdcTzpH4ECHRTy5z
	00jloYzSXUQ5MmsUI19QhnRSg8=
X-Received: by 2002:a05:6a20:d090:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3db4044614cmr14695371637.5.1789461934096;
        Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 23/23] ALSA: vx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:24 +0530
Message-ID: <20260915084424.1007757-24-hemanth.selam@gmail.com>
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
 sound/pci/vx222/vx222_ops.c | 2 +-
 sound/pcmcia/vx/vxp_ops.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index b6459dbdb1b0..40f3716c478f 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -431,7 +431,7 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 4211e7239138..e52b61125629 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -265,7 +265,7 @@ static int vxp_load_dsp(struct vx_core *vx, int index, const struct firmware *fw
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
-- 
2.48.1

