Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792652143;
	b=CysdVUn6XFWZzwgfpmq/XdAdhroztktSaDU6KIi2XdUiwEQNHLalqG4k/kbpd1YwNesb
	 0XI8uwYgeHwdwcJ3wum48popTZkcMI1awOttconwW13jU1vbFTosebaxAQPc5aUr+9WUM
	 5OnYrb5x2ZRDebqXkRth2HoUoVGQB5guOR9rwVkUZFl2w5uwful0HVzWYxDhtfsmWGwqg
	 OYYKtelNWvwnX4nIvl25T0MGLZaeyEmUz+LSzKwbovMGy2nYRJ72TX9DibDJLX2uXOYQh
	 PghYGxswUthb8A+gS87gnTTGGNU+Bok79UiAQr/Iwgj2zaMc2nmMw+iOBhD4Ud29MeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+qOAfSouOX0t5YZwWU2eSWaqspMZR2wrvfeU+oUpg14=;
	b=bLgY5h2QGUFd3BK+ec/mTlu0Ww0SfBFJ9wnMiuP3/MpcfLJfBRCAX6E3aH3Z59ja/BUq
	 sg/t4A/t0PmzoORgciDafDOp3EL9zD/DC+YYOLHwfLBaKrAhNT6qCQMqAmfuctlEqpIzT
	 ezJu736KTds+bmOGBc3dzDod8BmQtlZ2vUvxtWc/sFKxCGFUVSJwScCwrf68gmCfnvs37
	 Bt/MutW5rwIGrGrtwDHF5enIvgeiA2d1GsUh0trtkZZx5jvzyhp9F6g9HztCgZewpbKNQ
	 QBds3+2/bJgeSK/sX2DNCDJQFioJ4OYRRKp0OFI/pdIl/O1PFgKjCD0B5b4S2Wtk34w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WXOt2KSl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WXOt2KSl
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f55a53898cso733063b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792652142; cv=none;
        d=google.com; s=arc-20260327;
        b=pZgtFloZ+FpDu0oPWxp2URG9/ZkVQVGLBg86v5EJohioLGOq32YLIPnV1h5qydM/+T
         LCc7pFS1n0WZ3RMXaG3AU/9LxB30DKIAKyvsEO1yJOPj0kNSUo1o65gFCAA3iyu15zvY
         vkfq+oYd3+S8aCsrBLsIq6i4fEt6q6Cp4VHqnrhQiif1AVW23Sh/fGs4KZddk7NLwyD3
         tjEfJc6ZEHckTKeAyP3BOWAzEThfPE82rjGgVy+CHe1UtQ8qDnXVCdLscX2X/jBG2Vmq
         q4wnWiYDjh322mRKRjc+Lo0Iu/0iDqFWeOzPZ5K4vE4wrJKcxONH1CGJHYCeQjphNNKy
         1b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+qOAfSouOX0t5YZwWU2eSWaqspMZR2wrvfeU+oUpg14=;
        fh=ndXzLafnsLD1hFMrF07lsM7R+jrCftWGTgmkUZbi2ww=;
        b=eAN5AGC6KxaS7QJy309QEUNjI5NgUNOiUD5kewjxGDUTWomthVPuuK9Q2MBNiBxuQb
         jkqlOmBXFSKmdFWbfl10jbW3/zo/NdwjaLN+1f0G6cumE74EznfnabSxcn0d2Axeg1dY
         diOvvpBAlip3SI5h2gbvNchqGYyORA8izjAooneDrpk3S0L9U4Bfo8JH/vNaCf3iPyhD
         KRk9T3l6ChCgL69lIaSzd9OoVQSIxdVu0FAPCHmuJ715tW1RulSsDomyvS8WaahQUSEP
         RkhW0N68/cwfuZdP5/UBvYbm6aBHczmIBmf57Tz0283hDeg+JMBezjwJVnhZY9BRW885
         GwJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652142; x=1793256942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+qOAfSouOX0t5YZwWU2eSWaqspMZR2wrvfeU+oUpg14=;
        b=WXOt2KSlIEx9UYc1uslEROz+hHZnlOEeHWnCzrBw59/M9zikfXJincp7fSqdCiP64e
         0AsgHWZUi+u8AFnL5GBv8ugm4B05v9sv/0eUxU5lurXBt7wyhniyT8Y4jBIUJgS097n1
         JtOhJGYOorBMxsZlR7qiMSQTmSeHrSkL5780k2OHgpEPX4RsPvEP/EpYvQ7AWdoifbLa
         iG3RhqzRcwqiwTVbSsfkZz8ApDLU/nJI3hT25h+ElUTcuKqnkp+JcSTri//SQuTh4Cs7
         tfYoY6Ngy7LQe9nn07r8QugwjLGz4evJxsgAxqr+BAW3DAqhP6bzuVk0ZpOR+vjxjlnB
         EjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652142; x=1793256942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qOAfSouOX0t5YZwWU2eSWaqspMZR2wrvfeU+oUpg14=;
        b=pU0LTbTpxxPTwHJHvwq5ztSSz+DN2eASdDhjcUjnuyH6EXt+n4lCMKXUWAMTaymwHG
         4dxYSRaqIAzDQM8u9QmLtRPZmOSlFxJWEANbLYWCyEMCOK0u43N1rgmlzUtrO1VeBi25
         cogw/30fYmUUpZF+he+dwKTxZbRjQqoV/uLMrrHcXeZQe9n5gImVazvBFO+m97jIGSIL
         aFSPCASxfpetr6zk1zXQsmc/5Va6lQKWMom0lw+I/P3hcYi75UaL4+I9ya0jJk3KdQEP
         H6eGrggtbPRg4KKa3RAyGsKZLJIEwSQ+g9sAdns8HgfMepP5sgrzU3WMgp8YVJQ/Sjfz
         Rt+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5Yg1WszDfhbhsrB+nf40tLYxSN+zQCh/6XW83AYwzoIECUN7Li2GUEpxiO9lADYH15eGEfDZl6qHgdts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsb08087Q3MoHLhcS5N/NyY7vGu9MJXrbF2TkayHfz/VRzeGJ0
	TcZ7deSB3hyfHi3rMB6oD3J8crgiQSlDnAgrze/Ex4yTIsGxuFW9E2RpgscgqUTh04317JUAEpO
	+39YDVPgW2o+bwWo9gCeQ9pTyfN2NTEU=
X-Gm-Gg: AYBFou1CkjAItFF3uZkGgODSXEQpeLhMSH+GFKa2m53551Y+QTH3lKVh2KJeuLfH01C
	DXg3/rifoUToBrys6aQVzF7A1+vW9lj9dkGWcqKBQgfSfBsKXcAGEefC3RKsk222673tHtlRrBA
	T8mtKb1U5JzTJfgb4sgP4q1iz6npnMWXvERZTDl/eTAm5Vc801Z48ae0EPOv75TvHmMdK28d63N
	Xf4dPrKCEdy3y4udFRxO5vdgHFyELZwBX9n9v6Y3URO5MuZZBYQRhDPeeIltK7C1IxQDs7YW9sX
	Hdbtd9/G8I5lqbIssfrs/GFBzNDWc2Okv1CrW5KPchcs3JSnszni75p5xHq5GnNsUI2LUA/37TI
	0wJ6Jmkeh8MNa1y5+J4tvTyJ7xefHG/n2EGKQAZFF+jt0HO00QlTMRbxhSkBYYWbl0OwGMwkEBb
	xuuldCgr+8GAy81g==
X-Received: by 2002:a05:6808:d4c:b0:4f5:e13:95e2 with SMTP id
 5614622812f47-5534f511f07mr3092508b6e.9.1792652142362; Wed, 21 Oct 2026
 23:55:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002152821.410591-1-yupeng0921@gmail.com> <CAG3TDc1Ydhjx1GD7-ZCqmzYbZv5+DM0O7wPnzKLWJ1ycK9C2sQ@mail.gmail.com>
 <66f87058e7e811af340d920e654117eb@kernel.org>
In-Reply-To: <66f87058e7e811af340d920e654117eb@kernel.org>
From: peng yu <yupeng0921@gmail.com>
Date: Wed, 21 Oct 2026 23:55:30 -0700
X-Gm-Features: AclHuK8Sypv-7xRYs_lPJ7h3Nm6lMdPqTsjMnjk1hM_VRIlE-PXSuRDM8lifbow
Message-ID: <CAG3TDc1BgQNuCD75NTCcpmP_d4aLummSP6AN6JuxoAgeEBfmFw@mail.gmail.com>
Subject: Re: [PATCH v8] nvmet: add cgroup_id to charge namespace I/O to a cgroup
To: Tejun Heo <tj@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Keith Busch <kbusch@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Maurizio Lombardi <mlombard@arkamax.eu>, cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:57=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Peng.
>
> On Tue, Oct 20, 2026 at 06:01:12PM -0700, peng yu wrote:
> > Hi Tejun, does this patch look good from the cgroup perspective?
>
> From the cgroup core side, this looks okay to me. However, the current
> implementation will block the shared submitter when throttled, and it
> would probably need more work to behave well.

Currently the io.max won't block the shared submitters but io.cost and
io.latency will. If a nvmet subsystem has two namespaces, one namespace is
blocked by the io.cost or io.latency, the IOs of another namesapce will be
blocked too. I plan to create a v9 patch, if a namespace has a cgroup, it
will submit the IOs via the nvmet_wq, then this namespaces won't impact eac=
h
other. If it is not the correct way, please let me know.


> Thanks.
>
> --
> tejun
