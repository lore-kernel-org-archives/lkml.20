Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAB49E5E3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417835; cv=pass; b=o4DLlEENuydM8+yaOchfnqsiWLJXVSXOoN5qaEZ2XKBYVzpZLdnbsc7aw7OoPmTx2Vc6XJ66p+8o6D+3ytnqmlcdfjbVqryjdZ2cN8T3fUwspke6Bh7KJYYiCw3ucHRx7xlVB+Ith98CDXEQHjZDE0G77DBvRRRwxzbucyYWkB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417835; c=relaxed/simple;
	bh=opZ5FQNxeM2C8NmiRIe2HmlN0KB1ZB6y8OkMspxXydo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlZhzyiq7jIfDTaG+KeFLneAndOPZPU6JIY+RXuBA2EHrNWFktdvLGl7MnnGQbSvRStxER7lajxm6fVCMcKJOeQxQ8Z3jN32NvKTS6OWOr6/Vneu8H/JHeAVCDG/UxBjiI7kkwzQA8a69MhmgJHnxC369cIHZ9PWfrGuW9wH6n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hi9gDuJp; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hi9gDuJp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3940432a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789417833; cv=none;
        d=google.com; s=arc-20260327;
        b=KQuY9ZbXxBS48jhdhOT9dZUiEoxEsDAdu5fMsnhxxaLNqkwB1kWm0ZWdgcKo6XDu+3
         fGcrdpFVWPNfEKcWekDD5mLr6cU7bYpyuRLes8MU3gXCvw4ugPMGS5mgReDy+po9osBa
         J1Es+PmuNjV2kzxkMaCGltFmRqd9Rxvdq5Us3VhqaKc6tXpBdAxzrd/Npjl7P+420mbm
         1Cq4UnRC84iaQOWgOe1jlJnb2JkWkdrBDnJqLd2+ZimcWuyAboDoM1RFuv+PNDspMoRh
         grW1NBIodgdmMW6BMWhwUsEieCZrDkiNh+DW5WQK1XoMn4cs5Rkgu2+bpDgHi2HmHTJP
         bPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prIEjBDLAs06F0EneFKWDajp1ELDGRyxy8dsJdsmLTY=;
        fh=9Wnn9mhdV83RKgEKyPt7/AoP3OOcQvqRm102LfCsTUw=;
        b=eJrGFmW9GZeNAP6J6HcKUDTRnEhZSON6w8srWniz30Np6oWydg+sjq362rl6tJNVhN
         Z6ILrnZi2awzYynZfhNn51mNNmUDWSV4mh9hGyGs6g8nOtoL/IMVQNCJ26ufE8NaFVOr
         ejSBCi6ORsajecLTHOu/+esokPp3pcmWLRhxjHxEwzih+YBL+9Qe3wtRC3/0SBvhL1gW
         Ql2Xtn5zre6nMz5TRnagOTvuMh4FiIqQoEnqxZfwhzLUxgIjRO8Gy/knrqNuHzuxNlhP
         bWz+0BSp9QluqCb/4uxB9Kp7IRt48xuwGdZlRaiopV9PANNAf5KtgrXZHX2KFgHw46tY
         7F3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789417833; x=1790022633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prIEjBDLAs06F0EneFKWDajp1ELDGRyxy8dsJdsmLTY=;
        b=hi9gDuJpiocSIpu4ZxLEwYW1ke/vseI9qkizY9oey5rt0EG+OCZyUpJgpy9v3y/xZX
         43O++IsqNyls+I0rxCflWzCgwJzSFOsn0Z38Lx9ZVxPUdWRvMcEGA9QuaqRx26kfIh0+
         qFDmug+CQzPuVmdcG4bbxw7JGIPNdKnq8dM5I8YKJzImqYP9EiIvJ1Dzcoem3W/WKK7l
         C/eZ1QGXPfleOqk08WnX7RVTNS67BProSouDZGyv+5tVAVal2bXatlHNPKzhZ8/kK2jf
         mr2hx4c+AtA0K+hclrDtxCBX5m2Nhugk8Q+7SibYeEI2QNl9tiE61k9z2RraHNg9tVCN
         cUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417833; x=1790022633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prIEjBDLAs06F0EneFKWDajp1ELDGRyxy8dsJdsmLTY=;
        b=rPLJEMs/oA6aioQ1JcIL6t7cFdC7KX+9CS51vZkRTDEw+ayuFG1fq0ENowUFBg3zi2
         IP4OLpTdmPKqO5OA74HiFxh1sqJ0jFxc0RKAwoBYZjRfPVI9NiEYnBQuvLCoeH0YiThi
         sqSjGVmI4zF7AzY5WshlPntbJBJWX8hBS5wamJD5eOHpXV0+DfQLbsxb64uRbfENlbaX
         bBDqNFbOs/1NMo+yaO75c5FW7xCg9yd/c4jwa7AnxEFMogBA2rxU53EVhJgmj8HqpkO+
         2fFYx9EI+5T5jFelAwscA8e8MHEOM69rpn7ufEwJW7RpRrn6iVFCHP9z41jJxcoYCmsH
         LF1g==
X-Forwarded-Encrypted: i=1; AKwUvBzYTsHbHbTGf6MQLwAJcZzGNwuc8WDjRX+jOdSEXlCSZKPqbMWXi1UwaYI7NUoyCAqBGmN34h2fyZv5iW8=@vger.kernel.org
X-Gm-Message-State: AFuF++kEq+KXPJVYt2RyJb2Sb3vS47+nnrtgqNmtP3VrU5n4d01lNoaj
	e3/SdDys/vjNlMGnG50fZJ9+FAYGBk842MU2wgie+kSQ+H/52xfbcjwJHy7J+6whbj8C3+kYbDt
	gtdzkN+viz3zg7sIEs5/6pEEX9aigPRIKEhWnF69/
X-Gm-Gg: AYBFou2QTo/4/Dx/sSapevurNTWJ2UeORM81CXPgWd7CQU0/8HO1AdtnTjh99TX/NsB
	SonyXs5y1dQOS99drVA4jSBAyORz7XDRlN4HvUWjlOA4gBmMdc/u6bF4yC2JGqYI4ugVVT6727K
	yiMIqKWPgWEo5+SXUvKyAl1gskBSvTgMr8DYeovlXYFuylofyZ3JQKcnXeT6f1A7IBEYTWuyqZG
	CrWL24FmOjnIebOBkdIrwuxzIxYgu6QuW/bYjZtDS5vq678X2hCZHdUbYYayftPdFGsMdOPbGRQ
	Xa0oDYwInAKjcIaaRb+pf9pRmf9HQRC8Q9WPQ5Q1U2YbGBMIno/Bow==
X-Received: by 2002:a17:90b:4407:b0:38e:7168:281 with SMTP id
 98e67ed59e1d1-39debff3508mr7663269a91.10.1789417832827; Mon, 14 Sep 2026
 13:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602181349.3969429-1-ctshao@google.com> <20260602181349.3969429-2-ctshao@google.com>
 <CAP-5=fVwLO29i5SoLjOBhPqqUMTiy-z52Wm1mbeBF_941Jbx9Q@mail.gmail.com>
 <aihLa9ezNXXZm9mC@x1> <aqdRi7v_A03mY1tU@x2>
In-Reply-To: <aqdRi7v_A03mY1tU@x2>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 14 Sep 2026 13:29:56 -0700
X-Gm-Features: AcwNN1Uyj1nEMyc2YgqJq1SHKBkxWydcjwGfqjjonWswyP_b47BedhpVDIjpjbE
Message-ID: <CAJpZYjXT5rrqQuUTePV6WS5XafgtW1Z4FxMoT93uKjYdKU1VWw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] perf evsel: Find process with busy PMUs for EBUSY
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 6:44=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, Jun 09, 2026 at 02:20:43PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Tue, Jun 09, 2026 at 08:58:03AM -0700, Ian Rogers wrote:
> > > On Tue, Jun 2, 2026 at 11:13=E2=80=AFAM Chun-Tse Shao <ctshao@google.=
com> wrote:
> > > >
> > > > It parses fdinfo with PMU type, comparing with the event which fail=
ed to
> > > > open, and report the processes causing EBUSY error.
> > > >
> > > > Testing cycles and intel_pt//
> > > >
> > > >   $ ./perf stat -e cycles &
> > > >   [1] 55569
> > > >   $ ./perf stat -e intel_pt// &
> > > >   [2] 55683
> > > >   $ ./perf stat -e intel_pt//
> > > >   Error:
> > > >   The PMU intel_pt counters are busy and in use by another process.
> > > >   Possible processes:
> > > >   55683 ./perf stat -e intel_pt//
> > > >
> > > > Only perf with intel_pt was reported.
> > > >
> > > > Reviewed-by: Ian Rogers <irogers@google.com>
> > > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > >
> > > Arnaldo, as the kernel piece of this landed (thanks Peter!) could we
> > > land the tool part too?
> >
> > Thanks for pointing this out to me, I'll do some housekeeping and
> > process this.
>
> I think this hasn't landed, I tried to find the userland part of v8 but
> didn't manage to, can you please point it to me?
>
> - Arnaldo

Hi Arnaldo,

Thanks for taking care this. The link to lkml for this userland part
is: https://lore.kernel.org/all/20260602181349.3969429-2-ctshao@google.com/

The kernel part
(https://lore.kernel.org/all/20260602181349.3969429-1-ctshao@google.com/)
was merged by Peter Zijlstra and I can see a tip-bot replied on it.

-CT
