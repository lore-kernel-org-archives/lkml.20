Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D43C3443
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982671; cv=none; b=Dv/H+T7NWigNTFNEhhPW8kLGqeFCuZtD4wFFl5dvFodmQKTNBTLUp8Q7rq2yKy7dnKtdRDtTLG+2SCMKSMJ5F8KvA9UX24tG0mUGV98ffUuNuiTF0/OXn4q8sP2gcjAo2QBzKsLbfA0qQz1C0chTJdTecEb2SK+N5J8v4uEA24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982671; c=relaxed/simple;
	bh=9ahnDuIzIlnNHViEcr2anfgH+TEO7ySvpOYjKqJILUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRlmqTMHCn/2MCdQ11YwVu9aH+cwWF7epcJSmoZr3T8lvRUbVtdKlvaDqBa1S2O0mveolqDYNOGLeCAl8thP9h68xwk11g5iz9d3afLleWPJDN/DdPvaHpoRigZyrvjsrO7Q8SpqtjyXc3A9lSTDWzq62KPUMQEhlOXWFjXIyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2pOVb/r; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2pOVb/r"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcaso14468577b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982667; x=1789587467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGIeBhiHsvfHjC9J6yImwRdInjaib4hfso2CvsNy6M8=;
        b=M2pOVb/rAfpf8c9Bwl119L9N7ddnxvT5Lbk9i6+QWTaEubnmJWawrFUNA50Uo7qUPV
         /aIeqtSlCiMonnO5wF9h7AWiL9dEk7o3Y5Y8rRbdoQxxavkeE5CGX5k+ttq3Q/CGH+SV
         Ku1ktKHEp7r1wvAJ+K++lW3QeNhT2WaEQ5bk4KOuPpNbq3GvWbN41+M4rkBjEYwZEWkJ
         0UVumj99TnBBTgLSYkD/6RiJEMew+Lr2sRmDSQZl/8SVJmqfD67f0b6BOiyfgfCyHFwu
         p93lA954WmeNCqAVjLy4zJI0iEnJ2xpIq6gSEVw4v2G3Zj/r1IwR2+FEw+FRjFsRIM/y
         9mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982667; x=1789587467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGIeBhiHsvfHjC9J6yImwRdInjaib4hfso2CvsNy6M8=;
        b=YPRat1RVN48j2IOQPcDqW3ZWT9GTrZVqtrXNzIaB4yWw5bMhDacZ2XIaDOZEAmxeti
         44YNyvfalMA1nirFEnShN8DradMKMui5lOg6RkH1P/EKNIsT+SaC5nNpNjLh/3KoSc6x
         BFMYJWbIBDHFBpY9r7RgU6i1pqpZ12oJMKW4ILlaQHWfUvGifVPc+c1lmZOiiNf+KEW5
         hxf6Wo4c30DE6pvqBtavtKGQeYInUbPTvpnkc7e/s1ickggq5doEdSdMvqJE+7lVLamd
         m3nvIcMSbd04EjFu4TYPMXYP8+GaNmZ4em/o2jPkx816Xehy0Zgg+I+8UfLuPj9UmYBp
         G7+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9QzZc0gQRdSBlJrWSS/BGZChXc2l4b2xwWuQef8uSn2GB2hnEpW/YMXOazdtlWXFdnryOmvx9wuPr4fw=@vger.kernel.org
X-Gm-Message-State: AFuF++nM3SPulgXw9MYq+LU2IX5nDy9KNU7bXcmbJertvA1NTCZANZ+R
	bHs27gzu4ALKLIjuefL/s3A156+ns3zhg4ibAu5VN1JXC7838VX3XQc9
X-Gm-Gg: AYBFou2APcUbCNBV5RTReWfDshZmo41yOCbC71cuSqdWE+4aTN9iW0r5wyNxInneMOr
	2D7FcoDGV9dEG7KIZf2gPD8UmIkgLSn48yD/Gwzc7IvRV0tRWd9WNVaSToxG2jlacLf/WbLZZBE
	SkhEJ2D11GP6ikTj+WhLSzEuf9Vzoqy6Esf3WHt1fWG2qeLLdUdKERyC5BOh+vkWgNTF4Ms58pN
	9/2NSHZ7D41Sap1Gb078PDeEQZiK1FjsKf+fg0aBry4rzag4PCLmSvOsPRTHax7p4kmfvPydejz
	Das9qOkd9uGb0AE96vvs3yaLKpuNIdvAk0VBxsfO8Lrq+hsZOB/sl1H2Wn+W4dvK/zKwXWZZQpJ
	HxMxc/cRw/0gYArnf4+famRa7XyIpfsV9t5/7l2ZAE9kkmyoXs0cueSycitXHyPS1+bck2FrlPA
	VnXwmxaUoMAsK2MVKAIUYuPY2iYZLJ+lL6MvbnXShTmJnCD4Dk3HD1UNZgY4KMNmB7k90TJfT2L
	xC4v48mtfhv5G/19SztxLYYsL7lIE/2
X-Received: by 2002:a05:690c:7091:b0:872:1e2e:b496 with SMTP id 00721157ae682-87f29821932mr39000317b3.31.1788982667401;
        Wed, 09 Sep 2026 12:37:47 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:47 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 03/15] lsm: Move the lsm_for_each_hook() macro to security/lsm.h
Date: Wed,  9 Sep 2026 15:37:06 -0400
Message-ID: <20260909193719.518517-4-utilityemal77@gmail.com>
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

Move the lsm_for_each_hook() iterator from security/security.c to
security/lsm.h, verbatim: a following commit adds a user outside
security.c, the file implementing the LSM policy object kfuncs.
No functional change.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

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
index 2ee276ab15c5..74f98ef8025e 100644
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

