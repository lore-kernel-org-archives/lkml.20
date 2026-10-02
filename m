Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6242E40C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790983565; cv=pass; b=cEwk8R7cnw4lZgr3lkUqNVInzbsazE4iOY3r5AEwy8iHPixrTX/7ZoEffY+erAJJhh/3eaq64A62zHDrIui4gZs3f2SNFuuxIB4LSNhJ3bP7hKPCusRBXEAHy08aL35oPv+qFM23DYUtHG1IJtrrXC/OJTOvmKSxnxEHlFXpPCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790983565; c=relaxed/simple;
	bh=u8gVVSgBrEyEZ0ngpczrNEJeXuDf1kkf1UVuVDZXvhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMDxVzFeRWkNz7ABdMzITBYeUzkV1pnNyJCdbhzyQ+Fx/MNZMbAwzMDCGk1f8btpUSdU4DhOQHqKg8C76NCzueKgMzBsbjK4S6YN+IKr9Ai4a32/odgV48fhIO4qma6E/bKJ/Y7vnW/OT7qZ/oCW2BUThXXln5BfbrnzkuyDWKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=poPoUCJa; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="poPoUCJa"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so37860d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790983562; cv=none;
        d=google.com; s=arc-20260327;
        b=Pws9CQJNF4+pGh0qVeezcrWWouwHxHgFazIIAjZ5bQU2xwXh2J3SqYpbTUQBMVXxK0
         Ai7P5l1bMYjxNNemwCvCimJVRnmINfdkPIp92V5Bf0zMoWm/345hIFnMMSbOn9tTGS57
         MIVH2hAiuhvL6h25EMB/4ef9wCmfPeJYddFIOjOPrajf12Xiu6zKvQ+dk+PK9W90Fg4g
         NwFk2Cl0uHGm3AULO3MhqBXF/pD4X/WXO4jQH3KPb3dcOT22dOFRVgzNB37SldVOOuGE
         9JQB1WmeNm/b6DOHBUBU5tbWlmtFrKoXYEmyg01Wq2A1C8czAJeVj8Jbz0s0mbFIhE0C
         Oveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8gVVSgBrEyEZ0ngpczrNEJeXuDf1kkf1UVuVDZXvhY=;
        fh=2xPPQPy2f9NxaZQoRhtyVurYlqVs935m051DQp2h5Lk=;
        b=boivQwAXvLxLgKrRMolKFiHVtck7BKm3sCtmkE2u/pmrP3udXN0yHHVznGeo0uGFIn
         UNYxMY+B5dW04jkEOwZfOkpcBMiJkUNEIy3WR91lV1mIdJ9r6eO4OgbNk6P4TpH7sC+/
         mQ0gb0TwVuDL9penxOR3BZffdSi8kd0HoFTbtMSu+XsTS5ptbvpyN51xJT6NvL1J/54R
         I2BfuZs+m7A2XSCbhiFnyOavrcYPUItD9bhdRTLISQ1PvUwNGSgAfcDcUBdslLsj9Se8
         rTCRDDwwQyT8Gd8b9FB7aBMCLiH4prGXEnOZz9hANXR3Y6+l5w2EhUd/1cewLhn+yk/Z
         pHXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790983562; x=1791588362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8gVVSgBrEyEZ0ngpczrNEJeXuDf1kkf1UVuVDZXvhY=;
        b=poPoUCJaJTVARtJ9jLfbIFI6Oo+P1THbdWPGmccfi+WPK2khdYHENXGWmyMO2PSsMg
         ogMWPoE8fqSGxU94KhWPDFXbMP2Ae9duaCM6oAhoMrlRMODEECvMKXf6epxhkR59sddT
         sslVGO7JiQSTmRhjbsvsNE1/+G+4+r7xgGzF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790983562; x=1791588362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8gVVSgBrEyEZ0ngpczrNEJeXuDf1kkf1UVuVDZXvhY=;
        b=Jfnd1wUwhcG74dZZWEntro9ZuoGImaoBUfYEx/wmxyL2RKWuE/9rNIIemzQg0NFCuu
         xYUh2kFtD9RCzDxDCBtPl6smAPoPoTZdmDLl/C1OCZiV5StKExLy7sHwI/0qihuH9bXm
         lAzqSQwZWc6nBuvo4jj+lV10pgV1UZvmm0Px923LFpT0WeQeYeZBRMWWMU26ZP8ITVNf
         xhCnl+ogxNNC4npgy6JTaeUrC2zu3Yd5cJbx6qLBA9IapP74NsafJWeg/So0cczTlrNy
         zpFWvebsd/9ATKYUnoUlI23IASdBO9MEteOzMuXb4HP7/xeBx0/VDxEVPfCEbyahXjyH
         tjZw==
X-Forwarded-Encrypted: i=1; AKwUvBxVnro26f+8o2xq45dNGwjIiKAOxA1p+cv/tILw7SB+T2E2V0oP4zFKZrFFaMZkMCUP/xoSPj/vq55wYDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITAr0002mNV+e24wQf22uO9BqdfhR2eopUcjnA2WNQWprZKF/f
	ui+ZZ78bQkc7AoPKga1dAK5lc1lPVNHhJ3gmnu3c4LEtovkSrp0M1AbXu+p/f8AKb4ewh/IMrVz
	zuOHy3wNTNlH/F9C5p0QF1vjM6+frYFoqgy45BYUC5A==
X-Gm-Gg: AYBFou0Rx4RByr3W7nGY0pRUB40nD1Yt4bK+6w0tMi6/aN52AV8G4gVDi0YSJnx+H+F
	owO6soqBvQszoKkrYY8xuU8bpe7ieSDSPB5bso1jbN0LvA/jFIY7VIEvIOtCXIBzztYPG0BBtrJ
	uw6znNO2PwW1s/TTXkFL38SQ4xe0j6dBlDbQDFgilK5YI9DuPy5Z1LgWr50NQ539trKoc3nHjmK
	m9UsiQslkt86b3Lu4VO3PFACBwsIjgDd9ahvtSZLOEUa4OElhS8t7nakQQCKUgmE1ZN3U7hn45I
	VCc9gIhG6NI2TMm8aY8Ls8S1E75X4NQdUm4cF7bQXf+3TyVkeoqMlPp9NEa7j1C9Wp3LYYWssCl
	oqZJJ6RE1M5otjXrgTSnhNw==
X-Received: by 2002:a05:690e:804:20b0:672:99e0:ebf6 with SMTP id
 956f58d0204a3-677ac1af0femr1170670d50.142.1790983561984; Fri, 02 Oct 2026
 16:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-perf-symbol-memory-send-v4-0-0a592bb2539e@uber.com>
 <20261002-perf-symbol-memory-send-v4-2-0a592bb2539e@uber.com> <CAP-5=fX=BvLMm-JHLqaR6ACmP0buF9TSvRLf_Cs1us-o6aMGRQ@mail.gmail.com>
In-Reply-To: <CAP-5=fX=BvLMm-JHLqaR6ACmP0buF9TSvRLf_Cs1us-o6aMGRQ@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 2 Oct 2026 16:25:45 -0700
X-Gm-Features: AclHuK-ph-iyfrQ2eVW2jG3FptK-AGuI-o72WhxQK4yu3pLAKj6OtRrC1G1nndg
Message-ID: <CA+w=M=REOd1gvi+c6vkd0Ue=q2d_gfC2xeJ_KSVg0H0AaOA+pw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] perf dso: Allow reading DSO data from an explicit file
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 3:13=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Fri, Oct 2, 2026 at 11:46=E2=80=AFAM Alireza Haghdoost via B4 Relay
> <devnull+haghdoost.uber.com@kernel.org> wrote:
> >
> > From: Alireza Haghdoost <haghdoost@uber.com>
> >
> > The DSO data cache derives the file to open from the DSO's binary type,
> > which can resolve to the runtime image rather than the file a symbol
> > table was read from. The lazy symbol loader added later in this series
> > reads symbol names at string-table offsets in the file the symbol table
> > came from. With split debuginfo, the data cache would apply those
> > debuginfo offsets to the runtime image.
> >
> > This patch adds dso__data_set_path() so a DSO can be configured to read
> > from one exact file while keeping the data cache's descriptor eviction
> > and reopening. The path is used only when the data cache opens the file=
;
> > dso__get_filename() and its debuginfo callers are unchanged. Such DSOs
> > may be owned privately rather than being part of a dsos collection, so
> > the patch also drops the assertion that every opened data DSO is in one=
.
>
> I think some context is missing here. Why do I want a DSO that isn't
> part of a machine's DSOs? I can see a use for testing, do you want
> this feature for more than testing?
>

Yes, the production consumer is 4/5 in
tools/perf/util/symbol-elf.c:2143-2146, where
dso__build_ondemand_index() creates the private data DSO and sets the exact
symbol-source path.

The lazy loader needs this data-cache handle because the symbol table may
come from separate debuginfo rather than the runtime image. Namhyung asked
during the v2 review that this known split-debuginfo problem be separated
from the lazy loader as an independent fix.

Thanks,
Alireza
