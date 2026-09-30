Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369F4DAF99
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799829; cv=pass; b=LAiKmRXbWufdvfNUhIsnMhmq8ky5ErpzMwxno9gbTEbyP1vZoozs9sxB2mJiq8QcW0an3ApySLJZX+ARxfIWNKzbfpmquswXxTQBeRB/BzhfTV0NbEiYdt5/fT8AJOakOUgSAmqjDG6L3nYxY0UK85xcuWFtWyHlecMYsNjIxd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799829; c=relaxed/simple;
	bh=tjWVkCtWN1ksllcHQbdL3oVrHpjh5qWpPcUDOolq1cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBS3mt+NEyLXR+LATnTFXyUKi3aIniaIoAbKn0I3DqRAqPBR7tWIlC9fCtaGwK5jefujS/DcmXTc3jksO9eMPrg5f/CZ1wvJ8JorrpGfoEJL9T5gbpyvkIuxrk4VorAt31oVScaWGA3clt8wDuv2rncOOAjwfiXgiYA3rtdr+eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm03E8CI; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm03E8CI"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b37951827so2117182a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790799826; cv=none;
        d=google.com; s=arc-20260327;
        b=mkKrWNVjlP9W987Bu9Auik2+kuAhagraXucj0D6PDqLl3cNZySQRHS+RwwGa2+vxmQ
         UF34xBiTRdKrjfg/I26TDRmKTlfkdfOlY0X2J722x0gfDo7h4Yz6BA9qM2BXcR8LVeiN
         hBsHh3e7YDc3PZN5ZnrzerPjEEi0X+G9hF3r4PiTt4Qt5+qF/LQPtGOSTbGMm7WHHEwl
         sxG9eiHfFgrwn4WBGa6UT0/CVqUnBAW8xb45N9YikZuSnHgXwtZF3CiLAlf8N1OQuCWH
         NkPW89ESqemr1Okm/UNTSYHGtyOB9mDKAfTPRvzcOAi86qNqWdLUTt9Ttuii1xHj3mL8
         CfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3NFT0Auogh5UB9tx8XlsAJmBChn/jmV5eAEA0nyqDX4=;
        fh=WlvT1+m7GiRzuDIDLQSSmjqb+D/2WZYXAurSLDsGkWQ=;
        b=idRwlYWWwBmnKxAPWx6w5BX6i123B+oslKAfak3PvAXlD+1eNZLMquxznRRwaVxHoS
         QVbws5pGoeQnXy/vofizZ3ZfEL8o4vDFNXYonyBo7kgl2QyyBVSBQaCPkWDo3ZYK5oIV
         TY0gt2jT4MwQb6SVsdGnJpiWltVpTLlLSaVnWe5rYYtXtFVVz6x5vwXEFKNC7B7ngbx6
         ZacyTIBbLi6m9LSNuKUrd9L8+tHHhg5r3x7oCeGmU1vXgF5Ecxk+wbBQdhavnQIvlyxg
         gsKNWpg3YtGtjh9YkS2uI8cRdvaPWiuyS5pNDLzsdpcGlpVpaNm94q9V/O9S6q2FFOX0
         Pn6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790799826; x=1791404626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NFT0Auogh5UB9tx8XlsAJmBChn/jmV5eAEA0nyqDX4=;
        b=Sm03E8CIiAErKAfcG0Ci7cfDCjiSCua7PP0hSuKhHEZdq0s5qxXQb8oxDMisK+LU/y
         pqyxaoj3mmm8ti3Mcw3mFjXdeB7fcC7oPzvZEDp9KAQpGE/sqzP3rnxFeo+CIz8hkV4U
         EdiPmnajp9YiNPwSQ78W/hQdr5FS//g971hrNLuOsTLJPKkNMvDMLPdSq7MNgM9Wsa3m
         V3cfmsKzV79kP5yvheQd5vONp2bthr/W6K63iTbydGgwH6RRmhatlxx9V6D3OSTkmQKZ
         TaPGsmQasVCz2NI+WfhZs2dUbaoDQJdfZ6WqeXZDN8OS1mGdihtwxnfRE0bwU1znk5g1
         aVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790799826; x=1791404626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NFT0Auogh5UB9tx8XlsAJmBChn/jmV5eAEA0nyqDX4=;
        b=O+eX5WgZfIguvRmAasuj0lObg29KgwYNAWC/wLAHRvT3v+NELn3E4JoakSIX3oSjgb
         bOTrxu+om6LAkuG4Zd8oTTSRUo2dciD8syUJ66fX1dUyJiGRbQg/TshqOACsUtmAOA7g
         RffwTk7vBROheSUZLbPQqPAB1px1GFqOThcXvTZF226n4nh3OD8djaY4kZl2XgI9Yk65
         wVSDeps56CTq1LRdXw0x/blB5AT9dQPvN8O+EwN0sEzNK4kNTzoXciCqXT/Vd0MYk7ax
         WV3Vgkec5dhzFkV9kiSj1uZrzRapwt5GXnbxAzd5rHgd0Dn+A4A9YpBmbhu8Co1Dt/YI
         kPug==
X-Forwarded-Encrypted: i=1; AKwUvBwPOK9Zd3g10ygGuQgNigLBsgE9bixYeIRYczaKDSeCrt0DuGWjLaw7C4CLvlF7WPBpvbvl2k6xEuFyb3A=@vger.kernel.org
X-Gm-Message-State: AFuF++lM/9hJS5Au433Zpoy1pcM8o0kZs5kjrkD3XeUngenIPAr74f/f
	XL/r0cFxJ75jzw5l5L7f2elv9qsNMN+gZjnSWYwwY1nDxWHFMLCA3M7WGv2e02tHfo5tqcb20BV
	AD+xUPGguYdjFfP4DnPXo+7QXDbEANns=
X-Gm-Gg: AYBFou2gcxNDve9ug+1CRCYTJ5LBbjT7FmQo/qU6Ra0yvxHhVY0XI8Jdt5+YPk0iQdN
	XYpIahXVoNmZep9LOwJT36kGBil/Vz/Ko4gwZdYqdOxl/1Yl+Xg1i30htUs2BgIyixgvBxtkBvo
	P+8W3w3KDH/B6FG4w6DR334mvUx0pZSa/B1hbJgQ81wYilXteqXmrWWo8Uu/sbUV6fAY5YKTpXP
	3jDUB4xOSCI72/+1a19RYTLbqqEhrf6Pa7f0qckUERDXutgT3hC9f7PoQO/iGuZ60bZSE5eibzz
	/DNUqlwBQQ/4XcPHYotavIr056osE1/ao4A5wxCt1H8q87v/sAnrBwQ=
X-Received: by 2002:a05:6820:290b:b0:6b1:95fb:81e with SMTP id
 006d021491bc7-6dcf4559dfamr2868200eaf.22.1790799825918; Wed, 30 Sep 2026
 13:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930135159.3926039-1-shakeel.butt@linux.dev>
In-Reply-To: <20260930135159.3926039-1-shakeel.butt@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 30 Sep 2026 13:23:35 -0700
X-Gm-Features: AclHuK-HRG7T7XdhgKdEFkDWm3u0VW3bj7sKHiJVcbdSbgRB_tt6JD2iyN6YLbE
Message-ID: <CAMB2axN6-sMPu++HPXXJmPp03f80G0WhgHPLe4Tx2N53V5REEA@mail.gmail.com>
Subject: Re: [PATCH] bpf, cgroup: fix cgroup struct_ops query for a second
 attach type
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tejun Heo <tj@kernel.org>, Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yafang Shao <laoar.shao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:52=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Two things in __cgroup_bpf_query() work only because CGROUP_TCP_SOCK_OPS =
is
> the only one struct_ops attach type.
>
> It calls cgroup_bpf_enabled(atype) with an atype that
> find_atype_by_struct_ops_id() works out at runtime.  That macro is an asm
> goto and needs a constant.  Today the compiler can see there is only one
> value; add a second type and the build breaks with "impossible constraint=
 in
> 'asm'".  Add cgroup_bpf_enabled_runtime(), which reads the key instead, a=
nd
> use it here.  This is a syscall path, so the cost does not matter.
>
> And find_atype_by_struct_ops_id() matches on type_id alone.  An attach ty=
pe
> whose subsystem is not built keeps type_id 0, so a query for type 0 finds=
 it
> and returns success with nothing instead of -ENOENT.  Skip such slots.
>
> Fixes: 369d9dcd8fb8 ("bpf: Add infrastructure to support attaching struct=
_ops to cgroups")
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Yafang Shao <laoar.shao@gmail.com>

Reviewed-by: Amery Hung <ameryhung@gmail.com>
