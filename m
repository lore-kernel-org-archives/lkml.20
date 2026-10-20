Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524580;
	b=qAwhzLiGpo7Cfj7gL7rEnppG1njogSb5pFK9vSpjz3XhfVgKazg7fhFNAYpP/Rz25GTg
	 rOA2EsbqEKVpRsoGRFOwlL3wUzdUUxiTXiX0Bmdcf4Vaq3ZLRwTV0RPpzK07YLVWg389M
	 Ql4UH2u0tHZ9kodNzIJc220MyhujTD/Fa+BM0zRqkFoqLrRADu5h5YZ5s/MmWNZbdhY7U
	 RShqQ4xELzGleMHMltXbyXIlBUuS1k18f3WLbOQEu4Qhvssw6/TAFhEsdpBg87XFQ6sLC
	 DpxogtJMzJ/iNeF3qeParv0oI6yjLWSlG5X9kDtlpUaXJUBXVyO38IU5etQkBoIhHVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524580;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=I94aAzapOu4bWlCEuyJTyJ5vDMzMhATdT66ow1BtHqQ=;
	b=VSrJW61Nl00HRbp6hlSOmATfkEpw/u55MPPaK4rjNlFyRig3z/ZspQX3h4pc1h9u64zE
	 FslRhX0M42ee2ZRN7PxzYbtdOQM/k1iEqvLy7iWhp8Wexpp/5voeg8MgsOIy1J/GMlKB4
	 XUK5FiSnRHuuVpjA/qHJSoGZnpAfiWP/v+zd3HjMEQZ6/Kim2Ldn21LZfUmV6ByxL7a60
	 zf59i+WEmOjBO9G/798Uo4SA7N1FWSERDVf/OXTVr3bEp+CrUJ34f90jiFh6C97aerOX/
	 cgw3QcmnoKIYELKR/eUcooAbyivXnh5PgkQW6DUnreJyXBHf1Pd0OCZHbDS3eIVQxhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=7gOljyoz;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F6606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=7gOljyoz
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 14C86A7DF4;
	Tue, 20 Oct 2026 19:29:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id F018120027;
	Tue, 20 Oct 2026 19:29:34 +0000 (UTC)
Date: Tue, 20 Oct 2026 15:29:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: John Stultz <jstultz@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>,
 Qais Yousef <qyousef@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>, Wei
 Wang <wvw@google.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261020152933.16989549@gandalf.local.home>
In-Reply-To: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
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
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: F018120027
X-Stat-Signature: 9iftkkgu3bu7sx1bsjw19jg3nbp35hhj
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+L9wtMfYzqlenzd+qbJAmCbRJ4DioSU4Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=I94aAzapOu4bWlCEuyJTyJ5vDMzMhATdT66ow1BtHqQ=; b=7gOljyozvgVhw7Q1nsTJxiCwBvZhzqI7AWqMwCyJ933wDRsrgOpknnibu4fW+BV9do+Ahiy/Ue360peqZK5m95ScYIXiLB/A/GplO/QHi3itGThX8bunlIrOfBlTxrE1bMSAsbu9tpBQsfqC9lfu0k651tFaf08zUN+AywQHMGU=
X-HE-Tag: 1792524574-319727
X-HE-Meta: U2FsdGVkX19kFMhiPk8pcezznPHxXwECNGH7jw5T4H5VOf6mUXxKn8I3T/z41Go8pjBIPf05Np4qRCR51xR07A5k4x8psL+vWsepy27RVaigF/if2KiBsqqbbpK45+xj7vkaJG2NrAaJLpDxY+y0H5IFc5oHFilYr3UdQhiVaLBz3L8PrZwezvCbKJtW+6baEewjv2vlljZiFF+YsO65h01wbh62aXMXmiE1LuneZCKkUXE/HEUvQ9l+hXcDKrfqGw+/l+sub2KzGHXRrGArDqUggnm0L7vgs5e8GbNaeOvgnXvLYm/q3iHtXOS/aEixH9dT9oWvdj8edqutGk53YWAuMmNz/dK+

On Tue, 20 Oct 2026 11:53:47 -0700
John Stultz <jstultz@google.com> wrote:

> Maybe should the jump_label_update() logic be using something like
> stop_machine? Or should there still be a conditional on key->enabled
> in the unlikely case to make the behavior consistent? Or is there just
> something about the uclamp usage that is off?

There's never been any guarantee that all call sites would update
atomically. The first user of jump labels was tracepoints and I really do
not want stop machine involved with them.

Perhaps we could add an api like static_key_enable_atomic() and
static_key_disable_atomic() that would go through a stop_machine() and
update everything that way for those locations that need an atomic view of
the updated jump labels.

-- Steve
