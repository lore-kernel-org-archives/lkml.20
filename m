Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116E3921D6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249641; cv=none; b=IAxafLwqkTKlHME2bWAXQRvLobWswWWwLdV2U60mlDtUNfGfSfanvM92UsbLhYKzWwp5uwQNA+1eqsNGT8oZ/89USUFIQCSrmf1R/1uGDkKEo+iG4w1WKPAby/5SlYLoFvdI/0ebiXXI10wkAch8FA9xFoP/qJm8IUNgHR4VNHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249641; c=relaxed/simple;
	bh=je05pRYLNL6M+0dDhANe0dttl+6yUcRNtIotnmAvwQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W/E67cl8bcYflnj5NyUmk5yeIo/ngkS3AKcneFtcZ3heEihG9fxdhAIEMCLUhMQLN4Hcs6hlw6aOEyP+JtBYnfnXw4y0PGklOQA/8CbFyUfPVI2gJb5SaRUbyhsYUYO2zMIYbygZyVQCuoiuc5SDnmT+fX2SX3VsFhsvKYK7/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9aCg4hv; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9aCg4hv"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso1294461eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249639; x=1792854439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hfbMKsH1Fz4AX+3Rx2rk0jVnFtUXjI/UntlVsfn/H8Q=;
        b=i9aCg4hvbKazBjy5JMJn0yNl2NefARKxNN6GDEn+kalI9wmRHrTIVBlRurSmjaEVpe
         ciosaJQiTDv9YS9/iPZdAACw9CAoZQOlUSdkYnJSdQQ0BXJYDtewJrSIDmP/TPwoPEHv
         m0Jn441yn2xRIZYPpDPDjwdlp08PeMpdaj1woFK6qDIgfLAe4sr2I5pkrBDnL+PHpF1V
         UfDjvV09SB7v0xyE5S0zTE5W0gnv25AOVA4JH+O1KgOU1l4UCxajkkg4+zbhbl1f4h8k
         YNTHH9qQb426wcp6PskIALmX2yZnwcO03GPuIHhbajXl3onPN2ZwfGJpQH28TieQ/K2a
         Gt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249639; x=1792854439;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hfbMKsH1Fz4AX+3Rx2rk0jVnFtUXjI/UntlVsfn/H8Q=;
        b=KoD6StpEvDe/XPjTrBOj7H0ALogkebscwN1mDzWLUqstP30XUZmGpzdHb3gj3jjBfp
         RpeZmSKJCfeN3Ci1j5k9+XV9xpoq21XMvzvQbAqL34LxyAhAcC60qazlKZ4NCYPbovkb
         E8Xo/8CScx/x35kJyiRE5UYAMBEqwNWupgYwt/2bv1ZEx8SVbz4gtOCi2ir9IiUafP6h
         dnL0wqufx4YoXYQSQTgiAnXBTqNvT5uxD6F5EnDXSVjoG4WPISRfY7FRL/rNkJAWy02l
         znpvWzdKsk9NVn8TutanK6tQpGitDSKbp67noHZ3lXMYfeppq10/Gl/9eyWDJ3NnUWOq
         DYIA==
X-Forwarded-Encrypted: i=1; AKwUvBxyIUA7phAbD9zi02DXSGBMG7IztYGofg3jyc/IIDKyAoMadSTyYSAtLjTAI6Tm2lrJp2JoswNJ7tauRTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCwSrzT9nrKkT1aPMBzXJtQ4MdK2hIGgFYQfT/3sWJmX8VoRWl
	rfDCtRM1dXB+csT9bPmRijNI/m7NcJgWuO9mG5nLWq1s84gQ15rcgo83
X-Gm-Gg: AYBFou2SW0N1VphOS14cdCCP1S2klJFdeQwxCJvPjc2E7vDJG+n4XiBGgc9o8yHtjvv
	RnpJmF9tYLrrpZ0VudMz1qpPYY3GYzjTMGpZGIyk04Sl7+0K0hukeoyZQ6KBa9dsZVxXAf603NE
	XJICQsEJYpVylabkZVThDsN0xTIRzNcEJFKNCNhaLB0XpG78dYUmUarn+HJF2in/0M4NCWWMQWy
	WpDRDBBTbpo8eRzhCnFX6C1De0wvNeMcXqVBBtBVlLUCINxkx8lhtB7uQ9p1TiKGrBRzlts+JBj
	A5PV0z/Slb3lDOc7MkF8FxTqIZxx/XvXC41DOipWzr8SlUcUd9cOMyQwL2KymllNoTEC4pffTG3
	sfrk7Pi2Tzcs5sDRn/FmpQ6OWODdx+qZwAslZYfsP+27v77WeJKaGgBMFZ0CMQo4O+Z4a576s0c
	vx/IxWNPMNsrRKQIz/h/RO7Da9NeEvfCA0TOsXmt7w8sqCK4fsQaCUvBZzEwi0E4FFu8mu7AD/W
	+k1
X-Received: by 2002:a05:7022:e1f:b0:13d:974:a2c6 with SMTP id a92af1059eb24-1851160d0c2mr5666359c88.7.1792249639147;
        Sat, 17 Oct 2026 08:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13170977c88.8.2026.10.17.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:07:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] selftests/mm: run the XFS-backed THP tests when xfs
 is a module
Date: Sat, 17 Oct 2026 23:07:11 +0800
Message-Id: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+P02oC/53NQQ6DIBCF4asY1p1GjNHQVe/RuFAYdBIRwyCxM
 d691N6gy/8t3ncIxkDI4lEcImAiJr/kqG6F0FO/jAhkcouqrBpZygaGbQTG2UbkyOAchG2B5H6
 52zx5swY/IBgsG9WaWteoRP5bA1raL+vV5Z6Iow/vi07yu/6jJAkShuxY3SpUbf8cXU/zXXsnu
 vM8Pylm2eniAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh only creates the XFS that "khugepaged all:file" and the
pagecache folio split cases of split_huge_page_test need when xfs is
already registered, so with xfs built as a module and not loaded yet
those tests are all skipped.

Patch 1 adds load_module(), which records the modules the script loads
and unloads them again before it exits, and moves hwpoison_inject over
to it. Patch 2 loads xfs through it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Add load_module() and unload what the script loaded on exit (Zi Yan)
- Unload xfs again after the run (Zi Yan)
- Rebase onto mainline

v1: https://lore.kernel.org/r/20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com

---
Qiliang Yuan (2):
      selftests/mm: track the modules run_vmtests.sh loads
      selftests/mm: load xfs before checking for it in run_vmtests.sh

 tools/testing/selftests/mm/run_vmtests.sh | 33 ++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)
---
base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c4e9

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

