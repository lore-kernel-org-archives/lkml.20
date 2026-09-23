Received: from out-2uec-a98.jellyfish.systems (out-2uec-a98.jellyfish.systems [63.250.43.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2520736B054
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130783; cv=none; b=qKGb+M4QqqhClh2FeQvtnde6h+5dWI4A7diYb/66at78Z6rzR+7Spfew1HDR5zazFm0vq6aidmGQB4oL5IAXFhT11TSbq8BcXopUhemPuxit+IimZbcU/24VkRctFQ5XRLqWyTKDq+bl7z6FlFHCX0sG7XCqeR2yKGWNCcVUfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130783; c=relaxed/simple;
	bh=QhQdABlylOEbaAhIq2fvadeIDgLzvHLyAFVEKqUhlP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VmWqb+i79B5oyMtiJGFYezoi9ubOsMa/ACVeqtIylIr+SZ9w0+Lbgsj4PVYcC9bFdorPgDVFKXw0LrKWOx39Lrj6AH6RrZcjmb4sQvyRrzQwCKAr6dqrGjaJXB6QY5ojabeuzKbERw1gz6EDYp+nD8j5kuBI9sblgUXEJuXic0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=i1hlCY5N; arc=none smtp.client-ip=63.250.43.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="i1hlCY5N"
Received: from [10.18.116.108] (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLbn1Thyz8sZ1;
	Wed, 23 Sep 2026 02:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130774;
	bh=QhQdABlylOEbaAhIq2fvadeIDgLzvHLyAFVEKqUhlP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1hlCY5NgNFlNCgoXdHhCpD75lDhkozAfMmrWrvw3kEdi4U88oip1XEEBNuEXwrSr
	 pPmuVn4RA7Bt3TNUIH0BiZCabZZ0z/2sFgchhdYojlUiFxNd/jmVAgwoIDW/MOH8oc
	 Am0afPogrBPMxizTPbYAuH7B0j9ovWTMvtm1fLsaBIXSVSk/kc+0zN5UvyrxJoay/x
	 tXmtIVlXZK2ZKSgKWPpuQhMYI6wsNHXeKR6oOfDWUGMEdhbfIeIOnUP6Z/mBBz4d9J
	 tmEbAFoSEHujRV6w7NsBfX8YOR5NDVEdJTrCQ+8ZdHkyg5L6v0dvaZdpD3E6myC2SU
	 PkXmPHPkSkAGA==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] memblock tests: fix BUILD=32 address conversions
Date: Wed, 23 Sep 2026 11:32:49 +0900
Message-ID: <179013076994.1911052.6395482478037915192@tychen.cc>
In-Reply-To: <179007180279.508753.4595268983388589280.b4-review@b4>
References: <20260916161105.2548281-1-hi@tychen.cc>
 <179007180279.508753.4595268983388589280.b4-review@b4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi Mike,

> Does it mean BUILD=32 without NUMA does not pass with clang?

No. I reran v1 with Clang 18.1.3 and BUILD=32 without NUMA: all 189
checks pass. The previous cover letter only mentioned the NUMA-enabled
configuration tested then. Sorry for the ambiguity.

> I see a lot of warnings with gcc and BUILD=32. Do you mind fixing them
> as well?

Done in v2. I reproduced them with GCC 13.3.0 and removed the remaining
physical-address-to-pointer casts, used __pa() in tools virt_to_phys(),
and initialized end_rgn to address the maybe-uninitialized warning.
The latter is a false positive; each insertion already sets the index.

The virt_to_phys() cast also sign-extended 0x80000000 to
0xffffffff80000000 with GCC BUILD=32. A separate boundary check now
passes with both compilers in 32- and 64-bit builds.

GCC and Clang each pass seven configurations with -Werror and the default
ASan/UBSan flags, including BUILD=32 with and without NUMA. Details are
in the v2 cover letter, sent as a new thread:
https://lore.kernel.org/r/20260923023126.1910311-1-hi@tychen.cc

Thanks,
Tianyi
