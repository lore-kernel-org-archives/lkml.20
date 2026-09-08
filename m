Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33839D3DA;
	Tue,  8 Sep 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860576; cv=none; b=O/oNO2E8t/bPvvK5fjm8XikUAw22EL+cTvkLjBRoNMciGSvnABKsvSVadCVMeNIe/Xv+hs5oit9JmHGFEHXKZpAkTa1vAxGwLrFpWwOe7x227lvTfh9vbYXUl2fPqyEX2B+PLHRPRcJA1ng8oRBZs73elpq2ZcaG7imgzVssaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860576; c=relaxed/simple;
	bh=klz9nP+VWUrgqqBZIANvYfKFndixR0KSE7PnXduMZIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0AOL2zO9iEAfmiCnGlAoHS92o538lu/ESe2qn3SzbMPhNReNraxshuAIP3eM5EDcpXPT+96oRvCNkWRVahhT+3ziIYZsMxfXw8GPqaLOjGCm715U0GibCQHq4iHgsb/MO9ijhTYsBexdKZCtsyl7rxl0UAqLuq1wjmzspjrtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUdeLsFi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUdeLsFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788860574; x=1820396574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=klz9nP+VWUrgqqBZIANvYfKFndixR0KSE7PnXduMZIA=;
  b=VUdeLsFiuH45LuJVUOeaWXZoE7TP97KZx3BlPbXrHIgpn9NNP7ao/vWy
   qKV/0SfTaSq/tDPCtRpPbiNE0gxb6IyGYchhSUYI9ir3AxD6qdvn0RLt+
   S3SA/WOWzR4QxFlxn8GoG4QIkxg58vwIrhD+cQZJJ5BR9VkdXMHGBdLsO
   g9nOPerg7Avr46MbB8aefxkX60ig7brxOuWhIXqKjJeFvAyEQDE9ElnAx
   fqw5LLWG3ptZFEhKQF3TWynjodPxUlyLBaYBt3F+J8j/BSp9r99DB41/f
   4gJWKzNduZwhRgVkPOa5n9zVOPdidvU8r8xWg2oJBTw7cbboDLbPuhN/d
   Q==;
X-CSE-ConnectionGUID: bovyFO6OTbu3daFmYMV+2g==
X-CSE-MsgGUID: 13CB1G3MRgywcCtgAQXvag==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100613520"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100613520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:42:54 -0700
X-CSE-ConnectionGUID: v6Phgb1/RryHtaJCjd1BgA==
X-CSE-MsgGUID: JoO40FwPSguF0JNxjoq/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295845445"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 02:42:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 52C1A99; Tue, 08 Sep 2026 11:42:51 +0200 (CEST)
Date: Tue, 8 Sep 2026 11:42:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: fix typo "forwared" in comment
Message-ID: <20260908094251.GE106095@black.igk.intel.com>
References: <20260907063021.18945-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907063021.18945-1-hemanth.selam@gmail.com>

Hi,

On Mon, Sep 07, 2026 at 12:00:21PM +0530, Hemanth Selam wrote:
> Correct "forwared" to "forwarded", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied to thunderbolt.git/next, thanks!
