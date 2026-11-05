Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893678;
	b=jlKPe2UTRlIDkDhuAPpYJfyfJWcPqRYOEUvXyRngra9sg1L6nMxNLSvJxnM/NCSEjoeL
	 CX//TnF4pNs4osV2xiIKGM9unQCr6SuM1d3KpPDUUfvtTBq3vHi9/Pv3RINRyAghfFa0+
	 EP3kIUbzDjI3R71m/9b/lOJ8/CAWxDF1tGYvusRTCualsn2LZBfY/C1z9WIP0+tLGmHQA
	 RhzTnDWfTSCryjDFKtKPiqmwH7EEm2ixrdTQ47a5kt2PplhRTnS8c5cKSUz/yhGqVbtrW
	 ZurJ4qqfBgTwrDJDYwW53EL+LRSgaj1kTXgNAn9nS7um3nZjJawcxyyKA+6quypcXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MgucIMubAa3OOhOFGJs2HRU0sWXyhUV0AUF1J4UpA1M=;
	b=bgVfFmUL62Nc2szf3oz8AsXZh02qnKZjdQG6mc+G/yGj2R3/7qAj+IRBzhjxnFOX8aOA
	 tHwxlqdKAAEZRGai1kIMVK4KteyUzXgSUdZStd1dW4bFHfaQ5sG11XRQOTZtzycpAn9u2
	 kYNkFsWWvSt1kGOKGbmlS6GGWdZHRUIaMr1GVKAWsv7CyNFJHOCfvZlcZUdo8QpLVRun+
	 FBFP64kVCQg2SQatRnhr7Fsbx3UjRO5s+V9rq80SwjufB9ghJWFwOE/8OvqKvFDxJQqgi
	 9kGLzeyxmw48jcWWjB9vFz4DzpzEd4+D6FufJfZIKVu+jrU70YR4hN8px0JGgbVa+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=CvU5zGHS;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41670606EE91
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41670606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=CvU5zGHS
Received: from macsyma.thunk.org (pool-173-48-116-148.bstnma.fios.verizon.net [173.48.116.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6A5Fkrka017482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Nov 2026 10:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1793893617; bh=MgucIMubAa3OOhOFGJs2HRU0sWXyhUV0AUF1J4UpA1M=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=CvU5zGHS6S5Lc+ofPAyXOc4k+J4Dx0x1uD+uvEgYwG+9Lw8tA8cDQT4HfcbtJFGfS
	 jVPYiTWyUVw7lQeS8Z4gmSSqEE6MvHJSM1PbjJNYo73rB2VmzL+M/kpLHkXrGhC9N0
	 u9oWdFHzYV2BpGIFv8wMxyTcZlupVsDHKHYx9Msmirs1Bwb54JL5bezFpO76OoCCVM
	 rIHRpoFsnatyHm7NzhaeZQPYbQNjlgqjUiXXMyytkA+hsGQTIqurV17ItPy392ghBr
	 l4JzyBsIEyaEj0fJ3cAyGGmwkx2UyddMiF5eK/TTCCmdJl2BATaD6McdAU8wAXR+E8
	 pkc+STZoKfjhA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 2E885259019B; Thu,  5 Nov 2026 10:46:53 -0500 (EST)
Date: Thu, 5 Nov 2026 10:46:53 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>
Cc: joreag@ulshe.ai, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [SECURITY / STATIC AUDIT] 44 CRITICAL/HIGH Open Manifold(s) in
 `Documentation/.renames.txt` (linux-master 7.4rc)
Message-ID: <auykRKL8SMW-bL60@mit.edu>
References: <autfQA_BKenrDFQY@casper.infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <autfQA_BKenrDFQY@casper.infradead.org>

On Wed, Nov 04, 2026 at 04:37:20PM -0500, Matthew Wilcox wrote:
> On Wed, Nov 04, 2026 at 04:25:09PM +0000, joreag@ulshe.ai wrote:
> > Hello Maintainer(s) of `Documentation/.renames.txt`:
> > 
> > During an automated topological boundary audit of `linux-master (2)` using
> > Logic Archaeologist Pro (v8.5),
> > we identified 44 CRITICAL/HIGH Open Topological Manifold(s) in
> > `Documentation/.renames.txt` that may warrant review.
> 
> If this is a joke, it's not very funny.
> 
> If it's not a joke, you're an idiot.

My guess is option 2.   It looks like this is an AI Slop startup:

    https://ulshe.ai/products_archaeologist.html

... and this AI Slop tool doesn't realize that .renames.txt is a file
which is generated locally, and it is not part of the git repository.
If that is a "security vulnerability" or a "Topological Manifold
Closure" (whatever the hell that is) then any generated shell script
or compiled binary would be a "Manifold vulnerability" (again,
whatever the hell that is).

						- Ted
