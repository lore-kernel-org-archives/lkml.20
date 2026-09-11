Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637E34A99C6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151049; cv=none; b=nCDdsKjVV/3jH0+FHfFHUoRq5Tk/U8W7fGDR7K9BvaLqaMfkj0Zepm9hAjWHZhNRnME/sbca/TcwB/siSaeIqohJ7q50qe4YWfoghDc4GClYIMfgPPU2ZWf6gSLCoqzWx9CisUSCy/jBh9FfE0cuE0/4KX1e6kuWh1fDVWtoyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151049; c=relaxed/simple;
	bh=8kmAmRbgZXkg7az0ezOJ0r3VMYsOk9mgv+cxB6FOMAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0rZeth0jPcq/GRlmTF054f3Q1U/3GyUSS1yQ5FuZqSNXflWZ2xzSvZahps5HIcBCoYm7QmcqWarVFoGH6o7Ft/hiB+IhJ+z2Ic2L7eqSR+FxeLw6UG2vPet/KAhrnpXwaqj7s+EEhGxFKakGHw9TqBFHURKXMxrKM9mhgXd7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=J10iwcYK; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="J10iwcYK"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67123200bf5so1772505d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789151046; x=1789755846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c666fMy2AZu7HzCl7Eo7UKyZfRurMTIeiXyEZlr0Sg=;
        b=J10iwcYK/nmiyK8zc2nF9rhM9YOzyYTVQD1nZVI9dvNDwnCjzHXWYqBR3JzkgbA9iq
         Zc0OPiwNfnsW6YPH/r4E2di7NepB8Vy3QZ900c/vCU5Wd3abuXz27Hughrk6hrHD+J02
         KjXmR+GhqHCtidm+PF64HYsc56J7LSQiAe4f5K4WmZ27jzaF1kRl3KiPEr0VDuVAXhYz
         E9ZiOOwFVb4Y0mn3IlW0p3LhkBs6C+AHmXbcBTM/eTkRV9ETd4SaHCiMzJrOB1Wlo/qo
         ULh4Sjh9uIWpGn3j8T7wFSSyn3Fftn9usKvtpvgXRsNbDvKwKlqbD72tYW4pg5VU5SWi
         l4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151046; x=1789755846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c666fMy2AZu7HzCl7Eo7UKyZfRurMTIeiXyEZlr0Sg=;
        b=Z3X7aK2lQhjgpT83JobEmtll8l7bArGR53hfEoQNPhXNFbXEloE33dAFT9nj3YG3rX
         Xv29XbdjAT2TkLrHk9XHUW2gjCUBQNl4t2Q770/e93Igz3g6/nhzhSCfDw+9m6p1hqYh
         a2bcuPeaUrMsgQ+DLaSIzl0e6M9PlQ9SCn25kiF10HxDnSb2s1GpTbjzm9wkB9rPuP3V
         gBhVP/zY6j5qx6wL98+NWlT6Eq8R/VrdC0D/nLRHRhA9k6cxvDu8oKWL1MgjojAHqkUW
         0lleET3BAuKTFSmyEPH6LD1LLXpFmsVQsqCBxFoYN1Fy4TusUckEbULZZWx7jq2KCBBH
         Yyjg==
X-Forwarded-Encrypted: i=1; AKwUvBwULhxa2miQ0qiqAE2NVIS/vXUP+nccXjnEddo0t7IOhDPIOaqe9T+Uobp8zIa+55VZPftzXSIk8Y/tCFI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltZO5/HUbAYjghculZzxrQfya6WkH35YYjMN3Uc5/NdFG9rdLD
	cWBDwpl2p4oYa8z+p5JaAVOQklbAv1j7Tl1NGvediKltCzczb5vOK+GZ+fkIz0uXqcA=
X-Gm-Gg: AYBFou3M0xighCqFR/AvxFZOmQOCDHxTb44hXUv4c52BjT8YXXkMYQ7FXQ5/JptqRAE
	voGnVeal1kVWprgl/jhwl9GG6w1ORnHMUAie7/rkHqu8euL55kU2ekRYrQsGZQZLVglzeqa0m36
	x7tU9FFTJLoRIWdc/iAtMwCQoKGnRmuFg0pKUbnF/gWakyKUBNoGZ+1313ImBtVDjV6kqdv8MAA
	3M1IBtTRGsk+7tSpk16ksGKOfiX3oy95zAPFH85o5kfZHEFfs4WaFRHhJf7YDEHROCuUPhiRSOs
	jrNH/oN6W0NXeRWwSZbnwtVs3MPmYguC0yENY904ZqQ4ylRy8W2khRhpuLcpZsqiPoyfpqd14Ub
	nvFPNPo5Uq1Iff4kewiBr15NoIH8nWDkuctXf+4PQ9OQNIRUXpYK8rdrgmGDUdEc0/+lRxAFF1Z
	PhJFvTeRgKk+ilYWChyVUYfYQ8AcflNwZ1wSfvhegb0M5CvzDBeerdiZcETDOBWQk2ju4WMbQUg
	WoeJcQZ0z0TGQfHfmZFw8Dy3p3lem+ix1j0bbpBA1AGfrJyHYh76xKh4CXQo8kL3QMrlH+zQNfU
	KvM1QTxUKjkv3F2/UYuGm241uT2V
X-Received: by 2002:a05:690e:d48:b0:66f:9743:7c28 with SMTP id 956f58d0204a3-671245e9f17mr1965637d50.45.1789151046253;
        Fri, 11 Sep 2026 11:24:06 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-671259a30b1sm1385517d50.0.2026.09.11.11.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:24:05 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v1 0/2] riscv: runtime enablement for native misaligned ucopy
Date: Fri, 11 Sep 2026 13:23:58 -0500
Message-ID: <20260911182402.1434257-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is the continued series for commit b94cec5761d2 ("riscv:
skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
makes the optimization available to distro kernels compiled without
NONPORTABLE config. Now, the kernel can skip the software aligning code
in ucopy after fast unaligned access is detected at runtime.

Andy Chiu (2):
  riscv: introduce assembly version of jump table
  riscv: optmize ucopy for has_fast_unaligned_accesses

 arch/riscv/include/asm/jump_label.h | 26 ++++++++++++
 arch/riscv/lib/uaccess.S            | 61 ++++++++++++++++-------------
 2 files changed, 60 insertions(+), 27 deletions(-)

-- 
2.43.0

