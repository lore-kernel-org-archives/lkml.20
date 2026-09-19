Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBB379C39
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779644; cv=none; b=sp2R91/8nXD3lvdmsY13XXAJJkIVUBJomsJx8TklaY57mMzQ1isBieR6evNg/PWa8lzWges6/41hHsrImO+OxAH9f6ZBnQfxgxOQMi7sBSCV+z+wslJ7XU31CH8r7x6ufiD6GZX2aGh7HMFycx+gW8sLpYpAqouWmwS7uojB55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779644; c=relaxed/simple;
	bh=5JL3Bhsv/HAlVKBqnw7BaYf4Epa5vjzFi+rciwmIgo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7xQB353Bouh7kuiUQzjglU1cZV7gp1sdTtW6ircAx23I2wK8L9hfX+sWy4ElF1WcihejPXsBZyPBHSXWM3E1DnZPngYW8PUZTRRfuoXuNpfusMmAF/ebcS/VjDXWVptzz3a4ucYZySaq+JRvizT2WZ2+IX89A0TCFICJTodD+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1WpHsfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1WpHsfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896F61F00898;
	Sat, 19 Sep 2026 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789779629;
	bh=9lElQgrUnY9LHTkSAaKVYQoZBcsoW1xlrdh3QP0whJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j1WpHsfmwAvEKkTHWYEXgqB5++KnNamAQdRHtTAriAohTEtMtu/PdzVC53L5e2n/h
	 w0Beh48taro9Z+W72rv17Vmio1IhfdJAgoQ0dd5qFl/sJQC/Wj13A9XAN9G3Cy1P0d
	 lvsMEs1tQdiwSYKbEuzil4s11Z6JQeMvbYDh576S6I/SdizuStVDPny/BaUlbtjH4V
	 jv9osrZrjlm1mAMt8FMfjBf3FOWVMzTBpMAQhCjOBcQK/5tUVs90NpM3l2SB9mPQ4H
	 2zNMxIsJp0t780nRIqsD7hiWK+eHOBYf0dxga9vYgRf7RM36gcoouXEZuML5B7GGcV
	 p78wvKErbOtvQ==
From: SJ Park <sj@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Constify arguments in default pxdp_get()
Date: Fri, 18 Sep 2026 18:00:22 -0700
Message-ID: <20260919010022.88004-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918064928.793742-1-anshuman.khandual@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 12:19:28 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Generic MM default pxdp_get() helpers fetch the values contained in pgtable
> entries via READ_ONCE() without modifying them. Just make their arguments
> explicitly 'const' for some additional protection.

Looks good and safe to me.

> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
