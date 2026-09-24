Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B83B6366
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221171; cv=pass; b=lK1xADEeokRUnfj+eMkZtbXRgkNgV9WIyJIYgJ79WsAuxWBuJ8qwXdeXLO2p+0I90YoMvhlDD+jO8l3sXJ6gmLaTNyUx7PpRia+PsVJ7iH3RdTNbbfCOSI+ju4AkZixYyKRrkPAsNdavED9VRVtywJkeI5fbct4mlzx8qxsPpcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221171; c=relaxed/simple;
	bh=fGksLTEQdisW4wJr5F6dvnMICWkrI+Db3OT5iI3lrXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mizKuYzmo1ygeYpXR++Bswe8WI2JUGHoxwqtRGeu9gGzygqThCUXgRV+d8sjvfSkoBs0qG7lgNxDXBy9rPMG7AYGk9CKKc3OR9rMy9HZt4R/LZ5gnKN6GyF579QiFiKE25UScd8jmF/UCWFMPriP25WeoRStU3RibkUbcKV8W/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EAMxywvB; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EAMxywvB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-532e9ad9a1eso91181cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790221169; cv=none;
        d=google.com; s=arc-20260327;
        b=ob2NDsVaitVeiEcc4NI5ZpUC/x+/Vm7xqR8VpXEeAcQEJH6ztDVMf7wGgLJTJyVl5V
         tV8CkUwqnsLRQv5Nl6qzGU42nwhCvZZRaaAhAO8e0Iby2ouq35ufVKlk1ynkqxbRpSWb
         kDC7DmB4HzZDyPrru0Xp06BWLq39ubAKIhr47phJeOrtCxgHfzL+KRX0ZYPs3YMJcmj3
         Sz+H0f1sRSFaP/0BWMkBOxf9Kekgw1MmPIgl1CdTgP7WIq4HOH0dGk+DkR1to+RTOnQg
         p+tPgo1ZrFoikPX/YMcef8qhX2/j3BItX3AfmhKh7QbV0nHGbiZ1kJiA/YrfX+I+4WiH
         6UKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InKJQQCOPRqbPlss8oCpbkbxv3WxU2400I74ZRffvr4=;
        fh=wvS2+vgp3x0armWkQoL+qd4V0K7k2bR9V/OovrpWmp0=;
        b=MoXpufRB7OTtX4Pzks1g9qmPMcbu6Kc0XYaOo1C0xVs3ORl0rfdfLrXrUati60zXiK
         hD57GZU6vkGfcJ5/gxgIEg6hRKJXdFVBTOG51yfJcy9wNx8IULntTukgEb7X6/c+Eqim
         w21ut9OWf7TP6136K370l7x7FBFShVmA0id6oTOhYaXl+hAiAdODUsoJFiGggKxectAZ
         G7pmB/x8kNkfvYiuGDbE1O8C/cYdR6qd1fyrAmAR245Wks9WwguLJ070H0J0Dx6Pm/JT
         9H+f01b9NaD2yLDwlupIv4SKMBvCsmB9bNV173HZjHJdaFJfMOAfHdO20lddCmpAa1VJ
         LqXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790221169; x=1790825969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InKJQQCOPRqbPlss8oCpbkbxv3WxU2400I74ZRffvr4=;
        b=EAMxywvBE9LjrzW0NWV5Q2j8kN6cFdINYa5qkCzmzZuKHpzwyDjYrpD9Ql5MM5LhN3
         DFEWsx90W26woQYCxX0Rn8LZyflQK0Em+eJst3WbOoUVgXxX/0p5pBVxcgg4nTqhVJ/h
         j5IKMRMhBJBAWFWeBr91YM/y53/BGS+ygiZgUSiurUPJ/pB4sOGmdXmeC6t7Cb3B6UoJ
         +C4ZbP15YAlVAlzfP4kTheIY+pIy8DxlxI3hDVwAbH9OfK7zqmgYp/zwcjqoYtWeFE+3
         zlq6v9St4DNmVnNsoSY1HEKSKWemvD62vHn+3aPY1xDt5Z1TXhxiMKV+KdRfY71H6fr2
         SlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221169; x=1790825969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InKJQQCOPRqbPlss8oCpbkbxv3WxU2400I74ZRffvr4=;
        b=CToByJNI5Ni4I3eMRz81XLb660a3tFh5Ty63cRIDjmN9K3YCq0SmLLIlnzd/2n4xYD
         6purzTzF2FR/IpuyZW7lqrFcKk4ZUL550KXvRjuHz3so0bdFFP4rWPu0VxMAlSp/fbc7
         Z/PbFedzlvnxQEe8UvZ+2XyQUs9XVNKIk5NIDdPtVL+poim2EmDs7rRo4eIEm9/GmQ0M
         E6fGP1/qhBJbkOBZSIG9MFDX3tJjuVvNW4gsJ/AjqwwiImENbRh8ESxOKX5a005MQkgc
         u3PB3uNC+bQiLFSQ09uCiKZlxwprvlyQW267potsQXuoBG9p2UAiq+v4ezGvqxnHE+gh
         k0PA==
X-Forwarded-Encrypted: i=1; AKwUvByuQ6fqGSvSVR8i4r/xQRr8zYt379DP0U0AluQX1HTmwlMGQ9x3qHGASTf1HmqiaRWRe96rGh9U196i5qg=@vger.kernel.org
X-Gm-Message-State: AFuF++kNsyCiccwu/b7lbsZ88EzlUA0On68pSjuPAsY3UuUDnEIGaQUz
	F+a9f97uZ7sBnj+CCKqIafMMtCP1mtJ0v1DHM58XHBTbPhjWCYEODlR34UPu5EXIkOcoZWPCVZi
	8GM113kMUaN2NFd1JDG3VtTAD1Xe4eVqkWjIwAh1S
X-Gm-Gg: AYBFou3tEvVs7MpksdJZjA8rPQ/38eoVxSx9Ho4WaEYi0hBAkWskO2khNhloiUHFQcY
	b08WHK7SEteQBJgjZyv7u2M6pGz2s32iA8Jb+4Ff3QyCv/UWKPYv2r/auLLRvJ/vkaheHavA9Kn
	b6ojCLQT1VwFVTlI8DXKpMT9/c8oOzH1i7VMDvI9H1YAvpjNAJrkysCNqz3KrDF6ILLeQB5YqJ3
	uuVut03QIuyO2nlwhASb6RNZ8TB0urh5Nc5BiMa1l2eyScapmprRjKKLbOtkjL/soEsJ051QC6l
	vBgasLY4BDFfoHOVrZTU8VEuiiR0BVJRqkbT9+78E3ILDsPe5qSkMb7VrQgGkXGQxA==
X-Received: by 2002:ac8:5907:0:b0:532:ad75:e432 with SMTP id
 d75a77b69052e-532fea67702mr2293511cf.8.1790221168556; Wed, 23 Sep 2026
 20:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923215255.3329181-1-namhyung@kernel.org>
In-Reply-To: <20260923215255.3329181-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 20:39:16 -0700
X-Gm-Features: AclHuK9XnE0LiW7nXbe7EWNZaKPqTqC9HteFYo1ykilXqCGOj8UXWSio3_EVr60
Message-ID: <CAP-5=fUBb818Z6-nyLScXq+KztRaQCeq0NWub+tPNBN3JK-dkA@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf test: Fix errors when deleting data in perf
 record tests
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:52=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> perf record with multithreads would create a data directory instead of a
> file.  But the cleanup and retry logic expect a file and try to delete
> them with 'rm -f' which would fail.  Add '-r' flag to remove directories.
>
>   rm: cannot remove '/tmp/__perf_test.perf.data.ZVHTw.old': Is a director=
y
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/lib/perf_record.sh | 2 +-
>  tools/perf/tests/shell/record.sh          | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/tests/shell/lib/perf_record.sh b/tools/perf/tests=
/shell/lib/perf_record.sh
> index 2b9e11b66dc7a801..a95fafb8b6fa8b40 100644
> --- a/tools/perf/tests/shell/lib/perf_record.sh
> +++ b/tools/perf/tests/shell/lib/perf_record.sh
> @@ -30,7 +30,7 @@ perf_record_with_retry() {
>    fi
>
>    for duration in 0.01 0.1 0.3 1.0 2.0; do
> -    rm -f "${perfdata}".old
> +    rm -rf "${perfdata}".old
>      ${cmd_prefix} "$@" -o "${perfdata}" ${testprog_base} ${duration} > "=
$logfile" 2>&1
>      local record_exit=3D$?
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index 4a4931cb5ba91849..cf8ba3d3411b0bcc 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -39,8 +39,8 @@ default_fd_limit=3D$(ulimit -Sn)
>  min_fd_limit=3D$(($(getconf _NPROCESSORS_ONLN) * 16))
>
>  cleanup() {
> -  rm -f "${perfdata}"
> -  rm -f "${perfdata}".old
> +  rm -rf "${perfdata}"
> +  rm -rf "${perfdata}".old
>    rm -f "${script_output}"
>    perf_record_cleanup
>
> --
> 2.56.0.rc1.310.g51773c2048-goog
>
