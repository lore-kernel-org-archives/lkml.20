Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE34AA1FA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367993; cv=none; b=Woh6n7rx3cLjCsVyRgRw1pjNN8WW4Qn8sG7cf/PJp8mOUjgl30y7oswALL4U+LNFTkYvzrQJWtDh7BnXSpTyGEY4JVxLb9iFul2hf+tsonWlpOrmtLhym9LVpY5T9cPiD5x4zoYdfxVqcG8ImMY7Lie5tV0tMQ4yBVaqwcEB5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367993; c=relaxed/simple;
	bh=Dta55ycp6/iuaLsenIO115Q4EHNsSYuX4QE9eKtU1MM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvKQ0FDocDHbzsMlVYCrV9EFzV5JDRiP50m1qfyBfMKau6JVW9FNRPwkoSZFrNILMyGP4XzZ1WFilzu9jFmAvl/sfZS3+3sjQcVIKcblPg7Lf2/n26Gfo4YRB/joofCV8+MTVgUqb3nraLeh+HA1AIav+Of5SvsosMRMqdZlxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=xqvfbox/; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="xqvfbox/"
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id A509812014F;
	Wed,  2 Sep 2026 16:53:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id B58FC20025;
	Wed,  2 Sep 2026 16:53:07 +0000 (UTC)
Date: Wed, 2 Sep 2026 12:54:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902125408.1e86282a@gandalf.local.home>
In-Reply-To: <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
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
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B58FC20025
X-Stat-Signature: w9sstciwyeg9k3i9zciydmjjw3na9opa
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+4DphZfmeiOjKeVOVnqG20tvhEOBg0byw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=VsG1uRdkPnRhYBH5YkonWkQOhN7AcJSlfmL/7A3v360=; b=xqvfbox/H+u1ZnHE7AwX8l9VbDosWAS8fcWNm440efUlDy82IopblXBjvpEL/ksbE9bUkPI/SVnIT5mOm07+W4OJkIo33SojkDcxDD5ajW0uVjBweBJP4+cBfSYCMe5sgCFwQTf/aXIzqiB12t13G78RaHT3tXZY5YAPQs2siUs=
X-HE-Tag: 1788367987-104037
X-HE-Meta: U2FsdGVkX19ZuOVIGXD+dV48MmpWkcsB8XQCOl8CHbKSR+nJUb0u/zfpd8p8OoGTfp/bJgr4pR5djR/qxc7Hmj+rw7xAq2U9cpzl/FWwAOpqR/wbSExaHNq8UsCQ5+4EnOVsI82zXr0JPdqbR0mQtZvWsmMxUsN4mlllcyjn1d2gQ32aDQxbEPDdicTxlRi7FkMnyJ3+HqjX9W0g8beUVLJPJDa0CjJ6gDxtka15/X5ctuRVzfKqUm4lPqccBKUME/nr6XzlrrHHyCITksVZKaPgWP8kX0UpfYQZMyFNOJd6vfr7hzktQih6+3BNC3X6/j9SGZqT/YapStcDXhKko2OArqXcaQZ5

On Wed, 2 Sep 2026 09:44:49 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> > Perhaps these should be converted to normal types and assigned with
> > __force. There's no reason to have the value in the ring buffer be of a
> > __bitwise type.  
> 
> Yikes. Typecasts in general and __force casts in particular should be 
> avoided whenever possible, isn't it?

It's recording a value into a ring buffer to be read by user space tooling
that is figuring out how to read it via the format files (the thing that
uses is_signed_type()).

What use does using __bitwise have with that?

If anything, using __bitwise in the field makes things much worse, as you
are finding out now.

-- Steve
