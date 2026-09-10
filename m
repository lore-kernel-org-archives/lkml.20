Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9D3B8948
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015526; cv=none; b=muZRD5gWfXf/ODJfhnTZ8my/gNiitE/if2cngFysX3r2hNC7Sv4wIF3+hkG0K0GXDJK8mVpGNUrWNyZ2VaBBn1FVqwiOslb/MRjGVgeY00iq0GoudwSYY6qtTze7v9QmCvLtJvZDHQfOHsmVD0Z4lws6T65lzigCPghW2vCW/9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015526; c=relaxed/simple;
	bh=/SGMNQzj/4EL3t7wbB85AeQ89qFG0uN3NaQ/roGeogU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYnHaKfcUkIFPVb0xbuXkkMRVnbydZfNY0jf7e+dG6e1dGgc2PABx0lxpQaTXReRXqYNz8aaIefTwqogOYwGpSJu+EsVJE8hjsvG39bAWE7largOPMWBebgCLyIhSYhfCt1XfCX/BZmjiC9p/fPGRwDhYJRR/5M7eNwg/TL66VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaX/Wg8I; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaX/Wg8I"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db710396ffso4729945ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015524; x=1789620324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6R3tUgx0jRGxvkYAalDKt/ASQNyF7HuoOOF7PFysXC8=;
        b=CaX/Wg8ImOMP4O0QCsek0JSR7pDfud23gACnZN8UCqMAqhr2mE1baIGoDyZTbc6sPD
         FKPsPYaDVNeI+um5J2sd5JaK5GrG49mcWPUEVyb6voPpyC97HVtL7tcnz5ZNGYG0uYzA
         v2D3MP1bbQZ0lyUvaZ3CDLiWd/ZQoN+9Mj3Dook9XxUKnXtu1nBnoS3UfIGUpGAMi8Uu
         h0VfZjeJ0Flb7zDp7qevEi/J+YmMYJKjijuIXj0EJZ391pMN06+TvSL7WekOssjM5sYN
         vY8oNyATFxAf/6nYt07CByqGPAvTJkdx4PilL64dFIOsMVx0BQta4fKWphXE0EANL3i3
         Cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015524; x=1789620324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6R3tUgx0jRGxvkYAalDKt/ASQNyF7HuoOOF7PFysXC8=;
        b=rKJEZzcDKYt6Z2pYw+YqpcSJTkgcLrGmIjpRBez5MlQXpMlAfYOiJaFXZ/HwO1ZZlW
         R3kmkJV0QMLkdXumHEmRpC4RIDc3d6BhV4HARdhj4W+GwUX3ZjGhYHSZiVU49ORB5dxi
         6hA8c9z3dl4wRbuX8Mr8RnaB2L9yUkbkE4MW0F6BoyQmUJdqM1eopMmBtIe9F3CGlJQ4
         +2TYKXHN3Z5fRz6D7ohXd302fAdrpgfzoRFYFpWZtQfW9jiZyLqVFBNF765TdBgn/aRN
         jEot8SCLZK3Jl7vRVYk3HFS944NE6E28Y14f1gxFB2aSQEG045p/w9kBmzUyRhw3KX8T
         /Txw==
X-Forwarded-Encrypted: i=1; AKwUvBwdWu3WnXvhbiqEROlfznq1zIeLZ38DuvarV78paLJQMe6xr1F3QKH3cD+OmPKZu6WY03VKFwuc5/TnsNE=@vger.kernel.org
X-Gm-Message-State: AFuF++mFCRjOwraMlr/klg3MB1A2H5YIydkQ4rs0mUYM7zBdIS1gAcXd
	mRKBCTVMR/nYgQ8qtFhfSV6kzB/LGHo+kmAS9iZR5rHWWjmSRVDmjqzq
X-Gm-Gg: AYBFou3DkX66ei2xq9DDIebcKVQy14RXYIq9ctsLCoI4ypx9SM6MNrfIwuyHh6bIpdj
	2owJuqX+qWxg7GzmGL5ZXP5UZmc4Ef3R0czV6UVS6Yd1U5fJNjMXFg2jzpMLaVJcXTq9m3GFJuR
	a3eUK/sZDp6UOwtrFM3SLhpRSDfnapYC2w1DzCwT6cfpDwOCUqkpRb4AeODVZimQohApYX7T6qO
	JKjfeCGvo1LlKi8nvdNDaMcLNvIcjyJIY2UWKxEPQf6rSSbKH/9CTpIQImdexTjr5m+q1Xfp/nQ
	zGpky4pKmmpGqRBKW/i7y1pnTcnIpIu+MHLEiHMWrOcDTc2T5owC/hgZBxgpjlbd/BsmXDGxUE/
	Ug3FXxQizq/5PL7jgr4RffNbvK2CTpYDbWymXFMrsYIoacjiVJI87qOdXdO7O0GClKtMWHpzADh
	2uouDvDjgcor0hYQKHqZT7w3URm266F1PJlt96i6Hcny/yNMtTPWQ/+2x7bWr94QRnCPRkxQb1R
	Os/ACz8lk9uJtBwycdWpE/1u2k=
X-Received: by 2002:a17:90b:3d81:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39d77d1752cmr3286225a91.30.1789015524494;
        Wed, 09 Sep 2026 21:45:24 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:24 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] platform/x86: samsung-laptop: Fix typo in sabi_configs comment
Date: Thu, 10 Sep 2026 10:14:42 +0530
Message-ID: <1ef5ab664c2b4e0080641271a278c1659a29a167.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "wihout" to "without".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 710f3d5bf84c..18631e96bb17 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -295,7 +295,7 @@ static const struct sabi_config sabi_configs[] = {
  *   d0, d1, d2, d3   - data fields
  *   call             - call SABI using command and data
  *
- * This allow to call arbitrary sabi commands wihout
+ * This allow to call arbitrary sabi commands without
  * modifying the driver at all.
  * For example, setting the keyboard backlight brightness to 5
  *
-- 
2.48.1

