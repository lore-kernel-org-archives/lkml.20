Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341115;
	b=ZSaJGJNiH/54L2w0/cA8tqnkgJFGSprF+7p60kzw5Vm4fdF2pZR/nZNVOKkyvSIlMDTO
	 ruktE02xX9T3LNzzTGIg7RDjxkB2ZP4la49QTiCxbEK2eDBZUc6l7s53xc040TSBw6e1K
	 CH6TWPE88ATJkzeNfqd9vkbGqNrpHuYohaRv3G36oESBZ57R1WA45ziHwZV8ROWEpARGq
	 wPsjYRlR+Vqm27sUvnOUyzaYyatUpgL9pnXOOGmNDFVm04BBGwqm36jTc1XsxiCGvUuGa
	 PVSGbu+ujE6y5vBNvnYPHZwaRUgMZpFkM44pCG3WQdR7LMTFFlVQoCHi412FYkuJKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
	b=XFwVnJPZ5MiefkW08wx/eV69qs+N4NAVluWzwAuPSVZzpPVAXGZs/V6KhZ6P41pAy+Br
	 ZcalfaBWlnjiThltSxlwPmsDHREhqLsJzz89VgY1+aKAI+556MTYfaZlPVKLwDkyllI1r
	 KEqu3pg90RP5JTQpbv7O9mentcvlEJdqBYucrv5UmPb36Em2N8PzzbEkXOwHHfh0/xf4y
	 o8s6TISfunqMaA1/TPRk0+p96gdSgg12jMQHqI16aDM2e0hkpWmHTiUjPO+ihqavkZ+dK
	 ZZNm9VERScTBztxOQt7yZyt0ciPrJE03QTlByXR7QXd4jZEnZ3lLGzlnoOV79wtwUdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A117F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f079a63b8so245783085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794341113; x=1794945913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=O3JxG09sfOPQXyY2Jbj/5vnyw/wprNi1mWfkH9fhwBL/IZqfGFDFKlC4qZSo4GR0/z
         Cm3zKVgy8FdT62Wy9KJL4yhL7YqGUNBczznzR4ZlfNRldoXJqT2wYz1GOvfbfxoMBDI1
         7vMJBBR6I5aVQLNI/NwS9ddt223r4CKtLy55L2OBQB4YJbW/yernVloAbeKnqNkiEfJk
         IMHJn3h/JG8GN3UZHhj2n7h4BPN5HQFAoeQD+Bdl4o6AsF7disKeWGLTzfGBfOkp7WwE
         dkZJ/oJ6DY30ubArQ32v3HdwmBzP3wFK/hBot2l83IV/nc/jGSa+m72yajjYiVit/X3V
         D9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341113; x=1794945913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=OBhu/K/QyZdFdpDGLuX9G8fEww/1zGPRIFa+VyzoIDylDjx7WjytXrFNAez6mJEMM0
         50SWwbGSutXQ0BKXIppbgul+5BcBzBg6pJf2mMIsjMrZDdACV9ucjk4qoVNbcSBAMDSU
         gsPCBjpYP6CjTl8h7So6XvpmQFApk2Gs5rwJKmgJ+y7deyVsQIf5bKX1KLfOgFyqQrf4
         tjIi8XyKP1LixYi/AZs2Meo5oXqa1CSasJMDUYATvvqHvQ0v/us/INJJenpk/AP9G7bi
         Pqldw4dMfjzSB+l2wClipjy1xVdutP/KxLhzRxkoQSce9TnQWEjfDH4AfcXMpZYuBuvg
         6aLA==
X-Forwarded-Encrypted: i=1; AL+hErEl9Y5NPfsoNJhBR2haNn7XKsj2koySWo7PhnMB8i0aXWypaBxjALyYsIxXELN23yXyywK64ObWcIhjaGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UjAtNrOhpyZvhqpcjMTcn2nZq38rg/2jKFwkrB6FTsUOu5KZs
	PR+ycIMLOpNxY9xWmK7iVdoZIMwk19Ug/driiRnru84WsakbM0JYF+gTEDoEDvgLgIkjNg==
X-Gm-Gg: AYBFou1SAK8ZirRyzG1YRRNiHjlARJoro0E/IqwUiZfRXrkb404AjhA05b6FlIvtIhF
	DAj1NHHKAi2wzVIdY67X1I7IHC1jaLZ7CTDmWOU5j5zB7AJ5DCCYQBfChRk9RWNGmZkjAoHWIes
	Sm9gPjFKGk+8fUVdsRaKdVduUFZ/l39FGTJ+MnspcITjEheAkOksR4BpAiOgA364GggzFt8dC9F
	mx2RTO+f53DtelNcqXzKA36isLcl4n+nNRexzIMeJ0LjXrQYBp6atxhVRzHyjwDAGRnlz6mQZ8M
	6ye8NRow88sXllyMT5jdWZU5k9whN2kZeJ+3lFdstk9XImfyB7c6Kp8DjKWw4FjkSgYetl7ROuy
	oRd7x9meuOmee20Jf0ZXNCNeg3dGRxchtbBA8pfHp/liyFuGmTx0SZTyORSarJjbwW6OX2AYFOY
	j2+AmtLT6j/fz4SWEVT7v0h6H5HOjjMkwCgiaRv2TPA4bjxGMpVbtifvpksS4GchK/fCezAHd+w
	4hO5U6OQeVWrNI/iPVIGCIy56AmStL6YMNsI9OdcI86V8KkBBrxY0yLOhPprOeFJ1SFdbxZcKIn
	U0+fKfKGvm62Iozq1m95IknbW656ftaYxgo0bT38QcknQ7xqDIUrKORcIMrXj0Plc3oXL87QpSF
	Eq6hThTUw3IOaglPZnaKBQE4btDjfa1B3THH+Z4skh0YmRl4Y5utfbC6J9h6Sfuf+muanHemve/
	QqxmfdU+rxO2pMfPoXdTsdpLcNi9Wr2GAjY9M5k/zFt0YhY7B4FTvzBqSrM98+2GBHm8eM1br9m
	upBhTTtO2FoO3nEOL1BkB+sFDC4xSR3t8OTT5bgbLjU5Q==
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr4760385a.82.1794341113438;
        Tue, 10 Nov 2026 12:05:13 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm305084285a.16.2026.11.10.12.05.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:05:12 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
Date: Tue, 10 Nov 2026 15:05:11 -0500
Message-ID: <20261110200511.71673-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
References: <20260808172211.137577-1-jesse.casco@gmail.com> <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com> <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
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

Hi Konrad, Sibi,

I tracked down the timing issue on the ASUS Zenbook A16 (7.4-rc1 based,
arm,no-completion-irq removed). It depends on whether PSCI cpuidle is
already running when SCMI sends its first PERF (0x13) message:

- CPUCP_MBOX=y: first PERF message at 0.37 s, before cpuidle starts.
  PERF works for the whole boot, cpuidle included.
- CPUCP_MBOX=m (arm64 defconfig): first PERF message at 1.1-1.4 s,
  after cpuidle starts. No PERF reply ever gets a doorbell, so
  scmi-cpufreq and scmi-perf-domain fail with -110. BASE replies still
  ring.
- CPUCP_MBOX=m with cpuidle.off=1: PERF works.

In the failing case the firmware still writes the PERF replies (the
same request through SCMI RAW message_poll returns status 0), but
RX_MBOX_STAT never gets a bit, with EN=0x3 and MAP=~0, the same as in
the working case. So it looks like the CPUCP decides at the first PERF
exchange whether to ring for PERF, rather than a mailbox driver bug.

Please consider the DT patch withdrawn. Sibi, is this a known CPUCP
firmware behavior? In the meantime I could send an arm64 defconfig
change building QCOM_CPUCP_MBOX in, so defconfig kernels get cpufreq on
this machine, if that's acceptable.

Jesse
