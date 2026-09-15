Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810253DAAC8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505381; cv=pass; b=BvGY96kdFHmDsKGnB5SCDgcMAkLGVRn/ORPkzblmQJXK2YpalLmnHeXnshPUJ1ohHLRMsSiT2T6skRMz5pPVHNuHTE+0sz4mQLb9crsP54cLJwlZ8PF+cfkBJhoMqC9xrUr2PBJ6jCbkuxz4cm2ideXju0jie6kGgq9gcCZmMVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505381; c=relaxed/simple;
	bh=9EdZsGvujjYIOTMuVHcupJXRk6h68fFRzhsC3Ifbu8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqLCsgu6MuqaLb+GNLnwCWqGnmKNORPlJAY5sNFdRfdZ+eQZ+IosHdvIwUAvcv/bmqTpvEz1DupGfAlTm2/M4z2PIERB/GJIm8fevq+be/+LXpHQXSWFEySJoOR42/9iho76vH2HMIDluRBR6suGxv4S7Ika7R6P56i8mlKzUK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c9N6NwEm; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c9N6NwEm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b350c6920so211280a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789505375; cv=none;
        d=google.com; s=arc-20260327;
        b=Uu5iA0ZXw/9KW4FD4F18XS/3M1Qjns0EcCDp6vD1rkbv9MCAbUO2EkV7/t/WFIjHfC
         rKu741cvtSXbF++6606lr4X8de4XyLIdfFWSx9csPHz1vYLI3XAu0PKyavuZhpVIayj7
         PRQ9cZfKvSCcVxzVThsplDA3khDas0sCkFQSxWD2uTr9u7aybzq75QF6LvYj7dFYl1ZW
         1JGFu9+7/uB6dOAUe5C+skKROQRoy3pOYKVYxqU2LL1nxKuUlse/wtoHMhoMxoN9P0U9
         O2HRLHcPhPkl/8gVapXOGuz2JJ6Ic0N8kvmqbxNDjS8qddX86DL2kXVFJP/w0GhLcr6J
         UUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sahGWJ8mHho7FuY7s/PNI6v8DL9Wdyd6nKrCQOAAOlQ=;
        fh=O7B8895apvZaigFb5sevDnowQY2cEReNY7mLNSjug6w=;
        b=nHFAf6IAiypnl1DNcCiMtD43cuGZNIgQQrCoTjw/ZHXbIqE2AMTijf4Jplz+sLZHr0
         +YVzyb1Vwk4ej3IP5E691AsI69roCNDoN8NDgUvTVnd/sopgoXJZ60lV9Sq/5JbalGBW
         Z//mbaTf4+hiKoG0Amso1VGWq2T7kdMqv7ZNujb9OpoxurUvg2vo9s5LeigzM0kPpUgF
         JYGHTPy+IhCskn4Pa9ARoTTpbXfpopKfQuo1tT6TUABSvz+VW2CclyvZJxHzlk1nGeHx
         iznijbFHEzKUKAKWlQwVgTRrmJ+2VK8paUyYk+Siz4fD28BcXZqs/qUVJmJ4iQkOAw16
         Xk4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789505375; x=1790110175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sahGWJ8mHho7FuY7s/PNI6v8DL9Wdyd6nKrCQOAAOlQ=;
        b=c9N6NwEmD/94m/99FgD7tnAMERgQpAHg2M0K1tfyyQq0yR5iX+5KP5iRdGzodB+Cko
         fF0eVaZ6IiYrL1L1i0CE3OitFpVozx2urgeha8sbpBghCghjZM4CXVNNm23kP1qU8Ny8
         ad7dKrMC5RoxokrWdDshLVnap1Af4nknXDY1uFmJAn/QMI9pCWHw+FepV6gMRZO+MbQm
         fqDgoDrf10AM91qXBaWkSUS9uxo/Hf2JHHCO6MXXTGsVOMguwcTRQ+84DXx7CTumVY6m
         o3Fv01kMNvnrcZK0UpmQASX5SLjOTFoVE2lZEiAclQ41gQ17fDWQjGDRDVObnoGWLiBL
         Fe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505375; x=1790110175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sahGWJ8mHho7FuY7s/PNI6v8DL9Wdyd6nKrCQOAAOlQ=;
        b=PMP9/U3BvFTJ9nEQkeq2jr/YzEHpA6FokFh27xKA3zdnJnqqVmC2gOm3UOSl501kkI
         yc2cugP+ODl9dXlnrldpRlt7Srh98RkpGjcdFntV2pw7f8Ow87obV8NJ6rlr5bxKFxWB
         FzkxTEIYGft38vVsuSOmkxvTjJjYtdNqRVlkOgxhshA2e6M09aweoitihuhjFzj31vot
         K1p65yqUnzaDYjaIbaYViuwqKi6hg6yntdQcMyziXdV3xy/xvkq5/mrXVMxA1yGMZUtl
         LEjhnru4hJ8veFNZSDt+KZjIFxuuYbStF+1DojjnaVifF7u9zarDzzm9EYJgrQsNdWp5
         /GIg==
X-Forwarded-Encrypted: i=1; AKwUvBzo4ZMmiG91SSBdUuv0Ck6P1UsNu7lLw2XgRIWQcCqBbtx2v7f2TfyKMiBwtvn3lYBhOqhsN1fpO7TZA2E=@vger.kernel.org
X-Gm-Message-State: AFuF++mJFwC8DC4hGK5nyDLQPTnS3nY+DZ87Y+m8z0dzIGNFi0giHcOf
	iWntdqBYopRSeed7kCSYPq5kq2rHIjEMLw1Jk71DK5lBwKXGDAtBfHGdGaMSFMrvfr8M/kb/vQO
	uGdo9Aw6aaYNH/ciWw8x9e5gVjbYhpp1KELe/wfJ1jxZe4VOwwsniGYxrcMM=
X-Gm-Gg: AYBFou00xAjOYM4uvOAj5SxP8fkvVwSFux3mNL6X2FnTHeej9I7oErrH+rN6GtCqXUE
	yuiw1R5caCUuUHC8w2kdDsUeYDx99oCiBfJQBbt44s3NavSWCUwxCxfM5tMvoQ2xZwQ2UDraUI1
	8di8oHwHcGXM6VfwVXkTNW2feh6e9ls3Yo+2ZBG4jT4NrIpPX7GDdEKwRJ/KywT6wPz07Im4XpY
	y1iKl6AOdW42Kz5zlUG8zs3CwmUjMajo0F2r/sQcJX9sdqXncgdMlgQLruHKtorTca0zqMCbeXh
	ACh1n6qbntmobdtOzAZ38IdSh9nFBJT9o5H7Jo93+4MGrD10zHHaIA==
X-Received: by 2002:a17:90b:1dcf:b0:39e:132d:df19 with SMTP id
 98e67ed59e1d1-39e1e37a7c0mr224021a91.10.1789505375061; Tue, 15 Sep 2026
 13:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709183956.1545402-1-ctshao@google.com> <CAJpZYjVB2+gSAOQRyXhapkeJLHLRuYWV9FVDTWC5Q2r3HDmyKg@mail.gmail.com>
 <CAP-5=fWYgweCU59usaUoBjV5crj1zAD3sWOQgNBJhDfJmJCdqg@mail.gmail.com>
In-Reply-To: <CAP-5=fWYgweCU59usaUoBjV5crj1zAD3sWOQgNBJhDfJmJCdqg@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 15 Sep 2026 13:48:58 -0700
X-Gm-Features: AcwNN1VpPDXLGqPZoqx4hTkxvamAlRNbPISw5gUK3huIUy48cc0qaQlKQaYuy5U
Message-ID: <CAJpZYjV2g7f=UUSek6vS1Kej_XYm5Gn4qP8kAxCarNQTDeUssA@mail.gmail.com>
Subject: Re: [PATCH] perf jevents: Add dynamic IIO PCIe bandwidth metrics for Intel
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Taylor, Perry" <perry.taylor@intel.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:35=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Thu, Jul 9, 2026 at 2:34=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> =
wrote:
> >
> > + Perry for reviewing the metric.
> >
> >
> > On Thu, Jul 9, 2026 at 11:39=E2=80=AFAM Chun-Tse Shao <ctshao@google.co=
m> wrote:
> > >
> > > Generate per-IIO-device PCIe read and write bandwidth metrics
> > > (iio_bandwidth_read_per_device_0, etc.) grouped under
> > > iio_bandwidth_per_device for Sapphire Rapids and newer architectures
> > > in intel_metrics.py.
> > >
> > > By using has_event() checks across up to 24 possible IIO stack indice=
s,
> > > runtime perf automatically monitors only the IIO root complexes prese=
nt
> > > on the system without failing on missing instances.
> > >
> > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > Assisted-by: Gemini:gemini-3.1-pro-preview
>
> Reviewed-by: Ian Rogers <irogers@google.com>
>
> Thanks,
> Ian

Thank you Ian for reviewing the patch! I had an offline discussion
with Intel and we found:
1.  iio_bandwidth_read/write is only missing on EMR and Intel fixed
that through event updates:
lore.kernel.org/20260714204044.1952031-13-ctshao@google.com
2. -A option does not work well with uncore events and I have a wip
fix for that: lore.kernel.org/20260811230518.3360-2-ctshao@google.com

The patch is no longer necessary.

-CT

>
> > > ---
> > >  tools/perf/pmu-events/intel_metrics.py | 52 ++++++++++++++++++++++++=
++
> > >  1 file changed, 52 insertions(+)
> > >
> > > diff --git a/tools/perf/pmu-events/intel_metrics.py b/tools/perf/pmu-=
events/intel_metrics.py
> > > index bc2b920d3a0d..4f8a123a375d 100755
> > > --- a/tools/perf/pmu-events/intel_metrics.py
> > > +++ b/tools/perf/pmu-events/intel_metrics.py
> > > @@ -1132,6 +1132,57 @@ def UncoreUpiBw() -> Optional[MetricGroup]:
> > >      ], description=3D"UPI Bandwidth")
> > >
> > >
> > > +def UncoreIioBw() -> Optional[MetricGroup]:
> > > +    if _args.model not in [
> > > +        "sapphirerapids",
> > > +        "emeraldrapids",
> > > +        "graniterapids",
> > > +        "sierraforest",
> > > +        "clearwaterforest",
> > > +    ]:
> > > +      return None
> > > +
> > > +    # On multi-socket x86 servers, there can be multiple IIO stacks =
per socket.
> > > +    # We generate metrics up to index 23 with has_event check so run=
time perf
> > > +    # only measures the IIO instances present on the system.
> > > +    max_iios =3D 24
> > > +    metrics =3D []
> > > +    scale =3D 4 / 1_000_000
> > > +    for i in range(max_iios):
> > > +      rd_event =3D Event(
> > > +          f"uncore_iio_{i}/UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.ALL_PART=
S/"
> > > +      )
> > > +      wr_event =3D Event(
> > > +          f"uncore_iio_{i}/UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.ALL_PAR=
TS/"
> > > +      )
> > > +      rd_bw =3D Select(d_ratio(rd_event, interval_sec), has_event(rd=
_event), 0)
> > > +      wr_bw =3D Select(d_ratio(wr_event, interval_sec), has_event(wr=
_event), 0)
> > > +      metrics.append(
> > > +          MetricGroup(
> > > +              f"iio_bandwidth_per_device_iio{i}",
> > > +              [
> > > +                  Metric(
> > > +                      f"iio_bandwidth_read_per_device_{i}",
> > > +                      f"IIO {i} read bandwidth",
> > > +                      rd_bw,
> > > +                      f"{scale}MB/s",
> > > +                  ),
> > > +                  Metric(
> > > +                      f"iio_bandwidth_write_per_device_{i}",
> > > +                      f"IIO {i} write bandwidth",
> > > +                      wr_bw,
> > > +                      f"{scale}MB/s",
> > > +                  ),
> > > +              ],
> > > +          )
> > > +      )
> > > +    return MetricGroup(
> > > +        "iio_bandwidth_per_device",
> > > +        metrics,
> > > +        description=3D"IIO Read/Write Bandwidth per root complex",
> > > +    )
> > > +
> > > +
> > >  def main() -> None:
> > >      global _args
> > >
> > > @@ -1179,6 +1230,7 @@ def main() -> None:
> > >          UncoreMemBw(),
> > >          UncoreMemSat(),
> > >          UncoreUpiBw(),
> > > +        UncoreIioBw(),
> > >      ])
> > >
> > >      if _args.metricgroups:
> > > --
> > > 2.55.0.795.g602f6c329a-goog
> > >
