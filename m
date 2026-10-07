Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C14AA58A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370397; cv=none; b=j6C0sC3UHxDqe+AT8symsMfk81CWxvEG5M84Ep8e1g7Wmt79Mrv0AdBKYD+WR/AEx7+NOV7YSGghkg1amHE3AYIL1di0doa7i+3f6QkIxRsq5RxYqOQiZScH+Nhc3lFXGzVsZAmi056osEc4tSP8dF0Y/xSM4S43Qr7MsXVUs34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370397; c=relaxed/simple;
	bh=HjCSuVSMm1ll8Py2YDNsvLJB7VSvJEowexPLvkzGFfA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T7eXbWCr5F1yWeFs117craG92F3aJ3jy7lO47/UnUL1C4uPmY9UCwvngt3WmLKKZwW5aQYD6efDIGyPmbvynO/IbQ2Lqm7O1MZKig4pRLDGv5yWo6LRa0miQzBoz7UtNr0YyD3/oWprlo/4NgplT+/CfBMg4m9/iIdBYnRbDJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXLOAJF0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXLOAJF0"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c14a06c95so1369277f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791370364; x=1791975164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NZeoDWuLeHkfSjqfDQhymjIVrj1yL1sXaCr2GcXJWFY=;
        b=AXLOAJF0zba58KoMlWfjE/OEt1tB2v6wyZ5UZOs23FOtA/aExtBu81oexhpX+m1xAu
         lO3JqyvtGhgcaChcsdgAEYMZowhzArNV3JH4ibonjbFEv/4Qy6ZtjmWbhIGmlqrTJqca
         WQ/4zk8FZWBAVngVNHcUhlKKJlxENaGhEEGbYBj/2e82N2b60B6UmqdD6nftd6oAagY+
         YsTAiwLNHERjraD5mMRvNWLVTYTDVn0kwqTLYStPb5eOplpMzfbQVw/1zYXzfB3w/GfJ
         FS4QTF48Bp4zetdTpdACm7uXAA9RmP5Dwf5WuuELmOS54CbfX1URfgz7wvBjFytngGsV
         kA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370364; x=1791975164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZeoDWuLeHkfSjqfDQhymjIVrj1yL1sXaCr2GcXJWFY=;
        b=I6Gus2k2FKCT8yDv0GRX74HTiXknTfskOopJXhddtm6pTn5RaHbo+TYVpKPniUcTfO
         jIVpbjx55jH+/mOwCf3xObZpu8egJyG47mUnkXCcxa4CVooBikbK6fpteQ+EOJnScXk3
         8L8RyLQ/nwQBW3SLOiKK0AwK9cRmcuCWMm2MyqFh0xP0FrFbqWLdisEciCZKfaS3ccag
         tLwZmge/y77C2GMi9qJy36yXNGNI700pYNCgc62w9ng7ZkvDVTNceURzTlSF0EVPXvbI
         VyLXWYUERbxy/OUA0BbyonsLRE7h4/4PRHEmhfv/0OKV96WRErjMLTcxrPp2+oTqVygS
         wO4A==
X-Forwarded-Encrypted: i=1; AKwUvBx5+I9hr4rUDv24dJdm2oHhasjLNp0MSCB8zFMZV7s8xAr9v2J/qG6lIJgipJBxeDCEMbSMWRIKqnurLfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDBM8nAuXbDjzQTPPtIyr9Z2loPqI9ksVkuzVL0eOBLh/ZH7U7
	NxhgP0d5JEBzjFzX+3pqRpprLegEekJdhKkgtJw29O0dXsT6U5NOTbLpnXtSw1O1EJg=
X-Gm-Gg: AYBFou0quuP+Fh98e03/PvAIItwWXQbDd4JLU5l37+d//MBr7ExfHpQFgmlcUlXaU4D
	SkWtCCldF7ASK7KYaDh94WW4NFsb9ilrnP7rpWWdC388euNU7kAfbYBHSWa/DFwWpCWoVab1Wuy
	ZgPtMlv+L21CeMf9mLJma4h3DEVy9xLbf5mEWxAEh6FFTzLnnSJWOiDB+n3JVluL23lWJVdaSJY
	6OlxZnxt+scMB0LzPjvjKlmM1nVMoSM5XxGdRd8/78ETDaAjhXfbyAIg0oJ1SiuVEeS70hn4luC
	jWitifTz2fmiMW8N6nd+T5T8BTYJEgaEk1KYT7usA/ICnLMYReHMga94EU3gjti9+gH6bO8d2od
	M/PrQVMaZWl8WfE0OCvRenR8UkCnnd4/axpvrurkb0SdLgd5UImjZvFgwocm2sFZFH3hW/RBUdl
	IH9dYX53HWskytM5U6GTiplMtE69z42v4DabMK2OchXEoYhRHfSgffv33WOzx+Pxjp/xN5PnQgB
	w==
X-Received: by 2002:a5d:64e2:0:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48c72885618mr3221413f8f.31.1791370363566;
        Wed, 07 Oct 2026 03:52:43 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm5182781f8f.51.2026.10.07.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:52:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 0/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
Date: Wed, 07 Oct 2026 11:52:11 +0100
Message-Id: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwkxmoC/4XOwU7EIBDG8VfZcJZmSoFuPe17GA9TGArJtqxT0
 qibvrt0DxoPxuM/mfnlu4uVONEqnk93wbSlNeWlhn06CRdxmUgmX1soUBbObS/Z32YnPRVypd7
 Ka55S7S70qAcXRm1F/b0xhfT+cF9eawfOsyyRCX+0rgMYAKBrrLFGg2zl22fEfGHyEUvj8nxQM
 a0l88dj4aYP8L8xm66UUwp6bfpzsHi5pgU5N5kncazZzDfTAti/GCNBjsq4wethRGx/Mfu+fwG
 eCX09PQEAAA==
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

Changes in v6:
- Also skip on EROFS if sysfs was mounted as read-only
- Don't perf_evsel__delete() on NULL evsels
- Don't try to write or restore if the read failed
- Use existing "goto cleanup" pattern instead of continue
- Link to v5: https://patch.msgid.link/20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org

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

 tools/perf/tests/mmap-basic.c | 188 +++++++++++++++++++++++++-----------------
 1 file changed, 113 insertions(+), 75 deletions(-)
---
base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
change-id: 20260817-rdpmc-detection-logic-d3f7a49cfb46

Best regards,
--  
James Clark <james.clark@linaro.org>

