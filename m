Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899654B1CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089198; cv=none; b=mj/JDLrbeayHFZwyBzvlC2PlXSGI6jjXczqUaj2m585AUzs6qoGLWh4te4gw0OvaBTzuf8c9bvQWvOAh2iwqKl0wET02WVJtAShzya37bTa+f0dImuabBfdQjLnW668ouinmvDQnYyHbuoZbdxiN9zFL5hnlzVQbkTKnan7txKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089198; c=relaxed/simple;
	bh=7oqdlF6rIZ6XSOiB6L4ok4bsbqDwbczXI8WimmXzVGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBHXVNhFYZLNVyGefNDG1qEnJoNaDUGRdITGWmU4hudTSmOSMjwbKTES5pRVx1JJoFKrnLPaR3cDqqIVx3ci6LLcjhW2PG81EYqd4N8hj6cVhDqzD8jssUxmZQvt8IZUpcNmaKRJErAvtODYfVpBuvBv/cCCYoDcE+3jCCNVybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlzzuqzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlzzuqzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7577F1F00893;
	Tue, 22 Sep 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089196;
	bh=mfvUSx3nWzsWME0SMo6zV+P5ZEdJjsHo/ZxJ+7G2kQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NlzzuqzHeWanEbM6v4mV6hqSpZssW2vgN3ZR60wT+emilQBA5XlMQSyq0yj7QLNWd
	 JtlWH8dNTU0UESgg6+snD2SpjIUJO0+UNYClJUJjbt88ODutrSDCpw7skmJMNvRYko
	 mD/0BlnKnOR14BPz5GXvJzDW7BRQYvbvPHD1LZ0A8QxKQVi4vxKvnKg2MNvr18Xv0K
	 z6cU5Ua4ucOw5YDCY8amhcSY1bzXMB4EEQlp+7aDMZKy1LbYGZVpBM49jyEDTp27ay
	 azwPOIsDqy5s1P+J5A2b/75Tn6Nwse0ZHun0jeVrfmAjDyjwl+hvvw8JFMTVUJtY/y
	 B/5HVY3ONmiPw==
Date: Tue, 22 Sep 2026 08:59:54 -0600
From: Keith Busch <kbusch@kernel.org>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gjoyce@linux.ibm.com
Subject: Re: [PATCH v2 0/2] nvmet: fix subtle race in I/O processing and ns
 configuration
Message-ID: <arKX6rZq_CLz05X5@kbusch-mbp>
References: <20260918162736.802665-1-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918162736.802665-1-nilay@linux.ibm.com>

On Fri, Sep 18, 2026 at 09:57:29PM +0530, Nilay Shroff wrote:
> Hi,
> 
> This series addresses two race conditions in the nvmet core code that
> handles I/O submission and namespace configuration.
> 
> The first patch addresses a race where target namespace attributes
> could be changed while I/O is in progress. The second patch addresses
> a subtle race that could allow I/O to be admitted even after the
> percpu reference count has been killed or marked dead.

Thanks, series applied to nvme-7.4.
