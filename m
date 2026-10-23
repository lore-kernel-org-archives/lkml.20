Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767360;
	b=s/b+2dG9+yZfa/K/buhVxAOjFzPI4Zn2ELTUrxw1ALX9Ne1rAa5x9mt/JY0abN+isVg+
	 F+A1SUsQbIdnckieayoSE6lqewJqgJzRrf2/kWlYT3Jm5YHkj5KKuHYEMeRWVdA6vO+ZO
	 c+w5T2KaCSX6Ws/kuWagS1IaYBH2kC5Zo/hARVAV8D7Q3lHqgaGOnEfAEZloIRiSZ09qC
	 kYkoSQlcWh9OAZI/kChJnBrn4ui72yvoY0Puhd/Jv8fx+pIwdZ5jWu85+7jd4rQEFFsYe
	 amtyDeuV2EWdjXXZF8WlJLfPziebSKl+CEUdBheJvbTiNJJ9fO8b0M7fdx/bwal1TxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
	b=qbtu56kW+Es/VDgO89bFHuSl8pgR65oPjPkBjOZjADIFsR+rRuS2McW1aDTFGwkxPZzv
	 t9kre+NSQ0ZEvI/xKwfyQ3Ke5tpgdbkE2jje5n4kNgTlPCY1gLA0WmXO+t3+fkilQHZxc
	 x9kTJVqUFLQ/oTpIc+6GREXZKb0A/z3MUskea9j7jA0qzU0VP9zqEpXBeA7j3uYzdoVr+
	 X/Lw3A7aFxtR9f3jQBX3EQ3fGxGuQyxoIwivTaCNuDr8eUT0jMKRz1Wh8ial/g8f/eYtc
	 DlUsd6oXsd6q6buup3Y4GFwit3g3UVMIDA+m9muQFClOAtrZszOK1ik70+TIz3pGJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso13052155e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767359; x=1793372159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=GOR+0AnCNVrcZjEffNum74HOdwjgnPDBXe1iRLRP037zO06nFiOqSSqD6DnLgLZtMI
         2bZKwe5rUezmAubDWZ0BLdgmW8OhsBjGp9wMLvyX2WYKQVhP5Th2Dn8WKNJcKcjpZ5qc
         9TlwU7RZxqhQ9grYFc+vCMesanO3amPd/4Hjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767359; x=1793372159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=ZiDHRIGyRJIazW76s1tmqWyu9N9CN0BRc8H+2vkaVA5KQyAC6bg4iE0RLOfe6wtxtQ
         KPy/2fks5X/m1k0xb3kNiC73YOL7QS8R17/ne4UKS3DUWyIOdtFnis/2/8nVNbW0cYWf
         KVHjzLdl5ZwAyoznr+huy0gewIWkys4t9UQrb4LOGbjfZFi6DJe3+qjo7DF7RPtwkCtF
         j+IXpC96c2NeQub9FQQ+P6ilUTBbYfA2al4QoNWQRfq1tjiBmQRkChmU/s6vleRkWFx5
         HkzOmrPpLO3UyHzcTbBDpQVjPsxkXTVRVNmPRPt0/fB/h4NMz4xWdfMqD8xVMaHFGB3a
         /WRg==
X-Gm-Message-State: AFq9FYLGyKXMZUPD8FzD6C5cmui975uOWdj/SY6S/j3/6cczyhDxfIEw
	S+Pe1w0U6aJkMabCGmw1gnnCVSkSSYgwtSpCtSRXx5AMfbPeN7vHZ+OBJLZ6KnsWb2Xfuq/qqZm
	BKHUI
X-Gm-Gg: AYBFou0is99lb+LkMBIXg9q/R6FxvbA+gYk9vBcHIz7Om00AxImSUQBzwNaXGYD86Ir
	WsDVdzhMMZrNsX2P5cj+wNoj9EuyMbgooYPt2BaLqW8M35zC/rqEZmvrMHKtaEM6UbusDhrPaTI
	N7fUgtjsm4aJBjE5Fz3W9LJfmK7AAwT7z24DbAzEWIFCEpmP09KblXQLJXu6F2IUS58j6m2El61
	nGIenaVO1vtk7zhXXGuAcDx+c/3INYGiofP98jCDZ5JrGJAn+CV9P31ihC6L6apeA652Z3YOO1b
	rMWEBOjPJy89UPchP3/lKHs4/QQylUPQBfG867J95FXW8/hkTtgTYwjkf26BvPovlqhfMRce7aJ
	Fgl+8O6EO/6Qm/vl3K0PJNDfUbQc5U/Z02UC8WPzLrvLKT1Ug2t1+2IY+UGV3wv20lH3ViCmk2e
	v1fVq+U3hpc3cNryT0tjiDt3Ql6zLXPyCNCL3GUqa9uYbnT6oqnnQljjlkVEokHhdvR2LsM3+Co
	jPyimXgiEtCSvyqmt6TigatatqZOH1d92DRTtfrbJ3qEve8LU4J4huUBTWjWDPDAFoMWChEUuby
	1A+auBL7B9DPJA+iHzuhoHgiIbrmY6A3dkh646d3qWv+7Yb/+a6GdP5slgOkikp3RbN3mdk5V+z
	VsVgDZaIT3eErnbvxPXywzXkwRRKsetvXPVvcyHgEqZDT8AX6B0hepw==
X-Received: by 2002:a7b:c303:0:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a204bc31e6mr73887275e9.6.1792767358753;
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Fri, 23 Oct 2026 16:55:29 +0200
Message-ID: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and drops
the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters. The
dpll_disp_ck SSC registers are programmed with the same values as with
the vendor specific properties.


Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 94 insertions(+), 29 deletions(-)

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

