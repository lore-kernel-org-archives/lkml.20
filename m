Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3B3769FD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044710; cv=pass; b=bNabbchxczF4bDLFjG9/FarugolLc9ui0MJGNFgJ7/e6hEhCQsXoQN7oCZZC8iqaKAndZmlHvRu9vz9xyT7MNaZPHlkMZs4of2rX7lmqymtmxJI8r75oxgen8Q22W21JxbMggiysQKEt/S23a37ZJQJgH5hzfGfbsC6cdSQQg98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044710; c=relaxed/simple;
	bh=WbSgfukLRhlbeKFLy822gliOp3+chBonUKVsDk9aHns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwCsT7RFGfJYmodgvTDaRFOeQZcgFAWk1Dul3VbF8lpXW0V9R37/Ac5RoULj64ZUK6dAmV3xN6RMdqHx6L00E6UBJlte5Npjy9mFVJBlFXxeOTMYxbg+qvrOTmwB2R0ZCGDG/trrVxgV7STu49jg4vtaqMv4kR5isyxVKEmHLtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9Iiscu8; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9Iiscu8"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac929eso3211640d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044708; cv=none;
        d=google.com; s=arc-20260327;
        b=aq5jAHjf2xg+5VoVUyOmoHKnQp15EDyX3uO5xHyHCr870xBrc/y/ZUiwKXMzfF1Fyy
         s9z9fvyzps/fWbjx8t/jOyGzws44icRpEVmLBK0wYtoqUQVWh9zzD1WVf9ByP97KxIXI
         u5xGhlgBD6Eef6McCQJkIFjjzrFWxX2pIQeptP6DvAFCea8y1ZOh/1ightRpkd3Ofz7X
         2XgP3KzAduLW4rcyu1s/OrV7kg4N2jk+a0C5xaP+otqf19R7flvpDXBU4FjbAIM+X7KV
         mXuNurBOS7r+aPcfvGSjIRHOJgCtBzxYJdwnLCLuPzzoSh4tIfw0QetN0VyP1cbd1Q4U
         KbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        fh=KfuDBMrKcss7ZlNvXbCIZ/3Jy1oEvRP6AY4NeeADQwI=;
        b=sEUXzjLP+KpvhjqZkUy2mmsz9kWkqyonqOqNefmok5yWoSCMvZN5OIgAouVh2YGGu4
         QEba3fmQd9127MamV0Sc5H2sbvuaTMp7dNc3RHsYs/vuNyNWnBIeV9e407vrvFEDMiPw
         Tei3DHuWnfhQMeU2zhvvb6zESNTHPAHjgBZvaT01KR3pnKPGHUScTnp+Z0Oe6WWLyHU0
         BPAT+CdxeB8H9+kyOZFuTToCNk1RFaK4Ij82jvfjo3jeyilSYt/GxZHMP9Alr1NtooWe
         Wz8aQudbdN+sNxL+D4H3W5LkLRA36LRZ8f+iqusW7p3NrtuMSn3MM008HrE67OKqGbdv
         I8lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044708; x=1790649508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        b=q9Iiscu85T7PbDBOf3XfGOjjE2szbejlfeeomMtQaUoh2lIfTD3TVTUg1l1v+H6x0u
         2MeEF/D1hJRsIqmQXECa91jNsvywWHxrZAw6G7TJj9VqqDjtCjQdie9l934Ufg1Kaobz
         1o6pc/mZnFO0pQtmikPsOyYnbaZaIoZ5LbhFS+pJPxqq59339iMzgquyzFe0+X1S8Kwz
         rEhdGsf3r8RrcW1xgI4/YyHbG2HjOf8peeVIg4+0dBoFRnSPPZiWP2HrSSaldEeHxISa
         UUKtX5kW77tP49yXyYbeFgzLVlK1+KI8I3ddCD4k+i2OPkL41n9jouL9NtX6YvhR5U2Q
         oFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044708; x=1790649508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        b=CkftdfRSGPjKMPFC98QRmutxQyZd0nsr52MZ37/YXS/tQW8XgyEx2UexuX8UdSLpgy
         2yrvYlKSdibZLKgf/pyeEpDkrhN3c2prrbI4eNHzWX5/TDu1cdHmDsDBpMwQ1uLcVNhh
         7FAaU+XepOuWC1Bws6hA8AELu8i79r1oM+HX3HwYkdM88fO0Yk9In6DTMzdCz5MJP7Jz
         ZnsaTVmTkVd124pNNnzflhjofDXw1FPRTiR2uB5QiwwuYCfcndjLReCI/kAS8vES6Pz0
         mfc5QgyWJhGFxrcqWU3WhkfNm3KKyJfrI4X/XBFU9i2A3tJNtQaYvLyopLEafTrFnwaj
         NgbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFs29X1CcRu7wfOJUtdrNyZ98b1Ysw3aBe9EP3wAe/9ExHmmhxTrGkRVAfP/OXWYNfvNpE+JPoCGnfgug=@vger.kernel.org
X-Gm-Message-State: AFuF++mL/XPx/+I9zg+xbjGaq1k/oEAKgHL2BCneaFJAHt8hHQlEjKMf
	tNYNhttCGWimRNpVhAAzyG0dEbqe7HjsAxjMh2HNez5GpNDMMDoXUNmLEHYVzkWw3RLDNYo9oDf
	bcDW4fQKPJw/sYYM3GJFFtW2FJY7hl3Y=
X-Gm-Gg: AYBFou0ClCvWeR1a+D2qNqDAtOR1zaHXihfey8chggjfdSIEM+GzS/GgTzIu4zdJGwD
	cYiLws224BS8YAeo+isZ+Hz5hz+EWp213ULw18Yu+S4rjVlpYpDIStIFGQtllwFSVWjfCSc5Ee7
	jC2M+6R0hK9aemWvY2cWWpN3S7gLyYyS2xJ3VI1cbGqI8w3ZPoqEXypXcztgiq1oge9IpGqF7sD
	rOAbqDbMYi5zNiazDzmmp2SYHQPxgpSRyjznSp70nApodBEvJLyoJzNUo78alKux3azhkZoXsq0
	92A2GHZVBALRtWbCAE/eTDBq9WEX2Ul6J0CftbbI46otrq8SUB2yKVfEtw==
X-Received: by 2002:a05:690e:4548:20b0:670:fe0f:fe39 with SMTP id
 956f58d0204a3-6717fdfd203mr2973986d50.88.1790044708293; Mon, 21 Sep 2026
 19:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921075312.120983-1-lgs201920130244@gmail.com> <arFH0ridHWo3Z_w9@quoll>
In-Reply-To: <arFH0ridHWo3Z_w9@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:38:15 +0800
X-Gm-Features: AcwNN1XWb8ExjcuFj63-aya245KYEcnQa1inFwfN-VmRqAKafLrlWEitnVlBJsg
Message-ID: <CANUHTR9tUL6Dif8MoJ92w0TQYx42zc6jksN8D5_0nHbRVE0aLg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: simatic-ipc: fix platform device leak on
 registration failure
To: krzk@kernel.org
Cc: stable@vger.kernel.org, 
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, linux-kernel@vger.kernel.org, 
	Tobias Schaffner <tobias.schaffner@siemens.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Bao Cheng Su <baocheng.su@siemens.com>, 
	Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:05, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 15:53:12 +0800, Guangshuo Li wrote:
> > register_platform_devices() creates multiple platform devices using
> > platform_device_register_data(), but returns directly when a later
> > platform device registration fails.
> >
> > If LED or watchdog platform device registration fails, previously
> > registered platform devices are left registered. Since module init
> > failure does not invoke the module exit cleanup path, these platform
> > devices remain allocated and their backing platform_object memory is
> > leaked.
> >
> > Unregister successfully created platform devices on registration failure
> > paths to restore the missing cleanup.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: dd123e62bded ("platform/x86: simatic-ipc: add main driver for Siemens devices")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/platform/x86/siemens/simatic-ipc.c | 40 ++++++++++++++++++----
> >  1 file changed, 34 insertions(+), 6 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
