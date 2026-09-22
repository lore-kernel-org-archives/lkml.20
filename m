Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B128331280D;
	Tue, 22 Sep 2026 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052680; cv=none; b=JEvSuPxMlHx8izry320Y1a2nDgHeW0FNYlPhmBeUkVmMLJwTdX/CTs2Y2FC5FFTI8W3tx4ZRhA6ZswdTL28KpNe2w1+mJGre+TBvq2JjmDYZ2Dgglt5I475ZBAac17n/Q6xfGt2OXeZimok7mJ8CK9WjvpINE/zN8IYJkaopFV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052680; c=relaxed/simple;
	bh=vV6gAxl1LnXQ1BF7X3fCSBRQDUcH8qqdgLBgLOIlr9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npdt2Bh2ATLr6aMFHrI21q62YVFfudcCBaOJEQUZfZx4aJRB+XGL7XLH9zem6TL7O+B6YwCEcWVdur0HE+n/4sdbK40Ee8tEfzhJoaockQwAwxY11ofICjBl9NabUptD9IDdpQ7RFe/AqGuX/BTZ3rydsp6axwjoRPsm7Emxz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XF+PM7H/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XF+PM7H/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 90B0A40E00E5;
	Tue, 22 Sep 2026 04:51:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rvRARpFDOayB; Tue, 22 Sep 2026 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790052666; bh=TOqjknlENWKoPUvIcinLysD6NS96h36wx81MQ1fSuqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XF+PM7H/2+c5TOzO31qccXMhDWy4qZO/iL2iVkSJA3PPynEYsboBpQBFWraPpokYf
	 ZvNCQuaq6wgCtO4LTJRtHGlk7el0R8zEYvI/0I738KMaFxP6PN3xvF2xic76+hL+Yb
	 ER9eB28d8JaMZnaW62q55C1KBDi5v8s+li/E1K46NZPGvQSDe60L2HVJ0W1VucBCSD
	 v/EG2ZiWqtpaW2RCSC6H4YxV6wyDzTCztzI9hsytJ/06ILm5oXVm/i4vxt+Foyd/7S
	 RzU4yyEz+BLL42wUe2P1ixl7pZinS4ZJ2XV4JSz8qBPAA7LWabXFa6/1QeawsywkBF
	 XcbDH7FwKB6mKcYY8Y/YZ488ZIALoVIP5trDGI+TNiZ6xNZI2GD48b013Nrf5r/pao
	 HmD+IvVHk5w+v38xE7VUHBytbypa9Wxv2bVAmDbXwkW8vqpGX67NYmJIXIQ94OJoVX
	 CwRSdlPqlSIiwXA4Pdu/ycj+kLnjeTFqMTXx5ZduY40ap41VO1ZETlJK4Sqd4B8JVR
	 FfZKDHIlOz1dlw82jVOlGNad/I3JyXhF9IP5Y7X6IwIFpAAz3qwgt2aH8/5tyXqgGc
	 UzXCNPYfIdM5n2GPlQWrGI/yGPeAbdvyLBRFV1QDVx4mS6MYn4L5Eu1Wxmf7NQ5yUY
	 /0jFlPCyIAG2n9YRJQvgR05E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2735040E015D;
	Tue, 22 Sep 2026 04:51:00 +0000 (UTC)
Date: Mon, 21 Sep 2026 21:50:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, qiuxu.zhuo@intel.com
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arFVjp8k-3kvSkhf@agluck-desk3>

Dropping stable@ from CC as it shouldn't be on CC.

On Mon, Sep 21, 2026 at 09:04:30AM -0700, Luck, Tony wrote:
> I though urgent was for:
> 1) Fixing something that broke in the current merge window
> 2) Fixing something that's really important (security, corruption)
> 
> This is just an old issue that's been around for ages.

If this patch has CC:stable and a Fixes: tag, then it'll get backported to
stable. So does it matter when it gets sent to Linus?

IOW, those two things do turn it into an urgent patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
