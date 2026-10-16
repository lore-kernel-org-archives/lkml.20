Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93153533589
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169664; cv=none; b=ogpG6i/IY9lE7mC9ldf+5OJh2qb0bgKJVsjjoyfbw0MoatUcbNnA6VYTfmTCOq+yqrbP1OD7Yj2ovnE3ND+X/86ft0kyG61qMc6AY2GcBPXqHVhouN043J2b7K/sLckd7YSHOj6M1a+5pvD604eDD4GafYyi5GLjNdoBLLxoej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169664; c=relaxed/simple;
	bh=ZU8JJ4+fzvklfFdZSX6U7Yd3ZSn55WdWlpLFwkW9Yuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+cTFnIM4lDcpXRHGtVpssSj3wPczmphAFAWAwLzwL4wSEn6y2EPKby/AnwkpIs1qMn7cks+6hXq7miiPdqd0ePGpS7vTnFT7b0Q8qa3kI8/+N7m1CGm+o8o6fdMwfInsAoPgVTFNsdStV8sw6VxUv8OgyoilFase6KXdr8SA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dkauy7V6; arc=none smtp.client-ip=95.215.58.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dkauy7V6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZU8JJ4+fzvklfFdZSX6U7Yd3ZSn55WdWlpLFwkW9Yuo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792169657; v=1; x=1792774457;
 b=dkauy7V6g8KnLucXI9wLdtF27jRFqKxqi55JKaBARzd+o367CgS3F1slvVUYMvAYD52rmK/r
 0sD2c3P/EJFKoby8tFHAiXQJhwRG4BXyHfM7/MECx45v5/307e/fjtWPZ0nDZUSduAi0sNBmuT7
 ZsE5yTqCzlB6G34GBduMWOH5inCnzZkNjeNuRdIGITUSFoBfM4rOHCiadNRabojGo5DQxHvGT+1
 iTGUBOvU/z337GhJc1A6uaqORcOC/82Z05Q4L0L2ZwtNKRm5s7VDd5zoTcD6mOroXBM552jboGF
 vtL/7cLNwNUO/M0nYxqupKo7hIl6TcaxJZ3t+9A3afl/g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cf7bd38daf4699e;
	Fri, 16 Oct 2026 16:54:17 +0000
X-Mizu-Trace-ID: 3cf7bd38daf4699e
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	2023002089@link.tyut.edu.cn,
	alex.shi@linux.alibaba.com,
	baikefan@leap-io-kernel.com,
	bailu.lin@vivo.com,
	benx.guo@gmail.com,
	bernard@vivo.com,
	bobwxc@email.cn,
	bryan.wu@analog.com,
	businiaoanka@anka1.top,
	chenfeiyang@loongson.cn,
	chenhuacai@loongson.cn,
	chenqi@beyondsoft.com,
	chris.wei.cui@gmail.com,
	doehyunbaek@gmail.com,
	doubled@leap-io-kernel.com,
	e12051@motorola.com,
	eugeneteo@kernel.sg,
	fan.yu9@zte.com.cn,
	gaochao49@huawei.com,
	greg@kroah.com,
	harryxiyou@gmail.com,
	he.peilin@zte.com.cn,
	hidave.darkstar@gmail.com,
	huang.junhua@zte.com.cn,
	huangjianghui@uniontech.com,
	kezijie@leap-io-kernel.com,
	leoyang.li@nxp.com,
	linyongting@gmail.com,
	liu.hailong6@zte.com.cn,
	longjin@dragonos.org,
	luochucheng@vivo.com,
	maoyuxian@cqsoftware.com.cn,
	martin.petersen@oracle.com,
	me@lirui.org,
	qiu.yutan@zte.com.cn,
	r0bertz@gentoo.org,
	realpuyuwang@gmail.com,
	rockrush@rockwork.org,
	shao.mingyin@zte.com.cn,
	siyanteng@loongson.cn,
	sun.yuxi@zte.com.cn,
	synmyth@gmail.com,
	tangyeechou@gmail.com,
	theandy.deng@gmail.com,
	tttturtleruss@hust.edu.cn,
	wang.longjie1@zte.com.cn,
	wang.yaxin@zte.com.cn,
	wangqing@vivo.com,
	wangxiaochen0@gmail.com,
	wangyuli@uniontech.com,
	wanjiabing@vivo.com,
	wenhu.wang@vivo.com,
	wodemia@linux.alibaba.com,
	wy@wyuan.org,
	xiyou.wangcong@gmail.com,
	xu.xin16@zte.com.cn,
	xxx.phy@gmail.com,
	yang.tao172@zte.com.cn,
	yang.yang29@zte.com.cn,
	yaxinsn@163.com,
	yjzhang@leap-io-kernel.com,
	zangleigang@hisilicon.com,
	zhangwei@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	zhoubinbin@loongson.cn,
	zhuyan2015@qq.com,
	zpenya1314@gmail.com
Subject: [PATCH 2/2] docs/zh_CN: remove Translator field in header template
Date: Sat, 17 Oct 2026 00:52:33 +0800
Message-ID: <68789e7cda7133482e9eeb119f95d2fd85293413.1792167856.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
In-Reply-To: <cover.1792167855.git.wy@wyuan.org>
References: <cover.1792167855.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The credits of the contributors are saved in the commit logs, thus we
don't need to repeat these names in the main text.

Remove the Translator template so that we will not sprinkle our names
throughout the source for every change we make later.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
---
 Documentation/translations/zh_CN/how-to.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1e76..d448ae69e48c 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -203,10 +203,6 @@ Git 和邮箱配置
 
 	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
 
-	:翻译:
-
-	 司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
-
 翻译技巧
 --------
 
-- 
2.56.0.379.gc618271300

