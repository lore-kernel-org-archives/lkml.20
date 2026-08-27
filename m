Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D642125F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852146; cv=none; b=fquQCLbaWNivka5SgiSWfVUWZkDQSdZE/STR6u+THzafkjBKxW3WeNK6eDqbPxRdbEESrX8WfqwLZTZtXL5ur7pN3ny1mLMLu22wCzTiDt45HHVw1DFoxiOGvRz71uwXMV66QUfUWI3PEmsDk1oXtFXo5iY8iS+402uSL6sAgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852146; c=relaxed/simple;
	bh=z2o8MOsuV4Jtw0bdDdi6XdQxXMsv0/NeHM6TvE/6nwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR5j6YxzqM3QzrIIUnVG6Eu2KRf/binkR7/MhSQLBZcZLxZIU/bvaUmrKFj34beQDhYtr2JFBGA8RBJFofkFrO9tHa6AW0iAivp0ohmGsforgcxWR9YWCUofRWGoO3Fni3C2P8hdrApbP6FVd8CKJ42r21mviorjhbGzBDv0U5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bk4w13ik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bk4w13ik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661641F000E9;
	Thu, 27 Aug 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787852144;
	bh=z2o8MOsuV4Jtw0bdDdi6XdQxXMsv0/NeHM6TvE/6nwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bk4w13ik+oNJLlCaJU9UGdlr8LAknop2T13tjJCfGFeSmTmtry78KGtazH+HM7Hvn
	 ehSik91/x7Wz8aAfU1U25dGLgVoWUZANGcvIPueQ/Lg+0yxJ5iGM+XvBo2y6Ik0QKi
	 UnIE970PZwh+KufLaJg2PQKyLB2exuSkuxVKu2PxsGCvOCYzVT3vE8pI3P8lVqHHCZ
	 qomINzVPwcqJ2BbNmSP4VURAYLyV5H3yiHvikO/PFD0ueO9hsvB+S+5DokZp515fXb
	 dRX0vmhxPlM7Bildubr0iDMLZyL6HvhTQOlp7rcNrak1ECxViWt/vUMgdfC/gh9suD
	 3UjjQGD8NYj1w==
Date: Thu, 27 Aug 2026 18:35:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: artem.kuzin@huawei.com
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org, 
	vbabka@kernel.org, cl@gentwo.org, linux@armlinux.org.uk, will@kernel.org, 
	mark.rutland@arm.com, liam@infradead.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com, panov.nikita@huawei.com
Subject: Re: [RFC PATCH 02/18] arm64: align kernel text and rodata
Message-ID: <apB1JCaNkGQMJQqq@gremlin>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
 <20260827161158.3618409-3-panov.nikita@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827161158.3618409-3-panov.nikita@huawei.com>

On Fri, Aug 28, 2026 at 12:11:42AM +0800, Nikita Panov wrote:
> Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
> Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
> Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
> Acked-by: Denis Darvish <darvish.denis@huawei.com>

One small note on procedure: it's not really the done thing to pre-Ack
patches in series sent upstream like this :)

--
Cheers, Lorenzo
