Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A11521200
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547996; cv=none; b=cmJJuzIHgt5pteYN8nwINFZno0SfY4sGPpxVMKZrkDxm4+u3DQJ9+oQKJViK5p/UWFhdze+URhpP5voW1N8/8QCBoJNKbAIpDXdoKTMGQwQ7C4l0GmAJ4N27Vom8m4wIbRN6Faj38aNDifxpNE4Db/T6JbfPI6qdIP4fwI82adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547996; c=relaxed/simple;
	bh=17rdg2ScjqmUoZ6yaWeSJKrB9uYV4e5mZ++WUCStIms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOeDwzpfOyE9SU2246HFYTNQOH/H+xhZCk6c1sm3isaEqGd9o3pnzHzdPCM1wALqtIgRCbIlSzvDY7Q4gUz+JiMcZOsLRR9hX9PRnKpVfpxviosy1OhraUnrgW396dpZkElQVK5umriRMMwI8eynl9jztWSmqfVFDhWtN6/6gIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4503FNX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4503FNX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so12746485e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788547992; x=1789152792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LnQaP9fPO2THdkTrCSNb+dwWcnrhsGIaZubrRTYDQ/0=;
        b=Z4503FNXkuPuzcJ9dclOhnJu9k9r0TLSOAn1wWgHuENAYpV23BekzBCnAc2Cdy7Zy/
         AtDRa2MetG8DxB1PPTORDCqD2M5TirvowFAVuxbJ8Yvs5mKfToLnzf2G6666c07zonsl
         blccJKJzUkw2SNKo3in22TcSzCoqXUkLddgPL8Xv6Xjuo8xp/R56gZPkR/zIG6/c7/on
         brH9Joi/0hZUN8bJXuqSaWxsQKpk7qqSETSEBxeJZCsIIXn8ZeoBTihEqx7rWWtC+1sF
         R8sRUklojEb2O+oHy/xj+/D+hesH+buFg9TR9NsTXMauYcUMw932wJRQW+aVuR/mb08P
         1oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547992; x=1789152792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnQaP9fPO2THdkTrCSNb+dwWcnrhsGIaZubrRTYDQ/0=;
        b=Q9S19wCwAcdp4OXkcB53NURpM34q3kA9ljTO8rpCi63eDzkERCFW1WCJaFwI3CdZhr
         iFprCcuw9y1zL9JiA45Vo7ZqcwTYK+tesulhDH0BQH26Nx77GXcq0VmjApmL65TxuXYS
         F2UAegJhg4/lHbUGZ4miYMgzQER5XlrZmr66Ck+O4GGAq58mKZw4myd66uo6cz2YbdIr
         PI8wUhaOqBFJ4XM6Jfup+/8HfcEjEvShdy38rF4ueMJoLJQR7QZksgMGXheEfHO0r7RT
         e1VcfbtzLhTOiSLbJ3X3mQQaW1h7LTCD5pLTkCtJKb4p0jDU6cFk4zoVYF9oCc2g9zUG
         iPdw==
X-Gm-Message-State: AFuF++n1plsnLU7RSJD29uVgVlyt3AY7FRTIi+XUEqyz/oCXKh4aNKN/
	dob3eHBD8oXpcmLtAzBnQOIMthHXlqGVFXKnSw2V+JBZy3lSqS3L3eI=
X-Gm-Gg: AYBFou3nLxDmU5iZquFOZ44qDictKq3MCmCzFmNwBnmH8ZLiTSY7yn+h1OxzM+nBFGU
	WeRTgu4OnYmF7dGng+YYMZ8OMbk4InZzTpevqHcuOY+XTfZEYk9GZ+JeuXALzA6OiNnmnUgeZyu
	Erg9UcqS/gYKHEukDRgyG2OIAIn4kDEulboFc18v1h0E+jxJgxMG+pL4HNDvSwRWWk2YrITHUaq
	DEQ6n8OTyNLjrGRT/JjqNkD8KQyfwnKdQ1jZCerGaDYkioZxs9Xtq4quX4dzR42Z6kgW1IBE2+8
	Do8fKj70lAv9OTc1EhYO7/jZbsb34zCj7A9zCoEgCajuffrpF1wEftzeBKwemR3iGgJZHSfl0cI
	ay0K8CiEzs5VGgVh5tzU8qqQICMah3TC4wxLMoylv1FEJbK7PR2vFgXnTIMmq7MLS8IXoy3Od1J
	RTjv6Nzon5byqIHUS8nHBySP1m4wGF4GPgLVdFTctm9ZWgQM8Qz+gYU6mqQK1fpH0tNrZzqSMl4
	Ne56qUh2hwUSdpyxiw7id6F44e8bPosuGP72MNe2tJZ9vG16FmeC2g/Uh+frY/FXwepg3es9mhd
	4yIp
X-Received: by 2002:a05:600c:540f:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49cf81fb1e3mr75634765e9.3.1788547992181;
        Fri, 04 Sep 2026 11:53:12 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm58607715e9.3.2026.09.04.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:53:10 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] wifi: ath9k: name the register multi-read limit
Date: Fri,  4 Sep 2026 21:52:50 +0300
Message-ID: <20260904185253.809209-3-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
References: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_multi_regread() converts the addresses and the results through
fixed 8-entry arrays and does not check the count it is given, so every
REG_READ_MULTI() caller has to stay at 8 or below, which nothing
states. Two callers ask for exactly 8: ar9271_hw_pa_cal() through
REG_READ_ARRAY() and ath9k_hw_usb_gen_fill_eeprom().

Define ATH9K_MULTI_READ_MAX next to REG_READ_MULTI() and size the
arrays with it. A larger count warns once and is reported as a failed
read, all ones, instead of writing past the arrays.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 9 +++++++--
 drivers/net/wireless/ath/ath9k/hw.h           | 7 +++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index f5844e9bdd2d..3d4c6f9f6e95 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -258,10 +258,15 @@ static void ath9k_multi_regread(void *hw_priv, u32 *addr,
 	struct ath_hw *ah = hw_priv;
 	struct ath_common *common = ath9k_hw_common(ah);
 	struct ath9k_htc_priv *priv = common->priv;
-	__be32 tmpaddr[8];
-	__be32 tmpval[8];
+	__be32 tmpaddr[ATH9K_MULTI_READ_MAX];
+	__be32 tmpval[ATH9K_MULTI_READ_MAX];
 	int i, ret;
 
+	if (WARN_ON_ONCE(count > ATH9K_MULTI_READ_MAX)) {
+		memset(val, 0xff, sizeof(*val) * count);
+		return;
+	}
+
 	for (i = 0; i < count; i++) {
 		tmpaddr[i] = cpu_to_be32(addr[i]);
 	}
diff --git a/drivers/net/wireless/ath/ath9k/hw.h b/drivers/net/wireless/ath/ath9k/hw.h
index b942b8303d8f..211d42c92796 100644
--- a/drivers/net/wireless/ath/ath9k/hw.h
+++ b/drivers/net/wireless/ath/ath9k/hw.h
@@ -83,6 +83,13 @@
 #define REG_READ(_ah, _reg) \
 	(_ah)->reg_ops.read((_ah), (_reg))
 
+/*
+ * Maximum number of registers one REG_READ_MULTI() may ask for. The ath9k_htc
+ * implementation converts the addresses and the results through fixed arrays
+ * of this size; callers must split larger reads themselves.
+ */
+#define ATH9K_MULTI_READ_MAX	8
+
 #define REG_READ_MULTI(_ah, _addr, _val, _cnt)		\
 	(_ah)->reg_ops.multi_read((_ah), (_addr), (_val), (_cnt))
 
-- 
2.55.0

