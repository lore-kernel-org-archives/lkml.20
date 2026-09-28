Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6974E36FA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608260; cv=pass; b=S6iD1aVbfr8IiEGKcEhbvmt1WEjC1a6dHZ1By0vSBBTArdm4FPq/eP9UCpo6F4wbD9RXG6ly5Mmcn1/X6p4/Vjqi5AuRKBkNbII6pJ2BrKP6IeShCzsZBWaJa/jslJ3t2LM/TS7yd8rXH+YJqYISeKqaTU570ZcZ6bBwqJdXcsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608260; c=relaxed/simple;
	bh=pZqLigY/V58vxv0vplszd649EomfRBfgLWrDqFBPRrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYk2wmUakRcgfg4PCoy268aFWR5DfIdH+e9LyNaTCLfFzVoADevG9r9MfWT8552vCS9ac+jvETxOM2oL95ZgUB2zW6RlRkwBpREtrTus6/78TVHHhv+21ujdpkdNgmb+lzLKoo5NtIlhEkeWgjdD2LusKq20PTuih2DRwEj5oXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CLg1q/z0; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CLg1q/z0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so81775ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608258; cv=none;
        d=google.com; s=arc-20260327;
        b=Di4mUnYbLWYJfTjRvxGpIJcXKkn57xK2+I300jGZ9Ko+68dnp7esjE0zIDQHWqhzH9
         kBwBIjIS/6JGkComneiZCSsZ9fqAkoBcyloToOANFr3tlkv3rhi/3SXnFq5rpp6SBXrL
         PRtZXQalrVljqQkxseIczIGiOTMzw/BmjObyaaDSIGl8likD9z0t53RlkgtZEJjplVe/
         YZyaGKwTZV5wGcw5hGC7VYp75csJytANsgn10lVT2ZgwP8zaMInE9rioZNPMvkYT0XJK
         /7VBbkARLBDI+awDvANGUuqHLbA9Pp/ZZDFxXqIqxKQ+dHdhWNl2+ZBKkcxDg27YUCW0
         gjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7/zoEBFh3/uOoeMjRxiTHNfdp81+5Ohw65fQALeP0M=;
        fh=RoAZj3P2Ik6gm0PLCQTgp6AR2Y1Hq7NPZLLBKi/QwNo=;
        b=G8BVKsrVEZMVV+sp7vKlm7dAE2IH9iTV+vs0uM3ry77LvfUwQLw/NWU5seDUs2wZPE
         Wa9kbiPm8kfDsCJdVmW1Q9mtmE91EP2qNALCzJXYnAobHxvZtAwgiGNxovLOJHRfIPES
         nHIHO48wEA/h6VYNqjc9D3Vj/FcnlDr6FjmPhTMG9QSJlvhcFwWOsbPqZnyxl1KeQ+G7
         Sp/o7ySeUKk85qP9SkssLudi+aDxOeZJSb4X0VbYi9u8b76/oYWABDtLdjZIuFeP0cli
         ZSRPc0d6Pm5vrlI8+8TN1klVWj3F+PwEUge9wgsykqs1xeUrPMv9bJCoGKe9P+dBc1Ou
         yGgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790608258; x=1791213058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7/zoEBFh3/uOoeMjRxiTHNfdp81+5Ohw65fQALeP0M=;
        b=CLg1q/z0cqy53j6YyJvGfZ/ghKbvh6w6wfGtvgb03GrdxDXgjchQV7BJ6LFzAv/K6h
         hqWyiA+SqBHrOBnGe+hBX6GLtTCatxYaATIBR4jxMAh+hczOkABJnVoBcLcZtqkgkfjt
         uF8lnsSRpEHfQuUNVSnecKOYPc5fHt7nSbZBcPPFUB9iyTZaFl9xxDNS5/DY2/aEquYF
         5etWcEI1rkbeNYkYi2ZT3gqeMIlvqUkIqwKWqCglxF8I2m8CCLZlwNrwI8SFhhhRFm5R
         TX0xxSxz6bNQYnq9LaGC0rzNyzQnzjHuQsf5JbN8FBgk5gL0FV/ucRXhi/fpY25G6CHX
         RZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608258; x=1791213058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7/zoEBFh3/uOoeMjRxiTHNfdp81+5Ohw65fQALeP0M=;
        b=uyAvWllBcg+/8w36za/edk8YM4cqzCFHdZaevA4AKfrwHXOgpRZdrvcqScc3lRc67g
         6kgl1th+yT8MMnGD+mb38o9oY2gdO2FBJgZS95FzbK1WnZHdwTpt+a8DICuB/h6o7P5f
         aOVtVcpN8G4jjX8BYubXIzYzBSHuhQUyB9VhFt/LsrB8rRH6AwG2UOFpjYVUAOUJkzSk
         4meon0cLsaIpfBjhklLIHPGa5OvKgIciQfX4cYMdUAbcpp6v3A0Bz6Hcro6YaSNLatWY
         FzF4TpTeIyL/+4s7M18EL8FVqXVkHV6+c5ct4P9cNTmGyCyNpA+0rwQU1x6iBk7GONBG
         1+9g==
X-Forwarded-Encrypted: i=1; AKwUvByc6e0ZC2sZmayFtY2GQyXerknPJPVTIPIcQcji7h5CjsWI777HizwuT7YmGq69WQDYvkTQ3OkjVR+9Q3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiWsQhH6CNjytMN2Hb4znyi8hDJQmpgxc1IeRbvdTWg3grLHFg
	H8NXi1lUUexFP6+hI1zPEz7MjdUxviHtJCQTYEWYjd8PV/rGaxCiZFD7p05HHRX6eN6UN4CRnv8
	T1iYIlaFUuvE4biFuLDysrtKyude8SmCDLanUKHCc
X-Gm-Gg: AYBFou0xBRt5KZHE8BnTBRplKOzlRkgO92uWLTdqImYxp9XVvTYddFLnDKMSNA5Iq66
	IszD/+kxn8euYYhvn7PJIrWzuPc9DVAqIZPhqmQptmrwmbufb/fagUD9OI8O+SH5jqYlU5LcsNI
	4GS5HU0+QT8VRrIptWjLdm2EjreM2+YxoFGk8IyxbctN0nOf4ZE+gwnL639gquj7Jn7SHY9ZERQ
	MoA9XwOsJtXU3VgTENSs9DwPkIF6H3dAgT9FvvJ0dlTyuuMtk7+fQ+3A7yhfBX3KSafPy82qWCg
	zuquopEyfYQzN4W42bwMqwkG6IpNyptRlcEGN/0L6KXGLoVMA4RM927yERrrTrEe2tggo8YtkG1
	RVUcpT/I4
X-Received: by 2002:a17:903:4b0c:b0:2dd:3a08:d47b with SMTP id
 d9443c01a7336-2dfa9776406mr6317755ad.13.1790608257368; Mon, 28 Sep 2026
 08:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-perf-orphan-args-v1-1-8cacf784621e@bootlin.com> <8bc8b276-bc4e-4a6d-b770-5b02c79946d4@linaro.org>
In-Reply-To: <8bc8b276-bc4e-4a6d-b770-5b02c79946d4@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 08:10:45 -0700
X-Gm-Features: AclHuK-kAXBX9fdC7SCFH8-ZLHfC94yfr3nfW-yKnzc1gR_zZi6raeAWaByfbbw
Message-ID: <CAP-5=fW8As_PsV1JQtm1yx4pOwgX+znBL3xDR_0eA_hApHOwyw@mail.gmail.com>
Subject: Re: [PATCH] perf build: Improve fix for "argument list too long" error
To: James Clark <james.clark@linaro.org>
Cc: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:15=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 28/09/2026 09:55, Beno=C3=AEt Monin wrote:
> > The orphaned pmu-events JSON files are passed to the shell via
> > `echo "$^"`, which puts the whole list into a single argument. With
> > a long enough output directory path and enough files, exec'ing
> > /bin/sh fails with:
> >
> >    make[5]: /bin/sh: Argument list too long
> >    make[5]: *** [pmu-events/Build:228: prune_orphans] Error 127
> >
> > This only happens with out-of-tree builds, when setting O=3D to a
> > relatively long path.
> >
> > To reproduce, build once with JEVENTS_ARCH=3Dall, then rebuild with
> > a smaller JEVENTS_ARCH without cleaning first, so the leftover files
> > become orphans. Using nds32 (which leaves ~1100 orphans), an output
> > path of only ~70 characters is already enough to trigger it:
> >
> >    OUT=3D/any/long/path (at least 70 characters)
> >    make -C tools/perf JEVENTS_ARCH=3Dall   O=3D$OUT -j$(nproc)
> >    make -C tools/perf JEVENTS_ARCH=3Dnds32 O=3D$OUT -j$(nproc)
> >
> > Express the orphan file list as paths relative to $(OUT_DIR) by
> > stripping the common prefix and restoring it with printf, the same
> > approach used in scripts/Makefile.clean, so the shell arguments stay
> > short.
> >
> > Fixes: b6712d91f8f5 ("perf build: Prevent "argument list too long" erro=
r")
> > Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > Tested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
>
> Reviewed-by: James Clark <james.clark@linaro.org>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian
