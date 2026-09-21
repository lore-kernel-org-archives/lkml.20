Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D5486439
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988521; cv=none; b=f7NrGcz5on8jmWxVckn6HMbK7kovPlC/tlaw9G4lPUDCnJEPnWaTXDaiV7uZ8oD+IyasuXT6UBqrR1AAqpNmxktXjN83jfJSrmnKAuXXpI2qnQM3CHCmSgGzYTu8QhFaKM8PV+/+aK7w6oHg0HytSK98Maus6yHGZQQzB9+4Lis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988521; c=relaxed/simple;
	bh=U1zoqHEzQaVfkPpLFBsMt1Td7qlfJLQuz9lR4MKL6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oycm06p4C2h0U8T6KnrkEMu3fvaZYfqn3H6GGCDX9qYZ4zDdKfDhjQ1Psv14NilWg3CX3n3i6GlDnOybD4eHH0WWxHzRNuJW3itzbpggWDfKClLwqx5ldXmqHAq0Z/cs3lk6C5gfYRjQK/eB4dLT2XKhPOPmQjCrFI3H7ngKacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rai0Z5SP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rai0Z5SP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso19432335e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988515; x=1790593315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=Rai0Z5SPdwnE/WudB9SbaT5qV6f1C/lcWAmyHAezn6vns96xzGBZ2VQ5Q1rgD21I3n
         0DHmv2YZDgrsjlUbYUPTV7QASwzYkHvKB0X8OQ89/+DSnShAdYmzGR+NniEZa5zNyBi/
         NwJmeZT+5o/1DnF2oZCCSu73ivrowH6QpOLQYlflF6YbBd+c8Oqdoriu92j5xYLv0Hxo
         HRPgDcJpL/Zkh9AR11yeW77QcLodYKvR/2aA6Q2wMtoTkbzJ3pI17OU3pug3hFJW+uo4
         J1TG3fRkYGbDBWkWd/oR8kBeNrYBd4iAfjPr1cQQymKVB4sfbQYbV1uUml6KceieDV4i
         C37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988515; x=1790593315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=aJBWLNTIxjpcFzaJHtknV8tQhOBZuKSr/zSuJO7zLx7RlxyXj6QF63bJFVSTExwl+E
         9Za7VjRb881mzU+79GgwCIj+xRq8IEZ4YES2yoCCGS+EVCEy6fgS8bgNZNOUUHmgSIZ8
         32Kg2qNIw5Ebs60AHcjgebBm7lWTg/GyUCQDaWuse7ZrLHVC6q2jwkVmiudQLMsTDjVC
         065Yvp9Gj7odyu/BdKStch79/zSX+8mxW/Pf8lKghnIyjtYOhZk2G++cQ1xK+5l1v11N
         VRpI5W4N/6a6tUgMzFHBYgl9Pv/iboyYK3lTtu4hIb2LpvY8V2Qdds73ikaJLHkqCX2O
         9ukg==
X-Forwarded-Encrypted: i=1; AKwUvBztuFHlJkDsnpzhENz9cXrus4t8Me0Qq+RXuahwdaMwFHZWAzyANAeXH2dkMlTuTQTNeqhq1OY9WvLZZ7M=@vger.kernel.org
X-Gm-Message-State: AFuF++m9wKJ1v7GAiHA7lMVs59peTqhYzp1PPhAUrBvtEdHMmViPwuoM
	N/VILifBT06ELd5yJ/EKOXfQv8Ua279DgYK90E5wJxh7MJFGFzH53gjA
X-Gm-Gg: AYBFou130IIPv03hyz7bi9VirJ3rxW91DBpcNUMhJmc3rscF9l2I4Da6o90Txw2YiTT
	fyBafpypJt0gnN3QuqnjZ0mJgmnF4BFeWPGlfjL9rwZt+QI3hfbxMoORmb9cKUJIQnoj4hYcrdp
	ymiPt3xw5ZUFcJ0vYwAg18wl/7XvEiETb1yUDIld5ppf3Th6wAdlQ18Bi9Jn2X+7vK9q7BPVXCl
	9EGxWqF8j41Il8K8z3YwxWhKz1qQQUzC96UWy5WfxBT/lrMm4n1u/DUTa/LJL7cQ2nX24Q7G5X6
	9VtaAH+zAMLO0phNx5wGgB1BtN2taOftGl3auBLjzlPljhrfPBTPIYJo1cPzlrrjgUtYj/B6vaC
	kWPZ/L/t9Aud6enHDJjd7s7Ai89ZVLo1VOaeMph5yawoFVyr1eHBsz8wNaW/2ApdUUFjlxW7Ekd
	iSe6XS2F7xuYPnBLH9LfwtVVyZsXb+kVJTsr9R32bh4tcWqwv79NHVFpuaJYbhP2Ea+geRQHRby
	qqRlIOvboNaLQPsbR/g7q1kTHzLcs+cEMOUQzdzlB4htAmw6dmb3hpt37w6nfrloaiyuPwI3Y4u
	HImhmdk=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr150529555e9.29.1789988515344;
        Mon, 21 Sep 2026 04:01:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Drop unwired ADC interrupts for RZ/T2H and RZN2H SoCs
Date: Mon, 21 Sep 2026 12:01:41 +0100
Message-ID: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series drops unwired ADC interrupts for the RZ/T2H
and RZN2H SoCs.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts
  arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
  arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

 .../iio/adc/renesas,r9a09g077-adc.yaml         | 10 ++--------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     | 18 ++++++------------
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     | 18 ++++++------------
 3 files changed, 14 insertions(+), 32 deletions(-)

-- 
2.55.0

