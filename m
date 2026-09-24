Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D28C33EB17;
	Thu, 24 Sep 2026 22:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290095; cv=none; b=k8WxI+TXaBKjDfjpCVjYKH3F0AcVaYXmdWL0cqi3ZUOmzos4Td4INyWwTZzdVKnNz5dvMdzTv3EW+IGkryMjO/p6S1O/GQz/abinHvt+2lXPUeDbk8PWn4iElP7wgPHEEPLtZDP3PvWc8/jvH3qU7rxDqeYk/7Fvs6puiHfD5HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290095; c=relaxed/simple;
	bh=TxHoypJP2FC9bNqJ5rajs02/SRc4CdC9csDTYV9bTnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBxt8K77gigUtqZ5ylaWnGUz0vhpKpBv706Bzy3vMKZ6/75iZAu1vHL6XUa38E3LPyvJFymHm0tfDfRzTah0nxIneYP0bA9Z5IqBITr0ek4cW9JvAuduLI1UiJExDg2/n9jpUyoISJo0S624rBn9/vVHCgC1ADdOvwU1OUVnniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sv5FBKWL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sv5FBKWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A391F000FF;
	Thu, 24 Sep 2026 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790290093;
	bh=Hu229NCao1/vu+cnkCz5guGKbIs5YLrldrQS4LcsBfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sv5FBKWL602ZO6OPjzYNKiFEDNY1SBLeI8b/W+XLoe2v8lHuqPHHcJglun50HtPnu
	 nrQdHnA7E5KZbNaBHpLWH4tZxIXVAaFd2t+LYlOvlZStnmviMECxEpkCELlMdiEVN0
	 m5Zzlr5i/v2mqie3vndS0SnfUFRZ7uiFtmU/MZYTgby2ov8y03qeyXcWSNcJYWIEZa
	 pPMS5cozF4uoYbL+s3quS0p1C4Q5z6AXDj+KiL/rQl23SxQICS6ZVGOG+AqWpujMqs
	 cPbvZxxjIw3nVcx7z6g5GPo/qabFMdA2PSC5Toa/BP5j/73vjqQch5BIo4Ssm/NYP+
	 9po6r8Ldf4Ncw==
Date: Fri, 25 Sep 2026 00:48:10 +0200
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Jianping Liu <frankjpliu@tencent.com>,
	Ming Wang <wangming01@loongson.cn>
Subject: Re: Missing signoff in the perf tree
Message-ID: <arWoqiABqzp3Zn6x@x2>
References: <arWl_CVE0g8dSTSU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arWl_CVE0g8dSTSU@sirena.org.uk>

On Thu, Sep 24, 2026 at 11:36:44PM +0100, Mark Brown wrote:
> Commit
> 
>   4c09f6c47b769 ("perf annotate: Fix NULL pointer dereference in loongarch_call__parse")
> 
> is missing a Signed-off-by from its author

The patch had a --- before the author's s-o-b, so it got lost, I'll
adding it and will force push:

============================================================

the address-based symbol lookup so that ops->target.sym can still be
resolved via maps__find_ams() using the already-parsed target address.
This preserves is_call semantics and keeps TUI navigation working.

---
Changes from v1:
- Instead of returning -1 when the '<sym>' token is absent jump to the
  address-based symbol lookup so that maps__find_ams() can still resolve
  ops->target.sym from the already parsed target address.

- Link to v1: https://lore.kernel.org/all/20260423053102.3717015-1-frankljpliu@gmail.com/
---

Fixes: 4ca0d340ce20 ("perf annotate: Fix instruction association and parsing for LoongArch")
Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
Reviewed-by: Ming Wang <wangming01@loongson.cn>

======================


- Arnaldo
