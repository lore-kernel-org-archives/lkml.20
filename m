Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61F369D6E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077430; cv=pass; b=VQWMvgeF8t7UwZwmbel2jx8JS8htS6kVVpk9DjSoZr3LdP7NL0L8ShfmaDECY3IVqBMSWtWD0xnNjDv9L5xmZQ4aR4oYCV2mq9CYzo5BhkoArC9VBcMC785Tu9Z4Qp4Xq4xdyw1tj0Z5iloqtSvAFs0RVqOGbaYXuivu8Nnsf1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077430; c=relaxed/simple;
	bh=uoPPaZGYiQ7utfzHBxmkQ/zq1fN33eNhuTE+ayh5TfE=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XorI3LMyB7ECMdPxe9VgPm6YmTQQWYuzQ3YOysrfVPPj5k+blOUPjXbKel82LRzL9SkcmDwsQDWtfAeJ3rpRSeafatgET2rlu7dI7uU7alHEhQW9oCkHOGN40RXi5yJ2eGLoZrblRkw8QJEvlv3AbsYd4DBp8Xv3inajwKGsNQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYo8BknQ; arc=pass smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYo8BknQ"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-5179f3beaedso2001728b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077428; cv=none;
        d=google.com; s=arc-20260327;
        b=GOTpW1o9mKtpF00g/O2QdWe65q+O7VsLLxdqmkyZ3Iw0HxTgAdoQvC9sKVRzBrxGAJ
         EqqNFArA4vLvjooYVWqI0gMGMN/zdHtbJGV/twIwQwxqm2FGLcMBd2toRPcXmwZhgkx4
         JgawLonSRVkj4v+JBf0sLzJqXysTfLXtkweSxIKQWLYJvLduhqSTqgEVoriQFO6kkyPn
         xdSrNMsNOAdXUOgVRAyWtJx5zsTe/8woZ1AXa63Xm/kbLNRsEKVaAk2JL8JrBOHNPcRi
         EfATv1mUhwUkW8Or/HyAVDb7Od+6LBxL74FLjgp5i/Z28wQBWO5r5rowsgH4lEWTQvCq
         B0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=OeZR/JOPa/KrDeQOVwy6UcwSPvI8j2bKhcX8zNJ+XWU=;
        fh=TuP4uFvx/ruilQ8vyfYJIUM0OtpXpR3KT6ZktV+7qqM=;
        b=UNc3AWZFaa9G2UIno99zCWKi3Z4mgRTQ9bRhFAWs9UEA2vS3cRP+dlEoxyEuwmmW3L
         4r5QPH2Irk5yBteEd4Y1KmmRgDpdhSG1JnqN3jTLorxCG8p+QtMgd8gWw9ZcsySLov1A
         l2q3OKR+FDDcOCReXR7w1HmL2IYTZYhw48SA5J2o7BcB4Zijd6DR4YrsXo1/fQWadV+c
         wkrSLs5Ac5R1KFOTMYu8tS+eO5HTEvimPiZOr70mvZw9XJU+iitTaMrq54zXU+f5/U5C
         FxcwKlqieCMrQkLbnYA9kmxaFkDHvCALwMB1Ue4s3zZzmnMVt+L1vNzTQqvLL/zI8pU2
         6PKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077428; x=1792682228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeZR/JOPa/KrDeQOVwy6UcwSPvI8j2bKhcX8zNJ+XWU=;
        b=CYo8BknQtdG01Sy6712hZWe6M4OHbwYp7JHb/iWPetcs5SYNbYnssBO5V43NFzx5pm
         A8MljolxtbgxsPmpRghgWJQDx8w9wEJMYsGhJGm2S+rqtdBpJnLQUu5LCgH3fgbwrQVb
         Pz2uBZxaDQ51PGl8SFGlCEQwSqRTpEDLmD8YTn7YVzuUSf63tn0KtCDqgKlCmHYj9Lxf
         5ADyOUNjLet8EKkFnokHrjqYw7XTeLZpW3jnaF09jY6miQkQVmPhxocAE29l7EtJIwcn
         0r2QCaGhmFk0eJMMfHjIBIJ0wdBKLcMxmnEIEiArecV7QhHziIMvlzXk94tDJlLypvIV
         hA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077428; x=1792682228;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OeZR/JOPa/KrDeQOVwy6UcwSPvI8j2bKhcX8zNJ+XWU=;
        b=zWrxFpiOZzd405wdqbGqiGMi6tFVgqgfeNU2SbknGbTIEFrLXM3BPbbVXuL7MnC/ri
         bNHEZP5bD2CQ+w7tCFqHV2mkdnwFJCbYzxA8H3URXkDqd690a7CnzHHqhCjbALl14EWI
         5tMZlPO9wLPOrzuim//cJWtvIgskMZHG74lM9daO3B7pM3u3K1K9+3G1fetSRlyTAKH7
         d/8e1xKF08qpAfVYOqRYsU9orcG4oZSXZwbItHit1iPbc9uR0WPXRULa+txwE1ZEh/Fl
         ij0BnhQ5S+oCHpiXjRnnX+ub/mCg4oaCX6w4DjLldABgWeq+4Mp3V90IXUDkhgLdMtPY
         vwsw==
X-Forwarded-Encrypted: i=1; AKwUvBz/NonUFWzHuO/7G/QXxliExKIEWBdCfFhDCELDFxkZyc3OZ49HCNbksRR1BUO58XZWRJeky6HL8PFByJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7DpqlFha454EY3digf42f7aYqvRg9twWOgnm3DTf8U5Fk8dBA
	LMjmKpHnRys6yzuTgobYUL+XgHGsehrr7N6xY0afNC3FMdSAjdttaQguUW/fmdJB5f/sqRd8r/3
	MyMqEqeb9Xzm6SnZkFuRNLt8L60i4XknTCYsM8P0MQw==
X-Gm-Gg: AYBFou1y6TwprZiOAnfrF57usF4TaDeWBEJDWO13PDb4gnEKmb0u8+EaconwMxuM6MX
	4rqBLIZ46DbACgPa7loxpaMEl13N8OUxpMY6cqkB431LH6VQ3PCpxHzGwv/v2s1HpJXWdaj0Z/l
	sPAQ2r0rCh+kJuGSOPeXUO1vBQMEWUaujyzGy4+XwmBU72U2joAGGjHjWlY2yfqJbPSS/JwMqe1
	G4bP+TVIEoyNKY9npxIvoURRI7hybc3M1EA8I1hr881+0YsfH1aBXIXb/vL5coto3c31toatwCV
	DF+/DLJ0FP8zk5Bj70vSCvTRGG52e9rvtDGtRDPL1HKU3u28Z7lxmmO/M/lKeG3uVjva5VPBAAf
	qMpVRATg=
X-Received: by 2002:a05:6808:50a4:b0:4d3:6be7:c5e9 with SMTP id
 5614622812f47-50c4e67b316mr20247148b6e.24.1792077427501; Thu, 15 Oct 2026
 08:17:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 10:17:05 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 10:17:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
In-Reply-To: <20261015140502.87975-1-sj@kernel.org>
References: <20261015140502.87975-1-sj@kernel.org>
Date: Thu, 15 Oct 2026 10:17:05 -0500
X-Gm-Features: AclHuK_GMaQKMIsKIixwyygc0aElEhr0PiYnJJZwMfa1CmbK4jR8xC8YVujhE6k
Message-ID: <CANOyQmHhCJEbHpHUZ2P0hui+We7wxWkEde-Vh4k2rRXWovRYrQ@mail.gmail.com>
Subject: Re: [BUG] DAMON sysfs: failed update clears tried_regions snapshot
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

I haven't seen this affect a real workload. I found it while testing
the DAMON sysfs interface.

If a tool tries to refresh after monitoring stops, the failed request
can delete the last snapshot. The tool then has no previous result to
fall back to.

I built and tested 66178e4ec30a and its parent cce0b334c310 with the
same config and reproducer. In three runs each, the parent kept the
4 MiB snapshot after rejecting the refresh; 66178e4ec30a cleared it.
Both returned -EINVAL.

Thanks,
Aveline Noir


On Thu, 15 Oct 2026 07:05:01 -0700, SJ Park <sj@kernel.org> wrote:
> Hi Avelin,
>
> On Thu, 15 Oct 2026 07:22:38 -0400 Aveline Noir <jm5905938@gmail.com> wrote:
>
> > Hi,
> >
> > On mm-new commit ad9f2d463666, requesting
> > update_schemes_tried_regions after stopping a kdamond returns
> > -ECANCELED and clears the previous tried_regions snapshot.  The final
> > result collected before "off" is then lost.
>
> Could you further share your use case that this behavior becomes a real
> problem?  Also, have you tried bisecting this to find from when this behavior
> was introduced?  If so, could you share the commit that introduced this
> behavior?
>
>
> THanks,
> SJ
>
> [...]
