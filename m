Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4E175A85
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792128779; cv=none; b=I2OUsPqhdtdf6PVkHnh4Br7cZqqQKWOVwVqvtLMxN2O77eFThN4miXKFBOphDZgBOTxALPFVo7dFESNooKR9I9f++IecGvN52FM3kG0eCfXDcwlYWZkK4fRZG4XI1Mbev6Qg+3ZNofkJai6M0Yxih2RYxBFlv0EqANkDfnTpBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792128779; c=relaxed/simple;
	bh=lYuyURMuIbppUXXXJrgW4gw+eqD6yqHCNHsM9EaqF0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUE//947CaUSMu5c0EH+si64Ue0+QDxZ2v9qb3Rg3E6CpSoxbZht6QMvI8kfH4kvUiCnLPFIAXCZ2RmZX0XFJJlbWyquhoOaRFMqBbH2S7j2DoeByEM7JMNzJAHzwfu0lkNtXiQACDp1lh6DlWPv+gWF/jUE6KyY4A7ugQ7o4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jypHDWXj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jypHDWXj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afcb1e5f9so803347f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792128776; x=1792733576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CkZFo6ItG/Epf7kTNm0ZIiNbcMGEza7urQULiKNKTAE=;
        b=jypHDWXjFGqZV8Ir3dOJ3E0tw5U/AXMOhXvsdzgqjZJJTWVIwCTOdDIqVKs+Qavoqe
         cmx5Yka+qfzgIS47ffH1j+wFi4m18ZhL8UW4jbNcoOgwKurFLd2sDr8X4RspD4pd82wH
         1YBqxX0c0lU3zB8BnUpNgEmnZQKiNn9tZ1faADiOu0VZiyJTHoMzUFLiTVxkn9HgCeNe
         dbxkItYdw5LhC0NhqeJmgRXiOj6TZobpvApIKPjsDh2JUEyZ3l7SdlC5xvU1JIqo7NpT
         OeamfE+yy0IGv36M7Yx52x5fq1pzrPIrbGWnpdzJeqyFcZT7pUPiuQi+oGCx5Yx7Dd2E
         g58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128776; x=1792733576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkZFo6ItG/Epf7kTNm0ZIiNbcMGEza7urQULiKNKTAE=;
        b=PjeMp+erPv3OidAEuVZbExuVTkIQf+HEVCUnoDzASK+jINX+Ei6YPXu1H0ed0/bOL7
         jon+mhyYaVMSncHx4XUlYwwDoRgZq2gunV0p2xHlWZKPXxaCydJczyqom/906TFXkP0o
         ioOGbaDRfSsHW083nJEjssfvB5K9cSeDu1uw8IV9x5IbzJFch7Mx79P/pYg7L8Lo0DjO
         urM0fG4DuajXuCVDEt7NFFwDFluLpNFI1TGzw1Y+a4xl7xPdtJ1hThxYob3rDRn7dQXl
         zgii3Dfm4KZxiOhj/3lvXn4hp9rmltbu7+EQX+aDao3+DcquO6+RANB1qrydEn7ZNUxK
         rorg==
X-Forwarded-Encrypted: i=1; AKwUvBzEbu9uPGEJVP6gYrw6G9a7F5s7shdwabaPo1frIyb+ldFZsPu5QEk00y5stzxdtLlHzM6L9kQVJ5FD0B4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuXeh6D3WhMuACQS8wGGI+keKLH8lPj2qx8h86ZZ0GFpkSYbfo
	hR0j32nXmJoZE+C1w9vvPjKbayspgfScI/6rSnC3FdAAWwd7o4WcPuIj
X-Gm-Gg: AYBFou09rxugJOMBmeMYeyIAAbzaRUqI9i0CG6wnVlugP5XhZmBbv9PGdHpuDTmOkQE
	GN08rPBY0cuSbGHLC/tRGL03LNN9TzcT19/NEqjAkVw46IdRKBwvwAFAhxaWY7hTYDytEMAwAT5
	d70OBjw1dUJeJQ/wh3+ZzBv/HRlkDVaC4UVwaO5KkBpJp2sv7yUFk79ByOnATT+Hwt46iXSSrrB
	BKOeLKpyziW9eOzefxkdAv1XAEnv20eYlWbSb7VWLNz4Ku9/8flspM/GfcjcbnwGjUGtqekWdCD
	8xkrHQs6tG4+xlAhchF1aJ0+fniPBU2gjHA3jX74+vw4v8DBeJmuIrzE9M6NAf528Z3io7c15RM
	RKsSVIWQGe9Fgo7R75Rnz4Hqc+z4VDzZgWzt6dBuFG58hoqM9SJUj8zN9QqxTjyON4Eq31wOJwd
	iaM6MsiY7KcEz0G98OUxWJVLxy5gwChu7e/Zn6AyUnDqk3CpiOuhEENbX1Be5xGfj+BHCnlZ0BK
	3uZIPl3mhSZ+QCxbMlAqgUb9Q==
X-Received: by 2002:a05:600c:3e19:b0:4a1:c7f3:218e with SMTP id 5b1f17b1804b1-4a1c7f32285mr31365525e9.1.1792128775912;
        Thu, 15 Oct 2026 22:32:55 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm12219055e9.7.2026.10.15.22.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:32:55 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:32:52 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: peterz@infradead.org, bsegall@google.com, dietmar.eggemann@arm.com, 
	juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	mgorman@suse.de, mingo@kernel.org, rostedt@goodmis.org, tj@kernel.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH v2 1/4] sched: Rename/clarify
 sched_class::task_tick(.queued) argument
Message-ID: <atGzh4IJjRnWEif5@scheduler.schedules>
References: <20260929085319.981147568@infradead.org>
 <20261013171410.58340-1-kayracizmeci@gmail.com>
 <5f98f865-6bae-494b-b08f-662e3325370c@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f98f865-6bae-494b-b08f-662e3325370c@arm.com>

On Thu, Oct 15, 2026 at 09:01:15PM +0100, Christian Loehle wrote:
> On 10/13/26 18:14, Kayra Cizmeci wrote:
> >> For some reason the sched_class::task_tick() argument that indicates it being
> >> an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
> >> this.
> > 
> > "For some reason"...
> > 
> > I grepped. I think task_tick_stop() is skipped. That's a nit.
> > Just sayingggggg........
> > 
> > Aside from that, or with that IDC.
> > 
> > Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> > 
> > (How y'all find things to review? I just go to the threads that I see the messages of. I think
> > That's why I'm a bit late :<)
> > 
> > 
> 
> Depends what kind of patches you're interested in, most kernel developers
> have an elaborate mail filter setup based on linux-kernel@vger.kernel.org
> If it's just scheduler patches, you can either start filtering for "sched:"
> https://lore.kernel.org/lkml/?q=s%3Asched%3A

I set it up yesterday. It works fine, compared
to the old way of typing my message to a .txt and then
sending it with a git send-email command.


> 
> or check one of the people in MAINTAINERS (preferably somebody who isn't listed
> for a bunch of other stuff) e.g.:
> https://lore.kernel.org/lkml/?q=t%3Aeggemann+OR+c%3Aeggemann

I'm already tracking down half of sched at this point :-)

Thanks for da tips!
