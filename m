Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD02D29C8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970277; cv=none; b=dWBsA7Q8UwC4vvM6WziwCXPwFrLLdDWTjm/glNA7ix/uOZGUPYQsHNrUCTfpE6yVcTnvtdyI42zh3faT8qUZBLdnySR2jYBNNdnc3NBNmHs7SA4QAEVhMZzc2vzcfH+L+j2LnmfzRkIdFIo9dxOoGoVZ4ceZJ/GKJCXAu+Os+Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970277; c=relaxed/simple;
	bh=j3858Zc7Gp3EzouFG0+CInLuLsSTmh64aYvsNmiOUV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E3h11MY4XNnp+K5vVfVnL1YYm8AG8vglFXbuFgbNs8qWDxuoeDCBtsS4yjH1k29UIN611Ya7NxstEp+fOZPXvgMIBVwEbomfSKWouhaDyMchP2bGd++6ludgSjO9KOisoNJ3ibsX39yKYorKhKsHHIpaKqOcFZ/I3gCGct+kuJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFNhIIAz; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFNhIIAz"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1cb48c030so976270a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787970275; x=1788575075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+slNTZNH7eKf4SNfKudrYju+TQTUNZhz+DW3HyZw7Oo=;
        b=RFNhIIAzXwciUROKlIWYOh5sEyvGKXMH5oXnGepErn4EhsULhxxfHpPO2uY4TblRdv
         HEktm8PgvKVkigu8iJ/0Gzb2FcUv2+SV5ll8oBJgqlXKV3IJ7dkArgZAPkWDKnPCNnoC
         nIwosAbRWZko8hByWJMA2Gh62c0FeMqs5ycaoJBvP/JdBFFtloH/ZTojYywmVzxLIhw3
         Nd03fuyhsDfrkVRKiykPh+dSqRTcUbd8jPBb98bGP2Mt6uANzfRZf8V5iz5M6sOOn0a+
         4HmAyO2Zap/XlYnZffsu11sH2fRe6uABgqu35AIOrfEQT7RBJ0+C5pzDalDTUPESfS6z
         zuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787970275; x=1788575075;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+slNTZNH7eKf4SNfKudrYju+TQTUNZhz+DW3HyZw7Oo=;
        b=WIE0i/F63daw6WMHz1SbjLUj8NP1gaA21osjId5D0GeYLnMvrc/RuJ6q5GbDEaWUT3
         lQrTjZHvdkFSw02IpnbnFnx2NxhBBE+vBdqa+kCQdJnUZ095erwgd4idapKjpUzgsHMC
         MVCc/kpPpe2BMltyNcHmpiGWAlAKfIsTSry06XIcRMw+Cy9MvEEYKUxLggyUJDHVPase
         4Vqi/gBTEbToYBWCV6RDf3AtgFkoSoEbQAd1rOyyR4NQ1bLtO6Wpt8KTlCcvMJpi2+zD
         jSjTyhCNdvEDYlLryMWllZfYunrP0a95Ma7irOIdRVqOjt2HRvAiDiFJ47P7xUhdh6y2
         xg1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrZxlFVEk5s1Y2tUXM2grtWCHc7N1/KdvpRAUuxTGf2QzlBBupZEvzwnngztbWjs+eIhxv0DZCsEWjjEpw=@vger.kernel.org
X-Gm-Message-State: AFuF++kAWfX/Um1kb4dQ//85yIrZ6ywcwwPEegfR5v1Vs/3Hi/jAclU1
	8XSbxIhU3J90aSjb/9XuoVyDYBToUlPvWa5ha7omDBtWC+9h0t87Szmd
X-Gm-Gg: AR+sD11/iL4T0gyt8BxFiChEHNrk1Rl0LAl8I2OgSgIpxrDcqGOm8AxcLh6osOLIkE/
	4JzgRDr2cul1Ap+PTo+YdQ6WiEbsGWJ0wuGRXU1L+U7pyRPNIX/rrKSfZyDWR6G/QFFSkUQxhKy
	Drjh6cyoNT6SHlhhQcOrfKic1F6GJtEk/SoEl9/ORPBEAnwrnzsKzJGvOsU4vP6khOb9Ew++euT
	3BkS4BX7LUyt2DMT2uH1DGvKy0H4gI2T98O5AB9r23Qj6qqcBzSwq01tU0Z05v4bXhqVPRDdm5T
	O4jbGmOr+AKvpOPAMgHLjWddjPgmM7R/Iba35pH0IOfPH8k9apqJjiECxJ283rSUhFruwXAnid4
	r+o1hAe99VtGY05K9CwfRiWGfhX6nYAArUIfXlKmQr9MqVYa//wHqxx9KO2SWhavvlnAsi2g6va
	idjwjzAv/LXh0nFRGv4C+SxJRX/OnK2ebUiHI81/GGfJ54pHD0/Vihr5PXnKMaWuAT3MhNykwvx
	g==
X-Received: by 2002:a05:6a00:2289:b0:852:355b:2430 with SMTP id d2e1a72fcca58-8562a001846mr21104959b3a.10.1787970275425;
        Fri, 28 Aug 2026 19:24:35 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49f50bsm1108486b3a.11.2026.08.28.19.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:24:35 -0700 (PDT)
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
Subject: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Sat, 29 Aug 2026 10:23:27 +0800
Message-ID: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
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
Changes in v2:
 - Changed "补丁跟踪系统" to "Patchwork".
 - Corrected branch selection to "for-next 或 fixes" (was "和").
 - Adjusted "已批准" or "已冻结" order.
 - Changed "只接受" to "只考虑".
 .../zh_CN/arch/riscv/patch-acceptance.rst     | 46 ++++++++++++++-----
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
index c8eb230ca8ee..20b91d0433a9 100644
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
+Patchwork
+---------
+
+RISC-V 有一个 patchwork 实例，可以在那里查看补丁的状态：
+
+  https://patchwork.kernel.org/project/linux-riscv/list/
+
+如果你的补丁不在默认视图中出现，那么 RISC-V 维护者很有可能已要求修改，或者希望
+将其应用到另一个代码树上。
+
+自动化流程会在该 patchwork 实例上运行，在每个补丁到达时立刻对其进行构建/测试。
+自动化流程会根据补丁是否被识别为修复，选用 RISC-V `for-next` 或 `fixes` 分支
+当前的 HEAD；若上述均应用失败，则使用 RISC-V `master` 分支。补丁系列被应用到的具
+体提交将标注在 patchwork 上。任何检查未通过的补丁通常不会被应用，并且在大多数情
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
+生不兼容的变更。对于来自 RISC-V 基金会的规范，这意味着“已冻结”或“已批准”，对于
+UEFI 论坛的规范，这意味着已发布的 ECR。（开发者当然可以维护自己的 Linux 内核树，
+其中包含他们所需的任何扩展草案的代码。）
+
+此外，RISC-V 规范允许实现者创建自己的自定义扩展。这些自定义扩展不需要通过 RISC-V
+基金会的任何审核或批准流程。为了避免因添加实现者特定的 RISC-V 扩展带来的维护复杂
+性和对性能的潜在影响，我们将只考虑符合以下任一条件的扩展补丁：
+
+- 已由 RISC-V 基金会正式冻结或批准
+- 已按照标准 Linux 惯例，在广泛可用的硬件中实现
+
+（实现者当然可以维护自己的 Linux 内核树，其中包含他们所需的任何自定义扩展的代码。）
-- 
2.55.0

