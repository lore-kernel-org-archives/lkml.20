Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB156492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914248; cv=none; b=XYhf0Y/rAIielmOrpgMTF7cSjOOoeb1SuhsenWFZOl2mMCmi6cNLouPbb6Dj9bWYP/pQjNi/fkw6MTtvufXxZlv5hI4NmJpmHsDDvxICQx4nyMTI/Pcm4pfJjt3q4iDbOwh7PfzHVmjDmR7rcygCPysk7TilndqR6Ywxi45rL2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914248; c=relaxed/simple;
	bh=zzJ4iYLtWjrwgIUYLFF11JPaWPkNouNCVYh2xrPKAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fadl10hmpElOHx0wZ3QQft6DDMjfhbnDJW3mQMcfQQXDxskxNKMo9GlDjZbChoDs/LdPDPMJedx3FUYCdKChuZ/IuK1SDpJwP6HGX1XJLtiYxRmAl/Efd6vinSMx7xTXHLD/dvCVjfGRyTRN/sd5WqoArJVDUvzSapZLkNWSLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/MCX0Ua; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/MCX0Ua"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so345077a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914246; x=1789519046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/nSpHth++g/gUUsEL3F+NUVCLcirmCqvO6RY3lCswg=;
        b=f/MCX0UakrREQbksMnio1YYsH1wZChj06sBEdHEuaKPezn0aAI+kFZOIB66uHorp9a
         G4bf7n2DwNP7OLEEnyUPW8c2qhMSZ3QpyDtf8syHGjglRohuPeU8CDPEw0tOk5AfzIfH
         5OFV9SUv0I1SqlB5lqvvAsFjmWjsF8T/VhyCd6aXI1rWoPuta5ZoUzmHY1Fw8ShT2tB/
         R+bPw51mpFxiQsNo+KFM0ziNtOZaWZoP7kn1fBbjuBHV1Vq9JU2NLk6i4wzBLBUSFPbC
         BkssX0DgHHet9+c+EV6nXl5c/GWNmERPwoMPEqgYIqHrB4iw6xKfG9qn64s+fKaqQODP
         VjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914246; x=1789519046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/nSpHth++g/gUUsEL3F+NUVCLcirmCqvO6RY3lCswg=;
        b=R1Yc/MHItu+mc4ryy3cnwORtTPVMcXNcALuK841ClLKygwroF3jp4HCRyclnD4aUvH
         8zUf6nwJ2gCb56QeyxWIZT5UOugxc+RVQIM/sVZfwSRq2C3O4oBZD686ONSH+5B+pFiC
         l+5jsLi+bqRtz2B/JFIc9995qxJxcBXW7URqnhXYQaCSPdCGWh3oavy5oRujhbiY5fxW
         ZXTQlDdK5YcXghtXe+67mmgsDw/ayPVP/allMDxKQrO5Awjgp66Wz5RG2W4XWrYuuQEh
         QTBJLCK7ouaJ6tVBkXwP035bLRa/jz8930ze+KadoxUVGgZcGcC/1RxFA23Yj+PVxdgA
         TImQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/m2gu3Bpvgs+vjdwPZiKJpP53BKRgCdylGgBOGHWZSakr6Qlm8tGUok7q3lZYpBp61S7ajPn4GdyOv7A=@vger.kernel.org
X-Gm-Message-State: AFuF++kDIjq+hVLa8IRzu3IngrkqpA+dstqDtd9ox4YzU34+hsWzioOe
	0ksOM96Lc55e+ekHeNwxMLKtHEb5+oUAKPPXkKBODgcLrk+SqNRCEQ74
X-Gm-Gg: AYBFou0hdgAmbvti2+pLMh8STxsrqhcUhowtNbC+WVqM0lZ9aXUxf3HAkyIArdp2Rsi
	v7vMYVkPFvUYgvtp/teaMY4Ge1Lcjfr4Z6kuH/LAG9CwqV0QktbJj7tnbwOwDbzzHRDg62wecaw
	gphbcfZSi11Je+xyf10q4SOYfv/5v4fAehxTwfyjJhce33PN+JSW6VBGqCKovsMxJRLVw95QYA1
	30fhVnzAVK4S0W02bUqFjE84/xlkD4GfOHw1y+ldi0VPNbsuzEIctSIv7H+ZldR4EJkiCsi1Alj
	7dbwfI3cnLVrzzWP8OzanuxhVMxxpiagfEqXL0lW14ZOqggwLFP05mqtBwFfDzQj7ehGpt0QmwN
	bPupd97KsuYdkaYLFphwFfu+ofiTbD/ROELqn8S1ddKJ/05MIIwppo9QPlWcTj5mG/2Pxkq4/Ca
	E2RhTln+IjYoyQzOWpRthLdoZbjA8k1fC6v1ku2cFGIX5ag/dw+aFa3TzKfbmc
X-Received: by 2002:a17:90b:184b:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39b8bd03b29mr8739873a91.4.1788914246185;
        Tue, 08 Sep 2026 17:37:26 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm40660284a91.14.2026.09.08.17.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:25 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 6/9] crash_dump: Improve readability of config_keys_restore_store
Date: Wed,  9 Sep 2026 08:36:48 +0800
Message-ID: <20260909003657.1570544-7-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

config_keys_restore_store currently doesn't validate the user input
before restoring dm-crypt keys. Although it's not necessary for the case
of vmcore dumping, it's better to do it for the sake of consistency and
code readability. Also check the return code of
restore_dm_crypt_keys_to_thread_keyring.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 9ad50ac54866..b8fe630462cf 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -371,13 +371,25 @@ static ssize_t config_keys_restore_show(struct config_item *item, char *page)
 static ssize_t config_keys_restore_store(struct config_item *item,
 					  const char *page, size_t count)
 {
-	if (!restore)
-		restore_dm_crypt_keys_to_thread_keyring();
+	bool val;
+	int r;
 
-	if (kstrtobool(page, &restore))
+	if (kstrtobool(page, &val))
 		return -EINVAL;
 
-	return count;
+	if (val) {
+		if (restore) {
+			pr_warn("dm-crypt keys already restored!\n");
+			return count;
+		}
+		r = restore_dm_crypt_keys_to_thread_keyring();
+		if (!r) {
+			restore = true;
+			r = count;
+		}
+	}
+
+	return r;
 }
 
 CONFIGFS_ATTR(config_keys_, restore);
-- 
2.55.0

