Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8C4F93B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667910; cv=pass; b=nvxpre4leYG02/4jFzVNNf3yfWN+RSr7/lTazbDDiRnSSWYVua0ZVstMae33J2pYga2CiSN7um/k3DjmeFoDhuoY8iOiVZPLcQVjeKV4aHwFaUu9D/y7XgomVnGOjTy/GeNlEOxcxblI1FRPBh+7EOofPty7kjJs6qV1aixqETE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667910; c=relaxed/simple;
	bh=l+PocN5637M3qEv3P3iBxpViv1nZB+zPWLXTvof1XcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVdENm9n8wyqzMUOB0TmQYBmt/SxxZD/Yl8WDimLA4PVSt+Lz+Uxg9pom3zGGNYaOzUCiPyZSJv347WKGvZr3k9zSY36NVZzIipeXmAsi2binK65ljjmVXhtG3czPd4SkhLZbrOmMFmPnRgyJ7bkyXSqWVOxahi73hlOD3yAwkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nS475XRZ; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nS475XRZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53113d72966so30211cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789667908; cv=none;
        d=google.com; s=arc-20260327;
        b=Uz7aJOhjBqHo0+H8q5GW0Cidl+Uh62S5WPYhNHmRUH6hutLV6iJjOeyBbaz4Z7rhz1
         hJpGO1+SY38A7lv3TDq6C3Lo8rE6D5FhNsANbXmScKlrZOq6+uTomBxujkI1M8kw1Mve
         7lxn/5bAoQRRldlNDtDjlDFHukakMMAxjB31EgM311+ndGHbLUez22FHwEUXuF62yBcg
         X3GkeIV7cwIIg5FHHPMoITySLYNctFYhRmeoFIm3kn44h0Bl9oDOsXrbZ0x3KbSE0ltt
         1OrRxCYtt2SCWGv4EYg9lbowgfRYHzgCOWcrSeqhG5LmHRQnHa/qvkJL5JFDVJ4Qcc0M
         EfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zH1jP0g6rTZl7HFb520QhPTGTp2IGGyzoCj2sKE0ORQ=;
        fh=BRmuJFdwvCx1rBhjEwJRhrDqQQYK0VSTsRp1Ic+CqwU=;
        b=gO+6T+JpGzNooaZk+5E1tpDVMz6R4of+Dpmdxwuh7N/neyFwNOiv2B7b2SNQseuZ2d
         FElT7AxE4YAlN3fUPuqR4mw/W1QKi6FBFCsNr4o5R4V7iS0ZYZpT2qbGzv7hJGJ71fQk
         Bzh/S6Bcp323DkpM6toMqLl0D5w1VGwq0WB0BIpMQLmI8QwZ4FeiISx8XSzrshZVZCWE
         S8ExjPddzZwIsOjh4YlAqG1qL2hkgOpuvozF0Sm0OiZjOUfLPUi30v+OfxFGlGn8EJl2
         fMzt16s+xvDYd83Cf7FFi4OpCFKQIsU4opdhlPCvK59Dl9XdDqH4v8vKc0cyvkJJgt2i
         m7rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789667908; x=1790272708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zH1jP0g6rTZl7HFb520QhPTGTp2IGGyzoCj2sKE0ORQ=;
        b=nS475XRZcKf2WpZ12yrVucIuTj5dls9lalnp4sRQqhgyrR5dIjL4ivv21QugIPIdsR
         7c+FXCKa0uvVawQ9TQc/b0M1uQk+Culy2OM4z9XLj/zP+cq6D+7FRLWFNN9RwYLlcJtP
         VzDBPc0WL9uRVZs02yy/rdaEws4tUFdckmIvufcpNxYeuKv0x63loOf8CX9Ay9k9rTz8
         llVwUXgNRy0Q8mJt1ZiagV9u5Qo0vUZ3c37zjq9cFIULSsbI0/3gcSHcb237cmuuuebo
         9ei+pptBavz0z5MKP1FYAuzkkp8NGRW+d0P2rihpjPwisQN0+kTPrqNHAxaDwOSMhs5R
         ae0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667908; x=1790272708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zH1jP0g6rTZl7HFb520QhPTGTp2IGGyzoCj2sKE0ORQ=;
        b=QQpqvAnFUuxvFxB46f9D4Ll+h7DWQYFg55WMp8e0yqGOHZ6sEL06ojQPFnTRR7WEAV
         hnf2mifB/o0s67B5G/yWXJJrK7IFNmF4vaYrr4BtPl8taW9sxTSp7dvevjiBubYUazv7
         EmDlbqCgLTrbDbjLVk11znCUJPV8pb+ziDUWDpuC2Xi6kLTD7IEZ+TSc8Zao1U8A7wIF
         R1WYaFSYHCgOq2YbZRfA/xo73Sox4SFmvCf2KqJbgCfQ32Nnl4yBYk/yku9XhTdtsdDE
         gtYajDgxaU6jg0GdN1GlapzeJgKJX2xElW/VWk1rc2Hc6ZYXOB5LHzm17TsNvgFgATA9
         txaA==
X-Forwarded-Encrypted: i=1; AKwUvBytAFEYFd8g1BD+5P0wIr3EI2tnK7AuEKCmYmwxvfDfzikYItx3g5B5ZDCpmlC9GM5zcGQgoNm0UN/tBZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nu6REJ5b+OhQP+W5UQDJlh2nL5jBzDNQozm5+8srFZPAv3TRph
	m8CCLOnQUltaz7DGS69blyyNkVAb0StbhDUstY7V3ntUM1IsDqkhp8gCcapFbRooMu6SFqdLkVW
	dW7MMKq6NBTbyPz6/Nefj4CaW4CQbZoNox/Osit7f
X-Gm-Gg: AYBFou1MlNPq8GorjM4TNDkr8AvHV1DmpSQHL8sB/lfsiYMKQ7UbenD1nMzN2/lly3H
	P8ZO8+bnbJhzD5uIipDR4xHyHl427GBmZ0wgqcGwprWAOoQYPfkJpKrJWPhLKnES9hsV0lCXU7P
	eAXB9vCT7iJn+2VlY+DarAokMWU6E8QQqkiIRHL74gE55WmJG7s2DrlpVd5zR7WePl0dmqMRv9S
	zQyZzNTLgl/SI6UeoiXpkVSgOyr/aOZmQroxmyp8hke2JDFDieCoc7RFOFICMl6GKC+lprfaNQr
	S8hvS43A1cYdvHEcFyBHhNobaONvXKvTn2T/ICPnH3phBsOqklYEwaK9MQN+JRtujMBqNB16qdP
	3hZw0NAp/
X-Received: by 2002:a05:622a:e111:10b0:530:ac23:ff40 with SMTP id
 d75a77b69052e-5329d84d69emr874811cf.5.1789667907464; Thu, 17 Sep 2026
 10:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917155528.62607-1-acme@kernel.org> <20260917155528.62607-2-acme@kernel.org>
In-Reply-To: <20260917155528.62607-2-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 17 Sep 2026 10:58:15 -0700
X-Gm-Features: AcwNN1Vxnw54th8UHPKp5uTzWVtQcuNf7uY8my8GErrk-09F_GrhQCeHOeOoHhw
Message-ID: <CAP-5=fX5+7K_9eApj-t87iFVSbUPZDpgnMYWfSoCcDynrYqixA@mail.gmail.com>
Subject: Re: [PATCH 01/15] perf debuginfo: Fetch debuginfo keyed by build ID
 using debuginfod
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:55=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:

[snip]

> +/*
> + * The build IDs already fetched in this session, and the path of the fi=
le
> + * that came back for each, so that the repeated requests for the same b=
uild
> + * ID, dso__debuginfo() is called per symbol annotated, are answered wit=
h a
> + * strdup() instead of another client: the file is in the debuginfod cli=
ent
> + * cache already and its path checked before being handed out, in case t=
hat
> + * cache is cleaned from under us.
> + *
> + * Guarded by debuginfod__fetch_lock.  Only a fetch that brought a file =
back
> + * gets an entry: one that didn't is recorded in debuginfod__misses as a=
 miss,
> + * and that is what keeps the rest of the session from asking for it aga=
in.
> + * Like debuginfod__misses this grows with the number of build IDs in th=
e
> + * workload, one small entry each, and is not trimmed.
> + */
> +struct debuginfo_lookup {
> +       struct list_head         node;
> +       struct build_id          bid;
> +       char                    *path;
> +};
> +
> +static LIST_HEAD(debuginfo_lookups);

I'd still prefer keeping the debuginfos owned by the DSOs rather than
having debuginfo use a global cache of debuginfos - I expect the
debuginfos to have some non-trivial memory overhead. With the
debuginfo in the DSO, when/if the DSO goes away we can reclaim all the
memory without worrying about a separate global data structure. We can
find DSOs in multiple ways with dsos__findnew_id:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dsos.c#n343
We match by name, but if those differ:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dsos.c#n117
We match by inode and/or build ID:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dso.c#n1473

So struct dsos is a build ID indexed store of DSOs and their owned
debuginfo. We find DSOs off a machine, but I believe we always have
access to the relevant struct machine. In the worst case for probes,
for example, we need to set up a host machine. Using machines
inherently provides some lock sharding, and they also have the ability
to reclaim memory.

Thanks,
Ian
