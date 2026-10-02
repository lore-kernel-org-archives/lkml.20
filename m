Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A136D9FE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966856; cv=none; b=kRkzK92+KUyC3ZpUfdZVa610GOcOJJyXGGRgANxNTgnwjmfBMv9NVXdMYoud1XXERSeyqdrHmyvqKUM0wuJOyjLcw4xzXhFNN7mv8aiPD1QZNHhJaAZ4P4H6qFPdLaiWcKs0FBi97CgVsTQQgHzeJrfBFk0SsPRjjC5rcKwaFL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966856; c=relaxed/simple;
	bh=2jJp6Oyus3rxaZ9Pu8o5U7lbrlyKQQNE1RgKH909n8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxJkaDSI79fvfBCuWFwcqbi/ynLXJsV4avm4uQ0mm3cz/1zcvF0PARtolkn4s0FJ7SS2tdMflczRV4KkKyu7DkO4lf9hW/WZgbqGT74EBCBF/pWMftBHC4oSyZwX2im3UXGShSAmiM4vJqo5AbeA3QBkFONfBmiNeaxQVkUX9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yl6jrsKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yl6jrsKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670801F000FF;
	Fri,  2 Oct 2026 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790966854;
	bh=GyUrA8h6yWS5RyOPKr1WsM35VmKklcpbCOnMDCuxpWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yl6jrsKzXjGPTQNLFE+7pzbS2k/Tpq0t20ssMdimxEO4WdY+/gEEygqThMDODoYQV
	 5r4cCbFQ/f7+AKE0t6ynyuIye3mOwoo4LFGvADzWs5d1/WCFA3tKcuicLOKVz4w14D
	 VM3z8nUSMxZKdyNUHdlQkbyPTFLgD5Sn8VpydqjHvRXRSRQQ5LPQsCO5ep0YYjfErQ
	 7Xnp1gL77D1yrK3BKOoWVLE1enK/igvCmEZJ0LgcjVdjLom3kmLyw6ZA2faBFZQFpj
	 3jEm1UCCju7Y98c8OuEElKtdu6//1jhvupR4KXPKAOn78+X1Pbw+fbPKjcaVB4Cykh
	 lhp8GAnt+Xy2w==
From: SJ Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()
Date: Fri,  2 Oct 2026 11:47:28 -0700
Message-ID: <20261002184729.41370-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160535.661399-4-ekffu200098@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 01:05:34 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> vmf_insert_mixed() just calls __vm_insert_mixed() with the same
> arguments.
> 
> So merge __vm_insert_mixed() into vmf_insert_mixed().
> 
> No functional change.

Makes sense to me.

> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
