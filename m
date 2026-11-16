Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850728;
	b=RXjcUFHKRNA1XQMk2xYLraXkibidcvItF8+KZc4gGzcjx5D1m5adO2yy9iFZoix4fskH
	 S485N2TytQW6iJgG32NZbV83bv6dsfb8KQXu/Nupmj4ngwBZv9o2rM+ztWxaEeqY256pw
	 dqHef5xhpGN7r8C739wT8Cc8j+Q01CHPnwqNHLsrTqq0uJ0BQ47/+EAp1zZN00jrBsts+
	 ZFppWpu5OXFGaEAxCfCoRWjgWesnAbk+tejKmxNcQyGMBOQMiMYHlZeqG1qsVkMjF/JfU
	 o2B2IUHc3R0eXF+po2/24or/59Z0pEEgNshNuYU04PNp+CHWqIE1yBafTbTwVJ5boMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
	b=K/gk9DbRhbrsQl1KTMtAyAwPYGSNqEqWHVAlWS9EIzx2QH7rmeN5/6sUUl7JHXQNRV7D
	 FYmTiBezhCh5n2f3V9Jh02OAT25XkjVNfxKRDu4V9k9bH3U4N7qHuBtOAGCnjNRufitBR
	 1XbnWEB1UA8gEKoffg2ix4naXuSqRAGE64z7pQ8MBul5PETwwo2juWqC1N3SjaBQpkReP
	 cYdSQDsfbtmuNGrrbeYGHCQqiIvBIcTSJdomk7yRhyMK2AmWNaWa6QUbPPfRrENU/zceg
	 6SRQdWSHi2JAhgarlkmTBdUK+GjTWr1ZsV5OhKdiTMXpBML1NJcY/OsB/7vgk8lO0CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C26606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C26606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so10429647eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850727; x=1795455527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=dKpxFtJIyWFjlQRSKbKIOU1/Oas6D/kgChSi2PmhJsbm5FtEqvv9xhesQJVCf12raU
         sUMDR7DzniiYa7v+4fuLtHlyyZBTs+IIwyBU3sFLYGJYb10jER85jVVeaRQ8ftQB+IK3
         kA69IAlKM60thCxjGq1wIkuG6Wj0GvAtsQmT4LvXz3bHPfUf/g03sCmYarJID/W/PejY
         OHp5N06ca7kZ/adfmhspTE73A2p+/a6KZhg3dKjyt8/+ywmTa99RrY/d+Q2wQLXba4kT
         Ad76ynbx5wpiNG709WvXE1nfLHM4EcsY/tD0vm+jPrufY/zb2Zvay2NqACNzMC6dwzib
         yaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850727; x=1795455527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=tibKxYzha6WyUJGOS+UhSsNHj8LMuaMZbE+UDu+97dvWkXrY+Ydkh2HkN9zCLpWSbH
         fjY/spodYqBenYxeAgJvjlcrl4qxdAKwpGbOZ1RqyL+l453sq2YAcVeBeASEgHDPxafv
         nadvWXouS6x5WjfPkGpxtsmgaMv3GOpgFgnZ1M9YL0uo3Je/wx8kX8ESwPHQt1AjNO16
         qn4XbSskNA3B3GDi1UrjXdh5aaObP/fxP/Evk+pzopMdZxGKDtGZV48I0j7qXFfaGjnA
         ajw9f0tvpU9Gz7kc7X6+AQqWrxftCw58rJ262Qt8Kz7npuSVhPEYxd1Pkb5zwR/zZ6pL
         UwNg==
X-Forwarded-Encrypted: i=1; AL+hErHZBROeylRkzGXt7xYWGOWcA/guHi1PBZzF/7yoV24/Quz8+D92Hg5cMMibv1P6Oothqk0AWHc1N2xdX6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LezFHehJFs7w7UmXM+fPoc/1YM/3qhW+7azT1/RKkzk/Tomfc
	mrE9OciDJMW8FbN2thL+FRRYJW0T98RQLFVgK2paJcWrJqpUfuiGV+Dz
X-Gm-Gg: AZFdTZd2yFYpvdT03mqfcg8YYWYrelOPf9LqyWacTIf20UjQum/geZqcW3AWpV1QGTf
	MMjnBjPG4O+SqHp6Vm2p6IUnkNdwsQHhYU4PRiCS/tvdvTBf8px+XNWjsToei1Wtz7tfWeaVgDf
	+nS2I4c5PlXPQE3sVO3dxsnBV8AB7HTmjt9Vxg8jpnndMsvon1rVMRqNb6YVkxifTowQQBD314q
	hRWGjHhKFbM2Yr1Afal5cDEP4dEC1vMWp+Xu2Mn7haQvL05bNDiZwv8XBOFF6AXUUhPU1hAYkYM
	yOcqd1QHmdLVUrLnABfZZOAORaCZJyZb7bQy9H4AKqnlZSO9/sTusv2BR2iKwBSC2KGd9Bv32Xp
	K9PbfGnBBpfJFcCjzRvFHgL3onTLTvXrNVJp6/04x1njlU9G0yNaR+q90ZL4Xu9tYcriQD6G0CD
	z7kPUXEQaQ8VaIfuHzbOv91tzN7AvlZDrm5zSBLKG6c3jW+HM5WEAegWxxNCRzUnZ15mZ4zv95a
	ISuLR5mUhzSeyw/57GamuGavYu3XimlhL39yjoJhp2xiNbG9/yvkVusV8sKMFqfMuLtbH8uLj+0
	0baQku72ykwYwC+bVftveLiTu4VLJKY=
X-Received: by 2002:a05:7300:6aa0:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37967ad928bmr10061049eec.31.1794850727398;
        Mon, 16 Nov 2026 09:38:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm36635215eec.15.2026.11.16.09.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:38:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v3 0/3] MIPS: SiByte: Add HW PMU support
Date: Mon, 16 Nov 2026 09:38:35 -0800
Message-ID: <20261116173843.911523-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Changes in v3:

- Use boot_cpu_type() when identifying the SB1/SB1A PMU instead of
  current_cpu_type(), avoiding a preemptible-context processor ID lookup.

Changes in v2:

• Preserve usercopy fault state during callchain unwinding. Save and
  restore current->thread.cp0_baduaddr so faulting unwinder reads cannot
  corrupt an interrupted usercopy’s recovery

• Balance PMU event initialization cleanup. Release resources exactly
  once on initialization failure and install the destroy callback only on
  success. Also check event type before rejecting unsupported attributes,
  allowing unrelated events to fall back to another PMU

• Keep disabled PMU interrupts masked after EOI. Add an SB1 IRQ flow
  wrapper that reapplies the mask when interrupt work disables the last
  event; the generic CPU IRQ EOI would otherwise unmask IP7 again

• Fix a documentation heading underline in sb1-pmu.rst (Randy, sashiko)

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 110 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 397 ++++++++++++++++++++++--
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 666 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

