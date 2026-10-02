Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447A233721
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909687; cv=none; b=tLeD7qh5cCP61bzFTiILy+ZEQlhdGuKmM+I26nd8pP2yEmprq1i/DkvHWgXGVNEKqTjfjMaDJWsYGSTJRXy6C6Qsmdf0ig8jn9+E3F/mm2TrhAt+RVI4lYoR9hDU7rcv9KYckonOlJS1yizAFEtnv/8Umj+lvegaB8/WiDtCFiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909687; c=relaxed/simple;
	bh=HkIILgkGXX/WY6KPEW4mlVoPl1sT6CpQeXG2VxvxdDI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SclvaCFjaWgjpfBVIZ6SohKNuix0fQxWfxBGdCm71nIYkwmL+8LL6+ac4K4tAgEuqs8RUsR42CBol9mj+NEB+0OfWob3+GquHtDIehhEYZ0C6YFD+juyD+MQ6euEi2ByKdheQuFmCX4UZkGWz7BuZG9eiNBFVXcPESD7eXGnxHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=emUaZhWV; arc=none smtp.client-ip=95.215.58.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="emUaZhWV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HkIILgkGXX/WY6KPEW4mlVoPl1sT6CpQeXG2VxvxdDI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790909682; v=1; x=1791514482;
 b=emUaZhWVfbgMR/j6MNWzWvKo+SRbQigTqHwfiatQjSGs6K/18xOOCC8HjjY6pCgEFr4rRP5O
 vd/QDwPkcBA2+uryD7ajQclCsjax3T0NeZN7TaT0HQyGKWvyRWL9QM5VcfdFBCfGzc74m5ewgU/
 rtPYdrj4cXGAoMEXKDwtgCSI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e27fddd3c8a9abe;
	Fri, 02 Oct 2026 02:54:42 +0000
X-Mizu-Trace-ID: 4e27fddd3c8a9abe
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 2/2] mm/hugetlb_cgroup: add trailing #endif comment for
 include guard
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261001123747.634845-2-lienze@kylinos.cn>
Date: Fri, 2 Oct 2026 10:54:25 +0800
Cc: osalvador@suse.de,
 david@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D26529B9-9331-4B60-B811-23E616308EE2@linux.dev>
References: <20261001123747.634845-1-lienze@kylinos.cn>
 <20261001123747.634845-2-lienze@kylinos.cn>
To: Enze Li <lienze@kylinos.cn>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 1, 2026, at 20:37, Enze Li <lienze@kylinos.cn> wrote:
> 
> The final #endif that closes the _LINUX_HUGETLB_CGROUP_H include guard
> is left without a comment.  Add the macro name to the comment for
> consistency and easier navigation.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>


