Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CCA391E58
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761768; cv=none; b=SgYwDArMN/sxlJ2I5yVE5QiWOkYJZGa+M4R3VrM0aB3NiZsJ1RIt+5eqjR5+Jv9wRx3aEG4ROBWeNrwRdaFqIu1d6NP6nL1kQeMAlfILScvySEMjzrBg0uSPaCovEuMdqo5yV8iqXo3VzHepom7Wd/K4vtfZXSZblDNc5iJfEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761768; c=relaxed/simple;
	bh=mtSmIqXyZYQO5QPo1KQvMrB8/LuZqhaYJLfOvCWymqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NfR37AGVUWoN9kOHxHxoD8EetR1gcaCGufihciYTt+99ltDAPPlw9ePESVU3Ah5SYcPGhnRkgjYhHwDMVd1gNQ/4VZNqLsTXzo4KiJ6fLOvq2mEISfyHQ/L6I0Xah9ayxMu9R4xA56KB1u6u8e88taicRLzvFqIAWdFRTiqHTuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp/PTAH2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp/PTAH2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d8fd3b729dso25478785ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761767; x=1789366567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdG2Bvmu5SnbThhcAJgYn2GjYKQOxh1FtKMeRXlphuc=;
        b=Rp/PTAH2TaWIvxd7BlxRMQ+vlgwj9+N2e3AGENnFr7Vj/9reGmSQH+ELV00EfFG0nC
         sz+rsdwA4ndctSKF/SAmwzEQGelxoc0v8dAkpvxt8gDvPhsYre/lpSuHAlT6F7V1i8xb
         gKU4tdh5BHFP5PXGOfBvoix8qve+V7SzM7PtrCghUrM1kKO2hRZLTr3OXp9DyZlH1ifp
         0DLVLxhhgciFyzvFxBMkFTTnICVxnt+VTYBUus1ta1eK5Acz5gQ9SzyzlyOHyWO8F3fU
         2XhQjCN2KsZunsglxX+nbJxvgyCT1/aGzmzO57fSlwCIKYohuSVph3n4F2Y3T6nzWFzy
         xrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761767; x=1789366567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdG2Bvmu5SnbThhcAJgYn2GjYKQOxh1FtKMeRXlphuc=;
        b=qQJ4rwVDinc4Tv+xNoJrmNq1BHqSHwNDR5wCrn/kZMW1HfqT/qmzjYIZ9sAXLcjSrp
         5Ry0iJWGaeIdQrO0I2ah2koaclQ0cf/h19o78vwPOqZjwSVUwaCDl6v8t9Mq0l2RZ6hF
         YdVmS0DD1N9rsoQU5YPEoe6veZ9cHcnZYI5aWM4/Ht+MzSX9uUFe7T0vYsn3SClVO2Gr
         r3k9MVICn3bDy0agVPWeZ3j6H48JVhNH79MNhGSfMErOVR0eKbsvmEZ1CddxUZaS/kLV
         Aw3sooyhngDMoXnsSxBanzu2alau+SJZkpcuT6s8W1sOs7qLv9kSgpHydQMcGMNr5vT0
         W8iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCXttiYXuf8I+Rq+Kb7I0jy5pVMuGm6RY2KvG4Lpca+BRsRtzccSwmK/0qUwozKWnmmIyGrmppE6bD5G8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvJRCuyYpr0Lwk8jHsgeSPovOi41UiKo6V0drWwUpohRBBWQmR
	jtWdAbCcHzIiqotH6Sk9vyx5ErQCqFLrGps8zUNeTLssfGxolOazhg0xuS8vyPU+SwY=
X-Gm-Gg: AYBFou1jfOVkvf5hfE8b+2zzFgdokN26rDf2+CYSdYiiCF1gWj9bBBXrsvm9MQEuz5b
	0u2eI8ZyAWioAkutjKx1++z7okCtTq0SwWKB6B7nMgqFY70omRfY0Oj1v6cI9W3/QKG1mfnLgYr
	I0cM87q0FnJmNl1xeitifyOgI/qtl8yF5Daz5Tp6PecSlQ9OfE8RfLIXZDmrM8c05RJvaGwKn6u
	yQzV3ZO+jv0jOaCkJZpXbuVEdPOidp5U5y3mnVxs22F9AiXE2sa0cK0Am5V9bP3QpXMAl2UlLCZ
	v+XtAsDZnLCSKvi8VX0qWyU5p6jRZNX8y6L0G7Onl53LVHjoVztOt3lv16xkktzSFSHx/OxKwG/
	pHeLaqzAW9w1yYTGdfgUSC3zJ038cbZptj5y6/4dJrAOQdNe8qVfeR7IbnjlW/IpHjUqAdFE6zW
	02qKCbe2Fiw9YukN2mGLohW9CsPbJ5nkLVIo9KJzCDIGum6w8KVNhMU3fvro1/ptFbQeHKSzCwb
	xI2Y3Jj0i0rVw==
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr33548785ad.19.1788761766586;
        Sun, 06 Sep 2026 23:16:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm8104557eec.20.2026.09.06.23.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:16:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] overlayfs: fix repeated word 'the' in comment
Date: Mon,  7 Sep 2026 11:46:01 +0530
Message-ID: <20260907061601.36474-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'the', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/overlayfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index e487597337e8..20ed85840648 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1520,7 +1520,7 @@ static int ovl_fill_super_creds(struct fs_context *fc, struct super_block *sb)
 	sb->s_iflags |= SB_I_SKIP_SYNC;
 	/*
 	 * Ensure that umask handling is done by the filesystems used
-	 * for the the upper layer instead of overlayfs as that would
+	 * for the upper layer instead of overlayfs as that would
 	 * lead to unexpected results.
 	 */
 	sb->s_iflags |= SB_I_NOUMASK;
-- 
2.48.1

