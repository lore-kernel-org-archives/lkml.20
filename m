Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF413A0E8D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629589; cv=none; b=p8Yx3eQysmCAqZ0dJV5+9xWEX7tlNHCuomeBSctRwVsgaJAR5L4aUTymCY8rN1N6LVu3+U5CGcu72ZFFjPiRonY0g2sVYEemksCrZQ107sPbFQbbZT7tCJzDWI3fDpmDuvqVGeVqLRmM1piM1VhRTl+cHAV/6rqsVNSplHvT/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629589; c=relaxed/simple;
	bh=mU5PtjMmV4lxfiPkXIaDIUNhRMnvQ/eS+f/tszi1Bno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fa9Dk5M+jqa/l9qPqhUKcUIynQ//5el1U5izs7iCmPnDCj52I3atUf7wquM891sOr4jre7KVSjxUWCnTTMGLWyXG1eN/c+kmnAwuv+7lWK5L8NNfY10K2WhtuiaQSRWDQ8PviIzT96aD5bQBk0OWFH0PuyKSAiNVD6onrFWlWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT6TS6Q8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT6TS6Q8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so2375915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789629586; x=1790234386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsNOKUmy+9wwtirE1XH9Jsj581s6JNQM8IbXZP/ifso=;
        b=dT6TS6Q8Efjw/VnZFfl2tHPRoKz5PiFlI/dCCeNW9PDHRAHsLuKTO1jEPs8eWOs1+9
         jP77m2DBhuIBO5jZaDvko6OxQVzO4n7VeGUMm62vubEtTW0Wzf3QBXyC21llDb20nJeA
         DCV9Gh2IQMrNm6/+7iz1WT+FvQIVAfkMpwMFi6ww50P0Qx85FaFBcSFqlFcojNuV60I0
         dxiDR523gBKKY1NdTVLXyU82ZQUm7CRlWoFVHgBaH1sBsX6zWwHToc5MUaNRxP2ItB85
         db+8/ndENIpchXGzEqQSyDb11na0SkKaClkeLkqRVU9xbeh9FEnKXdxVXi2AUfFkq1NY
         LSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629586; x=1790234386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsNOKUmy+9wwtirE1XH9Jsj581s6JNQM8IbXZP/ifso=;
        b=flXKzGcOCf/ifBLivvELRcaHmyz0O1cF54o/oS1FrQelUTgLcfrYfO4qAa1abfCpNL
         nzznDeI/LqswmO960dUBoG3FUwmV20nZ59d4ySasuaFZR8+mmBQwf03xBxaZRPWhbD46
         M1OiDBxzek9fmkEIJ5Cfv6RdLKiggV/+yscaCcwrRWrnX3gDJjQg/i7GaYvXW0y60BuK
         q1jPVIFEMHWlxoUlwNIH2M/zEnmJa6M9MzHAR1wJd/q0hO/BT3wq3iVzFpE5eD+2yFKO
         6sK/3EJ76XxmtNlCEBHrRAIMU8u5ANjXMof8zITbk676I0XvgPA20qQ661j7lrMgg6bh
         V52A==
X-Forwarded-Encrypted: i=1; AKwUvBw2CQiam1+V+mqqVmLxJERksAANjRNK0VX3/EIeuCz82axz+UxASrHGLE96sRB891zczQcdnFZquvQGgTY=@vger.kernel.org
X-Gm-Message-State: AFuF++kbfUz9+jVFvKU1k3HMVv3k73dHmNvJhlg1uycOcU/UNiFZB8KW
	RLmo6CkgQZKqF75KiNujvhIMOE9ji9Lomq9qJm3NIwPlTUyIBnjPIcgf
X-Gm-Gg: AYBFou2nR7/goDNWAysj8l3PIYfsLN135iXjkawmQPpPafXKqz3Fkcl1An9elN/qzPx
	fauzMdl7oXJ82AekeJqnqVZXZNAseNicPTomNIpcLiCOP2aA+rbLeqblmfBtCAmh3xqqw2MWMgh
	j2jQynw+xX2f99DfymO9EHP90U6f6kszNu9a7JdAUkOBNC4y0gktZSdqWOILjjzZsC34PgZ1krl
	i0VlD9SPV+0pQAbblxwyO67vBpk6iKvVDKvIirBuseNBtVB4lEs9eQrH07kVa5y0cSI0kEZNqBp
	UbmMEaWyx9lkUnPtI+8cOP9zB1a1BJe1pMw6//QLUhKP1cmgMpD6du3lm/51rJqCMGsyEJOo25F
	KVBdv8hvHBNnh1PJVvNW/JhBCEaOujqHtCQ7BedwuPlZtj515NhQG2EJ9ZpxreViPqi4kDEGfon
	HHFVEK5Kx32uTwtmb1Pj3A+ZlNLhISAU5idcIl5Npxyn97QouBGV6DrKB/3yJfanGwI34i
X-Received: by 2002:a05:600c:c168:b0:49e:6b55:22b8 with SMTP id 5b1f17b1804b1-49eac463871mr64369645e9.4.1789629586166;
        Thu, 17 Sep 2026 00:19:46 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm50324175e9.7.2026.09.17.00.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:19:45 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Thu, 17 Sep 2026 10:19:31 +0300
Message-ID: <20260917071931.8063-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(1) with usleep_range(1000, 1500) because msleep with small
values (<20ms) can sleep for up to 20ms due to timer tick resolution.
Using usleep_range provides a more precise and consistent delay for
hardware power control operations.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8..1d3262413 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 1500);
 	}
 }
 
-- 
2.55.0

