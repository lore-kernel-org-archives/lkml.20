Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D24FD79B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056702; cv=none; b=DYEMlBECfrIVQvXh70W1O87xfzWT/pr1XwzH2sKFnm9Edf90wNzsIOmBg/mykeUssoWDTfojY8c1Nlj0sn5l3zZo08fVOWAykaubK3tL/T0RSsO6xjX+OLFBjC9f9765Zg+/DLxJ2CS3SdbVSTvwxV8pkNuJjiDFrBK1a2tKafM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056702; c=relaxed/simple;
	bh=vPnfJFMVKsiwjLXBFZhMqdpAGPXTdxnn2DfKiehEh3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M75PiEHk2z5ebs8hjg/UEvJaEcnj9eYYDR4Ro2hQzVOMtCwxGNluuO87HvNPOGJP0n5rClUy9dyA5Svxz5nTqBlW6idyxojsgvhWu5GOReQDmeVHe4rD6CLnNVDN+Kg+moUnB9dGuHnbHVmPmZFisiJdbEAVs86596YlV6IbIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLKPK35v; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLKPK35v"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15354aa70e8so5108587c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792056696; x=1792661496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL4a1icRin4PPRMkYQAbv/szvpiExWuhLXPQSU9JcHg=;
        b=HLKPK35v2Pl+voU0ouRMDoEWJJmXXE+xmg95ruEPyFQ7JhDbCO5ZzpbnuH5DYy2yLT
         u+q15exHvDveIZ6eXNmgWuxK+saBrgSdayZmpr9T452oibZ4jHsQlgbCssAgkbZG6/MI
         9r6NMEk7+CDFT933QsgBjbMKtYdqmgCTpxy6EHY7wMYe7wdLpaqkNiNmlaUYawxlTgvS
         GMU1C5rkMe2sQdig5QSlH2alRLsI7MYSKsxR0GqbtCUpTf2H95unXgM/uVm/3OEKDQOH
         7C9igaSIQd0baXvVlkWzQJK0I2Q2b8u7A6w2NESZAdmIcHuJlE78TLQdtIAjrwzb1AkS
         fzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056696; x=1792661496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL4a1icRin4PPRMkYQAbv/szvpiExWuhLXPQSU9JcHg=;
        b=D3+bsccA88ZfD8TCb7FnbWjkOE+c+mING14ZcNqWzRIBuOoLVqpZ8fJq8thZKWPphU
         IeM00NSBH49Vpc5YPnDb/d/5hJ7q+/QGjLqmTsHyePsA90NU6qyRterQy6lkG7dg3YsF
         6I8UrcrZQqaOG2og98roE8KVPBrCetS+H6MQbsEUzbVw9UaybmIwTPWoBfrDW+EIypvH
         kSSQ/WcXqP6JuVH2LofyVH3FajNV9jttw2ra6UxBSS8sxHYW9aZfd1wpg3yp1Zfa0/7g
         QkELzwQQxmnUAWyZLYsMfAo0iPFQFGHKtK7WmdbmjdkjKB2K+hGMcm9K5elNj7HpK8AI
         qXSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoIS51BFSDmcjFF4Vs30uaeNER0ZLofdeUXrUwOYHtyUCi9D2Jglewtr/09DS003B91EPO5zmXaPhvPbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg191m9Jter2ElMC4Rxmkr1fecZ9S32gstp1Rqlc66geOqJ3Lg
	URx1xOWMxYOcN7uokyiGjlOuWsiG1Z3Q3PdznqgbDRLw7/R7NgUDfWydNnJwjw==
X-Gm-Gg: AYBFou0Bcvy7AUdISZDffONQ9FiiRuj6rvrS/yw3+oj5PYl5mgKLMrH+aGS+1Re2wL9
	MTAkER98p2s+CezH9vv3FfiRzN2vX7NKdk30BQJDcNjC26HZTPELkCjC358OIZmiKOoMCRYDMR/
	98AiZOE02PMl0J7E2ple74R5+dmoUc40AKhD6XD/ExKgximPb70rCESrpWKoz/p/aXelYhY9QT1
	CNFAGsRZ2nW1ukECDRVYrPWY6nfVD64m8o51elqPAgzwlPznZKb/3VdbvJW3Oa1V9BFp9YyGjDa
	ISTgPR1D1pGIZzfFxeQGHT2vVlX0GxoWaAROUat4YLrp4gVFNZ2JjzCVoFjF2UJ12LiIF+qrlnr
	wIejFTMFFiyhm/eLvl3+Odt63eS5dgjLbYoHe1MRX9bRZposkRVTe+9GzWFUchM9dapP+JeaIEV
	9A162AWNfID0VwqRgXLYeBEfkHOcsqepIkmu+KAqzsF804UyHEhyhCYV067wYrl4EKq/4Y42+jR
	w==
X-Received: by 2002:a05:701b:4211:10b0:14d:baf5:c40f with SMTP id a92af1059eb24-16a5dee142dmr26522948c88.14.1792056695506;
        Thu, 15 Oct 2026 02:31:35 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm55049282c88.20.2026.10.15.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:31:34 -0700 (PDT)
From: pdsj2807@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: gdm724x: make DEVICE_STRING array const
Date: Thu, 15 Oct 2026 15:01:25 +0530
Message-ID: <20261015093128.1004956-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The DEVICE_STRING array contains pointers to string literals and is
never modified.

Declare it as 'const char * const' to improve const correctness and
prevent accidental modification. Also fix minor formatting issues
reported by checkpatch.

No functional changes intended.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..ac8511b88464 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -31,7 +31,7 @@ static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
 static DEFINE_MUTEX(gdm_table_lock);
 
 static const char *DRIVER_STRING[TTY_MAX_COUNT] = {"GCTATC", "GCTDM"};
-static char *DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
+static const char * const DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
 
 static void gdm_port_destruct(struct tty_port *port)
 {
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
@@ -272,7 +273,7 @@ int register_lte_tty_driver(void)
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
 		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+					      TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.34.1

