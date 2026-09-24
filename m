Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B3199EAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221557; cv=pass; b=Ga7uUa/2CnfJtsxoivWMkwZfHYqIZLiwA/nJpeOGIngpFtsXkHCu5QXnP7xUoYvayHjXd2wtNbcSMEVSMQOACd/seWJMPAX3hnKzbYH273ezYiC1DccLSb2DkwnyztsKtcC4mtDEXhDTnkjDOQOso7FcMZL5qSDgGowCUJ73Z8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221557; c=relaxed/simple;
	bh=agQdRyiekzKzUkD8QSfdqzYYwaY3t3skKjWl0zUZLv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMQMHwaiULbNONo77tpx2eCBgesfeFU1bpKnvP/3bK4H6pdoQHImdq5VroDO/wjl4e7hLQRHY25C7Ubyh5Ue4HZz9PzRvEMW8K4ceZpP9UAYthH/TfXLywFDuO+ae9qTO92nBsWpln55wY8J40Kq1pVScg5Wj7gmYYduKDSNyIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KIJcxCxw; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KIJcxCxw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e8c6fb80so93161cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790221555; cv=none;
        d=google.com; s=arc-20260327;
        b=PfNGOEb9U8U911zgFY4xMGlBiCMMV3xNWGMG9oJRnsC/HV9OFBrLcxuNZ27c0r9CQB
         Gef4ISChPVt77Y1svwbfdrxLsxJ9Bt77tEc82tRDqFrUsOTfZaVWG9e+5DuQdtQX1HZl
         3pEJ/E3Bp1T/iXXQ/d71CzXkQKFy823yPQZn/hefLsDPSeuIURj1xKLruPTIhzjZNbkD
         42RCcboo4xZmmio9RksKxbD3svH0XFi/MtlCiNF68Zw2XK4D3MOBVxBxflmOMs2zyWjy
         lg/y3hyYEqA75DlIEn17fepUdQ8Z3R638fr5dPtC8R8xommdPcKONhbKYO29iVuEUP1b
         VLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uqt7YdPAG+fbVbfF6glhS1Jh/r4rcT3mFnxXOlmMXbw=;
        fh=DNb25PX3Iay27A6nx9QqIySsVSrQBrVyGRXUBVsNHBA=;
        b=nEl0QOH8FUoUM1LazDAmLSUrjEs0M4Hn2v7vMJDQgvy3rnTK03MyWFjt5TNeqfpB4T
         18px8YjYAYq0vJFb2bD4p31VITgWJHzk6k7MkoQ0ERjFA2g9kpmA32nyjHsBoZJhz672
         +D9JcIbVrJ4E4CX50a9sda4tfY+GB9W+QPI9r/XMtpaUxy+t/U7sXt/eM78qU+6lDOXK
         uO88ik+NnegtMK9pwXCueCSQbV6DkNdmlb3zlNP5DSxVT2HxBTIUHpEPLYYX4/g7elku
         HYfRVC6mcYwoFdA5eofur1HDotx5+3XuRd51pZ1F9QJNBe2V1zF5s9TlYcVcEqTSID8f
         jAgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790221555; x=1790826355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uqt7YdPAG+fbVbfF6glhS1Jh/r4rcT3mFnxXOlmMXbw=;
        b=KIJcxCxwX37byZbH0bWJXMJxtuLma2cDJ6hsL17mF6I6+nslxOM7NG+jjwfLJQLYOE
         ZbsOr20gEZI8p6Vm5NqLbx+QgP4qhnLB95HqFpxfCeNt+5WQP1rJv73ZQIdtoDqU0xAk
         4uB7BJsaejDV+h3CjSpR5crm4LrIY6KgL9bEPs9hpjyvMKCeKQdZilXXYfDCum8tK+PZ
         jwRnyv0+nd/cc/0suYtz+837Yfq5+D73dZEPv61U5e/uEBM8CUknqXgzItZySDUwI3p+
         mRJYr075pK4VMCbIVNMjULXqxtK+MONowGmxPhxZOUMCh0YBjiY7up7tFKDaXOkz+lLq
         C6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221555; x=1790826355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uqt7YdPAG+fbVbfF6glhS1Jh/r4rcT3mFnxXOlmMXbw=;
        b=oJ8vP2SfH0pfZnaE7Z0z9vmcVp+b0XPdM935d3RXeGi4gL38mdirhGJr1kkLNKZ4dg
         bj8WXkD22dm/0Sp8iGvTsRFwiivIeuShw/sKifVPf1raDsyTdZphp7CacL0Mv7Bc97P7
         8GUHgcpEJJSMacL4jrDpFY/Y+OL3xL0WDocxvIZhTH+1hXf6qeVARKOqvlZoChomP21F
         lYUifokm3YATTyVJ4GX/s312sexwKQtxg+winOvUqpVrCvVpQIMVQV+aTjoQgjxou/1y
         FpHjvp3YsloB3TwzyANpR8rO+ri05YTb5sYusBh5Wa54DbWCE4FmNAZ3dcql1wX9IXOe
         BO/A==
X-Forwarded-Encrypted: i=1; AKwUvBwR9hs1Pav5mVqyJMDCRtO261JZpqyZgMyJWYtUbwJsQVp1ztM5/QfXI4TCETlSsEa/Fiqjw7YEqZTTXmw=@vger.kernel.org
X-Gm-Message-State: AFuF++m0Tm4Rk3s9ckTQPOLsaKDQof93x0M3b2HuP3fz/FWrJ4hZUreg
	PaCkUeGLjbwCtPNQ0O2MHmLW772x59AqfVg6VrvOtAyV8us66Q/di0X4R8UX5o5IqHfjo09/1zj
	kdyCE5ZH3RnHRdYcZNrTou561hAkTiD51NOU4jyWQ
X-Gm-Gg: AYBFou1cclDCr+kU3F7zuy02fR4lEtHANc2DSoC5lQvjqdwFtZlWZDIhH8XWink0EQe
	zZmCJKRliudV8Mtcd613T2N5MfaPvIEFvpiy7WfiyX7sx2neBE+hFl2/eOhzf6Ws5E2tXci9L+A
	LfUleruI7FPuRkvmld3ysvVwgImtGZ+tYxleSy76n8TkKNwnuAL6o/F0b7YIKhsvKU+2aqwIUWG
	6d0bLU3u3prvJ7TJd1neB5jD4QAjCu13Ubsk211CF1YxFpjP53sEx/agi30WG8n05hU6Bwykbm1
	cJPL7dUN1zC27bZstnoVe/fj1bGc6I3lcEcA3RFIOjzdfj4PlWspOa8=
X-Received: by 2002:a05:622a:4110:b0:531:a85:69c1 with SMTP id
 d75a77b69052e-532fea2231emr2750391cf.5.1790221554565; Wed, 23 Sep 2026
 20:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923215255.3329181-1-namhyung@kernel.org> <20260923215255.3329181-2-namhyung@kernel.org>
In-Reply-To: <20260923215255.3329181-2-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 20:45:43 -0700
X-Gm-Features: AclHuK_Jlv41nVnh02C2Krhs-ub1GtaU47Y_EHUe2Wi9C7qHr6XPY88shWHsO7s
Message-ID: <CAP-5=fV1_4xC7mjmCpBarBNVd9e=ZYHAojtpK5ECuAF5u+s-Zg@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf test: Fix record tests on Intel Broadwell
To: Namhyung Kim <namhyung@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:53=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> I noticed it failed for leader sampling tests on Broadwell.  It's
> because the period of groups members are a little bit different.  Maybe
> there's an hardware issue but anyway it's close enough to treat them as
> same.  I printed the value like below.
>
>   $ perf test record
>   ...
>   prev: 462507, curr: 462506
>   prev: 494783, curr: 494782
>   prev: 454350, curr: 454349
>   prev: 502782, curr: 502781
>   prev: 566693, curr: 566692
>   prev: 606558, curr: 606557
>   prev: 559770, curr: 559769
>   prev: 595737, curr: 595736
>   prev: 643386, curr: 643385
>   prev: 663672, curr: 663671
>   prev: 620622, curr: 620621
>   prev: 650419, curr: 650418
>   Leader sampling [Failed inconsistent cycles count]
>
> Let's update the logic to compare values to allow 1% of errors.
>
> Also I think it should compare only if sees the non-leader samples so
> split the check of (($index % 2)).
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

+Dapeng Mi

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/record.sh | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index cf8ba3d3411b0bcc..04df35b30b0c15fd 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -550,11 +550,14 @@ test_leader_sampling() {
>    while IFS=3D read -r line
>    do
>      cycles=3D$(echo $line | awk '{for(i=3D1;i<=3DNF;i++) if($i=3D=3D"cyc=
les:") print $(i-1)}')
> -    if [ $(($index%2)) -ne 0 ] && [ ${cycles}x !=3D ${prev_cycles}x ]
> +    if [ $(($index%2)) -ne 0 ]
>      then
> -      invalid_counts=3D$(($invalid_counts+1))
> -    else
> -      valid_counts=3D$(($valid_counts+1))
> +      if (( $(bc <<< "scale=3D4; r =3D ${cycles} / ${prev_cycles}; r >=
=3D 0.99 && r <=3D 1.01") ))
> +      then
> +        valid_counts=3D$(($valid_counts+1))
> +      else
> +        invalid_counts=3D$(($invalid_counts+1))
> +      fi
>      fi
>      index=3D$(($index+1))
>      prev_cycles=3D$cycles
> --
> 2.56.0.rc1.310.g51773c2048-goog
>
