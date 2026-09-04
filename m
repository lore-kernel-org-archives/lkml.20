Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872147729B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524974; cv=none; b=uwRt7APFjeAOqXTBfqmkl6CnQZxMs2/+zOGYmYoZODkusUBHvtIzDCg2fLTgheimLjRQl/Lr+QPWxACZfXtMgHqoMKC2eFjvrOUHl8GF9g11sg6ivirMnS+vm2kBxZ4Fg/9wlDYQQQswK3Ugvuxy0dL42bvotI/FiHiflrNUIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524974; c=relaxed/simple;
	bh=0c1ko//hfP9QAeCnKs/jLI0AzW/KEtk3G1WLyauue2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxjONXs9LBddE4N87tKlQeBEpmFWX52nYU4053NsroXSCxna68piEDSYIKvURet3tnhKDGFHGslkSktSgkQfYd2RVt3NQvFuHlpgPWhwcj4e7Mr/M42RIMNPUvsSkl+eiAEaO0zj8uVE0QbaGflBXeFNrTUC3FxQhmm7uRDIdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7+7olec; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7+7olec"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5cad1a6baso8424885ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524972; x=1789129772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWZruK0ZIrQsrjPFytanT6zOdaghlPpGRZrX5Aq6eGQ=;
        b=b7+7olecLkeFqvSYWJE+c5YoeVC3tApGjsbCMN41SEIZzG7O0Mn8Ig+xKXgm70vK2z
         XWXj1vQeuVwTvVa+TuGdGN1Ut4gHRD6Dkh+YbYCRpIX9Ku4W2i0zKMDJJI0ZhMQyXli5
         vnP116cjyKoAWMdI8okEPKMsxqWOZZ3bvjx96wtH3LW0DeJ86vithJwRrO7ctiQzcQ2/
         z29nCgZBLyou9sQ7VmboEGKwVrYjdrXtNg7CrumQD8/AaGbOCJDgNdaplrab6OFIzg+J
         dr8nsD2322hKwJ1W2FZC0paEKrSPfGyR6a96Zx9RfqnMtjq25ZoDf6oTSViUDoLyqhqi
         s3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524972; x=1789129772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWZruK0ZIrQsrjPFytanT6zOdaghlPpGRZrX5Aq6eGQ=;
        b=BbuCd8ebRThqvbXszFZy/OvjI2EZc1LwQ1Qfe5hmBFa6gMEw1EHF9LYv57wWEq+PFR
         mshoQZQpp5oO3TQiP71cvbuRO6UgMu/T35akUm1jmYIpwVTMl6Qg1x6FHD6FpE++Fu7t
         xbeq92UzTco+zQXcxaE/+su2TKrOQVvEfKz2P2LUk1P7XpVXLRgbcgJkU4n7L/M+Vgds
         wsAziS5JuOIHEWkQitY8e7WyFiJyXqqlPARQiKUq+F2vWFw2Pavhltz5YpwvbTl+YffW
         8p9BhZgX7nZ3Kd9WPpguDKvM4Mxr90zqI96yU822JEn8uow4oyqO1YuzstvoUi/3hsby
         Hz2g==
X-Gm-Message-State: AFuF++nBjiqpr9pPfzp1N9y6fwpQXnM1jEei1qIAoTGLuIRRv9buH1QU
	ctL6i2T1UvUGvuzhih3pf14777z6ow7c6wUqGmM33Ho2ZAKnIBsz2ONfoDw2av/es00=
X-Gm-Gg: AYBFou1F7W4sOuaC9rQ2rR9OfaWpoFk4l7/ZzjAE7hY5EVPGRW5vCFcAf0Xptl+6clC
	hlJp24YPjQTcxHqVd1SCCXS6ih7DKta9wAdt+25ookaV5PM0/LwNCIe7BJl5RvoM9VHiymzI5jg
	y//ymibuinZBTJlyfRYOgPh+Z7RJCjumiPOddjDxuJ+h7tjq1Gt24H4VKYZdpUPASS3XTtKlx6+
	eXQ+aFlmlw+aoQW0sDZccN7QLXFAYSgMp9/C1kGYJ/w+ROx6ja33cqNGEjsPKjCMWSTM5g3U13D
	4rrEs6T0+w8YDtPv0vB3cL7PnVnAuZ41JzRcryxd2jCNFW74FqDZLXr+t0+tvrOl2nHHGt7kZ92
	gQCFl6bnUo+u0AIsXytJEEYMqEXEXlLbYbHxFaxgVIZYbr/CFQbUSKmc3PHVb8bkoICeoVad2y5
	Dvfn9HCLk1RHvuCdrpzpWnM/tDjLGl3oWv4y5NIEp82T7PMC32j4qiqrMgZFb1w1Atssy7vAVxb
	fsXO0/WWyyrkM0=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr9935635a91.16.1788524971597;
        Fri, 04 Sep 2026 05:29:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm6762159eec.24.2026.09.04.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:29:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] configfs: fix typo "atleast" in comment
Date: Fri,  4 Sep 2026 17:59:25 +0530
Message-ID: <20260904122927.34360-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "atleast" to "at least", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/configfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/inode.c b/fs/configfs/inode.c
index 68290fe0e374..976bb48e267b 100644
--- a/fs/configfs/inode.c
+++ b/fs/configfs/inode.c
@@ -58,7 +58,7 @@ int configfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			sd_iattr->ia_ctime = current_time(inode);
 		sd->s_iattr = sd_iattr;
 	}
-	/* attributes were changed atleast once in past */
+	/* attributes were changed at least once in past */
 
 	error = simple_setattr(idmap, dentry, iattr);
 	if (error)
-- 
2.48.1

