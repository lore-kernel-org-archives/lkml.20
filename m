Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11C4A1399
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304482; cv=none; b=b1sDFua66+ps2diwkckDQW9yGSndxXmF+ofzasfVPT4V7BibAgGShk8zK6a1Cj9NjBkJ7UvD42JL9w/EjawW7XMh+oNPUKA7y5lI0Vs5U13JEnmANWipqqkcGeMk4AytMtUPKwPKtRGHQXsWkMeSrgqkUZBQeCvbMuDmANth0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304482; c=relaxed/simple;
	bh=J9diKMq50ntprMqAl2AB3oYHuq54kfniR6ah9ouSWYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NPBcCjaejPw/5iGKMJbvYttYuZJTjtCpeKzNWyEXzBs3w50OMvnegEvR4L2rTThPxMsWauysTCZFD9KN4Nh/gWjAEDcvycNmPdWuSE+VHWRA58OjKpRU7hI8HgWj6saxGiwj86fjcx+hM6ruo8lgwBu+4ijMeKNuZvZRnPHzGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJaj4Uaz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJaj4Uaz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so6953175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304478; x=1791909278; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S6NNYhIzBaDa0aocfk5znnJoVbSEEYZymIRyHYxXuYQ=;
        b=iJaj4UazbhQkseY9Jc2MlletW6+QkxNuP5n4aBMs0J/jJgObhM15Pa/LlSP+fYZhYK
         SdkWkViWfpn6GNi0nLziQU1Y2CCvNPpZ/xlL7m6vcWNFXabYh9oUShE1iQ1+8CWN138A
         HI48f4n8Cw002W5usHx7vv3bMXDNCBDoVhAy5PPsdrCY4hF8KelKo7HgScXarB3r4cU3
         726vnrOjRNHL7Tb4dpHH98v0mJe/BG/1bkBvc255fcj5p80Fhtl0mhGJlL/Z+PbzX/vt
         ctYN+b1Ytsb4LQcR+TVqSyBG2HsCTefHLlO+p4NT3nyPK2ykGL1fWq/ROceK7DSRI3o9
         JyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304478; x=1791909278;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6NNYhIzBaDa0aocfk5znnJoVbSEEYZymIRyHYxXuYQ=;
        b=LmOfDEGh2szGxNvEGTmq0qheypW9IVUB8l8zc047JXRKuqwuXywrznmnnLc6AXNvPz
         6fcmbC3Q21goFeXfy2mzZxgGqVYOJOvdtiqXpTyEsms7fr7ftOTXErhRcHw6wLV6b63j
         Qi5Q+T/sj633xtpQDh0Y0S4dCRdsEj3n9daAul0IHChj/ndYFYY0fdhxZ1uaaNXMY2S9
         s9x51n02ipkqVfIkT57vvhyVfRvRn1Ysy1of3Ul4qmHRQu6sq/ETnFMIqWs/mZ5DsYGi
         7QnbOIYL15bUWO0TyLsJdQyyDfrV1oFaLV/LLvKC8WGgx88n3NdmKzqN/xl3gFYVERQC
         A5/w==
X-Forwarded-Encrypted: i=1; AKwUvBz8RzlBykUhz6XnhHKi204EE/5MWfwTPs4jLqwRqA7UP0i7feSiWwGpF8+ecGqrEc37mQ4I+b0P0l7cWcA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+G0THHGoF+WMiBGaQShDudupp7funD6bPR7CmnHSq8NSlRqNl
	BhJCfwIOqXWCZF3fzywB/qjDQS7ZvDQFBjjrsP4pZJ/VAPklcNwUUrg+uc7UkeAY4RI=
X-Gm-Gg: AYBFou0dhfxyxF1dl9cykUoQX/qm2L3iScS3Z3kKUhjt5uLqM37LvyTegLoASGENsii
	zM9J+hUSb8mJAby1JQLvSN95WaKlv0D+htzvgn4LjchRdJW5xaVw7EQzpV2LR83tk2+W9oA3Afv
	/fE4c1r7rCkJiPJ8VHGCHwwVpfW944fQroxW1GS8QcPdRNNH021sY9bBCGSTrZC66+xXv/ECsim
	teY9nZtVRpvDtiFbb1Jskaa03p2d327sbi2HXu2+quq4PFz/CZI5ajnJXz5tLedw2cfk5dLWWpo
	wCG2XHRXF16TYSl9lLAn8kigOMjNcIbUd8oRsUkX1tvCpdvuG22UZLtDUYfEE8Ki4JC/THNdXHc
	876m8CJAqcbe0Pcj9SbIVFr84OGVCskNvBV0VOqRVSPRVq8vJZ0ZlA+NbtJ73ZI8UlWQJ/t1jOU
	UukziJt61cOWmazUFtueYx5EvsrNWMKCXaKC0fT7Q2w9GdC3+oGiPFSlUiOkEeofLqGTO47fyNR
	w==
X-Received: by 2002:a05:600c:3b98:b0:4a1:7d08:780e with SMTP id 5b1f17b1804b1-4a17d087812mr26088725e9.1.1791304477858;
        Tue, 06 Oct 2026 09:34:37 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 0/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
Date: Tue, 06 Oct 2026 17:34:11 +0100
Message-Id: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMjxWoC/4XOQQ6CMBCF4auQri0ZoRRwxT0Mi1qmtAlQHBqiE
 u5uYePS5Z/MfHkbW5AcLuyWbIxwdYvzU4zikjBt1dQjd11slkEmobqWnLp51LzDgDrEWz743sX
 OTalErc1DSBZ/Z0LjXqd7b2Mb8iMPllD9tDwHqAEgT2UhCwH8yp8fq3xD2FkVUu3Hg7JuCZ7e5
 8JVHOC/MauIlM4yKEVRVkaqZnCTIp966lm77/sXU2lw9fYAAAA=
X-Change-ID: 20260817-rdpmc-detection-logic-d3f7a49cfb46
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

I'm sending this to fix the comments that I left on the "V3 resend"
because I don't think Qiao sent a V4 and it's been quite a while.

There were also some unreported bugs that I found during testing.

Changes in v5:
- Keep rdpmc_supported variable name.
- Keep enum instead of int.
- Remove #ifdef __aarch64__ in the capability tests that made the
  cap_user_rdpmc test diverge. Now cap_user_rdpmc and pc->index are
  tested in the same way for all architectures that support user rdpmc.
- Disable running the 'enabled' version for unsupported arches which was
  equivalent to running the 'disabled' one twice and to be able to
  simplify the test.
- Link to v4: https://patch.msgid.link/20260817-rdpmc-detection-logic-v4-1-c22074578f6a@linaro.org

Changes in V4:
 - Don't remove pc->index check. Without it Perf can silently fall back
   to the read() syscall and the test is useless.
 - Test the 'expected disabled' case for Arm in an ifdef to workaround
   platform differences.
 - lseek() before writing to perf_user_access otherwise it's ignored.
 - Support restoring arbitrary values to perf_user_access because RISC-V
   uses '2' for legacy mode.
 - Rename rdpmc_supported to rdpmc_expected as this is what the test
   expects, not what the system does.
 - Label pc->index as rdpmc_event_active for clarity.
 - Add comments and simplify the commit message.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf tests: mmap-basic: Only test userspace reading on supported platforms
      perf tests: mmap-basic: fix user rdpmc detection logic

 tools/perf/tests/mmap-basic.c | 182 +++++++++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 75 deletions(-)
---
base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
change-id: 20260817-rdpmc-detection-logic-d3f7a49cfb46

Best regards,
--  
James Clark <james.clark@linaro.org>

