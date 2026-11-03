Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672351;
	b=kWiEtjxWC6rwfqAXWnV5D5MLwooZ85UTWnmaNK+nC1K8D5/69XplesXC+tAhXnp15ac0
	 49sGdI1njmKRUA2xP4wcSu/9VP38/Anw+MS8r/W07YbWXTsvkCKtgz6dibWQZsWnf60DI
	 2W9dq401K3RIhg2YtsMPigl7/TVw6hsWYfb2dswtsGwuwkneWyccvQjgV4rCktT80jdRZ
	 mHkbI6fdYdB+xB6hUAokrHEfbdkAswxSsye9JOnxcx3sCP3imHdTh+BgGphxTt5K1cPVk
	 ZnP54UBwd3bHsOWNDCm8HLcvni7wLDH2BEyfRkwJABg8Qvywfwzv5YlzDlcFUiV/uYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
	b=i+fcZpbHPeEBulKhGC2/IHeAadpgDr1vMHbaCfERQ21fCMS4rbNRhrSUuQ1xrcKCWFtY
	 tpbho0fcmqrk2JhIS2sKZm0X1UbRFaiPpZIxq2rEeFf+346bGEsj7Q1lpxb5oLyGHs8Qe
	 M9wcXn4SVujI+hNRTQq4Na3/olLL5AJldf69pUCrp+6P7AMyiiOLgNGXY3oRRacj7f74k
	 e8VP1cVAotayacrfXjVJ85TEXDjycoYSzLskXuezAYlJt9IQto6bMODk0+EM5nXzRf3GD
	 +CWKdgu1aIUGXhBHt2RGzfSwJGO37nntcbR/7Q3Yot4Xoil8Dp6qP9zSPfstu50OqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPG3aHZN;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C4606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPG3aHZN
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0dba37a7fso32768497b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672350; x=1794277150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
        b=YPG3aHZNwjTy7pqWgk/wgmpwgP8ccjFKXRuzkZWDSlc/gqhvKcBtIS9Atqu5CKZc8F
         Qxvs6lhqCkdN0GggJRuirt72jv0IiyAZ4U+y+zTqGyQDViGkq1Nf8k1jUpeNm6iTxWlZ
         hqYAMYVzt5kMk4XC7lhC9YBv2eURF/zTxz29+wj/9rDRikIYgw10piczw3R+QqNZV07K
         RZ6JLQUMZhwKRP6h/vx2jNaIm02X0YWj7CQ5CYmI9E81EL5bU9zwuUn7YcQN/VwBmJAc
         Y7zYKVyxX2Hw1I92lRSVsG0sdToJGEF8k8lnnqu6Y/d5SA6uW8VbLr3yX5PGVKdjMDif
         SvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672350; x=1794277150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VyzpExeelLAR9HxeoHhIVWRIik0hjXGnpC16hisKM74=;
        b=W5iEiJ6k0SUKndUCSLLclbX2F0/WtZstlsqNFPOSz+vI2exN3FyXwoMekYF+17uGR2
         6D/w2QYRctIPER4U8PFb3tYalPcvnLhmeRGPHLldYlN14YqXVoPz95WZIEgYtluyhV4B
         CPY95a0l5pbyeTubm/penVCr8aEOkSNf+2+PCir9Fle71pOXjz1TrlrODbXD+eMnwrBK
         HIlc6/x4e91OGMrvv4YcV5HX2sKEElh9UtwWEtg9sQJTB4a6oJSdZbJnzA2YCspx5SLm
         IcUQb1oFokbMseePJ5l8Q0XydTA85eTc2YtPc2VqLpwIQTV6FpcSDpQamA4nsMlpc7WI
         tiCg==
X-Forwarded-Encrypted: i=1; AKwUvBxc8jj106OyGvzYSpB/6o/7848NfxBuhEp3ccKYUunzhQ1DQOe93Uq0+OZTQ+eXUGDQb/0KBOELuSjphQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p0+v1zm0wkcpP/APHAt2+8GTDIChXV1WGyeFHRVvFAuc/zXye
	9Yzhh364FHwskMn6BTVncf5tNEjVcBtPeXn0Sd7yJmX+qKsym1oT8O0Q
X-Gm-Gg: AYBFou28nCE/mXPwTgJQjLFIjHzYcKKTfjTpksHAjjiA3fwEptsfCHFrIQsb8oHb3yD
	tgz2o7dlx386A7dlTkN8pCWTiSBLAN60ExzdWuxz7jm0TcLubOOugYO2I7EZ+7hcKPxDrK0vumX
	664MM4Fe6xYmRv6fbpXZWvRzea5xeIdpFmwWi99RM0KqTcamDCMM4r4eGHfbhMD6Oq14JE0NSpz
	e/VILT7TZcXw5B3IWHBrGlb2xv18UWhTQzOTm7bq+iFo124CF6XamqcQ2LuZo/7rxBokQ4qtUfr
	lqM/SVJNqxiMrvwzekdbKIF6osiSWu+2Hbd3bw+7lco72zFBwTdCyXkPIskQnS4dqKBMeuvvPNM
	On80FkYBLqZOZ1gvTNc+raT9TpXKaqekmrINWUMy1tyotX/nFdCz/CEtRUtNsz0QF9FiUpncsSc
	wyTc3S37h+meTozyOkCjam59mEkAmCC2B7xC+b4hCuNsWF64NTWLdw76PqYaTPBQOI20JZxwjtW
	SJULl12JbSvLlvCSDkPZc2Gp1tP+GPfYHyMjsiazbvVlCeVlG2VHZWpf/OIwdecCIwyoXVmkTmh
	3qvj2cqggp2mWfV/UVdEFq+dXGH7wYh/brA6D+BgdGlnilwEYGlnZi4F6hp+g+D1NXHSS39l1HL
	ayFYBXnWB6uwAGE133VmqPULMyIB0Zww=
X-Received: by 2002:a05:690c:397:b0:8b0:c673:993c with SMTP id 00721157ae682-8b2b66ce40fmr68322287b3.21.1793672349957;
        Mon, 02 Nov 2026 18:19:09 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71b70fdsm62693447b3.43.2026.11.02.18.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:19:09 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v3 0/2] perf alpha: Decode ProfileMe samples
Date: Mon, 02 Nov 2026 21:19:07 -0500
Message-Id: <20261102-perf-alpha-profileme-v3-0-4bf6e1dda733@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ6CMBAGX4X0bM12awh48j2Mh1K2soa/tEg0h
 He3xQsX43Gy384sIpBnCuKcLcLTzIGHPoI+ZMI2pr+T5DqyQMBcARZyJO+kacfGyNEPjlvqSBY
 Qb2VZkUYt4uvoyfFr015vXw7P6kF2Sq60aDhMg39v3Vml3Z/ErCRId8qtKnVRA6jLvTPcHu3Qi
 ZSYcSfR8EOCUVJaQgcVUI64l6zr+gG7DQA5DwEAAA==
X-Change-ID: 20261028-perf-alpha-profileme-8010299be323
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=WpIs83CyacYYndX7yUegp0rf7Gr25AUcEjh92rXYCVc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeusxhzuF7GlyqHTP1uenxwxFNBoH/jneVmC+TLHqXU
 xLJdORkx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFyjyM7wP0xyusox4S
 ebaqbUtT+UuzI54MJ258dc1/7su9qzcU/2VGNGhoPxG7M/WM5KX/7f6mlGu3bMi+Cu+LnpXY/Ob
 rmUdlD4FRsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com

This series is the perf tool side. Patch 1 decodes the raw data in perf
report -D and perf script -D, as is done for AMD IBS. It copies the new
uapi header from the kernel series into tools/arch, so it should wait
until that header is merged. Patch 2 adds a script that sums the status
by symbol or by instruction, in the style of DCPI.

To try it, with the kernel series applied:

  perf record -R -e instructions:p -- ./workload
  tools/perf/python/alpha-profileme.py --pc

I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
branch tests random data reports that branch mispredicted in 21% of its
samples, and 0% with sorted data.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- Patch 1: silence -Wpacked around the uapi header, which breaks the
  build where __u64 is 4-byte aligned, such as sh4.
- Patch 2: only read raw data from cpu PMU events, as a tracepoint's
  payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
- Patch 2: print a table for each thing PCTR1 can count, so that mixing
  events no longer averages unrelated values. Thanks to Magnus Lindholm.
- Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com

Changes in v2:
- Patch 1: copy the raw data out of the sample and convert it from
  little endian, so that it decodes on strict-alignment and big-endian
  hosts.
- Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
  from kernel v2.
- Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com

To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org

---
Matt Turner (2):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py

 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 172 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 150 +++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 7 files changed, 359 insertions(+)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

