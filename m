Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445985;
	b=fgHdF6//8B1XAjHm9QwA518eavRLhjzFbg5EIoUQc20QegSvHmiEAB7QiQ1zeqVv3fib
	 u5h1S6nKQwmaDvgBXuKQaRjANRQ8ursC7zYRk1FjEM0+ySkTwmutHdZ5i7g9X3rTuKApF
	 KJpskTzE9wBGmRgKR6mw4I24RL++fm5ADBXiHpkVryP/+TbkZkKYsdKRVY3E62P7XJcNq
	 ikDjoLFoAjtm/c1sUHktmADz+/pQU19LpB3SsOgnRF9bCzWpxRUD7YyGnFXfEKliCrXJf
	 fp+iQ7IxRvBSM2NtwibZ51uduPqAXXzilVs55GIYJM21UPmK4Ke813ECmmtF5p4fl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445985;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Rspamd-Server:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=vnsLhBN164EzqyiuGu2MUPWUtyYxu/RLkDq1eK2AONk=;
	b=Q0qg7iXkt8zIiBS3EX2EpBkqgPZ0W5xd+NeuHy7tL1MHcU5/AMNqr23DAseZSGg0SOa1
	 BSM1J0s1rouDQkRVn2c4giFdNJXhjd0/lE886I8ShiakafgD1wqtS6FRIsVtRXMxPiwrZ
	 Sv9fazCQvEbSlMW6ZmfGgODWz1FMWLPK4r+r5Qj/K5s/j9UAjWfIthRiaN5MyNbCsxYwP
	 JWYMQHOL5CS+Q3thMVr9mZVfAskH4oXbc3tjVziORiTmb7SLyiNW77h2Fr2givvEA3cZw
	 NGXrmhZa3PLh7VieV/udNqXK/cguaWJ9gVUfJq3CI594zZEPoVZwzqUgJsmkrMTUDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23702606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23702606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id C3C41120490;
	Thu, 12 Nov 2026 01:13:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 6A2742001C;
	Thu, 12 Nov 2026 01:13:02 +0000 (UTC)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 17:13:02 -0800
From: Joe Perches <joe@perches.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/18] Squashfs: convert SQUASHFS_FRAGMENT_* to inline
 functions
In-Reply-To: <20261111235940.c9bdd0f2b5faee753f9496ea@squashfs.org.uk>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
 <20261107052843.725239-4-phillip@squashfs.org.uk>
 <32fd1f6ad824796b525ffaa3ebdd8d2610858bf3.camel@perches.com>
 <20261111235940.c9bdd0f2b5faee753f9496ea@squashfs.org.uk>
Message-ID: <657676fd307b604b70f262251718aea9@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6A2742001C
X-Rspamd-Server: rspamout08
X-Stat-Signature: q3nyt9qtwemmkeqcqsq8hf6ahmj6be3u
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+7QTeDzWaSJe9bP9QxSP88adfpH7pI82A=
X-HE-Tag: 1794445982-454551
X-HE-Meta: U2FsdGVkX1+swfVjj81J6jnNXEFxJhHWGxKjBmotMZyC3wUrzZDECEpjufM2H2O8tH6xIB9ehVWBhngJ3NmacJN54jK/Xv74sRGsk+3XLmZuQYi0oRFwbJI8ejuBsG8D9Un9w2qAzUI0Mlg++EJjJzNEhta3WIm4QH9e3yDlICzOOr1kYlZtTnGw7P7w0XLzh2v969q/fUOkPpkuqsQ4JgohlgPjzqWBkn6w1B4niG2oyiOJKdHFzwkzmX4+Y7qhEx/khD2U1t5XnP6Nu/f/vCKpU7XDGY/ABki4/heaKw19Y05iYgpqOOFDOzRQqA7ZVrxgRp0LCPugehJyBqnTrw==

On 2026-11-11 15:59, Phillip Lougher wrote:
> On Sat, 07 Nov 2026 02:05:28 -0800
> Joe Perches <joe@perches.com> wrote:
> 
>> On Sat, 2026-11-07 at 05:28 +0000, Phillip Lougher wrote:
>> > Convert old fashioned #define macros into inline functions.  This has
>> > the following improvements:
>> >
>> > 1. Inline functions are typed, which makes the width and sigedness of
>> >    input and outputs explicit, which reduces errors.
>> []
>> > diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
>> []
>> > @@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
>> >  {
>> >  	return ((s64)start << 16) | offset;
>> >  }
>> > +
>> > +/* fragment and fragment table defines */
>> > +static inline s64 squashfs_fragment_bytes(u32 fragments)
>> > +{
>> > +	return fragments * sizeof(struct squashfs_fragment_entry);
>> 
>> Needs a cast to make the multiply work properly no?
>> 
>> 	return (s64)fragments * sizeof(struct squashfs_fragment_entry);
> 
> That is fixed in patch 7 (in the original patch-set). This is because
> it was reported by an AI and so it is fixed in a separate patch with
> an explanation of exploit and reproducer.

Should be corrected the first time instead.
