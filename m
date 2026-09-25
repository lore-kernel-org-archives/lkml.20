Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970344E053
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321867; cv=none; b=m2lNJ/NfszVp9wmQpQ+nFVr7Z5bKjkNySuKzgyjIABeFis5+vgFdD0k6EK9n1BVBKx1dT4NexecAjvtdCLsFbhO48jppTWtq0cDoSmbBjEKlUkxG08Ti3m/FRVc7XiYWNckiX/joQ7onkXl/LvoYKDUbhsEFHtvLN274kpFRmwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321867; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJzzJWqGAUr4QsNfWEknYHKDW6vto9Suv83lwE1RUmYmdpjv6L7UQUdRChBnbHia8EcaYS3mIdFYL6BSpN8ZrUutuYEEmqCrp0Th531KZyDe5nCnNLmrxrod6wTxfTbaI81H2fAKBzKrKy2PsO9S6FY4Xy82ldDXJZahp4+9Y7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6A5FF68C4E; Fri, 25 Sep 2026 09:37:40 +0200 (CEST)
Date: Fri, 25 Sep 2026 09:37:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>, linux-kernel@vger.kernel.org,
	Mohamed Khalfella <mkhalfella@purestorage.com>
Subject: Re: [PATCH v2] nvmet: Add traffic based keep alive support to
 configfs
Message-ID: <20260925073740.GA5533@lst.de>
References: <20260923202003.1776271-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923202003.1776271-1-jtaubepe@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
