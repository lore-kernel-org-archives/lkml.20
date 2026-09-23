Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859A448D11;
	Wed, 23 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161041; cv=none; b=Nounmc9ud5+w7E3k0ZVAC4xcIllfjNktJQjfL1vaVjNpfU4+uFyzb18YJv8pChMnuAUQdc6oOKGurlYqVQnWouZsarNwN2aT0kRsBgRJ7u1x3HGtYDHz9lhxoQjTsTYLNf3HBarzKzHHuA3pz+QRdDawNBIYScgoX3XpF4eCMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161041; c=relaxed/simple;
	bh=FBcW0sQHEM+wYSdwsasskMwS/p++NavD4hMKaauYwEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZkaEexQspVNg4l7br1TQdgHr+UqHD19cD5ezKhIPqX4tsJAOtsHKWtYvShZbrFh5wCBQqPurCU/UbkXBs78iOMW436otC0c3L7+1eGPQcBlN4nXGlA4likXFBSoP3kkZvWO6vQy1TsQxhvhHVBWe0LR5dZVMKSiIKTmDd2Xkjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ffoY0Wtn; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ffoY0Wtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790161033; bh=FBcW0sQHEM+wYSdwsasskMwS/p++NavD4hMKaauYwEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffoY0Wtn+sXeT9H97jeGHJwvlmf4yN9LHjfS8bC3Q//tpFkOlI88gNWEZWJumqcV9
	 Hztwq1I/Om7qMJ7n3q8oHcWU4IYT/wXtWKXiCJiHRbDPd6uOfsuv8yhd7mpbhS2iJZ
	 unAxpbrieVrTq0dpK71MzIM9xNuyYKAQj/+zdMBU7o8PMFbY31Rw80UjM+kmb/UrRM
	 RNjeUkzZdv7hyEpvdOdtRs4C0uprGSIv3R5pVLEtnDeXiIOaTe7n4WQ4XVtE4Krroh
	 FayYbGJ7YGNQvhU18TKhDxyFZJYpob61A4Ims82Xs7u+HFxNQSlMC3P88SfPF408Mq
	 RpPgWCKdBBImg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 9C02940B86; Wed, 23 Sep 2026 11:57:13 +0100 (BST)
Date: Wed, 23 Sep 2026 11:57:13 +0100
From: Sean Young <sean@mess.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <arOwichhqiHhQ2qD@extorris.mess.org>
References: <arOnVzMCpARSubSY@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOnVzMCpARSubSY@sirena.co.uk>

On Wed, Sep 23, 2026 at 12:17:59PM +0200, Mark Brown wrote:
> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> /tmp/next/build/drivers/media/rc/rc-main.c: In function 'rc_register_device':
> /tmp/next/build/drivers/media/rc/rc-main.c:2021:38: error: 'struct rc_dev' has no member named 'lirc_dev'
>  2021 |         if (device_is_registered(&dev->lirc_dev))
>       |                                      ^~
> 
> Caused by commit
> 
>   37efd09ba2c62 (media: rc: Ensure registered is cleared in error path)

I've written a fix here:

https://lore.kernel.org/all/20260923085948.312798-1-sean@mess.org/

Hans, Mauro: could I have a review please then I can merge.

Many thanks,

Sean

> 
> I have used the version from next-20260922 instead.


