Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B74ED186
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982991; cv=none; b=tzg8kAdBCQu8jwJvaFrX2qr9ouvn7qo1NID0CzbtsYCN1RLo4WrABZ9wwOS2So5gENv2RzUlf1nRgOQKXCwWgX8S0WZ4uSDRq/r8Hncg/xfSgnBckSpXsI8DG6oc0K3GzPF+TB78Oz5FQiANXtu3/ZfArEjLD3G0WkzQQwOHcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982991; c=relaxed/simple;
	bh=EjmdaeC/P+JARIDpgDtJSPgLA0Efrd6WRKBwslqb5/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooRNkJAWttN3l+Yt6JzXEL4IYlI6tD4eUfgZjtoEB3q/9Pp9XnN5ijOVe2k8bYTMcNLBdhKIq8l5H/w0iXGLtHBTvTN5wYznzP4FYMwu3r6zQ+L6XxXA8+OIguH50HqQ+Dk0G5TxHONC8CpOpQTmakocSDlbgVgd+zUqK5dFPJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8FF64227A88; Wed, 14 Oct 2026 15:03:02 +0200 (CEST)
Date: Wed, 14 Oct 2026 15:03:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, Christoph Hellwig <hch@lst.de>,
	vitaly.vul@partner.samsung.com
Subject: Re: [PATCH] mempool: optimize mempool resizing
Message-ID: <20261014130301.GC15407@lst.de>
References: <20261013091408.1231786-1-vitaly.wool@konsulko.se> <20261014084528.1280968-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014084528.1280968-1-vitaly.wool@konsulko.se>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 14, 2026 at 10:45:28AM +0200, Vitaly Wool wrote:
> We are using mempool to store a large set of preallocated rather big buffers. In case
> of memory pressure we'd call mempool_resize() (via shrinker callbacks) to reduce the
> amount of memory occupied by that set, and when the situation stabilizes, we'd go back
> to the original set again.
> 
> Imagine you have a mempool with 10000 elements, and you have to reduce it to 3000. Then
> if you at some point want to go back to 10000, you'll end up reallocating the elements

Who is "we" and where is the code?  This is a highly unusual, not to
say most like broken usage of mempools.  If you need changes to support
such a use case you should include a link to the intree user (or bundle
it with the submission of the new code).

