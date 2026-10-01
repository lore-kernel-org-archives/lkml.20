Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1344FD786
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868561; cv=none; b=ZxAhvUgi2rc9VHhDw7wNXMe5oSMN7L3AeqA4ugakpRPSEZz7/cIoPlBJZy0F18PWgBJOAiK9gM1EjP+JEpEjjbpafGixmPP/x97MFOJQr0drUSgtrmJmUwNrTbi5Ll096o1iqfGFwrpy/kjBJ+IBS2yzBA+g+WQIyC5Rd3suchA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868561; c=relaxed/simple;
	bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=m5BuwDeed+4EC3LPMWjWQ3dPrHY5ktMMpSGSx+oH/YCbRQDMwnlyPx9zGC8slEBSHHEEC16CzHuM0HQs6LK32Sz09TMgLd6kQCLhsXQCIsujm3h/CPFVA96JuDIW57u2YFHICze+A8CQ6nrnWCZBwYQP75Ivx6K8+OkkVQms4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKeYTXWe; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKeYTXWe"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso3858426a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790868559; x=1791473359; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
        b=AKeYTXWeEulecjEjHmxeDojxgQ7XkZPAKZ1NuLJ2IUqW8x3rRNgWUYk4vQu2wGAcS2
         GdhIU/573/kuHL0tHeVyi3Hn0pIC3LeJaCvKnaMxkgOqO38aP0WRujPBUXrnomI795ap
         9wJOsbaiZelHoKOpEEqNlUAn27ihQRjgCK5b4g0HiitKPlb+69McpZebK7QuadWi5oRQ
         xwqLMSKjX1SWBsjPnFGSLZJsNgMPoCDbxQqHOt0TPIMlbzAq11+mPU3AheXXW6krW6DV
         WOXOy8ZLS+SfEnC6hUbXi3qqkOIWIf6TfZ9BJOg9XjhiClA9TX1TFKSccxMuLOrT1T+4
         OgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868559; x=1791473359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
        b=FeLWNfafiXstL0exu1w7tqBWYCXD6bcHvhhL1Uaq3aEaE5ZpRoaA8loURHXNw690Aj
         hcqiAN9SCm5X2afUDAGzO4oc0dcjYnYYUpgns1Uo2aFPmCmLlkD7E9Nw/qneOYKNXYnF
         Y13bpXYlCEG/BG65su6sxPqo8WsF2qSEFdHbXbM6S8nH/+cdS8x+oiaUmXZOJQJtHDx5
         NYl3zASosbzNNjmZCzEOBUNWxSPVU1S7reaQPaZzGSrTgfHw+MUbI/W/Ai3YcpJx7kyk
         Cp7BVQuGK8pd6yXxJFnfijNCp2Hwc915TkN2564M60Pg+cr6FhNAGpLhJdUFMPqP5z2U
         q5cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU/8Fo6BgJjhXxqysHqakOHfNw7Se+cL9cURHAarL12+mfMQmSHTXdmG5Xxtt7xcHh1jTqKSIT2Eo2jyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVyIi65euNlye9a9gFBEFS2sJw5sq73GPpnhvPTru+i7U6VxPv
	u8o/fgfZbYGf3zIxxsAL27m8jIyWJahiF3YFRRNJJ8YoKuaaG5s7qeEI
X-Gm-Gg: AYBFou2vejExPev2YR8JReVM9OoxLw9g7zBUrYtDgokWVTmL7Z8Ev3NyY+boIwSZky5
	/EV4qH+5S6JjUFIpgpHHSRlNd/Igsdmal+iVDTjV4ozwgR/6gvSqGDlXXVZplHRLJECN6EK1BCo
	+ls4UcdprPw3fz/2uj98uNwLfN6gMpngYdq9M8AmDh4wMZaLzBSy3xV4dpSZgSbRTN4OQlbx8AQ
	gYBwWAIJl/bajcSt+Auy4MsUo+5GkYi9cd6mEGlltAfP/5nhNOlSwtUqdItX5uQ5P6B1fWuUVDu
	0WVsxsAbFS11RDbq6fdLn1rsr1Ouja8jE6hb46P/yNva5oIzTq8PpSdCcbmE1hqsX5sNx3WyfAe
	E/FnTshPqdExelbOWUkLmnfWi4gF0d/L5a0OAdyyusixZPT5mnC5HimKu0Gm44o4+YYK8ED6roW
	/lbAOMKeUuPRe8iZz9FPgqkjs3SD7LE0ta2CrkoCiWUq3uXoPfB1WarP8yIX1gEzijFDgmDtnRl
	+TrCEMYEccuX9s=
X-Received: by 2002:a17:90b:5787:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a50364340fmr1885074a91.31.1790868559126;
        Thu, 01 Oct 2026 08:29:19 -0700 (PDT)
Received: from smtpclient.apple ([5.34.220.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f75a7f87sm1694927a91.3.2026.10.01.08.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:29:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
From: Eric Lee <eric.lee0305@gmail.com>
In-Reply-To: <2026100121-chirpy-stomp-9fbe@gregkh>
Date: Thu, 1 Oct 2026 23:28:57 +0800
Cc: Hungyu Lin <dennylin0707@gmail.com>,
 Andrei Khomenkov <khomenkov@mailbox.org>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 Ethan Tidmore <ethantidmore06@gmail.com>,
 Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
 SeungJu Cheon <suunj1331@gmail.com>,
 Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
 Jennifer Guo <guojy.bj@gmail.com>,
 linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Eric LI (Honggang)" <eric.lee0305@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4EEF5A3-75CF-4A4B-98CB-2EDEE2223C81@gmail.com>
References: <20260924151606.333467-1-eric.lee0305@gmail.com>
 <2026100121-chirpy-stomp-9fbe@gregkh>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> Refactor it how?

The previous code handled two cases in one branch
- pxmitbuf is null, or
- pxmitbuf is not null, but is not enough for current pframe.

That causes an additional check of pxmitbuf in that branch.
In my refactoring, I split them.

Firstly, handle the second case. In this case, pxmitbuf is either
enqueued on pending_xmitbuf_queue, or released. In either way,
pxmitbuf is not owning that xmitbuf anymore.

Next, handle the first case. In this case, a new xmitbuf is
allocated for the current pframe.

Setting pxmitbuf to NULL in the second case in order to make sure
allocating a new xmitbuf for the pframe.


On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> And is the output the same before/after?

The logic is not changed so the output are same.


On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> > + pxmitbuf =3D NULL;

> This jumped out at me, why add this new line?

Two reasons to add this line:
1. pxmitbuf is not owning that xmitbuf anymore as it is either enqueued
on pending_xmitbuf_queue, or released.
2. a new xmitbuf is expected to be allocated for the current pframe.

So, it is safe to set pxmitbuf to NULL here, and it ensures
a new xmitbuf is allocated for the pframe.=
