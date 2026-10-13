Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7C5632B1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933280; cv=none; b=CMvvrq+jIN5FT6fC+fDH92TQCxrePRslfnKPW29B+Jf5YwgR+DToGGmPlZb5SaXHpCujZdsib4dJjpx5+Vt9+NxNkPb3/l3M3ZaFReL9vGk2H3DOSgFxcvtKnol1dhlhfmpttiflVVHIl3TkqvwMCLPu9jVvjCYg/AAe3uCGZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933280; c=relaxed/simple;
	bh=JSQuZ98Ju/IfNojhyQYTa4BrDoYQ8cAHGh+SloRXnbE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UNfZ6x/5/j4AT8tJfblOnB+Gd/1a3QiTH55TwxxBIoOCw+UnD8WKetkhgkC055ApyvE9BGDhBgL/xfFMigHtoSfxeJgcz/F6Rd4zfKNaxGjbvHfCRtUCs0Y7Sx1MqWOjAnZXpWaqnz0+EMG+Dyyj2xmHyNKIjQn7RIq3KniR96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U/jFCXIQ; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U/jFCXIQ"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so387263eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791933278; x=1792538078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3IAOWErbcIe0YxA0vkWEWSKS8SahYz+GIVF3+MTk5E=;
        b=U/jFCXIQM/nUmCfXxAXS4YLbqaSzbNbuQKKRmdl3RKoBygy4BYpGr2Ep09jHtCo1Hl
         /EIe+BoqFkNtXOqauQdD7Wx6JHNxpumbta/iWE5ytGl2KB7DmD+LtZj13Xb0d4TJcM3O
         uffFPrtBXOijFwecIM+jKc5SXyKPYIXbIiOcIqQ/qMd3Ukpm+GB0hw410Pg4IMDJXqHs
         bBGkcYNAwvs6IYE8J7WFrpZ/o570OhgY0+EGQO+46Bo/SeCgC7ZMalpjYWkLO/ZXd6Da
         lI1lICykLJoqMXlftrMU6SQutDrhxNebRMjlAodZbxw5N3DLsZkYvzu+7c2npkhJQcyg
         1lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791933278; x=1792538078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3IAOWErbcIe0YxA0vkWEWSKS8SahYz+GIVF3+MTk5E=;
        b=RzslVuZpbHNHO7e28JLgULy2QqFGuYx9A4d7KqZRgAL9c+Uc7maQ0kNP+9AsFvt92R
         CPCl4CjT4qXFcxBtwwbdTytlYKD/ggAt6Wpa7h42aNvIr+WdRE/xzfwpZoSfML92fsAx
         1H7YqRbxCuZFnuk0F/uBVFP2DjK/og0DC0NmgU8HWkuoPPjwCejNdoxs5SQRQ75CsQK9
         aJm/9cfH6JWv9gkgKXDezhadaR3lg8lImlmMiAtgc+mrRm63x2H/ml5mLqCGgwB3cj2t
         7vNnFiMegAyvlEG4JGwptBT11zgtTvOm4P2cgskhdp++gz+P0EWufsVK27ZAiworId/m
         DVIg==
X-Forwarded-Encrypted: i=1; AKwUvBxSq8VQ0cWnbQNBUr9TzOhay4iEMUJ3FeUugVxvOD+uPGtCM/qEuoucI0xHLj8AFD4JU2Pv1iOtrplIaMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdhtvLVzRWVhsRiLKfQBUSHN8YpCtvBCi8xv/zC1y4RuzHSAgL
	cCErMICP3HTStos9U5XBm2RtWubJYwjPngMzC0nXNz6Wlg86i5+MGnBS4sqleLInv8CMtjvb0ra
	bMBXLAm6SYg==
X-Received: from dycal41.prod.google.com ([2002:a05:7301:1ca9:b0:340:ea8e:543d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:438e:b0:35d:46d2:d482
 with SMTP id 5a478bee46e88-35d46d2de71mr2071900eec.26.1791933277545; Tue, 13
 Oct 2026 16:14:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:14:28 -0700
In-Reply-To: <20261013221643.1815686-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013221643.1815686-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013231430.2163505-1-irogers@google.com>
Subject: [PATCH v2 0/2] perf build: Support building BPF skeletons with bpf-gcc
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, cupertino.miranda@oracle.com, 
	jose.marchesi@oracle.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, eddyz87@gmail.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently the perf build requires clang (>= 12.0.1) to compile BPF
skeleton programs (.bpf.c -> .bpf.o). bpf-gcc (>= 14.0.0) also supports
BPF CO-RE and BTF generation and is already supported in
tools/testing/selftests/bpf/Makefile.

This series updates the perf build to support both clang and bpf-gcc:
- Patch 1 updates Makefile.config, Makefile.perf, and bpf_skel.mak to
  prefer bpf-gcc when building perf with GCC (CC_NO_CLANG=1) and clang
  when building with Clang/LLVM (CC_NO_CLANG=0), while respecting
  explicit BPF_GCC=... or CLANG=... command-line overrides and falling
  back to whichever compiler is available.
- Patch 2 adds make_bpf_skel_clang and make_bpf_skel_bpf_gcc build-test
  targets to tools/perf/tests/make and verifies with
  'perf check -q feature bpf_skeletons' that BPF skeleton support is
  enabled (or disabled for make_no_bpf_skel) as expected.

v2: Pass only -dumpfullversion when querying BPF_GCC_VERSION, guard
    against an empty version string, and fix version-ge3 / version-lt3
    in tools/scripts/utilities.mak so empty or <3-component version
    strings do not shift awk fields and evaluate as false in version-lt3.

Ian Rogers (2):
  perf build: Support building BPF skeletons with bpf-gcc
  perf test make: Add BPF skeleton build tests for clang and bpf-gcc

 tools/perf/Makefile.config     | 83 +++++++++++++++++++++++++++-------
 tools/perf/Makefile.perf       |  8 +++-
 tools/perf/bpf_skel.mak        | 36 ++++++++++-----
 tools/perf/tests/make          | 29 ++++++++++++
 tools/scripts/Makefile.include |  1 +
 tools/scripts/utilities.mak    |  4 +-
 6 files changed, 130 insertions(+), 31 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

