Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED134D17A0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007687; cv=pass; b=jRLQy4uNbm1bmmQG9hdhjUTO5QCZa5at5A5viWk+A10mpFwkLAz7eNOVVTXV2sBQjzkkoxu9e+L4FlXTjdCstwbzhGxCe9b708IhyVIRP9HRcNmfEM2RkbpQPZm22/PasjmIv5vxIWm1mj6heeDNf+N6t8dS7qEYrvpPGpndqRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007687; c=relaxed/simple;
	bh=lwo+qtgHhggI0M4y9uJX2oJZaaSUrOh3zbbAT36q7nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6M0d7KOsASKjUMpf9HKtQMVTxxNTOItDLtqEvmhBMbhwbZnIIETu035VDZUa/RLluEJkS8Y1Y4uleAEKQ+L0amcGSeI7yg032/yZFVdEQLDucudfdOfUAQaD4P/UxhftssO/0hGzanql9Bmsce1suBjSTP+vdS5axLPedf7mIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SX29uYhI; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SX29uYhI"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53113d72966so502041cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790007685; cv=none;
        d=google.com; s=arc-20260327;
        b=Oe5fd3rSj8MpnwXYjN/xQ5TgH3ZAxM6yQeshbUNdWwiXdz68kEp91M4WXwZa+seh2I
         sU7mv2FY2LsnHgwHP+tigqO0KmkapLyq9hPTYb354GjofajX/K0L3jB6c/gv3+TJuWXv
         Q593yaHAwdTxwSg90T4Qu32nfTXzLIS2Rz5Z/A89sjMoszMORUKJHirzHQ3kR88u1Y3+
         x4kju+ZFV9S2al3iw9t6qDADUfRXcaTGpVy/LbF6QkO9al7+DORrWdPZ+xA4foZkb4ya
         G5zXpTCHcY/PQI6t7PcZ/RKMxdFa1KD+kG/dMtf6/T0vdl8COC2mP4RQP7J8+nSmo9kc
         XurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xk7Q0swZ4Ds1t7boohhglrST5MnHaW9AqFXnNH+nuUM=;
        fh=SFHBkIAxqL4LVu4FfyOz9UhiHdeCRPklZAnowbYiNfg=;
        b=VZdlcmFeMS2z/VkJhoHJFPtd4OeozqJY7ql0uVlIG4ydCgquAIRR9zymx2XUJgAkh3
         9nCHhsIVb38Ure3reKc5uLARr4Jpl9steU6jns+zezr+V+cpQB2PvmvlarA7K4OVRS8n
         rZSdwiZMdG/c4UVV9a/uEKFCYpbR4riiVeQDlQrtRnwBPGxFpbnhWH/K3fEuEmGprnCB
         4Htdv5s3deeTpi2JDxftsQibORvjFi015eEt1aJyU6leBPo9v+tOPJNnF3KwFKSYLhcA
         kIxPwOQRSAGcOmv0p8TclTkL6yhEQzsrbsULLOFgt9KtH8IPG/b4qYsfsJ/mq5b+/5x/
         UPRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790007685; x=1790612485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xk7Q0swZ4Ds1t7boohhglrST5MnHaW9AqFXnNH+nuUM=;
        b=SX29uYhIP0J9u5S2tCdRdRXOt/UEmlLj++ago/n+eB/4EQcCjKDT3qIS9FCDumnHtV
         L9Cnrsegn4lFn6fva6rjl/LfivFBWpTLTWtqt7Vq8bw78D3FwFzUD8Ssz+tQFvkiBrC9
         i906YfHCeqqk6DwPx8AwHfspYgLhY564e99wbvePYRNFiaHsfmmKgSIgJE6nqccivc2x
         bI/KwT1iST6Q8322NqjnnVnYSPn7KRhDELnViwH5hrirWyJMmRQQsf0oEozBhCOkM3Bq
         C+UFNa3s5bRu/GF57wCp3f1FjHSUin/18uA/eGOCAwYVX0MEe6dsX5FQ+uqWFRn4Wcxs
         uwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007685; x=1790612485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xk7Q0swZ4Ds1t7boohhglrST5MnHaW9AqFXnNH+nuUM=;
        b=puTkC1+sW/lhYpNp9G2km2Cv3KF3ezi7/1xdFYN5yz5hfbxkWNzrpDu6VUrTdyRnsI
         4BB8Ic+rMtE395Em+oP83lmB/AMc5Y0nBH7eWdWzgISOcJOeGr+gGf2xpweTtpJXeS6D
         FGuneUQ0VIrBZ5RTtjWpLcjcXKNM27mi0aiR3A6Zska//62ZXPc8lNSjd9X8MTqMLHFa
         QcOXsFkSGZfREnZ7D0LOjGDcNG9jfbuQG4YZoow1fh9OUeJ5tj+evtIr5y13uzeiOsU5
         IDxPkQ60OhgwoMMq3NT8bP6GFg10qAN2kwup29UaB08ZXJ7dGvCcTihTwYzzJws75mz1
         LE+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRp/lEWc6MwesmEYmMulr2iUQUFqqz+ZrOsxOExQD2+mAZO2trFzNZmev7l0Fa0/eUrh37elKwZM/kbUc=@vger.kernel.org
X-Gm-Message-State: AFuF++kE1oR8FdhOlY8MqzKBgz5UIA0yRMvZ0tT2LFkGrLUaG7k0NJbM
	eAIobYDKo3Jr64/KPAXo3JNFip9et4bTuNMIhZtAlquo2odnyglYlNHoOmg41m8PVjm7M8R/wFQ
	PEjRb46PapXZFQT6KYQLUN1shoYzg26WYLRKSeGcB
X-Gm-Gg: AYBFou0dyKCDV4Eh26ILG3ZRqT+6IPod4PWBq3dg4jR4kB2qjozVcloD1Gtj5cGqgt1
	IQrs+P/4t/Wnkl4XEeN3hs86qDF0aMTwpgm66g6adY9bylM2Bw5CnhquogT8nH7qEBh30XIk2pO
	n9QrpGygliOxlGuepvNchbSAM3VC3yqCXPwSw7sxjahKldJHgPUTmfmzQpg7LnYMCyapaeEXAAG
	Tw6wySbFnIJo4WDX9zE/L4xWWMQbJlHXMvo60M7WX76cinM0dVQCNvqydgYmmIoWzSj77Ij1DUe
	1DrglulJEPPcQXUoujp1kKW7dtosl3+ZqQWO+9bV+YSrL/cwj/g/U28pkkL+/JDoqVBDRYLOA7U
	1F3J+Spt0
X-Received: by 2002:ac8:5c90:0:b0:532:9d15:2e5a with SMTP id
 d75a77b69052e-532d8d31243mr5133341cf.1.1790007684100; Mon, 21 Sep 2026
 09:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915091112.333308-1-dapeng1.mi@linux.intel.com> <024fd251-a4ba-443f-8aff-f5b1cdb062a3@linux.intel.com>
In-Reply-To: <024fd251-a4ba-443f-8aff-f5b1cdb062a3@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 09:21:11 -0700
X-Gm-Features: AcwNN1WlRuT2junyV5TVza_msH6V6SCAykTC56KHUponUO2k358vwY1g1Z7ZAmY
Message-ID: <CAP-5=fUc_WOHAe4EkLVYuBgvQmxk7_XY4N+v8yJKNJQpCSObHg@mail.gmail.com>
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

On Sun, Sep 20, 2026 at 11:42=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
> Kindly ping ...
>
> @Arnaldo, @Namhyung, @Ian, not sure if you have bandwidth to review this
> small patchset which fixes the Sashiko found minor issues for the "Perf
> tools: Support eGPRs/SSP/SIMD registers sampling" patchset?
>
> If possible, it's better to be queued in this cycle, then we don't need
> extra backporting. Thanks.

Reviewed-by: Ian Rogers <irogers@google.com>

> On 9/15/2026 5:11 PM, Dapeng Mi wrote:
> > Currently the SIMD register sampling is supported, but the correspondin=
g
> > handling is missed in aslr_tool__process_sample(). This can break parsi=
ng
> > of the sample record.
> >
> > Add the missing SIMD register handling in aslr_tool__process_sample().
> >
> > Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> > ---
> >
> > These two patches fix Sashiko reported defects for the patchset:
> > "Perf tools: Support eGPRs/SSP/SIMD registers sampling"
> > https://lore.kernel.org/all/20260914014049.2061519-1-dapeng1.mi@linux.i=
ntel.com/
> >
> >  tools/perf/util/aslr.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
> > index 027695d96779..a097084201a0 100644
> > --- a/tools/perf/util/aslr.c
> > +++ b/tools/perf/util/aslr.c
> > @@ -19,6 +19,7 @@
> >  #include <internal/lib.h>  /* page_size */
> >  #include <linux/compiler.h>
> >  #include <linux/zalloc.h>
> > +#include <linux/overflow.h>
> >  #include <errno.h>
> >  #include <inttypes.h>
> >  #include <unistd.h>
> > @@ -992,6 +993,34 @@ static int aslr_tool__process_sample(const struct =
perf_tool *tool,
> >                               COPY_U64();
> >               }
> >       }
> > +
> > +#define CHECK_SIMD() \
> > +     do { \
> > +             if (abi & PERF_SAMPLE_REGS_ABI_SIMD) { \
> > +                     u64 nr_vector, vec_qwords; \
> > +                     u64 nr_pred, pred_qwords; \
> > +                     u64 header_len, vec_len, pred_len, simd_len; \
> > +                     if (CHECK_BOUNDS(nr + 4, nr + 4)) { \
> > +                             ret =3D -EFAULT; \
> > +                             goto out_put; \
> > +                     } \
> > +                     header_len =3D 4; \
> > +                     nr_vector =3D in_array[i + nr]; \
> > +                     vec_qwords =3D in_array[i + nr + 1]; \
> > +                     nr_pred =3D in_array[i + nr + 2]; \
> > +                     pred_qwords =3D in_array[i + nr + 3]; \
> > +                     if (check_mul_overflow(nr_vector, vec_qwords, &ve=
c_len) || \
> > +                         check_mul_overflow(nr_pred, pred_qwords, &pre=
d_len) || \
> > +                         check_add_overflow(vec_len, pred_len, &simd_l=
en) || \
> > +                         check_add_overflow(header_len, simd_len, &sim=
d_len) || \
> > +                         check_add_overflow(nr, simd_len, &nr) || \
> > +                         nr > max_i - i) { \
> > +                             ret =3D -EFAULT; \
> > +                             goto out_put; \
> > +                     } \
> > +             } \
> > +     } while (0)
> > +
> >       if (orig_sample_type & PERF_SAMPLE_REGS_USER) {
> >               u64 abi;
> >
> > @@ -1007,6 +1036,7 @@ static int aslr_tool__process_sample(const struct=
 perf_tool *tool,
> >                               ret =3D -EFAULT;
> >                               goto out_put;
> >                       }
> > +                     CHECK_SIMD();
> >                       i +=3D nr;
> >               }
> >       }
> > @@ -1061,6 +1091,7 @@ static int aslr_tool__process_sample(const struct=
 perf_tool *tool,
> >                               ret =3D -EFAULT;
> >                               goto out_put;
> >                       }
> > +                     CHECK_SIMD();

nit: at the end of the function you could #undef CHECK_SIMD to make it
more explicit that the macro only makes sense within the function.

Thanks,
Ian

> >                       i +=3D nr;
> >               }
> >       }
> >
> > base-commit: 91b0782fc9e9d2f0a40b5256146e014802fdbb36
