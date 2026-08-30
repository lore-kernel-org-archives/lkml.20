Received: from mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4D3B27D4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100346; cv=none; b=WQ89nzSio6pxHvh9EpIvnmqh4AfBjiZsdo398cDu+11oQ1EtNTrK5iKQ08v7ImePrIS0Z8arXM2DpQEhgzvs8fbnh4SrJL6BNfFJm9GTn2r1dnHHAxAlMzCfw0rZNjKVJ8F5Db/f64fkCjhw5N1hN6Gu4+XdI4hd+WADWlLF72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100346; c=relaxed/simple;
	bh=lgf0MuQPFoZlIab78/zqlZds7+shjXNJmT7lgzsTekU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpdSfUv8qo+CjgE2iYbnZ9bkYEr2Qzq3GTD/akD46sZiXE7bDAF8720DGLLFSQf3p1PKtIP9Fn4soSn4MUPohXyXfCFPVzBkUIsQMItDUL54DK3+iyWI/XBgrc1Wk89xm5y0IxQvmi4qn36QSEm4XXZ/oKSDNCHWviPW/CWQCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=toh5ZXcq; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="toh5ZXcq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lgf0MuQPFoZlIab78/zqlZds7+shjXNJmT7lgzsTekU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788100341; v=1; x=1788705141;
 b=toh5ZXcqCvC8nLke1DMDLgtRkg1xWupLZ+s1M3gVCBEJYqDuoC2VwOqJ0goqYr89Bxe+Eq1g
 N3N1ily50P2IQotfboQuDpxhJUrv18/gwLa6lem2cXL3dznOV0eykf7cwllWlWpL0w/iRH6JWXO
 LjYCQfIUd9zowtdk/JFgY4kjsCjHmVWUO5m8VVFkrQ3DdqdJR29PJGLbS2WNt1U/Lfe9F+m/pJt
 cUCUlB6KHzvCPmEFSGaSvujhbvHeEsoqZojbj6UmNMWhjqKDK75dYp/Vy+VwmXYiamFciP2L0hs
 stgwEkJC2/PseHMvaXY6Za8X1CuXeAP9bk6GIqjaxnUWQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7c357459d6dfa994;
	Sun, 30 Aug 2026 14:32:21 +0000
X-Mizu-Trace-ID: 7c357459d6dfa994
X-Migadu-Flow: FLOW_OUT
Date: Sun, 30 Aug 2026 22:32:13 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yao Zi <me@ziyao.cc>
Cc: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apQ-7U-omIeXvZ1N@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apMPjRICH06wAxPp@pie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apMPjRICH06wAxPp@pie>

On Sat, Aug 29, 2026 at 04:57:49PM +0000, Yao Zi wrote:
> On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> > Update Documentation/arch/riscv/vm-layout.rst translation.
> > 
> > Update the translation through commit 954260ff5a46
> > ("Revert "RISC-V: mm: Document mmap changes"")
> > 
> > Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
> > ---
> >  .../zh_CN/arch/riscv/vm-layout.rst             | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > index 4b9f4dcf6c19..0d0ec8ea5d05 100644
> > --- a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > +++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > @@ -15,7 +15,7 @@ RISC-V Linux上的虚拟内存布局
> >  :作者: Alexandre Ghiti <alex@ghiti.fr>
> >  :日期: 12 February 2021
> >  
> > -这份文件描述了RISC-V Linux内核使用的虚拟内存布局。
> > +这份文件描述了 RISC-V Linux 内核使用的虚拟内存布局。
> >  
> >  32位 RISC-V Linux 内核
> >  ======================
> > @@ -28,9 +28,9 @@ TODO
> >  64位 RISC-V Linux 内核
> >  ======================
> >  
> > -RISC-V特权架构文档指出，64位地址 "必须使第63-48位值都等于第47位，否则将发生缺页异常。"：这将虚
> > -拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是RISC-V Linux
> > -内核所在的地方。
> > +RISC-V 特权架构文档指出，64 位地址“必须使第 63-48 位值都等于第 47 位，否则将发生缺页异常。”：
> > +这将虚拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是 RISC-V
> > +Linux 内核所在的地方。
> 
> I think changes above are purely style improvements? If so please
> mention it in the commit message, instead of specifying it's "updating"
> only.

Agreed. To put it further, I think the commit message template we
provided in how-to.rst [1] is somewhat like telling contributors: That's
all you need to do.

Of course, in some cases, the patch is quite simple and there is nothing
else to elaborate on. However, in some cases, such as when making
extensive changes and updates, we should encourage contributors to write
down some relevant information for future reference.

Similarly, just like this patch, the author did more than just update;
he also carried out other actions, but failed to include the relevant
details in the commit message. So I feel that perhaps our template might
have somewhat restricted our writing? (to some extent)

Sure, the requirements for commit messages in the Chinese documentation
are certainly not as strict as those for the more core subsystems.
However, I do think it's fine to appropriately explicitly encourage
contributors to include more meaningful relevant information in the
commit messages.

Any ideas for this, or any objections? ;)

Thanks!

[1] https://docs.kernel.org/translations/zh_CN/how-to.html#id13
