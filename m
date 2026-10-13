Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3730F803
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901504; cv=none; b=eibyzvncgGeRIaRj2xT0fdX1/ny9lKndPU75qH01ROeJSMl9Fa877Rigg9pB+SHs6YsAQ6MyPhRa3xha61Xlqj6vlp+Dwn82LMMjhmYmMOTZCiDk7rzq+IqpqJNqNAeogmatRkzlSE20Z92JaGuGUMDTVYvetJTvyV12m/bm9W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901504; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCQzRHXLImEZJu8K/7Q+gLrdaHcD/nLUOAekS54Qt1q3b2TV0/eBnbvSLcCoFt5cYD2hx4/hDxJT985USV4SwwGjmTQ9QEMeRlvDwVQn1dyOzejRi173PyU0bp7yDVZA6TBGyr7IryvX7b0PLn1cAFwzPCq7vsTKifoYvtPHMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1A4D5227A88; Tue, 13 Oct 2026 16:24:59 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:24:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Daniel Wagner <dwagner@suse.de>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet-fc: don't drop the last assoc reference in
 nvmet_fc_delete_ctrl()
Message-ID: <20261013142458.GB14759@lst.de>
References: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

