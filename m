Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F593264E7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424311; cv=pass; b=EWZYN5zpPYbrTPBIVU9AjsoTSicvW0cYV+OABfL0jQFf0fon86kTa1jMw9ZqdR2dz/h55/XaHn2WuqIBscFhrFpf3A+N8bbC6bvwd+EgGJYpR0z/bYVokTTG0xCWzwmRakpwK1o+CX4afkNQWzt+eAYgr0lZm7P6sZP3hIhOPqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424311; c=relaxed/simple;
	bh=mHy1hYNfLYf8HboALp2RXqTAvR4x9VzZDrNkBtBzrj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZ0ugL3AF/bJ5KPAa+zyRLg/WvNuR9Skyjm+h4ZMsMOef9bzLbazSxP5nDFeO332KJEfsibG+yRWVgZhEnUbv4EnoWxZ2FzS2WlzmEr9dNxHwYF3O7E6jtLlnzQnKiZjpKG4QrcNxp430mReCnRDubIu6cq/s7K/IlPuMBIZuWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpVb5+zF; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpVb5+zF"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so18743471fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791424308; cv=none;
        d=google.com; s=arc-20260327;
        b=Od3CXo2nTCZUH7NWIRM0uCgw7hyL+qy418sRPL1/8tTOXxX2VKPujKyfaDRSF0+NTE
         iYTj+AvMcNPN/irW5TNrIUOm0Ohr5Ca8/wURytjrSI4wzajk4+zRqpuvbWwV7hVZ95i0
         lAC0Yepc8MzH7XQDG18+wAIOXIBf84ER17r8QQDVdEqN+9w8EoSWTAI6V+/z6tYU+9QR
         BwRJvxY2DUf2eXeI+z5Ta8M7mwl57c5gf7THpS/8dmi1qFfEzxxby9CIPDyn4Xm1qjhX
         n4MVOHBUad59yJvsZNVSzecj5ph/z23qg6YINghp2QheIuP8CTTgWc4v455hDqjpYROU
         sfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        fh=EvN4Ep2owLJIh5+cma6q1sBlce+L2AFCJVstOr1/blI=;
        b=U8Cu+ECnJLY3rZKcYPgChOhr81SNguk0fEoNOWjCEmksjWmKDUHHDvF2fJtPVCEKWB
         rE+y3NRZlWJUjAICaqlOLWlwD3+4Qff/VmQpCdR3oYEeI6KcIRrJFWZ52ZSuFJhp3Qdl
         uKfrNMO62WfcrFJlTEB6X1fIEfuslEBgeaLpAQwmEJcmb1myJ+Ee0cUhIi1NbWj/1uQU
         Z1tt6SUYKtmMO50/EgGjkU7xO6OHCqfFtasSa69azcwSITPBdeR60guYHCL3W/l+aBRZ
         LLJyhWGSj+p29/L4BAnIs9KJFrNgWlAyw8W7bm2nAhzwsi4d6Pi8F8hT4gbYABkWvWob
         /sLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791424308; x=1792029108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        b=EpVb5+zFuMnwzfKlWr9fCa6Pu/DmtTmaF8kEtx6rZi5xvVIqSHvYX4coYUu3j6EDzP
         STf1rEjbY/D4IZdQoneYf98dmi6WgsRh18xIvLOS24QkBviXjvmqy/+sLOebbm0OhP33
         7Do5bt4QHv0oO1x2mIZRTnjeI141k9PLJig1WnoUpGoMas4C5zJ+rddg0f23oRFSBEGe
         1MEQiFuyiicuzn9V1svDlnr4G0jqCMJQJKFAydaEEdA6AfJeRHM0jO74Nrv8HXl0O8gl
         +kU7061AdP03BocmIrWANDbrbxQdLhQqgapOMQEpsN9tIWpjfAj/f7tZ86BpOjIL9WQ3
         W1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424308; x=1792029108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        b=re48c/ZwALYyxLjyjlPaayoCXxxBCF8QKPF8XaXEYhHVqBBWLuwRBd87rhQW2GX7Ov
         Q3UGitgQNuqAxBpJEgCfj7QJYQbe6y7ARGJIvp7rdMRCLqAeAvpEGPnPWZo8VAxc9Qnu
         nMNuSB5tmpO6Tcwr9S/zdxcdlyM9zpeyVlfMyxDL0U+d6ULWR6AmwtPQP+rOt9e8VNlN
         9aYvCdyJ/5YByO3HDAypJ2n++KSLMB8NTWAscVzADWueUDooog4OFQPrYYtZ7JNvbcbs
         Q+SbKq50LT3p8edR/YQBYIoVbCPPAwWoYSRJTqmmEoGeBVvNBVaKMLk6KUMjUAxaTZBR
         ZLzg==
X-Forwarded-Encrypted: i=1; AKwUvBxYKy+mnI0ukNpcZxgo0yAoPXT9onorDwHohMjGVsZofGrQAhhO+E3jyYhaPnLHv4FthAqetmdHEEvhQE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXKOadOccPVMENgj6aoxcN5stzerzwmpMprix4dJWtcUgra7Y1
	XyeoqQuIFHYIqpDH8DSmx+f81K/TSMJnu4zNymb+HoLOcM0+XAMhPiBmSN/bj/ePwxG4svxntk0
	r92Z/XqI/xfDc8cN/4KxmPSeiJzfhgT0=
X-Gm-Gg: AYBFou0rDksfYwodGDbMHZliqMtRnJhYJJUribpOdCfDQ9XyDfa5+olZ6Dx2y1q1D1R
	H26E359G91jwG+3L9hFL5a/fPWvkxQlm41A3NzC0LcfaZxcs3rliTqrc+dnBGwPuv3KgAxKkBjV
	VtuUZzsjEFwTMGmS7iPHDM2HcPVr+k7OxQFTYQHfo3eoNFoTQjZouTT1X75dFCIOJuZI9xTwSti
	xEf/ln91kvEHH0GCZfNqTsytzLwHFdVRC9jJFVf/RanBOs8Ubf731K6JPBdYZxo2KQO3pT28eOB
	GoeAUBb6pve/Ns5dC1F1XpfIz3tJDdEngtuV5piCPeA2VNTqiR3JrgBRjn+a0lNUhT0vTPE=
X-Received: by 2002:a05:651c:a212:10b0:3a9:9f8b:7911 with SMTP id
 38308e7fff4ca-3a9a2d30c3bmr6229221fa.28.1791424307884; Wed, 07 Oct 2026
 18:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929064742.576651-1-liushike123@gmail.com>
 <179066487225.31693.13001631968601791232@kernel.org> <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
 <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
In-Reply-To: <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
From: shike liu <liushike123@gmail.com>
Date: Thu, 8 Oct 2026 09:51:36 +0800
X-Gm-Features: AclHuK8_27azU1CeyvfqOiVJ6y7v9RzdtGB-k40TFQNVY_vcIlwqkH_ABsVJ3XM
Message-ID: <CAL9mPHut_XjQMQpq0L8tuTs6D2oZwbgDE3VkFbY1fXG_n8H5qw@mail.gmail.com>
Subject: Re: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jmaloy@redhat.com, tung.quang.nguyen@est.tech, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

  I would like to clarify the next step for this RFC series.

  The issue was observed on actual network devices operating in a
  cluster. I have provided the discovery background in this thread.
  The same selftest produced 8 passes and 10 failures on the unmodified
  base, and all 18 tests passed with the series applied.

  I have not received technical feedback on the approach yet. Since
  this fixes an observed connection setup failure, would net be the
  preferred target rather than net-next?

  I have not yet reliably identified the original introducing commit
  for a Fixes tag. I would appreciate guidance on that point and on
  whether to proceed with a non-RFC submission.

  Regards,
  liushike

shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 10:08=E5=86=99=E9=81=93=EF=BC=9A
>
> The issue was first observed on actual network devices operating in a
>   cluster. The client was waiting in connect() for the server to accept t=
he
>   connection. When contact with the peer node was lost, the pending
>   connect did not return promptly and instead continued waiting for its
>   connection timeout.
>
>   I subsequently investigated the TIPC connection setup and node-loss
>   paths with LLM assistance. The analysis showed that pending connects
>   were not registered in the peer node's conn_sks list, so
>   node_lost_contact() did not notify them. The initial report came from
>   the observed device failure, rather than an LLM or static-analysis scan=
.
>
>   I then reproduced the behavior using the same final selftest on the
>   unmodified base kernel and on that base with this series applied, in
>   x86_64 QEMU/KVM guests. The tests use two network namespaces connected
>   by veth pairs and disable TIPC Ethernet bearers to simulate loss of
>   connectivity.
>
>   On the unmodified kernel, 8 tests passed and 10 failed. With the series
>   applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET.
>   The node-loss cases check completion within two seconds and the
>   expected EHOSTUNREACH error.
>
>   I will include this discovery background in the commit message if a
>   revised series is needed. I am not reposting the series solely for this
>   clarification.
>
>   Regards,
>   liushike
>
> shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> >   > - How the issue was discovered, e.g. hit in production, hit during
> >   >   development, syzbot report, manual code inspection, LLM or static
> >   >   analysis tool scan.
> >
> >   The issue was first observed on actual network devices operating in a
> >   cluster. The client was waiting in connect() for the server to accept=
 the
> >   connection. When contact with the peer node was lost, the pending
> >   connect did not return promptly and instead continued waiting for its
> >   connection timeout.
> >
> >   I subsequently investigated the TIPC connection setup and node-loss
> >   paths with LLM assistance. The analysis showed that pending connects
> >   were not registered in the peer node's conn_sks list, so
> >   node_lost_contact() did not notify them. The initial report came from
> >   the observed device failure, rather than an LLM or static-analysis sc=
an.
> >
> >   I then reproduced the behavior using the same final selftest on the
> >   unmodified base kernel and on that base with this series applied, in
> >   x86_64 QEMU/KVM guests. The tests use two network namespaces connecte=
d
> >   by veth pairs and disable TIPC Ethernet bearers to simulate loss of
> >   connectivity.
> >
> >   On the unmodified kernel, 8 tests passed and 10 failed. With the seri=
es
> >   applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET=
.
> >   The node-loss cases check completion within two seconds and the
> >   expected EHOSTUNREACH error.
> >
> >   I will include this discovery background in the commit message if a
> >   revised series is needed. I am not reposting the series solely for th=
is
> >   clarification.
> >
> >   Regards,
> >   liushike
> >
> > <netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=BA=8C 14:54=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi!
> >>
> >> This is an automated message. This series looks like a fix, but its
> >> commit messages seem to be missing some information:
> >>
> >>  - How the issue was discovered, e.g. hit in production, hit during
> >>    development, syzbot report, manual code inspection, LLM or static
> >>    analysis tool scan.
> >>
> >> Please do not repost the series just to address the above. Instead,
> >> reply to this email with the missing information, so that reviewers
> >> can take it into account. If the series needs another revision for
> >> other reasons, please include the information in the commit messages
> >> then.
> >>
> >> The evaluation is done by an LLM so it may be wrong, if you think
> >> that is the case please reply and explain.
