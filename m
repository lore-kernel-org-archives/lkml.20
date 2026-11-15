Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779430;
	b=1xHTlTwB3Ogo+fvSS/CFrkSsBqjLjx4JzWsObXQBtz6MxKDRHyXOXtaXf7H2PhIGWlTv
	 252tGd3hHfO496pUdCR+8NSFs+TX10xuzjvYzOXu+0BcvctVAPE9vrNxT0r6RcVoiTLvk
	 KNVtO3obzpOrHAwqBR9bL9etyj1pKLuSanci+s1TSzcmuoMRNRgx9ohoLensKPNqQf9Jc
	 odATbt1GyaYw+oe7Vzu5V5xKke9w5EkMck6Dairq7QK6c9jph821xAGlLRCCz05sLtknc
	 Vf3A3FR6ZBrEYrT2/K/jX6xb66QXnEqJrSvQGOamRQiO9NnZcLZp9ea+gq5HEdpsrTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IXU62tDqDlPa8WP58YWeZoAMWcu6GI1CQ2+oK0ofgos=;
	b=4QAnHBcD8oywrEL2s5KAuvoAbNLX1qBJ8qYxGuz0B6JUxn2YXeex5zVxotZ5ZQ3daWWo
	 nrcdOgcA/dnHvRub2pp1bsfUAzrVezjbeyOsUHKIVudaIoJHVQLV782IQEO76cPDyx+KT
	 RdKc9v/Qz9Cha9errIas0irQ17PsCRo9JCvT5Dg78CHapeVjTxgSJXQ0xl/sw4PsyEWU/
	 B2wvLLfuv9sguKfbCXaTmv7+2sDjH3c7HZfGxpHlRUzriQCpANh+L1Si6HVYfMS/RY6qe
	 6BVczvF5qKA0HVXewnCgvWJifb95NbnRIYkT5Ppb2c33CFSGhk6sy50QmGdKcvR2HjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y4j8k5Uz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78F606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C78F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y4j8k5Uz
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so206691cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779429; cv=none;
        d=google.com; s=arc-20260327;
        b=UIyGA5Gr9f9bU9QFS8RTBkINcQMcD8wjCo4XZaEh+vpmfA85q7T+4D23FsVXNZDRgv
         77hApMW9IiQ/nE26u3i/Bgg1Z7heWdXgMSwm36gT40irt2zs9pOs2iO3i3j6Eji2sb5a
         pzosAL+paAkuEr7m1Cd5br5TdjWeYuwQ6YvxpTap0Ck4SJc5VXf/byqip9AsQCPxK9jP
         H7Nt5eQQ5wsrvxqfR/rDCBdoM/VmrjLHelQK6apkM4/yY10PGBa1Ec6f8MArJN4ju1Qo
         uNtmRUEeHQkMdvceEzstz3VJh6Ni/yW3/XsmPJ5PIXDS98s+d0ho2/t5HdpKzK6rSk2C
         yckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXU62tDqDlPa8WP58YWeZoAMWcu6GI1CQ2+oK0ofgos=;
        fh=2UkOixf6bx2MUnLfOBja9pY0jvcCaCeD6nOm8mS3jn4=;
        b=lhVd3QRXrPlLrj4McnpPO4163b6cWS8kvaVWmkh8X/s4iihSp8JBHqgeOn98pr3i5A
         +Lx5U56zCYzKXj3xI3We25lXMMEUCazad6BLM7jX2eeHiSQWhDUVoaYt8Sorr1lvsOT+
         ucK9D8NwXdHkotCJjH/54C16wjD84ocsAsMXlZ424U7NbmPFx68N7TGeUYI8Kwk1qg1q
         6ZKewv2Rsn7w3oy/ZL5J0VTsQzmdix/kmPMRpnQ7Nkp8w4AGpjtSMndDVWMn+ygaYBf5
         Bv91dX+ODzBojQBAYW737JOOlEicXYNw/1ZV2Ud73KdW9ADSsVWThzkj4oVdOH8xI0HG
         pv/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779429; x=1795384229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXU62tDqDlPa8WP58YWeZoAMWcu6GI1CQ2+oK0ofgos=;
        b=Y4j8k5UzHH28Gndkeb1c4qa8DdTS+g7kJdR6p7G5unP6DFNaIyE/mEmxz8ne/dQlWW
         0ywpQoswLpJMR6G9MTbrwoN0geyLYn/5uC481qwXmSOOl8O5BHcY67HvX+U08/YCsm/3
         eVcC5kz+02L+Tmlm3DlgY3G7++9agy6du7/F5TfDJ/TDY5DW59ZgA/ZuIfdlRpY+MbLF
         mPNTiZZD8I7uhWkzMmFj+nEuVBeC9tM2x88MjRswHm6OYPy8gOujFlQ99o8l+X/oPRBv
         26ITE8sDbejsVFDlIkWci4CMw5SGquelkrRAvMXwH/vGY0n3TZz9H5IToWP8aAbcd81x
         2umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779429; x=1795384229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXU62tDqDlPa8WP58YWeZoAMWcu6GI1CQ2+oK0ofgos=;
        b=XOep/R/svOZ5Mgg5BtMouyPDZqD8LP7D9P2gl/3KLevh8m2WRSn0lGGvblb1fHdL1a
         qVksQJ+1DGjhLTDfHVkXYvpwLZvvsth/hAFol0oFf71LsZh2r3c4BXw4mggVNqqWyupx
         mEW9oAIQYY6PdQZrxAmyUO6Uy69w9JOUB8QTwp8Rc7zmhGG7AoY5TC+Hk0V4qVR5cjXY
         4Rlg2UXOMbIdbXAjXvJ5Cne30SVYTvoPYIlQV9jQMVNf0QBogwMAPHJLVlG96NjgCdJe
         LHhs4wtzXZmZaMbFMf8jQPUX+V8zsZy6jOolgyyooH9qEX1pHIs4/y61WPZNvt4BU45l
         Nu+w==
X-Forwarded-Encrypted: i=1; AL+hErEfh11FHoBtwGdV8nb6ktncAjpyB9tPiQWSlRGQdjCsjGYulL2hea+kfAW27A9a1wjai1Utgr9uU2SqNEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//iena/YVW9zJ8Ps/8eK0E0dyx5Qi5L1KzfQsljlAc+CGrutnC
	M+OyxdGs2YqwQKg82KojykM7qkkElrmaEe3sLenMyxM/9KHgHEAgV9bnKYK30CY/QPB+/IEBvw6
	plymuTIMs74xeJ+ufX4tsZguyOIM/M+MfnOnF88VF
X-Gm-Gg: AYBFou1mW6weYFFdjwHp6ptjIiFjAc590Q3h3/mD9iv+jpCH6bOqXVxsmNznQQf9c/Y
	mtGnxnO2/WM2EgNCuIKgigK66RBzJqxlcEMSWqrue5tHCOGF5eK/qlt4ynYkfwaoxgWuzazCRBx
	cozR2cUaxLjl/bXn3DFa51JPiTCit3lSBeMboeU0DJuabaTKROBWK0k7OMVIBl7REPN1/w4Tc47
	TSJEDxnzSn5T1mK/VXfLsq29lbYhGEDNaa7pG6xKmBrpxKFD7YLwtJzLVWbB6NZzO6oSp8hwqHK
	wCNHm4HrrSz1hXSKKGabVj1pgsWSuwWLDV5/ysQNGqmOx8w2R0eP1x1vu5r7TjIDqz8o5U39N05
	pFelIccLmY0xKK5WTNORudy/mAaIlJA6hvH/F
X-Received: by 2002:a05:622a:260f:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55c469d0cdamr27769951cf.3.1794779428083; Sun, 15 Nov 2026
 13:50:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-11-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-11-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:50:17 -0800
X-Gm-Features: AclHuK8mtb7OHEdWaioT9vcHYZkKdQOkvKFCVhQFs0OYc4w9wKMgClYreMyBMqA
Message-ID: <CAP-5=fVp0LULSbnKJw4OOdN++FCmD-kPBbyOQoN1A+O7SSRNPw@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] perf tests: Fix the Intel PT virtual LBR check
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> The record this check uses writes aux samples, and with the single data
> page the other tests ask for they are lost:
>
>   Warning: Processed 29 samples and lost 100.00%
>
> so no branches are decoded and the check fails with "Failed with virtual
> lbr".  Record with 4 data pages and 128 auxtrace pages: the same trace
> decodes 64 branches and still fits the mlock budget.
>
> Require the python perf module to provide session, not just to be
> importable: a perf whose python bindings are not found can pick up an
> unrelated module and fail with
>
>   Error processing events: module 'perf' has no attribute 'session'
>
> instead of skipping the subtest.
>
> Detected building perf on fedora:44 on the runner with Intel PT hardware,
> where the subtest failed with "Failed with virtual lbr" in the container,
> and with the python error when run as root on the same machine.
>
> Fixes: 915d6b14dc0c ("perf test: Migrate Intel PT virtual LBR test to Pyt=
hon API")
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/test_intel_pt.sh | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/s=
hell/test_intel_pt.sh
> index c0ecece0a8255124..511440b5956a6897 100755
> --- a/tools/perf/tests/shell/test_intel_pt.sh
> +++ b/tools/perf/tests/shell/test_intel_pt.sh
> @@ -384,13 +384,14 @@ test_virtual_lbr()
>         # shellcheck source=3Dlib/setup_python.sh
>         . "${shelldir}"/lib/setup_python.sh
>
> -       if ! "$PYTHON" -c 'import perf' > /dev/null 2>&1; then
> -               echo "SKIP: Python perf module not found"
> +       if ! "$PYTHON" -c 'import perf; perf.session' > /dev/null 2>&1; t=
hen
> +               echo "SKIP: Python perf module with session support not f=
ound"
>                 return 2
>         fi
>
> -       # Check if virtual lbr is working
> -       perf_record_no_bpf -o "${tmpfile}" --aux-sample \
> +       # Check if virtual lbr is working.  This records aux samples, whi=
ch a
> +       # single data page overruns, so give it more room than the other =
tests.
> +       perf_record_no_bpf -m 4,128 -o "${tmpfile}" --aux-sample \
>                 -e '{intel_pt//,cycles}:u' perf test -w brstack || return=
 1
>         perf inject --itrace=3DL -i "${tmpfile}" -o "${perfdatafile}" || =
return 1
>         output=3D$("$PYTHON" "${shelldir}/lib/perf_brstack_max.py" -i "${=
perfdatafile}") || return 1
> --
> 2.56.0
>
