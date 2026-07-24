Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD103AE190
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179931; cv=none; b=f9k33C23gjAoowc5ui35m0+mf3BbE+qDuf8/QqNippr/IzVqmpsNaIEp/NewHD+5vIKtZGepmLQ2lnxcYEieueyQCuMG5fYCSz+cQEc+zdLR3vLyTbCvZkR/a6mGAjsxe3QY69K0juSGIiNFWej5Dv/8Ae50a6tTAR1a+rjhFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179931; c=relaxed/simple;
	bh=5wFA45ix2kFL0vq42scAgYM/zl1QiUa8lfttP/Wv2sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o53C0csCGFx6A9ZPkY4dYfWadHBOok3c9XwqLDQYBtkmSncNlz9sO2TS2mYl1OjkFiJT3nhzk7HZjTHXaq+ilC3cZNWrQEZfoMzi+xHBuEOx4gtzaWZ1hp7YJGvFDUtbGtSdAxmKxmdihX8/bazmHfa9afDU0c1wTVpycM5TeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=WDm4XZNt reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=FtC2iuLz; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=n+XSNepU; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="WDm4XZNt";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="FtC2iuLz";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="n+XSNepU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1788180825; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=L2qPTywjE2JdszhljQxlHn7VGZG8i1CqDK7xYsvAFx0=; b=WDm4XZNtrTHSA3m6B3nyGuu+yh
	uIbfC/MkrGbGAJMNcNzmCRSeeKBn+R77Zqiuq6Ce0U3e7MTBmo+jIw3AxFe/xgE3NXokSGuNKqQGD
	CPW3Di7XcVK1VCyRjwJVLDe7Lza7yRdK+LSpcDb0T6OjNqcFl6XcV99fGN+bVmfyKsDjP8Vr6Tugx
	MCCkZ2VXvUaGS6j+/4F+nSAu3nFaiGEF/9z8kff6GB728Bir7l5iyfIKqv8ZHpkEgrM+0kQlN/UPd
	otXJ4oMPRMYZvQCxVx1yhROqH9RM/i3Qb60RlqIw0YxTfUOKZfW12E+lphdGdT2upEbfHh48wc8yz
	ZvVPfxIA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1788179925; h=from : subject :
 to : message-id : date;
 bh=L2qPTywjE2JdszhljQxlHn7VGZG8i1CqDK7xYsvAFx0=;
 b=FtC2iuLz5Z+BAPsvaS1UcXzchM3pKCcXP7IIwIuWOlXK9yCOy/5oOn6c84EyjTNO6aWBi
 nB1HaJBxu26l4nnn5Ypq6gV8A3x2DPu5Z2BSg+d+NbI8U0+NSPJmpg6Obajjh0TIcqjr4cE
 5yxFtxdH/pPp7YOpMgEaN9jea6sWf7EVSjj2yNwVHCG7CMJPAUovsPVpeSTl+X7hezQwxqm
 v/Yk1RPLlDGTWcAC3W7n2d4XVlHKIf1ZWDVlAovJ2mXD8NHNNhbxG0zPeyZx2K+JP3d0zON
 n5yiDQNng5veqKLWR5Fg2XgDiH710xV8Iwx937P8wZy+k9dpsNWTsOD7oSXw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1x11HP-TRjxli-PB; Mon, 31 Aug 2026 12:38:27 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.99.4) (envelope-from <nicolas@fjasle.eu>)
 id 1x11HP-4o5NDgrsTBd-m6CO; Mon, 31 Aug 2026 12:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1788179906; bh=5wFA45ix2kFL0vq42scAgYM/zl1QiUa8lfttP/Wv2sI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+XSNepUAnjdxtRH3rFYWT6zEwG6kl5UCEgcfG/krRVzECIrfVlCRWxUjL3UFLs9M
 C7azZVHyQFMKMiI2KWiUjMuYXE7sv7P6oHVkK3K+YicPQzYeODwp4YMaFpNihqC3Ee
 KSgEyShVmun83uytnRfgQufgmF+LJACp6SmBD2Ws=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id BCBA84C4DE; Fri, 24 Jul 2026 21:55:13 +0200 (CEST)
Date: Fri, 24 Jul 2026 21:55:13 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: Add my name to the Kernel Statements
Message-ID: <amPDIZ4_aXEcPb71@fjasle.eu>
References: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
 <87cxwc8qa3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxwc8qa3.fsf@trenco.lwn.net>
X-Smtpcorp-Track: 8EL8GnilTYEA.eG_WWUewO43f.GQ5JdwVoX7D
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sd6z07ZLqi
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Fri, Jul 24, 2026 at 07:34:44AM -0600 Jonathan Corbet wrote:
> Nicolas Schier <nicolas@fjasle.eu> writes:
> 
> > Recently, I stumbled over the Kernel Driver Statement and the
> > Linux Kernel License Enforcement Statement and wondered why I
> > never before had seen them.  They express strong convictions,
> > which I do share and support, in clear words.  I gladly sign
> > both statements.
> >
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> > Nicolas Schier (2):
> >       Documentation: Add my name to the Kernel Driver Statement
> >       Documentation: Add my name to the Kernel Enforcement Statement
> >
> >  Documentation/process/kernel-driver-statement.rst      | 1 +
> >  Documentation/process/kernel-enforcement-statement.rst | 1 +
> >  2 files changed, 2 insertions(+)
> 
> These files have been static for the better part of a decade, and have
> made their point.  I'd really rather not start adding names to them
> again now...

fair point.  Nevertheless, thanks for maintaining the doc tree, and for such a
long time!

Kind regards,
Nicolas
