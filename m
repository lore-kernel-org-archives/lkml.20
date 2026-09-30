Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248E3CAA31
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806807; cv=none; b=QUYObhP9JtFwR2UKPjGrlX6IPHlHUJIVcF9bbhIn9WooIdShVxfJrA4N/wvkAxUVW0+nDE3vqcrHb7NG2ZwI6TROe1XPo05rHg7F2RNoTXVgb+HTVYhPiTdfZsA8oJknGylhL9Bf8J8th/6CAsIYKFOPQnFgNV98FSyi46RAjkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806807; c=relaxed/simple;
	bh=AzvdamAAAP67Ngv/cC3rDr0igLnhP+46kJihh3Uo38E=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GidfyYay4MW5+AS+1EXRhf3GBO3amZq8BRSwZsCXZQzSZzuXvi6xlOuxH2c1cMk2cCX44HrO/bZ6/6tofEsz06frWiu+E9Fwi6XKH670rsCpblaedEVkz3aJsxBnWGL2WPQWO00t1VODvLhhyH0/yqNqKwZG7nTBF1KPV1of/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czfhonQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czfhonQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A871F0089B;
	Wed, 30 Sep 2026 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790806805;
	bh=x1H1uNrT0p5tMQdqbU5rvowRHlLchaiYrP61GQlAx2o=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=czfhonQg75S1APRy1Hnq6uVH8if1iDIRiUAt2qWdBXGBZX/od1/8vfqP/tvtF0DIe
	 XoSSY2FQTSBJGyb7VUORi3flIWQVUHCjmEp/ymZOwGwYC1u9ER6ZrcemsleOGQk/Re
	 gKBqafWLKwPcHwSUdTvvRBp+8tRycVSDCGs0621+cDErvTx/6B4bbwjvFCzxcmo6HH
	 xkJUKzMZT4KHlMptGicWYwzEoaSwrcjPZrg6S6XobNlf/1DK740nBTwYsNhc00nsGT
	 zBkBH6L9uz+CvyT5FIfwCdSZ8+C3fvfk5ISjuk3EPZ1NluEKektGa3NLwBUB66AOmc
	 9UPF8vfMR6Pmg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Ingo
 Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
In-Reply-To: <a498213c-f034-48a4-af88-3e2a073dcca9@auroraos.dev>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <87ecebj080.ffs@fw13> <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
 <a498213c-f034-48a4-af88-3e2a073dcca9@auroraos.dev>
Date: Thu, 01 Oct 2026 00:20:01 +0200
Message-ID: <87ik3mgz5a.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 30 2026 at 23:04, Sergey Shtylyov wrote:
> On 9/30/26 10:01 PM, Sergey Shtylyov wrote:
>>    Thanks for your comment!
>>    OK, I'll do that (and add the Suggested-by: tag, of/c)...
>
>    One thing I did forget to ask: we still don't need the Fixes tag here?

I have no strong opinion about it, but it's not really fixing a real
world problem aside of preventing a sysadmin to shoot himself itno the
foot. :)
