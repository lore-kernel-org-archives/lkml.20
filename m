Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293513C10A4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982666; cv=none; b=WPWpHVMv+mcDplCffu7jTOitD+jzFzlsELUYjfGhamnKv9PEQ7TuGsfl8ExL0sQw29dNyFryv0ykq/Qy+JeH2DdChCG1uDc+RptR8DxWH9kHi1e1oaSfRfAjPCzkhp7HuS8+V8vaQj4HcVatmLwNtktL5bDUeYKDkYfhKmTQPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982666; c=relaxed/simple;
	bh=1LzvLV16xeBAkstMGb/MXqY0fnWj9soFnay87GQLE4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUbUKX9EmjsUA6seHnKZWfT8SagjDJWHrGxnK1TVvFbWpL5MT861Xp4xd5nafCJNAJ0vuOONu0pWGHYVOUbLnd6xvyZAe+B9qhz43s6SWbBDlBdjwz0Y8AjEb2nFbfwP0bWoXf0az+ciJ9UJc37+UHOyTV7mjj1lrBGze8lP9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQUApE5n; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQUApE5n"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ecf499af9so89482357b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982664; x=1789587464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtEYMRE/KFKlT1/9bXmERUsL0M9lvoNkItLmndtSgzs=;
        b=JQUApE5n99dyerryUAtbX4T3wFcxmhOhMp/XL6CtqilC1uucsGziGBY91J92vSLZYN
         IrH3V72+1yBLHLbRpaR2zVW4nPnAhnTz7NAd0Tqb/e3dESNrpkfXaSHk2PeuOKG1JbN0
         qKMO8FARWnzIvT0LLqBtlYlEDnHxUKlNzhlrF93aZnh5AzfTJzENv+jHeMxbAKckSiCt
         B3TmVeeSZHEtWYwdqgslVE30woIUNnuhIP5cYTZHKaEH/4Mke+OO0ZiM+9iOVvkWb9tO
         aX7valwJl06aescUImrzZC7zlSFMEUR9lE9ZtsDs3EYv/lZiHWoTKbVrJn2F/mKBS5Wt
         iIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982664; x=1789587464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtEYMRE/KFKlT1/9bXmERUsL0M9lvoNkItLmndtSgzs=;
        b=heQbOEDyOoPceCl7eKkrI+wnSVVZFAgTRGWf2UU6SrQLVNYexrUbzxeNYX2aAeDoMU
         OlU8c5jz456aT4h0Y8Eu1iD9NvKSwRKVR1HDa4Slebcj5YyGhjSaLYwZkclJGHMA86Bq
         rn4zqtFwbRCEGhqHEX5KXcUcJyMxp8WYux4ssSZZ2CtDRVQLtJtn+OXuAV4oy+zvDIYo
         kXauzNsosfEaRdxPJf27iMkbyvCfAdYAhrwFN3HQp/bcE1u0OlCnlTrIpNTrZFvqMEnp
         Xt9obPfBswMLptvL4ROu2Vrb5IRSxkdteeHx5jJ49MwwwVzln2yug3OsqVrgJyaoP+R9
         n25g==
X-Forwarded-Encrypted: i=1; AKwUvBwHUPVWJUdqyC8f/WFOWA/68179agZyTlOP9yDd2LdzivUpsvWqZWYnBMI/bTwXVkDFnO1yGq36kef6jN8=@vger.kernel.org
X-Gm-Message-State: AFuF++lFz0lcypOlwRs+zc3q8C7V84iyVIbN7CbfFM2AdNrk8RqzZe48
	vEX6QzyvB11itd8fLNILn8O6i4yrVBKLohsd/jBW1eGuHA60s9qhfuLQ
X-Gm-Gg: AYBFou1wPTGvAzoMk4ANxU1ZYIsx/E4ldAtyz2movyX+pkgKTOVonjbdYEDBZo/ZKhz
	fPoEPE0Xy7/nGTW5pNUz76tDqg/hk2GwxlsBa2qW9RH5P7KDq9C79JZjYqDZgdFH5N9ggaUEEVz
	ljxie+Jta5+qb+3dvCDPKQs3wss+JhmGPM3oOAnUy+8sRBcBwO9gPlMwxwLBnRCIJEOnUDwr2SY
	2wTqmbVU23GKEZMr+WfPjEE3FxZF8nVU+57BQtvVxQSHUVq3L/6cN0kSqxyLr/FCM/DEVwPE866
	DItuvKdL2MQJEpiOwaKToQGDMuDUVnUBnpmerlaFg6X3+ThaXctkwICyiBaDIpTKNbkhvvfLk2U
	xwg6KhzUSkMzIAlgv5BeoRkdXPZSllM3zntoajeMVvhZrdfdgFAwGGTX5WltUDEWrKEZd0zuebl
	iV9ZxMZ7gaLFFw3EvBY5imR49nqIILZamI5lSfhzo/uCOxYifnopBkanDVzgW79OVvl//oh6iFW
	7z2whZ83lBXXhGRYxriU/OqAuzsx7+b
X-Received: by 2002:a05:690c:c501:b0:871:a319:3ee8 with SMTP id 00721157ae682-871a31948c5mr132151937b3.10.1788982663710;
        Wed, 09 Sep 2026 12:37:43 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:43 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: casey@schaufler-ca.com,
	gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	jolsa@kernel.org,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH bpf-next v3 02/15] lsm: Add the bprm_apply_policy_object LSM hook
Date: Wed,  9 Sep 2026 15:37:05 -0400
Message-ID: <20260909193719.518517-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193719.518517-1-utilityemal77@gmail.com>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the first policy object operation, applying a policy to the
credentials prepared for an execution:

  bprm_apply_policy_object(bprm, object, flags)

The hook is only called between the preparation and the commitment of
the bprm's credentials, i.e. from a bprm_creds_for_exec() or
bprm_creds_from_file() context, where the executed task can still be
arranged to start confined by the policy.

How the policy composes with restrictions the credentials already
carry, and the meaning of @flags, are defined by the implementing
LSM, which must reject unsupported flags with -EINVAL.  An LSM with
no notion of applying a policy object to an execution does not
implement the hook, and the calling kfunc fails with -EOPNOTSUPP.

Like the lifetime hooks, this hook is excluded from the "bpf" LSM's
attachment points, as the targeted dispatch makes an attachment there
unreachable.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

 include/linux/lsm_hook_defs.h | 2 ++
 kernel/bpf/bpf_lsm.c          | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index d7684407737a..ddb15bea383e 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -452,6 +452,8 @@ LSM_HOOK(int, 0, bpf_token_create, struct bpf_token *token, union bpf_attr *attr
 LSM_HOOK(void, LSM_RET_VOID, bpf_token_free, struct bpf_token *token)
 LSM_HOOK(int, 0, bpf_token_cmd, const struct bpf_token *token, enum bpf_cmd cmd)
 LSM_HOOK(int, 0, bpf_token_capable, const struct bpf_token *token, int cap)
+LSM_HOOK(int, -EOPNOTSUPP, bprm_apply_policy_object, struct linux_binprm *bprm,
+	 struct lsm_policy_object *object, u32 flags)
 LSM_HOOK(int, -EOPNOTSUPP, policy_object_from_fd, int fd,
 	 struct lsm_policy_object **object)
 LSM_HOOK(int, -EOPNOTSUPP, policy_object_get, struct lsm_policy_object *object)
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index f762cac6838b..f3de70511c0f 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -56,6 +56,7 @@ BTF_ID(func, bpf_lsm_xfrm_decode_session)
 #endif
 BTF_ID(func, bpf_lsm_ismaclabel)
 BTF_ID(func, bpf_lsm_file_alloc_security)
+BTF_ID(func, bpf_lsm_bprm_apply_policy_object)
 BTF_ID(func, bpf_lsm_policy_object_from_fd)
 BTF_ID(func, bpf_lsm_policy_object_get)
 BTF_ID(func, bpf_lsm_policy_object_put)
-- 
2.55.0

