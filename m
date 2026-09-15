Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0832845C6E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505590; cv=pass; b=PhnI2PChHkYldJor64+2SQQaU/8SvRWBJV3I427tm9SbuRM8cb9THQvND+ffZzI3Q3I4R92Mir5uD4lHV0ODNB3kcqFFYh010wkgJWNk6BHGN9U8Xt9fmjKmChq2kdRstLV4PPHlX/jXvIqs/XuO7YjomtQ5gUiy9vEBUcmz0n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505590; c=relaxed/simple;
	bh=Yu/GVSLVCFsCORBF+H7rzZHEtXbnIr1kuWpuj/0Q8iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3PMGiSDdBk7w/Q3kpd3boSDKK6K1vekwF8cHko5b/gChPzo3VoSVfpLG9Ur0Ry9ZrJDSOiKCkC4IpGYI92wJD19I4yoTRv47HxyJdnAPc4NDarQfB0h0vtFTwSC0kNYg+zLF6nvFFlYpUjQ6thU/LOr8RciDxIwpdeWCibuP4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULFwqaSL; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULFwqaSL"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so184967a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789505588; cv=none;
        d=google.com; s=arc-20260327;
        b=cIwAcNds2fMlU+Ba/J05wXSbHkqxKg4PUu78ziNb9Z3/V5bR5lJRR2utt+C/6ouZel
         ZkmHF1OsfWi5duUeeB/uFnwM70oOcDZyFe6eo9OIcHLVf48rXGiPnQuNMaHoEXuwncDe
         nK2obF+Gsj/yHqZ1v0yek3ve9TpjK4UWLDojM83knve3+nMN+aoh8MFVcAPakxYFj9l8
         cxJNI/aOuPHf1qoqnBfkA9k1Ws99bUPZCUWgePymRErhbAmsCuF6JI8OBrCG2T4rcdI4
         K+5B93/CYEm90Yjp/O6rtyy84p86AG2OUVzBqmrH+hQ7Sr2z0WJ1+wFX2FmDXCBajAjU
         BHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6rMCIWAndgqGHUhmczP/JJpII4POFmLZaicBAR5dlJQ=;
        fh=542yQcwSN8Ri8QVVtUUgW/lKi9GwAu/Cynaje1I7844=;
        b=A/+2rA61T3z6OtWf0WdSIiJXspOCZkbbz5LVngYLNOb7Jt/BHlfaX/DjZZVye+qqdP
         c3pg9fdCbfVGZCuUcsdfSw4Xezadt/8IFRpXaXH2HXgPtSOf5m2Qa+zkc68oXos9qdZ0
         TJkfC243RNGiZqvSQ1avNPzFMbgwLKkfgB3gw/9GheZWb4F+MekrYkKI85IVwMF7Rgk6
         To7DqgP/gYhK9WECqfWQvdk4HzQLbRs/BPJhoeu6fKX70PDbIPryTfQ6HkQKHjKNJCc9
         I6DqvV1YUu7tR/iPA57dEr8b0Pn6s7WizjnhtdXWbL+LejvAmP9N2DOnhYHSiq4XP7tJ
         ZqQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789505588; x=1790110388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rMCIWAndgqGHUhmczP/JJpII4POFmLZaicBAR5dlJQ=;
        b=ULFwqaSLFxwTExBrhE5Syum4lLGfOkBY1x30ndap4RJaD7RwUSOPowqDZ12AkAnYQh
         SMTrRPzXrr+fx7d2/JTnewDqaUPY6dzW4UkY+q/t9bmKN6W2RXGloKGqyvOW5tFhXZ5S
         vLBMsYn++yjgiX5BxzdFSzKKEbT0nJxoJGGhJNE/E0Fyl4oaC5cDvj3JFQpm67s0xR/l
         RBkkcAJ+LwoPcgw4iUkM5YgFttGM6a9H4/VxI2wAaT3ryD9iDntbqSyVqnMtXunfoNwK
         /dg6/MjLB528eZqR/fyusEv6cj8y7k3Uw0oCS0NikduSg0gWNWpIqpdZzoC0H/cvbiK9
         it8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505588; x=1790110388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rMCIWAndgqGHUhmczP/JJpII4POFmLZaicBAR5dlJQ=;
        b=bNmfZ551wUYZlaZmjv56zraRjU2fDxRcr+pa3xFw7X3ZMW5wbfJhfoDm0A7ZX4pooU
         d4KOfiHNGePLOIvJlGGmZlSQYqwKAZOvFi6IEE7w63drJ3l+oGht9yQIy4bkGbUdwI6y
         AK/kZex+b56PwUOvOUXb0XVUUWiWRxe+SSoxbWuE6P2+Lj3t3bkyMjT2yrK7Uzs0EIhq
         Zou5a60G8ILlzabc+sBBIPFActGoOLkoLYkM9YW3XxfjU8ycK4nSuAHM7DTFhPkfolcz
         8AICSuZ/bbpoMT6Vp7M0m0tBJc16NdOH+4pYUlJ3lHIHHogIrQIIpkNxCVD+ITpLQ9uF
         943w==
X-Forwarded-Encrypted: i=1; AKwUvBzicJ25EOoZvadUsT0kB0MIn9HkXy1MCNOjIkT9hP9DOXG+Wd6g1oEfMvWCXhM6OCm6fE2964+NtUCbBOA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+68qTWs+YNXpkCFvaWph3POmQy5Fd0Oudw4UrUQWL93TcOV+R
	eOUxjD03hxpDAmgEwQ6GXfAFaUhuz+LbCzALOMGej/JeIZm/vc8GmGmdVwd/aJ3wuT1q1jOtkDp
	dhR8NMo60Tb3U+4Ic5oYD0NySgt2oRTCPG/mzsCTE
X-Gm-Gg: AYBFou35idZ/9Gcg+G/RiW/UjrRhOVz1Q+O7MV431cri06V4D2U2RYXDo+v8xCROhPv
	tWnQHKCNZiBaNfDH7HmNaoyrkXzf+apj693px5y56rn4lnIzRJCZ7iypIsmAHou3oNVtaD47loL
	GwspDlkde6tP5/gV7TrtmcG/ijsxRTPd3o3NjBk+2JucUSt26K4Ftlr/2shAA7t5o6wtw0DQYhA
	pOtk+O08WexEWj63dyyHxE4N4/bwAC9F5nSY6LYK8CjhqzXWnEmwbvuiaaUVQmgIQquuCuDQWWy
	B+P3/iTP8xDZujs/gkESRwt6W9IAvtTG5lUScKfxJeJkLUbekn3aIw==
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id
 98e67ed59e1d1-39e1e4c4687mr170061a91.18.1789505587709; Tue, 15 Sep 2026
 13:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602181349.3969429-1-ctshao@google.com> <20260602181349.3969429-2-ctshao@google.com>
 <CAP-5=fVwLO29i5SoLjOBhPqqUMTiy-z52Wm1mbeBF_941Jbx9Q@mail.gmail.com>
 <aihLa9ezNXXZm9mC@x1> <aqdRi7v_A03mY1tU@x2> <CAJpZYjXT5rrqQuUTePV6WS5XafgtW1Z4FxMoT93uKjYdKU1VWw@mail.gmail.com>
 <CAP-5=fWKaSgVF5M-m7fObPdt5=MFZpK0RcmAS_G5thTYSzLXPw@mail.gmail.com>
In-Reply-To: <CAP-5=fWKaSgVF5M-m7fObPdt5=MFZpK0RcmAS_G5thTYSzLXPw@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 15 Sep 2026 13:52:31 -0700
X-Gm-Features: AcwNN1UGrosb77A4d6cnIyDQVozvJ3caWUDEAq9vyo7WccBECoRDfyB_X69n7fw
Message-ID: <CAJpZYjVaD+axOaRLzbDe4343GNo2H3pZE7EOqNs49aubQTJuUw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] perf evsel: Find process with busy PMUs for EBUSY
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:54=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Mon, Sep 14, 2026 at 1:30=E2=80=AFPM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > On Sun, Sep 13, 2026 at 6:44=E2=80=AFPM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > >
> > > On Tue, Jun 09, 2026 at 02:20:43PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > On Tue, Jun 09, 2026 at 08:58:03AM -0700, Ian Rogers wrote:
> > > > > On Tue, Jun 2, 2026 at 11:13=E2=80=AFAM Chun-Tse Shao <ctshao@goo=
gle.com> wrote:
> > > > > >
> > > > > > It parses fdinfo with PMU type, comparing with the event which =
failed to
> > > > > > open, and report the processes causing EBUSY error.
> > > > > >
> > > > > > Testing cycles and intel_pt//
> > > > > >
> > > > > >   $ ./perf stat -e cycles &
> > > > > >   [1] 55569
> > > > > >   $ ./perf stat -e intel_pt// &
> > > > > >   [2] 55683
> > > > > >   $ ./perf stat -e intel_pt//
> > > > > >   Error:
> > > > > >   The PMU intel_pt counters are busy and in use by another proc=
ess.
> > > > > >   Possible processes:
> > > > > >   55683 ./perf stat -e intel_pt//
> > > > > >
> > > > > > Only perf with intel_pt was reported.
> > > > > >
> > > > > > Reviewed-by: Ian Rogers <irogers@google.com>
> > > > > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > > > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > > > >
> > > > > Arnaldo, as the kernel piece of this landed (thanks Peter!) could=
 we
> > > > > land the tool part too?
> > > >
> > > > Thanks for pointing this out to me, I'll do some housekeeping and
> > > > process this.
> > >
> > > I think this hasn't landed, I tried to find the userland part of v8 b=
ut
> > > didn't manage to, can you please point it to me?
> > >
> > > - Arnaldo
> >
> > Hi Arnaldo,
> >
> > Thanks for taking care this. The link to lkml for this userland part
> > is: https://lore.kernel.org/all/20260602181349.3969429-2-ctshao@google.=
com/
>
> Hi CT,
>
> Would it be possible to rebase and resend the tool part as a v9? This
> will also trigger the Sashiko review, which would be nice to have.
>
> Thanks,
> Ian

Thank you Ian, please check
lore.kernel.org/20260915204951.2935261-2-ctshao@google.com for the
rebased v9 patch.


-CT

>
> > The kernel part
> > (https://lore.kernel.org/all/20260602181349.3969429-1-ctshao@google.com=
/)
> > was merged by Peter Zijlstra and I can see a tip-bot replied on it.
> >
> > -CT
