Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A614C754C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558492; cv=pass; b=rSoGRp3UKlJHoFgDQKIQhSOaCE2lLaIXP6VI/0KHQoSNPnmAb1C2WQ79p8ByqIjBWFsWXLpN33Cv/3WqQkiEtpz6e8eywVN4Zv8ijlNBc5oNLOzujueasa3Kw0xIISf9/2b9yrqzP2GQq7dHZ+gdHsRNaRWV5AjW5f5czCy0y6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558492; c=relaxed/simple;
	bh=8lQEuf+S9Yr+praW+GOTCf9ZwY8pq+0gPcT80hqP2nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxvyL+MPoqN6eIRcsCwo8GDUGG1ZlZHzDwKxDe+IzDfMniDpQo95C8atHggT31CRg1P4EALh3Fk49uKpmZ4oUMxSTqccuCg/NtRIcr8DU+RzW9mu23dkU2pxO6S5u/n0PKXtjyBjhIMQu9q5U6B3e5LDmRaQi6Fg3eHW9Cj77CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcVFVPI1; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcVFVPI1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so68785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558484; cv=none;
        d=google.com; s=arc-20260327;
        b=M92nhhHPXyLGOQ/gze4ZKegjd6dMqL5WFdDo56Y9XUobHKRgf8uIwzWro1LNVhWgew
         BPqijW2opeOz11u/0zs93YxMirNZKBozOilgntV53XeaM44PITYILZjDXO6LSspq3gg5
         5m5k7hKAgDNKHwxlefCy+tb64+BYsCSRcZysSe2WJUgRmx5NpZMXatMHtsjo3uCYc1Gm
         faO2hTXpwO4gfNOXZ+/E8fqmClIdEWPRhxiOUzcoMB4Yz0B29uX5N5gmTKeqK60XQZR/
         nnYaTiwUeMxSv5IJKi0FoM2VN0n2kEYDFBi7FynufIeTwp+cUbc3rSeAxUqMnM4zpFT1
         C5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        fh=WKHNnFBIU3VD/MyLNu+ZtCVWqLZZQSlc+OSMmZU5M0U=;
        b=e+g4U/70c+Y/bkWhf+Vcp7V/B3RL3raqPrDiWlkExK/jtE0nc8A785xkmu99EUu0E6
         Yv9YloH2lO5Yd57hIWlKn8em+M/Wjmbn/N7Tqyp94cUB6zHyHoHgX86dV/PBQxirP1Bf
         hQfW/2ALEnolNmDgT9T1gAHClQGJktkqmOt3ix7E/mO1T+/z0gBQh3f1mLWlqFMimgZN
         f5RRjcF2N8dVicmuSwqm0B/FYnrmNq2zPU651CsQ7PngAorTPTTRsBO7yFpDIM+oE5Ka
         A1VSd01nmwmomhxrGBzHx4f3nZ4Q3PEJDAqhm/WhCoL0yWBgZLDwWMAJw9kQHU3OWxRc
         2jwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791558484; x=1792163284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        b=WcVFVPI1Ayshs9wj3KuSa/05azM4soITeqpu/5ZCCcPHlky5DDySK1zQvvzUzKpgY0
         MsLzeqyB7RIzslmgI1QrGNDlLSePCIN7rDLkjF8TweFE2dxFGjWnHUxzOSRvAhKrVNZ8
         C37gRjS/h6b5u6elJ+TNdiGBC/CIlKqdiTjZWLPlN9WojoLRHucwSIyezgz71rQUbMIq
         vWB83RZDQRewI1AQAyt1TK4CJmdpkdBV2383nePv89DVxVJOfiyi0p7au9hgUc/7M9r4
         fiy5AThWArosba9zL2plML5WYrhWiyq/kz2qo+GYzau9TV07FEV8fslLxjJrwAgIO6MF
         aXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558484; x=1792163284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        b=jxUsEV4ViqYPiquITA8Lu8tyaAUSt5J4QPySkPEhz5RrAcI93dLeqKS2XtvKB6fiQj
         euBwOt+nKVP4cn/PXkLjxnXLY9F8hwbvWL3kv9el8l1+IkqlGbD+nRrZIWzpWdSNzbVe
         UFpKldcDlvAtZ+fW4ZGfDgRJxoFbSVtds7o2ylwQsw0STXPvrWft+ztkLMlZ/66Llpvd
         RVJJ3HUAzhCKBvLqvUO7SbNT2I9Egb3BIPoSuvU1sPb/eFjXkpOwa6YcGFTwvYw7ULhf
         8/H9V7Xi8uilFxWH3G9tI5vO3Mm/1humQ56j/5irToai2sX3yzoI6vzCteeY3f1B3rrc
         ozLw==
X-Forwarded-Encrypted: i=1; AKwUvBw5pCVC022DjzW0AE3uml5JYQ6GOX+OZtUc1Cqy1iNMPL4IP5/sZjb7XkdOKEnuUEsQKVF1XwoGM33N8x0=@vger.kernel.org
X-Gm-Message-State: AFuF++k5guiKoEOMM4+ggxOv22lizH1v3DS5PiCbDBEO9ciqgtKkIuvR
	jBJt03CiWJR/iyTUhYRyS/veVjEvEyf9ClhWX5hkYVSwS7eB8tlQ0OLHX5aetcW+QbKTXN3x+96
	eP7+8a/SPQkb0AVHz9ug6EHoDQO40tRn5DYf88VFZd20sLxNLkR1SmnWIvzg=
X-Gm-Gg: AYBFou3Qwl3XG5UlLipe4kA8T0M41NZhV/7yXSqjDbeo0/5KOkY9fXxMTI1YHBudwet
	CuU7YQx7C+a/JxWdB67Z3zmGgWDpZv0ORQsm2i2yfhNk3kf9l3H7w+ENJQ3k+GGry3ED+CcdbIg
	Bzxi6ZRXI4TSBeom9WyluuZQRrPoQjGp79x6KnaD7oIFg6Xwr0CMXY4m8kBiHG19qmoio8Qw8Y9
	ZXUSZ97jxwR1vcMN9WGtku5hscA+zrCazkqbGR5JjpDH08JF9cKcrOPHdXDGFXs0Rv8nVcQ9wnY
	5LBRXOxVECYDVOOmW+h9LBzk5/jyEqRqmlaFSSQ+Oa1ul+9q2Q8u6bR2y4B4O7v0YQIh03r8ZC9
	yhb5bWBrZ3T/W4rTWlBBN1w==
X-Received: by 2002:a05:600c:2151:b0:4a1:9034:e9ac with SMTP id
 5b1f17b1804b1-4a19034ee9fmr272115e9.14.1791558483022; Fri, 09 Oct 2026
 08:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
In-Reply-To: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 Oct 2026 17:07:51 +0200
X-Gm-Features: AclHuK_t9iEbDfrbBV_kHItKsjIiOteX4n4AKqToDkA1GKSU32A56GHZ4NbXcEk
Message-ID: <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the
 dmabuf_iter default test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:49=E2=80=AFAM Qiliang Yuan <odys.yuan@gmail.com> w=
rote:
>
> The dmabuf_collector iterator prints the inode, size, name and exporter
> of every dma-buf in the system on separate lines, with an empty name for
> the buffers that have none. The default_iter subtest parses that output
> and looks for the two buffers it created.
>
> It requires a name for every buffer, and sscanf() finds none on the
> empty line of an unnamed one. On a system that has such a buffer, like
> one exported by udmabuf without a name, the subtest fails before it gets
> to its own buffers.

Hi Qiliang, are you running this locally instead of with:
tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?

> Take an empty name for a buffer without one.
>
> Fixes: ae5d2c59ecd7 ("selftests/bpf: Add test for dmabuf_iter")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index fb2cea710db3e..1a5dc1adae735 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -188,8 +188,9 @@ static void subtest_dmabuf_iter_check_default_iter(st=
ruct dmabuf_iter *skel)
>                         ASSERT_EQ(sscanf(line, "%ld", &bufinfo.size), 1,
>                                   "read size");
>                 } else if (f % FIELD_COUNT =3D=3D NAME) {
> -                       ASSERT_EQ(sscanf(line, "%s", bufinfo.name), 1,
> -                                 "read name");
> +                       /* Keep an empty name for a buffer without one */
> +                       if (sscanf(line, "%s", bufinfo.name) !=3D 1)
> +                               bufinfo.name[0] =3D '\0';
>                 } else if (f % FIELD_COUNT =3D=3D EXPORTER) {
>                         ASSERT_EQ(sscanf(line, "%31s", bufinfo.exporter),=
 1,
>                                   "read exporter");
>
> ---
> base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
> change-id: 20261009-selftests-bpf-dmabuf-iter-unnamed-217561e20d84
>
> Best regards,
> --
> Qiliang Yuan <odys.yuan@gmail.com>
>
