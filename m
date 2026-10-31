Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412877;
	b=q7EKS1ldPWHMamzm778qA8loqIgoG5fYZeccYpliI7EaXM4XoUVHVfuCFXzqvqfryYAw
	 mYvBZdwjqdln6drWyOZHzbgvGOySe5IZO/Jt7+SxkYy52yfZauqsQsUJBBwzN+hj7On3L
	 3sjuiJhBPo4EArp29FCAR9r9+nkoEM2o+E5b7AvIPStQYPQ9H5L6GGr0qjyl7l+Kctshm
	 jdDf9bmcZchSY30mzLV9RPteiNOMceimpkrcfZY3k5RTRmo/12ZjEzcYndS1BF7en409o
	 IyyZvbDF7+Izk5ZamQXEe4rgjGQ3NjQoqo/BAMoh5IPaC5CgLIfE4TXbLuzU1+KkbhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412877;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f9IKS9zGIIKM7edosOh1a1Wh2JBUsckOYZOYeXHwshk=;
	b=gjqfiuk0oKGMiTnYakpboigWr8ni2k8rPNKrWi753eydwcI3qRg6HwcZyB/tTbHPDeBp
	 MMO38C9HauG+c92/4SFWfoKS9CYFtd9Ga9FJFwETMxO+PbZ4Qhbtt6NRtY5wPLjhfpuDJ
	 8hFpIBtIOxegeh6K2XFQmyDQpwzYTPWAEaSDvNoMT+lTwUNT386u7M/v2as9sDlqKT+AI
	 5xUcYhKYn/WylIZCrSi4LISHoi4gNM1vUsxPuVwkk4RJKj4rWs3BYpQD1O5r1JWI8BFM1
	 CiVUG4ujQoS0+/hVNWTAWpV3MsYSfPvDTPjbeZUHuRg9OJ50LSsTLafdL03J1p1l7xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPjC+gEB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119F606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPjC+gEB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D98B1F00A17
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793412875;
	bh=f9IKS9zGIIKM7edosOh1a1Wh2JBUsckOYZOYeXHwshk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BPjC+gEBbrPZ+w7qFXZpLaTJqAuSMJPCs1rxlfpOIhSgeG5WfO1JJN2DE1xCzT5du
	 fiDsA+4iFwcEik2A+gFokT04BVXuUZytEWP1HkohLWeFkxXUOu1OZWf7LuvhWU1MhB
	 BlZlJBD6+8vRZw+fgWkq1QTBIRPfXaEdzZ9OQH/qjpCATz9bC6qek+t4jojMT+nCxn
	 M79N3QAoFbsRtmyg3WLm/kUB74uU2/XupqCYe+QOOyMUazUkvJJNPDxQafAagaMTZa
	 Q+R1gJNkSH2XccLeRWNS7Khy7zpOlDZZvtLy85P0ej1LG+7LaPZwT+hX6LDSev82Av
	 3VRb7tqawMTdA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4682977f9aso156825066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJ96LEZiEEiyuBBzNrBoK9o+sF47zkQqKOyzVzcFw0sKMJd7LyieT3GRHVOe9yMXrWxV8YSWtuJI13vPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3HgjCGjX6sKpz5CtYtoCuGzihNw/NS3Xe1klPrSJyV2OM5CfS
	oxHgtHAlz+xS5IYOybiAo3+NgBBpTXvnU3ry+6wEFk70UN/GR8KPBme0m+KgYbCrHBQVVdjUolI
	nJsH3FhHmgLSZhVF47rzu/jg9QiiUKX8=
X-Received: by 2002:a17:907:9687:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c4ca73fcb98mr356130366b.0.1793412873726; Fri, 30 Oct 2026
 19:14:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030020523.302085-1-icb@fastmail.org>
In-Reply-To: <20261030020523.302085-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 31 Oct 2026 11:14:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_S5aDNPXTjmkfHG55SvzgCGuYn0ZGfgOesoSB0moMHRA@mail.gmail.com>
X-Gm-Features: AclHuK93r1WSK9NSa1N53nmg9WySXNe5_cwoqELfy2nnxYIHH6q2OIrtxk-tZfE
Message-ID: <CAKYAXd_S5aDNPXTjmkfHG55SvzgCGuYn0ZGfgOesoSB0moMHRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ksmbd: fix DACL evaluation for denies and guest sessions
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:05=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> On an acl_xattr share, smb_check_perm_dacl() has two evaluation errors.
> Patch 1 makes every open evaluate the DACL in order. Today a deny ACE
> that is the first one matching the caller grants every right it does not
> name. Patch 2 stops guest and anonymous sessions from matching
> Authenticated Users ACEs.
>
> The two patches belong together. Each one alone moves some guest results
> the wrong way through the other error. Patch 1 alone lets a guest gather
> rights from Authenticated Users ACEs as it walks the DACL. Patch 2 alone
> can leave an Everyone deny as the first ACE a guest matches, and that
> deny then grants every right it does not name.
>
> With both applied, every combination of one or two allow or deny ACEs
> for the caller, Everyone and Authenticated Users was tested, with
> READ_DATA, WRITE_DATA, WRITE_EA, APPEND_DATA or full access as the mask
> (930 DACLs). Each DACL also ended with an allow ACE giving the owner
> full access. The tests ran as an authenticated user, a guest and an
> anonymous session. Compared with the base, every result that changes
> agrees with ordered evaluation (MS-DTYP 2.5.3.2) and the definition of
> Authenticated Users (MS-DTYP 2.4.2.4), and no result that agreed
> changes.
>
> Both patches carry Cc stable and need to be backported in this order.
>
> Ian Bridges (2):
>   ksmbd: evaluate the DACL in order for requested access
>   ksmbd: exclude guest and anonymous sessions from Authenticated Users
>     ACEs
This patch conflicts with your "[PATCH v2] ksmbd: enforce the DACL
permission check on delete-on-close opens" patch when applied. Can you
check it?
