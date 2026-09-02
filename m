Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F840F722
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386348; cv=none; b=e7pUOw6pq65xvNPiMIg0gQKzLINHa63rVnj0fF79a2CDKjlRyAaMPF0ci1aBmo8XLcZSYYMHtD7qxEuuL7L9OmGwjXFNwsQTlAvUk6hFylgVpo2+IMe4AvrGJL3SaXYUP5GWHU25WC0A/1JkDYuzMYOIZ7wLgqIdKPayu6xXvBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386348; c=relaxed/simple;
	bh=LrJdpTSGzluBUdfbqJ0QETLKW7Ou0o2YJDcdAWbxZKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKt6Ye+o4e/1dmvFrtR8BuWSZIKwENKgiMem6DS9HywKPa2c99F7uuNOtKCLxG7xbO2gLtdcEtXVWK4bd4lFWzEsGlqAMIKYiRLW1xKvWZ/Mr1yxDpGa/mN50+lZ9hbWev3IHvfJF9dbZ5FYndhFQLPZ6yqQkOGIclzAedBAGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DfWQWOrc; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DfWQWOrc"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e95a18c92so24034156d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788386336; x=1788991136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tdxm7M92DTyoyevA43shvxeG5HzPMJi7QlM30070D1o=;
        b=DfWQWOrcBK/E1s5cN/WSx6Vc00g7fK1mSW+6RgAQMzIQy5wE0fucyaJ3W48DGeYuqp
         52ut3vvv8NnL/1KvTgO0y1ZNdsZA5HcP3oViKZbRiAfPJaXhvXwDx1AM+S6tjbgGLB8t
         Vd0MOm0JQL5Itteb6zZ8i20UDpLsE3wFOPeFiw4SAqj0j7Y9JuK5IWxP8py7VgQ4ZIXB
         qDToJi+7OV5smrUdx7wNISCuIvUjyNmxb0f8YgKAMpJ/8ZBPu8miZtAVfTCZXM0y7Qzo
         1YF6dmlhmg8JiAyzlRU5iSUnsHcGfXLzZ/KLMxhdhAHF5aLjO6oFbs1S1rFMiP68aIDM
         Mm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386336; x=1788991136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tdxm7M92DTyoyevA43shvxeG5HzPMJi7QlM30070D1o=;
        b=tPouI/IyvbyfZT9u/NbwF6PXMT3CIslG8zmFOT+esBVDPol8bp+ytjnCzg03M/THsO
         f4YQAi8L+0jPmblQop+uyuJ9gJwVN+gTb/DkwjhZVLNINYIk1xVMqb9MO+GKH+ceSb/S
         unQ9FaRtCkZLh0MIFkwsxyLazu3CvvAxX3ljRPkpJv3o3oLka2ReLhyLbOHkmQsAYyDm
         HMdbb3iZGtuUKBaO7ZQBoTWtzgGsCNXUIJx2C+oWuVsao82pPRGPSwvjPDOZwJI2Q8nv
         v9CoeKBnroILpv5blJl+iL+IG5QsB3nIxDAvs6oy6n6oSnHdIXYpwu6uO4r2fSImRBn0
         4gFw==
X-Gm-Message-State: AFuF++lzuBpkRiCR2Z3XwhufxMLJLMB5Xlda6+WIvpjhyNyqiViLUFkS
	WZCQTTyjbIWqt1kb2rfvG+j9B1KWvnmWNXkfOlhSqPDF4svyD6GNILVu7oWAT1QsAVI=
X-Gm-Gg: AYBFou0UBNCZYLQ8VluXRpgeiVnPrFgBFWZBMC4skX+qNqrRIbpDUgau5jIVWdRzZqF
	yXNiO7gt6KtgOTlBltfrnsoOcTodIb63Qof1lvsHvAAQWAxkm5bnBBJbblYGZd5e1GwPFL6V9ZT
	/BkztY1YybJhdCAkrFJ5tswKgeW2JYkWsglUZ/NbR64XJuxZRD7gxZ84wDN9R6fYy+o3cgy8+Kr
	CbbH72puQNxGTY2En3QxzR1X7kPEIuQ6WB0WI2y47EWE6N6/n1+QxoSR9wcjDc2XTlO0m3GUnKR
	VzdUS8/HWiAkZWTcmxndvG3F9oLc7VApdo2itrwJQ/pPHNlbFDhpP4fn2Vf6amHLtbRAxVArzZb
	L+wzXA9kmSZ5wmJBk3nVNflag34mXriYVx6qn0m26FfA9TBEZjBMndS/BjqG2t0WZaRVa7JJ9jm
	RdVPaS1OO7XMcUx41YdzkfVPlx/73Jpk42ILL7zgtPH4eFyyVuNMTJMnGYJNJHOMD047/3Lw8df
	CH+bLRaczSRr8VK4y06zLmPioUzk4A384qqv9MD6MYvbdT5aw==
X-Received: by 2002:a0c:e011:0:b0:910:3219:6682 with SMTP id 6a1803df08f44-91032196708mr46818156d6.23.1788386335770;
        Wed, 02 Sep 2026 14:58:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ef0ef6csm27578886d6.44.2026.09.02.14.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:58:55 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Subject: [PATCH 0/2] mm: refactor zonelist constructors and iterators
Date: Wed,  2 Sep 2026 17:58:51 -0400
Message-ID: <20260902215853.156267-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_best_node() picks the next-closest node when building a
fallback list, and hardcodes N_MEMORY as the set it picks from.

Refactor it into find_next_best_node_in(), which takes the candidate
set explicitly.

This makes the existing behaviour explicit at both mm/memory-tiers.c
call sites - they select demotion targets in fallback order from
N_MEMORY - and lets callers narrow that set.

Then extract the per-node construction loop out of build_zonelists()
into build_node_zonelist(), parameterised on the candidate nodemask
and on the destination zonelist index.

Together these allow a zonelist to be built over a candidate set other
than N_MEMORY, into a zonelist other than FALLBACK, and iterated in
fallback order over a caller-defined subset.

These are prerequisites for generating a private node zonelist (nodes
unreachable by default), but are otherwise general improvements to
the existing interfaces so I'm proposing them separately.

No functional change intended - purely refactor commits.

Verified on x86_64:

  - find_next_best_node_in() compiles to the same 319 bytes as
    find_next_best_node().
  - Both mm/memory-tiers.c callers grow a single instruction - the
    added argument.
  - Boot-time fallback orders are identical on a 4-node guest with an
    asymmetric distance matrix.

Gregory Price (2):
  mm: refactor find_next_best_node to find_next_best_node_in
  mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()

 mm/internal.h     |  6 ++++--
 mm/memory-tiers.c |  7 +++---
 mm/page_alloc.c   | 55 +++++++++++++++++++++++++++++++----------------
 3 files changed, 45 insertions(+), 23 deletions(-)

-- 
2.53.0-Meta

