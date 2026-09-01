Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FA46D541
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305136; cv=none; b=To3UlejQCS0o++TBHbVu5dgVXWiiV6/3Z4psjC/jv6y+sZL38btch7Q13F5FHsqf7hOf/eYaHoYIad66kI3fqpQf80egA3e/MNtzwbJm90LpAMgh7YJwz2CVyvsgGyGad3vV68HMiIX6sqL5RIejvitqY18hw4Rtm/AtYZi8cUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305136; c=relaxed/simple;
	bh=HW+F0mfXXAeH2iOJOGbsaH+Hny1/sIpjAptxPIGsTCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrFtYX3u997SIaxYN+kUIXGRf/nVCxGQPmATdol5nEc9jEioeu3qGtfglsbOHmDcjaw8+tLOYh1EuZoF8PkO90+UkfYFLVnzrR6P0i0UJvaoVv8JvszY/ViQ+OYVfCNbkV7CFIGe/YM0MlNMZOBI/2VsVIXtB9IJVx3FbtD6NVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=pMJkI+TP; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="pMJkI+TP"
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 26AD0120550;
	Tue,  1 Sep 2026 23:25:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 0D36035;
	Tue,  1 Sep 2026 23:25:24 +0000 (UTC)
Date: Tue, 1 Sep 2026 19:25:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, David Laight
 <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260901192523.0e989b10@robin>
In-Reply-To: <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0D36035
X-Stat-Signature: yix48m3e38yqmhigfbg1er3e8efurqfe
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18WguzkOLLnf0vusUv0UYts7sXd9cYESHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=CWm+vCTHLyrMrLcgecahYG15tXLP2/TEWHRRkteza+U=; b=pMJkI+TPEJKeUa070u0GLVKXwJYIgPjWa3Ce+YkKSwOu0+LMydOihqtvsF/5fVkVx9B/Du3VqSRg57dAdd9lVXt9Z6s+jmdbr4gNo5f5z9pNob9kycy6AyQ34azytqOimfzAxPZxdSH4HYfX5QyYogc/5lukj9QzVsGPzA8Yt00=
X-HE-Tag: 1788305124-757250
X-HE-Meta: U2FsdGVkX18MsBcJd3j9hBW212q3qhPp3sLyZjmASpUSOga4AJbrIozzluM/UOlo/GD7NCNzl/UfiJRUr0bvwEwBmxMU8SL2l4a9afaEZBhrGfOj8HYiSDyiBoizBERx/8BXmqlugfPRpKf7ixmR6GGXdtAFtu5lTAP5W0CL/i3/zy+cBAHXmiOgfWlZuJ0zlxfwG1zhq7KHxLLXX5XmEYcy+OkaeJy5B6dGa2oTpB5PM+cLtnKKilTtIpnpcLj+tIoAZA7znRjdUxhNRaQ/0AXIlnUcogecQASgy2TBrHrhBbiWdWbr2W96iCtdOnUygCr5D7CH+Bld00SyEEAaCYG1Qb8M0ONog2750uEi+aOtkEslDPT92QGFDt98iqR4

On Tue, 1 Sep 2026 14:56:01 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> In contrast, the existing macro is *not* garbage. It just says "does
> casting -1 end up being larger than casting 1". Admittedly it *should*
> cast 0, but then compilers are unhappy about comparing unsigned values

It originally did but was changed to 1 for exactly that reason [1].

> against zero, so it's not great, but it's *simple*. It still gives
> random results for 'bool', I guess, but is bool signed? I don't know,
> I don't care.

Yeah, it was originally used for the tracing format files so that
tooling can know how to display the raw values it parses. Also it is
used for the filtering logic to know how to compare to the raw values.

I see is_signed_type() has picked up some use cases outside of tracing,
so I'm not sure how much those other areas care about things like
"bool".

-- Steve


[1] d2802d0739dcc ("tracing: Compare to 1 instead of zero for is_signed_type()")
