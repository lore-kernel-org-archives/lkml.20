Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B83D8107
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695855; cv=none; b=kTTsBVzXGeXjPY+US8uNgu1ghONlDQ3L9etjk8TPDrMNIbxYgSNzrAWDSRPhxMH7+4KrudOx0WhnscMaRLv3RnDViexe7rx96BZFkYY9pEAznnj8YKQjpByn2zAq3ANhNFlJouAI2HnmBjaTirWOszcAQrA2eShEpRvz7OlgiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695855; c=relaxed/simple;
	bh=0mslHSemvRj3XrLE3SnzvW0AJ+N6xhcTISY2/3q4VyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N/m5Chs7OfWGQBo+nK62pYVFNd36LGNTikKna225ravPZX/IZjPhNKl3wKGjq/dAsYfKtIDy/gx8n01ILVFOyBrvwNJIJNzT09u8yZ8jmq1VR+RlFjiB77O0WX2R1DPWlFuwlkUG0CUN/cv0UPB0mWkuPk7t8w24W9gyMFm98Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4h3XZfA9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=16eaL/r8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4h3XZfA9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="16eaL/r8"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790695852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0mslHSemvRj3XrLE3SnzvW0AJ+N6xhcTISY2/3q4VyQ=;
	b=4h3XZfA9IxYhxdrbOHaKBphRjKbZFaxpoXebPWkIBFyov3zoD9lBQERnqMsl0MI5J8c9Ha
	L9jl0rd7nOOIceEKFxRLX0fZwbyP6qkeesReNbnbQ+tPhrgvIlfHA2qJ9tDPLeU2mv4v+0
	ZPdKX0UaeKG0qwTPubqy8sq7fq9o5bymUoe+MYFY3zqxJG1tG07rz9gYqCbWCbsc2kUiyV
	PXgm1lQzFP8Tp4N7l97H77s09vczLcNF+y6CAbur/roAGZcCQ1uUWoSGdvfn9wnTNRAoCj
	P9DQ8vt8a/Z2MbcisO0M1L39luZOsBCyPr5ta2P/ZuRXkVu0VX52UEkRwsmCVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790695852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0mslHSemvRj3XrLE3SnzvW0AJ+N6xhcTISY2/3q4VyQ=;
	b=16eaL/r8/vpVgrOpqJEHeBmdsMosfmxaLU+jMwn4wEntXiqgh/92sRirc1usWCSx7svUD7
	prtRdGa3hmYRBrBQ==
To: David Engraf <david.engraf@sysgo.com>, tony.lindgren@linux.intel.com,
 pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org
Cc: linux-kernel@vger.kernel.org, David Engraf <david.engraf@sysgo.com>
Subject: Re: [PATCH v3] printk: Remove console options before decoding the name
In-Reply-To: <20260924070153.250783-2-david.engraf@sysgo.com>
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
 <20260924070153.250783-2-david.engraf@sysgo.com>
Date: Tue, 29 Sep 2026 17:36:51 +0206
Message-ID: <87wls4vzv8.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-24, David Engraf <david.engraf@sysgo.com> wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.
>
> Fix by handling the options first which will add a NULL terminator to the
> string and refactor idx handling to clean up the code (thanks to Petr
> Mladek).
>
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
