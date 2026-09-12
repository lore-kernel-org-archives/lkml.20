Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB71E1DF0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175126; cv=none; b=Uhw5aoP+KFryosIR5wzTAK/NL5D04xrlfUHADjHaXlNZQ8eJD/1neo+IGR8EwoaABFzkRshRGU4VgdTk4pZkNy2o7npyrdy4SeaOqAV7DlSpyjLICPfl3+A4mOiE6wYhEer5MpWAT3wjWRXL0seDq8KLA+lUaOQhb6DdVKesRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175126; c=relaxed/simple;
	bh=B+aC36MelUi7LsScnBQKuyIwAOtKkeIXgtH6gzW2sZE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NZaVnnTVNr70TjgB9ENvFDFwfsJ2ejURQKLO8z6daXm33Fz/5jbC2xKwgR05lk8sFfJ+2of90/vmd5YrNcB8ClSPgldQ4kYMYyB6iWeYDgv5ffu9+nI8I03DCAUVWhLpet2JGo8QVANl2oPfBFqLVrRKkNvNhE0Kz49M8hQs3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOgleL0f; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOgleL0f"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so14005ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789175124; x=1789779924; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoQ5u4lcyLVs7Z9JVban8aUncHWvoCiIb4xZrCigtXc=;
        b=eOgleL0fTlZD/ktN8AB8vdotq0PcfK4pjsK14dlH2SJXsjlaJuQ/q/0hFjsJd6vyvf
         xeETyzEjE4P9W8l6BYm7ZmhmDJZYbkoKk8xkzVQ2RWx8ghPwUTB4IaKAORhQxW7Q1Qxx
         9XcCHUoinTTj0QqbV6GADJwt5KrGt58pVzLgF5HP7Vi1yESptISMSlPccm8ObfSwY3mA
         FZOCwBC8V4/A2WF33W6o42sw6eUeBN4Im4q164+wz13wS5SSKU10vJJhGrewMl3WCk7c
         d5J5ktQoIxQQ+mTGqHiJHS/laEa6WkTgq7gIt7nTLd8E+5+B//xIoSClqdmHAPozSFP/
         F+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175124; x=1789779924;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoQ5u4lcyLVs7Z9JVban8aUncHWvoCiIb4xZrCigtXc=;
        b=F8Zv9q+ew3MwwGBOxJTEbyQ9/GP3+94fsqkArEE/gUFL/CBD/tjK+II65KZmuHSFjd
         s0j3TvSdIAHzxp6xzmhr/iLS83J5/szR118bFhA7movbL7giBv6DBBJb8kLIe3yN4g8v
         /XjmhKNnrKgt8pt6yhgcOWlT1rwjEDHujlS6dH66saizJ6C+76Fzo/RPHA5/k4G8g0Vf
         gfl/2aFExDR2EXhU+ArnpnGHoI5pX4/m21Cm23c1T5F38w1L39JUbO6vFCsh0ScByLMC
         LjtV8NZiYAD4UIT5K/c6GdAOKterZtvfMvBPklpkfdavaWp6AKLs9sCFaPg3zhceNryh
         OQqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE+PO/HPEkrwcCIlX33Mm/QUpfRvOXFspSgmhDj1/2euJh5AN78tyL5lmfNE3en66WmWBMbjfvfsoROPw=@vger.kernel.org
X-Gm-Message-State: AFuF++lafgMxGzw4ql+1iSqrCUBatbY8JotO/d9rvkPm8BM23iCS1GZI
	RJSTuz7r3cJ+XJsuQKLfnmEchOvcO1aa/ublbREAK0M9jacQBCKO6LlgIYnhCpWiXA==
X-Gm-Gg: AYBFou3J2H/5QiEth3fmOWJu4uyohbjcyOY0mDRNXclEDQwmC03rTqPgcw13J2h7LtR
	1neV1athrcXs/1U/U6Qqsj3vT8hMaVJnt+hEPAKHxuDCyNnZS4IirKw67G74vJeJwqux2dKJ+Ws
	hRAO2LlfirWY1j/19Lig7ZTpcaVIrNoz9z/GepuHxDgy79H424Bbb3yrQHNpZ4MuXMi4AkjfuU7
	KUsn3yCpgtvpI2l4rw8VLG7fTPNsncLI51kN2AtBxAABvw6W81ZlZ6GgZmMnE4WHNxgcdpmP3Af
	T6Ue4xsSqtMQDUqkZKIBZf2SqsZ001JlzpaNAWkALBTUIpVfjaAZ3IdRWpscSG3u84q8LURKcZE
	Nn/PXgkP9+CQkx/FJz+goUE/+LSNwIDaS/LhWC6KFSQYtegTG5AIRguhuDE9NeDycMyxTZExg+I
	hvD7l3DobQt1NvVQHiNb92BOJC5d+c4a7ssAjyQMLc3mjySMP8wo42lqO8noufiwfRFinrmZJfo
	jIYVX006OYynIN88/Vao6RQ78Jqymbp2k4TnyKXifpe1Dzht369Z4/mnEPdK1TYV/FFvKjU/8oZ
	3DCgcJZTyuShXSM9XilpaBHzkKUcfExMHoZNEIa2vcxImxWnGgsbOuAsMN8uACXWQRFFS7JvGYS
	KqoRVLYg=
X-Received: by 2002:a17:903:98d:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2dd47ed79e3mr3343665ad.2.1789175123807;
        Fri, 11 Sep 2026 18:05:23 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:add7:30d3:d3cf:4f91] ([2a00:79e0:2eb4:9:add7:30d3:d3cf:4f91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cffb5c5sm17522605ad.80.2026.09.11.18.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:05:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:05:22 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Usama Anjum <usama.anjum@arm.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [patch 0/3] lib: add synthetic MM benchmarks
In-Reply-To: <8936784e-9ccb-4c33-9b30-f99552e10f87@arm.com>
Message-ID: <1af513dc-a33b-9c7c-2827-097e16eac077@google.com>
References: <d6787a7f-3213-2b2c-2de5-af3b02daa21f@google.com> <cec6f48d-8857-49d6-a24d-b072482bf0c8@kernel.org> <c76621a4-cc8c-b6a7-732f-633d372477ff@google.com> <707b26ac-7f73-430a-a473-cd3409c4505c@kernel.org>
 <8936784e-9ccb-4c33-9b30-f99552e10f87@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Sep 2026, Usama Anjum wrote:

> >> I thought about the same and just followed what appears to be the standard 
> >> convention (like test_vmalloc above) for lib/ for now.  If they should all 
> >> be moved under tools/ somewhere, perhaps we handle that in a separate 
> >> series?
> > 
> > Yes. lib/ is just absolutely the wrong place for that.
> > 
> > Maybe lib/tests/mm
> > 
> > But then, I wonder if they could just be somewhere in tests/ directly ...
> > 
> > Anyhow, it was also raised whether some of these could be written as kunit
> > tests. It's been a long time since I worked on these, so just mentioning it.
> 
> I also think it would be best to try to add them as kunit. I'm not exactly sure if
> kunit would accept such benchmark kind of code. Some research is required there.
> 

Sounds good, I'll transition these to kunit tests, move to mm/tests/ 
alongside the other MM kunit test, and send a v3 for just the vmstat test 
as a separate thread.  If all looks good, I can do this for slab and 
pgalloc as well as a follow-up step.
