Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420521B192;
	Sun, 30 Aug 2026 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116047; cv=pass; b=VvWbuVjM8i5gMWmITLqrP0KDdTNzh5kq1sb/8crE5Ro0agUUaJKyin91BoSb9FQWAghWTU17gqa8ktaWfdCRjrOHSoyLGvyNaeWeBZgCy5y02WO2//tTBN+2sENsgSaYS6v+Dz8dh16o4sdmaMAizRKas+NA/X91F8v7H944xs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116047; c=relaxed/simple;
	bh=EXAnMJ6xRJh+Me6kD0bTLQJDHBFIcMtq3O0tDNsN/+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5KZqdU9daKNa+yiia7I2Dz6F/iU26QTHTd9XlIJJFHwa+lsWw/m/4csWgrMMUetzDTzYjTGEw+FTZRwBqgXUIXawDr/052FXc1AX17PU2MMZJX0XGqLRSIw1b9Bk4eW8FuH3oJqtLSGFjBoKaZuvzI3l5RIOnt8zknCz/ZrJmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=gV+lB/Ic; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="gV+lB/Ic"
ARC-Seal: i=1; a=rsa-sha256; t=1788116008; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J9pPgTGIWkMZT/3kcW8s3iyH3mjyqeElsf5bAvw8Faod+/zY3tXC+Tu8SjrvaiY/iqb0I5EeACcU2ERDgrPyil2AHWMMEGiT/bpTq6Hhiw1YbDpHuSn+TOlcsZtvMBXkAktzrJN9ZACKEvXrfASlW03X+mVliCZR2/jDCIodjVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788116008; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nVDIHfbzyQ8ElDQ6asi5CRQYO2SYCRhwy8nKszFhgXE=; 
	b=Nst6fob6AmqcyVng6Ai1+J4+iWEEcX0QzPrIEl6XaAzAYQuzUVqgyHSdbMyEcI+Ur4XJ/BEb808B4Nw+bzF3a54QlBWNJn/SIi/7UATz3Nhsv52e67OUAuS4uChZR/0jZyCXaKe1NlaN+CXzA7q4hu5GtV8Fv6TNj9UIWocgTIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788116008;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=nVDIHfbzyQ8ElDQ6asi5CRQYO2SYCRhwy8nKszFhgXE=;
	b=gV+lB/IczCLw56DM6o/kKneXdg3VmBKnUY0te+8GoVcCTl9/xpgGrA7bJSjDkbfG
	wXWkEf0yuUMTIcUwvC6FOmoeEj96fckJ/eQ7RBLTzPoYGB1XycmhySdfVXmixleoryD
	Tnp7fxEjhHdqedAJ7vgGJ5kKr5JTSXgfv8oXJBEQ=
Received: by mx.zohomail.com with SMTPS id 1788116003921735.6548742229019;
	Sun, 30 Aug 2026 11:53:23 -0700 (PDT)
Date: Sun, 30 Aug 2026 18:53:07 +0000
From: Yao Zi <me@ziyao.cc>
To: Weijie Yuan <wy@wyuan.org>, Yao Zi <me@ziyao.cc>
Cc: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apR8CoTs4hj-vqLG@pie>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apMPjRICH06wAxPp@pie>
 <apQ-7U-omIeXvZ1N@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apQ-7U-omIeXvZ1N@wyuan.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/288.103.78
X-ZohoMailClient: External

On Sun, Aug 30, 2026 at 10:32:13PM +0800, Weijie Yuan wrote:
> On Sat, Aug 29, 2026 at 04:57:49PM +0000, Yao Zi wrote:
> > On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> > > Update Documentation/arch/riscv/vm-layout.rst translation.
> > > 
> > > Update the translation through commit 954260ff5a46
> > > ("Revert "RISC-V: mm: Document mmap changes"")
> > > 
> > > Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
> > > ---
> > >  .../zh_CN/arch/riscv/vm-layout.rst             | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > > index 4b9f4dcf6c19..0d0ec8ea5d05 100644
> > > --- a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > > +++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> > > @@ -15,7 +15,7 @@ RISC-V Linux上的虚拟内存布局
> > >  :作者: Alexandre Ghiti <alex@ghiti.fr>
> > >  :日期: 12 February 2021
> > >  
> > > -这份文件描述了RISC-V Linux内核使用的虚拟内存布局。
> > > +这份文件描述了 RISC-V Linux 内核使用的虚拟内存布局。
> > >  
> > >  32位 RISC-V Linux 内核
> > >  ======================
> > > @@ -28,9 +28,9 @@ TODO
> > >  64位 RISC-V Linux 内核
> > >  ======================
> > >  
> > > -RISC-V特权架构文档指出，64位地址 "必须使第63-48位值都等于第47位，否则将发生缺页异常。"：这将虚
> > > -拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是RISC-V Linux
> > > -内核所在的地方。
> > > +RISC-V 特权架构文档指出，64 位地址“必须使第 63-48 位值都等于第 47 位，否则将发生缺页异常。”：
> > > +这将虚拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是 RISC-V
> > > +Linux 内核所在的地方。
> > 
> > I think changes above are purely style improvements? If so please
> > mention it in the commit message, instead of specifying it's "updating"
> > only.
> 
> Agreed. To put it further, I think the commit message template we
> provided in how-to.rst [1] is somewhat like telling contributors: That's
> all you need to do.

Oops, I don't even realize it's part of our existing contributing
guide...

> Of course, in some cases, the patch is quite simple and there is nothing
> else to elaborate on. However, in some cases, such as when making
> extensive changes and updates, we should encourage contributors to write
> down some relevant information for future reference.
> 
> Similarly, just like this patch, the author did more than just update;
> he also carried out other actions, but failed to include the relevant
> details in the commit message. So I feel that perhaps our template might
> have somewhat restricted our writing? (to some extent)

Agree.

> Sure, the requirements for commit messages in the Chinese documentation
> are certainly not as strict as those for the more core subsystems.
> However, I do think it's fine to appropriately explicitly encourage
> contributors to include more meaningful relevant information in the
> commit messages.
> 
> Any ideas for this, or any objections? ;)

I think it's worth pointing out that the template commit message is for
reference only in how-to.rst, and guiding readers to
submitting-patches.rst so at least newcomers have a brief understanding
of the process and requirements.

Now how-to.rst refers process/index.rst, but this index seems to contain
too much for anyone unfamiliar with the process to read through.

> Thanks!
> 
> [1] https://docs.kernel.org/translations/zh_CN/how-to.html#id13

Regards,
Yao Zi
