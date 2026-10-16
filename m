Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F14A4F1F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158415; cv=none; b=ToMXrINvzi6lwCA6wRC3bqxBJoPmE0b+298EyTs+8DzZRqdTOdEgiTmN3YBahQOVCK4pX3YupjH0nPv0FBLwxJFuk6Myth9IlpJGKkT+Mh69h4Sg7ZAA+VTAXy6g91Ay5k+p/CQWX5oxyJVIEc1cMVrnD5X4t97wXggsFgHO9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158415; c=relaxed/simple;
	bh=VZm/E86dEnTEbDrP8Tc8qD8DejCMeBMrGyBczaa/+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYTrfYapFKuEzYF/4r9p/FuX/CSQP3OZPNMps66j+IhuYgvJ9cyT3XXvYZ1vQ7PG5YS3gzLjC2Btiwf3DweVaNnGOlC69Tl5t7ToTV8t+m+OgPHDSLT9i8VN2cblOhsxifUdLitsqxUCzS5pyizvnhLTcsArLjGtr4D5sDnPnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0HCQa8l; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0HCQa8l"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5d24ae3ddso984530a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158412; x=1792763212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlNceBhNGGeImb9EhUU1eWWHmVe+LlkK2oIgSPXYbKY=;
        b=i0HCQa8lO83s86MhZ5kDqKZ1rdNR+J5LJWK+zf6WjuqlAmNcLmu4Np7+RnY+kIjP99
         yO4rOjBSLYuTybO9gTxaKVJAFqQq4BnHU3WCYMAlFzsrz6pshqdPjdXLpd/3Gj9gl+zO
         M0bljjgVR+WMiFfYLRNO6xjWN2Am0sECi3LuPJ62fCJ5qAvStR+4GiRdLRBLTtDDat9J
         D0HgEWTF4GgDftytFtlDJ1gVsAXBD46PATxiwWT+TTQhyXkFImz85YfVzbLVa0UGMUE5
         wT4D5vsr96Aiv9D4XUa/oe4AyrqQWJvXsEMhsO6Lz7sFZMRPEAtmtSUMcSY20IytyA25
         oBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158412; x=1792763212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlNceBhNGGeImb9EhUU1eWWHmVe+LlkK2oIgSPXYbKY=;
        b=frVy0zvxsdyxlXZs1CVjvsCiJ2dChWz/85J1iBtw9Cxyt2BAQPbZdCETCiKIC147OW
         XWFYtDkqXkgRYLAFIWxUDtFlUitMTehc3DoSj0nB7VctJmjL/QbaDFvzrGFIGr3aKJ8z
         U7Tp9nQZidXHe81KJ5jnhUwT87oNDo0CKrQc/hXymPIWKroFG+lCpYN1ak0ZDbNtRGy/
         fm3u7ZCllI/sYKkd+htLHuV9TJcT8nbYEe6gce3Fr/V9oRIJOFM5DhqFTrO+SmMoAmBY
         d4TSdsHLbFSFwgQIPS2pyOXWR+ywL5gSgfhbjRGa1S9w8YeyUAkLeLq4cCKMuBhEsrGM
         4RmQ==
X-Forwarded-Encrypted: i=1; AKwUvBytJBWH8pVapjUzfkE6oscrARVfTZeFQkvG5waPhYY/ijpoZMX5AOPvJDxfbVHeNwlBvtcDOtv3kaqsjRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7oc9+WK4TbqNu8ZSvx87fR2/74H7hGDGJb2mfzNAOFbDudbdq
	Dlh7JA8iAM9VVYZxOXXDIVpLrLpJqHKyiJB4ISWrSOxfUngz+kWhFjdg
X-Gm-Gg: AYBFou0sVlLDnVQg+NrfkIlFYI5jxHXYOz1VEr4NJSf6yoeswFFpH8kIGELLlikiL3q
	TrOvb7A92myDob8B2gRF2cnWA3xrl8HjByUOV5l7rReL31ufpWTb7S779MDHlRFvLsSaJqRVvpN
	IN3YaArcCW2ZJ5ZT37+QLaiFdkpmE1QVRVaLv0Hoh4dfi4AQQUs29tgfC7N6X5NiIrIGDIBTAjt
	ZCdGBQWHnvg4oE/Xwg8+uYZhTy4JGjAE5aQNK6DDha8De44mygGNyi2dD7PBUJKey5agT27Kozr
	jePLEBqamq+i0GnOiWk3V+GDgXX0QNnj72YayhDQCsOC8oe9I03qelktNonRh1Aix+axeGVtGtn
	G1Ri/cXWIbv5tIAJDS9SDMlcIooD9BfZ84k5DdovfJMyWru9ltSDRpYhxqbxsOiBP8mR84RodnB
	r4kvbd/zSKUEHckw7sf0+HMkPvJ2xBqIme7xgFRKvDgL+7GCCjco0vlqHWbJeMUR+CgLYa9JmyC
	KrQwLnua2JirazzqzlZVZArzsyihp6ldHnPXRv3+0ClMAJAfjVTn58pLO483TD03h4=
X-Received: by 2002:a17:907:86a4:b0:c34:db91:aa1e with SMTP id a640c23a62f3a-c34db91c6e1mr1507691266b.4.1792158411627;
        Fri, 16 Oct 2026 06:46:51 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm5347093f8f.35.2026.10.16.06.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:46:51 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Kalle Valo <kvalo@kernel.org>,
	Andrey Shevchenko <ashevchenko@quantenna.com>,
	linux-wireless@vger.kernel.org (open list:QUANTENNA QTNFMAC WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] wifi: qtnfmac: topaz: Fix dma_unmap_single() size
Date: Fri, 16 Oct 2026 15:45:32 +0200
Message-ID: <20261016134538.42940-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qtnf_pcie_data_tx(), the SKB is mapped with size skb->len, but it is
unmapped in qtnf_topaz_free_xfer_buffers() with size SKB_BUF_SIZE. This
could leave parts of the buffer mapped, and thus leave memory exposed
to the device.

Change the size of the unmap to skb->len.

This bug was statically found and compile-tested only.

Fixes: e401fa25cfa2 ("qtnfmac: add support for Topaz chipsets")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
index a3a285f17dca..2e00bf68d001 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
@@ -322,7 +322,7 @@ static void qtnf_topaz_free_xfer_buffers(struct qtnf_pcie_topaz_state *ts)
 			skb = priv->tx_skb[i];
 			paddr = QTN_HOST_ADDR(0x0, le32_to_cpu(txbd->addr));
 			dma_unmap_single(&priv->pdev->dev, paddr,
-					 SKB_BUF_SIZE, DMA_TO_DEVICE);
+					 skb->len, DMA_TO_DEVICE);
 			dev_kfree_skb_any(skb);
 			priv->tx_skb[i] = NULL;
 			txbd->addr = 0;
-- 
2.53.0

