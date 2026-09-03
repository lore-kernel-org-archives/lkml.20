Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874AC50EC1F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466789; cv=pass; b=ieCMtJ2xGRMwx7Fw+1Fsm+dHuaWCfJska9F+fKfRaXJ23rQo8SXEOhhkKX/9LI8ZInKWqbqrPJ+x41IlLfwUKA/9pL+HMkiCyx8Z0uNdf75sNMpyPdBwrqHCQaJz1nbApmAV0tIAvMN+j5EFs2vxJHvqJx6OefXRKo99+UxOaZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466789; c=relaxed/simple;
	bh=61uMKuI3tXO8Qfl6r6fbs0W9TlQX4bskjeLyIhYPqIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1z3WJI5P/A+Li9NXkzZLaihG9dNtgcu5eWW19fnOhizMIW/a2bsVxs99sA05kvkQNJf04PhdESjL30CNl+49WKQCMyTB4jutUcrcK/mjvS7UjgMQ8w95wUfw3tMQvNRlcXS/J5kBaUnNs4uDTeiHVk5jUhixopiJONrDOiXrls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mj84xjK9; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mj84xjK9"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52e3de6309cso399101cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788466760; cv=none;
        d=google.com; s=arc-20260327;
        b=S+EsnEyMYeVPd95JHQuNDonEAzCpYyVw6AmZZbb0hJlQMPQHRB456gFnWzB9bIvqAD
         Sq/ERVINplSozZ6fHSrQRz3yT6XSAwLlS9xvztITSV6wbqhvGVPJXgxX9o8fkRZ5EHJG
         7pcKe4e0R0wKA1bPb7oH7HFyYN3WwoH9Ih+XVmZMDOM4LPF051w/axsXSyJH92x0eu7D
         9qgYXjpQc97oH5XJOgNVK9L50jd3U9tnw8WN51oHSri5Azx59/P6kOQfx/tA6hZ9/bqK
         BtAOJsCVpZCqB4+aq5WAdsbl3x15Hpie+2cp+s9HmB9BkfW2SKOt0TFrnlU4+zg4oSMb
         dn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtHhJLDBEdXHkKgeUK5VSuThCr817qPTzSy2D/lDgsM=;
        fh=SfYGNEamAGWJGNQP/FdDJ+sRJneX+GrbsrKASjzPmGU=;
        b=Ts9Ab2SBXkYS+EX8TH0i2usRV+j1kLC7XDCOeF1wRjHbzppSKFHJL66OFY5wHDPgXB
         AtSw3ITKXj4Fk7k7MQvZiA8KVWMfcCHmBKoBcsDYJ9MB6G1PNBtpmuE7VKNXTd5coq9k
         SGq0fW1KODb5dTfasFjkVeyfLEIn2LGvh4G3BkBykjuARMBn3MgpEtF/XGfQV8+Yn9Np
         F1avNED4e7JiE33RNuTo55uwwUJGsjFc74JspCT9BKubLDyfZs7FganIEwXXNL/ZPmbC
         KQS3FYdz+jhDs8yH6UGsnOkboSny6yJ8r7iwlHVQB0t3XRHKvPzvTZgD/Qraor9RXEOP
         09Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788466760; x=1789071560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtHhJLDBEdXHkKgeUK5VSuThCr817qPTzSy2D/lDgsM=;
        b=mj84xjK9zlACYEaL8oaVI2GK3Wt+uUKCj0Y5gnoM4Pd0YwHLNjmw9jZf4hdaZHVDmZ
         JmfxQWo9qqxRgUawSaKgJTID4sy+KMctKuGspRXG6mIjcUI0BaSjXNpdsCluXgHsZHFh
         BSmuLcPzi3DF2sUI6RBIsLKjNQlvLbvGNW+gafYMhcfT+j6Wg2V5K0jjnHMydSfJFvdN
         QgQQg2lNW3UvWoq/Nk8n2M/8ztInp0O4a1fkL7zy8KVR0e8qJ+Ycmaen3Nwdm28O35px
         5oLvfqbz2rRx8pEH9UivmM1hg0Ew/sXp+6uvht2moJiPDJVDkMSCMTiEmo/av5QLoaV3
         mn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466760; x=1789071560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtHhJLDBEdXHkKgeUK5VSuThCr817qPTzSy2D/lDgsM=;
        b=SE5bt8HR5R9Tmf/AmoK6G68v2CMYoViaOdoiLzSw4zud8wvyS5uBKsYTQWsEohqR2n
         KEzKSmDgFEhAIYQwAUkRkebT06wvq6saYAODAR4qtF3CJTqeBfu7UjDBxcQ1Jjf21Foy
         fGwZ7C/D4t8aGwOBCZ7kqEgvcReE4FRSTjnpkmoqqCI5scu5rEQRjnd4mqd1SiksQrGS
         vLYk40NdB4YZQHPKISc/clBbhh01EJ81iHKwuOAGO6XHQ+zjKajdAbjnlL2HNfN/VwQl
         anVzFvIDA8HD/JD7DXuEM6dM43sgpn6uZjpONv7fuFWI2osEGfM8/CfgbgOhUpidtQ8Y
         0Jqw==
X-Forwarded-Encrypted: i=1; AKwUvByYMyx5Xirm1Sa28PeR6UKtjJeziNwxmMtfCxGyF55sRN7YElOmpBdow7zGTU9J6IxbJEW3zmR84MZXti8=@vger.kernel.org
X-Gm-Message-State: AFuF++n3tMStTdNsUzeYqj+Zxg1mh3MqNpStpfrmJP7p4SMdnEueVqp0
	+v7jLk3r0M+ELj+34rx/lBA7yyofbTLijUhC7vzsITx6eG8/XoUPaGdAAL6mBdtOkfvWzpBnQjf
	uv2XdA1PMMnrHwYJIvSeaY83afKaKtxpQd9MXHyn7
X-Gm-Gg: AYBFou3+JiUN81HCVmydsZtNDSsV5Jkrbfgdrb82gW78kscApX223j58nkLCcqur387
	Y6f2qQAdGrKtCmmZDOT6D6oBmMvFM5mvjraVNIg3HXYoTTLM738ETJnVMkT5MU5Nf9ifE+Jgcez
	WRqBD8Xsrt/TG4Cjb6sSIAagn7Umqnuw5sTTIQuIPn1XGMN1f/MLrHyKg01HDotmayNgamidrpH
	XflKUO5QSg/SnPCyk56X+1WfOFvAQYnMAqftNg5L+O8vEhpF+Ugqe1dSgJUH3PTGbbKSf1+UY2j
	C250+l1wlpYhduCQzqrfT9O7huQUspn+7uRx0uHBNIpFgZKdHABbR/4FxLZ7EorXt6dkpevVwA=
	=
X-Received: by 2002:a05:622a:903:b0:52d:9d62:6163 with SMTP id
 d75a77b69052e-53055c4f251mr1561611cf.9.1788466759468; Thu, 03 Sep 2026
 13:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-sympwn-linux-002-final-v2-v2-0-0aee1fca1f95@gmail.com>
In-Reply-To: <20260903-sympwn-linux-002-final-v2-v2-0-0aee1fca1f95@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Sep 2026 13:19:07 -0700
X-Gm-Features: AcwNN1XK-N7twBaAZhkaw9Vegqsfjdmj6p3WSSQYw1RpFRIiubtAAmV8NKIVXjE
Message-ID: <CAP-5=fW5uHsW0wgffWgc8f5ibDf8ArF8qJW6sWzrorL44CqnNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] perf evsel: Validate cross-endian samples before
 byte swapping
To: markdamirkan@gmail.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:05=E2=80=AFAM Mark Amirkan via B4 Relay
<devnull+markdamirkan.gmail.com@kernel.org> wrote:
>
> Two paths in __evsel__parse_sample() use values from an
> opposite-endian perf.data record to modify the record before checking tha=
t
> the data fits within event->header.size.
>
> Patch 1 checks the complete branch stack before swapping entry flags.
> Patch 2 checks the RAW payload and the complete 64-bit words touched by
> mem_bswap_64() before swapping the data.
>
> The malformed branch-stack and RAW records reproduce as out-of-bounds
> reads and writes. Each patch adds a Sample parsing regression test that
> checks rejected records do not modify data past the declared event.
>
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v2:
> - Add the adjacent PERF_SAMPLE_RAW fix found during v1 review.
> - Keep the branch-stack fix unchanged.
> - Link to v1: https://patch.msgid.link/20260903-sympwn-linux-002-final-v2=
-v1-1-7c6e4166b814@gmail.com
>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@redhat.com>
> To: Arnaldo Carvalho de Melo <acme@kernel.org>
> To: Namhyung Kim <namhyung@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Ian Rogers <irogers@google.com>
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: James Clark <james.clark@linaro.org>
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Mark Amirkan (2):
>       perf evsel: Validate branch stack before byte swapping
>       perf evsel: Validate RAW sample before byte swapping
>
>  tools/perf/tests/sample-parsing.c | 109 ++++++++++++++++++++++++++++++++=
++++++
>  tools/perf/util/evsel.c           |  20 +++----
>  2 files changed, 120 insertions(+), 9 deletions(-)
> ---
> base-commit: aadea57f532882d8bab444646863c7ef8a778ff1
> change-id: 20260903-sympwn-linux-002-final-v2-e30a8df210c1
>
> Best regards,
> --
> Mark Amirkan <markdamirkan@gmail.com>
>
>
