Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715911;
	b=zEQeCjCkYC+Kjmoz/nmeabS1yXuC95Oiz7KX4+sCgFU3k1WK3L02H1+MYQ84FugqAh/p
	 qWBdFXGMTixAXhn5UcmQcEXwHm7N46DECvDkwysDwlnZn0AUtjD9GjTAZVzD2u04s132K
	 7a2go5TjVZWKlJ7nSR0lSHmE/RAe0X0wHWz4MRTXTiutFfPwDmV5+1e810stqntkASVuE
	 wpIuqS9tcB9CfhKPpZUFTGB01iGlsiZv6o0w3+Tthhf0DLz/oVGpj1qqInGBx3kTae7lM
	 hxZJu0EI9/72g/6PUXA3sTK7bdKcTazcYTtDEUM7+DPJU28c2dfhNxdbE52WC6IwzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715911;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=HUR3IBGKIjM/ToIUZjQNJibPRqqtTCa5bXRiD9Bnfso=;
	b=GEJ0dDiAL+8Nx9Je2xop0Tgiv1siLfEqp1GHcZHadR7wgVwvIHT07ufZ9P/Qs4gyCtqV
	 sdl8faReo3QSlauCGwlBI2vJmcgVZGfgb7kTyDTu+nmeJLPLQXllHk4MRjDKej1BHUt7p
	 unSWDp76ChMrcQMS0SkXI3iw0cuMYoItLn95BE6Yl+awWRCGHP+0O6d8Thg9aGeScEZ04
	 0BYSBAFIeuGZcQIvWAUkUxgwSq2Qe54IJ3VvdLy0kSi5o+dSG0aEHeG7t6gXzEa8hZmtk
	 Jo3jyOBQyT1wR44NYqbb+M5cxt2+cNvSK6O7Rree8G+FtA1eYK3xJGlLwRijN9/PkHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=3eP0BxCy;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F354606A324;
	Tue,  3 Nov 2026 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F354606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=3eP0BxCy
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 6615C803CA;
	Tue,  3 Nov 2026 14:25:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 41BC42002E;
	Tue,  3 Nov 2026 14:25:00 +0000 (UTC)
Date: Tue, 3 Nov 2026 09:24:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: kmehltretter@gmail.com, peterz@infradead.org, tglx@kernel.org,
 bigeasy@linutronix.de, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/13] Documentation: entry: Describe the
 pre-counted hardirq lifecycle
Message-ID: <20261103092458.2e5f6f6f@gandalf.local.home>
In-Reply-To: <CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
	<20261028033127.82193-13-kmehltretter@gmail.com>
	<CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 771jtokaf5fx8jdcyhc3d4i8xxyoj7kk
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 41BC42002E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19A+BGDZta5HF+2fk/9scuaHMFx0QZ2G5s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=HUR3IBGKIjM/ToIUZjQNJibPRqqtTCa5bXRiD9Bnfso=; b=3eP0BxCyB/7RkbMFOBFzWPKVf8jVYVKHp4iEBKZEXFc17wbmQ3Lr3w7O2C9GzdWTjtV6RJPH/TumThJOGGgfCsBmq+nWmX6FZuOlZkn7qn2/68DsdjP2T7CMOLOuyaXyETKZUHz54mkXK2OFK0HElvJQ9Ursm9c5fARSZqGjfNQ=
X-HE-Tag: 1793715900-741057
X-HE-Meta: U2FsdGVkX1+HPZPXzqj6Uux3lW8e5DE8DS2TFjaIJmS67rFiXZO1/SC8VaeINYrAQ/zkJ9hTKPt2Bll17QmiyPaffMl9kZJ6IPPyYOwNoEEubJehxJ2wsRQ6PzGvbRvKnpwTeV8ZkePXm+AulST43k4taOa1czlBRyVAUauQf8GCS9v994iBBZAIZFnazNqYxqhjugceU6n9hWKtm1wys2je0ICHktjIJ2sUeWG1BbXJCFJ8XMYhOf92Oy1wfjsDiCC0IPMa4LbGDZfEO/Tax0EkD64S63OM0Z15em5qj353kT9gMYVyCBLFVMvWrWjg+FPmt0t/PNM2VQmrSrQawQpK8EMJ69Q4

On Mon, 2 Nov 2026 23:39:28 -0300
Daniel Pereira <danielmaraboo@gmail.com> wrote:

> On Wed, Oct 28, 2026 12:32 AM, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >  
> Hi Karl,
> 
> > Assisted-by: LLM
> > ---  
> 
> Signed-off-by is missing. Is this an oversight? See
> Documentation/process/submitting-patches.rst.
> 
> Also, "Assisted-by: LLM" was removed from the docs by 1e035297ffda.
> Maybe describe the tool use in the changelog instead, see
> Documentation/process/generated-content.rst?

It's not a requirement anymore but there's nothing saying you can't have it.

I personally prefer the tag (even the old one where it said what LLM was used).

-- Steve

