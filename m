Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D563BCD32;
	Wed, 14 Oct 2026 21:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014506; cv=none; b=tStneUqUTa5z6MbKby2AM+tfLtXxLxxXKYsacjNlYnQal3vG5rech/lnPRSqGt05eF0qr9Hq1NtOrA28b5TIg1pwlC/gWkSxlXnbT9YiiRNxGrX9Zz4Rc9XT6oHJ0QJMnVkBx8uahe/DFW5wdMSm9topONc/XbCHTJRBjo1Cf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014506; c=relaxed/simple;
	bh=Qtw4tqpy37jnRD1F0sO0gAYntfQ7DOMexnzlzmC+Moc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ne4JeMvuyHe4QFy5C9Arg9prANgH8nG5xEPAuaPkXmn+1nXk90IpymiQNlC3OyGrsP0lX1/49JBHloIzhwMJS0HK+Dtotnn1yKUyEEkOTA3uxOxx3g7XW4DgSa3TTNKbddhzTzI6Z6e9Eh04i4PwHD0g48/kSmOHjETqSiKrKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nmV5xaNV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nmV5xaNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190E31F000C4;
	Wed, 14 Oct 2026 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792014504;
	bh=nE9p+aOXIIOki/AIut1T2dhQSauB3dnwPrKqbqAJc+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nmV5xaNV3LJfbFGcryQYEiM9V9gNC5vV908mtxNrFb8K68y2kN+x3hOTAOZrE9BgZ
	 xZk1RUwjXH3S4Tz59mmdLpXd1LMk034hsCYchfQHBtqrxKz1d+RKGuGbeuBun4RGGO
	 jBrPxe99Fcj6wK2jornOlOK/QyS0EQURvzVvIpI4=
Date: Wed, 14 Oct 2026 14:48:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>,
 "Ryan Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman
 <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 "David Laight" <david.laight.linux@gmail.com>, <linux-mm@kvack.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Message-Id: <20261014144823.8c89da26c547fa95936a2fe5@linux-foundation.org>
In-Reply-To: <20261014140859.1006967-1-noren@nvidia.com>
References: <20261014140859.1006967-1-noren@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 17:08:59 +0300 Nimrod Oren <noren@nvidia.com> wrote:

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

This problem lies somewhere in the range of "minor annoyance" to
"catastrophically horrible", but it isn't clear where in that range it
falls.

So can we please can we have a paragraph which explains the real-world
userspace-visible runtime effects of this problem?

