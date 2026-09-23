Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86C2FD69A;
	Wed, 23 Sep 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123628; cv=none; b=Ak9falIjBayBHbIe0jHdfBlMwl1eW9PnAvbwM5GJTP1piQEA4mlH5NKa8QsO60dGX6GSetTPLcNBdH6o9Gc7q/3ixW3td7klIcm0LXAWK/JQBZwR5DmoXeGhjlHafX2s26lwVFbV+LVB4yI031CKR/HLAh/vtMaouE6pIcwjKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123628; c=relaxed/simple;
	bh=yn155oLUbOwco1a3vrgLY/H4a0kYV61RzjF4sWf/JHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNNTMaxwbLwlkEblPvHgd7X2GV6kLt1y/xVfGE7J4KCQS+KK/QYJnJNdjFCnHXBfJ7y6m4GVaGsRaLK922iHYcQw88kQ8LxTmOqicsTj6LkU7rmhUojDitEwjJ2pYQ1i5iuYXEml0pxn2uyu35kC3mdLBTmFe9+NBV4zDHmlfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=j2rwBW3N; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="j2rwBW3N"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EC6B040E0173;
	Wed, 23 Sep 2026 00:33:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vZrba4C09s0k; Wed, 23 Sep 2026 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790123613; bh=VfKsWwYlEO6OtfC36cO8SCRkLeOdY4ITDkXm5tPK8ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2rwBW3NwmBMxgvBGu/6t1i9Iqqy0wUHXyUPVPkpxz2xxPLWKd2QDJNsGrrThkzzX
	 vpshAObqZ/LSmPdA8svuxPQ5b4zMstQk24DACltwu+WZ751en9ok+w5IdvqxxOrc5I
	 nSuOds3C5xNoCARB9IFpvcotU3+cCrkEssCNB+6yI0VSvYj+0Nn9nfekAC87K3jkcz
	 rRBRN/chZbNifROnqeF6lEXd+V88aSoH5NBcJduVupudmIs/THgouCTbT2aeqE7N46
	 vdj6Lo1MME0n+TKMWq82erqAGDRsYmQeJXw5JQ2PZFkYa9mt9F4Xq2XCTb+8VcTT6q
	 VGnR6WX07MJET32gesIXS6q2QCqC7iLPY6uS9spD+L4A0Za+QEslpVFkltG7rzAADr
	 Zy2KC12ax8RdAzTBCCTPeBGl2uZ7Bofq3K9uE/LFrBJYR6YFMpHx/khNgd5pXNN1RJ
	 rs16ZP/thpPNadGw5WqdIJdVj2xvu1nzW6mAHlhLmWqzM5PXiTRWSQOjZm1/UsOIQ6
	 I04JIuetWXuUZFV2iHIYhKysJ6mUWAXyDPmdE4r0eil5eZONQEJGTEUfbDQKeTZl7x
	 cl9ZU3IHfl5u8qbUiFism2GjA9QfRBF8fhzXPG7H7yylGyuUetnSiE5zvtDm3LbnbS
	 TbzsOHo/VTcYsz5ixxm+1/4Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6042E40E015D;
	Wed, 23 Sep 2026 00:33:28 +0000 (UTC)
Date: Tue, 22 Sep 2026 17:33:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <20260923003325.GDarMeVTCo1w8L_av5@fat_crate.local>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
 <arKX7O905e7yv3Ra@agluck-desk3>
 <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
 <arLWNgnyo08aFM-R@agluck-desk3>
 <20260923002009.GCarMbOYCb4onwhwRf@fat_crate.local>
 <SJ1PR11MB6083173AFAEBB2AA8FFAA922FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083173AFAEBB2AA8FFAA922FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Sep 23, 2026 at 12:30:02AM +0000, Luck, Tony wrote:
> > So, what I would do is, rebase the branch and zap the stable tag. The stable
> > tag is not something we should use willy-nilly but think twice whether we
> > really want to pile more work for distros and stable folks.
> 
> Tag zapped. Updated edac-drivers branch force-pushed and merged into edac-for-next
> (replacing old merge).

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
