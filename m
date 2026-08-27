Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A8A8287E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815665; cv=none; b=cvUxRJogSMfY0asbe9eNpqDOD1cDyO6NxOUPNyrgN3T7VtoJ/+XZLvEuXg0PXVdT8f9tlOFvMGQrIog1PWTrWNhRcJ1p0Rw/SjnO1BMZ/DRyjejst2wPhRaGI8gczbZntagSyO1AqLpjcdTD16HkKKm0rKyOqU4z0n5SZ1keBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815665; c=relaxed/simple;
	bh=RW+2FLygnkT7VKSaO3nDahuHx/wOKYtQk2ensP7S75Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6+aaqZnUNdhcR4RqBbG5tX+Go5Bks7M+YmF5JV5GzKZpBDJKSlHN/R3NKgpuiX7DdhM5iYw7ponbCvBodx2PkMERn0XQhLM7o6NJBBKIZ/TTZdVBnLgADTgTevFQsKrNu2/U4r3LxnHRQT16kVDcoMCdGWHI1xs/Zme8MwBo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4KA730I; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4KA730I"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39675172593so1624436a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815663; x=1788420463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=H4KA730IG6fHs1R2p4nUSj+Hpok6dD6Zd8Ij3DbHqbsvjqCXkquc4CLaaGRtSA5tYb
         ddcYs9ZEaJ4h7TQ1C9iQq+/yn+XlLgKIGX/Ia2ZAF6/45jsFTj5f4kL5Z8EEX5x0q1Hf
         fYqyu7ipVheyDM9e1sAODuAAdIZeB9a58kVlGgeah9GiJs851R4c1tNylJb8ZaFWWgdd
         GQIzG0bUYapTzerdza2VUEH5t5Qum5s6PE9SqXITOkObM60r9S2i9UNMgW1MuNfJGDXv
         9u0BDbZ7dn2oLGDJTCiM/ZrrzQdJfH7eE58kKhxqosk0nBCZU8n1+j4q+IuuOfZ6RT6u
         NVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815663; x=1788420463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=rPoKvlxUGIxPaNnbsqiSv5GuQhlha5nsEd0lGOoYwZutdGPHIb2l25Ok8BOaw8qY+I
         +54u4MRjgYymGEg8Odtb24GjJ+K8qAL8AEwd0N1ftAxpsl4K3AsLsd/MJa6f3QXssb5c
         FA2clqnMvMNE7NHE4X/0JcTUTOcarDEtiIypTk13SiUUZOtXi2jm0b8FKzxClGO79KFZ
         2I3PWF576fIfYWzxo1B+rBfDNK8c/9pQfR/qUdKjGCyLWd+0P6fzc+/g5j3TJ27IodUJ
         GV0f6Brl6mK9rqsmtLXqjvSFNWqZ4YB7BLLeP1aZECD9e2x41ntedCNUNgJMSLY2qQ83
         c6Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqGOzTx1zRt1U0Gj5U+bDRw4QV3tmgPZ57lP95zRpfoMBHSoIAy9rl4807kgZDcpqZt+F9wAL/VN5YGuP8=@vger.kernel.org
X-Gm-Message-State: AFuF++mwuNiCYhf1Cgk4GsugoyEUQ3PLVfifLZuqsrKOfdGPxNNomCyC
	5WOaJnuKjfCR+jfTaV77JLzvPBzgZZJYtxT/Mt58zoFiC+NFcvpC6Fp3
X-Gm-Gg: AR+sD12/od2wODDdWtCsxxAEdTR3cXIRJP1Sdoscbye61K1P/scvzP99daq1eXzaDWR
	HR0doAG/bYIbrYrG33PZ3FbYi1cz/52To1OZaZt7b2m+ljKtWPz4wLH/ARIocCPEHsh4jk7NHnN
	3QgL0/kh1UZCY9sG0KuHiFQM7pcQDDioc+hy1bVwgbONcuRihsQEmwESqlj+qGqaRS3X5Q8Og5P
	XXB/mCJF7GzXZPz/85oLzbcSnC6cWgBradxP32XeYgaXfc5oJ5O4n45JHN1QWzJYoPiAf01MYGw
	/rQdP4YtqT7UzNLwYvNXKWJ9SSuHIwj5ISffY0F7peWhGiK6IFgqCwF5CU51u5jYhlmEKaA2jo0
	ZevUdNftDiTgChi1GznHErcZm0jar98XUN1tUlU54L4FgziENoA9ZyKQqDVkAJNW2FuZW0Q8Kx3
	QHRkii52sP7nIBBP5/LZvItJGXCtCoJLBxIIAUtvGVQKgQ+EGo4QGT1bZKLxh2E5kZaZPAy/4tX
	qYKhfUmeUHzQi/zntgbKtZay4V5cvhSmz9qtA==
X-Received: by 2002:a17:90b:4c8e:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3966d44daf1mr21255453a91.14.1787815663140;
        Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
Received: from urmom.192.168.1.1 ([14.170.170.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396705f6106sm1791052a91.0.2026.08.27.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:27:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Thu, 27 Aug 2026 14:27:33 +0700
Message-ID: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
mapping failure") switched back from devm_ioremap_resource_wc() to
devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
match the resource variant.

devm_ioremap_wc() returns NULL on failure rather than an error pointer,
so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
with wcnss->mem_region left NULL.  Probe completes, and every subsequent
firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
masking the real mapping failure.

Check for NULL instead, and return -ENOMEM to match the other remoteproc
drivers.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..90747af237f7 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
  wcnss->mem_phys = wcnss->mem_reloc = res.start;
  wcnss->mem_size = resource_size(&res);
  wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
- if (IS_ERR(wcnss->mem_region)) {
+ if (!wcnss->mem_region) {
    dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-   return PTR_ERR(wcnss->mem_region);
+   return -ENOMEM;
  }
 
  return 0;
-- 
2.53.0

