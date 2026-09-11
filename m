Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320BF40E8D6;
	Fri, 11 Sep 2026 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134620; cv=none; b=bWdc/ZvLkBSIUMCEjs9Q0BjPYylYtcC+7vU3EQwkyPkUXsMbzRRTXpI/nc8mggl8USXK/14P5S5AL+YHhVOl27gfgTkron5qRo08ngKCOG4Hntzx9s38GKlK6QAk5RsKmzHnBo/lYo2mlOqliJM6b5XIUPw2PffFdb30EsQVqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134620; c=relaxed/simple;
	bh=cuIAEQFe9YfTBQZx01ANX5jmaVryZ8zhbwRp/JdAoqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TuvVa+EPi/GPtGjAgsS0a8qgDCgccf7S6Kr2rr1twKNg3J4R/mf19u8vls0QCthK3sm4bxXIK4FyEgCxT0OPhCbBimaH6WiYkS9wsPFAqRWTGU4wCYBmAx5M8olF93vWSMJHrV6CSFWIZENnOaoIZqvw5Te1+grsPUbRU0CZe4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=oKP79ioi; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="oKP79ioi"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d7226c34;
	Fri, 11 Sep 2026 21:50:04 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pps: generators: Pin dummy provider while a file is open
Date: Fri, 11 Sep 2026 21:49:52 +0800
Message-Id: <20260911134952.648064-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa090bb863803a1kunm423d710f1df1cc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxofVh4fSU1NSE5LGEIZS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0hKTk
	xOVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=oKP79ioihPAIs98Tt5QlAoEjLiAoB2BzUg1v+Nzms8UiqpAClLMyLWTb7TuuRdGIzSV3psNjt8E5hDoX4zptc1y7Zn0qzXLHvnhmJS+DwgQViqhnsawLGmQzA8beK3woMqLllfzk0raoYVwCYkmEstoZVBLwxs4J51w3nfkmvZw=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=cExZDgHOjTvpPQx1lVAEHRgDVoPv0zocD9YK+/lelZY=;
	h=date:mime-version:subject:message-id:from;

pps_gen_register_cdev() copies pps_gen_source_info.owner to cdev.owner so
an open file pins the module that owns provider metadata and callbacks. The
dummy generator leaves owner unset, allowing pps_gen_dummy to unload while
an old file remains usable through pps_gen_core.

The old file retains the core-owned pps_gen_device, whose info pointer then
refers to unloaded pps_gen_dummy rodata. PPS_GEN_SETENABLE dereferences the
stale info->enable member and may call through memory reused by another
module.

In three KASAN runs, a uid-65534 process with no capabilities held the old
file while a separate root process unloaded the dummy provider. The later
ioctl faulted in pps_gen_cdev_ioctl(). A stock-module follow-up also
reproduced three kernel panics after the same uid-65534 process naturally
autoloaded can-bcm.ko into the retired rodata page and reached a NULL call.
The administrator-performed provider unload remains a prerequisite.

Set owner to THIS_MODULE and update the documentation example. In three
owner-only fixed runs, the open file raised the provider refcount, unload
failed with EAGAIN, and the ioctl, close, and subsequent unload completed
without a kernel diagnostic.

Fixes: 580afe4acbd4 ("drivers pps/generators: add dummy PPS generator")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 Documentation/driver-api/pps.rst       | 1 +
 drivers/pps/generators/pps_gen-dummy.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/driver-api/pps.rst b/Documentation/driver-api/pps.rst
index 598729f9c..89a473be7 100644
--- a/Documentation/driver-api/pps.rst
+++ b/Documentation/driver-api/pps.rst
@@ -207,6 +207,7 @@ registered in the kernel by defining a struct pps_gen_source_info as
 follows::
 
     static const struct pps_gen_source_info pps_gen_dummy_info = {
+            .owner                  = THIS_MODULE,
             .use_system_clock       = true,
             .get_time               = pps_gen_dummy_get_time,
             .enable                 = pps_gen_dummy_enable,
diff --git a/drivers/pps/generators/pps_gen-dummy.c b/drivers/pps/generators/pps_gen-dummy.c
index a4395543c..393c44246 100644
--- a/drivers/pps/generators/pps_gen-dummy.c
+++ b/drivers/pps/generators/pps_gen-dummy.c
@@ -58,6 +58,7 @@ static int pps_gen_dummy_enable(struct pps_gen_device *pps_gen, bool enable)
  */
 
 static const struct pps_gen_source_info pps_gen_dummy_info = {
+	.owner			= THIS_MODULE,
 	.use_system_clock	= true,
 	.get_time		= pps_gen_dummy_get_time,
 	.enable			= pps_gen_dummy_enable,
-- 
2.39.5

