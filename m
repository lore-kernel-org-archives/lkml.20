Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D90F3F105B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901387; cv=pass; b=Cs/kqU85DYGK6FYtBTxCVR1g0XxZurxJrVbg3hkVrTbj0ZNaEz/MHqSGX3ylSwy6T0vwQmcpoclhpXzRdT7A7MM4aUjmrmTGmOeq1/FRLWUL8M4up52xA6QD+KfCtO7/5sA8Da7xeG1z2HPtM9vU59iX0zcWtEkAc7+NO9PaUdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901387; c=relaxed/simple;
	bh=yj1sNd5vfDwsYGQAjFz2BvWzyxLrHMu95FMIsFy9jGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3de+U78nHRYkvHQmbnT2kw32QH+H0miuZcq3RJVYDtG9nmXc6ZQGJ9GMlkRLzIbo3mzs6b7jHxanzraS1E6DYcEQLboLxdfNx2f4vYuUzXG/GTSX58exL+IDOEnlEJmblMByh6u7cnMGGH0Fl9H+dS8w1ls2I8HExJBQC23MPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=QwcrkcG2; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="QwcrkcG2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20ce3c118aso390000266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791901383; cv=none;
        d=google.com; s=arc-20260327;
        b=iTfUCanafOBVob/mD53Afb9sCW76z7pW1NIWbv8gjW6M2j4H3C9EFj5tVF89ODy3Kw
         Iz/T9w028ZoCjh0/l1SjgRzepnwsnqeCOnjKWCf1eVaP1RB5jDLrXEBFQqiZH963BGZ0
         vv0j+QcaWtN5JC5s5kHO+AwkVeXSCRWPEJJFKng+mZnylAhVOEi+Lj5myTk2fByZgOYt
         4nnPAn4rl6z4lLcc6+tjUgofx0bklft5F5YDX1qWYeZFVjAtVaSk8ge/Z5tHWPPBJozs
         kmnniDRHXC2sn4uzRvaysz5qrlC0ApyPRPevKrNEk9Wqw/eTZjoqAa1IltsI+zN+D5Qd
         ZFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yj1sNd5vfDwsYGQAjFz2BvWzyxLrHMu95FMIsFy9jGQ=;
        fh=0JcDvAHrOKsD874FGAXSF+rqkFW28EJZWTKKLiBZw1w=;
        b=gQnpyOOCMrfBpYBZMw2bk+akfrhHMyHscW+CpBIWuxNSITm3zSc+DVaW4upfotvGi6
         8zOdfCUgcSZLDFARtfJEdshRbYlrxoeTioorDVO6mrFKxDBXgKPWMiDlyFFIbiZvvSKP
         2tAvyt8gfZ4xkcA22wx7uYezPpkI9G1cD08uK2YEaoOyHQu0O98eIDsszw+/IXrnhE3G
         Z56VrIi1PJ+iignynoyCLnasJ8Xfuh0YxCQBhkYVPiQas8U7Tdvu47t5ddGs9nZki/UA
         D3Yrr2umDV1ORq4OX3+ugF2iUfozUrEelWySBLC6VKugBprJ7D8LCtAeB5cSvQLP5GvQ
         Tn3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791901383; x=1792506183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yj1sNd5vfDwsYGQAjFz2BvWzyxLrHMu95FMIsFy9jGQ=;
        b=QwcrkcG2qPqojWS8zrmYqjetEMN/XCmC1Cl4IH9j8p4MWaKhPsNhEVONdUInsqHDWR
         7aO+YJwuoCWNOs1GhADMB5Gm9Xa9nU0+F1ALQwHy5G/9+8bRuafsD/Yp4TrenJOovLTv
         hOA9n0wfnIyrZE6MZrOSiFItSDkFcGYH/cUwtvB7Y8t2o+JsvPEPjujfYsJrjHQ8w1oi
         p/nOBq0UY5msy45MvU0aOumovMJf7ep1JoCSIR5ywPd4/0nl0cMjEJMz+ISfrOsPiTJH
         SZuEbRONEXjgavXVCuIsFHLmrU4u5bXpRjrgpRgknreUkjs4bMcR6BSky2Wzn4c3er3m
         N0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901383; x=1792506183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yj1sNd5vfDwsYGQAjFz2BvWzyxLrHMu95FMIsFy9jGQ=;
        b=wDDAMoIpdjUdqjCc/+P93sRMDAYc9JJAZnCnMi9sX5Jxe0If7M8L4PJEEfuzxA+HzD
         LONdHVbCgymPqVvBnc9XDOP0xAafXyXljOqjVa4R1OSJR63dzanZ23hnzYTPWJu7YkZq
         GZEIw9HoAVJ1CxFGw3V7NXhRX8KbIlS20N+3JrjNpOBhXJgipQ+X6Sv2NMOesVlsNBR/
         M+AovgOxDGAKqefVOtxxB8CTodsKnaAZJq6wwjeeosl+HK0qJ9bC4RhAgxADEiFU8CtG
         t4dD0b3jlV+K60OkOevGU3T8IQ5Ke/8/8g6vpFanPRRi/oJ1t44telCtO0CV8OHzLf75
         GZyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2Jg6uel1OT2hUz/jVBSnxzausN59mtk9Not6YxQvGvFda+xCCTDEow+HdO1sX+8Mm05aTG4y0Q9Ti6hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjn9j6vfwo218ft47hqRDeqe83CN7AyVMbTG3muLbjtAxBZ2Hs
	YHWT6clLk7SLFihNZ68Pavv2kQb9+YV2Z99yACuXo2+Uy/7m3OhdFxqWgmeI44d9PQ5cuXiJsJ3
	EtjocblhkKNWj+E0NqtZZ3EZNZIi9D6lUE0bGN+um3A==
X-Gm-Gg: AYBFou0jFA1dpaz4nQX+BwwX2o1kwrz9NE2qqSX9ZSwLFzDvUDiSX15Kpz7uyrfQyMq
	esMt6Mi3QV3lEWngVhqSauPhe1RCCQ+COfVK7bblA+xQHp2c08FA1+ymT1OHxWPZ46qCjGFQi0p
	5QbSFi3j9GFDFLztycU/ZYsmSRdNrni0nPeTEx+UTTXOgGBU+u1qFa7bNg8v9utwkmzclWEdg3W
	uLPsR2Asu3oDndtb6LcsG7wJEo28sWUWhlT7R35W8bt3ywZg38OQwPdkX7fCTsU6Mf0Ym+tCDYP
	UzrDbL+SowVm0bikcGtK1iaWZ9hHv1+8la61/5KeOyQDMbDWKDdvc23DyqlJubwABYpAnuYUEZA
	GqECRtNX6
X-Received: by 2002:a17:907:3e9e:b0:c31:5918:86d1 with SMTP id
 a640c23a62f3a-c31a9d3cfbbmr1362282966b.10.1791901383415; Tue, 13 Oct 2026
 07:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013130052.3012773-1-max.kellermann@ionos.com> <CAP-5=fVPtjkxcjEkR9r6QZGsoKe=_rZssjZp1FcJ7rCgntpPng@mail.gmail.com>
In-Reply-To: <CAP-5=fVPtjkxcjEkR9r6QZGsoKe=_rZssjZp1FcJ7rCgntpPng@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 13 Oct 2026 16:22:50 +0200
X-Gm-Features: AclHuK_BqQBC6qCTnYjJ1k0Yihq79IRdPnmJUUQAMz5lu8h5Keu2RPYrrqjpsQQ
Message-ID: <CAKPOu+8NB8sGv__CazGPYY_uEmg84-+YHbS-VOw=4woAZcRKAw@mail.gmail.com>
Subject: Re: [PATCH] perf: skip unnecessary userspace map synthesis
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:29=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> Why do the empty list and dummy case need the
> user mmap events?

I guess that's a corner case I missed indeed. I'll fix that for v2.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
