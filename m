Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369153CAA3C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899379; cv=none; b=dSIgRsvPYCxB3BbXJ7YIlgU4SfMA1bqUn6st0xiVNAIcQdXaRs7YB+/3eaSuJrBWiHYxej1Br8J+kJh6waJT1fuZ06m42s6wdgkIztbr+U6fsBW9iUdQM4ZkbD7iix+k39SlGAIk0cUXFlhkvzoaCWSXLA3LNnLaUOrbtr2oNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899379; c=relaxed/simple;
	bh=g/7QNbYwvj/vNshzviunkxO3++t5btxOR6mdxsQA7QE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PwUKpGbi1jCveaOg9v2aQmgjiwvqOwitAt/fre0/t9zIbqIGs1wNU3jCCTDuzWbknSaNWMiI/Ki9HvUN60YRimmPPMTp5nR/cfchxe4yNoboaxuuTRrJ0Lr04eXSvRdzAiKB4lxP4UD4mptYT1OM7C2nJQLtg5PI1yWE0gLCH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hXo2gBJq; arc=none smtp.client-ip=91.218.175.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hXo2gBJq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g/7QNbYwvj/vNshzviunkxO3++t5btxOR6mdxsQA7QE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787899376; v=1; x=1788504176;
 b=hXo2gBJqrRnedDX5m4oPYFdvDyahBhB0vBotUAuGWIDlrdkb7XMs0a3VNAUroUNkXGTrfM88
 bxQ7Gi3IKu8nilM6LZXKhasO1Ek6yanoXckF7Nhrpjc+zFRdJBTwra3aOvOHK41CGfPyQ/+rknh
 h+akAc8cFe7Vu39sl02F5mNg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 687cbe4f83213111;
	Fri, 28 Aug 2026 06:42:55 +0000
X-Mizu-Trace-ID: 687cbe4f83213111
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2 2/2] mm/hugetlb: warn instead of silently bailing
 gigantic pages without runtime support
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260823044118.1097121-3-xialonglong2025@163.com>
Date: Fri, 28 Aug 2026 14:42:37 +0800
Cc: osalvador@suse.de,
 akpm@linux-foundation.org,
 david@kernel.org,
 mike.kravetz@oracle.com,
 mhocko@suse.com,
 linmiaohe@huawei.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 xialonglong@kylinos.cn
Content-Transfer-Encoding: 7bit
Message-Id: <2EC70FCF-D812-4FD2-9172-F2520FE931B2@linux.dev>
References: <20260823044118.1097121-1-xialonglong2025@163.com>
 <20260823044118.1097121-3-xialonglong2025@163.com>
To: Longlong Xia <xialonglong2025@163.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Aug 23, 2026, at 12:40, Longlong Xia <xialonglong2025@163.com> wrote:
> 
> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> remove_hugetlb_folio() and __update_and_free_hugetlb_folio() silently
> return for gigantic hstates that lack runtime freeing support. All
> callers should already filter such hstates upstream, so turn the
> silent bail into a VM_WARN_ON_ONCE to catch caller regressions
> instead of masking them.
> 
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

