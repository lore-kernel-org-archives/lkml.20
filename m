Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8784E73D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733450; cv=none; b=TqiCKAm02gA+eeeB73sIdV+H6ln25cbgFYE1RN0VqPglGS7Qf81/8bK0eoyRIg/3Mlrt3qHrtFevLWDo4nCTQ044cpRvypQJOViVgcw90NG64Bxivm9tRZ9+5CoxcnteEmSWDZUZLyrzLtKtqexGivg73MlWfmhTXgkl7gzw8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733450; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJMI8i8eUkIZecdOoGP12dFnKkFkmn10Kb1aht9/3GUISkJz0oX7w6QpNele14Zx1tgs1jYfo70djNftLmDDkt75GWwywCVc7cUfCr7dxTZ0eahvoXIK3fLe29OzTBzAja+o4gUtDDrupi1wEDSb0V2js6jt1xurnr9Ai6A8QJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0325768BEB; Fri, 18 Sep 2026 14:10:45 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:10:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-multipath: fix underflow in ANA log bounds checks
Message-ID: <20260918121044.GA16650@lst.de>
References: <20260915021956.3142320-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915021956.3142320-1-4ncienth@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
