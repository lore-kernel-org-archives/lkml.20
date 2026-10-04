Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517B2C3266
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119914; cv=none; b=TEv8EnQPY/uHZs5ANNJKdntwK00l1OugRyHLY7EJnaNIbZD5dnPVOnvwHt4ymJrX1/nOdEiPXfYgVgd6RGjRIKwgzDszSVB1HPWpMu3EzBdd6BAtueYwpd3sP/YEPAb30OwYMFcUYKUxB8tFRrjzemTMKvmyCI6PqskYWvO7/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119914; c=relaxed/simple;
	bh=OarvFHXW3LxtHpA66zfJtTtrILdseB5LAiz/4/UOtCE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=keuwAtYoI8zYQgS+zDoRR3VIPRPTBlTeg+smhsHYVHPYgak3XS02EDAk/QAj6yEyUr3wsUaLi1d1fqpAsPkMeMjwzMq49smre3S9J6etRttssRRGxJKQVLzRIu8H+8HKnILV+Pz3+ds6UZCIEKr99Kccy2aFBimDn0ARIWxW8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sD61jFKk; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VN61VeQo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sD61jFKk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VN61VeQo"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791119907; bh=qDGuSQMsNYK7n1M+tUA8u2s
	9Fry6avBFOYOHet/qV50=; b=sD61jFKky9czn9mDnJgK7MtuPbG0pg15Ji0EQA7cW9yf8PtIki
	LStyFZpVvkKIXn93rbheQhQN1n8kADDqP/4B/QxYRSELo2tbJSFhhkvIcg84K6wn35mJuk3IsrZ
	bx6RExHkl7mH7u19GAaaj9NsCvXq866UM4F67PpYssa4qN9LtC492wEbDLqgRoFBiphJApE0JRI
	cPAlaYIFxDmZmP9UwqsxhUYVGerHb0y/neGI3l2FAHbt8c8aSC5N6EtrESE0UGVa4zIhSKA/eoZ
	cxM1zY4oSGexduco/FkfyTXdctdLyfqZpWjjl4z98xJKCnQoH9FA1irl8Dfjske+W4Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791119907; bh=qDGuSQMsNYK7n1M+tUA8u2s
	9Fry6avBFOYOHet/qV50=; b=VN61VeQoQX9kCPl5BbSw6T7K/LFYp3oZdbOqHhjCWEwYi7PuGp
	UsxziU6+ndKHqXQNxZiqMcbas8XNMwcLywCw==;
Date: Sun, 04 Oct 2026 14:18:26 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Doug Anderson <dianders@chromium.org>
CC: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_watchdog/perf=3A_one_digit?=
 =?US-ASCII?Q?_too_short_in_the_raw_event_config_copy?=
In-Reply-To: <CAD=FV=XbP0HFmKTZEQS4OMDHtTt8WVjoi3xuKrA=VtGOrFMOAw@mail.gmail.com>
References: <20261003110200.3-brads@mainlining.org> <CAD=FV=XbP0HFmKTZEQS4OMDHtTt8WVjoi3xuKrA=VtGOrFMOAw@mail.gmail.com>
Message-ID: <8C084138-218A-4777-B018-27D13727711E@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 October 2026 14:15:39 BST, Doug Anderson <dianders@chromium.org>
wrote:
>Hi,
>
>On Sat, Oct 3, 2026 at 3:40 AM Bradley Morgan <brads@mainlining.org>
>wrote:
>>
>> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>> manual NUL-termination") swapped strscpy(buf, str, sizeof(buf)) plus a
>> manual buf[len] = 0 for strscpy(buf, str, len), and that count is one
>> short. strscpy() keeps the last byte of the destination for the NUL,
>> so the config loses its final digit, nmi_watchdog=r300,panic for
>> example ends up with buf = "30" and arms the raw event with the wrong
>> config.
>>
>> The empty case falls over too, strscpy() with a zero count writes
>> nothing at all, so nmi_watchdog=r,1 leaves buf uninitialized and
>> kstrtoull() reads whatever stack garbage is sitting there.
>>
>> The old code was safe on both by accident, it filled the whole buffer
>> first and buf[len] = 0 then stomped the comma position, so the worst
>> you got was a truncated parse failure.
>>
>> Pass len + 1 so the copy includes the character the NUL replaces, and
>> reject len >= sizeof(buf) like it was before the optimization, which
>> also turns an empty config back into a clean parse failure.
>>
>> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>manual NUL-termination")
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> Changes since v2:
>>
>> - rebased on pristine mainline, v2 was cut on top of v1 so the diff
>>   carried v1's hunks
>> - the intro note moved below the cut, it ended up in the commit
>>   message in v2
>> - dropped the Suggested-by, review feedback doesn't warrant one
>>
>> ---
>>  kernel/watchdog_perf.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
>Other than your changelog being "before the cut" instead of "after the
>cut", this version looks right to me. I assume it's easier for Andrew
>to just delete the changelog when applying than dealing with another
>version of the patch. He'll presumably yell if he wants you to send a
>new version.
>
>Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
>BTW: have you considered using a tool like "b4" or "patman". Those
>should be able to send the email directly for you, resulting in fewer
>goofups...

Hmm, that's not a terrible idea.

At the moment, I use msmtp.

>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
