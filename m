Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231747FAF9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817122; cv=none; b=sFJfZfc3nW23nR5tCxc3v4jKitVhTadkCvRQS13NzgzQO8dbSkYreASMB9O6OqgG+rqgV7BotyNAXwwiAjeGzHdVpNacqTFjj+xDR1EZlN3y++gePoE0e7cDj6VykRMeOS5SP+wZyGCLEWZKlkn8bvys3XHAQqW9X4pclC3hPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817122; c=relaxed/simple;
	bh=o8qYnC0iodB6i5JYex5NwbUYoqmBX7ZvIJfjLF28bDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P36nl7eDSrVvNWZU7GuFQo2igQVeOgLHHqLD9/Yr2RMDPlZ450cazCrYoX+VnEk4frDGAV3Akl3SNt0sz41pu4fX1lQokDLWZhO+x37w3UOvxPVZZFkPgrRru+sqkryjM7kcFSQL8OpFdWRWP8/LlpFxZ4fx5gCdh1w4hjuxy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUEmySLY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUEmySLY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1157691b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817121; x=1790421921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz45Uiv+rMZz4ewexv5U1L2m2XZjVKu0OOwOAru4fI4=;
        b=HUEmySLYuiW6CBntMnADpaurgOpUg381KDxu3JAv3/kChmMRrXr4wX1l2bRpgFmo8E
         B0UWx8WyxttxK0tY6fSNqmsk0vPDF6Rcm1mzcUKvfnQCePMt+fmDiJMHPMn3y2+ppm88
         lrITtaUd7Z/L0Fe4jDbnwy8fjplvMWnwN+nSi3omyMUleYjJX3dHitUbdBqifu2qPoj8
         iycybrLfTa8aqxjldyc4/Nl3W9pSOAifkWpaxRxITm6Tgs0+3QnteJEu0sSoHC6nKs+m
         th3ZawGDDDdiJRtBfU9ZI6KmGLzCUpcRH1/uaJriEuu0USVOHmhkRRUKkPyZ22HUBj35
         JAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817121; x=1790421921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fz45Uiv+rMZz4ewexv5U1L2m2XZjVKu0OOwOAru4fI4=;
        b=vjn7LSMbEz3hI/i7VS78+g2MiWnQ8UH2bvOMfLJj6B1qbmGiv5scvpJOyMOWc9dEIK
         4MmCZD1joFLtU5vakN8O711qHvoUJx6Vq2E2S7pnwCSycUPgapbSYWSSdARcxKD2AWGB
         3+57U12Tz1MbBYwFmoRsM+kRDmijaVTRvwUausf2swgJLi5Nly/MkXksSVUiVHAadYDB
         EmXj0LzUlmEIHbAVdd7yvhY3ZZ0TztVwE0GPmndVO/nGBRolYzgJ42N1EAjzL++Vu4S4
         i6+AXVfx0SqQeD30gMlGOGd2lcqC7A7XdESErGywy8lJHNFHB3176nlm48SP1nKDDHdG
         FaJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzU/vDGb+dSBXJGNq9LsJGXdm8zMFbVGDxAgSfB05vY/f/3y3sNcylq4F79L9gLXE959/2vn+lneyl+eU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkIMuO964HhCbhpdBPGK23zfTKw6jFQ6ZSN6HM8gjt2LCaidde
	wjLCnxVNoOg2TlNKcLXwac4xjYa1AXBVbj/dkgWYOejf3IgJsE6D5RqeBVhzpl7v
X-Gm-Gg: AYBFou0dVEN+gDtOp4WIC1ZWc5E7+nzZsfR5mFICtOH8QJ9NR6OwNiCb3Qzh+JZEiB9
	G0jVggxdSIWl/fofLpHYF/FYBDoCI/i4DSGOg/ti0drLf9rEPnZ7a918kISWgFabv0Y6a7pFEvU
	MiuU8TR6m1mRdcf+raHdYqoAdtr2s4fIDZdonKb+CVley46pUkgPxairLEBD+kfUKvtQbYx1hYH
	AHLETxef68y/1plthJRyzCa1f/7RHgR+2kk7bdLsZTTrlGza4Y5NLS4LgpXoO4yKBOOtVH3A8LN
	c/DoMXASw8T1VX7wTuqImoLdfIz/qEqugGWwnblGy7ENkkCUIKcUSPcPLK20YzCuvru7SwVjbbc
	QQD/3B9UJbPr+5H3yRcT7DjfmS404cAx67pTcPz/yPIGcXfnd/6jQCCjSQuLCy2GHTkjJS1AXf8
	FxoKAdqzMGMfMYMoNF5VkgxAyNvmwL+pgne+m0QJo+UNNsRoKMKG87MMCK2ZbzAFv2TEDvdlRAh
	UFi0mOaGjaJ8BFwuWejkozZJUx2bo6t1oEszKmj/3kV2FlF3FwJaiQdm7m35lW2WItyaUJE8JkU
	PnUnd+r/qA==
X-Received: by 2002:a05:6a00:9291:b0:874:705d:f649 with SMTP id d2e1a72fcca58-874deced9c5mr7653377b3a.43.1789817120928;
        Sat, 19 Sep 2026 04:25:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm949957b3a.42.2026.09.19.04.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:25:20 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] nsfs: fix namespace reference leak on unsupported ns_type in nsfs_fh_to_dentry()
Date: Sat, 19 Sep 2026 11:25:19 +0000
Message-ID: <20260919112519.3872163-2-benquike@gmail.com>
In-Reply-To: <20260919112519.3872163-1-benquike@gmail.com>
References: <20260919080850.3005810-1-benquike@gmail.com>
 <20260919112519.3872163-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nsfs_fh_to_dentry(), ns_get_unless_inactive(ns) acquires an active
reference to ns before switching on ns->ns_type. Unlike the CLONE_NEWPID
error path and the owning_ns permission error path, the default: branch
returns ERR_PTR(-EOPNOTSUPP) without calling ns->ops->put(ns), leaking
the namespace reference.

Call ns->ops->put(ns) before returning ERR_PTR(-EOPNOTSUPP) in the
default: branch.

Fixes: 5222470b2fbb ("nsfs: support file handles")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add a Fixes: tag. I blamed the default: label and its return
separately from patch 1/2 to be sure: both come from 5222470b2fbb
("nsfs: support file handles"), and the asymmetry is present in the
original version - the sibling CLONE_NEWPID and ns_capable() error paths
both call ns->ops->put(ns), only default: does not. The two later
commits touching this switch, 4055526d3574 ("ns: move ns type into
struct ns_common") and 3a18f809184b ("ns: add active reference count"),
only change the switch expression and how the reference is taken; they
do not add or remove a put.

Please note I have no reproducer for this one and I am not claiming it
is currently reachable: ns comes from ns_tree_lookup_rcu(), which only
returns namespaces present in the ns tree, and every namespace type that
can exist in a given config has a matching case, gated by the same
CONFIG_* symbols. So default: looks dead today and this is really an
error-path-symmetry / future-proofing fix rather than a live leak.
Treat it accordingly for stable - I would not object to dropping the
Fixes: tag to keep AUTOSEL away from it, or to folding the three error
paths into a common goto out_put; if you prefer that shape.

 fs/nsfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index a1842e12f..e9cc09583 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -624,6 +624,7 @@
 		break;
 #endif
 	default:
+		ns->ops->put(ns);
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 
-- 
2.43.0
