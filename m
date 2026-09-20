Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C046EF9B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789922040; cv=none; b=OKNZtuJl1GlkiL4V6b68Z142UupF9wxyba/HyofAaVGhrC2UWUXiwYM0FA27M+tyLPQ7LAbokOVqrJ9Wcbn+lIo71kkBKhKuq5ySP4P4MpjI6CP6dGDhgrGgGSk2Be/Ig/tso9lokKIs3ptprQSFlYvNisO/n9VUGJi8vjvMtfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789922040; c=relaxed/simple;
	bh=oVZz4FSt4/6OQv5bdG+VXPCRb+ckEU/zQ7lo/eBqj3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXTYSpLewiMLU4YFHjTAtRuJKCsTyT0/ly5PwNVE+GOfJDyqEOkJ/gkNNfL5w8+0T4aCpFbMM2JWdoM6cJu66PJZAwL2jOxBb/Pix+NbQexNEgjXyWC4eDZSSA7SBMUIQs5lSO1xDsWDosa81me0mhm/OfjXooWHndgcm4RP3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BPWDp+Mr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W6ya0fVC; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BPWDp+Mr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6ya0fVC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CEBC7EC0244;
	Sun, 20 Sep 2026 12:33:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 20 Sep 2026 12:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1789922033; x=1790008433; bh=/xTESrJV9j
	0F1oUnsavALKCtQFY4jYukCVnF4p9dGJk=; b=BPWDp+MrGSeLyrBiPdKFEfQqm4
	t1trazD5YHo8eQ6etInZnNIoKj1XF0TyK8R5uBKHS27kOwkaeFxvvImOjxNVWnnZ
	ciJX4BOb1RG5VM0E+GbFjBGp7H1fQcfJneO5Ax8KFxnW8qW0C5WCa0jLW8BJO0IA
	QUqQWbY5s5g8XJvx2V+CSe0Rgp97KaJYC7zzpwtWr0nPJAgvxkEjuqxdult9MChY
	ZrIPFd72YPzQrlRWcHoiHwp+D3CLUSJz6MWRxW5i/FHbcBQC8vIYHKP/s7erJ9/Z
	un6WwJMa2zlMYm2hewsLJoq/QN7X3yiV1/MaiiLr8blQd8ltUXp6qBhAUSgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789922033; x=1790008433; bh=/xTESrJV9j0F1oUnsavALKCtQFY4jYukCVn
	F4p9dGJk=; b=W6ya0fVCch07OJi17ZGVfA0O8qBhaWgCsRi6fUdp/tir7BF8x0D
	1aa8MjbyeLEXbjZo5QMhPItZ/ugAf/HEW/rlx1Jo3vMtfgF9WchDMPW5FisCf539
	efXlOUUovWYFhXfyl2QaZ1cFD6DcAXM04mDagg1dKcd/FnhkgDrU4ki7LRef4zew
	A0m0KnDEMGiPVfUVyWQQ8dHmVF7jweaG6mMnCi8B/5vK24+k05dE1/k5nGqYG6X+
	WaVds/Oi/e6h28SJWDIRfKfxy9k8p7AZxKFz69ErBasQ6a+1gw6316hvc5OuRQWu
	+awLVRuJFYZxbLIt5pPDjxCVtmypUaDK16A==
X-ME-Sender: <xms:8Qqwai80sTh9jJErGLwZLioS-w-GpOypYbHXx3qFhJ6bGkMuxGdJfg>
    <xme:8QqwaplY1lDm-0E2lRiNfDXfG9y7anS1q2-iMqRWgVgm9okaqwTpodcf3Vk-Rj-EQ
    j9rSnclP7xMrYWk7ylZ7T4-Jq5JF78XUZxTz-YuUNtnJ6J_R1RaPeo>
X-ME-Received: <xmr:8QqwagXC-_xdgaXvikftqX23uSRHPH83cLMzitg1wrSyRut_UShFg33MqZWP8bdXGRnn0AUUTlUq55EOSS2G5EqKA5ZLE5ubSGU-u1SQXfNJLZaaBRUphqr3hg>
X-ME-Proxy-Cause: dmFkZTFe6oyCdfFP30tKwymB6A0/48I088tI3lf6QSLlxQnh3MMWW4O+K4ZTDgWMxtMiYe
    ZOpGrFpc6pFrR3shuAGmIU+L1Q13Jv+aJqIqdgkq27g8ErVysUOmd8jzlu/P6JIzWYXwlk
    CBrdcGmgAsulAhxu5uYxzWtLpD5UqG0h6vOyn7tZIQuKalYUbSOmZJNJINfqiDPiuab90p
    oddxZRBYn0+oz0ryM1A2OLQJiCOJuLOg8RfZrjwDrgyRBk3hEWTowbYJtra1ya06+MYhSv
    ZxkJeNxeBbA+6NpFhjWcBFvGvape5rzt7lOsYWCzzP6rk3kQEUKosGgcnWjjSXrpZDsxJf
    OATcs0R2qsU4lBoEyHS4rjx3a9JOExsJ+6Ckp6MaW6C3DcGw0MAEK8XwiesrNak6jI1MEY
    JmYynKWaJn9vTHBgTHjkvXxw6E+/tsYsCkN9vAktutuvl1v77YpNt0A5HbzhRUoQqtkgLf
    UAxkHzjvkoxzMflzWMT3JfnwPfCI35iDvoOAje2J2ZhWvALqVDjm9KlT2hvb9+PX1jMzna
    GgMAVsXrbQwTI361WhGIUdDpneniSCeZAW9jkNtpmKfqkZN+9ElYRszkD9gLlt9N/sGvhF
    qD8Q5wbSBmbjl1rFfyXGgWN+Q+uze7YujFwXZm2MMqA7l8UOohgQ+Cv/o6+Q
X-ME-Proxy: <xmx:8QqwamFEv58LY6fGPXWRiEldi0SI_sZo3vMjDWbP-LVGUN7xp9hh_A>
    <xmx:8QqwakcAYTih-VmS1msiIN2kD8uIi5tLck6NTjpkZD7lsMyrs_Yc9w>
    <xmx:8QqwavJB_f5kw8pmFHFX-lXVuurjmCHbo2xUZubZowf7V3zNF7PIaA>
    <xmx:8QqwahHIZRj1vI3tiiVqCEuzDG2mx7bQwntM_fxqARbpSuX8K2zNRw>
    <xmx:8QqwashBgTXoVS4ni69OFouFzWIokzXXAM4TcA164XHV8l0LHAeqLmwz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 12:33:52 -0400 (EDT)
Date: Sun, 20 Sep 2026 18:33:49 +0200
From: Janne Grunau <j@jannau.net>
To: Dmitry Sinyavin <sinyavin@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: core: Fix OOB read for bit offsets of more than
 one byte
Message-ID: <20260920163349.GA378504@robin.jannau.net>
References: <20250901-nvmem-read-oob-bit-offset-v1-1-b610e18cdd3c@jannau.net>
 <20260919185636.3054303-1-sinyavin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919185636.3054303-1-sinyavin@gmail.com>

On Sat, Sep 19, 2026 at 08:56:36PM +0200, Dmitry Sinyavin wrote:
> Hi Janne,
> 
> Thanks for the patch. I independently ran into this bug while testing
> Qualcomm MDM9607 TSENS calibration. I tested the exact change against the
> current NVMEM for-fixes branch at cee9395acd80.
> 
> Without the patch, a focused KUnit case with a 26-bit offset returned the
> expected value but produced three KASAN out-of-bounds reports. On the
> MF283V, the unmodified kernel produced exactly seven reports from four
> TSENS calibration cells, matching the accesses predicted from their bit
> offsets.
> 
> With the patch, the focused test and a 16,384-case extraction matrix pass
> under KASAN. A hardware A/B test using otherwise identical Linux 6.18.44
> kernels produced no KASAN report with the fix, and all five TSENS zones
> reported plausible temperatures between 36 and 38 degrees Celsius.
> 
> Tested-by: Dmitry Sinyavin <sinyavin@gmail.com>
> 
> I could not find the patch in the current NVMEM for-fixes or for-next
> branches. Are you planning to send a v2 with the stable Cc requested in
> the earlier reply? I can send the KUnit coverage separately if useful.

The change is no longer relevant on the systems I discovered the issue
so it got lost and I never sent a v2.

I'll do that shortly with both issues (missing Cc: and long partial
SHA1) fixed and your Tested-by:.

Thanks,

Janne
