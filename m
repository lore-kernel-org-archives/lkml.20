Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E33CF21E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416152; cv=none; b=aACRmeGe4fvyX1Y9g9/aiTxsRwIe+17BH659fQfWQUkNEUV+ugbCW2BP8GKMutUTPiQuaFm3AJXXo13AxovvBjP60uhvHopYstXy8M7cwxP3QZ/zeQeblpbtzRcYOt/6eHNPmQr0MqKwx+s98wRWNnnwsI0QePrzkXQLfLBWbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416152; c=relaxed/simple;
	bh=ozxwDUyi2Jrz5fmCCNaXY1cqHon49rF3ga5YguJGK5k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Yzt5UuJjItPR5k4dG8r+RWW0c7fNaM6mJGHjByt2vetaNV7OZOuKXa0l4uJPUZfmu1KKBD17qMbk8uewgSMnKPZGQMjZMpy5yyluznq2flQ1ACst0dhyHolyPkyb+EcYUoyxmUMT3/7jnVHqjJvllTMu8SgVnP/8voKpxCoyo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jZnAZkwp; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jZnAZkwp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ozxwDUyi2Jrz5fmCCNaXY1cqHon49rF3ga5YguJGK5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788416148; v=1; x=1789020948;
 b=jZnAZkwpZy2pYbEnZW1HPAz40kg78Khchq3n5lbJWfY9IDPXB8b7wgWYs5yJSMTPi8viViKA
 5WxbYLwLZopmAN3rrIFNe95bZdUeV4mJRts++m9QgK+NHAo24Be00+kjwQ+tLWvtrCObLiJw3g/
 E1rK6qB162Q0wTUftavmWmxM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c28caae6b09f6708;
	Thu, 03 Sep 2026 06:15:48 +0000
X-Mizu-Trace-ID: c28caae6b09f6708
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 1/2] mm/page-flags: Define HWPoison test-and-change
 helpers unconditionally
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260903053535.17611-2-kaitao.cheng@linux.dev>
Date: Thu, 3 Sep 2026 14:15:27 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Dan Williams <djbw@kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Ira Weiny <iweiny@kernel.org>,
 linux-mm@kvack.org,
 nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <2F4B7639-9C33-4907-BCBE-C6C9DB845D7F@linux.dev>
References: <20260903053535.17611-1-kaitao.cheng@linux.dev>
 <20260903053535.17611-2-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 3, 2026, at 13:35, Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> 
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Page flag helpers for configuration-dependent flags provide false or no-op
> variants so that their users can be independent of the configuration.
> 
> The HWPoison helpers do not fully follow this pattern. When
> CONFIG_MEMORY_FAILURE is enabled, PAGEFLAG() and TESTSCFLAG() provide the
> regular, test-and-set, and test-and-clear operations. When it is disabled,
> only PAGEFLAG_FALSE() is instantiated, leaving TestSetPageHWPoison() and
> TestClearPageHWPoison() undefined.
> 
> Use TESTSCFLAG_FALSE() to provide the missing accessors when memory failure
> handling is disabled. Both accessors return false, which is consistent with
> HWPoison state being unavailable, and makes the accessor interface
> consistent across configurations.
> 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

