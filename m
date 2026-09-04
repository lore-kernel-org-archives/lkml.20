Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46347A88D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525193; cv=none; b=lTu4k6kSVg52kqhFg7WQZatfKNXO4xIj5rQpIKzBF48qr7/tkEqkw2mha2gpnA+hMaxGbKjRUmfu6RzcDPPZOvLtjcU3Nz3DfSLbIwN6phQkIV0zzvBFsMejRHKR6yTB10dV7iKqKU3nNWEROWm880bNtUHWgaYJPMm56rGJ6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525193; c=relaxed/simple;
	bh=/j9rVteROUlD/CBx3JYGlCg/IAH/8DfCzmVfvXK9zDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTOk7NBuxWAbMtpmxa9pQGULA3G5vzt2qLNQ5Psgt69pn0EO2Rem5GzsgC7x6n8SFerzad0tI0ezS8fR6Ym6IAsEiZG7slhiHBdDhu7Lnfik9izYqNERnSN97GEi546yG2YlgCZytSBXHLwP4Btxrw7jWUjf1GaNPpJ6m9B49l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZQ3WTYB; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZQ3WTYB"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1afdf98dfso603735eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525190; x=1789129990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbb3yAOMomXhnJskipNUY9uV6VlgHGEGNQn0Gb56VVY=;
        b=ZZQ3WTYBvxQqh3eX9BmFulYKBiVfAvz5Z5/Vn58iyNcSCfnUewXmXFadOpr/MFR+7y
         zecIncAYPA+LXPhQlUOB2Yq4Fvvqtzzgidl5HdlA3uOSYaATkrtMmjCnPsU9XsioPCNt
         mGQQc3uASERCbPdPN7yGxcqFAJJRDi3EODJo9I0OBRminH9UDCXYtv6qI4rkHPi8XVNy
         OiGmL3514jKbJmEPAoOJbF3ldVFMl4UmwIPwzwya8ERSHfiEH6DOlZhlI2KgkeRLw0c6
         bV2LxJpjk3m1mbjHStuR3lQG250IAQu+XrgLgO+2X/HlJKUAE9byLMHqFVEkE1wtWxSe
         /vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525190; x=1789129990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbb3yAOMomXhnJskipNUY9uV6VlgHGEGNQn0Gb56VVY=;
        b=iESTlyXrcLNCKdS1iAYoSriEfc4JEw6lmxasxW4WVR+3vFp/YjpN2hboClBaxKveku
         SYdy9pbJi77Xskuma2T8fXn0lSyReu9mGnwo4c8olAmO/XgxCeiwLMEYpm9L2oJNWQln
         zZfE1CPFTkWnifKFVRiyTSXKnUkKlTai614GcnV3MwLQ42foj2KLLKdV2HE/yZWkDJ6D
         F7rtf5CQTEXhPZr+c8rNz8aI3ahsCkNWniGFgE4FQAwa3wzrIjMoCBEC7m/79XpxyPSU
         RSiUgxvt3OR/MRtK+cERYlJHeYiMQjeNCJq80IS/Tp7Rln21y9PvMrVmKBpPmldKzZwO
         Cc7g==
X-Gm-Message-State: AFuF++kExcxR3Gn3KbP4m7Z/fe/+zNB6AHafHOyTzDsxJj4PVwU/b038
	883WnvEF9H++kDsaau2sdlCOQVKgeJIYgUU/DbLXlVYrdFR/zeNrseVxEE90/csxw8U=
X-Gm-Gg: AYBFou3vpinQl1NWnM3NzrPxFCBB5iiUyVXDHqO4gHERklHsKyKUNVTKnQJdbt/2RWl
	J1O0oFzeSMDXnJBsVNRwXFIPc5uwbLQxhswxOMdXDk7N+uUaY+MOL1kZ+up7eBgJOLDAf6bI/6S
	EOAbaT3rTyh5MBqPXrGTvqpOCjc8hgkt3EEtaKkI/vk1NBjAXEBtlBq/1O8pieJwBGKAkkvrIcA
	1dXoxOoZ/GtE9ZlfcOjr6mqIC6fKjxSph3yvzz66DjjqjT+HhHKdBcoyxcomc0Th1qBlPeX19tM
	3mc1k2ryk8nFheX5+qCnpu+oBlKNX32XjSgoxdy0mU2y17HtXIuHuLhVrkcEI9RNc2Bi58goaBN
	t8AuY8qUYzwKPf1fZvXuOGTFSbF36oasjRYuIRdYM1J9eSPoNctoYt3cN3mPyIMC4XqqdxI+NiR
	nPiNPJEDoAX9biuf82uNU//aCJTn0PUOHCmy9KBVybdbsrC9C2EbB86KBkX5NV11ElmJPNh6Ja9
	vUr830gaKqRA3al4kfQ6TXLbA==
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr4319735eaf.11.1788525190297;
        Fri, 04 Sep 2026 05:33:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: fix typo in log message
Date: Fri,  4 Sep 2026 18:02:57 +0530
Message-ID: <20260904123300.36778-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123300.36778-1-hemanth.selam@gmail.com>
References: <20260904123300.36778-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling in a message the user sees, reported by
scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 349eb944b4ac..8e6cd35fc80c 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -618,7 +618,7 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 
 		if (of_property_read_string(np, "function", &fn_name)) {
 			/* some groups may not have function, it's OK */
-			dev_dbg(dev, "Group %s: not function binded!\n",
+			dev_dbg(dev, "Group %s: not function bound!\n",
 				(char *)prop->value);
 			continue;
 		}
-- 
2.48.1

