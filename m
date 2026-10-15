Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC3387341;
	Thu, 15 Oct 2026 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056006; cv=none; b=Jf9jKeLcrY1sn5enU15JDSQhYk8ewwW4nSNU29qKMAG2Che2OEkuKahmcnn0U9U9KpdVj7h3Ih6eRIfugIrIZO6rM1PsSAvyz3A/g1SiM3aAKiKHDOla9PGnJ1wHIllOy6rs57nGX1Mos2LFbCfjh5ztcpmH8ugDi9YDhx23ZNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056006; c=relaxed/simple;
	bh=6rmDLfmPFOEb+91ATPow70AxLAL9bqOXhWbfxOseyEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PauO3bamfGWEiy3og6JHSAQ++Jat2hFyO0BgZmwbBllJ1riPi2nM5IT4tyj3m9tUk96HL2WGu7nw8K9IkPM/MqsdZ4sU+hDgXezuYzZE3IciMdCAzsDD2OKZTBpGGqsIghQpQBpG1UB8QsxatQxue80Q+ppuXpw8651xWLj0n5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee8GqM5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee8GqM5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8431F000C4;
	Thu, 15 Oct 2026 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056004;
	bh=jWjMbMJOkJlVwkNWl6sXzkpalYbjUF5GANsswwBKBBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ee8GqM5Q8ed1YdkRKIdgL5TdxLdgu5NjTIu/9H/2bHGSpU79fcQV+K4dQcuP5UxEZ
	 Sp7QhHmQwTXdL/rbynzwN2rhmVGnmHYCOo99YQuHiBBXqIUmLYbySXD1/UXocCKmsV
	 AFOexAFfDmwiKXLVEFjhX9XgHF16YCHqHYV9CVnO4jsybDzVbZ4tAzEPmc76QnGf5T
	 t/rJTzxXn8AQHwQ/kB5s+fCa0n9FJrCUifhB71/YYBzZh9On3dqP0BiYesp9/wihg9
	 sdFWaGY9/iCUGLVsCqBBAVks+PugGBX7i21WbrN6bcG9ZEPJ4cC4CuiVexY2wfpqIs
	 /Cabgy2U9Y/7w==
Date: Thu, 15 Oct 2026 10:19:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Message-ID: <atCYukfCn8TOgM7S@gremlin>
References: <20261014140859.1006967-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014140859.1006967-1-noren@nvidia.com>

On Wed, Oct 14, 2026 at 05:08:59PM +0300, Nimrod Oren wrote:
> min_free_kbytes is recalculated on memory hotplug and on THP sysfs
> writes. The new value comes from calculate_min_free_kbytes() or, while
> THP is enabled, from set_recommended_min_free_kbytes(). A value written
> to the vm.min_free_kbytes sysctl is replaced whenever the new value is
> higher, so a lower value does not stick. This matters most when THP is
> enabled on configurations with large pageblocks, where the new value
> can be excessive [1].
>
> Stop recalculating min_free_kbytes once a value has been written to the
> sysctl. Systems where the sysctl is never written keep the current
> behavior.
>
> Link: https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/ [1]
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Link: https://lore.kernel.org/r/d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org/
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

With an added, focused, paragraph about user-visible effects as requested
by Andrew (you can probably just reply to Andrew with something and he can
fold it in for you), LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks for sticking with this! :)

> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17aa4b..189fc57dac5f 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst

> +By default, the kernel sets this value based on the amount of lowmem
> +and recalculates it on memory hotplug.  When Transparent Hugepage (THP)
> +support is enabled through global or per-size controls, the kernel may
> +also raise it to help keep pageblocks free and reduce fragmentation for
> +THP allocations.  Once a value is written to this file, the kernel no
> +longer adjusts it automatically.
> +

Ah nice to update this also!

--
Cheers, Lorenzo
