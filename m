Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C478468C27
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461897; cv=none; b=VmNrhr4nIPnz6gENn6ayY6AOG/TcG1cutHnUrLw5vqySeUkuTIGd7ypclgoykoDV5OVQH7VK850TnJKX3nY7k/Yh72NMJtMmkBLwBQFD1gowDMCNtkV9wTEBBT11Y9zGTZrxbwPwN1vouZ/QZJ76xHF8AtFXhtUNW5BcNOivSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461897; c=relaxed/simple;
	bh=UxDDQ0RU9M9F+qqFv2blr6XIi/xZl/4Wriymu56W5pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DLf4pIb0nNrwqEwRSFe2i+Y6FtGwCuikvYH2glYD3dZxrMFTl+hK3Nd4kp4xQkH4U7Cfl0E2H59M81fQMvA9reagNgAuoQxVpy6deh9hUXJk0YN7ZOyoVs0mxQFYy+QIpm4wZ7aGqATII96hkdC2o9FfMdoQcazhHRbXoecwvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6hnhKGE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6hnhKGE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso2978546a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461892; x=1790066692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhviqnNprA5p+wjy+HIKedRMX/OnI8Tgvx6aRl+Jg0Q=;
        b=B6hnhKGEPtw21CossfjR1N6tPL1rTxCEDT6u1Ux4srZ/Ri2foZHXVmuUbqtjXfjsQI
         UQmcqIxUE8lPk0yOJO1TuWG/8ili+DcM9XtKUGbXQ0WWxP/6LV+mrOYbVgmCR5q2PU+p
         Y45AQgWAIsGoxX1ohqZxDs1zpBmDeQmo1nqi49rX1XPVvVWHtHk3qH+BBNwMt0l61emz
         mhce2k6+U2tS9RNxym8Px/d+HsykzYgQXLocCzHJFvH9NyKw4/aaDbyESuXf41D9DkiP
         NWt8uXi9FcDPty3UWiM9VBw8Qt03b86QsA5EN9G/PLkiyYDZJGgq2Hz4SMuzNoitHOSk
         DMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461892; x=1790066692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhviqnNprA5p+wjy+HIKedRMX/OnI8Tgvx6aRl+Jg0Q=;
        b=hT3yMUOQ67tjou68ZsOZrMpd6Zm0zphLH9plM1MpQEkUCdKL6IcFxBYHdB9Fi4wt2k
         apdhmUj9gyJTiTzf73ZmNUJbGiaUwNykOlmyjJRUzXUAjwLYqHI2sIjk+1357ZRU+LCa
         cvBnlnx7+hyNgbjmpFlUbBP7uIBSSfgKV9Fmu2I+sWIr/eaNTi1RyBE/SECRChZPs4DV
         ilO1VGW9VwzA4I6MGnEfUnEkXRalIRF3y4mv4ZveL1EssYSQv7bUR+pFBSKrdEwFrXZG
         TNnvjgKInSZTnmWdAbwqqDtCxycn7N94sRo9m9NvS5i5MbgtpLCQ6iEvKN/4DrAL53nA
         8EOw==
X-Forwarded-Encrypted: i=1; AKwUvByJIIT+lB0HvDwoLoJUhSA96B0KBHaCcIpxH4UNvraHuHRqXHV5EhSyl8sWe8pKaDHliAKIRRpZVVQMQgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nmky2NFwdMPdYbxEvFr0cAEuA0lXoXjWvYuHGfvxTWT0UmO+Uz
	iPIB0xTV7SPt3LssZJie1EzoWMofgxKiVwg4kEbC26a2tLYEwCywJM72
X-Gm-Gg: AYBFou34qfG685AUD7rDvuEcqE58BH6xsv2LUtXOeGDo1YFN5zkB9WW9cz/O1jzEcT3
	FD43xjnL+eC8fPqvb2ll/poU0NnOfUuL33aJpQ/WXQQjVPYoEoH1QqC8xH1W7V7tBDaii9Ai/ge
	bsWao/DkrWjf4UAGsYVM80SJDksSaQDEZnOEi1qUVleNba08qs+s5sd/IMOMcLaBS6jgI0uZGyx
	XAjJPmrGh7nkspO9mY3SYAR0WKTv2bloBmj1dr/0JaLmo7BQ1R6gax6mtgGhBcYlnz5NjKLxWl1
	th2sQgw5WDtxEONMsu3mB4Y9JJUu3tIEeUU2RpH963tmNCSIdqJhszBYrcVKK6R7y3vKH0DgpHl
	SamVnPhJFZQeHfLhZpFYc0VtME4He0Yam6L9JPP0Qt49BSYzLWyioH/KKBZuRnzUVaalgrKykUB
	JhhYb5HJsSH58tmmKQg0LbLbP5F282neKx2UuHapSLycLYQjJMEahxnByPZPycwbdRHCm9L6DgH
	CzWYWXkSq/32gNb+k7slobk7Hc=
X-Received: by 2002:a17:90a:d610:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39df06f80c8mr13098521a91.15.1789461892002;
        Tue, 15 Sep 2026 01:44:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 08/23] ALSA: opti9xx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:09 +0530
Message-ID: <20260915084424.1007757-9-hemanth.selam@gmail.com>
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
 sound/isa/opti9xx/opti92x-ad1848.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index abaa3ed3ab5c..8a6db40ff893 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -378,7 +378,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(21), 0x82, 0xff);
 		/* 
-		 * This bit sets OPTI931 to automaticaly select FM
+		 * This bit sets OPTI931 to automatically select FM
 		 * or digital input signal.
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(26), 0x01, 0x01);
-- 
2.48.1

