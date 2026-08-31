Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D754A5C49
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188395; cv=none; b=CxFu0g1vn3hAtGU4tZ1dLtebZzM+lbO88PYS4MLtB62b4r4HP/I3Fj5DvTESz6hKFoU7m1KpFjQa0MdlzjU6VtG7GL1RHH/rSf7N4N1ZleQYvxDfi7hrwoXEt2FZUcNj95R6BoG9YLSv3Dp/YWWaXQ2uNl3tQP3x/tmwx/euNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188395; c=relaxed/simple;
	bh=6UZqgo1pNVnRYUaLOBFpn2TGeofhqUttyRB0yoGXOFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaLLsK0n0EfVtxyjTgYt0tyoIugZDJdKl//vYiln0KjV9mOjxNSSCJRQGh3gcr48MxoSRKHFNS/me8D7jP6O+25lSuNICRdc3FdTjlfFZwVpUEa3cEKad2wlsdZSnRz8iDQqVYaDlpGf6swLViOIdjLdUq4Q0fPRph9+A6e1ECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYkvfYRh; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYkvfYRh"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-867a943b149so8556047b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188392; x=1788793192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vHIsNy/IN9t6970qY2+L8dSJ+0VAmbxT4VuLQXYbHc=;
        b=nYkvfYRh2kCVnaN0Tj2EhYB4/lWIH1hkSdlsFcbqjPxAEq5YMsvux0IdUOlHxORVhs
         OPs3zXVqr52d5DJJWQV/h/YDwG8JbGlo84KsmHEdYhfT8aRnxlKCATTYmLtY0PPyBFMX
         bDRFKFrunByFw4eiLcdi+Dtc0rIwgI7JDRAOt57HgFtVMiW1uwzxt0yHh1ysFckqKFeC
         Wx9K/9lPtaqDpXnkXMk6eTU70OnEU5y68Q2MGJGsPd53v5keBmKqsby9d9vyH4R3kW+J
         9VD4atWFGTx8rkwuin7omcU8cAbc19CluS1sDkXBGVopeKcIJ4TIvTWp+bVM6VvWfXaX
         S92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188392; x=1788793192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vHIsNy/IN9t6970qY2+L8dSJ+0VAmbxT4VuLQXYbHc=;
        b=NS0j402CtK3TtAjfJFGO3bDBtjLHSWH6ua9pnIoQLj9u5fnCPz21pPrDdTWVjLjX9v
         N1Jq77LJzpwTjgPltkld8GYGMrTsB6WaDkjTATez+CNmeIUkszwXOyDbKMdC+Xgxmguy
         bgtr1ukw0O0a5BEaQQb/8jSNvBHZ8ZcwUz4/ZtLoGMvnm70QfbBYCp95xm2uxeeTqhVF
         5euQAkE+K3XiUkL/NSwheUKz/+czlcHVDXBdrDsNyFzRVQ0jrIkMRW3l5dXNxf9VpjE5
         O27tH6wbErocjEx6gyESWKBPsn6D/AYfjCqwHjRx43MjrEzWyyybTZ5l/aNHB9QKLWSx
         y51Q==
X-Forwarded-Encrypted: i=1; AKwUvBydU2TAAELFROo01Z4PCuPHkiONOW/S/lm7GPQbmsr+9WHUWTdV8bUSHmDzPEgz0BOc4jdxYs4fHykZVxE=@vger.kernel.org
X-Gm-Message-State: AFuF++nCdRrtwExWj11bHEyV+zt4Itaq4D2R9IdOfnwgEdhulKPCd4Yc
	XfGoMKkFDRzK4uLMcb70FsGYjdFERy8k2wFrLA3E1uVyYW8awhpxI+UH
X-Gm-Gg: AYBFou2gb6mMT9Mz9FPEH+DrBmlojAghODnbkLf4+3DiMXRqwd0/ZjIs6wLYcVajy6K
	20AGz+0Br4erOH632ypzhxKWKNloTM30VKoeU57jaPq9vmwaq4gD4DyuPofaESTNIsHryGpdSVj
	ekl6UXxBPq3SgdG8RoJPNNz+Xjwz7rRBTWQgH1M1ydHeuCWfbawDPQDDO1NoG4wJz1RUMAqdLxr
	kbnm2S65tR5oDFdTVO0J69Q78mAsFw0/dlfz1IEOhiqJVzCmN1K2ArCpRvKfbU3do/hUS0pAsml
	16kw6kVzAbvv41HmBd+2/01iSBuMIeIcp2sZ7FtyAH+lkeGyPYgYMLAq1QBnfVhi5/FXAN9+vGo
	dFKnVuBaRPlt+SnKte4Nt0qZUuG/30M7EY6S/1/ZlI3Zsf24B9muaThymS4swWKKJcR+euVM/M3
	r8+3G7Ug8fXaeCLCPw6J/J60Fvx+ieLEiCO5VPVKY+RkJwHILYfDyAxpnQ2qjopKwDQopBF6H0Z
	OWesKxZqfjVKCD8w2ZZ3fcuQ1UYAAdXiQ==
X-Received: by 2002:a05:690c:c4e6:b0:7fe:4069:d3fe with SMTP id 00721157ae682-868747fe33emr6595577b3.30.1788188392315;
        Mon, 31 Aug 2026 07:59:52 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:52 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [PATCH v2 03/15] lsm: Move the lsm_for_each_hook() macro to security/lsm.h
Date: Mon, 31 Aug 2026 10:58:45 -0400
Message-ID: <20260831145858.3869191-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831145858.3869191-1-utilityemal77@gmail.com>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the lsm_for_each_hook() iterator from security/security.c to
security/lsm.h, verbatim: a following commit adds a user outside
security.c, the file implementing the LSM policy object kfuncs.
No functional change.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 security/lsm.h      | 6 ++++++
 security/security.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/security/lsm.h b/security/lsm.h
index 32f808ad4335..264ae63290a8 100644
--- a/security/lsm.h
+++ b/security/lsm.h
@@ -24,6 +24,12 @@ extern bool lsm_debug;
 extern unsigned int lsm_active_cnt;
 extern const struct lsm_id *lsm_idlist[];
 
+/* Iterate over the active implementations of a given hook */
+#define lsm_for_each_hook(scall, NAME)					\
+	for (scall = static_calls_table.NAME;				\
+	     scall - static_calls_table.NAME < MAX_LSM_COUNT; scall++)  \
+		if (static_key_enabled(&scall->active->key))
+
 /* LSM blob configuration */
 extern struct lsm_blob_sizes blob_sizes;
 
diff --git a/security/security.c b/security/security.c
index 71aea8fdf014..0a6fa21cc31b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -495,11 +495,6 @@ OUT:									\
 	RC;								\
 })
 
-#define lsm_for_each_hook(scall, NAME)					\
-	for (scall = static_calls_table.NAME;				\
-	     scall - static_calls_table.NAME < MAX_LSM_COUNT; scall++)  \
-		if (static_key_enabled(&scall->active->key))
-
 /* Security operations */
 
 /**
-- 
2.55.0

