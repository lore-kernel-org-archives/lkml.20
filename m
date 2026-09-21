Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E8305E28
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957948; cv=none; b=SOSy16uDqA68UP0dBLb3VUe0XW7VzVZkszVEeFbbRlxVoXhtxQbSRjIwUaiAgQO30BsEiE80vU69aYC7t14XFQ46CKYUaULUe1vUr/HsVIM7Hgo6sePcMmYLmjwLRheRGBnTth6Qx5By5HK440FIA2oO1mFB665litpfYPlxbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957948; c=relaxed/simple;
	bh=m0r56S3hSQhBRPkhqPMSwiBxYhJrLIiWQ/I9kkwF/hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhaO6an8BS5us6KjSrj8YR2G9yGkS/KJzibblxCtCeqX3DVXhzX2uqOnbwfPAcLtnFJY+0D8iO8J+2wSFar9ACLSFoYbIvVOK0nbHUsSsF/DJcb+T29ub2AqL3CMEyX1e7ZNVjwj7s2M0SaMaiLdmpxOkXQ3lU2vxU9s8BYdqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Aezj6kIP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dq2CF8eZ; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Aezj6kIP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dq2CF8eZ"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 3416BEC00DB;
	Sun, 20 Sep 2026 22:32:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Sep 2026 22:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789957945; x=
	1790044345; bh=Sh3Ngw+fLWXxQtXc209KEnM9p9GrBTpJNLc3pNKdO8g=; b=A
	ezj6kIPRiWSKFqGCw+wZYJaC0i37Y0lCJF4cPCvEUV0j+zTa7miTsN4bMaOvkkOV
	7yeV1YGQAVsCqFDboolLiPWFIwuM1qr6DMjTlF/jbgmgkgl4NL/WyzQNEjeYPa86
	BldS3hrN3uuIEM2LAqSBMdjk82w5Q598usR2vjOH0nlGlNaXT312uFpjzKJiMyiO
	AYQoACbZfzMSqYB0Hn2Itd83iiQxxudd0EzHe9wpV+mb11APp8SK2tGIjcNihS6g
	wxyvab1FzIUBu4DSyCnxD2lzgaoKlDLc59SRthqmnq+BHgxG39d5f8wMKvrIaULW
	l2PoOAcSilkra+enp+WnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789957945; x=1790044345; bh=Sh3Ngw+fLWXxQtXc209KEnM9p9GrBTpJNLc
	3pNKdO8g=; b=dq2CF8eZcY74y1wpXZ3ZkAYdmHcWFJe5Uuq3FBGfgU5uax2YVFx
	fcY1LJekpP9AWhIGR3DAGmcB11N+A4PvDWMGfD+vt4nAKkfIrW11RJef3MSdMKsp
	T0IPr2QmxejzXzb99/lox/xC+Tt6TWkbwkyXyKFWfvO3JyYnIiFGbUnrL6OdVZiA
	exiGBZUlHczH22ruhJZGM1Z20JWZIPOH4mOlhE6E5vmjqUd0v6xJTFaR0Fw1uPiJ
	5nrjYBSIKJcCP3Rgsr+Jt3KQxG6UArtyLdjTvkulzXr+DGGwV+vk9XX83zGCStl0
	u1i6mB2GPsZsTtoryz6Gp1I1uItR92hk87A==
X-ME-Sender: <xms:OZewasmDxiv0gmXzpKJpxicWBpiFjsqNEOkRZwMZhyad8Vv6twoPOQ>
    <xme:OZewapz7EvEbHqeXKrrpDhFjgX_NCOUcZXT0lh30x_v5N74IZt4kIXPksi18jQdDR
    b7drGuuc7QhaWismybBtppWyFnWnCQvUGgS_Y4cn2LOIshSvjrvuMYv>
X-ME-Received: <xmr:OZewaiPHudgzS_JR24yMfpd9aCuQEElVO3TB2Gcwa-7tESBBz4cyUTxo9uyx3l8YOIUwWs9dKp3V4qHDo8-4ItejFCuDyA>
X-ME-Proxy-Cause: dmFkZTG0Qy4X2C1dloPveVYrRoerhcxQbiuuw0gT1WLqK4F83i/25qUblydC0tY7lmSIE6
    kBrUrPK/qyfCl3lrSQ6Ju9QZdIQ+qcyPNcsrBJAEs+186KA5S0Yc/u3RcKp9hj40Wvgol6
    gkg2NWLdvn7w2pDm5UJlfG3kEb0Uj6fbFzjxtyGsKo11wz9fQ9kWB0Aji1d9SYmOzeJnN+
    dTUWfE4eHEt3fthpEGzP+nidU+XGN+Pdlr7ilTUVYjfBTnC4yA7OR7JGrK0C96zz+ODLke
    9u0vSt5bWeC22cyJdAJxaIeALjIXtR1G4X03Esh3lU8kFmup0kbTYZWtdEZ/5n664C2Gfl
    EtUMllZWPpTXlmkJM+BIgSlkMbwap/TTSjBHMyRLkilJUuh/o0OHptxiu1QAF2+OpoI3Lh
    LOqwz05L2xHbXaySKLddvREV8TbSRHn/1xjl7050FfLQny/0Xp6mD0tkbAJoxA3qtWjKuK
    EYfUNpqpjhaMlV8VlAMwVbD0hvt5JoMjzh2+8vk7l8YL0Xvjro8+z792bjN8Cn1BDAE1hS
    3zEru5/mYudxNid/KxrAv5t9DV7ypZOYBuEt0ktizlKUZndKq4R73upT+CjCfkSvQxE1kH
    0T44pZzgaSeRCKuQExDIxRdvi4hE48LvX13BTAYx8qAW326HTevMYPoStuYw
X-ME-Proxy: <xmx:OZewalQn37s0Dp2SKI_0iUyq5mRiM86yI4qUxehNHNh4JEicRskFJA>
    <xmx:OZewaobpXXDihwRJyGx3vbHVbti0WJ882K2ICfYEzzO3C4WP5nDCgA>
    <xmx:OZewaq3JJGVuQ69H7-NRI4t4nbdPtXY88u6kwVJc3rLnZXszQD673w>
    <xmx:OZewagVV1UMsgxpb0DqBv3Tgbit-4Cio2LT0STE5wbV84l11qhTyVw>
    <xmx:OZewam5D8-TIhXJjRCBKRkSLQecBiCrhJ0HyxlSO-RM-o9Xb6hhxNzEB>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 22:32:24 -0400 (EDT)
Date: Mon, 21 Sep 2026 11:32:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] firewire: cdev: refactor for bus reset event filling
Message-ID: <20260921023221.GA279001@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920071501.77785-1-o-takashi@sakamocchi.jp>

On Sun, Sep 20, 2026 at 04:14:56PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> In the cdev layer, there are two places where bus reset events are filed;
> the update path for the associated fw_device instance and the get_info
> ioctl call. There is still some code that can be refactored in these
> paths.
> 
> This series refactors the code to make the memory ordering and locking
> scope more explicit, and adds a KUnit test for the bus reset event UAPI
> structure.
> 
> Takashi Sakamoto (5):
>   firewire: cdev: use memory barrier to access fw_device members
>   firewire: cdev: refactor using scoped_guard() for get_info ioctl call
>   firewire: cdev: refactor copy_to_user() in get_info ioctl call
>   firewire: cdev: add annotations and comments about race condition of
>     bus_reset_closure
>   firewire: cdev: add KUnit test for bus reset event UAPI structure
> 
>  drivers/firewire/core-cdev.c | 63 +++++++++++++++++++++++-------------
>  drivers/firewire/uapi-test.c | 20 ++++++++++++
>  2 files changed, 60 insertions(+), 23 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
