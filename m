Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB2227EA4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356149; cv=none; b=kG18xm4YgwruxPxpmj3hHZ5yCILc0xAXC2GGlohOsyTn0S9QTG2ujyWypmKjfHWY3y2iMDSYIC2fRCWbEmyJUKkQnKDFfzMhWibX0ltEC/TaRkRV4So5kpqjeBclj2XC8kbuHNyoznLGdGecPWu7iZ/LXEa5sCm0rS4UUDvBXLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356149; c=relaxed/simple;
	bh=pZPjgtlQ8ZmJKkGI5KglpDYvbx1L8lB1xvITR6d8qBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBOTPK6mrZ8Wydjp6zfuJ1Y1upFzhJDzM61yIcaL6k0D1RFNm6jApYSUJyOxcOgbvZgvpJsb1nBg1BKR8TZe41YVdogKV4RMcmZvUdDDSJwq03mTmZLg66Vu+oP8gT184m2N3k5jVdFNfI1snWR6mfEZPCBxZVDIN8dhgTgs7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=io53wwoW; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="io53wwoW"
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 34511A021D;
	Wed,  2 Sep 2026 13:35:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 42BA520012;
	Wed,  2 Sep 2026 13:35:43 +0000 (UTC)
Date: Wed, 2 Sep 2026 09:36:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, linux-kernel@vger.kernel.org, Christoph Hellwig
 <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902093644.5b0e8a64@gandalf.local.home>
In-Reply-To: <20260902092437.00dfaa25@pumpkin>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
	<20260902092437.00dfaa25@pumpkin>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 11p87qwp9jnzxyaeo9jag17xtm3ub9fy
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 42BA520012
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18S+J/RCgt4EPZLeydu/De8OLKg+ihh84E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=7Vq21wJvYnIoUA+8Lhors9WRgJnbi8cSOjhdMjg+5F8=; b=io53wwoWeeAwLWBOzwGqWAit5f7Xdcx9u5ueATvV9rmgO0ozWban8hr4nLJCgHKFUg67MyW87OatjElJ0ik+BGJE8RMG8sIymsr4+IGhoPdf8HZXLQ1jba8SaKHPyNW2aGmJRHnXqSB4cwFkv7OxJg5YLBynVTH6yhpa6BJSl7E=
X-HE-Tag: 1788356143-637352
X-HE-Meta: U2FsdGVkX194J8tBbCklaIFUmc2m9Suq3+loYEJygej8xxBx8xhOvW03T/PuULzzKOeXaqEQhtqfIeqAHeigFV6mynwhhS8UEPh52PsRR9p7KsmZKwe72Rtt9OHkwcPrkTlA745z1tVnY+OZrYwZgTMJKHQjAxICPV/qyKnJQltY6X37VcQjI4ILUmSuVDTlEkRmqlqSRFg8YV9km+LzFx7woBjF+DmOAkM8uWyq8tBNsbuHl3juEuOLGxNqWxxP/tWX5hfTq7vq31BB3C5n+ql9VBTJ4Ebmwssj+pOomC4bHAowJ/ArQPHaTc958Up4K+DrkcIfXTA8bQRKKhXU1ptc0oxJP1vN

On Wed, 2 Sep 2026 09:24:37 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> > Yeah, it was originally used for the tracing format files so that
> > tooling can know how to display the raw values it parses. Also it is
> > used for the filtering logic to know how to compare to the raw values.  
> 
> And, in this case, the value is __bitwise so the 'tooling' doesn't know
> how to display/compare them and you get a compile error.
> Doesn't seem wrong :-)

Where is __bitwise used for a trace event field? Or is this an issue for
one of the other users of is_signed_type()?

-- Steve
