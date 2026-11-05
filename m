Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917504;
	b=eClWBNMpdGKcoEZ3GCGTthJvgZNjllbOb/TAJ2aGdfRp0fI4GlY4A67uKgWx7rJj3Bzh
	 unhrw1BJP2fdqS9nwVDTy43x0dAGMa5MhPn8ok1KftGuMnNUT6LKTTkUkdImoVdoHnKQ6
	 viCQvsgInDeTHgqGKSkXV8ePAy+9V/Sqeq7lUvieSMfvtB0Fgl9njnqEHgftpsoF7dwR/
	 iT3iUrzvDKndSADsefHfAMsIafageCr9k+JTSV3d2Z+I7kXHscZrbLKAv+OitoW+ynSW5
	 ABJO7fe1YXClGOo2ohcr0MhrEH9RAfZ1YxTW3ncevJ8kErFMx42UypzaN7KATJllSeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917504;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aC+qtiKQ023bm9o1O7eQng0BAlQQoW+kw14Srbp6hgo=;
	b=Ne1KyOY0jJOSFdIqOpUtmlb2GovvfipFhYfLCjVuZ6V7osnMBsSQd7q31oP3mEBzduy6
	 +A1p6VwGka/n/+elBONNh/PXmUl5IipVqAjiKGpqiCXYxGAJxTcdOHp90WV5tZR3AM4wm
	 hzmaJ2U4w707KMteNA2sxPX05MWii94JUhg6oYlTlk0Jr+xorZEPr4YkO7THv2K6C9VHf
	 h6gacJq1QXI7de8bNoAS5Bgvvf58jkWXuIn9dDzHVMHVoFvITcZfl7AFtar+bW6k5hIMJ
	 BxZ3cGIuC03bNVez5quk265tNsIxVlJcUgEqXLUMQbkI1AaBNhA90uTTIxaV0rF8pGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QEmAV63O;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10A0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QEmAV63O
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aC+qtiKQ023bm9o1O7eQng0BAlQQoW+kw14Srbp6hgo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793917500; v=1; x=1794522300;
 b=QEmAV63Owd5BM2w6frMC5QUdHeq45kNM34HaD0v1OQq2PQulxCRLiMPjUAfpCdgJzhX7jxRd
 F7FL8QPwkH+3lzQ9TDFopccc4Jv4RLTuyls6DgNBAaUNgxHGE2ieItx68IDmXzWKsG9zWOdG5gh
 IY5pjkR0O7ME7Ws687zf08x4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 204d4cc12b5d9ed2;
	Thu, 05 Nov 2026 22:25:00 +0000
X-Mizu-Trace-ID: 204d4cc12b5d9ed2
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 22:24:54 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Krystian Kaniewski <krystianmkaniewski@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/filemap: stop fault-around when the walk steps back
Message-ID: <au0CJvc-OwFbL6lm@linux.dev>
References: <20261031-jf-mm-filemap-map-pages-lower-bound-v2-1-21029744e589@linux.dev>
 <20261102092750.e53073b2c7b872f9d70c0711@linux-foundation.org>
 <20261105-jf-filemap-v2-akpm-testedby-reply-r1-36ef39856b46@linux.dev>
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
In-Reply-To: <20261105-jf-filemap-v2-akpm-testedby-reply-r1-36ef39856b46@linux.dev>

On Thu, 5 Nov 2026 22:13:34 +0000, Jose Fernandez wrote:
> I ran it under the stress test from my reply to Pedro in this thread.

I also ran the check_multi_find_4 test that comes with the patch. It
fails without the fix and passes with it. The stress test only ran with
the fix applied.

- Jose
