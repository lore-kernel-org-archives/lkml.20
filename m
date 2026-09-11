Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798303CB547
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168811; cv=none; b=oUS6W5NqFAJmg+KQG1o5yo0Q6ZCLgzhxckx1Xrhvvgs4k6rxZ4Bntk8JYsxz4HGanRVJ/Q3auPhhi+E8Ane6VMB27QZxqKLpK2M375eLZTcuXGOOlngb1hLOlGcCXGyTeAr07r/YhcWpuWrmw3YeebExF2pXx88qYC5R7Xa9g3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168811; c=relaxed/simple;
	bh=M4YbOXcrDd5ognpBvia/Fl8AplmHnd7AcjxPujAzF5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wkzw6bi14bz1chOnmvYqX65DlOyZuogdfCcrYJTvenCnBNGQUPONeYcPj9lRQwhKdLPUT6RDLspApAVwuqpzS9CJiwdSO4//5nk46iRnu8t6fe3h0jtzpFXsOeAjnsfqmQmcIvc/tKC+1fMwVVuhcF9OJBRqE+9T5lyQhjfeGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2RNEItg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2RNEItg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so389805e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789168809; x=1789773609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3flXmSiNWtRzfY212ck6RZAm3iuAZm9IH6KLXSNuCfQ=;
        b=e2RNEItg4fZmSZ3MUQpI8QHUT4/xf3eMYauUWdXlzwS9GdObfA8OvGGDfoHQHb+QLa
         50ah6iFk1d6Wz9H/Il9rV2QCUdGCNt4zDPa4dHMzghQKkDXUNQ/qa3WmABqYe/qIamZV
         pOC+a5CvVLACHRlDkpEfxfm5UtGuYaIw0nrsEXqOoEfEH7cNoGjVRTHLHprlMku+kBGy
         7xWXE0G2BGv+x3AC/q36lx9UuPnU7hJeMC5D2k7f/do9UNRqltdQeu9MikxZQFfy8j7u
         AYfQmIgM99+x/Bjdm/rKTlbAku2TNngZ+2/io2siesj5WSrcsqSIy9nOrtGtki1qzm58
         8Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168809; x=1789773609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3flXmSiNWtRzfY212ck6RZAm3iuAZm9IH6KLXSNuCfQ=;
        b=NOYfbW1GCrLgJ9btclSPIqEXvlB7hP4Lb1OWpT7BZe0j12t6QWo0dNZOqKk9H56itP
         6jnmtIJHztl3Ufqap6r4nJ30d1/Nz6TIivw8KfqDes2vpZjSrkEDspT6z0+2Ar1Bqm54
         UjT+30buqIwRKcfuO8o31NU3AHrZhiISEWqbjdo4ldEpXe46cTQvy2kK6i6yJIzxdWvD
         1H34hl+2Q7HMZaR3gH41IcKXwhHdLApEc1N6GIgxTV72CyPg91D5+NF6UL6RBK7sT/Gu
         91DPCVYovWj48LOALBPt0RvSk3bIku+wALYCu3uwGqllEXmvtBK/AiMwrEJuxln3QUYe
         U3qw==
X-Forwarded-Encrypted: i=1; AKwUvBwPchWUUwZMj8bSYqwMzkbJ3uCuMEITrSBClx0uQFVaovI9B4I014DbAPoZKZsIuwuHcMqROxk1CpB18TU=@vger.kernel.org
X-Gm-Message-State: AFuF++kcfBV3Q+0GmCmmTmC4t1zZTHzstmn2UftF2iNiVyfACJNa3dYV
	jXEQb+5ZyktPSPi8t1l0GOS7eVw2eHbiYO0a/3ujWUuMPc4eEQxSz2s2
X-Gm-Gg: AYBFou1nB54nKuIFa4tFcFNgzjkXGCFNonKDW1Lc2/4vEU2Ugs+XxkqiSUuRcmN+N51
	EXa2GEmbAgDvNCmiaqZQRZKblGba5ykefOXT5/7NliOkSw3V0bhU5wZjzyT1M8D1VifivSmDK+/
	VvmZy403Smsg4d2T9Gt57wqDfgcvmUU9c4Zpj0S/iUrZTp0fz1IJoBnEK+2dTda/N1STTKBTXdN
	wv1u3PfqjkC65AVamfpX/mxnRHjPRPhHfosOel4cLfnSxWd2/TQc4m9LmlbSASejo1g5z/ZxPvh
	nS0bsJO6Z41whz28VzO8Ji95qQU5GUVLFwTFv/DtbIh6NfV6J6aC2Clh/yQFHP08LmYtw7XatGy
	j3DC99kSBA3BeALJgMvo9nk0jCDRqnFN7cr/i9FgDgQhyStKd/+kS+9e2Ru4HcZuj2xwlM9hF8b
	bO3VhlI8J+7YWMjfzKb6HiT3XwKi6v/kkjS3NP5HFQyM101bY+srzW3p2DtbhtvZpO7zqEP2p2r
	iyS2mrpVMTGlaMD/Qnl0bpymNk4LVK3I0a+7k5LrGz03nGwwSzXe+TPQyVZnbKm+jtzsrgdHVh/
	k8CgjgLGlUMVjLy9XsGvIZUKz6laanBObU7F
X-Received: by 2002:a05:600c:81c5:b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49e6cc282dcmr2185375e9.33.1789168808635;
        Fri, 11 Sep 2026 16:20:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5765152asm149048805e9.11.2026.09.11.16.20.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:20:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommufd: Fix iommufd_hw_capabilities reference in kernel-doc
Date: Sat, 12 Sep 2026 01:18:50 +0200
Message-Id: <20260911231850.20737-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of struct iommu_hw_info refers to
iommu_hw_capabilities, which does not exist. The name is
iommufd_hw_capabilities. Say iommufd_hw_capabilities.

Fixes: 7623683857e5 ("iommufd: Add capabilities to IOMMU_GET_HW_INFO")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/iommufd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 206fa667c782813488bba2195155b4871b729005..bef6a2665c2b6f42149b5e001f38209764905207 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -776,7 +776,7 @@ enum iommufd_hw_info_flags {
  * @out_data_type: Output the iommu hardware info type as defined in the enum
  *                 iommu_hw_info_type.
  * @out_capabilities: Output the generic iommu capability info type as defined
- *                    in the enum iommu_hw_capabilities.
+ *                    in the enum iommufd_hw_capabilities.
  * @out_max_pasid_log2: Output the width of PASIDs. 0 means no PASID support.
  *                      PCI devices turn to out_capabilities to check if the
  *                      specific capabilities is supported or not.
-- 
2.39.5 (Apple Git-154)

