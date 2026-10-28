Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793147976;
	b=G3vZ7E5Eav/LIcdhgo1POQPLfBheXUXqyj4Zs6/4bGSA9DID0B4ThhYF3RPMwIJgXa/y
	 WuNrEbxACIX0qYZPiN/ZUfe81tEzq5L46OARct1qoLvniEeFVSdY45upNLKMiejTsClu3
	 n1s19EiNCtR1UOtwHT9s6I8aPjUqViCNY9+HUQ04V3PX3tzrF7pZDZqvSXTRS2OvIjmiZ
	 DZFWHWOT27zxxl8djlshrtLr8EcKnwkEtT1/M39xho4/bsuNodgGCGHfrQ80l+AeM56qt
	 TSSHKkETqI4orQDgxPf0VLO5R8d7V92bdaZ7I2Wi5OO88VWvvJ3iyJndq8Xv6+RKGPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8OqtLfhC5NDfUpetxWQFi4TMteqAlcr0nsRIqZjX4g4=;
	b=ni5LQaj0+k2NaNUL72xudSvRf0WtmRMUUqnVC3X+nJhwdjdM53rBsvlQT8wdCnmKVWyS
	 zDagvK0IIWW04ncOt45Kh7Aa1QuuftXYr+v+KiK+aJEzR2FWzRw0j+3qcasuOR6TJh4ZQ
	 mBEQMywvJi+xQxxRvSHyvihp33H+evExBxRxbzEGVr4Y2gwrC4QUvZ/GUDL8BMBHW+tzH
	 1EzsBlul8Dgx2spq0gJtq3+Tcwe8dDfWQZiNgBuZM0A6ahI6bgtW36nwVwWixR59B1z4q
	 IAgwZ8YJl0AsUrcVTmOgeDNNackUztcYI0rYDqNVAA0uasv6ebwR2m4UArNaEwFPWmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFO3a1Ao;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D4606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527D4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFO3a1Ao
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3ab2a40750fso2052311fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793147974; cv=none;
        d=google.com; s=arc-20260327;
        b=p87hPijPmp1kMX862eMQGr+D7PMcNQ7IUwU1QmFC5tazaGz3EycSDK/0M1mDTapmKS
         FEpxrQyp+CWTMmZGwhkulibhVLS6QYzw9FcAtfN3bN4TZQ4bZnbY2H/wC9GG0Zl8NOZE
         drGzSst9vQYT30fiQBLelULLdqt5kZvqfKuiR655BMjFJW+AsZ+M6VcO6VWMRSU25Dis
         iQ46jUtwXHt8cO6bbPkh2/nvFZwSkX63P0IK/bJdGPq/Z1nyO3PtafFspythenukb55K
         1DcEvlUO+2WyIy1pwRcasbS/MHvbJNFDvwOBKHh3SW6Sw2/0C5+GdMfCege4Frr8f9tt
         Udlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OqtLfhC5NDfUpetxWQFi4TMteqAlcr0nsRIqZjX4g4=;
        fh=NhsZJRvLYr7Aigj0pW6iUs8QD5emUzoKUQk7Qeh/cro=;
        b=OuGwkBv2ok+yNPQlTIXZRdWpA+F+jM5FrQRWKVA+uJvhwEaxZpTPZ8rxsioxzP9nl0
         emJaJq/WinHV1Qq0FcmHT/7su5elBPef3V7kmGz3ftylGBt36U8w2nS7IBBJN3TGw+Ly
         ZjEp57IiictVN92m1rf2X0pe8raUgz1/uIdasZz64MFBn4++KanGMkOKAAbTua0uClVu
         M1U0vOj0aNCTNooW82hPCzF3cihZGJeeJADOWgEb5ZQwdXxXyElXuPW5QtMP0Hf5/J0j
         ctXDxIlTlUeD/NTjtKvJ7rL1xQShkb3CLQ/ztL/YxHSbqXqtUnm+0yx3qCENmbG02wm3
         lOnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793147974; x=1793752774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OqtLfhC5NDfUpetxWQFi4TMteqAlcr0nsRIqZjX4g4=;
        b=RFO3a1AoMwSAMGUn0ipnKS245KWkzrFi7JccukXkZSKbCV2FJZdfELUGjqu2ntW5pv
         7UfFwxBvRm/99P6njkfACglFNdbskR9/uOQoKvEz3mXe80tLgtT3XsuqEM8GsF/t4uuY
         mtBWIGByGhILMpphL/h/sVekBP1oYGMJkZN9l4UhPpEjRDVWaRmrp/tNchE9Mxd5BRAp
         PnPb3XlyKBke9YqSz7khBIYeSD4I//qv/RoBn5vs6sRuKCkd7H9rBeKYMd4H5yGq2B+E
         c8fa1LKYR3GDOA8OWFT2ePSqW/JXjrkMYQqhzUfThSatnDzWd2b2qzA5TVPDYtKp5Bad
         7Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147974; x=1793752774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OqtLfhC5NDfUpetxWQFi4TMteqAlcr0nsRIqZjX4g4=;
        b=b4WCmJwlZvI66iNt6dlaOLtp2FO03dq9Ni7bJh/mNmVx2vAVcqJxlUtNFxa9ap9DCU
         rX7lfMoZH1D7i5YRJFEhWZ8G2OlS6yNOjQv3rZUWyQAAtSgyPGT7pjqpYdB2cWyLCfY0
         l+kY2Yg0asZG0cpBeORgz7E9PBd387AJRsQW3KnvtkWUlya8Wust3/BXRC8YIqmHRlPf
         p2A/VENlKiWi+ERHjM5AUx8JFcho/Wh/mVGp4I0GPRDx6vNYOSBHm5qlc3+jJvU4yGuo
         kmAoSqRRSikWML57lPwaDuHLivnmnTCtLWopnUxS2+7tWXuHSBDu9MUoZQcqozYqDqnA
         cIaA==
X-Forwarded-Encrypted: i=1; AKwUvBw/uJQm+oHxiiN21c9oFDDP94Yq+lPg7KP97BXQIQFA88G3kGIXFOeISF+t68BgtpqK/UVMhEPdHLWvYMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmDNSJS6Grvr/WEmrHN0pfJpwqyJ/oYqadv7nlr5tOtgWoM5xE
	pp2kmloER6zQ3E/ph+cHn3rlvGF9O/Fc1exxJX5dsZBoB1362Kk12KRrnK2A42dsexGRRBXtzG5
	R+2UCYjP+kSZnNynZ+3cow+ZLqqG0rPEcSyUCysJgA78RwuVY3g==
X-Gm-Gg: AYBFou3lbG0052yaFwvBl5IGwaagE9yW9CpQahFcYpsUJM2fTq35AUXUOcdoqxjxY51
	Ur9DUXRfX9hRLMcWCZEtWdVFW2VmH2p4SwCwnQdv9pDwiSRcWvwyVkHq2O4ZK3zqeAsXByvdS4y
	ywF9NvpFgCavlP9TERkBc/Im1yhW8WPiUmq3LbKQZ9qF84e6UG6N/7ZFvpB+7BqqA48EC84ZdCT
	saaVbMcyNATEwfR8ufCT4U7IbDn9BDaUtPKXLR71ujvSQTbUH/Hc6fSdrWNR0cX1BNCGroRZPgK
	n1uQtIXk9hEZ2dNAsDdRNbHyI9VgkBkvJXsL7ol1doPjgv9f68jc0NRmTwkE2vkX3P1YjXRpf1O
	QbG3qfop8IA9DoC9l71ste41HATRqT6XNIxw=
X-Received: by 2002:a05:651c:b13:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3ac9ce3b95emr1270841fa.3.1793147974231; Tue, 27 Oct 2026
 17:39:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ25PZ5BM+83Vk8t5NUY3ksLGz5nzONrncipu2_MZhFSsg@mail.gmail.com>
 <auDbrRoBQaxWnsE9@cronus.toxiclabs.cc>
In-Reply-To: <auDbrRoBQaxWnsE9@cronus.toxiclabs.cc>
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Wed, 28 Oct 2026 08:39:21 +0800
X-Gm-Features: AclHuK8n1C-HN8_ZSqYd3c-5v_SbdRi2BLHY-p8qUXbEBdTX9Lw1BbEHIxvDUvw
Message-ID: <CAO-4RZ1TTQRRS-LfJHogu5Sgjw7brWbjJUza8dv-At-OLW_mKw@mail.gmail.com>
Subject: Re: [BUG] xfs: undersized log triggers assertion in xfs_log_mount()
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

Thanks for the clarification. I am running syzkaller in isolated QEMU
guests for kernel testing, rather than using this configuration on a
production system.

I understand now that the fatal assertion is expected with
CONFIG_XFS_ASSERT_FATAL enabled. My intention was to check whether
this particular assertion on malformed filesystem input indicated
an issue worth investigating.

Your explanation answers my question. Thanks for your time.

Best regards,
Zheng Zheng

On Wed, Oct 28, 2026 at 1:32=E2=80=AFAM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Wed, Oct 28, 2026 at 01:00:54AM +0800, =E9=93=AE wrote:
> > Hi Carlos,
> >
> > Executing the stored syzkaller testcases on Linux 7.3.0 ultimately trig=
gers
> > an assertion in xfs_log_mount():
> >
> >   XFS (loop0): AAIEEE! Log failed size checks. Abort!
> >   XFS: Assertion failed: 0, file: fs/xfs/xfs_log.c, line: 597
> >   kernel BUG at fs/xfs/xfs_message.c:102!
> >   ...
> >   xfs_log_mount+0x4e3/0x590
> >   xfs_mountfs+0x10b9/0x2270
> >   xfs_fs_fill_super+0x15cc/0x20b0
> >   ...
> >   Kernel panic - not syncing: Fatal exception
> >
> > The log size check reports 516 blocks, below the required minimum of
> > 636 blocks.
> >
> > Is this an expected assertion with my XFS debug configuration, or shoul=
d
> > this malformed image be rejected without triggering a kernel BUG?
>
> You have bug_on_assert set on your system, so yes, this is intended. If
> you don't want to panic() the machine there, you need to disable it on
> sysfs, but...
>
> > Questions
> > ---------
> > - Is triggering a fatal assertion for an undersized V5 log intentional
> >   with CONFIG_XFS_DEBUG=3Dy and CONFIG_XFS_ASSERT_FATAL=3Dy, or should =
this
> >   case return -EINVAL without triggering a BUG?
>
> The config you have enable explicitly says asserts are fatal. I'm not
> sure if I misunderstood you or you misunderstood the configuration
> option.
>
>
> > - If a diagnostic dump would help, what state should be printed before =
the
> >   assertion so the malformed image/log geometry can be identified?
>
> You are running a kernel configured with debug configuration that are
> meant to crash the system when some issue is found. Those are
> configuration settings used for development and debug purposes, not to
> use on a production or semi-production system.
>
> Cheers,
> Carlos
