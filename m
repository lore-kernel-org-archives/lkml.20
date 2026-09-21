Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6DE4A0128
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007747; cv=pass; b=DY5/q3ZexXLP1zPBXh8z4fCV4iOa2L6QSL7hfpJ2D65hRJMIasoJuCecE71d/iKo9BXYzGWb72AiPtvppsizYU8U3Xvcl7LXlCq7QH6kFSshBHJZEO4W/DFMftBQWEuT7n3P5qc9+36eNOoQkuK0FxGkILYEQtY6Bu5WHc4WDNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007747; c=relaxed/simple;
	bh=I8g37qieZ19XHGCL3u3wjTE9kaftquawx7wgmkhVHZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3OoU2fKbr/jtvvpnirVjkJbSe/IiZU46wJYU6W6Id+7ki3HYg4goeRt3aPTYNV9xseE9WrakarIRydupM0IQHBeq+r/efwQaFss+f9+gNJArLaHybur3UABzsDT7e6cYNQ0r6kl1ZFGrQu/mkcm470AARrkYF53K5c8c7gju70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p2yFtEbG; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p2yFtEbG"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53113d72966so502791cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790007744; cv=none;
        d=google.com; s=arc-20260327;
        b=YyLSQyHgS6WaHmSQJ/l3ObkR9yXHFbg13affXuwS3qNE8gPnf5Z9cqd8IdGWEr7AG7
         b0KUtVIV0dJwXPhTaFc37loQ16nx3K1Om1ElRb/De2loMcxmeICiFTSL51aGLT7Sb2hv
         aG2RexLkUaVn1gBEC3CGZhecLvp4ikyP7lSU0frG7QjFC6OXtVQr+pB+2/yCCkkED5ID
         uij3NQp/v5gBd7UPUEPbASU5rcstd/1owGjzlfrspwA9zWrFd3OMfA+caZJ82l2KMb4V
         g/YKD/vX0vHJ8uVeqDx0z5AaK/AKK+EoM62XKfpvMHY9GH0PuUcd1HZselgt6QLDNtM+
         0Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owC2fjf5Qwa/LkbReUgINQZxkD7C+riZrL1KRkW5XzI=;
        fh=+rP6G5FjECxMtqLfXyHueEqpgd6+zHXk4n9IRSjW5kY=;
        b=jCg0WrPCeyPzg2W45+CjSh5hQHdmKhJ/VFXu2FZgsisOpHDPXwYtCbjs9ueZ40j96/
         di5t6Zq3CqxkYr569myNEPiM9NQCzkN96IqDKkX+HkxWhfRRhc2OmXBA4MgNEuTmo5PE
         7nR1J7rvL95Qh0B104TWwEEp/BzjqzHyVFwWf42wUSJal1FrdliG3Eax8oRFRFRFoeRP
         NYKsVoOPrrkq4AZ/Xb9eHljX1YrEKdXKfrPtCHOBsYBoLt3Hc++qLnFWFGxRZYZQn793
         0yHD/3clML59sm7sUOhxwvqH7rAMJFPdM7PqJuKxpZAY/LS+fP6r9PL9DGEvaqbN78AV
         hYUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790007744; x=1790612544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owC2fjf5Qwa/LkbReUgINQZxkD7C+riZrL1KRkW5XzI=;
        b=p2yFtEbGvVNsD16rapoTOWIPy7P0ffQGuhtuOcDFPLZXiQqL8T+73ik/eVJ7Xb0fIp
         r3G7BIeNf3MXubwao105Dk0wRsYCGwPmo5MDLrt8RWdWCK5hmlkgOT3U5CK9XKcLi3UM
         9mFPIPud0Zs/WjRo4KlXlbgCN2c/bWuuOt70hhYjMlLSifR7gBLBUKN6/BBXLfD+ZTEk
         yX4NcTNcDlq4X2WsQ4007GnPqpGibyqcaH12sZ2YywI9oWnix5sgca2y5PTdwfDxeNlw
         QtiHvOvGQwdIM3wCw39TG0n3tqGftuVbMzpMdkx0F9WU9CISHDehAudIIYXxfN/bCJWe
         K6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007744; x=1790612544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC2fjf5Qwa/LkbReUgINQZxkD7C+riZrL1KRkW5XzI=;
        b=2FIaYsT281ZCj1U1W1bw86NYCjuOLjKyw9v8vcA4k+SWAnk5nUiJdjq1uoyYtF7Uf7
         JWJHmMGk+ldzoT1k5Y6RPB88NHvPikK0rkjfTBOSWiWk8gfw8nnOP38nMyNcUsHUJJeW
         y7xQS4lufEcF251pw/wwo29e71RFl1AGRarhu5q4g7u9ASYYyoNRhf0KR+rT4iqbSeY9
         9VUgLySi2YNwLzpN/O3OcRaA9gF6+0zGnEMWksW+7stWMSydn7bE5hLeXlK/wy+6TXoG
         O4GetPqklTD/hEuYnOxbWZthLpYYfBoXcq0t41i0HXprf9zfPDEy3QHTTyhMPgpREuzy
         lqHA==
X-Forwarded-Encrypted: i=1; AKwUvByZ5JWdgGjnZuqIYF0pHPrjOJnvVfNWGnjCnPmj2dgM7P0AZhaEM6izxb6KBawbpAf5tHjX02VWhHEaEQI=@vger.kernel.org
X-Gm-Message-State: AFuF++k1s1oUbv5+5yucoLAoIVrvY6hrCcx33x8oOwOX+NNClGVSyveD
	I+I2dI4e7dPLTDZMb/XTQ2sYp/zP2Y8ZwX8EZMwCJZy+gVHlfbUalAne4gJcHZ8ffcoLtSpAYWm
	hzEZ+p/ytkLLKBQFrxXtHpSZm0eY3XeROe4/VcnPH
X-Gm-Gg: AYBFou3kdJsCpBAxdNu/PEuF1ceTE+Xrdv8VvTgDP99V9BQh/Z2BqH5quSawHLVxCXs
	MCrZrESMY08fZ9Nk8ausvfuTdc2iX8Z5pZmkAl+sXMUkb92E4xIrsynEghRR0alw7Sc9AhZOUOJ
	Oscpf5YCn6hQ+luh2Y0Sn+OMjSgtZ1TPlEfDcUqeHagbCIJDkZSk+nOjTI8ab4yHLJc5gTINh4z
	bmPaghJz7wecmMo2MWcf4dzraHYjWxu93eR9LzDJEn8sKJfrJAoUbFw7lsf/6hS1cRFG4hkdStx
	76E8SZegH8fk4rWS2lJoMkpxfb7ECx0iVRiEPgtN2DaednEZLS5drdmoEJc+MJ7n0/+YdQN4AAL
	okGxiIfnm
X-Received: by 2002:a05:622a:4a8b:b0:531:d8:e437 with SMTP id
 d75a77b69052e-532d8d9b2c5mr4968831cf.7.1790007743302; Mon, 21 Sep 2026
 09:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915091112.333308-1-dapeng1.mi@linux.intel.com>
 <024fd251-a4ba-443f-8aff-f5b1cdb062a3@linux.intel.com> <CAP-5=fUc_WOHAe4EkLVYuBgvQmxk7_XY4N+v8yJKNJQpCSObHg@mail.gmail.com>
In-Reply-To: <CAP-5=fUc_WOHAe4EkLVYuBgvQmxk7_XY4N+v8yJKNJQpCSObHg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 09:22:11 -0700
X-Gm-Features: AcwNN1W35saVFW-Tr6vgI2VGiSi9ld-QxMQISoA61xD8c6KOSqtdbQ3LIDan_lM
Message-ID: <CAP-5=fWTRPmPTkzd98hCEfh6LUTrRTNHZ2dS4nUDyQBuU8oSzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf alsr: Add missing SIMD handling in aslr_tool__process_sample()
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zide Chen <zide.chen@intel.com>, 
	Falcon Thomas <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 9:21=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Sun, Sep 20, 2026 at 11:42=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.int=
el.com> wrote:
> >
> > Kindly ping ...
> >
> > @Arnaldo, @Namhyung, @Ian, not sure if you have bandwidth to review thi=
s
> > small patchset which fixes the Sashiko found minor issues for the "Perf
> > tools: Support eGPRs/SSP/SIMD registers sampling" patchset?
> >
> > If possible, it's better to be queued in this cycle, then we don't need
> > extra backporting. Thanks.
>
> Reviewed-by: Ian Rogers <irogers@google.com>

Oh, another nit: there's a typo in the commit message subject: s/alsr/aslr/=
g.

Thanks,
Ian

> > On 9/15/2026 5:11 PM, Dapeng Mi wrote:
> > > Currently the SIMD register sampling is supported, but the correspond=
ing
> > > handling is missed in aslr_tool__process_sample(). This can break par=
sing
> > > of the sample record.
> > >
> > > Add the missing SIMD register handling in aslr_tool__process_sample()=
.
> > >
> > > Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> > > ---
> > >
> > > These two patches fix Sashiko reported defects for the patchset:
> > > "Perf tools: Support eGPRs/SSP/SIMD registers sampling"
> > > https://lore.kernel.org/all/20260914014049.2061519-1-dapeng1.mi@linux=
.intel.com/
> > >
> > >  tools/perf/util/aslr.c | 31 +++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >
> > > diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
> > > index 027695d96779..a097084201a0 100644
> > > --- a/tools/perf/util/aslr.c
> > > +++ b/tools/perf/util/aslr.c
> > > @@ -19,6 +19,7 @@
> > >  #include <internal/lib.h>  /* page_size */
> > >  #include <linux/compiler.h>
> > >  #include <linux/zalloc.h>
> > > +#include <linux/overflow.h>
> > >  #include <errno.h>
> > >  #include <inttypes.h>
> > >  #include <unistd.h>
> > > @@ -992,6 +993,34 @@ static int aslr_tool__process_sample(const struc=
t perf_tool *tool,
> > >                               COPY_U64();
> > >               }
> > >       }
> > > +
> > > +#define CHECK_SIMD() \
> > > +     do { \
> > > +             if (abi & PERF_SAMPLE_REGS_ABI_SIMD) { \
> > > +                     u64 nr_vector, vec_qwords; \
> > > +                     u64 nr_pred, pred_qwords; \
> > > +                     u64 header_len, vec_len, pred_len, simd_len; \
> > > +                     if (CHECK_BOUNDS(nr + 4, nr + 4)) { \
> > > +                             ret =3D -EFAULT; \
> > > +                             goto out_put; \
> > > +                     } \
> > > +                     header_len =3D 4; \
> > > +                     nr_vector =3D in_array[i + nr]; \
> > > +                     vec_qwords =3D in_array[i + nr + 1]; \
> > > +                     nr_pred =3D in_array[i + nr + 2]; \
> > > +                     pred_qwords =3D in_array[i + nr + 3]; \
> > > +                     if (check_mul_overflow(nr_vector, vec_qwords, &=
vec_len) || \
> > > +                         check_mul_overflow(nr_pred, pred_qwords, &p=
red_len) || \
> > > +                         check_add_overflow(vec_len, pred_len, &simd=
_len) || \
> > > +                         check_add_overflow(header_len, simd_len, &s=
imd_len) || \
> > > +                         check_add_overflow(nr, simd_len, &nr) || \
> > > +                         nr > max_i - i) { \
> > > +                             ret =3D -EFAULT; \
> > > +                             goto out_put; \
> > > +                     } \
> > > +             } \
> > > +     } while (0)
> > > +
> > >       if (orig_sample_type & PERF_SAMPLE_REGS_USER) {
> > >               u64 abi;
> > >
> > > @@ -1007,6 +1036,7 @@ static int aslr_tool__process_sample(const stru=
ct perf_tool *tool,
> > >                               ret =3D -EFAULT;
> > >                               goto out_put;
> > >                       }
> > > +                     CHECK_SIMD();
> > >                       i +=3D nr;
> > >               }
> > >       }
> > > @@ -1061,6 +1091,7 @@ static int aslr_tool__process_sample(const stru=
ct perf_tool *tool,
> > >                               ret =3D -EFAULT;
> > >                               goto out_put;
> > >                       }
> > > +                     CHECK_SIMD();
>
> nit: at the end of the function you could #undef CHECK_SIMD to make it
> more explicit that the macro only makes sense within the function.
>
> Thanks,
> Ian
>
> > >                       i +=3D nr;
> > >               }
> > >       }
> > >
> > > base-commit: 91b0782fc9e9d2f0a40b5256146e014802fdbb36
