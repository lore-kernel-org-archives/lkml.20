Received: from mail-108-mta94.mxroute.com (mail-108-mta94.mxroute.com [136.175.108.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F413BE162
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147738; cv=none; b=cs6qclYYo3XwzGZtnfZkFHMTS7Vc7PIbtL2lb0whZ7lJKFwygE8WNkKzptlXcZZNxkbz5aYD7vmqTF2B1OG8cjPI4wIr8Ay3bAeC0UAT4T5Usdgdz1UgeyEEprxo6jLaxS+bAwzrJGTBDJwYwDcc6UONrPrDAWNNo2bj/aHUqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147738; c=relaxed/simple;
	bh=buc7jntNZAuL7+uiDoNn1A3AyQ385kaT3o6wYzSMWqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mG0FoRK5cm5rm2pnwt27GF9/+jpxtLCEOSC3pq/BAakBYDhtjVuJCsWuRrV7oguiuAa9Lf9Qun5kNBjVNEmBzUPq44S5BTBTByDavaqGFYnA+OSlC81E2cia4kwXWX4PK13qKnEWGNkxC2t7N4WSC0yl7NPxFJziCwSwdeJf2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=rim65Kzl; arc=none smtp.client-ip=136.175.108.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="rim65Kzl"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta94.mxroute.com (ZoneMTA) with ESMTPSA id 1a1444f7d8500028b2.004
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 10:43:42 +0000
X-Zone-Loop: 84d93e1c22a72ca780b87106c45afa9ff8010bc8ac96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Subject:Cc:To:From:
	Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FdJoc7OsYsMfiWdI6bvuoyzs9LSKzPgcVTNLmjlZ+eM=; b=rim65KzlTqIh/wjgtNjpGaSc6G
	Uw8p7/PIGEgnd40qE+1tBpoJdZzVTukLo+h03WWFN8QIgW10c74NTo+XttkHyY/6F6d/0dRTFhV1r
	IPqSvanso6fQDJwLTud5NtoI7IzMIKn6i3vuEUWRMc0XCxwTg4QtTTcc+DNDaDvU0l1512yyxDGtA
	PNS5iia+0hP3kpxU1scx783aWhUX8qGqSalOj1VhbsYQQSMHegi2W/cKit3N76NhVos9V5vSXcdCh
	FtBwjPi4gZqL7mLy5UXeKJEe3ZeTKa7uu2H3tQIDp4gAzgBBWWiOGbK8Ql4Bz4l12B1Mrf/AYCWOg
	rEF2aw8g==;
Date: Fri, 16 Oct 2026 10:43:27 +0000
From: Richard Patel <ripatel@wii.dev>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:irq/core 3/7] kernel/irq/manage.c:1208:2: error: call to
 undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <atH/z6OMuEjyvOol@wii.dev>
References: <202610160017.QOA49KVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610160017.QOA49KVT-lkp@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Fri, Oct 16, 2026 at 12:45:30AM +0200, kernel test robot wrote:
> >> kernel/irq/manage.c:1208:2: error: call to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1208 |         clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);

My apologies, manage.c is also missing the wait_bit.h include. I will be
more careful next time.
