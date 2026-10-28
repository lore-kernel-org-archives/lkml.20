Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202302;
	b=m7+LQ5pPSkUi1uwaCa+aL5aeZ92DTO10CysYEi7mawn525P7lsWnIXhT61sjNDc2cAsD
	 LJdCEsBrHQJvANVRpWCe0b7hSTW+kC3Cs2TwzfXWGj8cuc7fLD2nj1nmdk/eWN6L3jLVZ
	 vNaTaHU8d4OzObqMSZSF08d60t7Nnxk/7urY2P/BF44oTfvxbpKg3J6Hnm5Xc+HfAafUi
	 sjx/wnX/TbwcY16MErFbERuM9m9IMWGD3SbB7mdswaHn9xjqymrrDuGM1VrdrpILZeZY/
	 LwIEYQ4AHKLrTfhN2dY3LuRC1tUXifavfrTn6323WNo4lbamwblve0/eJZSElCK3TKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202302;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=kAyiW+KFQKAgCRpnXIGSIMyble+GIVr5acqZvdm8duI=;
	b=lsnfp2JTjwZdhBFPySf5YXCGF2tNABpLQ2ZIkwvfoaUcpLUi31CixUNIWSZC0KUdXbFt
	 fKEtBRGTrs+/35wxwBADj9QkIlQWnwd3O7GXEPMITKhBhmPjkPNjJKiqOH6qBX1MCZLld
	 yAoonSuNq6RSxbZUu5aPcOj7VP1K3Y+1aNWHV+jYIUd9P6nDZcfuvkAoGfws0KGl8ilIK
	 chC1ZPknpmt/uxwIiPgIA5tBEt2L4z5Mhtb7c5OtTCzWDtLHLr7Rjsd7y+SyEkVcDBmok
	 FUce0/rhUw6bu3RWfxdQAOd8QVDJUe+aKpjaLfxDAZ/wgh+YBs0SAqH4XlNa60nC7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF660A2622
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EF660A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3B31C68AFE; Wed, 28 Oct 2026 16:44:57 +0100 (CET)
Date: Wed, 28 Oct 2026 16:44:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Harry Yoo <harry@kernel.org>
Cc: Nickolai Zeldovich <nickolai@csail.mit.edu>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Vitaly Vul <vitaly.vul@partner.samsung.com>
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <20261028154456.GA19025@lst.de>
References: <20261016132510.789715-1-nickolai@csail.mit.edu> <atJBK6hWYh2AqXwK@thinkstation>
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
In-Reply-To: <atJBK6hWYh2AqXwK@thinkstation>
User-Agent: Mutt/1.5.17 (2007-11-01)

The patch looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

and I'm a bit surprised that someone folks later in the thread still
don't get the basic idea of separating fixes from random "improvements".
