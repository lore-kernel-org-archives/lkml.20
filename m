Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA464FDA73
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784578; cv=none; b=RmLnyRtbgyARcLUfedJ34bRNSMVv24j0Emw9DTbuwYOsjpwufC9MJb7/wSw9D3RWmfGwyVjVKeVV/qqc39UIZ0Ynnayc5CZzx3tCmv5i9iH+DLbYfwuSrqZHOnIIgjifaBqvzsd98dOYG+Ht+ixohfkd4VUUlWuNNacK+taiOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784578; c=relaxed/simple;
	bh=egkKq7DBcopH/CfP7k5cRPLfBK4xdy300HzFpQQxnAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAcJxP0UWTHCcx0D5GrRGDIZqotu3oGamda/t+4eEp17NhPD8bD0qk+WEs49P4lqr8KEdb/FY90BZBhThUzwiRFVQs+UxjtmvItq2igSb/8yndr4tlNlX4eHm7z5DLLc8sQhkML73GQO2t87qIP+4w7xJovCbEsXIu+sr+22fNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGpAu3/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGpAu3/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753191F008A0;
	Wed, 30 Sep 2026 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790784572;
	bh=egkKq7DBcopH/CfP7k5cRPLfBK4xdy300HzFpQQxnAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IGpAu3/bbz/wXi01745K8+qCWOILcLoMAtMht7XGkjTS7fMKDt15jBiRczG7jgq5B
	 oluFc2ExDATT8nfGzvmyKaqmTlNbttYn0nwo98fGD1W+LvMTk6WF0VvVjjdJjisghN
	 QVu+vwX3XGw8ss3Fn/C97lREaTK3NGDQGWQNkym58NOE/ZvRS33VdLVNu5lbuyRb8V
	 RgRG1OcJsycDVVqDdByDvIQ/WwBilRFxvL+3EiBT14nvx8yufnS4VfSeN4RWEz9FTg
	 OnCrY7+XCCL0/TGGvPoZZjcg+7hKEVVyxUB67RIx+yy+JdJxzk2MajUY9iQ471N9uq
	 XzzEsfwLvK7Aw==
Date: Wed, 30 Sep 2026 17:09:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <ar00Lx1xB5rvKOdu@gremlin>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org>
 <art6x0XpWcT2aUyy@gremlin>
 <CAFPGN2jPGhcWVqa3k16RWMaMR3TwKyhFbYYF4D3L6L85T8E96g@mail.gmail.com>
 <7d120555-0c31-474f-893b-e5ee3466ead4@kernel.org>
 <arz82IHw4MqGTb6l@gremlin>
 <091706d4-96cf-4dbd-8f9f-97ebd3f8d81b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091706d4-96cf-4dbd-8f9f-97ebd3f8d81b@kernel.org>

On Wed, Sep 30, 2026 at 06:08:15PM +0200, David Hildenbrand (Arm) wrote:
> >> So is this patch doing more harm than good?
> >
> > As above, I think the submitter has decided to drop this patch?
>
> Sure, but I still got CI noise because the patch was apparently not even
> properly tested?
>
> So I really want people that send "fixes" to test stuff first.

Entirely agreed!

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
