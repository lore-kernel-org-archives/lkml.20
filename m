Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E23D88FA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533801; cv=pass; b=Rgd9igfx6irHUigAm51rHEOyCV91qYiQSrTsE/4iOFu53Ny7Dm+IM3AbnZgMFqAws0XtDsILyZgvJQzMCV1zIMAYYESCkEZogwdnP/gCeekAU1ljcl9gmw8Md6f+uE293+7M816SKY9+eG/eNErtkN50pDOwM0ZGgMDEJbiZplE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533801; c=relaxed/simple;
	bh=NpIcuZOQQpzUnJT19iUeQsJOL/msQ/TH2ZDF8RC1IVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWEiqrmi3l74SUSJb4FGwN/3cifCw6Bxz2jayxNpkYZInSskIEgSJ2XRptabszQBakefTyaLXEopHxbjq8R6+ycPViZBnySfCl17CbUsKNbZlE3GNRMZhJATPrQYOiB43eH/iUHrgIAzbSzEHcS8SNQsyKgd4x0bBmQMjHxGpOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd5XMitf; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd5XMitf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b06c0794cfso22237867b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791533797; cv=none;
        d=google.com; s=arc-20260327;
        b=FtWgXVCf+XLo/kiV/TMjs+mSccohRccLgCItL5t52FD2B0WtZ3y7P311ZhpJsJwUkb
         06F8Vo/nIehcMB7cbC4GhI7zAPEhOBvHY+tV5FURqaWhwV9nYVRtjGakQsK+L60ndULj
         f5DhzJitpzVTZZqBHQxLZuJvFN+98WFGh0iiHp5YvAVw+2cmfWyIoR5NSUU5N618hdo/
         1x9Lwvhmj7vsI8aJIZvnTJflOjbcUMRmXa/3VV1E3ICcz2Lo6JtuYpnzPbzRo0Gi3IQf
         SbbUAOXZx3hYZl6MfabOrQkAK+RTpR3ePK5u2qR2TbjOq+vsK3EqunpTcuOo4Aj3qNlg
         +d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8vA3N8qc2Td5LxcOddOJwMiY2+zXYj7uffeRIVEV5Q=;
        fh=h1Fz75zRjKg4EQrimkrHc3tKq1RY51uRGlG7JOQ5hzk=;
        b=SD38umIvbxBBno2ofJfvaOmRZFK9EnIgWq/79J4+uXBH2SzCjNj1T9KUU39fIKsyvp
         DAIE13BMSAnRkjSt06jF/ZBR0OQFHb6TnQxZ6cWsRNi+35LhGuBtPMt00Tt4o6gh44/w
         93ZWphRPANlcSc1xK0FBOfvGEV+cKBvG0lAmv2PvKqUPz/MI9CxFDhR9//FIpO82PyhY
         kipQecK5AfnybI0lDLEhYlut40+qtgfN/mPfoC0MsyDp7raUWh0cO++pPbqTYtFqTH9M
         CfDjkeBgp9KkzCZcCo0w4sUQ+e80pWVIOTjyCCJ/ZLcqI3tai9VZY1ty+a9ogttFczRQ
         MxwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791533797; x=1792138597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8vA3N8qc2Td5LxcOddOJwMiY2+zXYj7uffeRIVEV5Q=;
        b=dd5XMitftoxnZKWlAP9VuovuMevKr8qRHbZ7iFr0MiIjKmlqTvGyTRPlr07yjIBNDb
         q4fd6qijxVD1U3OxrwJljCv+YvGccOfJsyviZWFyyhE5q1HU98y6oa6DehFXLLIKrLk8
         9tctwGakXjiaFpopcNidgOQeVRboHQMgA2Gxu4Jl4pql/pbKEGEfBHc5+HvyKlizsz/B
         eA8X6lQvWrxC4b2k/P+l3NI7f27TmX+gkBV1DFjIJsfHRpuiBNqpjtKA3B6iMCs02LIa
         HD8pVUjn3TpbipPCJHbK+wbOE01mW/vj8tY/wVtxs44ioMb8UVZBpzTLkUUrwwHMhXBo
         XxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533797; x=1792138597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8vA3N8qc2Td5LxcOddOJwMiY2+zXYj7uffeRIVEV5Q=;
        b=Y9vQf1bBKz7SGHmrkvUc9rf9KNoSsfRsQzz+dzAM2DZQHUlEmpgc+pzij6vSW+4Vc+
         mE30mnhh8FqsH+AIHcESUJTnzByDOJlW9M4Qscr8W3639VF5eafnkDnHLy44N+B7jZLX
         EY3WxmkWsIhK9X0EnG4TTSvCJCZFrahsQ/HOldSOTzEyE4y4l9i8dsKb9YCJLpiRDDB0
         jnDt/HLuiMfCJKciS/VkNMfh9kbTBFGrpONLy/6vnG4oQ8g76f4x17V6I8RXAhHCr7uO
         nLx3kVdY8yrUXRIS2rQZQLDlW3adT2rWMog1XndGCY+zSqHiKqJ7rmysdFlJiJNx1i3j
         LwRw==
X-Forwarded-Encrypted: i=1; AKwUvByxp04ClQkQUmAr1dc3IfTcdwYOLn8VXzISLePZkyUAPCYQXc5G+jQL4dcmYNiZiu2nrJjR9NA+jPGeRew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz3EBmocrPG0y56FUFfSiWkEBvnk9P/3mE9J0hdaO/0V6M++8p
	d47WAmpydgC12wHLXR0eY9UTvChc4dg+acKXV8cXfr5joqFkciXJDRG2Ci5bddUGZ1IY8HTYrHr
	yaDNc/FB/EK/JeffRPIED/MDjM+Jy/OM=
X-Gm-Gg: AYBFou2GPJdyAb5aooR0MrIPVhU3MCoQAMPZsuEnaqGPth1cxqTttYDGOQasODjmf4g
	Z6rxwaLS6CNGq4FQdKY0CKQmgfWf2xGGaOu9oUtXpyvCdpupF+2Vm4+Df9oTIizi9eB93J+Oysq
	OsfbZMN94HzlUDHDv2QqE0XloBzQ7igm1raXLd1jueIszR+8IkVB45KlQn4eYVUQ9oB/Ujx5VZO
	3WnNqEjwx1tVf4Hmzol93uooIRQhphnFQNxUi/tulOd8MTHq9uh/7FxH7augbbkvfg3tePzTrPu
	iQhf5FTS5JgAsSZ03AqBeb+3ps0cWr1Q6lthnqNt1We0IUIwlYvkFAgF0w==
X-Received: by 2002:a05:690c:6b04:b0:8a5:af04:fb1d with SMTP id
 00721157ae682-8b07eeb39efmr4856347b3.55.1791533797388; Fri, 09 Oct 2026
 01:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ip-core-objects-candidate-0002-v9-1404514d79dd4560c571@gmail.com>
 <CAL4WiirhPWmWCnPLHJVp8vXUvPGo6CQ6HC0ZmaEzYXmP8uZtzA@mail.gmail.com>
In-Reply-To: <CAL4WiirhPWmWCnPLHJVp8vXUvPGo6CQ6HC0ZmaEzYXmP8uZtzA@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 9 Oct 2026 16:16:23 +0800
X-Gm-Features: AclHuK_t-b9OH289lEm9prObkL3pHfGUf9zGubc5FVuGfk9n831yycBW3bIqDD0
Message-ID: <CAFRLqsWNWhVA4k0Ox6yJ284iVAot_E29qr3cb-fNwCug4T=jLg@mail.gmail.com>
Subject: Re: [PATCH net v2] ipv4: prevent in_dev_get() from returning a dead in_device
To: Eric Dumazet <edumazet@kernel.org>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, baul.lee@xbow.com, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Eric Dumazet <edumazet@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=BA=94 14:54=E5=86=99=E9=81=93=EF=BC=9A
>
> This is very confusing.
> The changelog shows only the KASAN splat, which is really not that
> interesting here.
> The refcount_t: addition on 0 warning that must precede it would be
> stronger evidence, as in the IPv6 commit.
>
> So this looks like a modified kernel or something like AI hallucination ?
> Please elaborate
>
> pw-bot: cr

To Answer the robot's questions. I found this issue through
AI-assisted code analysis,
then built a test case to actually triggered it. I were not aware
of Baul's earlier submission at that point. The triggering run first report=
ed:

  ------------[ cut here ]------------
  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0xea/0x110,
CPU#1: ip_core_fixture/498
  CPU: 1 UID: 0 PID: 498 Comm: ip_core_fixture Not tainted
7.2.0-rc5-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
  RIP: 0010:refcount_warn_saturate+0xea/0x110
  Call Trace:
   <TASK>
   inet_netconf_get_devconf+0xcbc/0xe40
   ? __pfx_inet_netconf_get_devconf+0x10/0x10
   rtnetlink_rcv_msg+0x7b9/0xce0
   [...]

Best regards,
Cen Zhang
