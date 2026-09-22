Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9FA32B126
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043217; cv=pass; b=rozLqvm5LHUg+rR2feoxB3/IrpnvxwWmjh7yc17MGZb4aMfg3TDwajtEqAeqD/2MEPFOVTwHn2JoKZqdmrUsjipcOZEQ9FfWS7wPfMrXWpEiyxFmiP7yJNHf3uRRYS4YyKO3ABxZfybG0Dlh3M2pB8byyHGHqaKMAH0cRCphqag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043217; c=relaxed/simple;
	bh=Ap/YzZGyzo2cO+qILnS+HOrD1LlO3Fjr9oA3SoqgiQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwqZAB6fS5ezJ0Sly3YhuqtCZ/4V4xXDbnzFuko2/RgiEqZ2ZO4cuYqzwd00CnpW2GJ8WLLgeSzGyPrtmiJxThFxEbFUjqT91D5O5WZRgp8YqCuC9c+p3+lAaKBpCM7izs0w/p+MfeIQvmwLTZLvr+HGjO9Ic3WIC18Nj7vuwxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cn7o6r3g; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cn7o6r3g"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ebso2707162d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790043214; cv=none;
        d=google.com; s=arc-20260327;
        b=OAzItsd1yZpuoEJeSlWTsQI/l1Iosb/aSwWx1g8LTVJ6H43JLJBCa8hWhvJ8v2WwWG
         r2ck131Xhe1pldDyCqA4oPuSykt+l4G34tBP6fEhyHrBUw9IK2At4F/b0s1beKwNs3xe
         pTNGyk4gh0nejBn5GsftIpAcxAt2WJFuoMYdga3nKDOCN6TAujXAXPhV3BDYE/mivZr+
         yP1cQ26Y385crOXuQ/xJklh6rljmo+r6So1ZSldGLKpBVS8hcrNTtpDX5oYNPJxIHciS
         z4/U7GLMQJ2Uk0VJrc8SYXj9HDQo/8gSFcjUv6EiyMI9UjtKdwmGsSpTxf54LpZrl/uJ
         HcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OCxAavhsCK8ZFakY3+2+r6Yw5rmMKHTrZRwA8H/yqhM=;
        fh=Gy8Cg31Ewie1J7rF8f/F6y/uyGJ4MazkhilTrl/Ckdc=;
        b=CyeGg12hGDDaYmtUE724enAZbBYgZQu6/gCu0KM7JUNNlGkzZdvL2SE8EmkZ3NSpWz
         nfMGDDOY9I7fDXMB6XotZM1Uv6+jAU0x6r3qOXkR5XHTy4i31KrvG1ao8GsJaVY2MKJS
         ZBt+83eZr4v0cUizHftlhxtv3w/25ffRdbyAUjmXGZNeQSgCNfoMh+hakBANpSaeHjx6
         mjG2fkiFUnmQGCsp/PUx4PKnNtYk8nsumODE0Z10bKwU3YAwgkld73yuzODUyOsfBjCu
         BQJ0s/53bZvUF76WzkQVbIsuswih7ZNwEBLZtDvllyqNktgxSrjVvwLwdiJjXUzuFqvs
         nWmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790043214; x=1790648014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCxAavhsCK8ZFakY3+2+r6Yw5rmMKHTrZRwA8H/yqhM=;
        b=cn7o6r3gMueb+t4GKFvoTSxKU1SJovRPQ+4SbRkDpdy3j/ZIb/rqwd8WMrH0u94Gt9
         dzrto80zXH5FL8YnwxOAAyG2KHbw6QXO9XnR+iYVc6kQxrxUUhSNMBPdaPnM8laUPYW5
         DzAkkf8yeyLQGHxr//dkZNYMfXhGv/bAgEMFJp1g1H8K1ytMAPUq6LZGSHfAE6prNAnF
         V54tcvc1AMnt3aBhOI2QT7UDypM9v3QVVTnTUWwHIapQfQmo9r9gVmLHX5TeLGHzNzHU
         Qnw23dIP/MquuXx7AXzJioBQ2Pr7xOOiDOb6oDFkKEDhrZKUJUeJTSqilIl0LKC+7l8V
         p3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043214; x=1790648014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OCxAavhsCK8ZFakY3+2+r6Yw5rmMKHTrZRwA8H/yqhM=;
        b=Anba7LJ+B0OFA9bEHnNDZiHtOdpF7l03RFW+RQehDsP/WoQwvQ8ZxLemiUkch6o9Qp
         4C91iVqy6l5M2+PMPqqNs3NPunmRxAGUvXwCNu+vMa9cdffbnjJTQVeMePL1XoGs2Tmz
         H4s4zYKAoHd8a5ytY/JYTHIIbCb0PnTTTLPPnXNSgJtWa2c82p6HcNyMhn4ZpkWtijAJ
         vkLizwonBNUkdDI67m3Ntjl/YyaG6B5O9ETG6mBYic1E/UA+ijyz6mxXzEygUJR8haKW
         kdXddFrb/gLXEeYm46Cxf2NlzroCNhquyUG7BuWBVB46K3jtpYmVYa8czhSAy9+egL3R
         daMw==
X-Forwarded-Encrypted: i=1; AKwUvBxeZmrRlZPSuwh6nz4oi9LKe8PliJXMbpV7WhkAIMcMz4ipDg8u37BY89U+a589zeBM7wtanlhqLADo4No=@vger.kernel.org
X-Gm-Message-State: AFuF++l6RCoS2EwQrCkjs9LtNF8CwVoWJ9is+yBqI/JhJlqqnL/yHLy5
	8FJHghjP+3Tw5GvcNIy8Z2LhRFReBsz3oVTzFPYTymO6TluRr/4vqKDHC0XxFENUuY0cbqKhlra
	JSGHjBsVtqAQr6CMKz929e8gbjQykrpE=
X-Gm-Gg: AYBFou0mEVaIgEJ2nNgRxwut8oLRGTiJwZqSzPVF+Nm1yxvvVKM2phwuNtWMhl3xMrn
	EV9tjgoG2hZA30tZCCqK50JpkyHB7eVQVV6zRTxsYLGI5Vr0jBuIDwKikRGN4moeoy2YwopvrPz
	xnb7beZeE+iO4QwETP6/DMjgyd5s7ec/HSZ9S0UjVTa4yAfPoK1zzaLZlg+fe5aZUUctMVyAavc
	NFuyRy5/kUpLOj7MMR/IcPipbVY2pRaWRd6R3iPk6bNEs0oufV3/sKXHRh5QeDBlEcNIh3PqG/C
	1d95XZWfzfhfJTBA+g0/U1SQyR+jsRmRSPZDBQQZQ+lMFZ+TuGdRdb5WFw==
X-Received: by 2002:a05:690e:4192:b0:672:99e1:11e3 with SMTP id
 956f58d0204a3-67299e1168fmr2220506d50.128.1790043214123; Mon, 21 Sep 2026
 19:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916063118.2924049-1-lgs201920130244@gmail.com> <arFJ_2HfXWuWCsUO@quoll>
In-Reply-To: <arFJ_2HfXWuWCsUO@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:13:20 +0800
X-Gm-Features: AcwNN1VtWhrPTDbeTQKN8w96m2efeF0oPfkRnX5dnHLNyPZ4NdQAmU7V51gzM7I
Message-ID: <CANUHTR84U+tLdA6SCqyB9p0PnZ_Six0nD688goE9q8K2qvXb3g@mail.gmail.com>
Subject: Re: [PATCH] net: wan: farsync: disable PCI device on removal
To: krzk@kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, stable@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Kevin Curtis <kevin.curtis@farsite.co.uk>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:15, <krzk@kernel.org> wrote:
>
>
> On Wed, 16 Sep 2026 14:31:18 +0800, Guangshuo Li wrote:
> > fst_add_one() calls pci_enable_device() to enable the PCI device. The
> > probe failure paths call pci_disable_device() to release the matching
> > enable reference, but fst_remove_one() does not disable the device
> > after a successful probe.
> >
> > As a result, the PCI device enable reference remains unbalanced after
> > the driver is removed.
> >
> > Call pci_disable_device() after the existing interrupt, tasklet,
> > mapping, DMA and PCI region cleanup to release the enable reference.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/net/wan/farsync.c | 1 +
> >  1 file changed, 1 insertion(+)
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
