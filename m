Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A932FFF89
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388199; cv=none; b=C6aTYddmmCwaF6IyIa6+CMKEck8WOOAB4VsEvuQrHzYB7D2vFhCWlVKf+RoJlWOd4wMWpoN1wEYXKiDywHD3Zke73HbPBZ1DH9orgZuKmrdjnynV3f+p4aqd1mnN0SV/MFEhhKsqMGWleC84lu/RK6UlpXYZBovGpILKXrC1fZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388199; c=relaxed/simple;
	bh=RP+5Ec9UeM9r+i1P+pNVYwSRiXYhsbr/Ikg0S83LBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXTAtugjOfCVMv8xgPub0ESkv8dvNHzwHQdAsOxu4m2yE9Im9CSoshfnCAbBj7vECj4GVREnTpsHiIXeGWxapDWiPa/x8moP3dMUnE8PXW0UhrSVNE+tgGx2FIySgE3EGQ8liISKxilSm4uLF7mqVuDkWHS6cY2E1keXzWjro9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q32lRUpR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q32lRUpR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8121458be2dso2003006a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790388197; x=1790992997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=Q32lRUpRc+Qeu+5VqeTl527qrkLgMttX9zZnDVUgOQOHCCYv6Z/EWlh/BfakCj3QHW
         I0KQVJlRI/n4kyv+APGaV+jUfZWtwiSRz/RAbzojYsZhvG8VVS0DQNwG8UtebbYNTQBP
         b4D/WdvFWHl+nnnyN95sfJVrdk3cciloa9Fg6WVMb7GhM575RoK/GE5M/5sFtVogZzSm
         c7fyLECFdiH2tliwJMlnnEotgvso+MZY0hVz0Xa2K96MtZYc09nYc1GCn7PFkPRA2Nrh
         rLwZu/iJasLpvgRst0u4P7ojQL2e1CnLN/pBubAeCJde46QIpH/MTp3hBtU9uHlfCDl1
         MYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790388197; x=1790992997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=1UsGoSfyDO8WyV/pTj1fMImoTUMMZQWHtSbnLWzDHH1ZwXU7TF3AYfr2Qma6MAdeja
         0sl4NxWTqL+mifJv0nLuekLwxFmuCm5xpWD3B1Bzw9uVDbTFnEt2PybrxwsDlB/sMjxX
         mMMG3IDLq5mnFL1q+/jdttUhVUvWxkrmvEhMbySwkKtQPHbMcKZPijmCx9OQMGYkrXp8
         znX53raTWeeV6DwC4Ld4jzRDnUgK491xc9LjLaTiakieBoG5jV+VK6ewYL1OJ2gDneb4
         azxtSDj04KIlonMijEYH/tCx5vtswQ9KhNtgoCFNBbW2UounyH1CHkCfDNpAdlO4usLc
         T8kg==
X-Forwarded-Encrypted: i=1; AKwUvBxbJPTWE2ec7LVHhGODo1iMoK+cJPpPR9L2CBD+ZgJ1CstpJ891mX/5B8mQVyt2/V9lf28B2j46JC9apgU=@vger.kernel.org
X-Gm-Message-State: AFuF++mIswyFepMr68J4A6X6RWWzxfh0EQptJugzvPWaq2tnvk78ycEe
	24bkEbGnwfi6BrVf36QFNcxW8IgjhxEUQHc8Saqv0PcPl1g0vU8iTzGE
X-Gm-Gg: AYBFou3LcefU2MZuRYaPSCbsAKt6EUPqw9y65WexAOCLR7wVxmZIlk4jmnpx0FwlGKB
	6KNHJfENVIJB03uX1tWw6gsZWuxZ3uLmX7Dq7bJq62bhbo7efPabyC7zgm0LhFPA9foRF2Mxp8a
	U1y9FSoajjcpGGDG8wUOe1BOF/fpqiEArj8VNBihXbvzATlOQxQ7AY9cFW2apLndtv05KabRAoH
	GcaXn+deXhfV96U7xetZIbCCKHpKi/8V17MGKsrz1YdOZLt6uWBXkBob8jYL5yKyzSEc0DBqeM/
	eCrebYk1u53VrXvb7kJE8BWD6VGoLNnMP6qixL2IRoNcgt/SxAuRmcODrb3L8JVtD+OuaNw9pZH
	7oqjopWLCRe1ftmSPI34bZIGOkmx7qKBu+1GjIYjJGBfJgZavWPNuFvFTNkjfhUYesAIypvCMqz
	aaMvW+LTnqejkWiH1HGzYub43B0GyWsgX7la0DPHbbhUMM1RlsklXzy1ekGDeBDoVsDHYE9hoU+
	MEBFU3xaI4diUEuOHlC6oXqMZR9pdMhoSXzkrPa/UjHUeBW0A==
X-Received: by 2002:a05:6830:a18a:20b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-81780a93afbmr4940499a34.9.1790388197052;
        Fri, 25 Sep 2026 19:03:17 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81903f5f25csm3719365a34.18.2026.09.25.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:03:15 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Fri, 25 Sep 2026 22:03:13 -0400
Message-ID: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>  <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>  <20260921200512.3179109-1-enzo.adriano.code@gmail.com> <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
the Cubie A7S reach an interactive initramfs shell.

I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
four single-divider patches, CCU v4, the seven pinctrl patches, and the
minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image,
DTB and initramfs were byte-identical to that earlier comparator; the
only boot-argument change was adding clk_ignore_unused.

Without the flag, that comparator stopped producing serial output at
"clk: Disabling unused clocks". With it, the confirmation run recorded:

  [    1.263452] clk: Not disabling unused clocks
  [    1.292364] Run /bin/sh as init process
  [    1.526500] mmc0: new high speed SDXC card at address 544c

Commands issued after the shell prompt returned the expected readiness
and completion markers. No panic, oops or SError appeared in the capture.
The RAM-only run was followed by a guarded 120-second power-off recovery,
which restored the vendor kernel and eMMC root.

This narrows the second failure to the path bypassed by clk_ignore_unused,
but does not identify an individual clock: the flag also bypasses the
runtime-PM acquisition and traversal before the per-clock disable calls.
I therefore still cannot add a Tested-by for v4 as posted.

Assisted-by: Codex:gpt-6

Regards,
Enzo
