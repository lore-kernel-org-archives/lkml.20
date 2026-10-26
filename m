Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015815;
	b=vxNqsvc63OPFJCyAWQd2ulK0w9KAgy3YAsOARtduUOVX5Sq2I9Jz3OuZ2s8BA/Kuow/R
	 ifMQdru+1stpeiNBbHx4lkYe6UOmrD9Vka2QELX5KRvp62ybs9yNC8GlEMENdDrBKAylT
	 14+7/GADviN9BmaA0xQYGw+lKOQKQs7XwWUBKA1nFNtBSZiSf5mllcpaCFrGLi5JcFnPZ
	 M0lfSFaRCHNopN5HKqiHw3Oq54nFpkFyBROFQnwmNKbpF+JhkGo2Ce6h+5Ei/ltbYzsjc
	 K9CxsQHHKbyDbahjyH4B4+dqH4EGh6x59zoWNEAXUeqAN9KYZfFFqG6+jIROeXhG7uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p863F7yqUAlNIjnSjn9uwuB2MTfwUOc9FZgewPikWBY=;
	b=Q/ulJ7Qh71jrXGLorX8OGkc3fbSloWuGmqiBxdNderuepm1DUkrf+btwwRh9coG6boMt
	 vj1vIH+urwuXExhnPTLpVn/pAT4NHpYxNdYqLqLChqqjo6yEtfmYTF76ddDzY631MAv34
	 xIjFxpc+tJGxTqO9VBuxBhe4qvOVIao9UdJ0XzxmSvRo6N0k1SxKbShB93Cv97MZe/Mvq
	 uYkv50Ni4OBALFjusXuP1rztaSV4XbWOWdChLGy5Fx/2u6EviX3C95Z/WWJpf8CB5L1Cx
	 0D4dlAirKwVIXSvu5ONIuqS1IBoc7y/gG2or42LQ6nA+59ap3oQKjupSad3LMDyPqhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Xcha/J6y";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FB606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D45FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xcha/J6y
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2333500a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015814; x=1793620614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p863F7yqUAlNIjnSjn9uwuB2MTfwUOc9FZgewPikWBY=;
        b=Xcha/J6ytYLVg9qc21z4jUCiIqfAiSjlASvyzHU4ZWtwmRnrQhThSfgiCLNpMR+M6v
         PLb8Sgvl66WTH39KuCs9A4RNs4NAqPH3U3YUreb8/34f7dUEQAouqhNnlOTe/b7Qnpu4
         9M4TtT62O6HXUU4/Cfk6Atj1zq4YsKpoaPXwSvaLBmaHmrILZ+winxDCnxY+fkSsHJB7
         O4fhN0HiPy0WEZZ+YS6IkZ032+q7Jn3NleSBB3yYnGCb1HUAFhvYn+sGomYSKxPbEsha
         coaKkKhw1KtilP5QfRzt7VSnDEA6BfoVr4YFVrRBx3yncAwWJbaWMCzTJaHfwxXLZt31
         7j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015814; x=1793620614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p863F7yqUAlNIjnSjn9uwuB2MTfwUOc9FZgewPikWBY=;
        b=W9FdtDWH78QDUTrRcWc2HtwPhtK6NNxwBRz+33YnZQ5nq0eFbLTuvCofyoSMSwu44Y
         rWJ1ErsA8YkeV+6MUaXOb3S1+08guCpCov+MinSFVkI9wWG4CTlIyJ4AkIc669Up1ybG
         WVxwJ8/LOu1IASTOJ0Dp/UD8lJ+9AVLi9Wy65oZgl8s9cBJSxoBjo/g02v6z4NhiLjrK
         eY2wPUkQP/fB8HTG/gbnTkbAjstgyeTptqI/BS7ladAaAifeT8Of9fm07Ha+V8PGxfJO
         9NCBkXLC1AsKZ0UXpnB4Nh9yp6TBaw84Mjhb0G4YVc44Q8srdPairHgx2vHc7okhw2xJ
         AwGw==
X-Forwarded-Encrypted: i=1; AKwUvBzsoXKDL708z6BLUbU2ZsaSMm63XfcRaNOFPZ3h9d91aol6Zgy7MZCXex7cMHyNzqMWSud1wMOvYX8c3s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYItyduoJMggoUVn6j110iEtkmyjERMH20uwcaq9Ms16j+gXVmI0
	uGsDM+2ngtEBDJklOv72JE3b+EvgQ5x+/jW/iB608WeNxpJLKZMVaqVTEA/aew==
X-Gm-Gg: AYBFou2il3L4iTMrLh0BxU9W2ITdq/O/zTNQJaqRvBi7ZqeIoQX8hab1LjLftpac3TW
	e5rWVeed/rT9773pEcx0FL/PBBpGJpZmbHvlIlbiWom5dINbl5KBsD+T5risWuk1jOBDwpKJpxw
	VW4FgjikocS8ERnvhKFNyquZWNZkew8gcIobhi+1vx2+7sDgFmg9v9dwlN4JK8Wf7A2tN6NTlv8
	ZxITVBI9MKOpSZXLJPe1kielWRT1uC8Ye0PovstmJEITkqeu5fXRAP+3ibfTG4NpPMKhr22jTBh
	ULM0oSzhPn5hRQDTFP0MYCqx7ujMCR1miPcfX7pL36FQIUB2sOfDxmyyT0bEuNSR7HxrQDErc9x
	J3jgkElSx29seoRnKcMYfjYTWZysTs2pk8Mfaw6iPZdyMVh2K1C10qWHwskMksfR9tXqCGx2dzq
	i9R6SCWOHH0FDSipHnixJl8LPbkyOo/EwUX+So6CH2gBAc1kaSxjaqn9UfadzQD7B0Ybe7aJp0I
	tapSdOMQM/GjtRkzPqXCkyGTOg7i/u54H2s6SytiSpVbnD9ALndONxRkFpoWfd43jTAbanZ4WQ=
X-Received: by 2002:a17:90b:1812:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3adeac04901mr5445526a91.17.1793015813956;
        Mon, 26 Oct 2026 04:56:53 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm5684433a91.2.2026.10.26.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:56:53 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Prabhjot Khurana <prabhjot.khurana@intel.com>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] crypto: keembay - fix list_first_entry() on empty dev_list in find_dev helpers
Date: Mon, 26 Oct 2026 19:56:46 +0800
Message-Id: <20261026115646.4137906-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head. Both
kmb_ocs_aes_find_dev() and kmb_ocs_ecc_find_dev() call list_first_entry()
on their global dev_list without checking list_empty() first. The list
becomes empty after the single OCS device is removed (kmb_ocs_aes_remove()
/ kmb_ocs_ecc_remove() do list_del()), while existing tfm instances may
still invoke find_dev afterwards: for AES the device lookup is deferred
until the first encrypt/decrypt operation (setkey only stores the key),
and for ECC init_tfm of a new tfm can run after the device was unbound.
In both cases the bogus pointer passes the callers' validity checks
(the AES callers test for NULL, the ECC caller tests with IS_ERR(); a
container_of() address inside a static struct satisfies neither) and is
later dereferenced via ->engine or used for MMIO through ->base_reg,
causing memory corruption or a kernel crash. This was found by code
audit; we do not have Keem Bay hardware to reproduce it.

Fix both helpers to use list_first_entry_or_null(). The AES helper now
returns NULL on an empty list, matching the existing NULL checks in its
callers. The ECC helper converts NULL to ERR_PTR(-ENODEV), matching the
existing IS_ERR() check in kmb_ecc_tctx_init().

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/crypto/intel/keembay/keembay-ocs-aes-core.c | 3 ++-
 drivers/crypto/intel/keembay/keembay-ocs-ecc.c      | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/intel/keembay/keembay-ocs-aes-core.c b/drivers/crypto/intel/keembay/keembay-ocs-aes-core.c
index 660830c36..268a15886 100644
--- a/drivers/crypto/intel/keembay/keembay-ocs-aes-core.c
+++ b/drivers/crypto/intel/keembay/keembay-ocs-aes-core.c
@@ -129,7 +129,8 @@ static struct ocs_aes_dev *kmb_ocs_aes_find_dev(struct ocs_aes_tctx *tctx)
 	}
 
 	/* Only a single OCS device available */
-	aes_dev = list_first_entry(&ocs_aes.dev_list, struct ocs_aes_dev, list);
+	aes_dev = list_first_entry_or_null(&ocs_aes.dev_list,
+					   struct ocs_aes_dev, list);
 	tctx->aes_dev = aes_dev;
 
 exit:
diff --git a/drivers/crypto/intel/keembay/keembay-ocs-ecc.c b/drivers/crypto/intel/keembay/keembay-ocs-ecc.c
index 9bdee39dc..67a69a205 100644
--- a/drivers/crypto/intel/keembay/keembay-ocs-ecc.c
+++ b/drivers/crypto/intel/keembay/keembay-ocs-ecc.c
@@ -208,11 +208,14 @@ static struct ocs_ecc_dev *kmb_ocs_ecc_find_dev(struct ocs_ecc_ctx *tctx)
 	spin_lock(&ocs_ecc.lock);
 
 	/* Only a single OCS device available. */
-	tctx->ecc_dev = list_first_entry(&ocs_ecc.dev_list, struct ocs_ecc_dev,
-					 list);
+	tctx->ecc_dev = list_first_entry_or_null(&ocs_ecc.dev_list,
+						 struct ocs_ecc_dev, list);
 
 	spin_unlock(&ocs_ecc.lock);
 
+	if (!tctx->ecc_dev)
+		return ERR_PTR(-ENODEV);
+
 	return tctx->ecc_dev;
 }
 
-- 
2.30.2

