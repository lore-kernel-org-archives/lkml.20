Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917097;
	b=JdDrmg/O2ZcAqb4orJn1QT0LGsWjktHEgpJdOVcBTMzesbWfadfi33Fa72SZ1YLftCGJ
	 D5uV+pWHh+0W3SspVXN0BncPVLSlhJ9tJUXunMxMbxt8XdcjPiv8QVo30JBxWVXtcVi8r
	 itkFrQ6/s2KziQ0OXT7gzKUYpAJmEcU+SYlkdNnZagZBFeqgZ+VAIxtisig194pfKUIAj
	 fk5yjsNp6rn+qTILw/P22bFQBVXX6Ns64Lo89Jw73F8QsX9BQbQ7SrdTGnRuT1ue08qBO
	 c7gO1TUPI9awGnOfy9SLtWu1egHkx9pZSHaztluzmcWlm3vUi5qGpCebCSO6W5PfKZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
	b=l4mxUPNQ36VRuYUgh0C4MMQ38dGZXeqMOg+NpFwL27SWGNo4IyoDTyef0Atru/PZELTN
	 TMgetVx6BBEUGPCMOxUEVVeUdWVj/SalYlJ4OTdKyjOwbG4U9ai/bQT89d8DN/OxIJpGI
	 lqetL+MMMqSpwiXTVtJ2ncRFBMRrPAxhcnwI8XbcaL3AxyAHAVRu/ld31uLJkplGFbQJl
	 SELxFloTZMbCQiWClcSALBMeI6EiEGKYSqEkFXcXiAv9kBeFd68pjAcN84nQN+AOeXf5+
	 6RWDaAgD9O3cvrW7h8GzFjXglGoazKGGV8z8JtmW9Msk4QycYKRgcQf3a4eq99So9CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKp3A2Od;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB7606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DB7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKp3A2Od
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d1114320so18885315ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917096; cv=none;
        d=google.com; s=arc-20260327;
        b=OeLCiVr9yVIyFL9eXytybjhLlbBJDJrhur7+0pMUgjKio3wRYxqFkOPv5vviUGYO1T
         Qhfmfikep7lrYvWoVVXWJajWLsv5WK7g+28GGBLo//QWzD9VvcKGzJ/wz7YtOgHadd6l
         ZbMN2FN7OrargqZsaXJ45TTLtXxZjrPALaKnxQvFYqX2+Cu5PrQcaBLWXPftouuKv8u/
         Vi1T1mUK2cl2Mscu+Ci+l/nn+tR2VPS7Cix+aK7PsRX9Ucz7eZGNqirhc+yaWgokiCBg
         daXTgD3UZfCXwAjFZvWyECrViXIzYy06WeY2buS+6ky7W0adBCN6yzKwoXyQCyEj7Sv0
         OjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        fh=YFzvQKEI0Gr9XU9sw+5X+PzzB1+KqPo7Q0iLsfpNMX0=;
        b=afgkHTzpzvNsWBNhiuXeaSk8tMmJbwUzXBfBa9BUBDR6P7zJ7UZqY14M6ycfqzPS6g
         atNGIDKudLDmNjG0BqQy05AVOPQJ5hi4ZiMBL6v9y2Wddb0ffG77Iu37tDAE10BxX4m3
         HmLmyA34xwRBsNpKNj4lNbfTBqN7qFtqECsjlAsdwKl1tugLrIyfdOXNCnK4zXKcYEIb
         oKlAgrTYExkRNWkAYSXXzrPq9jKCPp59RxvWGUAbwBmszbWq86zocSxVbPi8AWZQMLKG
         9f579/744S1CZuYjsX4w5WxDa4RWklM9XkI/ImM8Zt11p/0oivtV5FmGKteewG22LSUK
         aJ7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917096; x=1794521896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        b=gKp3A2OdyUpr1iXmwvuJ2I9EuqFYLOqS2j7DQeAsRTzzvAH+XY6WgsVnEE/gdB9pN3
         t5sX1e5kUT91YUSzuJdqTs2fMBx7/Hng+qcBD2ciZMLVEdJwKMhQxb6VwOhdn7e6nRW5
         6jwg69YY6b+SNYBLO/eJXMepPYpc876dW6v3VRyiUve4KkCGsI/QyW2+a+i2uLlATGsj
         5gHUKpozkhbpl7iV/OHI25MpxIuZr5flRSeTrvZZzCDtn578uVn5RoVyJ+ez8wqeoKmR
         H6Me4PwMLSo5v4Wa3n8CDDCSM7iQHYKkZx49kpE8xH06oQStwJja6G6TmJG0QExJAHzV
         PL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917096; x=1794521896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        b=E2dDDGZP6a25FdvsOxr6sVXCw5oCX/BKkjoGDF9+7+TDkqoOafgUdxbPlEadOEShTG
         w7EvWvB83VhEOuLmLr+eMtbiLxqOiUj6pCbGDjmi0jnFFBf305GEMCGx5k48rejHWK8E
         qmeL/nbksFXSMDHNyey1GrVcuGas+JyZRD4Y7OinxxIReVzh0eX0bjISTv69f6VhCZY7
         TFB3WuuNOS20SrFY9Ex0AXt8zDmk26UYkkeRr1tev/hysdiQtUaFTYBiQmhhJOI50+hh
         ZHxuEyYigUDhz3ucxKZQJUZb5pQpbFmq8VlByrE1qXn9khq45l3Y9/cZ2q+sldNZAi6v
         EhWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlMjS7Z7GIWLkx3Ull0vdPaagU6fEhyFNSjOZ/vT57DcFuheLFMD2fex/PEOUlNc6cvJpEewYTO56rrrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZeRgZ4Wpxcyql4ixmnZM8+siv/i6hKLJMyd0um9b7o91woz+m
	KORvI7W0PHA4KOo0xUUzm0JAJJTjRhQlRgblb3XWaKA5Cxnngs9Vjc+WY10HP5LnraFWaIOOUs0
	tjIjtuHTYWHccHQsHuK3mWYCFFt9MreM=
X-Gm-Gg: AYBFou1qqYrxtrGyHS2ft5dJ7Oe6j9NhS0+oEm4R7jx0fVhc6Fy39MEP8QvONtIuLwN
	XZagQ/E94z9uFWHNbeyJb5uto+FzPO/LhXS4Lkmg4Pr6x7lpfyH0u40fhlq3z0cYR4WwzsZY1KW
	IZIZLNoThPNeWJ1ofTweCxz+FDZ5DanS2AX54ZrVb+lKfdsGK3lXbyePfc/14lKs2b70rhM2zDn
	5xRPORayvlau2BBsI5+wd+sAOEBrem6v+Y0QNAE5Jjl43iYT9EOHq1hG+x3/+6bkwkBz1BfxCmV
	kKppVDPymnlxJK58uZLAR9GrUSYWS533myqOBCmsr0vQCJkMLfGZUs8c6Zp3wtZFCf1ORlFaVEV
	q5ggwi51JD7aMg68YWdUgjGP9K4f/cMfcEFaPypuvvYZSEZ3ffh7bx+5bgruEscxb/1E882fXii
	SmrVPHE2d7MjMyRnrgVtHkQvCJ9DtPef6I0Q==
X-Received: by 2002:a17:902:d2cd:b0:2e8:5202:aa8c with SMTP id
 d9443c01a7336-2ed41c447c2mr10044985ad.48.1793917096355; Thu, 05 Nov 2026
 14:18:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com> <20261101103221.51534-3-dennylin0707@gmail.com>
In-Reply-To: <20261101103221.51534-3-dennylin0707@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:18:03 -0800
X-Gm-Features: AclHuK_dLJPArclYNX3UADg6ClTszBmlVMJeiwepHsSAXolKV5xcFCTVjjhNWVg
Message-ID: <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:32=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> btf_dumper_enum() loads ordinary enum data as signed and uses signed
> numeric output. Unsigned values with the high bit set can therefore be
> printed as negative numbers. Narrow unsigned values also fail to match
> their enumerators: an eight-bit 0xff is loaded as -1, while its named
> value is stored as 255.
>
> btf_dumper_enum64() likewise uses signed numeric output for unmatched
> values. For example, 0x8000000000000001 is printed as
> -9223372036854775807 instead of 9223372036854775809.
>
> Load the data according to the enum's signedness, use btf_enum_value()
> for name matching, and select the numeric writer according to kflag.
>
> Retain the original signed-width comparison and give it priority over
> new matches. This preserves names from older BTF without signedness,
> including eight-byte ordinary enums, and keeps the selected name when
> multiple enumerators could match. Remember the first normalized match
> while looking for an original match so only one scan is needed.
>
> For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
> enumerator can therefore match both its sign- and zero-extended values.
> The record cannot distinguish legacy signed metadata from unsigned
> metadata with the same bits.
>
> Unmatched values are printed as unsigned when kflag is clear. This
> includes BTF read back from kernels without enum64 support, where libbpf
> clears kflag before loading. The original signedness cannot be recovered
> from that flag.
>
> Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
> Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/bpf/bpftool/btf_dumper.c | 42 +++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 13 deletions(-)
>

how old by now are those btf produces that do not emit kflag=3D1 for
signed enums? should we even care at this point or just assume that
kflag is set correctly?

> diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumpe=
r.c
> index 3267163119dc..792e210cb503 100644
> --- a/tools/bpf/bpftool/btf_dumper.c
> +++ b/tools/bpf/bpftool/btf_dumper.c
> @@ -148,37 +148,50 @@ static int btf_dumper_enum(const struct btf_dumper =
*d,
>                             const struct btf_type *t,
>                             const void *data)
>  {
> -       const struct btf_enum *enums =3D btf_enum(t);
> -       __s64 value;
> +       const struct btf_enum *enums =3D btf_enum(t), *match =3D NULL;
> +       bool is_signed =3D btf_kflag(t);
> +       __s64 value, legacy_value;
>         __u32 i;
>
>         switch (t->size) {
>         case 8:
> -               value =3D *(__s64 *)data;
> +               legacy_value =3D *(__s64 *)data;
> +               value =3D legacy_value;
>                 break;
>         case 4:
> -               value =3D *(__s32 *)data;
> +               legacy_value =3D *(__s32 *)data;
> +               value =3D is_signed ? legacy_value : *(__u32 *)data;
>                 break;
>         case 2:
> -               value =3D *(__s16 *)data;
> +               legacy_value =3D *(__s16 *)data;
> +               value =3D is_signed ? legacy_value : *(__u16 *)data;
>                 break;
>         case 1:
> -               value =3D *(__s8 *)data;
> +               legacy_value =3D *(__s8 *)data;
> +               value =3D is_signed ? legacy_value : *(__u8 *)data;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
> +       /* Prefer existing name matches, including signed enums without k=
flag. */
>         for (i =3D 0; i < btf_vlen(t); i++) {
> -               if (value =3D=3D enums[i].val) {
> -                       jsonw_string(d->jw,
> -                                    btf__name_by_offset(d->btf,
> -                                                        enums[i].name_of=
f));
> -                       return 0;
> +               if (legacy_value =3D=3D enums[i].val) {
> +                       match =3D &enums[i];
> +                       break;
>                 }
> +               if (!match && value =3D=3D btf_enum_value(t, &enums[i]))
> +                       match =3D &enums[i];
> +       }
> +       if (match) {
> +               jsonw_string(d->jw, btf__name_by_offset(d->btf, match->na=
me_off));
> +               return 0;
>         }
>
> -       jsonw_int(d->jw, value);
> +       if (is_signed)
> +               jsonw_int(d->jw, value);
> +       else
> +               jsonw_uint(d->jw, value);
>         return 0;
>  }
>
> @@ -204,7 +217,10 @@ static int btf_dumper_enum64(const struct btf_dumper=
 *d,
>                 }
>         }
>
> -       jsonw_int(d->jw, value);
> +       if (btf_kflag(t))
> +               jsonw_int(d->jw, value);
> +       else
> +               jsonw_uint(d->jw, value);
>         return 0;
>  }
>
> --
> 2.43.0
>
