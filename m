Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F22DB788
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310993; cv=none; b=ZE1TN1S/lzdqU+r+Z3BSm2jIuj+/VblYJpp86HxNfbQjRRkFVKNYcDoB9WcF6j1bmQwmcbyB5XJ4YKzs+QJSyIDqQUmfK5o0J3PyK3HDsjS3XFKv2ZOwrHvlTfs3Ij2nrpOJWdQLg4iwWs909yCElyil6JLnGcejigrVlnuhY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310993; c=relaxed/simple;
	bh=fqYdfhM4n383iQRBDpq26Y/X/oP3mbwZS2rLGUBKObg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7sN/4IKXUWPNrW8QTeM5OCfmuC8TLWDqGdmqaVn/TKiQqJyqVEnttKu7fJJu8zDmmTb5iXopUWqIYcvjkG+1Zv94mKnGHCrA32e0NyJ0u1H8X/YfNFhMLEMfGiCHzbif/e1tfjlcqk+NguJ1iw++FVXAPU+wn0JsxeALQqZ94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlIGExBY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlIGExBY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so6882085e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310990; x=1789915790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4XBkc/3o0TvhdU75Gq1POY2139HpfJ6MiGPK2mRXWA=;
        b=OlIGExBYCSathE9wDoDaWXy2tD0fEennZMed0JSIO8WfQCCQ3nNYLGEpxmcmdrW6CB
         Gn6VY6cKnVntDFw0r7faBmfG/Na4P6W3377mRVodYxd2SyZPCnXpN0+gSesM5U4oAmPA
         g6opE48AFt08pkB74q2o4CVnak9WRnV1CiPRzWP7oPyC7VQvMEmLfe4UfKBsdLXG4LFZ
         pOCtoI8iq3erVCjjzhY5cbsI4mkGk8WafhS2JtMnrcaEKGwFh+fB4oQ8DK5yni8XOkcX
         cTDtIvqe74ilYr3sOPJiBqr03nCFuOOwTwNnF4f8yybGR/+Qb74+9uUD8f7obbVWQzFP
         Zh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310990; x=1789915790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4XBkc/3o0TvhdU75Gq1POY2139HpfJ6MiGPK2mRXWA=;
        b=GKRxqTPEsgxl4tpiEQV3ymUDQO27bdl8yGPLkADF+V8bPkzcf9fa3YNK5tT4hf/Tyg
         z43loH++/miz7ila+sKyYK1r8gQKt+CLDDp/Zf9Mzx6S5Lr4ok6eKwPwTisi6cqtxA/G
         rvKkLAdzyAdSlBAdupCR/Y8tcU737l8X8t//WTZ9ijYdfGv4JjkfLis/5Xs0Vr9TByZq
         SHw3zN3QGtdTJjO0VDLiONXUWseYgIipRsh2qsDYyBodVx8F2uoGtMdc+175EHRKc0Zt
         PZHT5sm3d+JnbfWGha5YVlWmHzrs34Tvw1piles9b8AJFOH99EU/zw8HzFEdOp0Fz/gi
         3E2A==
X-Forwarded-Encrypted: i=1; AKwUvBzN7+XNbj8v5nowNWX2aVIPm2ZxAPeEXb8MfPEpoVU1r3C09j4TmJnixKrD6MbzIfpVCt6eQ17etwGtDmA=@vger.kernel.org
X-Gm-Message-State: AFuF++kNnNMYhMuRSAvnvLcTL30bFNPufZ3590W6ok++f7Qo0tsNf97n
	8yK50j/KyovKRiTvJeizTzbuCqybGrs3ZIw6UcYgLlmb9fwde08FnF/b
X-Gm-Gg: AYBFou0fFsa13SMB3zqMPmln4GgT/oPtyjgiaTxHsRHqAwSbfTVHQXdBKXqt77Vj+W3
	fQ53u7bmH4QCGPtFafeQiYuOSGh3QdtRZQfbXuaphmIActEMO5SqUuscNwgWhb8UvHLkIKtttFC
	MUFZI/sn8J6wtn6oPu0WXtgMH9kRB7zI/OP4t418bC1I1pSHKzmpxSJqkjexQS2mcWViq3//PqV
	LNQMIcGu3YghK534ooErPS28eivM+vT/98ICFNZEXPP+EeF7QTFyUF60JYxuewPYjT1Xu6ITemh
	5lsZNdDPr0Jo8H5SKXMepZal06AYRZH1HNRt1ELs5Gpru3hIKA2e8FdmZcil8xtblwLHf9hqJ4W
	wZkwlHEhFm6rh4ZsjncTW8MMzONNjsgoj2CCjkixTHDBoaV2TSL9T0Oo++KG4cBIVtDIt000RZ9
	vo9c1cImBtcw/K22yJe2yRsme+8ylZz8HA3ZGm6k8QZTdyGhGnpgo8r7+tdiefWonAg3DE3lVVH
	K/s5wlmMQdVVlzW99cT2BiY5hFgS2hWFOYMeixOiyA=
X-Received: by 2002:a05:600c:3b90:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49e619b397emr244436195e9.4.1789310990136;
        Sun, 13 Sep 2026 07:49:50 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:49 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 01/10] fs: unexport backing_file_set_user_path() and make it take the ref on its own
Date: Sun, 13 Sep 2026 16:49:08 +0200
Message-ID: <20260913144918.1606123-2-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prep for path_* API changes, which will force the ref change.

There are likely no users outside of the tree, but should there be some they
will no longer be caught by surprise.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/backing-file.c | 2 --
 fs/file_table.c   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/backing-file.c b/fs/backing-file.c
index cc101143f921..e92410a27982 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -43,7 +43,6 @@ struct file *backing_file_open(const struct file *user_file, int flags,
 	if (IS_ERR(f))
 		return f;
 
-	path_get(user_path);
 	backing_file_set_user_path(f, user_path);
 	error = vfs_open(real_path, f);
 	if (error) {
@@ -68,7 +67,6 @@ struct file *backing_tmpfile_open(const struct file *user_file, int flags,
 	if (IS_ERR(f))
 		return f;
 
-	path_get(user_path);
 	backing_file_set_user_path(f, user_path);
 	error = vfs_tmpfile(real_idmap, real_parentpath, f, mode);
 	if (error) {
diff --git a/fs/file_table.c b/fs/file_table.c
index 8dcd213c0251..f9d1b5edd6ae 100644
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@ -71,8 +71,8 @@ EXPORT_SYMBOL_GPL(backing_file_user_path);
 void backing_file_set_user_path(struct file *f, const struct path *path)
 {
 	backing_file(f)->user_path = *path;
+	path_get(path);
 }
-EXPORT_SYMBOL_GPL(backing_file_set_user_path);
 
 #ifdef CONFIG_SECURITY
 void *backing_file_security(const struct file *f)
-- 
2.53.0

