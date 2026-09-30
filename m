Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014EA457E70
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798310; cv=pass; b=TNsQz2hEQUxauXcGmSOlx6E7kpjhOu7XueEbmfj9y/rtFmxDH/YAg48XiqSIBPzecF5p7Yki+blt3mluLY5J8rcsBFWwqJXONhQ0rGnLKwt9Gku+vAH+uQJJsWrMR9rW1KCZAQceXovc+X8Rvao159zRWFqWiaDVR/lVb01zUlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798310; c=relaxed/simple;
	bh=IYWiKJkDCp5x3ARAQGdZNJcgTTfydtt28kmbsykDHMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRkxuH7wigIclmJlfbECrbJMRi1OfWd08XFsaNM3hQ4PMCQB094bkYphtUHg3XZ+L2gflcNkzz8/7jBYNWR5GA6EP0LblUol7YbLNvbs7NWT/D5FHKm3aAoLdOmdxHVSfH6VyzjAllVn0SAvknvDfqTOGvhSPn+zBEQrcwqsvIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=JF9PTfE5; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="JF9PTfE5"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fded6b087so5382684d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790798308; cv=none;
        d=google.com; s=arc-20260327;
        b=oWUdqD1cwG3zKLMcL5aQZhIaQ2+Sw0M+KlJkLn2eFtXNnXaQyrUts2QJSgfFCTfnzV
         YNOC+0ixZ4r/cQ0QhN1Y8tE4ioVDwZisX1TN1Y6w4Z12duC3Try3IbKMqzTvt/qSqQTr
         /ZhBV26cJJImLSVXWOfE37pX3UONO/ElGmRGpha49g+4BugKRBg+qJLUN+psz2zO74qn
         WhMZ1Nfo0z2ho5Y76O/UwTRRhZjD6qtmwyCDQpUNTAAN3xDKT6HzApeqVSYY+aW8G1oV
         UINwc54Leis+bO2SAhi7iVASFiEkO94CkbwKI80RK8Od4PHYsfnsPdac77tE8BoN02Ht
         Squg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYWiKJkDCp5x3ARAQGdZNJcgTTfydtt28kmbsykDHMk=;
        fh=dSia1VFgMXm7wym4dAeQjiM2DfrlZdTVW7d4srSaSoQ=;
        b=gHCxEQFR3zBfjbr2xzLgomH3CQUl1Kj8o6loE9chiSYbftrvnruR8urkrxfzRxy9Qf
         sCCA/ETHzLeS7xC6N8mLU/Zvn4T1KwpD2SGqO6V+2yuxNDNc2oy4yP474kON6svfOCHn
         F6A7k1phClSa1L7hBH5KkDTTnTWS1bs7PBMGG/Msut+9lQ9S4CF5+vyQu0bdX3KMJdPa
         1OXcPxQk5xiU6b2OWoMocjaVozeQcYeZ7hPkXYmDZaXS1lvDB1Ty9+VhhQHTJkZbFWWT
         zDO0HYQiQVBvysdL2eH9FOS76uybCZCzc4Ml7DLoNjqsNLqZ2U04b8jCUD311nSOw0HI
         t1rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790798308; x=1791403108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYWiKJkDCp5x3ARAQGdZNJcgTTfydtt28kmbsykDHMk=;
        b=JF9PTfE5fRuc/2lBIe3zThtPWeWV5KaH+CYo9nEaaZESjnxqWwLFwfCNCkFdLZ/waO
         7ayuh96QFv070tV6HGcUurElPdVbVdy6G5aKz9y99AE3xAkBxJbmqg+u0slOocFYSnzL
         OfRkVo6Y0S7LOAeauEXgi1QTLA2pMW3bUGX9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798308; x=1791403108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYWiKJkDCp5x3ARAQGdZNJcgTTfydtt28kmbsykDHMk=;
        b=elx+qgA2kXcwcjAXewNh5CVN9K5Nvu2E+zwh7eU0K/AtxQmofI+s3fbRuViScnUzfR
         5Lj4wmPgBzQHf0jNnveNIYeyIISoBU85JtnOa0BjKkp/yqpSVkpCcJ/69bwL7KnQRctz
         3FFntsLer/gGV0BuaZHHD5LmBbZJgJPom67QvsXAzHD+Kjw6mkrXeH+j5aZizvPnNZDi
         r2QVOmR4NuKQI79MiOtjpdT2p/nyA1tm9DV6PQpsQRU0L3PcbGVbHmgA4PkdUEiEPZlT
         dxuRuV6hn5UAZvoVO+JeC//z6Ttd4bJGbx3QDgqcSPZVhb3mqUUurH8kwRGnDFbWf7q/
         /jvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFl3YjaWNhsMZsPr68yPhBIl+rg8FxIeFTwgbSJvM3X7tOiHvcGkfJkSsFVV6587cT+yCIuFZhStCZehs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoFnxdCr/g2k+jNz1GjU/zNFTRf2zhJRmN6St2hMc252ym+0cm
	xwd8aboPSF4fsNrRgFmz6yKRSzUGUycWYpylxIXHmwGM1xiIaVSFejeiv5HDTezYO7YVBDvjFfx
	EKMhH+glDKZAHt/fbb2Q8/gbU52L+yDe0dxfAninol6pBQxUxClXxYZoGDg==
X-Gm-Gg: AYBFou2G1pQLV+Xq6KTKxxdQcwD72rIQ/GWBO6FogwfsQopdDNNliY98EMRizb1XR9M
	oJQVxiDkzDE4hMsl8pIqLi11XL2e94L2psVQRRjda9Eej5EWcOe03AhbaDhIW2kHpIK915wM+R6
	fA6yXbAFj+FYOhCQo3Mknwlc2P1ZPNoKePWimajP84CE1v2JMbWF0N3EYxSgS1oy/Or/xbAoVHo
	k3SeitdOzreMJxLu3mx3mLySgK1sYPswRT9yfWovoaPEbnQVLURRL9MV8ArR+1gZdX+jG447Han
	2ERMMpa/qVrmxCvE9BBXQPznOw2eP0Sa7w5W8Aecm17pS8PaELPG0WLJWFe0g2Kvnyho5N1WRAx
	Bjs1xAdA3vf8=
X-Received: by 2002:a05:690e:d5b:b0:674:2041:89e with SMTP id
 956f58d0204a3-676834672fdmr1239550d50.42.1790798307260; Wed, 30 Sep 2026
 12:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
 <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com>
 <CA+w=M=Tdyt=s9FTvDH_4ozk_1MM09J6xTdLrsq-WNhQ1S+ACXQ@mail.gmail.com> <CAP-5=fWMF=HrQwBObz1ryc7e+=0iJAwT=QSa0neYT73xCfqAjg@mail.gmail.com>
In-Reply-To: <CAP-5=fWMF=HrQwBObz1ryc7e+=0iJAwT=QSa0neYT73xCfqAjg@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Wed, 30 Sep 2026 12:58:10 -0700
X-Gm-Features: AclHuK_SPtTsJugnN6QRlQJvW6Bus54R8VrCRQSl71DQf_wzl1pLk8I7Dle5dp4
Message-ID: <CA+w=M=TP=uMcYd2SEG0NvZ=2uLNKD8kekAEVsrBjPKGTTn_9XA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] perf script: Bounded and lazy symbol loading
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

On Fri, Sep 25, 2026 at 2:56=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> So, I'm pretty against the complexity of dealing with symbols that may
> fail due to a memory pressure issue.


Hi Ian,

That was aimed at --max-symbol-bytes. I'll drop it in v4.

Following the other thread [1], it looks like we agree that lazy loading is
worth having on its own. Whether or not the reference-counting series
lands, loading a name only when a sample needs it is a good change. As
in the numbers I posted there, it cuts memory use substantially and
makes perf script faster. I'll prepare v4 of this series without the
cap:

1. the ELF_C_READ_MMAP fix
2. reading DSO data from the debug file the symbol table came from
3. the shared duplicate-symbol selection
4. --lazy-load-symbols
5. the lazy-loading tests

Patches 2 and 3 stay because lazy loading needs them, and Namhyung
asked for them.

Namhyung, on that thread you suggested a limit that prints an offset
when the name is not loaded. I said I could do that for the byte cap
in v4. I'd rather land lazy loading first and add that limit later if
there is a need or interest.

[1] https://lore.kernel.org/all/20260928075237.3055101-1-irogers@google.com=
/

Thanks,
Alireza
