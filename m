Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829923DA7D1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820882; cv=pass; b=GCJChoNg4YqlSgN/jyee/PGkAI3JmF1gFKa0AknW24MgcpboDgckD6Xx/CjBjAeA/L/1ruk9gamSbzps2DvhsNRsrivYtyIxbrQ4AMPmMowprjWMKtICDPYFvQ0zKRlz9nvVLrap9YSdgHTnu83b5WHJ3PJfydwCU75iVqdy4F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820882; c=relaxed/simple;
	bh=CVXZfNI1yyl9gqnzh+kFHa9YYjSrpOWcB8gTAmJLliw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUSd6/p0Z0Uu44TeSSpzzaYKpH8c7nYeJXAYhiD+rno3dd/jZx3WoadcQLdQCuMobttiVvxTJSqGeH9YZI6fXoHGRGoQlXfPLabJ71w+CXYO+ZtjMJ8QCf9Zx6KhpjANyLnZ3LUH3tbhs4FkknNHpYg7LEWBrt5qIAFe7vD5wZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HocraaA6; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HocraaA6"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66d2529310aso1820391d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787820880; cv=none;
        d=google.com; s=arc-20260327;
        b=s1e3iOp/s/T24yV/0fkIhPCSHto2B6nCjm/kLsIPKNwl+hr4bEHbfy6iAMfaEKOGgu
         A5AQBc6u+t9oftOJK78lVZ7UehdrkU+WmFo91Eu5TFHpgJmHDU70Fvmxnk8zbJZwYwnl
         Sc/rxb9+ITAUfZAPRpfaZ4TU/nk1lybPLxqyhr7UFYNJ9DPuldZ1r0/tiVNvGvYycUJD
         DXyIWtFbq8N/4jKYuRINN+w5eyxcNZuICcDPkgPZDocxqfP4+uGU7Al5+0nW4KADqhLu
         HtQuWcdRyRxFO2xWEbMP4ae78ytilJKdIsRiYKoIO0ydR9xzRgg25k7pr8itgA8ifbbG
         8AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVXZfNI1yyl9gqnzh+kFHa9YYjSrpOWcB8gTAmJLliw=;
        fh=68YtWtaL2eQSEXr+NpivPwgYd5FT+FeOeo1+tvqXXHU=;
        b=UQg6wxx4GT2xXXdKEqxaksi2WPyOPksH3JmTipaIBku+HO8f9H+suVVXebjr/rvDib
         MdDsBuw+TIYlQCwEOXkECBTf2WievjwJ7UrbsfDsfpnHESIxsdBFWc72YUTvm0pB4VNj
         VN1jw36Ep1QKznxozNREBC3frgbWmJTVBsv2LMyW34KpsaQ7sP1MOpJHdKz5oEquober
         X/e65gGnx6TB+2iYQr8oRPQlVg09smWkk1IRqGzylycLyungR5PBdjFLgtB9iF3aG8aB
         1vsbZ1M+3ly5b65pLN4fjjR05/tusB005XOJFpQGRtMqTbVs/YA5z86K+2HgtcAmTDjv
         9b7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787820880; x=1788425680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVXZfNI1yyl9gqnzh+kFHa9YYjSrpOWcB8gTAmJLliw=;
        b=HocraaA61NwD2d4bCGaFF4lg+jmNXNQL1eZ4cykRCUEvfVkCYgdsRT+tUMGxWFH9JW
         3BRkVMuNZ4ckRVY3mfP/4ZUXZuP4WRDxVEuUHXdlzI3kvBuxxNyVU2/i1EdLFYS6fLVo
         NXa4dPIy4H+hLkaesgCzsYHGrA41fG/lc+NlLQs5rVs4aid3N/OSUSiixVL51+7tLjh6
         MnPcCxGK15PWpkXadleJb12MU65pKkWmp5ilmyo0a795l25eyRHKkOQnMoiVOXxcPJgN
         TkI0H5BEEFuZxRxJtxoAIfrqjnNYnN9h1u50l+xGf8SDFV5/NLkFgW83B8DiB6u5ZHb1
         w4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820880; x=1788425680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVXZfNI1yyl9gqnzh+kFHa9YYjSrpOWcB8gTAmJLliw=;
        b=cKo1WCv8sVScqLpBBVnRBAkmPiJRKBtpQan2HDVZEJRwI2nlPeGjEOsPj3CgKxKyCb
         uZ/JHdicckrA8AwXHT6ePFWtOXfB1qJgH+NmQlPj3BuxtkMVfwZn457C8WKqUS275bjo
         IXoZQp3aM5NcsaxBKrxVlzHPtkPRzgeVd0PD1Hdfc50xbXHRrBZHwGlqVSpTtLbTgrUl
         FnLWHuUd6+rmXapXt7jRx/nGd43EopxmeFv5P3BVLxfVEJ7khC/VBFqy/Yo/ndFC7PXa
         ncPTlrkQa24deHw6i39bXhGjQx4q4t36NVhl9zFn26pVjmPeh9r/83EEyuD0hOk9jeZg
         mb/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiqSakzSkGpM2nh5+Vjw0NBpx2h8MCwIS7tTvLVc2a5UsVhP42SE8/2UTzRZ18+IYaACuZf1iUR/fsOJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mo858NIJRLLYEMKLAFcZDWwqPJymZMcKFi7Bu38S23SNeD5khQ
	7PhIbXX6XDk2KHqBc6WySmIUQvdTMBoiNa6jWEDLFUKeMlMa6DRPWlg+r6nHd/xQVQnztjuHjOD
	cO9TtJbQCoi2JT4g0Wfsedz6yH+PsVXM=
X-Gm-Gg: AR+sD10XQWAkD19mh8x3ZE0kEhI+KNcPtjLXmAmgKb/3JLngp4oYoLJLf6DVF+f/MCr
	erLD/sETLWM1hqEsstKktj1NUpMXZmlCbFYsJbXdOV10aBsOHkpApSaEg8/+JweoZ2bk60FLkuY
	J739AMOOlSESElRy/6QkhRS0jku5Io1xWJYbcmJv/6VRQ+SJHZedmZAojzq4x4EWQAIckhOF8mS
	Z5RjwVfQz3ZyISC36t6Ofh/Ky1gnH2qwmHzLGWLBCkg3eAm/UCGpwrwbE6TcA630wAExH8JoCtR
	cALwSMj/0s5JA0S0MHmfU0w3CV1pDOnRlHCWrzEBPGuStrxZ9A9lxWsPdmpb1kpURhcL9W/SQ3e
	laT3M7HCK6h7xT6Gg73oFStY=
X-Received: by 2002:a53:d004:0:b0:66b:1640:53e with SMTP id
 956f58d0204a3-66d256b5645mr3643370d50.20.1787820879882; Thu, 27 Aug 2026
 01:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com> <20260827064619.GB4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20260827064619.GB4121339@noisy.programming.kicks-ass.net>
From: jim.cromie@gmail.com
Date: Thu, 27 Aug 2026 02:54:12 -0600
X-Gm-Features: AcwNN1UhO0NSSWsYssWvpfvC6xcnryX-xv-X3lnDJlYgI25zJ3p1JjHzpKS8j60
Message-ID: <CAJfuBxwOHiWsoQVLahW7c1+2f-=itRBLEi_4rbQGr+vtqLyBWg@mail.gmail.com>
Subject: Re: [PATCH 0/8] lockdep: change 5 graph-db arrays to AofAs, fill from
 memblock pool
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:46=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Aug 26, 2026 at 09:58:32PM -0600, Jim Cromie wrote:
> > Lockdep cannot rely upon any other subsystem that uses locks, so since
> > inception, its graph-db has been stored in static arrays, pinning ~10
> > MB in .bss. This is a hardcoded compromise between embedded and
> > enterprise hardware.
> >
> > However, if it acts early, lockdep can pre-allocate a pool of slabs
> > from memblock_alloc(), enough for its lifetime of anticipated workloads=
.
> > Then it can allocate them as needed to provide new segments/slabs to
> > the graph-db.
> >
>
> Why? I really don't understand why. Who cares about this bss stuff.

I thought embedded folk might value 10mb less bss ?
Or have they stopped using lockdep already, for size or other reasons.

How about OOM, when kernel needs mem,
or lockdep debug-off, when the slabs tied up in the graph-db could be retur=
ned

do these not tip the scales ?
