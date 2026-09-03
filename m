Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3984A2A6F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456700; cv=none; b=KRNo1fF+XqAytPxCjWUXUyV4T4HWOuuxq3o2geubPJAYS8iz7p6COQsb5+78xQx6j1vesYOzDdkPmxB/1SoFhuaJCnz5HRpu8FbNJQD1l9litTk62ApxF49Cr0/GpXv3/zhryyx37h8Htb99g5dh0wluCKtjvVXW416tAI23geE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456700; c=relaxed/simple;
	bh=VcJjjghfzf2wh1+oIOkKpJfylj7DaORyhzm/ZdB9wt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOP9j0I3vSqUNOb+H1tSHK9OAnf7wnAfcM/9KM74/BBke/hiNAZ2VEecccCNS7w0/Q5KtMeNNxIE0iRwlSOmWeZk7Y82tZkBMq5xWwvF5M/s7BBgRVsL7ASNaH0TUjfOGDeO9SZo0VUUmg0VIudelg+PUZ9uUW5MDUsQus+qFhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=CCC71bE4; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="CCC71bE4"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hbRTq5VDXzm4R;
	Thu,  3 Sep 2026 19:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1788456687;
	bh=PAi0KBRtKYJTTX95jrQQsr/rXXuMRK7GB5O53o3h6xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCC71bE4pY6yytF1N1mLxgt149Gr1iIQM75aihy4pP3jeBhULQyuIj+zQb7P3/UWU
	 aoKfMI8sjxvQw/RlTzOqZaQRkKznj3E03+tPCEVhWMuz8m+zcVu4ez1M3rISW0Swe0
	 GnJN6adpv22JE6NEpsu++DWBn9QaCXNN6u39V00o=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hbRTp5WNLzXyy;
	Thu,  3 Sep 2026 19:31:26 +0200 (CEST)
Date: Thu, 3 Sep 2026 19:31:19 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bart Van Assche <bvanassche@acm.org>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1] clang-format: Fix formatting of guard()
Message-ID: <20260903.eisiequ7Mo2A@digikod.net>
References: <20260708105713.2073335-1-mic@digikod.net>
 <CANiq72nB6=EAeKmoWcsVR1YeUCMkFZTEdndLcSOEi1kQNPAc=w@mail.gmail.com>
 <20260708.yi2Ve3eeGa8a@digikod.net>
 <CANiq72kgYwB0CXizay_5ejvqzcxxV235sm=xEwBNTGpqGcdUnA@mail.gmail.com>
 <20260708.kae9Abuath6i@digikod.net>
 <CANiq72mmZF7QXdk+9s8jcWU5mfACy48gn6wZ1RZQwxaK9-03YQ@mail.gmail.com>
 <20260708.Ka2tahree8ad@digikod.net>
 <CANiq72nPB9-GpYFpyOxedtFRDGb+6EoGjMCYQ00S6wh6dth4Qg@mail.gmail.com>
 <20260828.ye1xoPeeweel@digikod.net>
 <CANiq72=iYpz4ZkPGPfPZKQvsdpPo1f7KgzUL59VzcrN_6A2W3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=iYpz4ZkPGPfPZKQvsdpPo1f7KgzUL59VzcrN_6A2W3Q@mail.gmail.com>
X-Infomaniak-Routing: alpha

On Sun, Aug 30, 2026 at 12:09:18PM +0200, Miguel Ojeda wrote:
> On Fri, Aug 28, 2026 at 4:11 PM Mickaël Salaün <mic@digikod.net> wrote:
> >
> > Could you please sent the PR to Linus and Cc stable@?
> 
> Yeah, sorry, I will prepare the update on top of -rc1.
> 
> Regarding the Cc stable, I am not sure. The formatting is not globally
> enforced and such a change could break things for others that may be
> locally enforcing it using whatever list was there in the past.

Well, the bug which is fixed by this patch does "break" the local
enforcement for Landlock code.  This is how I found it and why I
reported it.

> 
> (Some may even consider the Fixes: tag itself here a stretch depending
> on how one defines "bug"...)
> 
> Cheers,
> Miguel
