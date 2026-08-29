Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690D2BDC28;
	Sat, 29 Aug 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022729; cv=pass; b=CNQndoBk7BKuEBt1p895n65xqI3RWVjXh3yCmMR18PcNAvPbfFniQw76/LYcbjJFY9jmIOyu94EXIHdTqVh5o9Vj3HHpiVMlnNZ4V/IfYvsdNz181/TCIkp3rmeH1H6skYZ05I39NMFAs1OonrFG+P+JHrz170Qli7K9eYHwO+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022729; c=relaxed/simple;
	bh=qbPktbUxLon+K3dddCkY1Q53zmB4mYwKG6oWen8WlRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPl5TN5YtpUSK1JtOTrkWiAXkjy3fAJ2mrgx1GPirgduEnxznYfGnGw7zgqu7LKI72Vr8RbrENfsfIu0I3dV/ea6YmSu2wjegzYK87Ws3chgM494j9//hFZgCGrvwQbkZ2BgTTlBwSjI8m48su0XReQW22VsZJRci5kbgv8Vf64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=g3C7l7k2; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="g3C7l7k2"
ARC-Seal: i=1; a=rsa-sha256; t=1788022695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YiT8gFXmzMQVyeqLt7nxxYDPkQJ64bcEgyY0TRj23f9Esi7u87jT8zG8Hdugp5McILbrPK4CNdNGmHQ3GXUqepLBKB1BhgvwGS2PgBC7ftfFrAhqSzDbAjLhKGFpXi+8JWavzRP5OsHX10eOMSqpq9WBdU4pa+n7HaQwtoD8Dcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788022695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CjVd702NccuiO5wKzGeLMyGwfIQYzeuw9yTi4k9/VvM=; 
	b=ns1L7ps/IYTnH5iMfquqDOsBemIunAtW3BUMnqf6cGK+xbOCAzcVwvWU2j3SJN1xoql1Fh7wxcmiBw2M9xQucMif582iuBoqtqoCinwM6N47d0RGUYh2ZaJ35Vvu3+fRR41bEXtAwi/9QhBEJ8KIjtAS5pzsRhh+mUrn4g5vrSo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788022695;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=CjVd702NccuiO5wKzGeLMyGwfIQYzeuw9yTi4k9/VvM=;
	b=g3C7l7k2e/YLmRR5ZRiZ+WxQxoW4rFYHshU0yy73teYPQ/hpE48c4l2UfZYv3WB9
	9asgTSASX0FLRH+BQvcIMU47Fqwae5Y30XnZrNFbtvY2u8deoa1FejpBjt/NfpnvPO2
	kzC3OXlQuIdWai8TzZbYUpJ+IBcvFoJ/NwN4RJKM=
Received: by mx.zohomail.com with SMTPS id 1788022690786194.0425938326705;
	Sat, 29 Aug 2026 09:58:10 -0700 (PDT)
Date: Sat, 29 Aug 2026 16:57:49 +0000
From: Yao Zi <me@ziyao.cc>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apMPjRICH06wAxPp@pie>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/288.2.98
X-ZohoMailClient: External

On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/vm-layout.rst translation.
> 
> Update the translation through commit 954260ff5a46
> ("Revert "RISC-V: mm: Document mmap changes"")
> 
> Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
> ---
>  .../zh_CN/arch/riscv/vm-layout.rst             | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> index 4b9f4dcf6c19..0d0ec8ea5d05 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> @@ -15,7 +15,7 @@ RISC-V Linux上的虚拟内存布局
>  :作者: Alexandre Ghiti <alex@ghiti.fr>
>  :日期: 12 February 2021
>  
> -这份文件描述了RISC-V Linux内核使用的虚拟内存布局。
> +这份文件描述了 RISC-V Linux 内核使用的虚拟内存布局。
>  
>  32位 RISC-V Linux 内核
>  ======================
> @@ -28,9 +28,9 @@ TODO
>  64位 RISC-V Linux 内核
>  ======================
>  
> -RISC-V特权架构文档指出，64位地址 "必须使第63-48位值都等于第47位，否则将发生缺页异常。"：这将虚
> -拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是RISC-V Linux
> -内核所在的地方。
> +RISC-V 特权架构文档指出，64 位地址“必须使第 63-48 位值都等于第 47 位，否则将发生缺页异常。”：
> +这将虚拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是 RISC-V
> +Linux 内核所在的地方。

I think changes above are purely style improvements? If so please
mention it in the commit message, instead of specifying it's "updating"
only. Separate the changes into another commit might help, but I'm not
sure whether it's worth the effort.

Regards,
Yao Zi
