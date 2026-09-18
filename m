Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A484450B41F;
	Fri, 18 Sep 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752939; cv=none; b=Xd8eIyk6plpz9mmYCiDGKd5sQ63BRpazbdVc9/3er3EDxVHo9SR6tUmGs5zJd5wf3JB/qITen/MyOLWASGG/gcKyY6oSQ4hZcoVGv2vJ0+3xtM4bjx4tEuGgNgc8qXeg2B0pU4ImJUPfrVUVUTGL3fcVygJzK6dgOrPZFw7Lb2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752939; c=relaxed/simple;
	bh=P+jWLtwhsHc5uFRJj2NgqeGk8G9ZVO4cpG8ggNqZnGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovM/LGGPve06IsTuNYr3syqO5zhcvGjDASJgR7U4DYCei3uGkTfFzW/GY/G8AFcqKjXc5ocQt+c/Zecyf93PSq+kxhjMnpxml+iC5EZyDNqObapIs/EzxYtyAMmWN6M0B6o5maplZ+A3LEyNtB29/v/YQTlcj6RpB9wSZyOiupE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=VQELq/Qx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jOBwhIf7; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="VQELq/Qx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jOBwhIf7"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CCE1EEC00DA;
	Fri, 18 Sep 2026 13:35:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 18 Sep 2026 13:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1789752932; x=1789839332; bh=rzDey28tI/
	mS2ZHYPWScIGdxmqa0tFs0gJXsP/XSisc=; b=VQELq/QxD6pe1etmzR5LukEn7b
	v9p/7ja7DBXXqoS6oSLwLVi8R1+YKcTx1v7Gzito7nPNuIIs9HOf91viYisqsfIn
	JL+EHl+b/gX59bPQTFlDNn5/dLUoYyqY3SpYN+09iM0D+wPbB7MH9HjV99MOxo48
	oFqrX8YEaipI7nomm23U5ysdOS3aFz+qTJWNSd6EyFqfUnbnAdoNBmOgyx0XX3NI
	DazHVSrITstqowZQgNvl5144XthtxZ0YOXbcYT6UKV3LKEkOkK+d/nD3qN2fO8qp
	+Mj4d2fqYZVeoSwkomjuVPLjEegrNhpItr7avAmQNpm/Q2xKTJXyzXJTBjMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789752932; x=1789839332; bh=rzDey28tI/mS2ZHYPWScIGdxmqa0tFs0gJX
	sP/XSisc=; b=jOBwhIf7SUwI+axW+wlF4xcU9BulSVMDRBMBBwI1oTvgLE47XVp
	oAd/7/hjeSWbwCKi5Xw6GRkFJsUDFvx/+kNZjdxZoOjPaqyHaMybpR99RnXkQ2dm
	WFd7ObI5PllyyjZOtoAf5B2CWMdSwxE3pQgNJDPPmGPxhxCRazwk2mXve1zd7YWf
	XMdjkQTC8PfGeUkIBpevq9pMEjE8Am7fOvlmF9uv6x3OrAHvCCke38rpN8iH84AE
	5HgOIbHHYuPL8m3IU9QHVhK/15BfFN2BV54BxegxuNxP0IqR8hynG3RKP6TaBic3
	pst5e1ldYfUrB38CyamqZVnAwIanpT7Z8FA==
X-ME-Sender: <xms:ZHatauhW4VnbZA3SVKssamRSTG49bwng6ZtioA8ZC2gUHQo6E7fX1w>
    <xme:ZHatalbvUFnbCinY0yE9cqjveQCc19csJ0vqddkh95iVpdrkAX7qJVweKRbfXmEsy
    Nq94ZqUl63YrnRG2iKEsLp0fhNzz-qf7YxumJyLP0B94MVJ6b8>
X-ME-Received: <xmr:ZHataiVNtXISQO280dnOmYQRlI7Ef_Vh28jBnMnTTBY8fNJgLt0P9BCHRtWn>
X-ME-Proxy-Cause: dmFkZTE1OwfNUp3MGBXSuAN4San3uDtZChVwo8xtE87Fm4jKFN7Uvf0E5xDblVuJ/CA0g5
    rg/FZdULmzCcK58enxtTMWumdvu3mzbd65iAymGtJJbM3TZeUi4Xo6qD1SoLT1sw8WwOLk
    stS+HZ93imbLJ9xwNU/I3Ci/lvuo4sc+hRy+IZ+XrvwwBC3buaeQTlZK61qtJFMKMIOca/
    BrUy0/eqrUtNcCy8KONBvTilw01HqG7rpDej49D0jDWEoCAE5+Ph5BgQmO+Lp+pROKCQf3
    2VKZklzQk60ERR3xoIeDinw38dUs+jM/WbuF280amEDHy2/aDpGNW63qBzqyDyetdDFvSJ
    ElduYY+s7dBzGWjnZU3PIdq2I+u15/mQ4wDiySZnPwKED5YSTGDETJYGKNJGmaroy5+wbi
    h6DJV9Dr1tVaDLDHbQhVrLOs6WN11Z0SwtkYfm+x0SAeijGZxVJVNNJ3oi+5B7qw1NRcJW
    GUaAtMJ3HVtBr4zI9Fafqgjb6VrpLzCXNS+tot94VYbMKP/5ZkeUaaWzTIsrraPftHxrC0
    EfZRSbgNdazcIBoO6aKgf6HfwM/o77E6b7wjYCGfiEprZTK47E9EPMHeGwB4GafMv/u46V
    NRFY9frtwT5V8NHg2+hEh0bswtjuNAjwRS9jhHihaN/9cfSJ/cYEJRyPsrgw
X-ME-Proxy: <xmx:ZHatalG2ClTQdbyKaQg8xX8UavUZxfNmOvt34-zD3_u1T_eIETy7tg>
    <xmx:ZHatakZx8lEps2eikDu_S5ZOnvDA-d03JnTh7cR4jCbYCMJKLer9UQ>
    <xmx:ZHatasFqMeSuvLNfpCCvxV1_GDiiDtyahchiXmvwIkphZtI-7DTGyg>
    <xmx:ZHatai29zdCyFNCq2mmfhXnXxzhLIcsCeNgwV6FDqA_sIAZn9Nq8yw>
    <xmx:ZHatanOSvREtTLy0hQrbD-3ZeUUGJRkssPmBsZolFABMPU5Hd7yw6fp6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 13:35:31 -0400 (EDT)
Date: Fri, 18 Sep 2026 18:33:36 +0100
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Carlos Llamas <cmllamas@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tomer Pomeranc <tomerpo@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <2026091827-actress-irritate-95c7@gregkh>
References: <aq0wIywjYmlWf77i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0wIywjYmlWf77i@sirena.org.uk>

On Fri, Sep 18, 2026 at 01:35:47PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/android/binder.c
> 
> between commits:
> 
>   c4c02084d6687 ("binder: fix leaked fd fixups on TF_UPDATE_TXN supersede")
>   22c135635fdd9 ("binder: fix is_failure flag for superseded transaction cleanup")
> 
> from the char-misc.current tree and commit:
> 
>   fd2bc059ed466 ("binder: rm -f binder.c")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> (Deleted the file)

that's the correct fix, thanks!

greg k-h
