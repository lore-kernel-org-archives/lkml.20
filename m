Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02238F236
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045540; cv=none; b=D2m/ChsgvcdotXAMXKJ7JjAgGNaBtapRydpDS0Ih9H4VNRrjC4AGgbPvclmWLI8WhCExHS9nC3ysH7SjfZvwDPMtwZjhz3tLFfu8LFiv1x3Ehfz2UYri0jX4fBKYjSbd3+9j0/vkWVpXFZ0x+nU9ycykVByCHegNqeLfZOoiXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045540; c=relaxed/simple;
	bh=ZUlEIP/6H9XMBkfVg958TGo+GiwTFFSiJZD98A3PRV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckQmPTsBZmwkk3cXpoHXthY745T9s2r01nWjMnf7xzMbLGbU/W3Oa/J09ia876YEhWfF6fKaqb93Ff2glg34zZmx5xcnxfJ+03RF7d1nGQv6vTgr1McAPmHUqEESNSj948KmFKPZKDdVBkJmutRP3ITMxZjFG0FNQ3L5iwIh590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VkeW9rx5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VkeW9rx5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 07D3A40E015D;
	Tue, 22 Sep 2026 02:52:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pi9fGM3Y4aiA; Tue, 22 Sep 2026 02:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790045525; bh=tGTidydb1/49U/+DtcvzCR6USeGxcMxuLKgn9pQUS0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkeW9rx5DInyKgnHde90PrHn/eaY8PArLt5RcallQOokCjD/WqvURCcMRDjwejp8Y
	 SLoKx7x/KRAQWLHDl6T0foltghpOjDd1fZ4+gzoqcQBwSBIcJUYxBy991r5xSt34SD
	 dbv+uff7cH9x5s5dOGF2N7gaMa3x5Z25EHq0QXUxEpsi3CoCgM07v9qBRYIzM/kKWC
	 v7YABi8DQZvYIAvmoZfhbWWeaRzduQxrs5YS90hP3FQdtqpQ32o5Sds9ScZq8tktXJ
	 R/I9PwRUrKl7m8WnX4OuVvzIEJiuUOXgPSMeXdBDiXuSZPWcnaWSjXeSjB8VVKY+qG
	 N969L4+YWMtbSJ+add71VySThg2+3sxgaHwSCSYtP/5hQULqizK4ZKvllf2G+/CQeA
	 LLUUgRytI6iF6J+2OtmJFaeZ6x9Xq5RI6jm9k6xBt5ViKWmGti6dil9aiGtJVXCrAC
	 NoBEULGAQTyGmdIb1XYiG1ONWNiqGTbVzQD5F7ZsTYDmobe8dbWsKrHSVAmvANVh4u
	 EIU9ochTvQp8svkcgp6CAwXEQAqzHohNjCrOAc2WU5Y3uXOR/7KOO0ujkvzWIkrAky
	 MIfPLeQegDdNDy/Dg/LNO8ALYyhYM0ZeZOAP67wEyJ1FON+jwVrQFCcsdRMF6DpB9q
	 jPQfhNt1OHxWoG6LYBYnIN6M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 754C640E015B;
	Tue, 22 Sep 2026 02:51:57 +0000 (UTC)
Date: Mon, 21 Sep 2026 19:51:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Melody Wang <huibo.wang@amd.com>, x86@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v1 1/8] x86/sev: Make SVSM calls preemption-safe
Message-ID: <20260922025153.GCarHtSXImlMUjR69t@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <8e6e89b87e34a8eb2a20d52b0d92c26e7a61ac42.1787973545.git.huibo.wang@amd.com>
 <20260901011934.GGapYoJvmhws1D7iAL@fat_crate.local>
 <aqJrk-WpI15nMmuc@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqJrk-WpI15nMmuc@sgarzare-redhat>

On Thu, Sep 10, 2026 at 10:53:32AM +0200, Stefano Garzarella wrote:
> svsm_perform_call_protocol() is called also by svsm_pval_pages() and
> snp_issue_svsm_attest_req(). After this change call->caa is set
> unconditionally inside svsm_perform_call_protocol(), so the call->caa =
> svsm_get_caa() there becomes somewhat redundant.

Yeah, I believe Tom wanted here to be on the safe side and get the right caa,
even if we get moved to another CPU. And yeah, it is redundant but it is
a per-CPU access so meh, probably not that important.

But I guess a good cleanup ontop would be to remove all those svsm_get_caa()
calls from the callers and have that happen solely in
svsm_perform_call_protocol().

I guess Melody can do that ontop of this one after a proper audit of all call
sites and testing. Because the current fix should probably go to stable and we
would need the fix to be minimal.

> That said we can't just drop it though, so at most it could become a local
> variable. Probably not worth the churn, just wanted to point it out.

Yeah.

> That said, I agree that in those functions we don't have the issue since
> both of them are disabling irqs.
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>a

I'll add your tag to the latest version:

https://lore.kernel.org/r/a5bc0d4a2c462a0089109e145c21626b244b2ff0.1789345277.git.huibo.wang@amd.com

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
