Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4843EAC80
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906972; cv=none; b=WyAzbn3h4ozG4z8ETS91T1pC0rqR7c0DKe8hTiNjSqwFM48d273/2T3fVEfc+rq3/zT0gU0om8xX3fgHD/oq2Sj8O9DeMfgJBRT9MbuuUwu2ymuLDklb/3s+5LPtPy6wFTzn3WDmaxEKGtfr83QE66kiIENlxLBvJCSi20/ulgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906972; c=relaxed/simple;
	bh=XHyPdotRMbQwF5PwhfDdlv1whvzz9h5c9BPAmMB9dJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+/Bg9yXO+ixqWB28B8UnrBRleFgHmOGAuzSFRSZ1HjZvnG2klKpNfo/3vZ/74F6+ZztYPde8CwdDOF8CeSsKDs6n+1a+H5QeRWmLul5180oK9mU4R31nxNlz66/apSPsQ+aJNS6sQ7L+rEDIS2u0w733ZPCcZZlwN/o1Bo0Mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUyKn5Ax; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUyKn5Ax"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce7d2adef4so12146545ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906967; x=1788511767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbB/ht4kuz9HrzZ+87IjaChTvsjDGMv7+LkCGq9sCCk=;
        b=QUyKn5AxmP/U3j8gSApY5ozxDhnORsbjfCKJ/vHePUkPSrmbdrP5FsKnS+C11gmRd2
         ZoUW3975GTcrXMZ6Z8pG/BrMNX08BDe/6TTCYz4MCxasf/bXaJZ2GspvbLW9+gbEXDgT
         2qPTEfGle9KDoZGvVFoeElWH6KkczBNJ6C/lGLKmD7G0ILEvARIGfSqE3vg4ouvgCEVw
         BsjLP+Y2s2WXLjEDttuvtTHVvtR//HVpR2lM6KjXnL5FJV+Zs+JmamsgrNx7KVpj53af
         iwIWBl+ae2ie3nkp6BvCDsF20Ad6bqXrGhZQgNyEJRyMtSLbBZOSqCKcN20AoI6FUTN1
         7YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906967; x=1788511767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbB/ht4kuz9HrzZ+87IjaChTvsjDGMv7+LkCGq9sCCk=;
        b=ncCfa/HaoZfnO1UVHrs+E+EovBOlhNIBezdoEcaPOFvdI084dlMQzK7dBM7A0ALmeR
         43XL8qIh0dcfDjMY3Jz1A0rR2XRgFVjvC7PUvWHTAJ5svYPKokQdS49ex2P4VqmfkTd2
         kIxvme0Ji/XZsnl1DVItQj1F8/0iIKG7t67O8F+zLeFKmDgZ20G4KrU7tf/YaY8GioD5
         ECDdaQ3aiFlhIH5o6dwq65DigE4cHCUWzJvzEqEfDXo+dHCFOHeEx2yN3fCW067Vlubw
         1jIsR+e6iIWq6W1TBSIROWhvPzinmoLbYG7hCTr5sRsLasJjnTcu3iy91th6S3wwqiTD
         G1fw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu0gVv7ow0jyG1J/nqeIEFamx6/4cGAzWNPknbD1/Gv2+/sA11BKQjcEaE1+iy0zissvvtsRjmXvpoErA=@vger.kernel.org
X-Gm-Message-State: AFuF++kAcfh6E2GAQVwlEw9bNUu/zmC7f0JOZHNx3iFW+zCMkqSybbJg
	eb1kOKu5EHzcA+iuTrkZm8HiYqXywwJRkARTj1ZmkeFqim8W84UgQT3I
X-Gm-Gg: AR+sD13zkXl+RLP5OmqsJ2IX2k2nLkStD5wdB9cx0yZMqJfr2sopdaTJGOvafaZIJgU
	wZELQ3jDtPO7HCaS93NS/NRpOkF25Fjl+EAI1L7um5LbvR0a7qehYDO/AnX+XtReWaHiPkwRDnY
	v1j2iDym7SlJVYI+JJuYvTOk8ufq0awYj33lIBpaLboeaw5usFFWo8iu/Jk8O0JOlqJHCX/ccG9
	C2yC33eL5Zl7QmPw6dYH1SC0rFtHvb7VOXol1le6z3uuJzmgZsRMsbYH/CSTphu0LOQIZ+j4zrw
	1hRjLd2ZynKatb92ir8Dp7KM4mebZL5TnrLnwxl1wCk7qCQiYpfTKtS+xkPOcFSI8RICthKBiV5
	ucLc6N4SYUZdadiNhxS0abmAJIXcZRZxTMQXS2ve4uBF3/vIbOPemCB+/310iKdMXwqv3W3Y7oO
	/q2zAr5Pw6NbiTf7eqibdxtJBAnx2oiWd1nYqCUUS9806/B8X251Lw39NZgs0=
X-Received: by 2002:a17:902:f705:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d74ddc1f8amr106659775ad.9.1787906966735;
        Fri, 28 Aug 2026 01:49:26 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm3346907eec.21.2026.08.28.01.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:26 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/9] crash_dump: Improve readability of config_keys_restore_store
Date: Fri, 28 Aug 2026 16:48:52 +0800
Message-ID: <20260828084900.1496839-7-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
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
index 9ccc7b5320a3..e82693df73fb 100644
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

