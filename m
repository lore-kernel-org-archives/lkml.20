Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601445;
	b=MGavQCB0HFNGq2naTUav3w0WdM/ZN09gp8Y1fbOGnCVwSRMKM7FkSJgnJB77g2U6KuR+
	 FwEARqbth29f2j9fljEnZMxTBENO7Nf/TpKz1gKUTljFDkvV0YeIf9WmMR6TddWj7IDKR
	 BIVckByt3OA7kgjSXrV82endzlRFm6amUxWyk+vcgS1qLeAgw/5xMbktGAF0k5jhthOVG
	 a+WSVXy3TP0MeeUafGKDe7jvwslcHRZuBcUkYaKTNEYenFXEKgdSaomlmbJ7Ed/Ivp3FB
	 RjZ7lOYz0J1AgkV6q1FKDjZvhpaa/F1WM13WPqGylOaYYM08hZKuYRZOkaNRC08wZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=11pzDrSvy8pN7juNxI1TqFg/ZMo6mlfjRdUwJqxTnJU=;
	b=uyVTkjC6n5pFLuALh6R9mqKd8H3tqlR4mf4CWW0iCHM17S7NjHHt8YQmd+eaezT+vfJi
	 HmovgoPxQieVF4C+U9pILUYGOiWzFHUeYu0aYzMo6zYlTKIkQzni+NmV5ybIbJwjDyKO7
	 5eBN/CPDAyupvCbxiWIK/SumhLuda+3z32krP6Qqk5FHWO4iwsTK+MfOn+gJGiKzZn3O0
	 gVrVSGTY2Pdau0BVMA/+JXhYzwPzlHxfiKb5wvp9kon+1EpK6i3sDroIFoyV1R+9Tv4nn
	 P0NWSaGW/Y1/3kSX/j98iC2BI3ZBt8234EUkXE/oqLdHqPuW2YG59WGe5sEIiQyLKxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIVvuyfg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72660A261A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B72660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIVvuyfg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so18719685e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601443; x=1795206243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11pzDrSvy8pN7juNxI1TqFg/ZMo6mlfjRdUwJqxTnJU=;
        b=TIVvuyfgpZi5DMjjNMj9tV9pARWEk5hqVnUHOIGVemowXnFkJWwKHP+DEYDXvfoKlU
         sYyD/6PlQqRUZl5p057WVQqTjOt+VXV7kq7fL7ELEg7+WL0pTZZzz5qBotepgw7Bv4t8
         XcIRcrZfTrWmFGHxafUne9CgGLVKBOFsR3WsHvXQ49WAqAYpAe3Dnwj6oHY/tWBZaCBs
         3ZCsN1sAX5RKmnXuU646pSqjXiwb0WpcmPiduXV1PaoJARIwXRIQ3jcD8N6T15eFAAV8
         0Qu18ldKn8aYwBEzMuVRgnmxKwG9/8C94njOEgQCuClLnqqAxElQF2FkfByaaI5JVCHf
         yCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601443; x=1795206243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11pzDrSvy8pN7juNxI1TqFg/ZMo6mlfjRdUwJqxTnJU=;
        b=KgkmWkDDLv3/AjmwVCM9qkpdd1S7ddrzOmKrnEiqiCND8GhJxyHh3Z3ciO388L8X3f
         hxDWMQrXgghWquvA4pR0G2lmgRfO3K21xwnbBEuzjjCJLPstDwL/ISAF9PnblUG6W0XR
         MtTbPiPlvJNwmRsqQY0xaxeSLRobN5BZ81gQmS+BzcNJAwoi8XMWa0jxnRplN/jCQBpY
         ScVgYIja3znDlEffyBTVAFZ8vm76P35LbByPgkRzEtCut03xxc2OMcjb4eX52Qijs5mA
         Q7dTscL1ILVoLSCvrlCYeMBXdstX5FTPaXE2Gi3VFoqtZoJAdOUIUP2Sn6x7ohZxqxeu
         x3eA==
X-Forwarded-Encrypted: i=1; AL+hErF9iOf4dI+f3Ke4Vy2B2iugRyhjDMkQXgW8EmdfctyVxTgtPI4fYD29V+5od6OfixwG4OCpOZY33NBl0Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JhMXwsPSMzsGS6STqwMDqC2kWRSGoAHTjFmi9lAoO+Km17FV/
	zJ8Y8RB9DMS5ucYZtzs5XBRKFu2weYuwq9luPaqfCfGPsozPt2DY6qT1
X-Gm-Gg: AYBFou398X/kOj/G/tojWbemxf9Mkl1o6NK2HRAWM06PKSuBducwR4cg7zEOgicsvJv
	SWJyZn+bsHtofEYZEOGX07VWIQ2+/+devYuIPI5/XrW/bjulj1I3trMNL0hT7NXDmNXSfmkNCRu
	go8YSKsN9DaJYa4T94X4SiK9OPvXuB8KlQHZLGGHv/aRNyxQsgF7yWMQ52g0phhenuMo/MiMxIr
	MExGZyIR5Fg5kpYNwbmLwwzUqtxBHFg7HCUiqjcvMJcQc3eozvJHSJcvKVVuVyXSpRataaThqYM
	GaucIbuZ8DRv5dBwTLknGDxhSrlSaJW8sFP5/QkyMdNMvvgX7IO3rCrBQhTwEfdLuobQ3ewmLt4
	/OYoeGE4jcF9wm/r6AHSFHPd1l59VNP79fSAn3Fg8sQwWy45GV1KZnx/TRhk6KVdLlMiIqPAHnY
	2XTxCZTyLRn59xYKODC+LYoUCLwp8jvwVSGDyqhz36kM2HdPA93TUjwUQhQbm4MyxT+qYwd+7St
	sIk23OWUb11ZXm2Jv+ZF0k5SuARhu1tn4kLGUPpst9StkSG5VyYQwNzi6kOSL45UvPAF9DlYlQh
	vJiTLnESLq+td1oxMcu4LX+/dBVsW6E6jn7cxun4IchlbrV3AeI2TA==
X-Received: by 2002:a05:600c:1d06:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4bb55ab3403mr73006955e9.35.1794601442864;
        Fri, 13 Nov 2026 12:24:02 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm95755415e9.11.2026.11.13.12.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:24:02 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:27 +0100
Subject: [PATCH v3 5/5] landlock: Clarify implicit handling of
 LANDLOCK_ACCESS_FS_REFER
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-5-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The LANDLOCK_ACCESS_FS_REFER right is handled implicitly in a ruleset,
but only if any other filesystem access right is declared as handled
in the given ruleset.

The old documentation was still a remnant from the times when
filesystem access rights were the only access rights that existed in
Landlock, but it became misleading when we introduced additional types
of access rights.

Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 include/uapi/linux/landlock.h              | 17 +++++++++--------
 security/landlock/access.h                 | 13 +++++++------
 tools/testing/selftests/landlock/fs_test.c |  7 ++++---
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index 24510e5d8479..7e38b9d1bf12 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -22,10 +22,10 @@
  * enacted.  Vice versa, access rights that are not specifically listed here are
  * not going to be denied by this ruleset when it is enacted.
  *
- * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
- * by default, even when its bit is not set in @handled_access_fs.  In order to
- * add new rules with this access right, the bit must still be set explicitly
- * (cf. `Filesystem flags`_).
+ * For historical reasons, as soon as any filesystem access right is handled in
+ * @handled_access_fs, the %LANDLOCK_ACCESS_FS_REFER right is always denied as
+ * well.  In order to add new rules with this access right, the bit must still
+ * be set explicitly (cf. `Filesystem flags`_).
  *
  * The explicit listing of *handled access rights* is required for backwards
  * compatibility reasons.  In most use cases, processes that use Landlock will
@@ -462,10 +462,11 @@ struct landlock_capability_attr {
  *   This access right is available since the second version of the Landlock
  *   ABI.
  *
- *   This is the only access right which is denied by default by any ruleset,
- *   even if the right is not specified as handled at ruleset creation time.
- *   The only way to make a ruleset grant this right is to explicitly allow it
- *   for a specific directory by adding a matching rule to the ruleset.
+ *   This is the only access right which is denied by default by any ruleset
+ *   that handles filesystem access rights, even if the right is not specified
+ *   as handled at ruleset creation time.  The only way to make a ruleset grant
+ *   this right is to explicitly allow it for a specific directory by adding a
+ *   matching rule to the ruleset.
  *
  *   In particular, when using the first Landlock ABI version, Landlock will
  *   always deny attempts to reparent files between different directories.
diff --git a/security/landlock/access.h b/security/landlock/access.h
index f9eaa2f53686..789ccfd9f669 100644
--- a/security/landlock/access.h
+++ b/security/landlock/access.h
@@ -18,10 +18,11 @@
 #include "limits.h"
 
 /*
- * All access rights that are denied by default whether they are handled or not
- * by a ruleset/layer.  This must be ORed with the .handled field of all
- * domain->layers[] entries when we need to get the absolute handled access
- * masks, see landlock_upgrade_handled_layer_config().
+ * All filesystem access rights that are denied by default as soon as any other
+ * filesystem access right is handled, even if the access right is not
+ * explicitly declared to be handled itself.  This must be ORed with the
+ * .handled field of all domain->layers[] entries when we need to get the
+ * absolute handled access masks, see landlock_upgrade_handled_layer_config().
  */
 /* clang-format off */
 #define _LANDLOCK_ACCESS_FS_INITIALLY_DENIED ( \
@@ -178,8 +179,8 @@ static inline struct layer_config
 landlock_upgrade_handled_layer_config(struct layer_config layer_config)
 {
 	/*
-	 * All access rights that are denied by default whether they are
-	 * explicitly handled or not.
+	 * All filesystem access rights that are denied by default
+	 * as soon as any other filesystem access right is handled.
 	 */
 	if (layer_config.handled.fs)
 		layer_config.handled.fs |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 6d9baab0fae8..48c1f896dc9a 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -3034,8 +3034,8 @@ TEST_F_FORK(layout1, reparent_exdev_layers_rename1)
 
 	/*
 	 * Moving the file2_s1d3 file below dir_s2d3 is denied because the
-	 * second layer does not handle REFER, which is always denied by
-	 * default.
+	 * second layer does not handle REFER, which is always denied as soon as
+	 * any other filesystem access right is handled.
 	 */
 	ASSERT_EQ(-1, rename(file2_s1d3, file1_s2d3));
 	ASSERT_EQ(EXDEV, errno);
@@ -3073,7 +3073,8 @@ TEST_F_FORK(layout1, reparent_exdev_layers_rename2)
 	ASSERT_EQ(EXDEV, errno);
 	/*
 	 * Modifying the layout is now denied because the second layer does not
-	 * handle REFER, which is always denied by default.
+	 * handle REFER, which is always denied as soon as any other filesystem
+	 * access right is handled.
 	 */
 	ASSERT_EQ(-1, rename(file2_s1d2, file1_s2d3));
 	ASSERT_EQ(EXDEV, errno);

-- 
2.56.1

