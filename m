Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D244AB81
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186394; cv=none; b=O+MrYZAKj69En3mFcNljIk6EGlwKuw49LDqUwKgGbouNPNADYDHKZbqwVqSw9IPNAKV5xK2DjIhWQjPOlCqduVfKfLgHxNY5QrChXdY8l6rE0H3YbLjVcixre2ODQn7T6CrXbbwjhL5xdjZbqzWDtnBCs4yGoLwsZPCli2Dx2NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186394; c=relaxed/simple;
	bh=Hpb9AsJSUbHVhUxawK+xAxFZ8wkD/lYe5Qr7QRFkK9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHjhXz6E7SkrGH4gUbThrf6mxwNTnl0H6iUitmhB1GwkWau6zaeR64KYE3Xz/P2KbkSufGxHWYzSR/NVGUuVbtEHDs6MZTnK5UNmpSOXYkUTnNZZBq0itolb68HkU7atkr/CrDmPbYrdzvUIuXhPrs1FYMrtmW33iIej7m0dM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=J+xcncOa; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="J+xcncOa"
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 378601C06B6;
	Mon, 31 Aug 2026 14:26:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 23CCC20010;
	Mon, 31 Aug 2026 14:26:28 +0000 (UTC)
Date: Mon, 31 Aug 2026 10:27:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260831102724.1df839e0@gandalf.local.home>
In-Reply-To: <ce48c6ba-bdc6-4adf-8f38-faa6fe9e6707@acm.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<ce48c6ba-bdc6-4adf-8f38-faa6fe9e6707@acm.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: fd43gd33y9r6zrs1sbn6f8r37zcoefch
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 23CCC20010
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ftBXxj1lmA/uTb101yPuO5LQaPuaaypo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Hpb9AsJSUbHVhUxawK+xAxFZ8wkD/lYe5Qr7QRFkK9U=; b=J+xcncOaLHLfw0cJvRRKaZjlC+OI7Jpu+teimR2M+i5j+F6lJHrJJcjpYywf64o6/a2m3EHbAwp56PWl/6yDfbpyz3tKLuij0JX8RCRH9S90vx1KGMA3uxBhUUOgUFf0azs7e1M9GG4P9tJ2Rk+2zHZp7hQ1ijVK2rLZPEnGLN4=
X-HE-Tag: 1788186388-892540
X-HE-Meta: U2FsdGVkX19LGdl6OzsYT/6taP/9pkzHdSZ0z59JVxwGBxQA3D/lFGRnoNPgD563l/2iyV3+w6oh267wLPA0/72/1h9izzbZ9vYWYIIPpvwdNNhczJjeifjtIWY/ALSTP+buhqxvZhd4eF8aFfZXYWhS1uoUDwQuB18s6oVHYrftCcsJXATBieulDtfd3gToV53/lJMT86lCvAiTPURoH4T/fD/3MEWNMFtyOHIHmTgGxgYZ9ItNExdnr1eqpK7nHPSRus9uODunWJmGRMBXkRsOASIJljpD+fFxuVqjHyQCwJmsVRgAhtYv/9QpC6BMlbOKboSogEGViISAtF9MwFDmrv+E+/26jr3nt88u6HtelDO6Un7FqQ==

On Sun, 30 Aug 2026 17:20:37 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> This patch still applies on Linux kernel v7.3-r1c. Do you agree that
> this patch is ready to be queued for the next merge window?

Could you please Cc: linux-trace-kernel@vger.kernel.org

If it's not in patchwork, I don't see it ;-)

-- Steve
