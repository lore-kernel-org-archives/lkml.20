Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08F346F4A2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518635; cv=none; b=qyQ3k8bpsH82X7HHSt7MIhn5X5S1T/gbnyU9edC4sNEYcBdnTMK8RcpNx/n1de1UGMlD/HU6f7K9M6xX6EHuBFPjN9PYAS8WPr1UE5f9bv0sfIhjfCZixlKZdmaT8n70y37GWnMS9eCJtVLoiKIWN7LCfw8WWCU6hzo+JRIz9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518635; c=relaxed/simple;
	bh=DLM7fquSknCd6CRITys+xLg7qsugo6TkTgr7L0f9JNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1FMIOl8J/gc4/iRN9Q1vIm20rtd4eIwwOnHLRW3XHq1TFmyQ8Icy1EoXtMl3bVq0v1Z4/acvG1hX2ybFjyAnMjXvVpfCaDYn9zlSwUQDCp96nFcIJAa7C1/3Zl3tRAw/aXJfW0JR4Y0mZz3NEGLkzTrUI1nSxt9OBBQom72XDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cp666GyM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cp666GyM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e58034d05so683427a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518633; x=1789123433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y90f4Qhy1HGgsO5ZicgRVy8Cdn2ANq5EgeQS9tClfjo=;
        b=cp666GyM/1a7TDGi+4Ki4N/OLg9ZfFn+3eAVVY+OLGCiEgZcSHzwFjL7p12eFW6wb/
         QnJ3sbzwW5KFdVtTtsx3xhvCX/Ub0lu419soR+RoVKHB10IkM+/0Gx/41avas6PymKZ+
         5xPxxNQZ+u/oyuf6gzTEFLiJmQoJCpzkV8lBWSFmEqmlXMUwmWS5y+BCeQv+9+xf6EhZ
         bK+XpbR1cOH4jndOtg3/xBi2V3a+wyxQJ0AmLH576U+re0j6wc4bYHc3jq2FSbwkAwON
         LqqXr5+kjxJd5UW6NljGUFMVAJ6qa1fsitLS0t6PWFcbPxvF5SQCo3jsVL3hEFS5LF2l
         rD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518633; x=1789123433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y90f4Qhy1HGgsO5ZicgRVy8Cdn2ANq5EgeQS9tClfjo=;
        b=kUW/fKZz9f7WurwLdzSZKMoHkMJVOcWoXxH3DAt7V5WvftGcBTB/BzvtYp1Q43JQqv
         A11zg9gE+HoINghjdUOz6n5tX0MZXaxpBvDbv5wWZHOo1anEcfcBvVx8O1YU28L640Xo
         dYPh3+9DVamjIxamZ1lfcyoIdEobEgv0qgat3O1RLBjAr/hUnvwfwuGFdRfh6ApkTCNa
         noYU1wUDJ3pck3ES4wcbzoJM4hsG1BPJKE3/reYJTDG/icyjB0XpgQQ4g97XBGR90kLC
         kqH/Fh3egnMsr3eBiRpMiolxUS3DqLBt37cqgwML63mMueydUvcORMgU5EOYIHHj+5Sf
         QxIg==
X-Gm-Message-State: AFuF++ncVFwTAGNF/fYsnZk2z6BhEOUSC3JPxoCUzQtKpCTgGq9wZ+4p
	VYfoUzIlmozllMY1yv8iTykILhfT48JqPJOnhLFcbfI8lndOJfKmYlayOTfjv5fk
X-Gm-Gg: AYBFou09XeIuZfXI71BPfbmL9Y6mqJMiY5BjNHihC3Q5BruqC+YpZzJplarDAYQAX/i
	TRtEe5tQLERsl65Nu/HXV9C9dqkaQZv0yWvjvSTGkLIzK/IV0jHuOm7g7e8qEu30lHNpqgMcl/T
	LEFXfgTAWeBYtNre2qHZFyqrx5A79X2QL9g0dCyGhgy8O0w4axvPNhcQnITIT5Rx6bJbP3MnSI9
	pP1QjhR5Ff5wnegWXZc7rWp675tRAzE9i4w0zld2w7DDzcX+BCH1nuC9uPlmD9D7RsaYkBE+Snz
	nAFyfb4fJgYXSfhNPvMs5wMrKFmP+wIewR7jXkF/zutZAFum9unF8eBOft0VSbSnj44XIQ4B2sP
	6u9Wq3Y0lgqcOX3iTsPTH23Ebk89Uw96qBUWQoWc4wld7au65p2crAQKUWhgSiin81ioJnJ70y5
	RWbGSCmKd2xaaMEV/KyAN4RAvGDXxlS5vFn8NA45ZQ9Ysk0R0x8UbCDHeX62vV0SJhH2WnNrIFi
	g9rUgh3jBL9Ej0=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr8771195a91.16.1788518633205;
        Fri, 04 Sep 2026 03:43:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243908a9sm5230766c88.9.2026.09.04.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:43:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org
Subject: [PATCH] fsi: fix typo "enought" in comment
Date: Fri,  4 Sep 2026 16:13:46 +0530
Message-ID: <20260904104347.17379-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "enought" to "enough", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/fsi/fsi-master-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 0884e143b30e..e3064fbe5730 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -826,7 +826,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->gpio_mux = gpio;
 
 	/*
-	 * Check if GPIO block is slow enought that no extra delays
+	 * Check if GPIO block is slow enough that no extra delays
 	 * are necessary. This improves performance on ast2500 by
 	 * an order of magnitude.
 	 */
-- 
2.48.1

