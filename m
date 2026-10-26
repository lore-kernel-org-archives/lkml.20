Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032548;
	b=NPuOijxCUry0uqyH8xTCm/1SA4uWwxXHC/dZJHUH0GqmPPMIsf8u+BTkjTjqwqlR4IHH
	 oInTsWJ9eQ0qd66eA2b2S36+O5sCIsGT/lONzcWVwJULLDTA2fcJiIQp6qeu/T0Akq2Rt
	 xRDBlO1GPVGM6941kETxXem9juynOUFJDC7awj5J5qY6FfrVjwFCFIqyneWWWEHnbj2ql
	 z6fy6X4VF40fxHw0dVaEIRn9/mRbDDWuhBTOCKX+ECwsUOxGQe20qNI3rVauhP21Chirt
	 IAPjX88RKILTRrFLI0sEKok7o1XZaLJiHfSzU2r86zLtkJa7mlSOFh4YnNBNhLsQ1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032548;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2U3T8mW+AOl2TwA07So811srPLvBEWEzpUG5e/0ICzc=;
	b=BoCIVOjr2DTQWmRm/i7JUIZxy0eeR6V1KAFlkUN7ZbNdma6egEa0jcbc+2MPFh7W9PP3
	 m6mNLw2uKa1qvrlaRRHQFIyAbV06VDXydpptYPqyghABhryssTn3NxX/kRNH3vp8QTxNc
	 Cz6jQCfsAJ6hN/NR2g6UgrLGmVL9Cnk/thggwWE6hy4w9QH9Ol53fBsPHlxTeMADz3ur0
	 vad5JYZK1jdeB6pGSE5BZyhYF2KkRbWYc2nKjeEtOxdWUfi4Tnx+Ol4Sl9Rq1vF5yQzTw
	 MRcb8ypk24/yCrYYfiYTWdqZ7fG8AVTTHZdu1+zTC7z6Az7E6As5BEeczSXGz73CptA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XFH6xxYC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7Di932lD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA14606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA14606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XFH6xxYC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7Di932lD
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793032545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3T8mW+AOl2TwA07So811srPLvBEWEzpUG5e/0ICzc=;
	b=XFH6xxYCtHDl9Jj6YlBJoJAFee2rekSXMDuFNP+7S1E3iGosYk9FPN1pasxOf0w+M4ZzAU
	a99IyayYa0iSqSwfwGvAk2Cjaw1bbDx32k5UV1Br2MMGrkKAOaV8TpHKtG3y6Xzg95yPTj
	A/xiDpARYVgPqdw9vZF6Du+1eV2ZObzi1MUacqveaezyL/Gh6hBNFPWWQ1YdaiNy37tugu
	96eGQ8Kp8QL1g8ul3UyZIutbskNJNg8KKTRx81D7WAMFe0cA8ojheaanQ3Q7PqgWH2ekdv
	UqxwWBKVTfGp8GDs59aNaPjqrldPNFTdeVmOVUuQsk0ny4aRORYc1DbE3MQYsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793032545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U3T8mW+AOl2TwA07So811srPLvBEWEzpUG5e/0ICzc=;
	b=7Di932lDnOT1wNXgYSjLajQhsF0eNpCgRFpR0fxWLmXEiihqnGsaMxvs9SOPGzzVBj6rCt
	ZcqASTVUE69zQfBw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Chris Down <chris@chrisdown.name>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK,
 PRINTK INDEXING, and VSPRINTF
In-Reply-To: <20261026160128.12581-1-pmladek@suse.com>
References: <20261026160128.12581-1-pmladek@suse.com>
Date: Mon, 26 Oct 2026 17:41:45 +0106
Message-ID: <87wlr4ifmm.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-26, Petr Mladek <pmladek@suse.com> wrote:
> Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
> PRINTK INDEXING, and VSPRINTF subsystems.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Excellent!

Reviewed-by: John Ogness <john.ogness@linutronix.de>
