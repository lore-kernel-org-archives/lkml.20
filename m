Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354820;
	b=wXg+RydnYhUTtXbcvP5LRmd+mL1F83iY9DiziYICFyiDwmsFPQpPdlO6meJYUCUEnYf0
	 ++pr/SMfzEFf828AC7S0h0GAR2+QntM1NExSeQh9QaGrLrCMaOQ+xgP0+g77692z2e1ts
	 sF8oqLThzkHV3dhH3yrWTHpNTsS9IqIxP0z0+lf9Y89ioOYJQudUeymgla4RPT5AZKpO6
	 XHztd13eWTol+vHvPEeOcPskyQeJC8hU1yYpIPZYVVaYSt+SChYh3liGztL+iTH6PgKkS
	 hRK1kMHRPqCO0e1773pf2w5pRScWwBkp5vsDR1xrs/OFqx6ozqACCyGUcsEx1dKZMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354820;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JWWMtf5ELirDRWniNamwBoUthACfM4Phg+4t71L1tCU=;
	b=Cs7alu4Oqe3f1XfrFdBR07LHJ6k5oQUDXrUmfqg67zRbggCWFbPx9WnVveeYkMo1PrVn
	 /FytAns5QC76IOdwGE9pWCrxysK5D6qKWGB+unIJJK/LtN9DcPBmTq4NlzxcDsM9EhWcY
	 JgL2dLMcOXwxq6kb/Ou/gf/b/aff71obeJJ/sgCcYhH8zvX/rsABkK5M6wzlFF1BLLCVz
	 ZBVFLhcDkbucRRVGdPKVgl7Ghk/oDQWXQTSm476V0NKoiRve21EE+8TZc+PjcJt8wI9d1
	 OkghX1Og6rhkBx5IwXUQ2FJTJR5KbvwDN9BBlAWxQvQIwgVLfirGjjJJ92AeZvJlUBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=OJXdqIZQ;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8725606A31A;
	Fri, 30 Oct 2026 10:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8725606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=OJXdqIZQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1793354812; bh=Xuq+sk1nsYLtsN9sg8EsuT5PfLtPLbH70JnmXW4fjCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJXdqIZQqpdBgtTIbM0U43XdlxlyF/YEtM0qLZ7zlgdF3yHdNgWs0OIjiTQMR+zGa
	 nAFFlqwXSFR7v8icigJFn5ZEqbLnV3in+lE4g/9ghpW/+vaE38jbFWmYD+Cb7nLpoy
	 GZbU5Q8mjo3egx8cnPi+ZdQGvRDq5eLKTQ0dvJETLorLfRDRNfpOPmCMS/0lSCEvW+
	 DpX6ffMSTUJlOOnXR2qvRcs+d0w8Nhx7qcDJd61Vmc4xzW67Pt5XLa2WgTnUMq04vc
	 alEEaO2ym/RsPv2A8M3+oZxL1oZjHLoRCLjCMwRgOCBjg7Ki4Z9rGSyBffVPbnaMU1
	 wGPOXyWeJO+2Q==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 51C9F40B2B; Fri, 30 Oct 2026 10:06:52 +0000 (GMT)
Date: Fri, 30 Oct 2026 10:06:52 +0000
From: Sean Young <sean@mess.org>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] media: rc: fix use-after-free of rc_map.name on
 register error path
Message-ID: <auRsPM9YO4aXd8qL@extorris.mess.org>
References: <20261027014144.9144-1-25031212351@stu.xidian.edu.cn>
 <20261027021718.14264-1-25031212351@stu.xidian.edu.cn>
 <20261030.pref-04.ec83d43911ee476d@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030.pref-04.ec83d43911ee476d@stu.xidian.edu.cn>

On Fri, Oct 30, 2026 at 02:00:57PM +0800, YuanZhe Liu wrote:
> Hi Mauro,
> 
> I am copying this address for visibility.
> 
>   [PATCH v2] media: rc: fix use-after-free of rc_map.name on register
>   error path

This looks good on first pass, I need to review it.

> The remaining issue is a uevent racing with keymap cleanup while
> registered is still true. The proposed approach is to clear registered
> before freeing the keymap.

The problem with the current approach is that the remove uevent is
suppressed if it depends on registered. We need the uevent to always
be delivered, yet the uevent contains driver strings.

> The follow-up linked below describes the remaining issue and the changes
> needed for the current tree. I'd appreciate your feedback on the
> proposed approach.
> 
> Discussion:
> https://lore.kernel.org/r/20261027021718.14264-1-25031212351@stu.xidian.edu.cn
> 
> Original submission:
> https://lore.kernel.org/r/20261027014144.9144-1-25031212351@stu.xidian.edu.cn
> 
> Thanks,
> YuanZhe

Thanks,

Sean
