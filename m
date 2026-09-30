Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A35218A8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793109; cv=none; b=gWyQFaCSlCqNijtCOk/B5N4V+84lddntFnmwQjTLSIbLVJvjLUzfV0k8KP3JsCLA3Tw+p85uXpH7e3gnWVfHAeJp/nKHIMcFJNNo5ZA7MTQ1ALR6LYMNGN+2l2fB0ZqlEwEUz56Azbnx/s/xcPvmfLkCy87So9Rz5XfEe3oRe+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793109; c=relaxed/simple;
	bh=vb82kHMjF7H/YB24C3WEANZjxyP2t2ChYpOBcIucziU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0T0m6zT1IfFnGkZBwEisSdEUCYjRD9As72DLqV5XO3IGawdzFI1il0+LBmoqRsLd0C+/Xl5Pf4Q1pgZhxsyrNp+b08JkQWazohL09M4p5f5ueoTJlFA6H+0V4Ci15IHJl33627TT/SwV47gPxJ+prdtjfJ8uaRRNcXZgsY67BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y77D/LRT; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y77D/LRT"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so4982725f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793106; x=1791397906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GhPsWLlSgMSNkt2f5+GEEY7rdFcZVTICkbFtx1WQ/w=;
        b=Y77D/LRTMTasnQv5DHVfBKif3mOkS/d4BgGTJ0frbx2mygRmuodrMiPAsUodJRnIYW
         agqDGC9MUefM2mJE0hvV9lc0Pk5p69naYsVhQInvDhnZzR6v1v1X9uZEBv5EA2wtOoOM
         xI3UH4goebRubWgp6iu+DHufBmzUK81AKMxud7pW60zNZDOctyOliaE4W2o4toIITLfZ
         sBka+pnPKgjnbm7EoD6gjr7zujW5h1YIuGIF0XSfGdnA24l1DboCL6ih/vhzAxuy0NJt
         vYp8epcu4x+SaEb1qOHupeDHB1mn2Jfhi0wzsbLOebckJJxCDYE8PZoZwdfPrFyOg+Em
         U2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793106; x=1791397906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GhPsWLlSgMSNkt2f5+GEEY7rdFcZVTICkbFtx1WQ/w=;
        b=Re2juFTBsFpqIOpA8NbEbc7zHiEk7bW0u4RlQthN4BdC06QPQU2RW/QJTCF+SPvLAL
         NZy6g1rB1S+SMFuGUfF5W0Az/Yu2VqJSk8UgVMvUayN+QdL6xsF45MDrcuePmKt3xa+6
         p1UNkG+n5gdXVCAPqSZ37r3uz5XJCuGVbg06MbV+UpnonYFmQJxcB2uYLavoZ6dbal8W
         VZ+k6uJeiZKEMT8kYnHo60BmlROKUvkRwVEzsB7gagxViLjCzjm9SNVihoj9vXezyL1w
         ph7lavlzo8q5jzsjSfWffOxkcD8dnoEudFrtIVYxWcmhDdGFwcCJpFz/2z9P2dSx9NFB
         v9iQ==
X-Forwarded-Encrypted: i=1; AKwUvByxGlwLOzdnGkhESNJOuL5blbTPnw26Qzt/ymIFCk5S/rJ2crKhh34sp5pxk8VCANcB+AHn+7FdwlCImig=@vger.kernel.org
X-Gm-Message-State: AFuF++nne7bN7S27vLIJNDTM+tngAu+cE8cbU2PPRF3YpulmdS5RP2oM
	kGxmfFrXoUPwdgtMn2CtT6GGC3apXXF+l/QzRneoMY7wJOsyj6ByXhzm
X-Gm-Gg: AYBFou01vMclRhcMtfHY4IlG3KvQ0arCArB859cGH3Q+6sqapt+KaqFl6HNrGYMPk3S
	nhw/75Oim6gJJN+EKoQrJ+AybYDik2DYADGI9XdaVTKP8QMzVWQppSfj9qR6FD/raxYF8Si6xdf
	Jejty+s18SFY3zz1m+0uTPJNa4HFo3BPl3scleizdx9M9JMJk5y9oHjsmWkUCKByqLk2eqDLWDk
	l/4e3f4x8BHC2LEIt4kM8IcrPf+cmUP+EjzbB71Uez0f60HJExSxoC1hIQmA+eBrOt3WyOjeM58
	7UfcHECXmMcMOL0hmJM2se2K4kTeJTKoeVW28gQBxoOfV0cxTPTZVDUTO+hyQt0gEgc9Z6mf+Bb
	mg+ZeiiQRheXyoxflbAaO0ETV6KPMDvdZwi7BJv5iGAcmV5f503cFSOHZrrkD9+15xjzlKQvAnO
	v0QvMzYC7D7gpVGHsdWsvTZRi0vO3U4ZCEqHoPd3wmMSSkA6lI/DJLKJhw9naT+Phr7Kt9cbEjh
	US9axISkjFXA0PzHKhReu3RjKNweMMHoIbUf8Rk08XEXrAviVPW
X-Received: by 2002:a05:600c:3b09:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-4a01b12bedbmr39716805e9.30.1790793106089;
        Wed, 30 Sep 2026 11:31:46 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
Date: Wed, 30 Sep 2026 23:30:18 +0500
Message-ID: <20260930183018.49629-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
References: <20260930183018.49629-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_password_input() returns the positive INVALID_BIOS_AUTH on
rejection. store_password_instance() skips the store on nonzero ret,
but its final "return ret < 0 ? ret : count" treats the positive value
as success, so userspace sees count instead of an error.

Return -E2BIG for an invalid password length.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
bytes to current_password returned 999 before this change.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 - Return -E2BIG instead of -ERANGE (Andy)

Changes in v2:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index a9e1786..3f4c45d 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -70,12 +70,13 @@ static int validate_password_input(int instance_id, const char *buf)
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-		return INVALID_BIOS_AUTH;
+		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
 	    password_data->max_password_length < length)
-		return INVALID_BIOS_AUTH;
-	return SUCCESS;
+		return -E2BIG;
+
+	return 0;
 }
 
 ATTRIBUTE_N_PROPERTY_SHOW(is_enabled, password);
-- 
2.43.0

