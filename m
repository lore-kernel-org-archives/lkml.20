Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578E35975
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029800; cv=none; b=qpsUPkLhvLH35WSdotvGM47KovCFICqjbEQGteTG7wf6QEsyBmTj2q6Wtys2P/UKZhLaBtneroM8+RFgmcbm3jPP6eELHYMVOp1c6T6g99jHq9Rh/qc087zq/c9UWS2mkR8LG47Hq0cC2KR6ct3+gPAGP8uYH7r8uP8cO4dtTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029800; c=relaxed/simple;
	bh=2QaBfjgy+OjyNrWT8jTp9HBMm5x2DeO/63S3SR1N5qs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X91ymkm5UxCNn0PpEs5RWqy4LdaQMSBdx+0GxBA+lKrUihbzVxTGGQBk6DhvwFnwJP46sXZ5iGn0Vv2Buw6atzmM/3NNaw/FEPk9eSdXzFShQscFeu2ZAK2ISNFNeyiJtzoylPzibawF2CC+G1lhGYCN2Ko0lRI/4B6uH+CoX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GUCDvNN0; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GUCDvNN0"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e9616ae981so1786855e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792029797; x=1792634597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUNOoS2iIKhfEq8rmR2m7meaweAbFoUqZ53SZ4RiyMU=;
        b=GUCDvNN0mLEvZFKJEPrO1091pQ9kjW4T8oaN+AhZYpjRMJqOSzsn+/x7JcjL0nSVEW
         bj1ImNrz34f/8cmNUnY6lsentgoHMyF7LMMcdjR3W98XZEI4e7qJmuK7QsJzPo2ee7Er
         T7+n8MD+MNFMxp2EW/B7EFumBlc0W9Js4DwfznGa103yRzTzcatGD4VsKBBYYVDme7f5
         ZTOdnD/T4QNORe97M6rpnlK5Xb4+u/mKXzzEzMILUkISyDnz+tD20MBW0WcKQXMBcTkc
         oKhueHGEPtHiTqUxKTsrifCaLTZhxhEf7w84boPNPWFIA8/KIT/oBQmA4EEtoM8Zxm5h
         AIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029797; x=1792634597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NUNOoS2iIKhfEq8rmR2m7meaweAbFoUqZ53SZ4RiyMU=;
        b=z0QaCOzMmYn80tx85Yot789ZuRHlZK35aEPq0AWwMoBCg7A3YEOwmd/pXibniJW2UC
         nA2bv4kfb7BsoMpHaVIa2hEcupCFbjNg8OvlDBqCDhpLQzaKtAvIQwxWmRT/8LmvJHn6
         bIQWP+muKeeOADLPGNubsW1OTsl1A97E+TgvfEjxhMUg4m/QQ0yzd8Dz4IQdFJl4Bmfy
         x1LjFj2B5R/ODThvz4kjsTG9h7XEQhSajyp9t57ogAEMFuWQA17Z7c6gDVWSe7KEQbmN
         U5ImJKaCGcJnVQcLxx17qEbE4FS4SSunHEbSZVrMESaajSLEyxP1SrGh9/1sq+AFe6ss
         0noQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/4DX1X/gAaTbXwplDA00QtGTYoNvEzn1KJHfiupZpb/MFurPgu//UCLjvv2WCRUM4MCmLMqUo2rptzFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQIfpaKEVa+YQOif1DteYxnYQ7KVCaIiVTF/IwnzhArLp3mgwO
	PZEcaSwWzd7LHNujBFyq5jFzpdrADI0XGQEeAJD2reyapxKk+YD3Z5axqKsuEJn2zB8=
X-Gm-Gg: AYBFou0Q9dHT7EVU/Q0s5Wq6gK0PugBjMBelXsBgmDVqtYFgeXet8EdJgBZhzaDmugz
	PlaInpxofx5o6yKEbPhYq5fq81rQPB3hWKoOG0KGCQ9i2I+cFRt2jdxSgekBMHCcGlj1Puu6TLq
	QG+xqj8aEDr2H4PRJnuP4MoJJoX4fNrtMbwn8dSR+u+hUseKkuFFtC5AGBXa445bD8Q6h+MzQn8
	baMQzEDRKZLZb1l2Urg2smQqjqkcRX8yLrE0eRak6m5ymMdniuUIj6vFPPH4VMzXBjY/aNTUTEz
	/Qjo+Byt7HeYVogW7cr3G9cF/r+R9yEhkBKlsB9qiMEW2SP5MB/M4RmrzYSfb97l9zVu+flOj4h
	JXKE0m9vzjT9zJ3WOkxl8ien1w+OCl9uZP6lo0IGuDwHxQmepnJ3WJdOp/nsizgxrZCH2HLc3Ci
	MyyMV8ByJ8VdkdmXMEpVz6Km/SPlb800yN3Fg5/Lk5F64EJZ58aTdj6GIjaVFn7tMZF4n5np+/O
	YO/kRw8O6HlW15rXA8AoSfpn9GbZL3tZwc4hLE8VG1SjOZ4fuMpsrdgHn7IODmTm5OEMeD1M6lY
	HAuUo4cDb3iQIUxy6NIzNg==
X-Received: by 2002:a05:6122:e213:b0:5de:655e:4056 with SMTP id 71dfb90a1353d-5e91f3f5ff1mr6177997e0c.6.1792029797642;
        Wed, 14 Oct 2026 19:03:17 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb3e435sm12477115e0c.10.2026.10.14.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:03:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: rppt@kernel.org,
	tudor.ambarus@linaro.org,
	mchehab+huawei@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	aleksandr.loktionov@intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org
Subject: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members
Date: Wed, 14 Oct 2026 22:03:13 -0400
Message-ID: <20261015020313.946940-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO ABI structures declare their preservation pointers with
DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
and its physical address. kernel-doc does not know the macro and does
not see the member: it warns that an unnamed member is not described
and that the description of the member is excess.

Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
for DECLARE_KFIFO_PTR().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/lib/python/kdoc/xforms_lists.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a537..e81d8a7702cbb 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -45,6 +45,7 @@ class CTransforms:
         (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]"),
         (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
         (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
+        (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
         (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
         (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
         (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8
-- 
2.56.0.385.gd3acb90ef8-goog

