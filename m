Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F723A5E71
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659435; cv=none; b=df4onrW8zsECvJJzcnuQpzXKS2twVkzAnIVuVry2hKpSo1tpmHFbBwXbqpSCZjGKsZf5BybQpzAXhOjBmgdNnbVkqLd40V2NlcjNc/2JzO87JzKJ9Rbf74Rv/4oIRaU4wdeNSB4CDOoIQ1GDqyZo8R9LL+JKRRJtoVV18RhNnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659435; c=relaxed/simple;
	bh=NYTnDkZFL7m/IP56oGFs81XfqvNjPzbV2wHWJTPl2+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzorCpZS8KXZOAEOtyxykRil9L5Mfss5svqXywgz/JMAD6tt0rCYw/m5VvmK0zJHId/AQRdgSbvoX7QttMFse07W1wTBf+EiLEYg5wi/7IcUEvjUx2Z/q86ZIFJf7kh4c2ZooNpuX0SDL+/zY6eI1AAgKKwKMvmiD9xsTi25GCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeDCnO0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeDCnO0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6800D1F00899;
	Thu, 17 Sep 2026 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659430;
	bh=9FS0Zh39EvFJNF8MC1pNriXws4rcUuxV51H6jv1cDVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KeDCnO0PnrntQhIgYqpH3onKDiM1X2/wp76FssvsPjXqggYWTwfwqLH1pkqB2Ajcy
	 vmjypuw8M3Kk1aYxSksj9IqyB1znizEtJ1bWXg7e9Ajy4/mv1xhMs+Hmoxkw2pEz3Z
	 yuVxBA6FSKrp5VYngimnYCcggyrz9uhKHT8qqalB5XhOVVLJpBRCoXVXHnJp627ltv
	 GI1OPdMl72ZN9NS9QW1mTWJ4PwqUq26hYTR6rWDP5cgenceUCO7pdadWNJ5Oc+KHs/
	 jz3qBVJLQEivTZVTX/G6974n7dPINny/Pr6N9OsCUfMj3rxXy3u/Zr+2042ss4DlqQ
	 wFwrUHKRheJXw==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org
Subject: Re: [PATCH slab/for-next-fixes] MAINTAINERS: update slab.git URL
Date: Thu, 17 Sep 2026 16:37:01 +0100
Message-ID: <178965921180.1114058.11649457371183198247.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-maint-slab-git-v1-1-d21a5210aec9@kernel.org>
References: <20260917-maint-slab-git-v1-1-d21a5210aec9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 16:38:37 +0200, Vlastimil Babka (SUSE) wrote:
> The slab.git tree has been moved to a new URL as part of the mm-next
> integration. Reflect this in MAINTAINERS as well. The old URL will stay
> around with historical branches and tags.

Applied to mm/slab.git slab/for-next-fixes, thanks!

[1/1] MAINTAINERS: update slab.git URL
      commit: 4c51f0b648cbf190d15d4ff60826c769f7e81df6

https://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git/commit/?id=4c51f0b648cbf190d15d4ff60826c769f7e81df6

-- 
Cheers,
Harry / Hyeonggon

