Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D1E283FE5;
	Mon, 28 Sep 2026 05:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573457; cv=none; b=hjEwSH5ZYa3M03japy8WCamy0cCASuqi+yel61TjTz2ScLFmmBQKUJIq+FpfYjfSi3gFWIhx/hkPwtgcgE73+4cGJHOWZhnKssoKHV34McV1VGizA4L9a5TMJpdlj20yxgsF2lp1G2fx+zjfd/0QXSadqPHBAAD6sIJ3NgBeESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573457; c=relaxed/simple;
	bh=r3RlCnLbVTLvBPw8sYQj42w+QUrBsBxwOxbYvTSUh0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa6MRTER6Pa8QRhzowNHgd5krxV4KsDa6Z+K/YYz/Bxz5dtCKCQTQ4n2WCctdmyB0Wa/kBZ+W8IpkZBRWOm4/UEy7qRoGTJgKZXhs8b/tEZVIfBxH6s2kHio2INw83RYMbGGgQ7NF4Ne0ZKTp13579yd1yDd99RLLlB1rWPa+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f0Bql77A; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f0Bql77A"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C6C0740E00E8;
	Mon, 28 Sep 2026 05:30:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hoEjBQGBiy3i; Mon, 28 Sep 2026 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790573446; bh=0Mdtj6gVLfP8Vc+G2eRm8KJwF3bWgMYYkUKF+bwmRfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0Bql77AFT3OzF5w51j/PUBzt1rOSGVXRzIvHQECz0HufTwdn0CcpmH4c6dcDL2da
	 /gghTdSZTvD8ow9HVFjft/cRXgPPC4AySSszpZv50961b8yCs33iA83TS09i7SIsK9
	 rAtmmdSFad69QaESIqrBS7MuRU5UeawOFZHRGK8FoKrX3rbNBJf6CYYuAYvyveUKi2
	 FC8e82CDEI4PyyiEsORGt35xIXRFjlW+ZEiGntUpfaNfWZILOYrIG01fgXP1Odvvwp
	 c/CW6aWex8u5ksbcu+BSLqwZIlTTXHcvSUSVyP5ws9XyaXDWIotOPwmanfqHOJ2535
	 O6/ADI8JUtNg4vbxjpZh1aIlEdtug/bdyjDkqRDyTg1CJtaGu2jy51Jdu7IfySu83o
	 20hAwpWy6TxGUGEz8w05d3nSIWfgpO/OzaleTN4nYev0qXEcROwU5DbOl6F2DG9Jpp
	 5Key6XxchbCXDeu21S5AG7aIgD2hbeWkpTTnoidzxw5zWm+Ds1LBwwZMpvAFSaTtTr
	 TEOvky6hXZJXNTkKi2upFQaVrlwkhefptzqpQFeYYogpgZ+Q+xRxwdxSdqw0yCuYBp
	 gzBONNo4gS+6PptsSw6P/IYzjAor8c5uhFJpFEcvw0fXklP6h8qJQT+ZuwqWrC8e+V
	 pjYPkfXSTvNBd7S/1Ap/zGWo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 04D1140E01F9;
	Mon, 28 Sep 2026 05:30:42 +0000 (UTC)
Date: Sun, 27 Sep 2026 22:30:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/7] Incorporate DRAM address in EDAC messages
Message-ID: <20260928053040.GCarn7gHIDY6qPkZNi@fat_crate.local>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922202318.4079080-1-yazen.ghannam@amd.com>

On Tue, Sep 22, 2026 at 03:23:10PM -0500, Yazen Ghannam wrote:
> This revision addresses a couple comments from Boris. Also, the couple
> of patches originally by Avadhut have gone through a few revisions. So I
> updated the attributions.

One Sashiko question here:

https://sashiko.dev/#/patchset/20260922202318.4079080-1-yazen.ghannam%40amd.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
