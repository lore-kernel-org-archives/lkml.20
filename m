Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19703EFFA6;
	Thu, 15 Oct 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067739; cv=none; b=dRApxgpnwZmWVAc1EX1HGWbcqFKQB+AIoDSCQzu+zxUYIQ6gRow1+7G6/H1OfNmbtsMfOsONXxBMShxVw8s6jSycCz2rXwmhuR1Wx96BiDJcqk5YooBABZkM9fgRcDKYooE8qlylLy3Au8LLc8eqMK0xFAENtYUVLeVt4FTljAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067739; c=relaxed/simple;
	bh=10KcGlhH+sxjQwKLfJ38UlR5MoVIIqV+dyNBJmZ6BDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YrVSpuRr4fBtf1vcDvuTBWJDMOgXUttlHU3ne/FOOkd6lmHDiFFClWxgTN3iqAFa+sJsfOA7J89GYXDccJGmODNtSYGEMI7H9/gN8MpSBr7W6/VGNYJmis/W3H41GLqqk5LWnqch4HPm84ottZjJkw70od9jqcJemq9ruWqG72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+QJGHWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+QJGHWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7B91F000C4;
	Thu, 15 Oct 2026 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067738;
	bh=10KcGlhH+sxjQwKLfJ38UlR5MoVIIqV+dyNBJmZ6BDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=D+QJGHWZbpckHr726CHantgd1VlHyyrYohh2Jt7jth1cLZ0NAB53nJYmda4thNt58
	 BDvhy/RlnZq15T5hrg02FSexSr+qHMv+LbeMT0O6PzY4gJJgcT633lRscigKHH8CXT
	 vea+GZ7pLCfK/w7MJKiUZ9bm4L/ByNXAI0zNjBHVsy6N70QC/zVixd6cwIKz2amMhJ
	 MY9ZpwYnjU25Nzd3qdk1gWK1RixRnGjiVwPg6rOXN+1p8o6s5qts4sbWWHp2MQ2L5P
	 QZMidd+Zn+4fXmLDxD/pfzjz65MAxidh/vhp0yeufYN4HjVj6B6P9G2van7NFPPd0m
	 A7blbHhDKMb1A==
From: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>, Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei
 <houlong.wei@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"
 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
In-Reply-To: <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
 <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
 <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
Date: Thu, 15 Oct 2026 14:35:35 +0200
Message-ID: <87o6cvdtuw.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 17 2026 at 21:38, Radu Rendec wrote:
> I now realize that patch 1 (which introduces the conflicting change)
> was picked up by Thomas via the irq/drivers tip branch, but patch 6 is
> strictly a media subsystem patch, so I guess normally it should be
> picked up by a different maintainer via a different tree.
>
> Thomas, are you willing to pick this up too? I'm thinking it could
> avoid some pain if irq/drivers gets merged into mainline first, before
> patch 6 makes it there through the media subsystem. Also, it's a pretty
> "innocent" patch, it just renames an enum value, and it's contained
> within that driver.

The media folks picked it up already.
