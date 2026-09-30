Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435594A689A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811193; cv=pass; b=hizGl+yzG6oolyRvO6wh9DEMgMEUztclzSAkv7ebCRRN4vtG1oQcHdjqy8rW3F5poNtyNa80mMG8VvVj2j4YKd9+x00SgB0g0YT3bLJK/E08H7Qnuet0QedSOO/z92ydFopRQKGZOzJpQKi/lmggBFooF9JBXDnnRZFLBm9Rrm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811193; c=relaxed/simple;
	bh=4D49IYAXZSVFvCJ88T4gLujZ0d1NNo8WHPi1MaZO/8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6cwe5eO4K8drDE5EGhS0He9gThzIVkDzkkpq0+9Pwa8xBmUYt0eLF/m+ouG1Gq4hazYjaam5YncM9KvBwZQPHBcak16jQPCUHLNKDBx6+BEOWsT5jZ+IgGirtArvJrqC8KzpXxUVEu6YBgGX12x6GEjxbbW9uyEZ61jwxok9XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3x7y/5g; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3x7y/5g"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccab774cso3217454fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790811181; cv=none;
        d=google.com; s=arc-20260327;
        b=LdPgWU8r0dsVPGWO0fZS6QY1OtGQj6aIvVaM2aQJThhyWkabJtRwJM/2Qkf2Fdst4Z
         qz1L/LbLxygwP8pNo/nS/BCiOGH8DpAzDeKPyZEuWa5pPokxJlgkxcp9tFqnGNSlJDyv
         YftoXLtul+uauDqAxZ4hDiOtWkjDwgvFrfAzsQP7TDewZ7A26UpUV1/TuSpnslE+mex9
         Ev1QUfnveHJ2ippxDctY3W16DvkWjPxvSoVniyFsfpT8m+mHgmE6tJo1xpeKbIzDZm7o
         km9iDbtZcIu9ZtXHlMxvfmjNePx2kfHrXw/htztT9Gr7lPycqa/ELOGNG3HcXd7dkmU1
         YOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPTEm0bKbqUNKMZ37cgD5CITzNrHBkp5GSyeQAQbpHE=;
        fh=ohK6vzSMohb7dfIZQuV0+XSAM5dl9GlCTTGIpvT8Q2o=;
        b=WzE/ws6DcESLQhq3NDGGEw8TsuYjEZKYzLFjcO2MOKQGnIWLqcVRjmlQunbjpjeVe2
         722EuWhtAaVce5e9QhUsa34iPsri87zs37UeJNQiGfvEK8/XJal+G0ZsjIrKJRDcOvnL
         WVVKDGJg6x7fCcqMZ8nA2zMYu3MbkMYzSSHDNHBL5/ZY+GAgpjuVZBIdbAEcDOtqxxfc
         u9a08cH43eJPvlSzhcEeKk4L/GjIHtXfGXxnh9HWjsQ83dutOX1QyN1bpPbIxQrLu/bR
         Cyfe0UMYdFr3rI+xzFHeidXDELIPrcYGkSgyvv8RnGsod+KYdxTHEEyJd3q8vLDuJy8f
         fYbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811181; x=1791415981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LPTEm0bKbqUNKMZ37cgD5CITzNrHBkp5GSyeQAQbpHE=;
        b=M3x7y/5ghOrfaxtvEYyQUW7UVA5cefWnKCJmfohYlLQ8Wn8KMwDu9KhFyX0PCSYNCH
         F4VH/G0oPOkww8Zi/PObgBh+1ZBGNqx4SHfcairq9EE/o1ILPv8yDkrRRTZDEv+r1Xc2
         CIbVD+uVnXuNQBsf7AO+2vT1bwMlJLeKVOBGhD6Icf6MCe7KLFEBpUTw9ih9rMR+Locl
         5DIcDqkJ/SLKUURD+FvFXTSkVEzwfVP/I5fm9WGhlSzslwigk+Xho2H5l+l1hloRI4Ee
         dwMMIAIZ1yoGpDs4hOx0aBo46yxDOJr3vq0j55xWwKeu++HfH7QRs2Hbl71matpgqG59
         mmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811181; x=1791415981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPTEm0bKbqUNKMZ37cgD5CITzNrHBkp5GSyeQAQbpHE=;
        b=0KV6KsSW9z1FqS/5eelYCoR9UeigxK5oRsBIbAMJN39+iNH1jkONJU6XBzspmY6Zb1
         UjzrucFgljBe2az2yHoKu5OhaCnx85d7NNuOBV8uz4szPTqpwCJtYySksLpmOB0zWdxe
         DuK8nukHSm7Ft0YpQwCq1nhQB/mIzv5wULEvOc1RUPpC0x2JVFbPJHehTYM1msUCGST/
         nQ9az8GA0BMjt5jjJ5TjQlubN6lM8Y1wPyFAUG1PT6fVLGUQyQPYBzDb/Qpka6oJWug6
         cQzN/am7yXq1C6i3z+a4zQXBDJ+dY3gh0ZxC0M5qAcZDqzcmQSimvQ0G/F9JPuseLt/0
         ZpqA==
X-Forwarded-Encrypted: i=1; AKwUvBwczwXCfZUjz5Bn4gM8FLg+z/nWM/h8V0sg7NmTRZWCMupJNpxp5tiyo4QULP+EhjW9h3hDW+RjtUK8qqU=@vger.kernel.org
X-Gm-Message-State: AFuF++lYEz1obtyMXOksMcPKOAQ7GYcL5RWWnSqAYid4++RZBpEq7rP9
	I2SuibrL+X+FTIvqKlK87BeeqCLcZ1SmwGaMKBgGZKXNn5q+FXrOu35wXC+FhsRYZrNX7keN2mH
	uDcbyF00fmuWu140VEOIW99qtf8xxa2GDzA==
X-Gm-Gg: AYBFou26P87h3Nvd/BmNfHjnJ9ViC55ZChe8+PttOUFaaH1+FacLpSkuwbuWp9bI+xO
	Mlxu55RdorYgrPjiwCrDVHo2olNWCZerdHf/fMokygEVWlqEOYVVucIYxh3taBm57pAtnhkLhbe
	IgFkwgdRCPCDdOEhCmnbJ4jIEEXoe+PiSNK5YEZXyql5x3OktkcXJZ7UGOGe7Q0X1yNIq9bdHit
	aeK6U91mGxhSxFA5jLYb7Zkf5JllQiDuQ/SfP4lE7r847/dYA2xv0gxyqvHv7/yHKUOryQc+m9f
	JsYigxS2FYqrYU3cDuzsABOjQVhikIJOKCHA2YBNq1s1F8A3IHvVxq0=
X-Received: by 2002:a05:6808:1582:b0:4d6:9153:2968 with SMTP id
 5614622812f47-4f1bafc0673mr3201230b6e.57.1790811180876; Wed, 30 Sep 2026
 16:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930135159.3926039-1-shakeel.butt@linux.dev> <CAMB2axN6-sMPu++HPXXJmPp03f80G0WhgHPLe4Tx2N53V5REEA@mail.gmail.com>
In-Reply-To: <CAMB2axN6-sMPu++HPXXJmPp03f80G0WhgHPLe4Tx2N53V5REEA@mail.gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 30 Sep 2026 16:32:50 -0700
X-Gm-Features: AclHuK97hrec9RWHoEuiahRQWIqiU6qP3tiPiCVfaqtwIdccUEpMi4CzrnU1DEE
Message-ID: <CAMB2axM9ocD_Q=OL=FjpYhcDkz3PR2qyGZ8nWHVs4H8M-Lv38w@mail.gmail.com>
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

On Wed, Sep 30, 2026 at 1:23=E2=80=AFPM Amery Hung <ameryhung@gmail.com> wr=
ote:
>
> On Wed, Sep 30, 2026 at 6:52=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.=
dev> wrote:
> >
> > Two things in __cgroup_bpf_query() work only because CGROUP_TCP_SOCK_OP=
S is
> > the only one struct_ops attach type.
> >
> > It calls cgroup_bpf_enabled(atype) with an atype that
> > find_atype_by_struct_ops_id() works out at runtime.  That macro is an a=
sm
> > goto and needs a constant.  Today the compiler can see there is only on=
e
> > value; add a second type and the build breaks with "impossible constrai=
nt in
> > 'asm'".  Add cgroup_bpf_enabled_runtime(), which reads the key instead,=
 and
> > use it here.  This is a syscall path, so the cost does not matter.
> >
> > And find_atype_by_struct_ops_id() matches on type_id alone.  An attach =
type
> > whose subsystem is not built keeps type_id 0, so a query for type 0 fin=
ds it
> > and returns success with nothing instead of -ENOENT.  Skip such slots.
> >
> > Fixes: 369d9dcd8fb8 ("bpf: Add infrastructure to support attaching stru=
ct_ops to cgroups")
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Acked-by: Yafang Shao <laoar.shao@gmail.com>
>
> Reviewed-by: Amery Hung <ameryhung@gmail.com>

This patch might need a "bpf-next" tag in the subject so CI tests it.
