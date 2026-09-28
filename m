Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7FC4F4026
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624740; cv=pass; b=e9DRA2enQX4bXbffY+9ZXPjtJfnun1o2s+k2ylm3wM7pUaNUBrYifSreq9NtIb0sppq1UnlQR44/NaAH3ljJg9AtoA/JQe3XHL/vWWUEQ7qB27zHaCQ8G3mlVv4YtFgsWFEWHTvtlRJ+Q713JfVJvEVKvnfy5hgp5cUFkzONHXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624740; c=relaxed/simple;
	bh=Z+3VBrtr/ZPVSGhJPpOMkjQmQL8GQmFWRc5T3O0yEw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4YQNSKEyEg2FksFp0YIR49AkR5p+vADOCDX9A6hKe7vYg/fMU42tGGKl5wC4dj+jYovTh8LFmSZgJ9tR/6JesDjtpD8cg11HnHTyT31jQ4BKUSsbFHCjlq35SCx4kuMlZeR41DJWjqZZhJ1vKUghVjcGBVDVE/DQtG0klao/9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=xlSz7s9R; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="xlSz7s9R"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fded6b087so3202597d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790624737; cv=none;
        d=google.com; s=arc-20260327;
        b=BUvELHDEqlHA3RB5mRW5avHy7UIQFZf2xdKo2qc61Nhj8F5RJQRxOKObQcd8JBizAU
         fNnmHW7JxreVtgR9a10EFS4BFjmgla4Y6s/RIJTk9/M4lLMP3NEjWA5x7SMLgKYcSSPs
         fvmFIGNbs0UrB/4qyBotwKeuWfUnUexjUEFsKA0gMAuCx3milSS2EXYmQbU3+XnDhsSh
         6ubmTckWsro+IxN5CiyV4OIuJU+XlSbfC9GMZdPx6qL1tLqtxv6dwdF4W+kfpGQbzYWx
         801ZRlw9/MJFhTHoMKAjRzsmlFauM/KWGmnJemhqtE9u9DCK4ykReLNRqsJajTCplYfX
         ncIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9HsM3qKnNrIUi0Es8BERETbPSbs587fcWtlTy1QJlPw=;
        fh=CV6GtU72pC3X2vMq9QhQFg8X+djqRTX3po2SiqU28bk=;
        b=o52m71v1xgfIvBZJK/TG4CoX2g2S0DEB95a/DXMex3w6VIHsbdBYpMD0piDUzyVyYc
         Ydm6ad3YL/lT26eUaIM/+Gm7Oc++Jo6NBtXSk5CRD9REOeY2lfZ8xF4ZqS23qSDVYKM3
         nqesVao8YJCj5rAiB3VWy23+1yKgnIoR4mytkzKJeQ6mjIVDmRWy/ZzU+1rTRwxnZcYF
         tuLxQ8fpsudxBnVHdXn3yzgmSmWbK8dfa6T/if1LaGIwgwcNBLNsZyG+oiaxsigqYCCr
         LxXi8FmSn5DtjTWbX2sSRTyCOe20kX3iptUkFbrmq80vyqmmYtflOMoLGoGAk49Kwb1O
         C/Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790624737; x=1791229537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HsM3qKnNrIUi0Es8BERETbPSbs587fcWtlTy1QJlPw=;
        b=xlSz7s9RpaZ4Iy0dtE8AI8N59fYf45bk5mtXn5OSJhuX9XGkUczKqMEnGOtYjxcijt
         DK7QhE+iDssSzfjs641dkJZxeTjhsBbAAEJs9JT97HtYotpj5ouR8i+m8zfZVKfgXoW3
         jlTVlp7f97l0BDbsYvg5ePnMsr1pBbkN2w/Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624737; x=1791229537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HsM3qKnNrIUi0Es8BERETbPSbs587fcWtlTy1QJlPw=;
        b=VPNXjxGiUoTC6TN+xN44rXVzJw9JFvctwEKvDmIDtdq6iK5OXpjDtPmYEi68Pkkv9n
         zsfagmP5aC4jh4h4yVTP3/aNNC4qp3iI33qQMxCN+7grbX/f9qybnYzatXztnTZifama
         MpZ+2FB8gASxUJyUWjbY1dN/43y3VoxHystHus/IMB8Ak0k0C+fQd6+G8lSKTzZy5C0P
         jukFTfNy00ALJkCm6hrfQ4OAAPvElvj5Mn8iMEgVJWY4dLa9PZAWD6b+rnKRx22si0Cf
         bbOsaAOHy1wu8KI7aAviNJX+IbDav5KiP1KqXR8kCcO1ptiFR6KrFHHns4bojDn12UOb
         wh+g==
X-Forwarded-Encrypted: i=1; AKwUvBxHrkYh895ILJrXs+Bczfh3/Ias4On/kkKDZOjCQtkFMBubu2qnWralofEEZk0rDdRnChzHPkZddoQhcvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhbnr3zwbEVnkBFKEfRTFrMEoSFysL6qGCcNdHYGrwqw4HBtbg
	TC3sYNavrd8sAUlAYJb5tiMff5FVaaDSPAjZxcYr1jUhf/Py7dUN3LK1plLK7a2rRey8hw65epQ
	FnNICccd5E8Zq1r1x5jzo/DzyUVbvqJy2UAjHN3Gw1w==
X-Gm-Gg: AYBFou2/zZ2Oi7MfukV2ievP+CIinRpt7HAKyVMzjE62lEXHyOHBYipE2tXMmHhIU/w
	GlqH8Kxrp/yUDcmRFbmP2Q92UjZbbkZXI099gTRdedFzAbG5ZU4Nb7bi+zUv2PyNhdEAG0ntvy0
	6wuC0wMiAcsNHgfe0bhpUWqEyA/RT/JkmEKOw74/s0qT1RQPOVyIE04wwabGFjwXBkLzHkXFrJL
	/9vpjGiX/TYHI95tq476SZlhx2gJurpVPnbRfmQgvRzWk4WEglvRp8nME1XC3r7a6JAjVbQ7P7E
	eQYS9jtOUvu1JNQFwiOId59FbrfUxeAjEhbl6TTbNtCNLErMhy/qsTOsuLajMLlY6fpXDtRSEnd
	xm4M464WuFZM=
X-Received: by 2002:a05:690e:16a0:b0:674:9cc:4128 with SMTP id
 956f58d0204a3-67409cc44f7mr5924144d50.86.1790624736456; Mon, 28 Sep 2026
 12:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com>
In-Reply-To: <20260928075237.3055101-1-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Mon, 28 Sep 2026 12:45:19 -0700
X-Gm-Features: AclHuK8Y5eYaJuOn_bEV1rPRLxdFZyG-EzeNKpmmN7mK4MJhUBWRLr37SKeXPWk
Message-ID: <CA+w=M=R7vMK9-YZufh1ZW7efsVh=vCVkeh2_4rPSAsN=SH8MuQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf symbol: Reference counting, flat array
 storage, and LRU shrinking
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 12:52=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>    annotations. Saves 48 bytes per struct symbol (two rb_nodes) and provi=
des
>    cache-friendly binary search (bsearch) and callback-based iteration.

Hi Ian,

Thanks for posting this and for Cc'ing me. I built it on edd8a9fe2eca0,
the same base as the v3 series I sent last week, and compared it with
v3 in eager mode (today's behavior) and with --lazy-load-symbols.

All runs use perf script --no-inline --max-stack 127
-F comm,tid,time,ip,sym,dso, with one warm-up and three runs; the
median is shown below. Peak anon is the maximum RssAnon from
/proc/PID/status, sampled every 10 ms.

1) Production: 120 s cgroup profile of a storage service on an 80-CPU
   host (perf record -a -g -F 99 -G <cgroup>). 54k samples, 11 DSOs,
   5% of lines [unknown].

                  time     max RSS    peak anon
   v3 eager      4.5 s    386 MiB     314 MiB
   v3 lazy       3.7 s    151 MiB      80 MiB
   this series  95.9 s    309 MiB     275 MiB

2) A sample fixture from my v3 cover letter, a worst case with 73% of
   lines [unknown]:

                  time     max RSS
   v3 eager      3.2 s    334 MiB
   v3 lazy       1.9 s    106 MiB
   this series 205.3 s    449 MiB

Most of the time goes to reloading. On the fixture, a profile shows it
under map__find_symbol() -> dso__load() -> dso__load_sym(). After each
shrink, the first miss in a shrunk DSO re-parses its whole symtab, and
addresses that resolve to [unknown] miss every time.

The peak is still set by dso__load(), since the whole symtab is
materialized before a shrink can run. That is the main blocker for us
running perf script at scale: we can't bound how much memory it will
use, so we have to contain it with memory.max, and then the profiling
job fails with an OOM kill instead of degrading.

For continuous profiling, a degraded profile is still useful. We build
our view statistically, aggregating many profiles across hosts and
time, so some frames reported as [unknown] in the DSOs that hit the cap
only add a little noise, and the cap reports when it was hit. A lost
profile is worse: the OOM kill removes all its samples and wastes the CPU
and memory already spent. A bounded, reported degradation, like perf record
--max-size, is the trade-off I'd recommend.

The bound also matters before a profile starts. perf runs next to
production workloads, so we have to plan its memory up front: pick a
host with enough headroom and size the job's reservation, without
pushing those sensitive workloads into memory reclaim. Without a bound
we can't do that.

The output of your series matches current eager loading except for a few
frames, and there I think your series is right. For example, a sample insid=
e
nft_do_chain [nf_tables] is printed as dca_sysfs_exit [dca].
symbols__fixup_end() extends the last symbol of a module to
roundup(end + 4096, 4096), which overlaps the next module when it starts
 in the next page. The rb-tree lookup can then return the stretched symbol,
while your bsearch picks the right one. This comes from bacefe0c7b77b;
I can send a separate fix that clamps the end to the next symbol's start.

A few questions:

- Which workloads did you have in mind? I'd expect the shrinking to
  help most with perf top and long perf report sessions, which I
  haven't measured. I'm happy to run those on the same hosts if you
  have a setup you'd like me to use.

- Would you consider a finer-grained reload? The index in my patch 5/6
  keeps a 24-byte entry per symbol, so a miss after a shrink could
  materialize one symbol instead of re-parsing the symtab. The pieces
  could fit together: your container and refcounting, the index for
  reload, and a byte cap for the peak. If the maintainers prefer your
  container first, I'm happy to rebase my v4 onto struct symbols.

- The cover letter says patch 3 saves 48 bytes per symbol (two
  rb_nodes). At edd8a9fe2eca0, struct symbol has one rb_node, and the
  name index is already a struct symbol ** array on the DSO. Am I
  missing a second node?


Thanks,
Alireza
