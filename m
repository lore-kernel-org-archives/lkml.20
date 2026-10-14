Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5353E2F8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002331; cv=none; b=LDFFwnuNiIDNdDyVfNLZZDYstjtNNFaOLangH+judwH7MUWBNmZksspo1XkMSvGaeA1eV5+1zHWLXmNw4xKoQmOGbDsiBWEUrpSZ/lozZoI6F2K/0sdZo++spyVMaLvUqrxnPDtq1e+DgpR6jazu312BuUo9vtSl88NM6bHu57M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002331; c=relaxed/simple;
	bh=UfN8ZqWj05pIM5YKkJVUzL7gKRgIUqF/r9OZzNufKig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXB/K6ZjzMxpl+2FgCPQKz7UmT8xDdXac+uuO5D7uMr1nnciz94er6z6GSOJTNESPJuAM+rX8D1zX1vqMCuhzWYJjn/gzvSK2Dn+8b+tt8b4qOpbFoUQU2lyosgKSDg79iw3P8LoKp15j1fzzPuy/05oKZY618z/l7rmI+bWMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qo4rPwJV; arc=none smtp.client-ip=95.215.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qo4rPwJV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UfN8ZqWj05pIM5YKkJVUzL7gKRgIUqF/r9OZzNufKig=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792002327; v=1; x=1792607127;
 b=Qo4rPwJVvm2PpattjHo2LOSOgyb9QwVRtSmPdgmwqU+eiWeH0765nrZsBkG3FoZIqjSpIdAK
 GRcuzIySKuq4eeE3lf1p86Rq/UlEmJEP4VJELJUjD7P1iz3Em6b4o283SmL96KN31Xp8u74Ba3c
 Ka8DnriZS4R+OilJkIpc47Vo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6dbda3fc00612143;
	Wed, 14 Oct 2026 18:25:14 +0000
X-Mizu-Trace-ID: 6dbda3fc00612143
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 11:25:12 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: memcontrol: remove mod_memcg_page_state()
Message-ID: <as_I8DoRCYpnTXJg@linux.dev>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
 <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>

On Wed, Oct 14, 2026 at 01:08:20PM -0400, Tal Zussman wrote:
> The last caller was removed in commit c466412c73c3 ("mm: memcontrol:
> switch to native NR_VMALLOC vmstat counter"). Remove it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
