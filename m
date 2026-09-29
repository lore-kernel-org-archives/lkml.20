Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89654ABBAD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673505; cv=none; b=pp75priAmRTF74waPQhpKhBEi0gmkIJ77X14+fpO8AO+/DIJ8fdWZdMoIGffGYUP37UYWexRuYks3J+tvVEAQxGj7qQ1jBMorV/PwiHZ1rUZPmW05sPQgjkIIb3xekej2t/pVV+J5+9uRML1jXboEZqp01SR1pzggEJYxxD4KzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673505; c=relaxed/simple;
	bh=bS5Bl0xa81rzIkxNbApegWs2WZzqmBmCIE8TNuw54Pc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NaGg4pGzMRqtMvTTL6pYT4l1c8DzAqj7unS4z0100+xtciYL9u1zWxbWaglSU3N8DFuQRS0dbRL5LyslDDmZ4jGk8TfwYYBK1fsbLtsOaHYqZh/kNZQycakj/O9AKPLHruI/pg8icTlZCnrhguHYtS4OBCFMwROCrIUSneM2y6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=j9O14ToK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="j9O14ToK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so1383756f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790673496; x=1791278296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwebXvzDIraGE65KpDBsvLxOFDUyckzx1+RkdFrULNo=;
        b=j9O14ToK61ZEHyLSgktne67vMgvUXX2wobpBc+69iuPOYNrv/E981ATSbE/EiS2osg
         MNBxHeafkpZCPcndngKT+CawhQHG86Jb8xeHyfIF6/StLNC8rMTSREiXYlvmagE7n39w
         2ZWUOXVnJghxTJORPyyE0WP/ocnUf41m2s/eA7ct5l/TZGkL/lZYj+TOJygWPn3kg/Xz
         uhme4ygPKWH7fxxIh1KQbm9gfWIpc0L68w77OtNSQt/pZ88Kb42zhYd+7qAmqfKIo5db
         3I7urDwhDfW1gtmKvnfRuJpKbgy4WoVxB+4iIdVX2LcuseZkEMBZhMsb11IeEvHfFVHi
         hpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673496; x=1791278296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwebXvzDIraGE65KpDBsvLxOFDUyckzx1+RkdFrULNo=;
        b=MytSCgcQX9h+47mp6FNIowTnCCcSydbIWise67dKVg4DmRobXClebAK3w/h4qnD+9R
         VSVdVjQH0joieQ0IcAth5aQC6d+JwAeNhzXOE3aQXuJnaGdIgTfcAu+lWWiqkQ2jkEmj
         l18RiiJ+jcMuzEgo/N7EziWQwiWJFeZtu+p+bpML5IE1zEMcXIDr/HgIFjZzsUXGxicT
         h3YdNOiHAYHASWz892VVA0CZrMrHFYkwk1TUlQBNUGClVfSMcTbH78vlUGzZO16hbQEf
         ZAoV3Y2JYSq399k5V5Yhu8C57Y/eWRdxU8du2rxaaVpfTcnG+8AqQPJTTt2FEnCtyY+m
         aFcA==
X-Forwarded-Encrypted: i=1; AKwUvBwTZEIclTwJ1VVLWJO3pvoxfsrojDBu1XC2wcewzrNK5lid5a4pmTJMa8EEA0O/mbQR2+z6EP/lHCVmdzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcBQc6odWBiaVLk4KxUWdEiRbbDQqwGTurJRujExIfa00Ldddi
	G2ez9mKJ7UD8A+GSaAnlzKmmwc71RPJT/B2xSD27OcyfM/ckmVbS8HNA3JegkgLGiTlc
X-Gm-Gg: AYBFou0vLU1turVpRKQnxjJrmXDMjX+b8IY4+5sBBvJkqJ8DYMrHbdNWUKy4+XsB7CO
	+GsnPP2LHYk/2xWO/GnqzBzhxamQVyd9gwBAe8CJ0svCBR1ABzB0D3dSi2hBhwQiSlf3OibBau3
	S3hFfUg+auFB82HPzPcI6hU9BuUJ4066i1l4CgtD5s/IMTbYdLFfZnWRW8QIpwHes+D6QVFaBE7
	SmAwVZ7w/+YavS81vhRzPlTgqTwd3+du1o9zNMBuBbBgpJUpwnO+JbaokeM5CiCPmJU81o4KwH3
	KbH0dwrr3oRGWfWAKTOlaFZ2U8XmeLG6ahFYmCaDoxCC0MXDzJO8CRTyJBRASyzHY+dxJ7OvORA
	I66Jzh2dOSCU0bc4+2MtJMER+9HDkADTMworp5v/BzNaCEGBqwelLycJKpbSbUDa+EMwvgiQlAC
	qSOg5emfW2I7uZsyoE9GBlCtqGnLYHwZ9OiLL5wNeidadNLEzAcxwUWdX2n8HGdHA5NuDxuCEEj
	U5i6WbePncxrI+tvY07nQFSQGj5
X-Received: by 2002:a05:6000:1446:b0:487:a87:24c9 with SMTP id ffacd0b85a97d-48af1a8f14dmr3594245f8f.3.1790673496044;
        Tue, 29 Sep 2026 02:18:16 -0700 (PDT)
Received: from debian12.ucl.ac.uk (eduroam-int-pat-8-79.ucl.ac.uk. [144.82.8.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af51c57a0sm2155723f8f.15.2026.09.29.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:15 -0700 (PDT)
From: Diego Oliva <diego@bynar.io>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	linux-cifs@vger.kernel.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Jeff Layton <jlayton@kernel.org>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] smb: client: drop the redundant name bounds in cifs_filldir()
Date: Tue, 29 Sep 2026 10:16:36 +0100
Message-Id: <20260929091636.2618227-8-diego@bynar.io>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260929091636.2618227-1-diego@bynar.io>
References: <20260929091636.2618227-1-diego@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cifs_fill_dirent() rejects an entry whose name extends past the end of
the response before it returns, for both of its callers. The two
checks cifs_filldir() applies after the parse can no longer fail: the
one that commit f8cf09a53a0d ("smb: client: bound dirent name against
end of SMB response in cifs_filldir") added tests the same name
against the same end, and the older one, which compares the name
length with the length of the response, is implied by it because the
name starts inside the response. Remove both.

This patch depends on "smb: client: fix OOB read of the resume name
sent in TRANS2_FIND_NEXT2", which added the check to
cifs_fill_dirent().

No functional change intended.

Assisted-by: Bynario AI
Signed-off-by: Diego Oliva <diego@bynar.io>
---
 fs/smb/client/readdir.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index 1e121c970685..569efdfb7360 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -1016,17 +1016,6 @@ static int cifs_filldir(char *find_entry, struct file *file,
 	if (rc)
 		return rc;
 
-	if (de.namelen > max_len) {
-		cifs_dbg(VFS, "bad search response length %zd past smb end\n",
-			 de.namelen);
-		return -EINVAL;
-	}
-
-	if (de.name + de.namelen > end_of_smb) {
-		cifs_dbg(VFS, "search entry name extends past end of SMB\n");
-		return -EINVAL;
-	}
-
 	/* skip . and .. since we added them first */
 	if (cifs_entry_is_dot(&de, file_info->srch_inf.unicode))
 		return 0;
-- 
2.39.5

