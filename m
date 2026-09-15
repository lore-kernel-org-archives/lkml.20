Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6E638A702
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504532; cv=pass; b=SFVxgsp4ScpAMMThxhM/9R9Qc30YfaTlkGeU9Sj7hTkrqvkp3htfzAZ3ySHlOz6eJoVWI9aePGNyUBL9G6qPsqS6BhPIWqufMTeeYuDvFY0kT0ECWqLMZ6ptPLhO5ZM4Ths5W2F+2NtvzNOs67O718QQ1kvfujvRQ30bv0y01fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504532; c=relaxed/simple;
	bh=5S7mpZP1AY3zyRlpCCbQBhFtYbQmh0B/XXBCpp2Lb20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ubbr5GxUEFqtmqJSTF67m3F9InUDlbuDaytBEm4n5iiZWQAexU2y2jqVXDSU8qNajFrxR29bqSXFzae6LqCQQNkkSXKjuIJMCKz4pGWcXpiAWqXuoGplsnaUfCaHOo0gvoAMAwQDPZXiMzRQQmq9j1IkdEArMNe01jOA3DV77Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zr3p2cAC; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zr3p2cAC"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so9891cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789504530; cv=none;
        d=google.com; s=arc-20260327;
        b=L9QJ6wVrX09D8i8UUSVoIq3ylr7X8z/KXk8ZdBpXQqpECkPf1N9oWHNd0EP99KA1bx
         lzx2V28nmIdW0LIfmLALJlYILfOY+bSwRma7zbiKdctITuqPdKmb+HleQc8A52XbhRPI
         yl3ZOmPaWAkrfihu88EePwT+lPjFSP3XGvNb0YVxuSvKLwA2PLClwn744KNNabReLK10
         2PtpTdiy1cjjn6dquxwX2283VCj8c/dmPIDFY7uSJrgPp2AuD8R96R6qp5T8/qQe/1vP
         uKIs/6/SOILxbQx6b3ZOKd389tBnFkemRQUDReE5lgoMFuNO1Re43S1mTVkYGMemx7Jj
         zhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2aVaC40lcq/u8k1VkZQcJkdYTt7iyGlSRDBr2moFUHc=;
        fh=DghZvBrXvo1tJ9Rn/fBAbUkckdBhh9jzWLecDV4TgUA=;
        b=YlCodkvhas4auty5xhQ3jmptgd6eIUFcqs9MGVzTKe0VkNmu93qE2p3ep5qkC29fh/
         48TpmGhQQlp46kIt8kIfZpoOQ4M2ZDFor9H+fT2XtyssLoIyycKJfYZcAmUx8J/Q0qS7
         1NpEQVBqzfYonau1Qk9map7fEu2OA6V4IZlZoftibqg73K9md81RJ9YT9Z4Mgx9ET1ka
         PD+Xz5AYB0gTC5qDzzY4RTnWmz6X1aHQGQx3VGFsq1hCpCY+QbyWbIsNITAlocfDNzdY
         SAB3uH7v4o6JqPLFUSW7sR93M6pyxce1Tc1ZSR+/Hp8BV6w6ibpIg12D6GZbaDI1WwVY
         0kMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789504530; x=1790109330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2aVaC40lcq/u8k1VkZQcJkdYTt7iyGlSRDBr2moFUHc=;
        b=Zr3p2cACVABhMP6P0B0R7ypkrxLGrjhcLCXsNSJRlH6L2/0EVQq24FH/MSsKXAnAUK
         DpJ2iYYnCygY1W33R+ZgJ/XmfpH5averSOqbHqU1CBmbrzBFW2aZHKvrfxe47uun1d/V
         kfiPuoSMktxkVU6qcQcwkEvFWv9NA9rPUI6CYMk60QytB6Gmu0HnOFaC9YyE8+C0lTZ8
         YPhyy90g8jVyhuhCm6mUitOKt1pqQnWJNRQe7BLrxTRfd1L6Gs4j79kEKI4NLsJwahMB
         fzIxp7r/rNs+2XqOeCxjNm7rPLvt8Bd/koEqurxmDu4Tt/SiT10HD5+EoDonszML++xt
         tPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789504530; x=1790109330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aVaC40lcq/u8k1VkZQcJkdYTt7iyGlSRDBr2moFUHc=;
        b=IBlCQRr0kJHkUisBY6Lur9esZ8rbzDY5YAcZmuaWk0hmPdXk4EJwPcxpHhCTF1OwxC
         soTDcISlR2hH5eGs19ZUQ2QzZCQ3iH73Jqy6721dK5+eTtA0elT3PeDHkLfk4f1kbQ8c
         wjcebJitcCaTvjao/bFifD5soez7cEU/SpcawBxDX+jzhwMuZxVwIHpxIsrg+Uq3hMTL
         beFBCx8zChYcbqTWmT5lSBI3QGuX2WZTJJyO3cU3GnD8ntZy3V8noDXbos04J+HNMm25
         2Sg84Mnd8wwLxhIH0FHbTYTRUbOyRcvE9YvYnm2XCUTXySR+PqpH5bznCUndlPaMOQUk
         mo+g==
X-Forwarded-Encrypted: i=1; AKwUvBy2RXWO+Gfp0p5CYartVS/1wTSNGyg+Ql4QoTXcTWxKAgbEdoLXjK4PYZ3pYMgBtrXPfIMWHllM3pVD/S8=@vger.kernel.org
X-Gm-Message-State: AFuF++kjJ56GVx/RsM8ABJekzYrsOr4NteULJs0hImFZdqqQxDeGEKlx
	GadCp7FiGmoB7Lp0eU9VeAHxqBCfGQwsvhxJ5m5ZOPuudJY1FZOIX6MaC4gyGY7zREtSWmK5cuS
	1FC+V/Wb7nKCrPfi3N0i+YKCtk+vxf+5XdIDcFe1b
X-Gm-Gg: AYBFou0Q7m61PsiVGFkjxCwsM/S0QNdEm9uXzalMmSfiV1P0MfqHkAOsuhLwduyXM0X
	56Tucj4/tiwf9BcWKrBw0TTukZIBkLCZzKmWPuhUqBUuX1IqzZGDLguRzhTqt2p6Brm9f+oGZe+
	remeRs0UzK0gWWVDKqZQxWWjMmxRtLPLaSQcjFGzf0spvz9Gl6mxBlga6agXpp/wNWOMebTiQW/
	+b7+pdUJc397hH8Yr11M5PMDycuuv4/kk890H6V2VEGCeaqciCuHglHqi5cEeHfk7/QRTsMXNTa
	4tWT/1UCuIbrPt8ziraXHxWlxVgZADUyrwVYPimOkrlH+JPNm8G3yD4jAcr1jyW6omybVaWuwsk
	8+FIcOn89aA==
X-Received: by 2002:ac8:598f:0:b0:530:e335:4ef with SMTP id
 d75a77b69052e-532504fd10amr4107081cf.2.1789504529299; Tue, 15 Sep 2026
 13:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709183956.1545402-1-ctshao@google.com> <CAJpZYjVB2+gSAOQRyXhapkeJLHLRuYWV9FVDTWC5Q2r3HDmyKg@mail.gmail.com>
In-Reply-To: <CAJpZYjVB2+gSAOQRyXhapkeJLHLRuYWV9FVDTWC5Q2r3HDmyKg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 13:35:17 -0700
X-Gm-Features: AcwNN1W4gqyMNPoBiIR8TiCEp0MQHdibfJuLwrDHxW2S3LZJMj8Dnk6GlAiScOg
Message-ID: <CAP-5=fWYgweCU59usaUoBjV5crj1zAD3sWOQgNBJhDfJmJCdqg@mail.gmail.com>
Subject: Re: [PATCH] perf jevents: Add dynamic IIO PCIe bandwidth metrics for Intel
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Taylor, Perry" <perry.taylor@intel.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 2:34=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> wr=
ote:
>
> + Perry for reviewing the metric.
>
>
> On Thu, Jul 9, 2026 at 11:39=E2=80=AFAM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > Generate per-IIO-device PCIe read and write bandwidth metrics
> > (iio_bandwidth_read_per_device_0, etc.) grouped under
> > iio_bandwidth_per_device for Sapphire Rapids and newer architectures
> > in intel_metrics.py.
> >
> > By using has_event() checks across up to 24 possible IIO stack indices,
> > runtime perf automatically monitors only the IIO root complexes present
> > on the system without failing on missing instances.
> >
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > Assisted-by: Gemini:gemini-3.1-pro-preview

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > ---
> >  tools/perf/pmu-events/intel_metrics.py | 52 ++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >
> > diff --git a/tools/perf/pmu-events/intel_metrics.py b/tools/perf/pmu-ev=
ents/intel_metrics.py
> > index bc2b920d3a0d..4f8a123a375d 100755
> > --- a/tools/perf/pmu-events/intel_metrics.py
> > +++ b/tools/perf/pmu-events/intel_metrics.py
> > @@ -1132,6 +1132,57 @@ def UncoreUpiBw() -> Optional[MetricGroup]:
> >      ], description=3D"UPI Bandwidth")
> >
> >
> > +def UncoreIioBw() -> Optional[MetricGroup]:
> > +    if _args.model not in [
> > +        "sapphirerapids",
> > +        "emeraldrapids",
> > +        "graniterapids",
> > +        "sierraforest",
> > +        "clearwaterforest",
> > +    ]:
> > +      return None
> > +
> > +    # On multi-socket x86 servers, there can be multiple IIO stacks pe=
r socket.
> > +    # We generate metrics up to index 23 with has_event check so runti=
me perf
> > +    # only measures the IIO instances present on the system.
> > +    max_iios =3D 24
> > +    metrics =3D []
> > +    scale =3D 4 / 1_000_000
> > +    for i in range(max_iios):
> > +      rd_event =3D Event(
> > +          f"uncore_iio_{i}/UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.ALL_PARTS/=
"
> > +      )
> > +      wr_event =3D Event(
> > +          f"uncore_iio_{i}/UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.ALL_PARTS=
/"
> > +      )
> > +      rd_bw =3D Select(d_ratio(rd_event, interval_sec), has_event(rd_e=
vent), 0)
> > +      wr_bw =3D Select(d_ratio(wr_event, interval_sec), has_event(wr_e=
vent), 0)
> > +      metrics.append(
> > +          MetricGroup(
> > +              f"iio_bandwidth_per_device_iio{i}",
> > +              [
> > +                  Metric(
> > +                      f"iio_bandwidth_read_per_device_{i}",
> > +                      f"IIO {i} read bandwidth",
> > +                      rd_bw,
> > +                      f"{scale}MB/s",
> > +                  ),
> > +                  Metric(
> > +                      f"iio_bandwidth_write_per_device_{i}",
> > +                      f"IIO {i} write bandwidth",
> > +                      wr_bw,
> > +                      f"{scale}MB/s",
> > +                  ),
> > +              ],
> > +          )
> > +      )
> > +    return MetricGroup(
> > +        "iio_bandwidth_per_device",
> > +        metrics,
> > +        description=3D"IIO Read/Write Bandwidth per root complex",
> > +    )
> > +
> > +
> >  def main() -> None:
> >      global _args
> >
> > @@ -1179,6 +1230,7 @@ def main() -> None:
> >          UncoreMemBw(),
> >          UncoreMemSat(),
> >          UncoreUpiBw(),
> > +        UncoreIioBw(),
> >      ])
> >
> >      if _args.metricgroups:
> > --
> > 2.55.0.795.g602f6c329a-goog
> >
