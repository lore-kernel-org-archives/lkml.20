Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C33C9438
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897948; cv=none; b=dJ4L4eQq6CWUkQEsDZH70JlUlC26CdrBaegWkaF55DS1JzAP6gkk4MnXqezRpI2SDq2NtWNl1m9svfzIlLqU1rupd/HSvQwdH6kaVbRcixzthWqvDTeAUQF15VkPZE6zcRq061rDxCbL2CeJu3N9RboHId4GnzkjqfOLQZ4wS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897948; c=relaxed/simple;
	bh=HLmGXqe+ySXj53VWZvBA3TFv2XIHPD1xjPC0ensRO9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cTuEh2enMOnKM7qSYkvGvC2SGZoe0mLEYxB2yqJ6U6L+sBMmfaVvWp4ZCfDaTWnK4Jyyf7JDUzOvfEwFrTPeevH+clGlM1A7Ax7hkz44kk8c9NEhed2A4Sh92bmhhOE6HKBjaRBHrf+cYMlq06k6kiTh0GJETEFQIc19mQePp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TC4wowvW; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TC4wowvW"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc1d7f6f26aso321890a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897946; x=1788502746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfXDbSO38Ptv6nH8Zob9j+EEhcpNi44GPPmIo9LLCpU=;
        b=TC4wowvW69Ahcu2+B1E5UkmhDs3vlLXD4M1ivnwz/jMaOLteHeEY+YHRZn9WiTxEco
         j5iQd2fLxTa07XzI7WacjxZ7Vh5nrGaSXbU7M0syOgQ5RIK0Lqt1KFi84iMlz0otU7iB
         KuU8RL74WhxLBBztP6m9xpmaVj1Z5FcpykG/0kBFctssDpwmJBDWyKzHVOnrpaSrBLwa
         VZQuTP/iUCLwK5qzUtp0nv+XOiMlIZwxCllimZxDYwdJrTDVS1HUSY/r7HPJCv6dWPOi
         j4tVXWzR3VnYs3DhfoaYE6awnmzmSnRWQGqfhlXqLIb0tn2tqVWKauj97xpbZ8k/1g2S
         y/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897946; x=1788502746;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfXDbSO38Ptv6nH8Zob9j+EEhcpNi44GPPmIo9LLCpU=;
        b=Jc/sVae8v24hyiWNVhIiRIT2gW+BNlTLFeu+AurJeQlCu7io5cUCkCfgm92Z8oniyG
         sY1rfGcDquzVNSCH7vvlzKFBw34MSV8bm7cISpthOySDgtYj/KDhEPRJP+l/2EYt/ObK
         sdEKUtGd5enqqa5FiVqPOUt1BGp++3QR+PzDsC4TXaq0IAnbIjqrBXINyH/JXhG4LSA5
         CXWKki5a47pHNBSg4SQNjKx0PHtL4xbKshNhntBVwfIxBues9+CeWxTAR/CYvv1jHUqi
         xBEv/+6G3QLMRSe9+OUHbiicaI3SBd3y9865syAhtJnN7F0ZdZZiCUGEIrggPbGV9LBv
         IQsg==
X-Forwarded-Encrypted: i=1; AHgh+RrLNNv0BuS7YdiTOMXKbIRSXjhzHYtpItbVcf72H7W/WUAa1XX9uFNdDoXEBjuiko41YWULMeqdzE5Fogs=@vger.kernel.org
X-Gm-Message-State: AFuF++mfRxy54Pq3ZXXG6g4FDnRLDlTcZGIC/1T1FbCSenup/LjtUo2H
	yEEsS03TqpfLiDha4WoV2Ca3Qqw9PqSvJviQp6KTCwp0TG+/ePYFLtGL
X-Gm-Gg: AR+sD13ML4UxXH7QDNzu1GEvOposN56jJluqHtEVkVsbBZxdIJmmRqm0pS/rPdOuaaM
	K8bo9tfN81OdJyz0LivkqQoWCXSdAJozye57j+EmWgJLtB/zeF2skDnYclnEqwfK9iPexcnjbXh
	/yN/h4SzMiSvf10Qp/czU7xWN/1VZDyigJFp8vXOv7CebIdLrP34AOFW3eTU1JtyvioRz8zqcPv
	S00kI6S1tMimHYjo46fPruaHf6zDG4/yzBxUiYSD07TIPlQop5ifSJf9ICqVojKDGsKgrbFfoM0
	GlO8cbq3042fOYhYJr8TOejAyD+04nTqSkfKAl6wjPRwaxykSgWDee/ZgyJM5aWnvfdsWF8rPoF
	4Fm02Vn0hgmR9o8U5RUe+lZgDHkJaRVpL8jV5Ci2QGt/VK2lRUyKk1TUjFb9jx6keKEAchrMRVY
	JdkfE3on6rvh0dvLo7Jkl0QJpQ1HZzA7bA6Wj94sXoYx8KE7RuT9XTlwgWvQXS2N9K9dJiKOmce
	Q==
X-Received: by 2002:a05:6a00:1149:b0:851:804c:f4eb with SMTP id d2e1a72fcca58-8562868f342mr8607621b3a.4.1787897946171;
        Thu, 27 Aug 2026 23:19:06 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fc7ab4asm256010b3a.22.2026.08.27.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:19:05 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yukai Wu <xiaoyewuz.Ruster@gmail.com>
Subject: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Fri, 28 Aug 2026 14:18:16 +0800
Message-ID: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Documentation/arch/riscv/patch-acceptance.rst translation.

Update the translation through commit ed843ae947f8
("docs: move riscv under arch")

Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
---
 .../zh_CN/arch/riscv/patch-acceptance.rst     | 46 ++++++++++++++-----
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
index c8eb230ca8ee..a48e6e575a67 100644
--- a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
+++ b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
@@ -15,19 +15,41 @@ arch/riscv 开发者维护指南
 
 概述
 ----
-RISC-V指令集体系结构是公开开发的：
+RISC-V 指令集体系结构是公开开发的：
 正在进行的草案可供所有人查看和测试实现。新模块或者扩展草案可能会在开发过程中发
-生更改---有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给RISC-V Linux
-维护者带来挑战。Linux开发过程更喜欢经过良好检查和测试的代码，而不是试验代码。我
-们希望推广同样的规则到即将被内核合并的RISC-V相关代码。
+生更改 --- 有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给 RISC-V
+Linux 维护者带来挑战。Linux 维护者不赞成频繁的变更，且 Linux 开发过程更喜欢经过
+良好检查和测试的代码，而不是试验代码。我们希望推广同样的规则到即将被内核合并的
+RISC-V 相关代码。
+
+补丁跟踪系统
+------------
+
+RISC-V 有一个补丁跟踪系统实例，可以在那里查看补丁的状态：
+
+  https://patchwork.kernel.org/project/linux-riscv/list/
+
+如果你的补丁不在默认视图中出现，那么 RISC-V 维护者很有可能已要求修改，或者希望
+将其应用到另一个代码树上。
+
+自动化流程会在该补丁跟踪系统实例上运行，在每个补丁到达时立刻对其进行构建/测试。
+自动化流程根据补丁是否被识别为修复，将其应用到 RISC-V `for-next` 和 `fixes` 分支
+当前的 HEAD 上。如果均不适用，则会使用 RISC-V `master` 分支。补丁系列被应用到的具
+体提交将标注在补丁跟踪系统上。任何检查未通过的补丁通常不会被应用，并且在大多数情
+况下将需要重新提交。
 
 附加的提交检查单
 ----------------
-我们仅接受相关标准已经被RISC-V基金会标准为“已批准”或“已冻结”的扩展或模块的补丁。
-（开发者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案的代码。）
-
-此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
-基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
-的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展
-补丁。（开发者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
-的代码。）
+我们仅接受针对新模块或扩展的补丁，前提是这些模块或扩展的规范被列为未来不太可能发
+生不兼容的变更。对于来自 RISC-V 基金会的规范，这意味着“已批准”或“已冻结”，对于
+UEFI 论坛的规范，这意味着已发布的 ECR。（开发者当然可以维护自己的 Linux 内核树，
+其中包含他们所需的任何扩展草案的代码。）
+
+此外，RISC-V 规范允许实现者创建自己的自定义扩展。这些自定义扩展不需要通过 RISC-V
+基金会的任何审核或批准流程。为了避免因添加实现者特定的 RISC-V 扩展带来的维护复杂
+性和对性能的潜在影响，我们将只接受符合以下任一条件的扩展补丁：
+
+- 已由 RISC-V 基金会正式冻结或批准
+- 已按照标准 Linux 惯例，在广泛可用的硬件中实现
+
+（实现者当然可以维护自己的 Linux 内核树，其中包含他们所需的任何自定义扩展的代码。）
-- 
2.55.0

