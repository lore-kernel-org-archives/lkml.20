Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868633D9DC0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198228; cv=pass; b=A5z+hsb1a2glVXBUhuH+NcOdGVE5p7+iDqac/++/cAXUtpHA9IyfZq8aHBf924bpGiyRzI4hMBpYIXT2sFbdlcT59ixhWlX42dBz7RMUMhtmP45gw4BQHgRQHziBvCQ1ptmP3FP7de1r5x3MpryaqC0ggDPJ+KGxdikW17qarvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198228; c=relaxed/simple;
	bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grLImTgXqjctfOTFscXF1oSbTFn34UTcS153AnHEUFWPxdu/zO7LBQVsTO5uzQE7kWJZ5AGw8e79hAAIkBlvJcwQ9UCGXyxNeOTO69qYrGOIXMt5FkWV4zsgkeR3tMc1r8x9erJElJfxLjc90vdYmdi5WeF3lTNHA4cDrp9EL6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lwg3Xy5l; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lwg3Xy5l"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52faa58bff5so30201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790198223; cv=none;
        d=google.com; s=arc-20260327;
        b=PGbeojL/UNSDJkQLj+54YfELRh7E3ofAnPm8cWVuWWFi6rBE2tyAlPujGWhf14Qk6i
         nXTjPKYdvqYE7FpAWm5cHojrJIHL266uvEKkJefMmqdSrgQ/j8YGuv4FNXcwoI15+Pbi
         1SkEjeSyhq6bukEY6kW/WU9cODBMDOd70aoV/ZQYOB7zdDJrAg53meRP5GPCyKDdQUj2
         pOoPq5POs7JA96GllkWIIsW+MOHtD1wnarM9/AN5++9G4dUKKjhZR1TaxZjXpHZ/a6LC
         mULrM2Mofsfk5kR0kooKMU1sYvfXAVoJZ7ldR+S/aniHqMCH2t1O+7FlvYgiMp2rcQsQ
         u3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        fh=Xo/ec+fHcK1Ld0W5RVjRC+wo8QBc1rd179JotbXkhrg=;
        b=K3a7d+OrAOc5zy5o4Lehv4REpxDzdcptJSwh35qZDfteUfMTESq1i3ZkLgejVwBLgp
         9GRlSSr9YLlQe69vqPcY39ZBWRcz7+XpcpCzUG+OFscZDF1Q83E8boeP2r7pGFxbsHcM
         xHINC/m8yCRdmIv2Gb26Z6vXRsAI7UQEP/GXRHIeac+h4vnUrdTFoqnrYt3jiK954JnW
         O25jUvFSgYXIP6jTrgWjUxAhsW50eWKh9z07ki0MimZ8p3VPGRigNq8sRA4IhkS/e55P
         WzBCTYdilCQ0KcyRcBMprIKorMEzUJPt+yyk0+vRIqcPiqQmXbUEvP3vw/FTu6mS/QYz
         VRjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790198223; x=1790803023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        b=Lwg3Xy5lYMDf90jqn3ho9Cam0aqsJDBQACJYsyoKflvSObThj1DoiY/uZgx9SNYj+4
         YIODlNKf9WQJFgL0PAjRd8AswuDTSD6xxP96FIJzfSN4Rtbx7b3uFYsF4mtwI2NC62eV
         LatlIWM3bxugwqGH2aUgkqvIcxHyVj8ylNeBb/EAZV5PzLOJLkPQAjO55OyRRpJYBg0C
         FlpEfNZaZQwfP4uzyUPqKQlFvsue5GRrjYPqneT73mooODy+NgbE1+Wf3UF/ult/Bvfs
         066QfO/a40z0pz5D4KFkmPrumHvyacTwi7YqKW1K1VYT2Dz0es47IBXazjVacuUAdbur
         IfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198223; x=1790803023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        b=AI1jEcBeodNMsibZGUI5PeQcJexrnSARKibBgHUeN+fKdz39++IorV9CpRcSd/266h
         wSLuhwqa8isXShfB5Et2qN3jVnp7QPaZ7fqBn/WZYB9qs2KphOLKa2sH7mMJFhRD/1iq
         sGzMyP26UD45Lqg8CfWxTRUsZDyhfAukMoYmfQjSE7laMKirYFRkc2HzvLa/XbK5zA1q
         0XmdEw8yl2Anrith22ypdsT3mwCwsc/Dk0ITk7hPdfV1+IIEfuWxTmZPxjPqLiGiWV2e
         /IPb5hchgNhLCPg4vXhiOnYkl2ZkwBEI3y3+oGOUcN8lRoHm1E2jbTuK0eKU4YbQBoZR
         zsMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDtzNVlKkRJwVtFR8k14y1xgApfvac/+f9Dd5BX7zR1bj4ufe2pZsWih1Mfrjac3KitMJDK9Y12WSkXEM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfVTIpDzZ+DxdDxoOuLNU/Iur2SDZUu8Ltno3Vkn2aUJHglIqF
	B9XUP86iMqd1S9ehEpYrXk5yIEtFg+3jh0Hqdy9m/QAExd/Ge2YQRLJEDF0ULPfNYEBERjFMMHO
	xpkgyRP94pa1K097xhBDp6PlP6/Y603WH3ZNtZmEy
X-Gm-Gg: AYBFou2l7ZaKKM9hdM0H+/Ho39gt8kppF9LH7aU0U1LSZgyTaxJGHVXUzh3Tuxwx2sb
	6SWjGshTp8jr8mvUC8UVqqzdsTrTJWWmC4wVQOPa8m0PwoFPnHaww6HDrByri1k4fy/zvgCtlM5
	aOUeUY/rMyrWIig0APUMUNi7aJN4B78HHBIq82vK9ZoMtkNf76LrMJd6hbYFmZHM8Fn5Z1QXoQr
	lOD7wCnM2SVILD0lH2Bawx7yKAqUKYhNBty6ED3uHYqRmMOmLLMtNZo1jCjr7vWBeJvdCWdzipi
	i+3QMfYuh4BEIx1jE+EPZU9V1elKe2d26OX/oa6Jgrol6LRJ8A90JdC1ciHxhrRiH5FCMBUSr2l
	b43hjOVCq7A==
X-Received: by 2002:a05:622a:2ca:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532f900c602mr5083471cf.14.1790198222132; Wed, 23 Sep 2026
 14:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923090429.2026529-1-stian@itx.no> <CAP-5=fW4bzmy5_6a-8YucOy7JGKg+izRbq+7TaOGKV5aG0oYcw@mail.gmail.com>
 <4927bb40f34ec6d3d5591dabba755452bd6b4a39.camel@itx.no>
In-Reply-To: <4927bb40f34ec6d3d5591dabba755452bd6b4a39.camel@itx.no>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 14:16:49 -0700
X-Gm-Features: AclHuK9pZsA8iY-d7bWNHMtUz0MouzhE42jjiSTkxy86JSYE5mHT9HB5K2xVHh8
Message-ID: <CAP-5=fWhk8Z22+PhFKbatO6fYgiNBgLGwVgg_NxS8fg=uEdDUw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] perf: sparc64 user regs and stack dump, with
 arch hooks
To: Stian Halseth <stian@itx.no>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:57=E2=80=AFPM Stian Halseth <stian@itx.no> wrote:
>
> Hi Ian,
>
> On Wed, 2026-09-23 at 13:38 -0700, Ian Rogers wrote:
> >
> >
> > For the series:
> >
> > Reviewed-by: Ian Rogers <irogers@google.com>
> >
>
> Since this series is still marked RFC, should I resend it as a regular
> PATCH v4 with your Reviewed-by, or wait for additional maintainer
> feedback?
>
> And thank you so much for the reviews!

I think we have everything we need but the kernel changes are really
up to Peter and Ingo, and the tool changes are up to Arnaldo and
Namhyung.

Thanks,
Ian

> Stian
