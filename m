Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74830CD9E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519725; cv=none; b=L9LVAkj2STQk+wdTM3D0SusgI9DEwgz6pOQHne2UmyUYx8eV9WQs6TWCsccPNTYhgLX3RBbx07kXpInh4fpwQcu9nlDWKcoqdZxyxUl+xJAfABnD3eRGRHKdAMO8SUw1AamHDAUb9qor4c9O/zHg0H5D3jDYxF7HiE5nZohjmEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519725; c=relaxed/simple;
	bh=jjAUYjRC2hgEC015YDqmq/XZMGU1lr305zzoYSDY5Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pnkI2UwRxyVk4wk4pKKaRR0uIcXJDTFDwWRTLnIJ1BKp+whAThxyaoHByTUQKqnF424aKXjelp020Ff01VIuW5tYEym4zgw+ExEVNaTXNbFoNoOmWXPX6q/ke7euJKzKDbOrwxQBr1i2UHQABamXq7RkK3Fzh71lpRmAuMuEPv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn5Qmsn7; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn5Qmsn7"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3429bca3880so1762505eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519723; x=1791124523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=Qn5Qmsn7r5uXVh/MSWVRFMgVwdiIc6kack7UHwN9VR4jGqsAMeDDEg3S8B5eDVYFn+
         u4GRwxwvqZl7WoUYknDEa/1S4Yk0QZUodiYcqA0Ap8zZQg4SxcUml1cUZBpGRZHAfFTW
         sDkbFrrZPdw3+0341RPninfR+WLhAyM44mzioCj12c3ZtzKljiG4ND2MWsdow31LJOks
         w+ihcGBFnuS4UwtdW17x/smrnEgh39Vjihk7bOtfMwdMtIboQELhyloTNrWzhzZmzf6O
         SSiEuBmTdU0s/6KDa6pP6U92+WEONeXygNSu8riC++d1DyDweM86zfyPaX3hJkpnI1f5
         8Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519723; x=1791124523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=bf6DMaZtsj4ZxJJG65IGXVLFWyokdQ6VdWQGKoeVWeWA74nVR3dvykUZXxBaddkLdo
         Mo941t4Yn5NbcXzRi53JvGYPMsNXKVNBL6KHFWk4IrDnc64SoNkAqdjVdixOBmroJTS0
         YIf/PyAjQwAFBM4XXSniH8ZmWSLlqefFEQVnSqB0ciHPBBPlcOJZjtP749/o0JKRXPeF
         Ao/j7GOu1X1iP1hiLHcrsF6Dso2rFZpEB7B4lanW/dXIz/mKLX43S5Pw4Vy+Xqx+ef0a
         zE1jeNKWwhcRK4iycmbaMGt3k6RsFtYrKRjd8FvoqA8OPJZhPv3xDDQLyiQpi8ZahcY8
         3zEg==
X-Forwarded-Encrypted: i=1; AKwUvBwkLCaGZG9GtfBsfk6FfWYP2Gzs0l0h3ezVclegOWqgE3VLV/r9Nxcnxb5a1Hzc5FJKRvcATOzG/J18kaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW6bCVNq1vXVt6XmGSSkogP7d6VUgb5XJm+9rnfMmvTdUgchbh
	2iu9WMyfcRrSTLwZTyyUm9Me/bD9N8jru7JKy4II22bfmXFl44xjQAID
X-Gm-Gg: AYBFou1pdzWNrYY5wWmuRzGVgs2wyAGlhrqJzXppsFLNqLvkyiib45xInSwUBjr4M9k
	eqQCWY+qgd4ODgIEItZ0+opolgIolRKwudU8iM7k+cUElbKkPAa9I22GfeP1XQpNzxlIY92NbNP
	gOapIKJZ0GSxNVuc1VvRspdWNYFCKn74jCBVlb+UiYAkXMSU6X3zGuj49j+08YE/dsYmdi5ofuB
	y/1VKBAoziZNbgJwZZn7tnE2lYNx1M/HZaMib1674m/NV7Q5WEgBlrlavF3pK+hHaAA676MajMs
	IcS9fV0aup37DGzUn/VRmNjdW5b9CcGYxh60F+NGVCcyJ5SXdukM6JEnseWOHHrzB02bMzSktBB
	K6qrRuHFZua2FgiYA474FWL8rKiQBikB+eAr6d33ksboAyOGJbho6EWaqb0Of6BboabJnOtGe4W
	bZgzZGa3TrvngSd9S5tMpqDFB7hroZ7WlzE7R2wZ1Q1ORJ+N7wNozxfU7NMTm7RzLUNjFxsInPV
	RISmRdYHUNMIrSakG2LtvcmM7qSbYwuYsUbTxmASUH3bDMdRy3hNBst/9xu
X-Received: by 2002:a05:7300:de0b:b0:342:cbae:b1f7 with SMTP id 5a478bee46e88-342cbbdff28mr5834166eec.27.1790519722955;
        Sun, 27 Sep 2026 07:35:22 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:21 -0700 (PDT)
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
Subject: [RFC 11/12] powerpc/powernv: Rework OPAL console write to remove conditional locking
Date: Sun, 27 Sep 2026 20:03:52 +0530
Message-Id: <6e3f2e429727bc1a7a79441ebb2276a51c08cd40.1790517984.git.ritesh.list@gmail.com>
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
  opal.c:454:7: error: spinlock 'opal_write_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  opal.c:493:3: error: releasing spinlock 'opal_write_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch rework the OPAL console write function to remove this
conditional locking to fix the reported build errors while enabling
Clang context analysis. We could have marked __context_unsafe(),
but this anyways simplifies the locking a bit.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 30 ++++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 1946dbdc9fa1..aea83c4be76d 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -438,19 +438,13 @@ ssize_t opal_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 	return 0;
 }
 
-static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
-				size_t total_len, bool atomic)
+static ssize_t __opal_put_chars_unlocked(uint32_t vtermno, const u8 *data,
+					 size_t total_len, bool atomic)
 {
-	unsigned long flags = 0 /* shut up gcc */;
 	ssize_t written;
 	__be64 olen;
 	s64 rc;
 
-	if (!opal.entry)
-		return -ENODEV;
-
-	if (atomic)
-		spin_lock_irqsave(&opal_write_lock, flags);
 	rc = opal_console_write_buffer_space(vtermno, &olen);
 	if (rc || be64_to_cpu(olen) < total_len) {
 		/* Closed -> drop characters */
@@ -489,10 +483,26 @@ static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
 	}
 
 out:
-	if (atomic)
+	return written;
+}
+
+static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
+				size_t total_len, bool atomic)
+{
+	unsigned long flags = 0;
+	ssize_t written;
+
+	if (!opal.entry)
+		return -ENODEV;
+
+	if (atomic) {
+		spin_lock_irqsave(&opal_write_lock, flags);
+		written = __opal_put_chars_unlocked(vtermno, data, total_len, true);
 		spin_unlock_irqrestore(&opal_write_lock, flags);
+		return written;
+	}
 
-	return written;
+	return __opal_put_chars_unlocked(vtermno, data, total_len, false);
 }
 
 ssize_t opal_put_chars(uint32_t vtermno, const u8 *data, size_t total_len)
-- 
2.39.5

