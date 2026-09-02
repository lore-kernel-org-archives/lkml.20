Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F84A8A05
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362199; cv=none; b=Phs359hb/CnhItDKo/8XQoCdHPpGBAqVDcLfBLE6lJtn2RSTrOwauHJ/hhD9+m5rEOQ2yQui48PifoYShCj4OzgfNUMpX5y0QoXIPeQpHLOJAdGj1aOj1qprTMqF2nBc7sz7ul+C5pr0U0wE0XtlCMe5TsuGpHCTYtIKZXwwySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362199; c=relaxed/simple;
	bh=HECDTZkMCKZoqqpfzO+VJIMQURd7+nSnMpHymIxt6BI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJJ+K1F/nj3ePLwfmrYHPsjETpmiA8U2ADAxjxL5TlRSOlHG0CrHQMpo7z31QwT9Zs4eY4Hb657lfroES5KuD/ra7tBSQjT+VibpEQrKFcOV0C/aBA6IjOkzrVBQH3PArUWtIkrQpvU+DRqN+FOiRIdCd50WYsw0xqgrp/N9UOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zre0aMi/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zre0aMi/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1231078f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362195; x=1788966995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ej8q4FOx5/qyockhc6txHWbbFjID2scCvsAjS5hBu6U=;
        b=Zre0aMi/Bns9yprL9qUypX7BqY4TqFnjchgILWG8A8fBlesIpZ82OTAIqbndKCZqHv
         finTyLbxRwC/ODy3c8gTGNddruvaV6nQzl9eQ+PO8IVU0m4U7tC7l3tuViJfMzB4HqKm
         zxgwh4hJfc+j1JW223w8Dm1m1GveITAcKobs9ddti6ysAKd/ReCCg1Z/iTk8fw/aF5XJ
         WHe++NN3EF/6Kzz7zM55Gj/xpNhO6E/qDVq2Ui8nUJXcaMfldvFmn5qRc8rZadUCKrmu
         caAcyAd/80R+Fr0s01VeEthjrfE1vat24IKSleE1pUcksV8/aR5xE8unXEmV3dyNbfwO
         k58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362195; x=1788966995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej8q4FOx5/qyockhc6txHWbbFjID2scCvsAjS5hBu6U=;
        b=YRiRyh7KuNVEyjS1p8pWMsSkve9Sqg1tBG/bVX6KZx7iwNI/1Bh+9VpjqY8f12MTOz
         wJKOCYtsChBl1Xh3ZjDw/zjc2iJCamyu/9e9FeBAhgnD1LKYkD3MlW/Wu+PYrClK2BWg
         3RDxXzzY++RiOK0hvJdCBbDFugAfURZfNhyfFWPaowxZcNvIJwiGHzZ2b4wDkUBgFffa
         4JpQKnnIJqq9bT7zjISSkPhqMllWTyFhH5onIfIuY2sJ2hR2qvpFHBMFqr6SR8P/hsf2
         1vqqeyoUuEVzK+1v3kdH/aRb/tXV6K70/ePiLkIYbeT+tDUuiheyY32Zkg/hJ29ogYaP
         7YPw==
X-Forwarded-Encrypted: i=1; AKwUvBzWh+2YfWod7d03pKgzGX/UJf4/pCkgBMKvZwKiJH41Vsvi1f5WSNw3I+60Cre2C4csTSrovkCeAnIg7kc=@vger.kernel.org
X-Gm-Message-State: AFuF++l7LsTRRr5l6sdgd4EOE1ItQCyuorDRmvdRL+PRafJgA7AUUdbW
	R0CQagbNqndPbiLP1vgLobMbYwyMKAsruTmXnEWpSMk6ejoE3qM4mjFX
X-Gm-Gg: AYBFou2tpaja7RhUgtCGnMSGpdMkTv0J3p+rvrbv5pUJwY8tmLj0jiyFKXTGUqUcUT6
	X5ZbHuZ5gPVL3RY88ql2G47K2ZBGLzJlh7DfPIZxP/0HpM8cKgPbFgVB+GSdbZqjEkYq7ZBIdHM
	WlZzyYFqLMajZQPhWD6qe25dixmlrdOL+KEDXOg1aGMXDK4tMmWfvOTsJWFCyK9iu6WcVVT67SB
	eaK8KWGLUhWSdDnZfhaizs/lQGOp6YEHcAIwFIthKIHajYQKXuqsq8323bn2k2mQDM1gsaemCg4
	9vtIiQ90/K8FGkLnK6vmXRs2TuDCNjjkJdHt9zHaYkcpkfMAIRdh4FA/ArgxrvM9egTfg1NTIQu
	xEthj8dLHgULlK62j26OG95fMKMHqK6yYewUv8J1VFlFTJs/PWva1jj5LOWaoZCMI8KF8FvstG5
	oY+BRJm47c2pxD0XXE8kVJWc0dlNJwys65P2nyTn6ufOG9mgS8iA6xIETjihBdC98TzWt5p6Xhu
	X1VAmu7tOgxw056frxdMS2n+50=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id ffacd0b85a97d-48488deded3mr11428865f8f.6.1788362190177;
        Wed, 02 Sep 2026 08:16:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm8020725f8f.35.2026.09.02.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:16:29 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:16:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, linux-kernel@vger.kernel.org, Christoph Hellwig
 <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902161628.5cf25ef8@pumpkin>
In-Reply-To: <20260902093644.5b0e8a64@gandalf.local.home>
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
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 09:36:44 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 2 Sep 2026 09:24:37 +0100
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > > Yeah, it was originally used for the tracing format files so that
> > > tooling can know how to display the raw values it parses. Also it is
> > > used for the filtering logic to know how to compare to the raw values.    
> > 
> > And, in this case, the value is __bitwise so the 'tooling' doesn't know
> > how to display/compare them and you get a compile error.
> > Doesn't seem wrong :-)  
> 
> Where is __bitwise used for a trace event field?

Not sure, it wasn't in any of the emails.

David

> Or is this an issue for
> one of the other users of is_signed_type()?
> 
> -- Steve

