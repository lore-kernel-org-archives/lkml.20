Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF96138DC79
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981853; cv=none; b=Ro3LnA4Briz/Ifb+5iU+lw6V6xxp6j/s1ZblVSqO56/7+NIkJOwKKk9Nf5k0izvdQto8yovU2rshFCxwYQRmt5bnrXroNknRX2CZ3XnPo3tmZ3rQ/6mePHNL2bmJTjBBIvqbB+g2UrWHNTAV5/FSWm1tx9GE3BE+aSQPNqTcRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981853; c=relaxed/simple;
	bh=PDEEd+kGUpRFDlfoMHUOW7eU3z/kpzEs0Dmls+E8O2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNFgN6P2+j8DvxVQ7L1eEos7IwydZU7Z5LaUua9UmdxFGDwMntkgHKlBakKbRV6cW3Yfau3lFhDVjugrcEnnvXSrTBubkJuketYRDLvCRoT6rpKtrOyJAaqAX7l9MGriaOJjALronetkALzVLw/Svl2kF6e4fK1bgB7IT+72axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCDRCWdy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCDRCWdy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so42085485e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981850; x=1789586650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=UCDRCWdyl2kDU1vPXwd9fUZujRuke7ezCgZZCZFMoBqZyvN40gi0CtTW7wQS8R4PBV
         +uPWe/8yR0+Y8dEXFjpAqaqVPEE3xE4SHNRsWuJCLX5s77lI/TYb1hrgZESOplkJLCE3
         gtcTfYzqUnzIzI+RMy5BEdQtKbfG0OCWc4CO7ovRTKnntiCJobAab6KR0Wc0n2DUSlw2
         p39rn4qTN0pXn1iG73AHvaSe2uUZtfWwYpN3OzxA5nJS8xqSwzb8MkQJ6vZXmrrabgSo
         bj0CjaXIeYh1iUt+ZDJgZ1YzJ3pBYfokDExY7h+MsjyFJ9kN7rb9sAyEtVDQjs/Qpf8Q
         QK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981850; x=1789586650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=pVod9NudRGF3hRh499Jlzzt0XxCrAlSfZ13gOIZXE39ugQZbLTkcca0Bcv+vcPz8t4
         V+baMb0Ir2J1P7EmqIYH4yMTxVUhiXiMc8il7t9Vpu6YI1x08/7Y7J/WPxc1LFo7lDuZ
         qBAWQ6EpVj/gArMYOvvqMAHjT1j/g5Myhl+lYbueBKs07zrFaA02383tX7TYjzPp/M1L
         dboAJk5Fbz7gJgiKxby5odvaY4m5BAzt/kYkxugVl+fHkOs4bKys84LAnRjkWS7N0zYc
         5HjWlC8vGD6gPAfmIn6Mxs/CSfH2fAjPokj+k3PLnhAwkrckGJbejVooS7maFE9ZoZzy
         Yixg==
X-Forwarded-Encrypted: i=1; AKwUvBx709tFlBHxDxVR0wg2oxIWO41xA4Am2KDuauYhDz3bzYxnrCTjq6pOY+64IO0U8TYJg9wcBsld9/aEcls=@vger.kernel.org
X-Gm-Message-State: AFuF++lQZzhkFSZ3Y2h3qCiTpFfG3U+WBm3mRcsfY6IkL0s+r3j9kFmc
	WGCNLWww3QenmEu7j3cR/riXTmSB1n7a8PobzEEMFVvsOAMrsN+5ogoA
X-Gm-Gg: AYBFou22E2m4QA0kPj0l447RKjwiJKczZEYMDIjXHY9bjvAUFJIt10x90QGQe6HRlUx
	tKRiNi4UboLgM7AdbJ2/+vyJ87+k+H4jl343X5xWR5AxMKcfIoDF03TgWL01HM2ZegQI+n3YQFe
	1uL15EEUH3QqpYfbPwF+rFnHq+tlU+HbJ5T4KOKEQapzy9Mo+V0ub1JY0P7bQuEvOBJMgNg5yP3
	d0EJJmo97kLs86p6s8cvt6phW9Sxk93HoteqUfbr9vzS5p5gfKdfUJg8QIIHmljlwtRfCNB/3PI
	wuIE6SdT4F7PYoj/vX4R4XGzSKh0q2XrR1DfQlqYluqwGVh9bfLu3jm+sOqXPjYxK7tEoKa2ybI
	4uB+hKyF2yFqFVJTxdk0auRAT06Z4ldoHdgRs73WwksLUJshcflW/gRbfKCclthBWG1IY+KI4Bv
	uUq0QOOfnXQ7UrDJdYLp5mp5vDfgNymgzLr0tuWxUAiBzxc/SQ2rfCNcFXmy6UN3h2H8VQMIU4S
	xN0JYK1SfgTIMPFQmmXBhTMY5Z8PcgX6pvC+PMuhVw=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr282755995e9.10.1788981849957;
        Wed, 09 Sep 2026 12:24:09 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:07 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:50 +0200
Message-ID: <20260909192351.33910-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909192351.33910-1-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0

