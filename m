Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684325;
	b=ZiCtLaMKMb5YZgvn+M7QQX+SZ9huCuZu0A8Qmd7yyPlvVPGZl5SksfvGBpSyJKXEUuHf
	 wG5fKBJ2mIrJk5540Dyi99kM7//ce/mjNvKNpq7MxU5meDfWj44WFD05u6l9MmgR4pwUo
	 MK2JW9RMHEKFyCn7xbMrvMaUUiIZrKACCVmEfkB5hFuxgH2eTzSneHHZmJWBWX1R4DfzI
	 MwX6eQDAWryLhulGEX5jwCYu+NulclByzRx/rbIMNPzlITxRjik1zGqEO1P/uhxzaXdCR
	 fXyBjsmeSA7rTcsBvSMC1E0Z4WTcfhCg9g+YDWY/zju07qt5leNTn2RpEK4PiS13lTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684325;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=E/O8FgOXfdBspSEpqFz048RRGpJCtIR8IcJMy9ZIl9E=;
	b=aqQNdYwgpg7L2fOILLlfVBd16m2vrcfdtvPkrVwxZwhG9HXPAYS+MB/q/AXRQjIq2vVR
	 T4DiSlzPgQzTpLhTzpxKPyr4UiyUStDfjlKelj1BcBQQR4xuKvxxW7/hpeOlySyTB4GAE
	 uKJrHcgTosC2Vu/EmPIBX5cQYL4HNff5bLEaWVI5YgQixsrqExQQpGm/FdS1PET4QrzTC
	 686nu7XtJKJmAGH0YIeVAv9LcvIfUntuRklGeGemo67/kXZnTyCs45NMZ/WcNJvdV03eG
	 IyjrJhX9Jz2QuqvQqowxkamRQEZQ0iao7hQ9L9egb2FQsmeh7zO+LWeDoQYZeCH0N/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC8606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76AC8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 270F368AFE; Tue,  3 Nov 2026 06:38:42 +0100 (CET)
Date: Tue, 3 Nov 2026 06:38:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@suse.de, hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, sagi@grimberg.me
Subject: Re: [PATCH v2] nvmet: use appropriate types for authentication
 payload lengths
Message-ID: <20261103053841.GA1526@lst.de>
References: <20261031075932.4345-1-sreekuttan2156239@gmail.com> <20261031081751.4583-1-sreekuttan2156239@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031081751.4583-1-sreekuttan2156239@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But please don't resend new versions in the same thread.
