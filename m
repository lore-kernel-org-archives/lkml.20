Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D72390CAD;
	Wed,  9 Sep 2026 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976229; cv=none; b=jIZTqkYqRAx1cPQk3Ksg3mDokPpDk4vX149A3tpjkbVDN/ztY34N+cLZosSVbj4IH2wGXEl13Mxxgo4Li8tVEw0eMR5atTxLXSvFNEmwOKFZ5nFfrqqqN90r9rbxU5y+j4G7L3pN6fCrAWVAJt8VIYdZCwDDTlA1p8/PajXKORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976229; c=relaxed/simple;
	bh=PPvRAeKE68YZMDipfQmdPIzPA+5uYXaU6AbKa6B7r6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYIlZJ8cyWzy10vMw6Nb9A1ksPJoPnE/vyEudAEpLZ17QjupvszDZPLwmpgbc8WqelayzWD/734MF5cNMiHE58y5HQqxjIr89BRYwCCVxx/RdFvnKmxRc41qr4RQLyuYcUR8KAaICGAoWIYSGQmawQBtsxHgTW9FL/YSOSgItHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KFiYGkpi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KFiYGkpi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 08D0B40E01E1;
	Wed,  9 Sep 2026 17:50:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tYw5v8l1skOR; Wed,  9 Sep 2026 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788976211; bh=+p5awYSiRQPpCHJwK8BAB6HkMRTsMPyjd1UqINYq+vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFiYGkpicMLzzjoOGD1P5Pt2ChzXyNMjUxIvT7YWl6UDQXoLmO1ihK889jB3tKttB
	 /Fmk3h//LB7YtwtZfEqUyJbqWwttmeeVnf4oUrOV23t0zTNjeup1CpzLyQwh82aNqG
	 Z/0TqCLn4MFkr1us2y2GFk82T+iQmHS7UkjVTL4LzlLPygSAvFa3WlDS5rm1M1rM2O
	 JRtHtzns3/7pMt/+5Occ4A01EglqfMVtYiXKIgGpXBTdBjvYbAYpRJLrQkecdA+KW+
	 XUosr279IVccTiNj7jdbJQ65KFOAj9/qU7k0z+Bd9Kr2ksrzBH3ovKYCmgumDsAyb9
	 fPxs8FYkAM81JsUwvTw8ek+cpHCd8JMHCwxB89lZHrjFfmDCZ3sTb2ZRXjlrb0uRoS
	 hwXEd924bQLfs60DZ0eaZzytrPi9guxWYgFgszIGlniQDmUqOJtl+v4/xbLjT7Mv4H
	 HMVEkA5W/mV7FGk8YTORs6iYYuc5wYFARgbRJzYuojC0eHZqhnEXdziRdgJbeWVWRl
	 sJXlbtc8viX3InYqBFWygXyMbms+eRuNoAL2BIwiiL5k36MJaUJ3E3E3a3YXr4PPCZ
	 fvdH7UFkzTVdYlvUjzufP+Uk2WHdKpe7rHokT+C/W/L3gnje0oSOY/Z03Se6Bz+on+
	 eAk2ppMtJmUzm269JQvQRNjY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C715A40E020D;
	Wed,  9 Sep 2026 17:50:06 +0000 (UTC)
Date: Wed, 9 Sep 2026 10:50:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Leo Zhuo <qzhuo@nvidia.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Update my email address
Message-ID: <20260909175003.GBaqGcS96zIUbWmIJ0@fat_crate.local>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909151531.69074-1-qzhuo@nvidia.com>

On Wed, Sep 09, 2026 at 03:16:15PM +0000, Leo Zhuo wrote:
> Following a job transition, update my email address to my current work
> address. I'm willing to continue reviewing EDAC patches.

From: Leo Zhuo <qzhuo@nvidia.com>

Do you wanna still use Qiuxu or switch to Leo now because latter will create
some authorship confusion in git?

I'm fine either way - just making sure you really meant it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
