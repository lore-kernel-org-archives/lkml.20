Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96A48F843
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415862; cv=pass; b=NU7bpVJ0Wl3e61LSbSXdny6e+UknJtGGXX337B2xm+GJ82fJS4DsN9ssqkiHz2BPDZrpXWB9pIj9vhLPdDrh6YIXYdIrv3Vfy+3VXOpMSQjWUM6zphDdUk92yYG6R246i+Zckl+bJrDbVcXBu6KxNxggxxz1Wgrq7F/5Fb1fgFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415862; c=relaxed/simple;
	bh=mNtjIShgEOpg3NU1cq+Q2V5BZXd/ImLm75jOEBGsIVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dr/APQkQ32TKClO30svrMd9hLfzGRJkXvLfHMKUJWxDQ3Xg9TViyEuy9b6Jo3ufTYkhm++Eq7qd093tfpsxkrYij4/tMVnjlmy582vnZX1E+WWWW5r4DXUsCiat7BHVrYvkQdk4bYVr/2ZBpWLK5OLVk0Bnakz5Iz/adJ3umdEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkFqT3Ei; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkFqT3Ei"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so34668491cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415859; cv=none;
        d=google.com; s=arc-20260327;
        b=ZgzfQcFH7fBVu2VfjvwZjvxd1v/24yR1vvkd6q59F1FHS2spiEK34nYOoJLXZcGT5q
         Y5ReZE4B7CzdUztUqMNiFcO78mLphNVfCWISmUpZMH32fvczyfKmX23X3cCNCmU8gM2E
         zKG3vY2uND399grjK+PJE5bRgizBGoGvxuoGF4q2Ii1LZAJu/t5IH/6KAmZcqiph8F3R
         N2q0kxpF2c6D8lQWMJt1fforfLVWBeaUP5QHeS8knklY/9FP9OVdAiOhfDQrFOYSh8oj
         MCMWhDjEl80YWJw4Uel8iZg0U4fnyStAAjINRQ5/s6AkWeScqP11+W1iz4UVJQxLJr3a
         Lxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhbS15FnZAU+1gYy2dw9ahFXA7LjkCuXe7erg5i5hK0=;
        fh=eayQRW0PT3R2hBduhd3uS10ThYkKb6ue2EfIaK4llbk=;
        b=QMNqUl90gBLZ5Rt2xOcqxDDpu+2yNB6z3vUEoKgrR0CAVxZsgvxoqv71I5yDw+xD87
         1+AbSgJ6gIKZbhOoQBr/TfmRCSVrIvXUZZ8aFIoTOBKeV8ubS7eJ26QrspoaWA16xdRf
         YFPAYuW/ZdrptCtBRVSA0v4hXBeJ/MFYZSpEwixdeMjY3L27Y6LA6vc+U0GUBQtMVUXy
         7qruBFvk6qGemNqjXDVWAImUe+nC8ABaiDlEJHHrfE6s2GlxwKOnYD5NWtFuldZUt/YR
         ka7lamsNPVUkXNMEQqn9RUEzHFEIo4Ase2V8Gi9OA4n8cVFDcMNqE9aoWRxgeIMryk8y
         hanA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789415859; x=1790020659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhbS15FnZAU+1gYy2dw9ahFXA7LjkCuXe7erg5i5hK0=;
        b=lkFqT3Ei3QqrhhPMG1VguvdpUPbDAkbX5SHd0hpu1X5cavODPrasq6Kcw7SiQstNSn
         Xbo9KTRXGTSQ6duy7hQUC/4hHjgJj2wi+L2D/34yzoOi0dvymapiIpuL66M14kNaac1T
         tbIg1M0lt9NxgbaW3OgzkbCqGajEg/7IGJvGrPjEUOTJvdCOxMpe0W1EAzNNZrfdEZCf
         1DWWOTRXYrmP231u/PePqTwh28qJzxhF9xLybdSgxOdn10x2GDm22PT+8fdAc+7BlkW1
         ahCTu0Erw559GD8oM7Mxe1JlZyezr8M4jW4dvKMjHCh4B2FGxDcXw244NPe3y/s2XxnT
         bPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415859; x=1790020659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhbS15FnZAU+1gYy2dw9ahFXA7LjkCuXe7erg5i5hK0=;
        b=QHVVTM1qZvjOug5eIgL1JCvFjPP/WF60xcUEnNCt0lKXOA9tz8EzruIr+V04bOOh89
         5fyfFHFeYgc6VzNwM606u+88N6ytJ3iNNsGieZGSjNH/H6IGDEO6EyD8UZKuFcBdT/sA
         fn7D3be1UEOMl5i0fDEblUZPbV+CDDiyZOvThNb/XFALeQBFDJzwNApGdTWvfs3BOKqJ
         9QwW2t8XgcpqbSkCmWxjmHOixb9kXWF8WSmfOAHKWHl5tocRahSblbmEmx30PZE1bJlw
         BGWHEncZkGfIxaL9yF1jdryT7mAnff/cFWSY3iarOsUcB8hfu13twEsnkHAo1qErx0lE
         wiJg==
X-Forwarded-Encrypted: i=1; AKwUvBz5OpINaORbgflavJ+vkFFtG/MEygSSPpPv7Llilu3PC+FVLPs+4KRaqljQcenWk249N0hZU5zZYWXPKpw=@vger.kernel.org
X-Gm-Message-State: AFuF++laCBR7Nd1jqGRhsTc/JZXU5Aq6pe1RwZZbhZiggfdy2oaY/feV
	7eVofiQnp6ZRrf5lSZfausta4jstECELAanmmvR4FK06tvf3GMuM08/dTFS2acc+j+YEPi8hXW+
	JGVVut/N54uwj/lsF+SbhI7nVMcC6G0ySv0hgZuxI
X-Gm-Gg: AYBFou27vvHZPHV2w9DNaOaTnPNdzdb0GB11xMKvcFbUfD2BRy20tZmYAHilR7AJnQw
	0qqsweUoY9nV5gmOeXCXx+7/g5smo8DRxvEw1NvMAa1tuD524toKjuGG/oQ+2z7Mth+c4AL/wGO
	lQYQ+94prA2r8j+Xydfz9T/rPL3d60DaQa7wNsI2/LM4dk7+NRLJARUoM0LouhJlSw7oqP9tx73
	jZ5pfvhO75nRLSx/REltiAsPYHbeXHkrsy9E3/dMtzyqAiF+wpTt97BYA8MqIdGO85fnsPr6Jak
	9ISpPDH5UwMlNmzDxEfn7reNe6BzEa1aFNsMFdlEtZf+PrId4OnVkDeArRpDoLtYNJXsVH4ZTJK
	dxTDar2qC9Aqv/4mGLrxgK9d2nhtL8ATi8vz4lh5vA6duqEf9AQd0qW7oEPRaoFswFmy6uCa+M/
	3QKZyt0qFEHZHdP0+Ca97mbg==
X-Received: by 2002:a05:622a:1342:b0:530:f764:7fa with SMTP id
 d75a77b69052e-5310d01250fmr64121441cf.39.1789415858860; Mon, 14 Sep 2026
 12:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073758.2714564-1-xiaolinkui@126.com> <CAAVpQUAUAgAVutpQgMu4LjG1KOpm9Du0Kw1kbp2vHtHqQ5USZw@mail.gmail.com>
In-Reply-To: <CAAVpQUAUAgAVutpQgMu4LjG1KOpm9Du0Kw1kbp2vHtHqQ5USZw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 12:57:27 -0700
X-Gm-Features: AcwNN1UgcMj7SzhoUPKgP3AUBpymk10tNK0tr092p4i0zgSbO2ofzNCz0cSJbMk
Message-ID: <CANn89iJTMxWERqz1tdxuQ2jW6Rr7xN_ceh_yejtrBTPwN_YEeg@mail.gmail.com>
Subject: Re: [PATCH] ipv4: fib: annotate data-race around nh->nh_saddr
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Linkui Xiao <xiaolinkui@126.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:51=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
>
> On Fri, Sep 11, 2026 at 12:38=E2=80=AFAM Linkui Xiao <xiaolinkui@126.com>=
 wrote:
> >
> > From: Linkui Xiao <xiaolinkui@kylinos.cn>
> >
> > fib_select_multipath() compares nexthop_nh->nh_saddr against the flow
> > source address with no lock held, while fib_info_update_nhc_saddr()
> > stores a new value from another CPU as soon as the preferred source
> > address of the egress device changes.
> >
> > Commit 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_gen=
id
> > and nh->nh_saddr") added WRITE_ONCE() on the store side and READ_ONCE()
> > in fib_result_prefsrc() after syzbot reported
> >
> >         BUG: KCSAN: data-race in fib_select_path / fib_select_path
> >
> > but it only covered that reader. fib_select_multipath(), reached from
> > fib_select_path(), is a second lockless reader of nh->nh_saddr and was
> > left bare.
>
> 32607a332cfe added the reader after 195374d89368.
>

Indeed, please put in V2:

Fixes: 32607a332cfe ("ipv4: prefer multipath nexthop that matches
source address")

pw-bot: cr
