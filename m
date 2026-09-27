Received: from mail-dy2-f34.google.com (mail-dy2-f34.google.com [74.125.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E920D304976
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519711; cv=none; b=ZRZ+6tDXmphPPxvPwTjKu4i0/QDmJ7q1nt1X2gtHmHYCNuLXDd6a2ox7ASbZGl7XhAh56wPKtOeEvf3vz0PpmM7RJ4en2AkuaE50P5TmC72y1KtxCyGH1H3DSuJu0SqzeuCp2+qu1aeGV5JtXvMvhNHrJZeZ5c2byvSVem5Chhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519711; c=relaxed/simple;
	bh=4LkSGhv80+8xT5T+h+KGf2s1tMeuuZO+fNmtm6qHVtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MYhwYxuSMt/++u+yf3rKclb7VerCJ23m5/m2vTLGgyRfmFBbE7chdOlJGmf2y8v/lXOfjx9Ux0x2edBhQ9C008ja2igM/06Q2C7Q8h5XS+zKFvojUBu4R4vdZwJuKPperO6/i1JLrDN+ULsRn+1ZuNdLUNaEpd6O/JT78OocbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSpaVUlF; arc=none smtp.client-ip=74.125.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSpaVUlF"
Received: by mail-dy2-f34.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so3246277eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519709; x=1791124509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6KJjgfT31XNsrUw/0UhpUQhpjYfsgcxEL3F9C4HugU=;
        b=cSpaVUlFd4PIwZy9B3nh/FiphR931O19u5D1AkuBQQdB98OMVRvD1xs5G2BEpdzboB
         2uops82G49CzY+pcfWhCqzKYebe8VOat/O4a/mxxoLebwt5+4CQSthaBAMr/Fejm7J1b
         k7knZaPfVECqU2zxUjgW1u/BKf/JbML4+tQpaqnm2NIs/UsrJ6g20MAcxhUMw5bGejdn
         eWey5qtXwMo1Q2Q7Upto00nC2RQHUlvj9kFo1h9jILHpgultmTs2+L+k2tXogIJ1OJTl
         TSOTf9wwPieqh84as89qtduQ55OeaO1oCSMWlrq4WS0O5KsVgLulltFfVLy23i71yXuo
         vH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519709; x=1791124509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6KJjgfT31XNsrUw/0UhpUQhpjYfsgcxEL3F9C4HugU=;
        b=KY2W1HnsFtDmDkYM6k3qLok3w/ppJVkIZqd6/iHS2eXjdsbWDTlocSEmFDTe5uVH5s
         Z+x2Ew9UJWzhQHJdAUUVm/hd4ZMxSZiXxmsE++Dx5uVw7VEaVP0yGdapKgS3GvBJajF7
         3EF6Zq/c/uR8HyOA0+PCLqtYKb/JtimvoK9I7FKEpQbhs8aI0ytrGYHdooNIGROoJhRe
         KJ3v8hVbKkxp5GfIhNvhZAoSFEFUYObBG3rX0lMjIIgNT13VS8ME1rlfpgyJ3N3Ab19Y
         LMqysdR7zyMwM4qdg3K1CFg31kSCD+K55m1VofiELV5Q2QtskQHc0/JK/y7wIpfikcnh
         gNoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0RIFP0doR0sNZ0PSxMDVALb3MCxAwbaMFtuiQHS0xOwzHUX0mKBiH1S3Mn46BMUuucMsoGAX94l0zUZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL18Q+I6QYGiM3pf0161P1I0Pd/3H5r9FntvqK8VvCx42vAMBnf
	smhJT40zumLOTLA2NQ1POHhkdbEjq0fhF9siKPMP6ljhKDsGi9Tbn69t
X-Gm-Gg: AYBFou3TXjKs8H0xkNiu2elRa8lKQ0Qvqel5tNqb68+4+PmAFsCwizb4fU/hnzRUWeh
	F67Iep5n2kfDowqUSmr2ww9VfvWfeMu8Zr4wGRkgKxSGQSSCtt1MtMWKVI3x7h88YyV2J4DLtlQ
	RaD2qh4fU67X3Jgj/9mL7xRP+6xDeF7ChmsXvSKjRmdRwNsiknajJR/aaIPfoPY4Z+PRnk7zoPR
	Do9nETn/BC5aS1mr9+jRta77U9qoN0Yk2EHKX6XMEI7qdhzp+hum8bFOdqASyfICub1899dAm0W
	Bf3e9H9JRP/yOc2rbtFkDcLu33sGUVMiB1DxaCdqiaz9FhgJfdmlXzHfrsaLOEGLq/8FVF6WCud
	NaBDUUWfbuYNtbDhjNBZnMowl9PSup2Bh2QAT6f99x5+KXZY9RG5wKb5Vbk9HMux2cfWWhzkQLt
	Wv5EwgbKN/iMEtFqhX/LydC+1P3UMVuwTp6+kmdCRsJpodROLK59HD7RQ/M+Btj+NadgX08hPJn
	jkDIi1vBAI5QbynfIlGR6kIi1y8fxllC43JaCu4xb6wEy54H2mTDTdVHVg6
X-Received: by 2002:a05:7301:29b0:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-3439eb1a517mr4241834eec.26.1790519708699;
        Sun, 27 Sep 2026 07:35:08 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:08 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 08/12] powerpc/pseries: Annotate the DTL debugfs read lock context
Date: Sun, 27 Sep 2026 20:03:49 +0530
Message-Id: <590f421ed3946c7908783d10de39a9127c4cebb8.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
  dtl.c: error: rw_semaphore 'dtl_access_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  dtl.c: error: releasing rw_semaphore 'dtl_access_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to phy_attest_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/dtl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index f293588b8c7b..18c597210103 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -177,7 +177,12 @@ static u64 dtl_current_index(struct dtl *dtl)
 }
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
+/*
+ * On success the read lock stays held until dtl_disable(). That covers
+ * the whole time the debugfs file is open.
+ */
 static int dtl_enable(struct dtl *dtl)
+		__cond_acquires_shared(0, &dtl_access_lock)
 {
 	long int n_entries;
 	long int rc;
@@ -225,6 +230,7 @@ static int dtl_enable(struct dtl *dtl)
 }
 
 static void dtl_disable(struct dtl *dtl)
+		__releases_shared(&dtl_access_lock)
 {
 	spin_lock(&dtl->lock);
 	dtl_stop(dtl);
@@ -238,6 +244,7 @@ static void dtl_disable(struct dtl *dtl)
 /* file interface */
 
 static int dtl_file_open(struct inode *inode, struct file *filp)
+		__cond_acquires_shared(0, &dtl_access_lock)
 {
 	struct dtl *dtl = inode->i_private;
 	int rc;
@@ -251,6 +258,7 @@ static int dtl_file_open(struct inode *inode, struct file *filp)
 }
 
 static int dtl_file_release(struct inode *inode, struct file *filp)
+		__releases_shared(&dtl_access_lock)
 {
 	struct dtl *dtl = inode->i_private;
 	dtl_disable(dtl);
-- 
2.39.5

