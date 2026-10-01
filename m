Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEC526A99
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866348; cv=none; b=Ny+jdh4+Okuu63DcA3YPNQNHxCN2mey9zj9jE6UdnrI5Uwgdz/rkl80wGSvoyt4DTkfJvt+zrqkHCmKCPZNtXun0MlUmThdMh1lYdxASrFRBylLsT3W5prBAeW+e9mnMypKHmwPqQrueZwqIjFdFbzmQc/Mklww44mQfQhemSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866348; c=relaxed/simple;
	bh=YxNjso9KjpjP2pDGx7oGaiU+zaJJp4PBvs5wT3NhcQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNv1Z91mS1zLTEE7Hc3RjCPOsK3OUrBrhuJXFmxYwmvSJkEgX8KUOlbvloAEWgMpQVJ4f4q75LGDwfY/A5QsLmcR6LJsjy8MVfuPk1zl3RjJI95mN9cz4HgDKvd46Rw2EDTxJ/ZJsaHZj145hg2CnTRPJ4x7Z42O1Pqwboa6Tj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=acz08jLC; arc=none smtp.client-ip=91.218.175.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="acz08jLC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YxNjso9KjpjP2pDGx7oGaiU+zaJJp4PBvs5wT3NhcQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790866344; v=1; x=1791471144;
 b=acz08jLCHokKKFFoktu7aVdnwKze8YfmCpzWps0Qfs6x7Iz04dgN2si88PqT+WHvE7diE2qF
 lhQiu9vG1t3YQgRzPX/RXUAmicoMsNLdvj/Jy5A3eM//nUT+E8t2xd9WIGnAjdDUyluNIX6LLvy
 fhKT/MmqGbdnTsDGkfTlcjVM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 476754a991a89109;
	Thu, 01 Oct 2026 14:52:23 +0000
X-Mizu-Trace-ID: 476754a991a89109
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
Date: Thu,  1 Oct 2026 22:52:17 +0800
Message-ID: <20261001145217.19370-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-5-songmuchun@bytedance.com>
References: <20260929053231.66085-5-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:29PM +0800, Muchun Song wrote:
>vmemmap_pte_populate() no longer uses ptpfn as an input. Drop the
>argument to simplify the code.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Nice cleaup! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
