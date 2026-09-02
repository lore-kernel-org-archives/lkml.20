Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1934A8A38
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369813; cv=none; b=mt5xnGWoqRnrICwzjzaD9F/vLlS7gEguIYtlb+cPODpuz9pP0jKQmFWJY+FkWdWBzOeV3xCSxwrccEtkQRfDDG1XmVl9xdUwPFq46aCYndOGUQj7rjMoP1OCXXrPCvwlUqOF7FgaBwNmK3ac0Y2KfCpoDsmU4o46Ws7P6sA4V3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369813; c=relaxed/simple;
	bh=ByteCMSs7J2QOE5s9G8KXv8atwv1vFC3TmmtiyRh5mo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REFag/waG9AqJoY+8K4+dswECnAfB4r+Z22lpAvnRGvxg+5CWaUpFHQtldSiUAA7C4UvNBvT8fNMocx08UDdU50+HxVefelyA9gF9waeMCS70L8+UxsJFeLJUfxS3YrZYjLZWRcwGZOK8ye+wdrJ4jGernywOhE5uUfnIgjL0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=e9lQB000; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="e9lQB000"
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id C36CEC0333;
	Wed,  2 Sep 2026 17:23:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id A219720024;
	Wed,  2 Sep 2026 17:23:25 +0000 (UTC)
Date: Wed, 2 Sep 2026 13:24:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, David Laight
 <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902132426.0f616240@gandalf.local.home>
In-Reply-To: <CAHk-=wjLqvhj6TkjPHq2WFsHa1s9MVjEZyoHiWOwgHY97Ls7kg@mail.gmail.com>
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
	<20260902093644.5b0e8a64@gandalf.local.home>
	<a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
	<20260902123933.5c3c8fa3@gandalf.local.home>
	<e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
	<20260902125408.1e86282a@gandalf.local.home>
	<CAHk-=wjLqvhj6TkjPHq2WFsHa1s9MVjEZyoHiWOwgHY97Ls7kg@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A219720024
X-Stat-Signature: mwm176jbsceixwzpim765rigcycdab3z
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+YwXBips4Y6NQucfY6G4tQIYzNtJZ/4I0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=1Sfgu6vSMnsLpay0UXVSBpbtDE9UPcYEBUUGnZf+zmY=; b=e9lQB000RGbkC6k9luu9jg2IG8WGgK7NizOFp4ovYzOOJg+yM0buMEsH4ClT/5VeRcXWAJwzuNT8ZeK2Wmle6n+gUQCeZoFqEzN3e+Lms+IrAQMIyKN5aF+TdcsTZ9MSSA3ayqVR0xiVUIw9/Lv7RnoEXJ5F0efPp38jvEpXURQ=
X-HE-Tag: 1788369805-459744
X-HE-Meta: U2FsdGVkX1+8Iazzv4DHNq4KGHNlt7xHcM6SvifPlQkgBUiGmgML+wJVuLcQu0JLxUAj7NRTHE31zYzFIMDJyvGKz004qpnVbSJmXiB35bi3jUHEtWhK7q7gHJsZvrdWMSsdpTBz0uxHIqgEYHeo/VcgYabiz8epfsITqGUKSKWldCMhZrkbxE46N/8zh4+mjfkF8HRlLfMcFkIg5/Yz+d/0s/ZzS6IaSWQEFGHzwXn22FUN0FewfGbx6xYv3+3dexenkL3na9yXbYSr32+SDnXCgWM6086SpAB5UwKIhb0w5lWA+Lpa3WuunM8olvNSJdlCrMX2QKfZWmbZNQ14rjQSayKmglnSRCjwc3ACK8BG0IdD7g3jYNMjp4Wvgp0rhENBPE1Q7TuDb1J84LoqVNfKTC6a/xwRZC3Qa8cFcUmigjRAFvAgyx43oVwAJ63o

On Wed, 2 Sep 2026 10:04:48 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 2 Sept 2026 at 09:53, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > If anything, using __bitwise in the field makes things much worse, as you
> > are finding out now.  
> 
> Stop it. __bitwise makes absolutely nothing worse. It's the right
> type. If you are recording a value with any type at all, the type
> should either match the original, or the original type shouldn't
> matter AT ALL.

Relax. I was thinking this was more than for sparse, as I was confused by
David's comment of:

  And, in this case, the value is __bitwise so the 'tooling' doesn't know
  how to display/compare them and you get a compile error. Doesn't seem
  wrong :-)

And was under the impression there was something here that caused a
compiler error. If it's just a sparse bug, then I don't care about it
either.

-- Steve
