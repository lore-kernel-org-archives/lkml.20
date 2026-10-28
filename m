Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158906;
	b=MFliAwzQ/RPR55DIB61TKmZi4QaRvWFHhNxkf6uQj93DuOmDPFgCGOQ+aROCFX7Y0z8N
	 bTGjZOX1cTf4GiOHm3gb7XgIeDEGQuF0ir4d8Ok11UPEh0LMGIgZbiBdoF+QM36fpvRKD
	 DnZUZMDCV8fljxUbVTluSuK14F4XmCfSlO00NLeUVAnDtY/VScmjg3oxgRoACO4vgz3kt
	 4joEy2+h/3MZQUmXmGG9dQpu56AWXBnAeVGHvzj940s0mx/aVIjipdpzMPLHflc6CFcV2
	 fozA9zKzUhN6Nv2rhDkSVVg0Z7QTsSYw+VegPi3VyOZN/rq7Q0XFOh36HJVBH6BYu5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158906;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=HyC9zm/R6SnaA5Ch3AdjUEkAtXkvDxdQFluExLgleVQ=;
	b=nbmnMSZEgTGJhfpI5pr08NtWYP3Jq1hfF01+ELtxPzzeBCQWaW/KLwsg1VN7TEIPAHDg
	 KU15PiNiWspcIQEm43WGe5O1YPmm6XA4AJeYdoGB1s0LZOAbn3pl8emcHeqLmIUgcdMia
	 LPhyNHxmISXEs2bzN6nzf4qDpmERn/cxTOMuOjGAF37N/aaQ+GtU6MJ7QCQZAoRVWN+gu
	 bVzJWO9DXW9VUTDAXhGEGErkny4vJvSXoGOhhTo6sg91z5+0UqPFgj/oIcwOL0Br4y9oN
	 xp57HR0EsxkA4ErCq9gCObReDHXYulmnvJkAHiEmQWvOQ8YnVZlxcp9H9MqiXdslWHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202EE606A31F;
	Wed, 28 Oct 2026 03:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202EE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAmTXb1buFq6uBgAA--.11603S2;
	Wed, 28 Oct 2026 11:41:41 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXkDvubuFql1YAAA--.815S3;
	Wed, 28 Oct 2026 11:41:40 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] docs/zh_CN: update admin-guide/index.rst translation
Date: Wed, 28 Oct 2026 11:41:26 +0800
Message-ID: <20261028034134.4144660-2-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028034134.4144660-1-dzm91@hust.edu.cn>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMAmTXb1buFq6uBgAA--.11603S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1kKF4Utr4xGFWkAw48tFb_yoW8Zr4fp3
	WqgryxK3W5JFy2kry8Gr1jgFy8G3W8Ww4UGF1rtw10yrn8tr1vvr45tFWDKa4kurZY9ay5
	JF4rK3yUur42y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

update Documentation/admin-guide/index.rst Chinese translation

Move the already translated tainted-kernels, media, and unicode entries
from the Todolist into their respective sections.

Update the translation through commit f0efd29aa60c
("doc: Add CPU Isolation documentation")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/admin-guide/index.rst         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index bd01cf6474c8..23443eb66124 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -1,7 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/admin-guide/index.rst
 
 :翻译:
 
@@ -10,6 +9,7 @@
  朱岩 Yan Zhu <zhuyan2015@qq.com>
 
 
+==========================
 Linux 内核用户和管理员指南
 ==========================
 
@@ -86,6 +86,7 @@ Todolist:
    reporting-regressions
    bug-hunting
    bug-bisect
+   tainted-kernels
    init
    clearing-warn-once
    lockup-watchdogs
@@ -95,7 +96,6 @@ Todolist:
 
 *   quickly-build-trimmed-linux
 *   verify-bugs-and-bisect-regressions
-*   tainted-kernels
 *   ramoops
 *   dynamic-debug-howto
 *   kdump/index
@@ -122,6 +122,7 @@ Todolist:
 
 *   cgroup-v2
 *   cgroup-v1/index
+*   cpu-isolation
 *   namespaces/index
 *   pm/index
 *   syscall-user-dispatch
@@ -170,6 +171,8 @@ Todolist:
 .. toctree::
    :maxdepth: 1
 
+   media/index
+
 Todolist:
 
 *   acpi/index
@@ -183,7 +186,6 @@ Todolist:
 *   hw_random
 *   laptops/index
 *   lcd-panel-cgram
-*   media/index
 *   nvme-multipath
 *   parport
 *   pnp
@@ -220,11 +222,11 @@ Todolist:
 .. toctree::
    :maxdepth: 1
 
+   unicode
+
 Todolist:
 
-*   highuid
 *   ldm
-*   unicode
 
 .. only::  subproject and html
 
-- 
2.51.0

