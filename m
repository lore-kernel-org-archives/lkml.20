Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703162;
	b=Yt0ldQsvDCYL4pX7AfEcX9s6lrGKOEjLfCMczL4b1wFEHHWLKBwBqoNprhfIfuuAPX+n
	 QgvG98G6jXVKlLZeqKjOX9GMg8y6Ek3NSotlj4yWJ1D+rNE2jQ6gbNVdpqsG3WM6s5mvp
	 d6P4S4cG2P6Ohi8zFWt9pNcNC10ubkpTwFphUH258vtOsYz9eaJG9tNCqvy7+DtVPk8+e
	 8fvF2eQPVXz24yxc4JwqBCcG6XSOQoUo0axivnuWdW2T8+79UweEtIi3I3cMEWhUlrFBi
	 xb2zh1/LCqQj+QFuc4WZsnRUWRKzmTwYdDMEYfmA0Ohm3YBYSykKOS0KrJIDUa6OB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4GrWQhdlUN8PHyNIAm8fqZHJSbDfpomlm+th0sM4Aj4=;
	b=Atsh33Fp3KJoAjMKSA9UZYAAfRYoY+tpHLhBBnBiCiWffZhvaZlU6+ObvW/xcPjtnV2C
	 3NJAw5Ig0PoCExpt1vU7GSI9P7oS8MsPXCjE0aVOYgCHJ0VJmPWtKQsCeMkhTIcRdUIA9
	 ursuZa225x2vSjqEH0LnoG7s/KoITrWdmXcPp444dvmKvzAEIUS7yq2NAxPSMtrfxQeUH
	 mRHUS/pROGpbTrOXYwoEg66KwV7SDqOol8hUm/9aUskim4pk6HvENkWOXwXmxDi2Ij4Ug
	 ndz3q6tHS+V+bKD7G1gANuhzcRuFYGLIy0M0IZrYNxb5IkQdW63ITESDPuVDoTkaRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpMsZLld;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D8606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpMsZLld
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso1372251d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703161; x=1795307961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GrWQhdlUN8PHyNIAm8fqZHJSbDfpomlm+th0sM4Aj4=;
        b=zpMsZLld4xitce8pr3dzn0VlBsHrJENUQTpe4b1oBHHu+eNxusDc8Ew0El03W9fZWW
         aAVGy0BnBHgdk/NEGTfqb01gm7XdPdHtZmBWWvdaJTBDPp0UwV6wrfuUo48DMX3ogGWG
         juiZJhjMR5nxJ/8Ws2RD4u2qoCO5R7azV2kBbxqJlmDdKC3rgn/ICBIqWxvlEpIN2QvO
         vFJF0LfKb4g9on1As8gHew0w/PrAV/sge76xEcPXyC52CQKi89i65MyOrvOHy8fsa1my
         t7DN5nodoVTxapOkY0R50vQo7Rtm0NyaDwJSC94UcyCVbGllIv954XUzywIcDV4Wv4XS
         Xe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703161; x=1795307961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GrWQhdlUN8PHyNIAm8fqZHJSbDfpomlm+th0sM4Aj4=;
        b=IFYriQ32Qqk5QKqoebiy+/ji7KlSMFD2PeouGfOyQ/GF+BMEfQdvjZFR17Q6bVPKw6
         sgWM6UAdIrTAzTnwF+bDmwOtdmBBPWtGKABA6/ySf98y/y19oFpHshJZkQdbLiwWlbuQ
         A/zwZQGoQ9vB81yZYZ3uq99SPuOg1r4gU8Kljv9glJuBUfBjSGhQd2KmuQiPqj+x5W6I
         Bjsj/Kkxae7bLjaTI46IVblSObFNDbxb9UdlfceFJIv26CxFvUMySduBDVPIhv09RbBA
         oFkCd85G6zrbqrRWtFDluY2W7Y61zaZeuo0r99W3mtASV27TGXcwch3yEPAhd6Ix/bDz
         OCeQ==
X-Forwarded-Encrypted: i=1; AL+hErHTEdXIDNcEzlIORSZdlPt3ObzcWUQH1r35meo2joxEhvIZHT+ZjGvOxSWis4zyqHo0ZX4XtvObRSPxDGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c+Yvx7bXZebnvDQwiMUuwJjsox1SbZ7AJw+qWgibZGC+khGYw
	c3haafzzEVFdHbpbmwP/ixhVs9ppZG2ISlMbGv9lNWkQQbHnOoi+U5H4
X-Gm-Gg: AYBFou2Jv6ujTPwGSojyrLnwpXZorKOaIF8VtW6tiYrxvIeLp8SgHme8ojfnYphbGN3
	p5jLj2ihY+0dhYjc6psz0YE1SFO7nadAgPIQRkyQE8+GazCZHZ1RpV0WBOCw+1kYRadWam3TEem
	jA8gkFvQ7n37CcQgmmtJeSmSL6weLxBkpR9ZWwOX0tk9/rm1lZqOQZc4ksc+9QBFdAeEqYplCuV
	ELJLCg97zETVq40wd4+Te8dOY9Ben4RRaB11r+o0HDK2OpZbzqugtUNrfM9nDTgfYhb1UbCSmVX
	gW4P1lhqJQEcFCi8RClNEaeYN+HQk5J/Kzu04b+AQMlcLWFbAyhti2aV1faWYIXGxR5WRnzM0Hw
	os6Q9DtQnDRF9bLRTkk3938T8/i1VM/ON+MmwFsVKnHbuFUTZ4NmwstZH0ZGu4Kjrc6RshiEy+Z
	97T3jYzkJLHaeDB9SA0eZbtaxbQ9uSr6Vn6BuTg7ekdSX4E1rt2mkNrS542d1xI/vVZU+Bg6uDj
	3S2ni8AqJbmtvS9SrtclR8JYSFFMC3JR70echtpes+8Zpe3HD7Q0rVkpf/N7QL6RCt4JmCNJMd1
	JeTyiMLi8rm/U4vd9BfhVXgOCfjlu5Sfca5OpJ5IfB0GTNZAjjcYryB9
X-Received: by 2002:a05:690e:807:20b0:679:b98d:9b7f with SMTP id 956f58d0204a3-67d893e4231mr2208264d50.11.1794703161195;
        Sat, 14 Nov 2026 16:39:21 -0800 (PST)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm189602d50.19.2026.11.14.16.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:39:20 -0800 (PST)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: adrian.hunter@intel.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH 0/4] perf python: Add a script to open profiles in the Perfetto UI
Date: Sun, 15 Nov 2026 00:39:12 +0000
Message-ID: <20261115003916.1873857-1-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a perf script that converts the samples in a perf.data
file to a Perfetto trace and opens it in the Perfetto UI
(https://ui.perfetto.dev):

  $ perf record -g -- ./workload
  $ perf script perfetto

Unlike a flame graph, the trace keeps the time of every sample, so you
can see what each thread was running over time, get a flame graph for
any time range, thread or process, and query the samples with SQL.

The samples are written as Perfetto StackSample packets [1]. The few
protobuf messages needed are encoded by hand, so the script only needs
the Python standard library.

 - Patches 1 and 2 add what the script needs from the perf module:
   whether a frame is in the kernel, and the clock from perf record -k.
 - Patch 3 adds the script and a shell test.
 - Patch 4 compresses the trace (zstd, or gzip on Python < 3.14), which
   makes it 3-4x smaller.

I compared the output with perf report and perf script --no-inline
(the perf module doesn't expand inlined frames) on x86 and arm64. The
samples, their periods and their callchains match for:
 - cpu-clock, cycles and {cycles,instructions} groups
 - recordings with and without callchains
 - perf record -k CLOCK_MONOTONIC and CLOCK_BOOTTIME
 - pipe mode (perf record -o - | perf script perfetto -i -)
 - system-wide recording on arm64

DWARF callchains need a separate fix to the perf module, "perf python:
Accept events larger than union perf_event" [2]. Without it, the script
exits with an error on --call-graph dwarf recordings.

[1] https://github.com/google/perfetto/blob/main/protos/perfetto/trace/profiling/stack_sample.proto
[2] https://lore.kernel.org/linux-perf-users/20261018074528.974953-1-lalitmaganti@gmail.com/

Lalit Maganti (4):
  perf python: Add kernel attribute to callchain_node
  perf python: Add clockid attribute to session
  perf python: Add perfetto script to open profiles in the Perfetto UI
  perf python: Compress the traces of the perfetto script

 tools/perf/python/perf.pyi                |   2 +
 tools/perf/python/perfetto.py             | 675 ++++++++++++++++++++++
 tools/perf/tests/shell/script_perfetto.sh |  98 ++++
 tools/perf/util/python.c                  |  17 +
 4 files changed, 792 insertions(+)
 create mode 100755 tools/perf/python/perfetto.py
 create mode 100755 tools/perf/tests/shell/script_perfetto.sh


base-commit: a1c3b14c28ebfa79dd56e2743c2fbad0c02a7146
-- 
2.56.0

