Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B984EE844;
	Wed, 16 Sep 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583744; cv=pass; b=IL0VcoxM4DT9D3Drla4038xtqrFCJkf0AMC1ShL+3A03edkQDpR4j5kcH/pkntpajXfoHsXOz6AluM0RIzaFln4UiVPsGhtphftYhESwri5oR5ASFmfSWCQm48kCdJYQx+cKJXhdEA1A3atyOe7C9QSdOf+6blInoW7yBhtHrBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583744; c=relaxed/simple;
	bh=Ec60ZOz9fzZSy+ZoxPFSAmSl79Nfm2yiHGyvhxmd1b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG7bL/W7PizNkW0tJXHjAlCzew4fKhPHcvdgxa/1q5dmxBswihOlzJ4RQhgZClDjI/rGsUB3Nc5USC3wRH989KetikhL1fJsp5tpcNFNkJS1ml+ezk0LPuqFoPK/ZzZQssm1wsebHQ+vnD68zqtMUdumwwNUzA75zW47V12Lo7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=OtxJyOGt; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="OtxJyOGt"
ARC-Seal: i=1; a=rsa-sha256; t=1789583695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uzf8xjv0RWXzfhEnadNb3hn/NSq84yfAXfHH78fkjMJCc4kc9ABh2u/Ostnoq8W8aaSFaL5ykc5YqIVoGjzCaIXdErTPVkNnVoqYka9yFv+MtMabBDprdR/ZQXeqh/I8FyPxRqqHpKj2MN90N71Uku9Ww2C8ymaniWr7cHxMBVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789583695; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ec60ZOz9fzZSy+ZoxPFSAmSl79Nfm2yiHGyvhxmd1b8=; 
	b=EvN/9pb5+9V3vXFJAYy3/kCB/a/v2qC838EGcRILxLAWva7CJXUAFoqRSotl57C7PAMe6Yo2clG0yjmefwH72GvH8UUkD9pUESPtN4tVupvtQd5n0rPOc+qzD8Q/qQXngmWLDDOy5GvgmV2sf4/WOEF4zgXboiWQV+C7PkDt11U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789583695;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Ec60ZOz9fzZSy+ZoxPFSAmSl79Nfm2yiHGyvhxmd1b8=;
	b=OtxJyOGtM5UR0k0B6USDpitLX47etcAr59f+1lQtwp9iRypJDJ+N7B0kQeSmzMZj
	0yTF1zt02kKbigdKFwpy3LdLq0k2mMqpsCixK47wF3R2nexJqPObCEv+tFrqSQf31p8
	+0m2x99dh759+LK9L9jxBcHohZkiXtRiagj21X68=
Received: by mx.zohomail.com with SMTPS id 1789583693351451.04523271072355;
	Wed, 16 Sep 2026 11:34:53 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:34:46 +0000
From: Yao Zi <me@ziyao.cc>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqrhRic7Ww6fPhxg@pie>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.567.80
X-ZohoMailClient: External

On Wed, Sep 16, 2026 at 06:06:30PM +0200, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

What if the coprocessor changes the load address, e.g., in a new
release, and how could we support other bootloader implementations
with this modification? Wouldn't the part of memory be wasted if no
coprocessor firmware is loaded at all?

It seems to me the best solution is to modify the FSBL to fix up the
devicetree to reserve memory where the coprocessor firmware is loaded
instead.

Anyway, this reserved region isn't defined by the hardware, thus we
shouldn't include it in the upstream Linux devicetree, since it should
describe the hardware.

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>

Best regards.
Yao Zi
