Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B3137A494
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788728356; cv=pass; b=ZufgKVg8CEtahSu2zCjPjGUGwpBuC1rCKLmbDrpUvLNHEAakJ68IJvTTQrZGXWw5Q9Z3ohYofsHMKqyt/DfvxnAHGihD1dZT5pc6xn8gM7gSPLVZF6QdMZJe9y2AFGfq28cpjYbFk+35chHgNrYnRFo5GSumb3JRo6Eai0xQ4cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788728356; c=relaxed/simple;
	bh=GmWNxMpRYaYka4G7Ng6tm18FCMqF9Ep8MTVv4Hnc9OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QC8LAYEk7PKW88fRl7csgM0N3q1/CjHxqSrrnH8ksc1VoV2MyUaVFjtm2/kFRkh7Qwmzc/w0S5au7FhCo6+9rk1cZKMYL/Q00xOHoDgHXweu9wzWGScy3rG/OCs6egfhqnW7nAdBZ+P4gypXMIVz3fjfnvPXjrltH5KGLg4RZTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1PZCMAo; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1PZCMAo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so24723035ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788728354; cv=none;
        d=google.com; s=arc-20260327;
        b=RYXzUVDsoEJw6xHuvDR6V7hzj1XJylO8IDP141N0oO5tDOdvwPnH/lcu3NXyNg36Ij
         xC/XcLTvDGirh/p3Qrf4NOeev714+1TT9ColJvDzhcfoUzG7sgYojuTQ64VIvMw46Zbg
         RL8MmBhFGMzT6csjSkAoM1JaJAjoC6ev0ejG5JQXnYok+xI22/MG9qpid2TLZdZqlOci
         1cdDJt0gBBFciPSclz7BnrnaSDvAC9aJDrzrvWbV33Igxw2QzN7FxYLBEln1v5slTA3u
         Zd48viwn5b7oUDT+I2FCbwZvZ5C6vyw9h1v6zcPgCkurIwDyd5e+tBEHK7npZKNJJEzX
         0SbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmWNxMpRYaYka4G7Ng6tm18FCMqF9Ep8MTVv4Hnc9OY=;
        fh=NmoUkiBNUa6d9FDMQqPUAH8lPUFzIQunPNjkQcaygHw=;
        b=Nhka5YHtqkdsivMan3T/T19zJ0WCJMXMfYaQAjRGBU5hEa1HASPcVc7fCplxzGtl3o
         y16KslAVP7AwRavrxBXeUEi7z8/rnKgoHVSXydiMuHCQsnehCgA7bSnr2CL7+7JICpUw
         D2caVl9xlBX+BjbhSrwaLC8UFTLvbeq02lQGv9ygIXXKmfh5k2ch54j95lwPpgZ2XTxO
         CARHUS8e+Vje5KjGk2LzOBSbHemGzd0lBZzpViz1osh0uRAck6bxdTJlmeSF+37RpTR9
         DMY97wmtmln4c/rrwUUSVcWpWPIx/cK7qTIdbpIfot05ScwAnW6fxkOu6frMX4d8TMxq
         V0lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788728354; x=1789333154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmWNxMpRYaYka4G7Ng6tm18FCMqF9Ep8MTVv4Hnc9OY=;
        b=N1PZCMAoq6Rb9QffgHeGjEtFdwwKouQKwPNj1i2h0i0wJn/Z4n1/nJe+grImNNpbOc
         2Snkh83IjCBfbiDYjmJgt3fBlfHyR5ImSV8OxctE1W8N22uVlDb5VFDIiRe+cNKj/zLe
         AwFXfA8a0j2zSXnaFQz+BySrQeLtR2FnRMUQrpnCWWeyhnstEFa9ayge9uxElZy/zP38
         Z5QbgbJ/jW0E0B+s2rpmd6fY8EWowGyNdre3qmAxnQBeqICi1t7YbtMfRDEBfgqYMYdf
         Bme1NINbbQf/iM7leVTZsJNtpL1024amABE2zRChXG5mIqk2kNUGAbj20Yj5qSwZmf7Q
         TXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788728354; x=1789333154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmWNxMpRYaYka4G7Ng6tm18FCMqF9Ep8MTVv4Hnc9OY=;
        b=CgVH3di81vlSdgSWWo9FVPXf1uoYjGoyPfmWMXOFD3Eb43tQsrkWzbTv5YnTCdMiti
         f6BGNleG09WweZGVRkTC2ynHdw9PHVG+3eWQ1P80d/WeWKiYlAls5xM1Zmo8pN4Tkyfb
         Y3g+KB0WKQXf2B3ONKIEAQuCYfxLg6HpLfncY9PNHsg0LBtvqUl2+SoqFR0HvSt3bh7O
         T4r57eDho78yjNo9skcCVRUyKnC24w6plmZ5SID1dHYwq1Vv++0mmzC2y8YkWr6I2UY3
         wX6rEkNWnvzOPu4goWTDdwS7ItNqsfGlMbxvmjSI4PDjJ/VMppG1SGkhHCc15XRUd9xJ
         1suw==
X-Forwarded-Encrypted: i=1; AKwUvBwcEcMXKsXD5dfZRPar0ZhFv69nBtwQHLv8KXvcg0GRVHFDq/S5MUXBHrCCO+ktEfiMcAGUdS5awxNZxKk=@vger.kernel.org
X-Gm-Message-State: AFuF++kZPrAVG8zDvAbHvXW+H8HLVAVyagoSX9cXJfNCuNrNTg1k8poZ
	0UirVWTpHX8di97hzCaIwLpNj/b3DAoTB7n4nWAE9u45C83Up3dgNjw2GHXDu5C/O0hUjb3M296
	DXQTkS2Yny/+a7L9gkGnwmcuPKJT60L4=
X-Gm-Gg: AYBFou3LKH+7jz/vkqto0VHFjm1khfllt6E2IW3J8Ig1rfxDrV8+Y2wHfrcwkWGl8C+
	j1W3j1DeARDOKO7Oo4aTd/cfAzZmrspkBpviQjaHWymaRvEK8FJ7nMlitGL2luOyPoAYcrImcXh
	Cgf5a59zTfwwU0RWyO6hU0i3KMJeoaBTPUaZGeUFbs4fhJE101Nic25lY1IWZoS4Zkz7cvWy7fq
	g2bYrbcAx0fdy2a3iWggzAgXc9WTJcDUPp0CwABlVWXpi8X4Eg7QLs3C6DP99eInfVr1iKc/eSR
	L2nomhBOc52Bt73UcIbQlx4fdjqxLDtg+MPiFWNzPxBtstJAd6CeelQP4XyV0g+K03lxvMbVR2H
	3v/H6NpdQexBJ8sgik7BHUkWsz77k
X-Received: by 2002:a05:6a20:729e:b0:3d0:d1f1:6ec5 with SMTP id
 adf61e73a8af0-3da39bb5957mr28017799637.4.1788728354236; Sun, 06 Sep 2026
 13:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com>
In-Reply-To: <20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 6 Sep 2026 13:59:02 -0700
X-Gm-Features: AcwNN1W60lfgmZ5yuSBplCeQGrhxaU8sIs3bdr3CFsw0EYVrdti6riCJvMr2erE
Message-ID: <CAADnVQLrga+tx0QCUkviGHqbk9Q6a7bmk3oAe51ZrLhQgRaw5Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf tools: port UI from GTK2 to GTK4
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> GTK2 is long dead upstream and increasingly hard to keep building on
> current distros. This series ports perf's GTK-based report browser to
> GTK4 and fixes it up so it's actually loadable at runtime after the
> port.
>
> Patch 1 does the mechanical port (build system, widget API changes),
> including the leftover-GTK2-call and signal-handling fixes that were a
> separate patch 3 in v4. Patch 2 fixes a runtime issue found after the
> port that prevented the browser from loading. Patch 3 fixes two stack
> buffer overflows in the hierarchy view that predate the port.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Changes in v7:

Matt, please stop the spam.
Wait for humans to reply before respinning.
7 revisions in one day is way too much.
