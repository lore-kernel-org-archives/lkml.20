Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48537C0E2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789191451; cv=none; b=uTYkXKraSWFbXJfR/h6H99R2WMtLNJjQrS/B5EA7cukmAOYCwMf7F5AwuJosvvEHYpkwtCpjL2TRG20YmA9xfgnpfeQasndpByb8kxiZjspSmNlhM/5vtuLNVjSzACdotuZM54AngbRFOOayCXxyRg4lULNhcfo6dRYIdGcyeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789191451; c=relaxed/simple;
	bh=yL4cxdkuQoqTpuMrLrQo9i1YzBHm8op4PyrEfawSr1o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mkooF/7TOc9Rlh2OSf39tzJ2wOcVVV/fLu92X1U8DqHmYCbpgHr0wnoh/U8VpdLuclbGdtmDtal9+tFVytxpIR9lK5lrDM6/dhqjweTolfJ7mDKGAw6RaIZAQMwYbjVbOkZckVzOY7If3GL4D1X4Wclyy5ttPRrR6mTQ7HW/RfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aSyXENQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aSyXENQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC181F000FF;
	Sat, 12 Sep 2026 05:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789191449;
	bh=HYDZtPr4JDx9mQ8QLJdsvTD6GhwNFa+yZjnF1lnjOBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aSyXENQuJfnTxDjXr1pmvzNwf4pXpivIM0rTS/Pt/0wvNDJRv8dfY29qiUN0kAJll
	 Nb0CVTedvjqG/VqpsXtDq65PM2Tn3FH7Z0Xgk0su1SLcH45twx6K3t/oC1eGmkMryj
	 mwHV4vnRZWAuLT9Y/ljCVihqO3s5Jzk1VBL66A8A=
Date: Fri, 11 Sep 2026 22:37:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Rientjes <rientjes@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [patch v3] mm: test_vmstat: add synthetic benchmark for vm
 stats
Message-Id: <20260911223728.dfceedb4135e0b758df0ddd6@linux-foundation.org>
In-Reply-To: <014ef68b-6312-bcdc-f432-34c31476fe77@google.com>
References: <014ef68b-6312-bcdc-f432-34c31476fe77@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 18:08:14 -0700 (PDT) David Rientjes <rientjes@google.com> wrote:

> Add a synthetic benchmark that can be used to measure performance of VM
> statistics.  This is used to analyze any improvements or regressions in
> functions that are frequently used in hot code paths.
> 
> The test is run by KUnit or doing modprobe vmstat_kunit directly.

Can you please quote some typical kernel output in the changelog?  That
will help others to review the proposed change.

Sashiko made what appear to be some good points:
	https://sashiko.dev/#/patchset/014ef68b-6312-bcdc-f432-34c31476fe77@google.com
