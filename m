Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702723;
	b=Yru7CHgY5KHSF0yOczkMMfopATCYqQJnZcoPJhITpc9QYLHaTL89b69GvYEgxDwBxz3W
	 LcXt2DqGaxizxloX9/MxZzxg5BSVcQY/qo1o4+nvOt+gRJ1oq/+aRojG4M81cN/Fwb/1X
	 JVuURYKcpwH3N/keRZhgM1CZGAW2JnLrioP9oLS8EbKUADg2q4zIKLmnEj1yVvI4PViX9
	 FVk1vR/Qc7asuLHi8W7wQxHZNNuCIwgDzo7fuQuzuU77dImj7qvRS5L5lGlK4JhgxMw76
	 IKYvFPU0XB5zYP2kCfXh1bvBzxbx4K7mPXr8e4mQ5L/bSeKlwW2r3HQfWHmSw1xLFqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
	b=QSojen9UKHPCEeP0ZdFNOfhnJhCknWzwFF8ixVYDAKw2I6WmIquFEcTX660310Db2Uv0
	 G1C+kHJHdRfJqtQoqrO5ViZXbDW4X2ZnrI8uiRLERLIryXxBtr5x5h8GRvjqEUQLrjvbY
	 COncf9wyId1ZPAkeJwH5MxR9ctTQm5leSt+SqjSuVeMfYltYT8XjYoeYr/WgdE64DZBH/
	 FqO35g0OKApRDbch0fQKbDerkcbbcG/YqH3DOrdPahRWvFyVYDHNa9OFivTJbr6JvyC+r
	 LmbPahV7PPg1FTf4RxbmaAWCmqZYgHzaQV4oveIMUJRJEex7Dhk6clf4HFUjeqRVNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAB606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BAB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50a4a2132cso283025066b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702722; x=1795307522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=DlcA9+xv6ovQ7U0XnP+svbUjFjhy51cSsHATRyAaPicXbRqayB+mIxzC5TpzMRQLk3
         LDt5Ce3qRNLH8PwS7YhfnLJTO3sZ5Jw0SIlH+98arhzVSvxqqfGBH5JYZFwoL62y15su
         wSgCV634hpJfX8qy5Sb+HU/i8rQ5zkT+wDnjFhLakA+1o2GAbK6M37u3xkX7TGJCtZ/p
         /7FfFneDcaHDSw8ccfL0X3aXh4yn7de6KDDMUFRs915zjJgwJLIwM0iiQKphMMH1y0I2
         UwFWMlH9SmtKMcd+Wmt5YwkcdjMUUlhOlT2Z/geKLUE4DmiJdkinMK5Zw5D6J0D4iRwD
         4kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702722; x=1795307522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=ssKtZU/9CDp12mlC0AkIT9mu22iBrAe6TVlyKCLXmC+Gim1i3AtRAJlQYnNPMotvHX
         17CjAKDGHwJlvITExm7BVT3POT2ICFK4ElcC8FUX2aq8YUGvZhugKufc6x8u2djaH4+n
         ZC/Wczljg09A2NsEwh9hRYI72mqdbdk2jEp+q2Oed8qGM4RlQGJijtH26PeU+9mIJVYF
         AWFHIU9R6Ut/hJQpv4byRf9tbbp53qN9UoivVZTGEi3/Nn7tCtFgxE8um2Wf6rj0jbm8
         HQZ0MD3mqwgOHyRQLXOjSxFHxlI5xBcB1xwUhCCM9VKB/3gCEn4nMTta8sys0r6iAMBW
         5OFg==
X-Forwarded-Encrypted: i=1; AL+hErFKp5uNxJsUCSw0SxO28BSCL7qLHEhcZWZFdXkJ6kEKwWA1I/0hFiT29a/bNmYg71vCPeDIaMgALC8HaZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kVZRY7OrMksOE9YtQIPY/Itf5BTnI2jJ5sy/5Ruf8ON/1QQDA
	rBNL3GWNltcGKr4Kl67wYhOs1iiSFk8+1dXwCQ9Km92NnUy87s9loTs=
X-Gm-Gg: AYBFou1JUMy/MCiKcFmSCi7yyUBSHpaCbYOhcHTt1Y6bfwf4v1bpa2PgSR0dYo/lpBH
	UbEr8+IJTlMq1PygNZrREecwlFSj35kKP+wvyFkxe/8tApQ/RMCm0FvL+m8f9Suxfh90v973mj9
	PlSsVaSuRREG/iu2P/3TsYe8doaWbu6yOdmS8qYgplbqrSAfhuo91pWAJlGUL0bEsEgvHvGIOwE
	JEFgy9Op/EHH44oTtm1N58Hhqvmrhwzklespfxhyr2zNlVepaqmzYcJipoKCNxDoR0mJpMVONYq
	FEpVn6pSd9biiRkEBDC5gZSbCd/ecFNV0zbi2ZrNXT2Y3tJTX+uNKG/p3TSCqPiIPCKltLFcyYD
	QdL28jYSp0M36zfY5xZYTmM/TgKfvoMZXnKuC1vBMWOFeUtyCIrvsDRSkGv6xOmi09mpvkI0y6s
	2+8GmxU1hOZZ0iMjvAfeNr2uZiBINLHZxfk5rSAP9ehZtJq3djkHdIP8Rvk5T6tJVgEVcMhOF7v
	dQOGaco85hWNGvlNzQePpXIoY69VdEnsBCg8BgjVih1KrqIiOdP+S5lbDDQT87QAgVYsbEmR8bp
	eYMXhF+nvbBpL2AplN7YHgVne7MV5kC4CjmqS2A7F4mfMbZ1P/OHrYcx+P6E602a4OrCxqlx5Ng
	7MuZ54hIKgusuYtWMJbEEBIrmQmJNnjfoOy0=
X-Received: by 2002:a17:907:a714:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c509637e20cmr507032166b.25.1794702721723;
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Sun, 15 Nov 2026 01:31:55 +0100
Message-ID: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
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

SM6125 has no CPU frequency scaling and no CPU idle states in mainline:
the CPUs stay at the bootloader clock and only ever enter WFI.

The blocks are the same as on SM6115. Register addresses and idle
latencies come from the downstream "trinket" device tree of a Xiaomi
Mi A3 (laurel-sprout), where the CPU low power levels match the SM6115
values exactly.

Tested on the Mi A3 on next-20261113: cpufreq 300 MHz - 1.80/2.02 GHz
with schedutil, WFI plus per-CPU power collapse in cpuidle with rising
usage counters.

This is meant to go together with Roman Linev's SM6125 TSENS series [1],
which adds #cooling-cells to the CPUs and per-CPU cooling maps that stay
inert until a cpufreq driver registers cooling devices. That is why
#cooling-cells is not added here. On my phone the same TSENS
description (derived independently) runs together with this series and
the cpufreq cooling devices bind.

Not done yet: cluster idle states (PSCI OSI parameters need checking) and
an energy model.

[1] https://lore.kernel.org/r/a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me/

Majid Hajiheidari (3):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
  arm64: dts: qcom: sm6125: Add cpufreq-hw node
  arm64: dts: qcom: sm6125: Add CPU idle states

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi          | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)


base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.1

