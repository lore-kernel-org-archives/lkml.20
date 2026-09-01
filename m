Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B7248880
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273781; cv=none; b=pBLA4N/DofFh8PI3Whl4uSF32tXPmKlo3XX6hK1Ku5oSBHd9J4PyxrrYaNHtOSI0CkZaNT34rnUy+r20yrafwYYpOfHvsZ8v6hjm4ZE4NrKa02gtWHjyUQ2S6PR85vHHXO3Dg2GzmpJMCX9b/X4EdX2HjQNny0dS8M2A05DKuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273781; c=relaxed/simple;
	bh=vNFqOdBLfVl9p4V0gB3fi8mbb5maVqgyZ8oGsuYhh4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoAz4uiIPPj4EyvL1u1s8GPClokmXbJn+rIi+wkabA4Cfl2QgmQae7dOBeSDovuqociRAz93v6lB1/2t9ZXW4Qrn+PSdj3xY14S4qNNRGJ26nBAcIlBwLA4TK8WY6L8w2+aZCfrklo0ossGVaNc/yyiogqo6Hs1r6FStPTF7Fao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUmYi5Bb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUmYi5Bb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331541F000E9;
	Tue,  1 Sep 2026 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273779;
	bh=vNFqOdBLfVl9p4V0gB3fi8mbb5maVqgyZ8oGsuYhh4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUmYi5BblRiOOYwxdx9bqjWbEjf5OaIktMr6qQ4fkHdQvbz3NBkGuvgzcN6ZEnXIp
	 Du0TTP70YtdMgnrNYdQfUHCMP5rVz5e38jfz8cy5f1BV5osKx2l2tujbzFoEkP7/Ds
	 uUfVbNgHo3/jxIhciafJ+Vh++lPdYtOOQJf29/Qouc8vhmzx7qDTiTE2GOocnmxRNc
	 anZQbnOOflmoACC/YpagMJqkxWkP52TxE+C+zkHZnyyWatRcIcLxmDbJszGdO0Et6H
	 D60Urk34s40tTOIuvO6+8mdvKbFRyarDC8Q7O7eG2s7N8EC4ejBsNBjvB+IxvIkllm
	 B0I4H6AcWz7eA==
Date: Tue, 1 Sep 2026 15:42:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
Message-ID: <apbkQIz1A03W-wps@gremlin>
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
 <20260901-mm-remove-unused-helpers-v1-2-f092d086f7dc@columbia.edu>
 <apbbw0A0f98nlVol@gremlin>
 <3a494e29-fad1-48cb-8ac8-d9a20d97f020@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a494e29-fad1-48cb-8ac8-d9a20d97f020@columbia.edu>

On Tue, Sep 01, 2026 at 10:29:38AM -0400, Tal Zussman wrote:
> On 9/1/26 5:06 PM, Lorenzo Stoakes (ARM) wrote:
> > I also see totalram_pages_inc() in tools/include/linux/mm.h - could you remove
> > it too to keep things consistent? Thanks!
> >
>
> Yes, will do. For some reason I was under the impression that tools headers
> are generally synced separately as needed, but that's clearly not the case...
> Maybe I was thinking of the tools uapi headers.

Well they usually are, or should be (kinda) sometimes. But since this is being
removed it's a good point at which to sync at least this known-no-longer-needed
bit :)

--
Cheers, Lorenzo
