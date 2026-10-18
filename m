Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF351F30BB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792283982; cv=none; b=gmWBy8WhdbqPUPw9hpBFxg9UbjG5JK7NKbpc1jr4T7U0qFBv2bA074LR6d9o2nhAP6IL/sCR0ZvvIgLxllVX2shvuBRF/7Ka25NlhgVUt4PAHDxdKwY6bjpDCxxMGhrqEUv5VIpc6CwZVU4LS7unTqi4zRLszXQkpyWvck96vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792283982; c=relaxed/simple;
	bh=NkfoYPwTZN+canY3pFkS9HfCxE5wNmxHd3PQVxTOzzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0/fE0Cg5iBe9NC62wSmjkNIn5aKpC3S6TbMQrq8u8mUkhaiZTocbeJu414v13ASovkNGb5A1av/PyZRHw3ftdS5gKqlgOkkccVDD0x+t7j5dSS69wP3T+ggPMX1I5waYRAcS42TTIrbS/PGXOdaKaH+s4upIDlCzTbF927YHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qPr2xvq8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hp9mX5n0; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qPr2xvq8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hp9mX5n0"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 5E8671D00066
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:39:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 17 Oct 2026 20:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792283979; x=
	1792370379; bh=JiGUKMxhkl6t+/m7adlAHHwNXtX4gzjcwJvHHAG5OjE=; b=q
	Pr2xvq8d4HeOFhvA7Z2cqhLF2iWUN/QDRWd3EN9rjmcsMYDnCuK5CCcjB1E4/eyJ
	mw7puhWS/1tMSJsdZmsmtjquaaoi2vBeTjkfI0OFtNUFAkjIR6SlBZJs0JovvTgD
	dMHJcC5GFy/mjgdPW5/6QXIXRDYCNl5G4wcR1qLjFoxRq5nSzbdF12GrJu3udhme
	O2owBakoqMxiea3ryJLv/G3AHKT9deCBO0BaKuHw9nT8gzDI59eRTKtYU642xFyu
	rP+2Qa3eMNspfDH7yM5Md6nf6jXagVNQGc3ccYVWUn38+ebCpJQJY62ay+O6sXiy
	VWrF4ToKLEW51PJYrygmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792283979; x=1792370379; bh=JiGUKMxhkl6t+/m7adlAHHwNXtX4gzjcwJv
	HHAG5OjE=; b=Hp9mX5n0UhGN17/WKPwpp2ATr2XLKkSWMSgO64NrTZzfZxNvbol
	oWuTk5FjIGG2ogSwHmqgp83L9lIFXQhmucHAYkzZ9kKGdt52v8SgYlp3WDs1JL22
	HkbEXG44jp5Rinz0ryh20r1nTuUR9cRefZMvrLo4az2gdwZzBnZ/StqiVriT7Hb9
	PwOFvNj9zjFgf7SVntHnb2jdmSqEJFila1f0EnuZJ+LRE2apjnZnEtPPZ37mqbb1
	gzKDjJUxiNsqsv7W10473MRwcf3CZjLGa52YuIVhof7SUcorSsWjhYAsX/2ntNku
	iWT981xpsszToRovzDptq4HP4L0A87h/V8w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792283979; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:idmNwBVFyhQ1t67f9vE5X95GfM231ysI8DuuHPv97TF0NPM
	tiAWQXiymoAh71lDoutVY8iGzVqwPajKsWzsFy+O94ncfgDXG0373sZ42SyHwO0w
	8lROzceE6pMFLkGsfrgDlDC9dZLVVhwmqBAWP/wJcIEegAfSXPjnZS6jTI1qN6bC
	0LhIdXlVqw8pQF+9JwylZVMLYYesHSLAtZI4xfmklhPEVW64HecprWTnsY3Y4pMg
	N7YBORzr3wHoXSAx9U4g1MvzTPqc4xrKoDvJb4+O1kfbgcBTSttOiiGVYFWWiWje
	ChgXUOCHhvhUheN9JptlMyh2DMVTEjGrwHtIVtA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:mRa68anMYfxb/OYmX31Xcx3NI7sPhr5yhIct4+XYmjw=:NkfoYPwTZN+canY3pFkS9HfCxE5wNmxHd3PQVxTOzzM=;
X-ME-Sender: <xms:ShXUahHsxMACKL3GfOB3cI4Lr-C-bocrrABCAVGEjRrDrMwtUU0HZw>
    <xme:ShXUakQSdoUewcoHae40CXWYv9kANP2RJTzGgyUI4XQ800WmQaenReUMgHhl9qWxc
    2Rv-lBG-aZ0U7QLk4Cn-LGLrbdmOEzj006ipsoNJa0uiAiqGPnITE1->
X-ME-Received: <xmr:ShXUaqtcJaC_3wom_lgTHDJspIqWBBBaT8ZoN91sM1svxS8eSTOtPm2w20iev--13mJOK0ZR09BvWHJuq8AeqY1ftVMI>
X-ME-Proxy-Cause: dmFkZTFNNFliXbZgjbEmvJhDjie9jmGxw5dMDUWiKERgaxHt+jyYNqaHKb/DrgeZmgQ1N8
    TZXQ8q5/NgCtAALfabakjggkdRi3bcKFPhMjS9WEejMySQcP3IuDjEtNINU8wpi7crzk5h
    N+KYXbJD5Ojhgt+Id4sEnTaI7zjhl6RNF7opJXLjdA5GOSiEErowXYuayJ1PLcVYpcXsH4
    eVUKvRaJD+l9hz1UlNFnPg5/VLVar5ZtfvKTkaICvypCELQbro7+j1Dnrq9kMBJmk/t5by
    Jl06/qY69ixTbL/3bEkvGRJgJTirIYn1HY03GKChpJByHLrzADf4zSVapnFqGCv3NTAgOq
    ftztZbqkL3ZNSyV777yYKtconDqfcm8m1deHn9dD4eUmhYwfxjRWjSJ9BM+m7JczNfaCh2
    6X9IyEs5DDru8Y6FrMNMDROWPe4Vw5MU0+M18STnWq5SRPRPiCDiKGUJEugJEPdogSKLKt
    Q9tvvdyDsHPNDBM1XL2wXskhOwx1qcJgFWssCQ33L+mKKobmFkUaLAH5xEqlcS9vkqkYc7
    J+BIhQO7JhLLgbTCmDZO3YHxGLUHJcq6MHCzUTONKikOi7YrsQtEpN3I0SrsHmOE0z85pw
    q4/+l/un3PGnWuclLYWVpVd2tGTC3QGEyYEZ/6xDwqzTeAK73cwvxxoxmnJg
X-ME-Proxy: <xmx:ShXUajwCZhapHarUHhfTBTW8wsQqm9aWRpCnTNA3L-Xy9WWjwRVXDA>
    <xmx:ShXUak6OVSKWebt5OH6k_X7A_tXMzHreLxmBrxu3t-b9ey5qZrifnw>
    <xmx:ShXUatWiAQJAmA0r6sY50iP3Hexp75qUejndly4UsHG_drsk5-VsIw>
    <xmx:ShXUag2711kRqhV1fzJxkLe3o3ujyp4YN86bWjfSbffUhr1FJV-WDg>
    <xmx:SxXUavaz5XoyMWAaV-RMQMHOXXhUSrZSd-7HTczyAR4gJpi1H91p2Tdm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 20:39:37 -0400 (EDT)
Date: Sun, 18 Oct 2026 09:39:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: use release/acquire pair when replacing
 underlying driver on card removal
Message-ID: <20261018003935.GA278783@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261017081720.186688-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017081720.186688-1-o-takashi@sakamocchi.jp>

On Sat, Oct 17, 2026 at 05:17:20PM +0900, Takashi Sakamoto wrote:
> When removing a card instance, the underlying driver is replaced to handle
> closing operations. Without proper memory reordering, other CPUs may
> observe the driver before it is fully initialized.
> 
> Use a release/acquire pair to ensure that the driver's initialization is
> visible before the driver is accessed for close operations.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-card.c        | 16 ++++++++-------
>  drivers/firewire/core-cdev.c        |  2 +-
>  drivers/firewire/core-device.c      |  8 ++++----
>  drivers/firewire/core-iso.c         | 32 +++++++++++++++++++++--------
>  drivers/firewire/core-transaction.c | 20 +++++++++---------
>  5 files changed, 47 insertions(+), 31 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
