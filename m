Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5164078F6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094480; cv=pass; b=D0/jFItdRiA1ZNINZGDwHefNBlu8g/n0s09elJzaJqTuxWlLH+PUdjqPuY90Ni2dRBcCsbyx5lepKYdzdWQv043Jt7i1ceqptszWaMaoHK5lQGypKuG2WWjuLqjC35xrx7OptmfLR5MPZtyRjSsheW478FDSAykTwT5wn+Xg4A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094480; c=relaxed/simple;
	bh=dV1XQAwMXloRb+Sp99cSvLbnbvftAViGBxe75uiFOuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+6rVq98CLl8r4X1RY4nOkeHa3edN1VwAAO09ycUx3p61KbmriuJ5Vt0s0tABxv3Ml0OjsTPiI0P2SMIfs7zDZJO+Drgkmac2pwTe7uD6zPPLD23z8YwfPYg6IZis/BiZ+8N+jI636wne4EbFRoLi2sLanHnuWDQw/f73X9dAaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCbpaXYx; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCbpaXYx"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso433a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792094477; cv=none;
        d=google.com; s=arc-20260327;
        b=cM4lf6BOGB4QAcAsO5GZx0+7OBRk5IKCgme4BqlM1XfRiqez7wg4ufpARo0sgKJa6/
         H7WzjYnSvFVy0Atc5ybvVr/iIXcU03yUa2YH98OZ7Ps+LGarwutV7UXXrZnZIz5ISE4F
         o/k0Y1KtBwRti4r46XYIEjXltiwk8MdRsA1+RiJX+U2NaxnM9z2dFzEZsV0LUCygVXK5
         ypFWtF3sQGdhYQjVriyaeBxfGwEpm5xPadQATazih/Iste4wkt5v5GAVuSk0N2KA3dvA
         H8E1VIOnGVvDuvNBngfZ+CWRnbc4/qfY6MhDGu5OWcBWHDCnkF5EhB6GvZYTdNfb3+2l
         agcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dV1XQAwMXloRb+Sp99cSvLbnbvftAViGBxe75uiFOuY=;
        fh=FklHZHDUvr+1mKkAZ+PuSCd0b50HpW4n15SnbNSTWTw=;
        b=j1L5r6JtB91RNE0cQqlYrqYwfxN7pN8PbsHZzs9rBVwLt9RgnLzlrjmt7Wu0ezJOMg
         VCAkelMrgQJn8Jrk14i+q6qWEV46U2vkDpy2htjB6hUHPQooW3qI1BAWm+kC1jQA56Ee
         8BI8VhvI/NJMR04gqNOzHoj/M3PgVX2LrWQe5Hy/WBtK5hWM3HPDLpXubNuBUbpRYlPG
         N77B7faxG3tdhW6ang80iSKWssN7YbWCXJchSJ7Jr8oCM84S14Hs33cioCATaZ7E8eb2
         pNDCix0Q1DFk8I6Ops3YlXKuW1VeF+9zeBFzC8C82Wtu0WH9tQKLew+q03DO+Gpq0xeA
         ySJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094477; x=1792699277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dV1XQAwMXloRb+Sp99cSvLbnbvftAViGBxe75uiFOuY=;
        b=uCbpaXYxBeJ0ZZMJS6BY7cVGcW3gCDoYBeCtHwFDe4nnSbDbEUxd4QL6T+wHuKLU4L
         CDOt2dVWW8zEKXPUnVP9AQ6UYyxEtOMN3fPSpet2Z9xJ8fxSpHGv9k3eAyL7MuezaT0K
         LxdXubKYzM5lQJV2l+ZvHB3bqbK6uv4WHClxLD2Yezu1QZO/nhbiQj8EvG1jRLUKrFi7
         2hVtJklWpmzn3j4FZGbyCEpoDsV1OjG+9tp/ufL1E1pGH89VCzQmh1GES6xaF3mKmAGs
         pL7lMpybI5cEI41/iUJV7zXCIf9jR5cKJQEe+jXvn8DrTGTDi/gfiE6onUyS/eVl8nsZ
         Z3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094477; x=1792699277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV1XQAwMXloRb+Sp99cSvLbnbvftAViGBxe75uiFOuY=;
        b=VquHM33d+Y33EWkIcXofJn6yXkv/b1YCLjNdBeHVIy4P3bCCnhWJeXnGs6y0vdG0Fm
         lECbPmKdJxNsYqR0fDieChXyKU8PjqkdKchs15H/Cg+GQpGGeFVE9z9u6HXlr3VgCFaG
         RyARTQoLTDxVFjnA2OijXdkOfppAcr0H6XdgU2MkcX1t9H9lmMzwedM3knaPSJW3y6QP
         QAe7OPVsI9K/XFQsMaIApwElpGecaEZhHDliYbFGBmy1yknxmB9A4v1QYvMGWDxZ9h5/
         KoZlOw9gEbjVEW6PtpnIewh1AR9AyAfEG+jY9fsiv5Ahuf49IMc/0UtDSVL7PXNURlGF
         CpUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD51TPg8yHUD1kG5EDOmgN2tn7CVh7g8cLGvfqBtGz0OrN4/5HPvPmWs36X+xMNNKOcv0kZjb9xSSSErA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKklKWu2O7UmN5mEx/ygI9zj/adVIExC1hoCqyNiRUzYZHElzNR
	bNWVsUizrBQpp81IYstKe2sS6khRK75b5uykqBks88jhzIR7tiKTvSMoHkCdTDmqmtoYqFna16x
	Z06YNTZCQsr6S9eGe3a9FB8LfkKpqf8TyDiGDe+Pf
X-Gm-Gg: AYBFou2NfY5gnpEWlwqSTciipXvvxKUKEU+vwom3fK6DVszQ0B8fJawRXVFj2UGQCWd
	IZqgQmeCv78zn2s8iU172oTHrBkitP8pM1bUScdftUN0KALZBwELvL9X9L/FwW5xigxHxHL7txr
	UfzdrEzViB6T70Q8dzxhPMwbQx3wgTIFECbqEeZObmPlvHmfH506t7gMTrMUxIeCElIadR3rJiq
	no25fWm+0MRWoNxuCeR1XiESc4Sohs+CyB+fH1U/SgCtOJ03RYhh+J0k7C9Bvv8KAUARf6OsVDr
	BwRZdFCH/z4wvAn6PgzYYn0bu2xlN8rOHYgrzhZ9jfc0gCUJ91gCIrY=
X-Received: by 2002:a05:6402:a54b:10b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b38bc08d20mr2335a12.9.1792094476927; Thu, 15 Oct 2026 13:01:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015060430.5877-1-ravi.bangoria@amd.com> <20261015060430.5877-2-ravi.bangoria@amd.com>
In-Reply-To: <20261015060430.5877-2-ravi.bangoria@amd.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 13:01:04 -0700
X-Gm-Features: AclHuK9lWxmIqw_gxwSlE04mTATY5Eytk1IgL6S3wq8T3iGavJHlQAC3dtBDMjU
Message-ID: <CALMp9eR=wK3mc+4_0pKSNB6y+SfXcGf0Wk=XVAwdhucyms_UCQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf/amd/ibs: Reset CPU0 IBS state on syscore resume
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Jayapal Ashwin Nair <janair@amd.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, x86@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Santosh Shukla <santosh.shukla@amd.com>, 
	Ananth Narayan <ananth.narayan@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:04=E2=80=AFPM Ravi Bangoria <ravi.bangoria@amd.c=
om> wrote:
>
> During a suspend/resume cycle, all CPUs except CPU0 go through hotplug
> callbacks, which sets up IBS state. CPU0 bypasses this path, leaving its
> IBS state stale after resume. Fix this by explicitly setting CPU0's IBS
> state in the syscore ->resume() callback.
>
> Fixes: efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to e=
liminate RMW race")
> Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
