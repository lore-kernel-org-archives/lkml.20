Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044446;
	b=RwYxJqA84Pu+OtLhraMsJAZnwKKYV1/30cwZ+Lq5fL5GANTWrC+RwJCffKm7p5MevHSq
	 ouotfUzxH+I2KuvUH7MqVuxEdFGeB2s5Yh+X2zC97ly7MX8rV79mv7eWGxsrhMuML+2YX
	 bpYzueAqNB22yY5uevRo3kj+MqV0WmBNa3zd/rP42C8IJ27viGjKD79+MNo3wyJwdpn13
	 HZw5KEGUQK/EIcb7r/BQBXVgI7PI/AC1yyFcR8LypH/n5TLeFJVAJc8v15VBToqFYsxAa
	 Tb5vxtNQQ0LxQNQLyFZMQmw4uhCbM/O20uY/EwTyhPe0yM1jjbIugkImlg/pB33TVpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044446;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=t2WP/1MRq2fCK/I0ZlIcVsv6v5NGgJ3Jv9z6l/Veweg=;
	b=dDWGHP3eVZHgrLiuIM39YJACWt33yfK6iwkW01ODGsd89hbdb5W/BFMsnOwTYMW3v2fU
	 U3e9dYExpE9qArkmotT46w6YpEkg5qbsDU6F5oYIyAVrxunRF8vDnkoiiDsWTdm/17zNx
	 sx23zG9Y4oKYRAtcZ1I77eKH82SrlRIZKRasdMIfg9hqSI2wXzm8B5fD/dYeOfBPSCWpq
	 yu8JJv15WT3Ts6EtRWQIYp6Re16vAlBQdt4tf9M8bznCHm4NZauRRgLTv0mZG3WoKp3/4
	 ohF2HwVE7TAwpdXKlCoAyp4p3IIwhH/ZSKKnC3Od0lxQSCZNJb/+IyILNxloHETQ5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=a8hPXE+G;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=a8hPXE+G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1793044439;
 bh=t2WP/1MRq2fCK/I0ZlIcVsv6v5NGgJ3Jv9z6l/Veweg=;
 b=a8hPXE+G7/e1JT8Ycfcnev6V7KCkTEi5sQZ2AdMNstNaRkfEKGcg3tGoeiZplAVKE9nI/wLCs
 5TZVqkhjWR9Iaeul5Xr7FDHLJ9iQJxElhLQRVQkNcvoKwjHKObmZo4Ym8aFyfShlLlGay3vNm6L
 KNjPb6axtTgKE6/Z2J2fBBCc4bL6Z1zhsQfoX4/eKgX5LjAxhp1gNdJaJvz9eRXZK6Cre+NytJN
 OMLfeSxsiXL1+K1va9CZsNI7DTGpPBgLUWFHn4h8hm8EG7pWkPaFfehJhaaYn9XOnVN1BnqxKF5
 RzxhQWFSLzqULxXlcHg6SGkHxIEhfdNnFJXW4LatdUSw==
X-Forward-Email-ID: 6adfafcfd8313e3592e45e13
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.18.11
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 26 Oct 2026 15:53:48 -0400
Message-Id: <DMF17B2ZLUVC.3FQPOG5TPIX@ubuntu.com>
Cc: "Troy Benjegerdes" <hozer@hozed.org>, "Theodore Tso" <tytso@mit.edu>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
 <federico.vaga@vaga.pv.it>, <apw@canonical.com>, <joe@perches.com>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Justin Stitt" <justinstitt@google.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Jori Koolstra" <jkoolstra@xs4all.nl>, "Brian Foster" <bfoster@redhat.com>,
 "Christoph Hellwig" <hch@infradead.org>, "David Disseldorp"
 <ddiss@suse.de>, "Mark Brown" <broonie@kernel.org>, "Jani Nikula"
 <jani.nikula@intel.com>, "Jens Axboe" <axboe@kernel.dk>, "David Hildenbrand
 (Arm)" <david@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, <lyude@redhat.com>
X-Mailer: aerc 0.21.0
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false>
 <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
 <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>

On Mon Oct 26, 2026 at 3:39 PM EDT, Linus Torvalds wrote:
> On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
>>
>> On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
>> >
>> > It *is* possible to make a deterministic LLM, and this is why I think
>> > it
>> > is critical to my personal future to have an LLM that can actually be
>> > understood by a human instead of a random number generator casino
>> > that
>> > sometimes puts "4" in your private key.
>>
>> I hate to break it to you but that is literally not how large language
>> models work.
>
> More importantly than that - the whole "deterministic" part is a total
> red herring.
>
> We shouldn't even reply to that idiotic argument.
>
It's not idiotic. Would it be considered non-deterministic for a human
to intentionally add a line of code causing a kernel panic for no
reason at all? Or an LLM telling me to jump off a bridge?

When it comes to human development, people *know* what they are putting
in. An LLM does not think about the words it is spitting out.
> Why? Nobody is arguing that we should stop take human patches because
> "they aren't deterministic".
>

Except humans want to actually contribute to the kernel, not make their
slavemaster happy.

> So anybody who thinks we shouldn't use LLM as tools because of that
> reason is just being dishonest. It's just a disguise for "I don't like
> AI". It's not an argument, it's a complete strawman.
>
> We have had non-deterministic tools in the past. One trivial example
> of that is just different compiler versions that have slightly
> different instruction weights or just different rules. Even when they
> are individually deterministic the end result is effectively that
> different people will get different results.
>
> And not all tools have even been individually deterministic - actual
> real non-deterministic behavior exists in non-LLM tools either becasue
> they have timing issues or are explicitly using random numbers as a
> way to get their results: Monte Carlo simulations is a very real
> thing.
>
> And yes, non-determinism adds a wrinkle to things and it's something
> that needs to be taken into account (and people often add things like
> explicit seeds to avoid it when they need explicit determinism from
> otherwise non-deterministic algorithms). So non-determinism is
> something that should be weighed as a factor against what else the
> tools brings you.
>
> But it's not actually an argument against LLM's.
>
>               Linus

Well said. But also, we won't be able to "submit bug reports to LLMs"
like for years people have submitted bug reports to compilers.

-Josh
