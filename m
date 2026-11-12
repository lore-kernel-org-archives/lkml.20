Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510567;
	b=O4uuCVUQsAQOPOinQPQazHwxud4T/vJZzaJnAYEgZQPThnl8QVvnM3IXcUEu1+x1XVX4
	 Xou9q/MfDXw6ysxG7QlUM0YfXVLQL3oqfOL7qtmZMM7ZX/Z0+6g7WSkibgC9xDggPXK3D
	 aUZlcYvbWi4jwDMIKHmyYtTZYQX+n3avARE5+HnJAAnJFA3P9keSN38P2aZtrrpovh4TN
	 2/Z8QwP3iUyJmoHGqm7v1zzwf5i/NAOiuBfSV7xzOpuWTG13fD8AWMln8XuseLpuAGuQ3
	 EzcJPqCs15cQAIu4Dbv7WAZzg8Ok8UtWTCCW0EOgauClJCRf0TaD5cycW4ltul4SBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
	b=vfI09W2nospcVlqG/wlSvA87jkLKfMmZoOXxf1Zfv7+bcmCwYAvKz+x2ovQLSyl1s8RO
	 4D+2umr1s+VE2AJmRvW3aMmG+WIS2LFe4ZhmvdlwTV6iG06A7eI3Z9U9vLpZsMZpmrqy0
	 EozlBNsy4t9r35X4S1xUx7r+VPBVbykEdkmwsfddGjLj0rmwSo8ujElKkOa4Ytkb0MkxF
	 OjMunbrHk4f2f2pB7fyev+uv2b4YcqTGfHuMTmMTuuNcmYfcpkoTWLcd/+4ZWatYwlmdV
	 M9U8L/uBFvOexJjZ15zkxLpmq8oDGqIMfSFOWssKOOKH8yhnuAu5IjxsVB/NwHY/o/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A40606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A40606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37628596783so358479eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510566; x=1795115366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=PpIKNO9iCXFN0JuyGZ/RjZ00OHOtXTxwdAm4SLsStsWOLkqrrwwVw0caO0Ele+3UrT
         GxTZPKtkK51agJTDDENcxoOs0wyewqtU13D1SGzYQB14hbh+382ev0/qIpmG701aBiuJ
         4W8Z7iwA52jkHhetKcadgSjc6RFvrHLBovzVvAIMGDJOt77cAYhORPDFKD+tjbiS8OYk
         7d8uU3QRfp0pX9o+fiwGd2YvMiP9Busry76kmVmG/GIoXyQYHnPZyGQm/GdfBv/fL3X1
         HBrtnY+BdBEIN2CyYcKuCWAMWA8/Jm/pyolaf0VaUdNYJfdJqd1EVuybQ0mF/RGhzbCG
         DBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510566; x=1795115366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=faf0vYz9izTFNaXERRb83S7zibN1BQWouFxf6T19n9WOrtbTwucgLQ0NdViSng+4YQ
         hLSYKaLqfS4orpLcnyIX/zbQHFubAPoiserBy65fdgZKjO+RDpib2iV03BIMFpkuoAiG
         tZo9Hz5YOUxYLHZ1NlnJFz89k+J30L9C1ODsUtPzwY5c10IHROBdVicOEyNJrG+A7+7x
         cphNO/hbK4JLQi9lTh/VeGommnJ5n+YbveWep97RySFPWVjOb+Offle06TroosSoJTeD
         YL5wPKQ6dD0BE1wIgWynkLwqIHP+1mNEWQu73ZrTIociTTilWGDXj+IFzot+a5lYTfrK
         7sIg==
X-Forwarded-Encrypted: i=1; AL+hErGoRTWSiQmJWMBezOz+lm/a/YUSssq5icbFqyHNS4djTFceh7kmUY8ipPDCaSG3joP069MteM6JbTS9lAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sSxNguiZQMK1MVaMowLtw67zn7pepTTDuSqysY69wTVTBCMlj
	Z2+YxNgx4N+NtdoCvhwPNyzKTW2j7l0Bu/or0Sml/GjStLgTPX+m7BZu
X-Gm-Gg: AYBFou0kwq80vsUHZrVaOa7mD6CIJ0Pd0lss65UglAf42hQCS14us5672Pyc8bjgkRL
	Lix0loNw8TqGcVOcpYWpO9Xfx9hktcfaEvjlMQsxNc4nII2FBYeyISyNI/BuRe5S4FWIV6mfZ4y
	LbCiqtb4kiAJ6neFMf1MuaSIWXHwIlEUdRjknGOUfPhFiFYvozCqs7aaZyTUEmst5q25SYzhje4
	1top+eoiCWnEh5C6JtsJNjND1f7owzjMfed9mjdxD3tO7xsMHqfSf5DLL76OCEILkA4+ZBAfy0o
	oXx22O1LABAM8UVqo6wYkQur2v463v8oZLwHyEh90o1EzWg47eIm5N0UkdXEjdqRYhmyX8eZ6Uv
	7IkakweWcGthxGws7WDn3yRt16LLWjhFoDIe4AvM6GngpcJjF7iCywWj2xDjz8Mr4cRh3r/6PPw
	aRDhHqRVQjeQoI0oliYPwlY2h9rPaHuwkz9zvDK0r7vUGAB/AP36tYLJbnfegC7F/TC6ZOF/Ufe
	7MCkmXmZgTNb873alNwjViAQb6PH68PEjf1Ygb91d8bRUxwTeF1p8RqY+waPd3ziZPxZCxnZQC9
	zSEfKrb/
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr76378eec.31.1794510566008;
        Thu, 12 Nov 2026 11:09:26 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm395674eec.26.2026.11.12.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:09:25 -0800 (PST)
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
Subject: [PATCH 0/3] MIPS: SiByte: Add HW PMU support
Date: Thu, 12 Nov 2026 11:09:13 -0800
Message-ID: <20261112190916.3725141-1-f.fainelli@gmail.com>
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
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 106 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 373 +++++++++++++++++++++++-
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 647 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

