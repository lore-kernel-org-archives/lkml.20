Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE7368D4A;
	Tue, 15 Sep 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459310; cv=none; b=L5+6hhYL9NXZoShUQH7cIJO93cCj7ZQm9inJWRTLZk7s783LmtRky0lc+a8/7IYhGqkP5UCAZG7S5ARmsG7EZZCczaT1+LgnhSLh25itr8NwPePbGLwMAwmBDJombUOjJkmzgfgpcwX5IH9tf0/ik1q4o0pHA5Qb9XQFtG3r4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459310; c=relaxed/simple;
	bh=d6ooW57XAUFISi9NF0ttHzaTWToF5XroAW5ZOj8uqOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbI+5S+MenmtyBmNDgHyqZcqJW5580TCIv67BRFGfXygjjR3DGSb9UI5Nk1+EHNwd8wdp2auyENL1bphTyPBgC07DiMQ9xulLioaXJgqOaEblCvAtX6WZeGpdy5L3sFDSFUmC1wBxQx88EeyByK0ZBS4eGfn4+LP6CXSC8NGWd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSB0NoFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSB0NoFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2921F000FF;
	Tue, 15 Sep 2026 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789459309;
	bh=K6UZOv794vnzWA4IAYLdOYWSpbUXkdL4d/Yv5AxWgYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSB0NoFQL1W8i01Ex4iiwATufOkamZbSs7X1JJtW9YF6/jDrxG7p6NPaVbnlLrP+s
	 383mKiTvKqQv2tzbDUMaqqznjkAiz0I/sqwhv8r7YPdEqK4cSQtyeZJ49afFDCN555
	 VqJN6hsFUW8Dgwyt+wfD7cxtE/IGBVMtAEs/XYnoCehUbR8/UPbrZg2g5ggqU2jPWT
	 LIA3RIJRmEQLZvhjwiPFtU2DPRfBxA8R06bLjentXvBX2FLlDlexbt3zD64MRPrurU
	 cfl9/xicvDuNxHtmXNC8baTF5Ukl6/VVqvdV2rnhr+Jr5tDtV+MfmXySqaXtk7j2Xi
	 RZJAS2cdlK0Cg==
Date: Tue, 15 Sep 2026 13:31:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the phy-next tree
Message-ID: <aqj7Z__J2CqeBISU@parshuram>
References: <aqgKDgDpqlnQPgDz@sirena.co.uk>
 <351ce005-b7d9-4333-adce-896248c2d7dc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <351ce005-b7d9-4333-adce-896248c2d7dc@collabora.com>

On 15-09-26, 09:40, AngeloGioacchino Del Regno wrote:
> On 9/14/26 16:51, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the phy-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> 
> There's a fix already:
> 
> https://lore.kernel.org/all/20260913172930.1150324-1-sashal@kernel.org/

picked thanks. somehow my builder also missed this.

-- 
~Vinod
