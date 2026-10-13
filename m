Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5F378823
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877671; cv=none; b=UK7aCpouAz3NVt3Ttz2H3LGtXyFmU8p24e94EDYr5LOkbhUjO3ByEIe3nYBXZ/O4kaQ2UFZTgd2lAlq0mQIqDajazCvPWKysGmfKwRo3pDnpyZBJgproUsP3j2LrqygqpL/c3PObmAy++JyzcTbE8oYT+Wx1EfUwJ+fXp0x+7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877671; c=relaxed/simple;
	bh=fM/EPSJnhQXQN54E1lhVsHA1GPVlzhP1IEC/erQBVv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPCfLeaJOC3dMSdTS/o40KriZZSSRMCFq9859TjQSGwAgq2agLFFYRKUOLEMSZBDNTMWgh5Tpzpz3yBWs/5I5RJvEvYBlBdvpYrqvtxKoW7BvHFm/kpvFD15cA19h/rezt5BbfoI5ifE+4xykIWXMci1JMUOjlW2pXnOwivhBv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGLSS4n+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGLSS4n+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so19505385e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877668; x=1792482468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=UGLSS4n+q9WR0nvpar/icwEKrYiTUwrsoFgLot7JOvU/1RQgF37r2KzS+IkSoWAJxD
         QKQBtQIXUz235XOjje+wZR39Y4fQOWoWnAk1whew5LLMeYnKOr+rE9ymkPhkddZGIr8u
         OVbOch2AfzetY9UmBSNU+UhP/1Zy1ID0RNYEFOCBbartvkMZmAhmKF7yg5ns7ZlZXmxX
         4pJ9Vg66IMCuTbM6VtL2AnpPtbXJ9ruZrGpJSNj9HqrlcCro/hiTxa2nLVwQJj2fDrjN
         Uh+WZNvpjyD2rIJV0uUGX56VZG4O9AquW4DWnSd17G1bc5WuJVSphnR043dv0qOcr8hf
         k+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877668; x=1792482468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=rRw6uoSoOpg22ylod7DUC3nzz0JrhHzH7tAKiWxLfEwkN2P6FEt7ptVWQNtjBSwCMC
         3DSiFhPVgSSj3/lCEPWOpMYI/cnt57sXQ7R+4QAJrOqwbyRHUsA3T8nIljlrotZnMEXW
         5rAu/NJf/uwJ5MNlkvp9UThB95AtJduyMY+hKYzGnjQ3WpkNYbpa0x/u2UXr+idogHdU
         iAUJnKtI2QvRxlwTMc6XbIlBz0tWK68PJxZK962Pvk9RWzsmPkvow0bQSv9FEsz0c0KV
         hEXJATjBhy3w5jWs0YgvoykYP2fr9Np8rrglQC0+zeXTpZQutyCUq012inZceh5s2RKi
         rZgA==
X-Forwarded-Encrypted: i=1; AKwUvBwSA0Wc6D0wd/QIXjkGSkEzVYvvAi9Ic97j7TvxrcVC6raDh0c5eVlfg8vHbgJPjmeVfnGYagyQAQqUan0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHKzQzO7vfLmkUkKsodDCUy3eHdcbmA9W/0KwDFagHmyT5ZYdm
	3zS2p7K1YXIci+TewCAucLt/Vqvl/Cmdng6FLd2W4HNGhsf2Sv2RCOpUG6D8Tl5caoBfAQ==
X-Gm-Gg: AYBFou1wcAfwZuswWZSfK0gBr7pahurdT0yOAh5lKNwOQBECCiYBaFTvzpNC3sSdBrV
	03RX5RcEZbHHQbh92m/nSfYSd2faDni9tIredtR91co4wI5aTx6jqnONhYrruUyYn3fBN3CH7Jw
	TXMDMqP9W7PgCvXDGxOkB2OsLklGndhOyq/evnQz4Q+lwuXjawwislntjnTP6V4K5vYe/03dBCj
	iqTOsPxXjYthZavGVkRdOCWekPpK4GgVKA31KZUXjduy9O7rHkB/dJCthTvQ6kvZk962E1ASDtk
	6KPzwj57KdYLNuW3jYBKT0TKuL9E8c7CtMdTkBqwKM02OP4C/62oJiNbWqP9Y1z3SyMeddojZ33
	vlV2eFSszBifIqGeulKIWJup8YKzUwY16kcHclbDOn8APEi1HQxgLHcsxkc+ZfgHPyz6h4CnQSR
	T6Ob3V7XEe03kCcf1JsfX+UFGxCwJ6DOI4x0oN5kSsWeEdkdw+ZUMK+aPWgedNykoDpBxnjtfDO
	CiJEg==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr274887295e9.16.1791877668407;
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm274850085e9.3.2026.10.13.00.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Date: Tue, 13 Oct 2026 10:47:44 +0300
Message-ID: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_rpmsg_match_device_subnode() returns a referenced OF child
node, which is stored in rpdev->dev.of_node.

mtk_rpmsg_release_device() later frees the containing allocation
without dropping that ref.

Release the OF node when the RPMsg device is destroyed.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa2..430a9b2aa7bb9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(mdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

