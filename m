Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B6394788
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536090; cv=none; b=Eggdd1bdHYD3GK8ynABs0B031Tzk0hYy7btmdkNDLW52CiJupLMD8XeOPzhLjZqsio5GmpUjClgv5nxGY5+CjlOiSrzNvvxhuxCV5nFmmqr4+C5BbgP+/iHreYezGKGyjvhKiZgUvjl3lZOba0w6ZiqCW4zFtae80pn/g6ba860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536090; c=relaxed/simple;
	bh=h2liHw+Cb3T5OCreOlX8AWj3tP3/1dELU2ASsfx2NuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJxKXDyfqJWVZ8YlTJqJRg3d15uA8dKmQXA1dhRGiJqidPZazVUfeKdPGqgQ6payZlFfLKF0Ng++CF2ezr30jMVqn2Jqi+cAaR7ByJuDs4CEpMI0eMlpoAFNVMPdgTWxbalhXTYX3fFA/sqIq3El2LwWNWsdWN6vFoZ8DuJyIDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3P73Cy0; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3P73Cy0"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso3663375eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536088; x=1791140888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=p3P73Cy0m/JAEVgMTPDvZ8gAy2t8YeP0+fMmxyFbB/6SvL2gYwvyvNfxRrWU2w6rEe
         /ScO/8ONQ+2k/8+wtc/sLvOq5FtcIK2SVGLJq1WJhjT09D7CphPhi/+V2LQ4WaELU/hj
         AQrK02teIAsEgiDDAUOtr3nS8h0US3f8VFumQ2PL5Lo3REUu4pw+FWt2KqcTA4awBdxi
         liNfHb81WgY/M6oxn/itDLt9tQBoEHZWO3qo1PEpnc5qHly7oTSWkQ8Bq2nr65af4vfK
         r+qm/yN1C7Am2IxIlD4itndRKt4EYbAUYIhnCIhSeIz3ljxewXvnMBPZCMyM880046mU
         pBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536088; x=1791140888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=Wqk+irYzwxqvHGSJ9CMIvEiwkcC0KfXWhAbd+AIHFkMBoQgJ9WyphGzNf4mBNCuH1H
         USkZddxmWYT7hlyr4tw6YiKxOqoat6ycM91L2DRoJxMiItyEfZwQb25Uir7pmO0XaOfb
         F6ap42LMbM/VIm4K463Sv91KtM9TBrJgWCGP1X4puI4vYiS8Hbj6krSZzZvqu0uPg/+U
         Gyd7s4BsZtlql9NTejF2ahKA0Enb4eL0inRRqXi/3SIm9gxdl/wREZDbF8AkkACNmHIz
         EGfgxwNq2EMdd4LmQOZx2xETqPAokBNvfUfSxpfM46bjlUm7hvYxD1MI8GqeyMLDEK0Y
         KnLw==
X-Forwarded-Encrypted: i=1; AKwUvByF7cND6302XbZHdZ6QQstN4ScXH/uXzU3Z0uc7bt9IREdzoePwgcSPzyONGRyFtKk1Fs879rvGowgUC8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8PLd0m8Bwi86h5kOXPzS+f4fOOrJ+5I4AIvYvPikTufviAHoD
	MzKU1/OXt8a47VPcdTud5AeHjJcPwdshGGC7WSrTe2maU51KjrrQpT5V
X-Gm-Gg: AYBFou1DB9+v+3EbHuZrAnSdnS1slVMaX0jUIes2fcRafyTzHNGV6MU2DIYiDsoWJ6a
	MFZztOA5s/hEcn1sABFkeIIA6g5p3HH7rHmClWu/sEIUWHALofrSyjU/VDNrXTT+6BWgpv8H2gU
	8ao44uNeJoWoTsWGYE0t/L9fbQLDbk2hHZ0wmSvDDlLaxgNRwWml5uYkIdkTimAQL0DFS9EXBz7
	Gx/Iyfwn6Rui2ClSDuj9Kczm9si6+WMR80i8VJmAov90FkU6h3w3N5ZPYhU6536VxLLk3UrxK9+
	Q4kaWUc82vtZZHx6QgFmXCVWi7C+ZkI+DEMzCAqJcx5g0rfnlXQ7SlUfX5LR1sIbfGBtAXH3Un6
	H2hY9by3Hj3986XW8O4kmLq8DcX9s84x3dYjiesdMQzReqMvpGpeTd07USzxCNoZtQTX7Zl0COp
	3GWUKSnZLm7NH81aszUy/kMKV9tLzN36stVgubKXiG8ViXGYyt0sr1h+O/XKDqjktaNDqZMIZvu
	jCMsteEhXKizv406Y3jB4e8bhDj
X-Received: by 2002:a05:7300:4f1c:b0:342:19b0:1c92 with SMTP id 5a478bee46e88-34273549d27mr7996388eec.35.1790536087021;
        Sun, 27 Sep 2026 12:08:07 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:5bb1:340f:98dd:fd61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343580930e2sm13639702eec.16.2026.09.27.12.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:08:03 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	peter.griffin@linaro.org,
	linusw@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	aleksandr.loktionov@intel.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
Date: Sun, 27 Sep 2026 12:07:58 -0700
Message-ID: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

samsung_banks_node_get() constructs each pin bank node name by copying
bank->name with strscpy() and appending the suffix with strlcat().

In preparation for removing the deprecated strlcat() API[1], format the
node name in a single snprintf() call, which preserves the existing
truncation check against sizeof(node_name).

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..0d639eec689c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
-		strscpy(node_name, bank->name, sizeof(node_name));
-		len = strlcat(node_name, suffix, sizeof(node_name));
+		len = snprintf(node_name, sizeof(node_name), "%s%s", bank->name, suffix);
 		if (len >= sizeof(node_name)) {
 			dev_err(dev, "Too long pin bank name '%s', ignoring\n",
 				bank->name);
-- 
2.43.0

