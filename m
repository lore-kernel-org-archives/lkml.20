Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0B2E719B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225638; cv=none; b=fgYiTteb8qjXIPrVBAXpEA09I3YkF+OiaDWXyZY4XEVQOzS7ULvDcOngViuthNmsIYnpDMBtuHOus5thHU92hcJJoZUUuehfV3enGcI+Yu1vxXXgxvMBfciegQaH0olaG+8E0OIG5MgI8NpJJM1NQ4U5l+pgpWVlUa+leyvu6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225638; c=relaxed/simple;
	bh=Dkkq8P2zes4zT6ntquiJ9OG3w6YG/q4yXmRis5Wfvd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hb0Y9g/vEOTfGWHE1REbcbnxGh3pNrHCPTb8QHwYMGmYWC2y++8+l2hEglKjSrfmZf1GEjWUvs0+J2ARPiOwwUk+fx+2Sh5gYYrJlZi1TfolR9k/z3bTq6e4kTHxLODfxz5hY+PRihdOo+gnIpVd3rynu+8uVULjXrrsB5E/q84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=orkOY6EQ; arc=none smtp.client-ip=95.215.58.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="orkOY6EQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dkkq8P2zes4zT6ntquiJ9OG3w6YG/q4yXmRis5Wfvd4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792225631; v=1; x=1792830431;
 b=orkOY6EQDd+k7vrRr+MWHoEcEFWaPWsbgTisayMxv1qcjSuzt/8Bu/aQFq5uxyn/U03jdjtJ
 6t/nWMkjMO57ZIc7WAJrrH0mXfOUcgHwCSqCQP1fqYabfMbM33Y07gc9s3XAFP5pZ74x/UoDWFs
 Bzdj59FOVw20D5Pl0RSpFzVRITnka6p8ffckUMmbkWmri7N57NcNcHaNunk1YLBkrMdAk5J2/a0
 EjHccgsqNkwHxqfw9XGIz/jmy17hvr5mVzQsQQQtYpZOqIdzeGQuhe3mJsbhmhgd3Vup6DtBcv9
 W/PuAWabEL9EXYvuxY+MkE75na4QzDaD4I7VTmCHVjIdg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce10e198eb09fdf8;
	Sat, 17 Oct 2026 08:27:10 +0000
X-Mizu-Trace-ID: ce10e198eb09fdf8
X-Migadu-Flow: FLOW_OUT
Date: Sat, 17 Oct 2026 16:27:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, 2023002089@link.tyut.edu.cn,
	alex.shi@linux.alibaba.com, baikefan@leap-io-kernel.com,
	bailu.lin@vivo.com, benx.guo@gmail.com, bernard@vivo.com,
	bobwxc@email.cn, bryan.wu@analog.com, businiaoanka@anka1.top,
	chenfeiyang@loongson.cn, chenhuacai@loongson.cn,
	chenqi@beyondsoft.com, chris.wei.cui@gmail.com,
	doehyunbaek@gmail.com, doubled@leap-io-kernel.com,
	e12051@motorola.com, eugeneteo@kernel.sg, fan.yu9@zte.com.cn,
	gaochao49@huawei.com, greg@kroah.com, harryxiyou@gmail.com,
	he.peilin@zte.com.cn, hidave.darkstar@gmail.com,
	huang.junhua@zte.com.cn, huangjianghui@uniontech.com,
	kezijie@leap-io-kernel.com, leoyang.li@nxp.com,
	linyongting@gmail.com, liu.hailong6@zte.com.cn,
	longjin@dragonos.org, luochucheng@vivo.com,
	maoyuxian@cqsoftware.com.cn, martin.petersen@oracle.com,
	me@lirui.org, qiu.yutan@zte.com.cn, r0bertz@gentoo.org,
	realpuyuwang@gmail.com, rockrush@rockwork.org,
	shao.mingyin@zte.com.cn, siyanteng@loongson.cn, sun.yuxi@zte.com.cn,
	synmyth@gmail.com, tangyeechou@gmail.com, theandy.deng@gmail.com,
	tttturtleruss@hust.edu.cn, wang.longjie1@zte.com.cn,
	wang.yaxin@zte.com.cn, wangqing@vivo.com, wangxiaochen0@gmail.com,
	wangyuli@uniontech.com, wanjiabing@vivo.com, wenhu.wang@vivo.com,
	wodemia@linux.alibaba.com, xiyou.wangcong@gmail.com,
	xu.xin16@zte.com.cn, xxx.phy@gmail.com, yang.tao172@zte.com.cn,
	yang.yang29@zte.com.cn, yaxinsn@163.com, yjzhang@leap-io-kernel.com,
	zangleigang@hisilicon.com, zhangwei@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
	zhoubinbin@loongson.cn, zhuyan2015@qq.com, zpenya1314@gmail.com
Subject: Re: [PATCH 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <atMxWvnyYmD5r6O3@wyuan.org>
References: <cover.1792167855.git.wy@wyuan.org>
 <a7c3af29fd1783bbca36cdacd3f17bf52cd5ef3f.1792167856.git.wy@wyuan.org>
 <3ee47cf1-a7a2-481a-bf46-46e74bdaa1e5@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ee47cf1-a7a2-481a-bf46-46e74bdaa1e5@hust.edu.cn>

On 2026-10-17 10:06:39 +0800, Dongliang Mu <dzm91@hust.edu.cn> wrote:

> On 10/17/26 12:52 AM, Weijie Yuan wrote:
> > The headers related to translators and proofreaders appear multiple
> > times in our directory. Their information is duplicated with that in the
> > commit logs, making it difficult to maintain over an extended period
> > of time, as there have been multiple instances of requests to update the
> > email address.
> > 
> > Remove all the related fields to make our source clean.
> > 
> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> > The diffs are inconvenient to review, sorry. Because I cannot find a
> > better way to split them up besides by directories.
> 
> 1. I recommend to preserve the RST anchors because other files would use
> this.

Yes, I also removed some top-level labels while I was at it, though I
would better have done that in a separate patch. (My Git index was messy
with these large diff. So later, the topic was expanded to a cleanup.
But yes, I should split it)

But I checked that none of these removed labels are referenced
elsewhere, if I was doing it correctly. (No invalid citations were
reported by 'make htmldocs'.)

Anyway, I'll not touch these labels in next re-roll.

> 2. There are three checkpatch SPDX warnings during the review:
> 
> dev-tools/sparse.rst | Missing or malformed SPDX-License-Identifier tag in
> line 1
> process/howto.rst | Missing or malformed SPDX-License-Identifier tag in line
> 1
> process/kernel-enforcement-statement.rst | Missing or malformed
> SPDX-License-Identifier tag in line 1
> 
> Each warning is triggered because the patch changes that file´s first line.
> All three files already lacked an SPDX tag before the patch.

Oh, I forgot to mention this when writing cover lettter, sorry I did
send these emails a bit too hastily.

I did run checkpatch and got these reminders.

The original Engish versions of these three are missing
SPDX-License-Identifier(s), so as far as I know, our translation is
better not to add this first.?

Please see: https://lore.kernel.org/linux-doc/87y0dv1wp3.fsf@trenco.lwn.net/

But I guess we could add the identifier with Alex's and Yanteng's ack,
as they are the original translator if we want to.

Thanks!


p.s. Many of the recipients' addresses are no longer in use. To avoid
unnecessary clutter, I will simplify the list of recipients in the next
version.
