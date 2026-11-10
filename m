Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305709;
	b=0XAr5e4uZ0ywvZv2Q9qZ3PgDLqJD5vVyMty8uOmEkTdZmcgxNM6QGDgUvxYy3wHdHjDE
	 9OeXEPfRHITm739BJYW0x4c06FBYVcja37aHoUwo1AwE1i2mpBhYszGck+qyTGYkdSYd/
	 x9Ggvr4CZNKK5ZcmE6nTsOUKd2KFptgH/skT6LQsG1LEPFAP5xaxLtzTTwynpmPs6kr3E
	 vfFQdA+rJAf5SWgt7o9TfsH4eIWKEqTgqzD4cuWd+/2eisruAdEUhfaiid4fNlI20uubo
	 KgzeYKSriKq2xcM4dg1HP0nLk+wvB06b6ucgfe680FCOSGXPwz94U/yEnfFcuTrwEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305709;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=AZjTHPzFrx1imtDVWlCHLsplaoTB2DlJ7depLryWujo=;
	b=BiwSPW55xxXcCIJlPhPP8BiOavVegqiljFwTEkR1KPrQCuwiImAroLpHAi4TfIMbKTA+
	 pk3kVq1KUrxsugdf2hXW23mwDWQtP97l+OrNdCzoy4d9s+aaXec7oV+G8r+MqyNIWnamV
	 ZSdDEngQAtKMUo/BWixs/w/x7dbNut2WND/X8MYBQhJ6E0PIsKZK36CqBMuQyEGUpbvqX
	 d8Rv8AyJk/vWFOSRixyh9agOULCPxrtEzhH5ReG5mUKQryucoOdmsGEbEONonKChe5kyp
	 DgiM9MwTpa72gVJD0bMie1W61HKWO0+SYEHae21ZREfFGmuQ6enWicG+w637yEW3J3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=rDp0++Jc;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899C606AA51
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D899C606AA51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=rDp0++Jc
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 44656404CF;
	Tue, 10 Nov 2026 10:15:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 582C81A;
	Tue, 10 Nov 2026 10:14:59 +0000 (UTC)
Date: Tue, 10 Nov 2026 05:14:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, linux-kernel@vger.kernel.org, Marco Elver
 <elver@google.com>, "Paul E . McKenney" <paulmck@kernel.org>, Christoph
 Hellwig <hch@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 03/14] tracing: Disable branch profiling for
 COMPILE_TEST builds
Message-ID: <20261110051452.49eabaf9@fedora>
In-Reply-To: <30ea46a36f2985e32389067317977371e6776e27.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
	<30ea46a36f2985e32389067317977371e6776e27.1794250850.git.bvanassche@acm.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 582C81A
X-Stat-Signature: 74cr8q7sykmmhbaqg69kxff6km5uk44s
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19eNIUSaaXkWq5R1w3u1Z8R6ts9N16JT7I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=AZjTHPzFrx1imtDVWlCHLsplaoTB2DlJ7depLryWujo=; b=rDp0++JcVOXc1tsFG4q1Gf9v5U6xOf9z54HUjfniyloP0J+MjbtjDpPziCt5XUu5KyIAyIXT00v0W5SfeJPJ5SPaOCdXryM8J4/QQgokgJoyfdYMZLxuES18WRxLtkqms+8Siz4MNfV7+p2Wv2WtG7Rf9vgrZSJH5PHJKp99Acw=
X-HE-Tag: 1794305699-878203
X-HE-Meta: U2FsdGVkX1/lmKBV947R/34Om7hVNgcFm6D3EgJUzsUTwEfK4EQmNN+uJ9XLvh+2m9Lb/8qunPtSwIbEDpDInUKLCD/Njj5FLQcY0jE2LYI5qPeMc+efpaMF4W0k4vaX4uN0JvCKvDTgfi2azXmVuxGR/cMehpVTbXpcTlMEyeGOhRHrnST+i3RRVgrxmmzePErvkrNvfTyF6d4n6iQW9XxX1RmbsszW/dCYTWWMU505JBOYcjng3NRBLz9Hz4gU1SmhVdrk6YstLnaQH0QPbap983T/wQ8Gnvm6HWrS6CysED/i1Zgug9VrZTpBKZvhLqOkRY+Yku4zlFbW+DjsSIzlSXiQwhaNa1qOyGQQdjxqoGcmP6jkH2tspF8U85m6/QZ7xBkgnbF4/KE8gH4fWg==

On Mon,  9 Nov 2026 11:13:11 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> WARN_CONTEXT_ANALYSIS depends on !TRACE_BRANCH_PROFILING because branch
> profiling instruments every if-condition and obscures control flow from
> Clang's thread-safety analyzer. Make PROFILE_ANNOTATED_BRANCHES and
> PROFILE_ALL_BRANCHES depend on !COMPILE_TEST so that allmodconfig and
> allyesconfig builds do not enable TRACE_BRANCH_PROFILING and instead
> enable WARN_CONTEXT_ANALYSIS_ALL.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
