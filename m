Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56293955EC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523802; cv=none; b=KMzXb6ur2EEvkGPU8Tp34we8DR95EtIMj0P1CwNR1MDYC92rt60KYtQNa/M4Dog5qS9PfLJfTHpSFTpdikvwAOLbLbylaI/CjdVXaLOi70i9+PGlv03LyEMcYukmViiqLExd4tZ86I0kz0S7IFiAFzf/vAg8OPGa4t5W3zGKy5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523802; c=relaxed/simple;
	bh=Q06VFh7vLPuALGTWJh29VpXymWFZBQUrxwLLTRWbCHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLQmc3SMrYLdclHN7TdfKxkUA8tW7/5Kpm40nLa7LE++RSOcuCBAQtiWVMG2MGUlpJgbxJzcPgQozVRVGY0bKdEXx4iar7XoGskIQlNhQpe1FRDOMv855UdlxJ8LK2oMS+oMvj40JRgCsqQHO0MxDJxgl3Bm3EchuTs7x6fxHM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVPF1DwC; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVPF1DwC"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1b766bf01so407775eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523799; x=1789128599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wttTgSpkbxiGhy05jBHXKN+aAdyxLXMiamMkdTHbJKM=;
        b=sVPF1DwCJY6Q0dERnSwQC6J7um0nDKOaLp3b5+LN9GHEkAMBLX5V90NYgkRqLZLp3e
         rK6hZyXy/8l7wBjWdMUXovbt0IK1SWjnxISeriHmixi55G0WLypyKpvrZKVo5OdMTJIX
         9aoynM9GzjZwJe5hZBTL8CqA2VN/xjtB0dOskN7OaEGkC+JIBD7vGHwVIymZ8dy1/+4j
         EF9dyUdb5uojR8nFFQuzr/+p+TIQpdCYDl8UN3whUHy0lIYSbZw5OJTtAIr5YkJJ3mPY
         8Jql+TX1OW9Sj13VtyS85JFhvfLbsv2FZY7LQPWQGO2fNbaCoBnXYDHNn/ubAWx73sty
         sPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523799; x=1789128599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wttTgSpkbxiGhy05jBHXKN+aAdyxLXMiamMkdTHbJKM=;
        b=sPZ0ohGNXVUflvm+tjKZdHIBwzcr3WB8EqDoxpGZPxafoEMoZtPGplaGJPs63E3AHI
         g0N6EWwn4xiuCBvQounXe+TJ8+YQCfQTi3t1FeEVGUjs1+On6QRd56Db4x4Uw1WNFNiA
         nhCzgvq/vv3YPCeEL4HKnbVuqN9uxXqbFUvtE104otsVc2t60UACTtI1sjy6UikqtwGT
         SWppGfKKkCN7F9anxyyMh6p7hPjD0+DqVzhdR8WYyCWGva8j5ziQw6sQeIHWIVwgP770
         a1+FGmMLOOqS38iJcUIpCyxJ3W9bd1IbdUgvDEbe7JVq3w8Z6+3JDWwTXHYTUEW2acVA
         GBpQ==
X-Gm-Message-State: AFuF++lWIl8ZCU5MwlmLOhzxJCGjOanuu85+g7U8wPp/DD/tmkQ8x/ac
	VUa3qNjkwfDzSJjx4MDYHWU9c3IQ3uJcBg0B40pH/jeeq3HQdBKKyN+9
X-Gm-Gg: AYBFou0VPKCyMjy+1EM0rFVZlmefml92dQ5or5FYRSPipJq5KKDEFQl3FBASO3aT6Ng
	uxttXJF+QnIqmLf19p2fOJHlAHHwKiqAAdgLGpuDLihf9/Q8Ag79PWd7vCgiqMQG8NU6peBzu7j
	2KHcsX5maEYTGaZ1AfFaDLbUkBh2MMO153TGbe4HsGCibwL+IoDRx5oUzGjkzIUJIPPgNHx+B4X
	S+j0IBhPzaq5npw6xjsz36+oB5dgUP513CZvnTjEcxp5UWWDgAyZbO9wUVet+WKVdFzLNNN/PV4
	1i1tW1aUS5oKxJmSYM1fEyIgO7IpwSgZTIbBYqaN9oGMMp2PTZdGRrCsPSQvi+yqg8CB4258VTp
	Kn7GMXjmmzCTHnbuRxqzIv6NtoKouxDNL4s8R834I4ypioXQRfawpP9voeylLmJCkPuGE3zOXYq
	8okqOZ8QkV4v5L8Er7lIRvTg3jxlDfble8a0/FMqCHcW25VxNM9FYQI8sRHIOtNuIQv2rXHLTgM
	xt0LeRxR5BBWM+qRVuuUc/ShA==
X-Received: by 2002:a05:6820:179b:b0:6ae:9815:7c8e with SMTP id 006d021491bc7-6b6fd2cea24mr4326197eaf.21.1788523799429;
        Fri, 04 Sep 2026 05:09:59 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm6511404eec.26.2026.09.04.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:09:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Jens Taprogge <jens.taprogge@taprogge.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	industrypack-devel@lists.sourceforge.net
Subject: [PATCH] ipack: fix typo "informations" in comment
Date: Fri,  4 Sep 2026 17:39:53 +0530
Message-ID: <20260904120954.21119-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "informations" to "information", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/ipack/carriers/tpci200.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ipack/carriers/tpci200.h b/drivers/ipack/carriers/tpci200.h
index a2bf3125794b..d0c13b8b7f8e 100644
--- a/drivers/ipack/carriers/tpci200.h
+++ b/drivers/ipack/carriers/tpci200.h
@@ -136,7 +136,7 @@ struct tpci200_slot {
 };
 
 /**
- * struct tpci200_infos - informations specific of the TPCI200 tpci200.
+ * struct tpci200_infos - information specific of the TPCI200 tpci200.
  * @pci_dev		PCI device
  * @interface_regs	Pointer to IP interface space (Bar 2)
  * @ioidint_space	Pointer to IP ID, IO and INT space (Bar 3)
-- 
2.48.1

