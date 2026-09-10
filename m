Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A525228D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018253; cv=none; b=D6PePrY1wWrBtkFgQuXw6Er1xwTwLsNnbKWImt+a88SlofKnOUYzMbs6mNN+0nS8YZJnRUE53xHJWMCBbHNv3W0Tj0H/QdK4CpLu9WuUHDRNfUh2jqAiGfUi4kramYvvEii7soRKstOSL6OT64lXps0Q1rR1mv0aAbjxQ7SWLq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018253; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtFbPU9PxF699u9y5imbw9btJTi6m6DGk2brOEewI0IUJMwnmkblzdNa7juOHTCt1Phmn3tsrKBdSiN6EXidw2X0lOP/E9wkmaHHB9WEB5bI+V5to0LiYbMa/xpdh7rCjgCzMeYX1ujuYoVoREocZ4JXFqxBKHUMtVRz1hYl0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 99F3568D05; Thu, 10 Sep 2026 07:30:46 +0200 (CEST)
Date: Thu, 10 Sep 2026 07:30:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] lib/raid6: Switch to Linux's NEON intrinsics header
Message-ID: <20260910053046.GA27351@lst.de>
References: <20260909163319.2116279-4-ardb+git@google.com> <20260909163319.2116279-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909163319.2116279-5-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

