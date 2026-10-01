Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4745629D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838668; cv=none; b=UibXIzDSacQIbdvcQpZxgxRZSxno6NqDy++0hU83Eqv2d9m6h6n+LxZxbCoBL3Fm38YLMp/APO1HZx5Kxy3fFW0KKNDVpHecilDdFQXCRdHCzG7JRwsC/hozxz/8QMo0fiy3V1kgwu2qreQkZe9HJLXnl1w5NRtUaU+G5sIgsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838668; c=relaxed/simple;
	bh=abZZU1jKLaisQM4jjyNXA2PQ0eo+xVzoWsZTJDHwifo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cer05cDAzRR5IbS6XISjdzqAdVndUtbWdu/IoCFqOr7WfAaS2aM9Mje3HrGWO0fqWmhNBm+ujsmwrRbio40//lxRY8/NkawbrEOO6R7BQQVzLE5Z1OBoMz3MTFhSawa3yqSYAOYYX+FDe/i6QvnfYmiwigackIqlNudjTxBdPIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fp1uUVnz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fp1uUVnz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=abZZU1jKLaisQM4jjyNXA2PQ0eo+xVzoWsZTJDHwifo=; b=Fp1uUVnzMVa4VgHRzlbLdsdP+P
	4sBUBvPUaMc1wDkof1kUiXWwBeTsQr2NhtlAFgSskelC3BTS0glS28gaIbxUKJpUoB2iWoXJSb3cl
	jeseQQwEkLgctlzKYOmaNZN/VAQF4oKe3tqG66AX2L+5w3Leyb24nJPqfk1o8QplkqQy6uvOKeHvQ
	ytQcwixj+fX4yYsTXK3fLZxxF5o75Dq8EDERmpVKVxxiaRGyb3N/kgjXp5AzjCzil0UUEthJTwFma
	IT5tHjJxYGCt5c08bnGq1D9bLeXTbrbmPLH8BqrxOGTXX+H4lMkc+8DY+13OW2KS+UjCphujtDQnf
	5j9l3ZWg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwW-00000005v46-0dGK;
	Thu, 01 Oct 2026 07:11:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9F1AB300390; Thu, 01 Oct 2026 09:10:59 +0200 (CEST)
Date: Thu, 1 Oct 2026 09:10:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <mason@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, tglx@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] futex: sample poll cookie after publishing new hash
Message-ID: <20261001071059.GR88198@noisy.programming.kicks-ass.net>
References: <20260818011036.1138213-1-mason@kernel.org>
 <20260818011036.1138213-2-mason@kernel.org>
 <20260820104015.GE687043@noisy.programming.kicks-ass.net>
 <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>
 <5b6fab2a-90e9-42c2-8142-0b0f094559f4@paulmck-laptop>
 <20260930112156.GL88198@noisy.programming.kicks-ass.net>
 <d6e1b8cf-ee16-4a8f-b2e5-abc52908e6e3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e1b8cf-ee16-4a8f-b2e5-abc52908e6e3@app.fastmail.com>

On Wed, Sep 30, 2026 at 09:23:52AM -0400, Chris Mason wrote:

> Ok, I'll resend against recent git with a better commit message,
> unless you've already queued up something better suited?

If you would, that'd be great!
