Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC536503BEB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901781; cv=none; b=g4SCoWe5GJrXeHmjn3wQ4WP/rW1UY2Le6iSAyNajmjCdhLFoOcpXJQOghHXAj4plk6IGEXQa6TXW0D9NphMxZjXvkM2zPAVV+VmXPGc1hWeD3fE/J1Wsl34nJb4l7INF/nkjew0UY0TeRva5CB53HoiCGj1uuKvy/dAQ7+r0L6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901781; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqa46TC2VXkYCXlS8/QlIigXgosC7/6qFBa+10VKcXgefAjqqgKnhxJbviVeVBvF9vRnWIT+gx6hNwwds5BTu5UvsiGptelhyVQw29SyWCa3zMlt41cIZLpyKZc2OHrEMbRiZPq5Z40GRup7Ugy/2EB8Bo6++Lv8HMGiQuudSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 994EB227A88; Tue, 13 Oct 2026 16:29:36 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:29:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, hare@suse.de, saravanand@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-multipath: add fail_on_ctrl_loss sysfs
 attribute
Message-ID: <20261013142936.GB15192@lst.de>
References: <20261008141407.22992-1-kiyer@crusoe.ai> <20261008141407.22992-3-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008141407.22992-3-kiyer@crusoe.ai>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

