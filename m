Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDA4CDDCD;
	Thu, 17 Sep 2026 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670520; cv=none; b=NiRExxnui9Y4JGTb4vWgta8Qu5sE2K3koZUnXQcM+QgBIrNj6R8eHJiTSHFD3CqLbtPWVyuHxHaCt9fN0BjfBJldynEh248X7yPFnKE7P0wklmWTuN86nVdJQTDrAXo6AYqCDRMF/47wnlkipbZx5ZPFfxCFuCqt8DlDVJKP0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670520; c=relaxed/simple;
	bh=Co+gH4/6K912eDqoK4/z/Pdi6PTbnK38rMt06wO2dmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1mRQ7peRrjPuQMn67zQzGzkI1cXHNrjL2jPeBaNRz67GuaobsFu7I3h9Dkn0B/+d4LFt1VytC5JHQU8AXdOiAWgjKPVYebVg2AqHZeRdT/LoI8uv7+JVPl9N82zZUHkVHm24ecp8L7zaSZnNzNdxnGJCpNtKi5lsYvVpeeaEfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IpPlpJAX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IpPlpJAX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6FA3240E01F9;
	Thu, 17 Sep 2026 18:41:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lnD9E5OiZVb4; Thu, 17 Sep 2026 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789670505; bh=qPDuv9mdHYzqM9aQUjJSkupupuH/6Y8SfdtHNVuyaP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpPlpJAXjESKR+suqefjdCAvWDeJIZKkwyasSSmdqRk+iYYHEJgjlAC5rp/zsUf3L
	 MGoboJNRILB9NTQU2Hj+eN6zHqiehnjSwOZ/IVP1B+DvcoYIxg1f0gUECteIzctBOD
	 RdJzQ7pWtkJiC91NPbIoHT6MFQ2Wo41mZCzUd6TwLpjHbLN2RxceznaBpYL148fOd4
	 5T1lgMbivZ/lRKDwWz6vLortLa2ind6u3DuIQXLziNtnUMFeWEzfkiRk/cNhbImNyQ
	 FCfjdGbCWbQwoRu0MSp0gVbYj8OMHeOct1us7uy1Iuc80dV523MqxneKQlXdbseZJ/
	 KVcat7I+3oJ7ZNvuN0AheVmv3AsmS73o6ZQsrcAHpWUpRTuouMnRIp7f+5FrQwrmzn
	 SlbHVsJCB9qFOlJ95TXJJMonSdf8qM5jM3+DQcACFqjht73b3tFv3TWOUfl6qmACLj
	 91dd96n/9jSZEq3IC3rylCBcfYm4fciyNUz7Sr5RmLm1PpKhaMWmvQz8jRWdxUoJIJ
	 OGRhbg5UIOkqPPT2zFbhi4kt2OEQHOQExkS8buZOuXM5bay3xeZ9v7A2V+zrpHjbAi
	 bH4UN1l46hq2T44bhYtOapIqMAwvTgxnKIcUsK5Md9OmR5Q87AIZg8U/IY7oIc2bK1
	 xHuBu/Bq9LOwR2sUEF1lzOEA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DF8D940E00B9;
	Thu, 17 Sep 2026 18:41:38 +0000 (UTC)
Date: Thu, 17 Sep 2026 11:41:35 -0700
From: Borislav Petkov <bp@alien8.de>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jason Baron <jbaron@akamai.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Message-ID: <20260917184135.GBaqw0X0O09v7BH3vM@fat_crate.local>
References: <20260913212500.60272-1-mhun512@gmail.com>
 <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
 <CAGEsz8EZhS_5sBDXo0KgmMAXh4JKaa2yjUg=rhL2KMkQddSvmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGEsz8EZhS_5sBDXo0KgmMAXh4JKaa2yjUg=rhL2KMkQddSvmw@mail.gmail.com>

On Thu, Sep 17, 2026 at 02:18:39PM -0400, Myeonghun Pak wrote:
> Thanks, Tony and Boris, for applying the patch and fixing the tag.
> I'll use "Assisted-by: LLM" in future submissions.

Also, for the future, do not top-post when replying on a public ML but put
your reply underneath the text you're replying to, like I just did.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
