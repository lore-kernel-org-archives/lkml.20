Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B24BD0ED
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447407; cv=none; b=J2dT4YY+ry4qWeC/HZXAFU6doJ7WY3VLfgGL5bqoHpy5NAJsl0qrlxKCDNyetWaByjAUy7oRmpwoJnAqa5WSU/CECzSuKRketW5eorPulq/GXJmGHX18Xaz8x9omLc0bSTpF0j8CwdNO6eDv8+6qL19hEiEJPmgPLYvnbtn1680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447407; c=relaxed/simple;
	bh=trpdfUFy1E4MhUxYTDC4a3MiqiOenTTXc5hRPi2AbG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ji7q0zX2+yAVms8rvvm7XWkZWaMMzFCH9k8aeLkUn4cpElT2mDqZpk/RVBsrNGa6GtcbNo5bZwOlURg3XFcWUnzku+lAvJsVEb5p2Gz1awzhnJCquZyJhMRGAMzpCv5JzXYk4yGy+gqyihMz78X0F8L4eJDfdvZyKyk1WKMzzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8uYt53u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8uYt53u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9631F000E9;
	Thu,  3 Sep 2026 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447406;
	bh=sewVvVo8Dy/uyKZY77qoojOHF5+/0ZDpHv96nZFd0J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L8uYt53unxDNYKZf7Y4vZciAiITXax9htmtSv1B4ko/+NkYHyUbMm0k5xmYw1ZYdH
	 YqkRH5UIFvAgYNQoEP4uPERhPI/U51PDU9guJRPq6Kca952s44iw+urk585F4CRKBo
	 aZ7nZStIdXiRi5G9bl6AwbzLR22FTBeEjeBZJM6YNgQLammNOWmM//TBTENdgWHJDC
	 81Lei3albKFQ0oz7bl33i9TnaalK+oIcrFpkNzY1k32Tr3D7NZDzOLIIbhyHB56StK
	 BI+s8Eoew/r1tq2WdAiNb1ViXqj+17CuoPbXi+h/w4a2jm9NqX/h8M2AeheHRwwkU9
	 pAUbkqAm/AY4g==
Date: Thu, 3 Sep 2026 17:56:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Eli Billauer <eli.billauer@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apmKpl60eHuVFRjt@kernel.org>
References: <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
 <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
 <apgSCyj-h2xVc2ss@kernel.org>
 <1d7f8806-f4a0-fda0-a361-a011460ef308@outbound.gmail.com>
 <3c19c24f-5036-4bbe-b3af-e5eae102f34a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c19c24f-5036-4bbe-b3af-e5eae102f34a@kernel.org>

On Thu, Sep 03, 2026 at 04:28:48PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/3/26 14:30, Eli Billauer wrote:
> > On 02/09/2026 14:09, Mike Rapoport wrote:
> 
> > in this case. So we actually want __get_free_pages(), but call kmalloc() 

Just to add to what Vlastimil said, if you want a buffer you want kmalloc().

-- 
Sincerely yours,
Mike.
