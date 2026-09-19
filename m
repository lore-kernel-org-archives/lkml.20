Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586F2D595B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804082; cv=none; b=EHqSRUtH0aPwQyG1vNZFiSsKeVTjAj5W/IQvzH6RGhoz6Ubl1bPCPqZwgDoh89hWN7uh8yYgTQz79fl+WClFAz03L6MZQjCBQCNoh4T7n2kOpcNG6gO1OScaIao3xxGGHVpny2BiKLx65RijwPqyPxCtjZBOQH6pIezinZq34wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804082; c=relaxed/simple;
	bh=4Nqm/9olf8rwuKVimD3hmzctY7QFDNnxgY59clwqYzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGMQ7PUiP66qVdOgUir3xRUOtyVuxgQbVCk1WLTq81vdPBOTbfxfWs6oTcWEMxyLwHzOCUC7PAdVgLZuEfWTEfKxOALHfwHAeT6Sjryl/fGJkqqeJHsRAowelWqHVP5vb/Eqi0xCRxIqiu1Tp7HsPWnwZBtsncnxoSD09TLsA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewE0JbEq; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewE0JbEq"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc433d52421so835999a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804079; x=1790408879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00K/huS9H/7mXu5HjFXMRisVEtgY4mqkAK2gH07p5mE=;
        b=ewE0JbEqcxq6K9kcAGGZTs96Nj+ngqX7w7sQCim5WsjMQiY+QNPijpKx8g3S5+3a2u
         M7BZAKEPNDvYVGehzhfWHapd+fb9j4pVE8THh6LQU9E9qJRs2AZpCRghtfLx0kk4DPkH
         EQ14EFzEhwJVh5E3R0uE/FRyFQu2GMxZQrwh0e8n/mYprX5FCI4trSP2M+6cKlZCNQYf
         8JOuRd6N4S485mntbJyDsn26Pl4w92gBDcbMmW0Mn9uYqP29xCZt+eXAj3IUuRaNF5uH
         oUX4imL3bhJrGDJ2x+Rk4hToPRZeJuEWzKvh55W+khG3yAEwKQi/HTrG/uAYURsKQitr
         RlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804079; x=1790408879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00K/huS9H/7mXu5HjFXMRisVEtgY4mqkAK2gH07p5mE=;
        b=Mut3BhLdKu1XMAsisPmXhzmJN6RmqDSxH12JKP3Hcu8F5tCTWQbNdZZ6IIRVNtlEFP
         cDNGZ4DmjKiCYMfAy3dgWRpfhjk1R1Wf57Tz0xsccIX76k7N2mqGQcpdUgd1rHprWmIL
         vG6MrDCkMI2swCKyySyPxUDvsXH2nPP5OVsP8ilB3kLTtMs08q+EX0KCunZfglRsOGp2
         UsYx8z0r+0M7Q0K3RvNp5ZeUr3sBksuUsFAU9SvB8IqODHZ87Ecz2EhXjdI9AnzssML0
         eKn4H8vEL9dGBJcoJXe2kc3ti56ITe6TKlZYpdyx3ZgtpZZKb75ySgbsw8y3J3YBBGyR
         1I2g==
X-Forwarded-Encrypted: i=1; AKwUvBwXOsiYYZiqjTEfNkuK6w9gfHRYvPF4L2q1xLCD4SWxbPTHSj8okIMaOxINsIm2/vcAVPP8ZoGBUBc3XJg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyPhxr7/baymzE+WkzkU3/V3xwJG38zQGcBY/u37LA1IJNHlpk
	DkKiLTFq/6XzoaBwvhBlLF3VS4mPy4NJvyeFEgpkknwoHog+hByg5NH2
X-Gm-Gg: AYBFou011rfCC/CaNo6E3ZOuxS/aUSCuQ+hLSpyH3enKlvSr/cgxuEKdVDngn5nwMN7
	yS7km5nmBvrrWo9/yNFC3+v8uzvbuvHKBsEM+DA6U/kaVBjigzZgSnMPFeDdTlyWz0OSfssgtE1
	vK7LeyNmRxgJlaPmH2ApBMmn/IsCkZUHTv/mxFLc7bVtZctsVYWujTryEy2Ldep/85jVQUCNIqN
	39wiieW/oOGXxp0X18itkPbnNqqGKQZ1qovCc8xe2p27v3Tmt72CbY0mxXsTE5quYxlGPdiGTR6
	FR99icEfRhGiWnXSLU1KjZ/6C3ijRUXtw5ebNoDYhGxBODNkDt6q6eq96BI6xWFzUOhx+UrFXDM
	621t3hWk4sK2hElM/dAcolEAugTUAfFnu9GE1TIleynkOsXRjife3XLNBehOOskExqW6oTsAV5g
	KdNycovGpn0Z4zVBcNmsTx9vlSC7jK6BABzCoDaaajj8douBttt+D5OTmtsMIP2GhJclC22+HYW
	ibFRw==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr8952630a91.14.1789804078603;
        Sat, 19 Sep 2026 00:47:58 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm2145720c88.5.2026.09.19.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:47:57 -0700 (PDT)
From: Min Chen <chenmin83@gmail.com>
X-Google-Original-From: Min Chen <min.chen@siengine.com>
To: leo.yan@arm.com
Cc: alexander.shishkin@linux.intel.com,
	chenmin83@gmail.com,
	coresight@lists.linaro.org,
	james.clark@linaro.org,
	jie.gan@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mike.leach@linaro.org,
	min.chen@siengine.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Sat, 19 Sep 2026 15:47:11 +0800
Message-ID: <20260919074711.2070881-1-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916141113.GI200420@e132581.arm.com>
References: <20260916141113.GI200420@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Min Chen <chenmin83@gmail.com>

Hi Leo,

> Good catch! I'm curious how you observed the dirty cache lines
> overwriting trace data in DDR and causing corruption.

The story is straightforward, I was testing the newly implemented CoreSight
source driver of AD1000 NPU subsystem and in the captured trace data the
starting part of a couple of MBs cannot be extracted by following the ARC
Trace spec.

Then parse the malformed data:
  Leading region - all-zero formatter frames, nothing else (first non-zero
  byte is at 0x180):

  00000000: 0000 0000 0000 0000 0000 0000 0000 0000
  00000010: 0000 0000 0000 0000 0000 0000 0000 0000
  00000020: 0000 0000 0000 0000 0000 0000 0000 0000
  00000030: 0000 0000 0000 0000 0000 0000 0000 0000

  zero frames interleaved into the fill; 5 of the 8 frames
  here are zero, then the fill resumes at 0x40080:

  00040030: 0000 0000 0000 0000 0000 0000 0000 0000
  00040040: 0000 0000 0000 0000 0000 0000 0000 0000
  00040050: 0000 0000 0000 0000 0000 0000 0000 0000
  00040060: 0000 0000 0000 0000 0000 0000 0000 0000
  00040070: 0000 0000 0000 0000 0000 0000 0000 0000
  00040080: feff fe36 f0ce c036 f0ce c036 f0ce c003
  00040090: 54ff feff 36f0 cec0 36f0 cec0 36f0 ce00
  000400a0: c054 fefe fe36 f0ce c036 f0ce c036 f006

  The same area in the unwrapped ATDATA stream (offset 0x40000), where
  the zeros appear as 60-byte runs bounded by truncated fill words
   - 36 f0 ce 00 on entry, 00 c0 54 ff fe ff on exit:

  0003fff0: 36f0 cec0 54ff feff 36f0 cec0 36f0 cec0
  00040000: 36f0 cec0 54ff feff ffff ffff 36f0 cec0
  00040010: 36f0 cec0 36f0 cec0 54ff feff 36f0 ce00
  00040020: 0000 0000 0000 0000 0000 0000 0000 0000
  ...
  00040050: 0000 0000 0000 00c0 54ff feff 36f0 cec0
  00040060: 36f0 cec0 36f0 cec0 54ff feff 36f0 cec0
  00040080: 36f0 cec0 54ff feff ffff ffff 36f0 cec0

  Note the quantization: every zero run in the plateau is a multiple
  of 60 ATDATA bytes (60, 120, 180, 240, ... - 6,251 runs at 60 B, 1,467 at
  120 B, decaying), i.e. 4, 8, 12 all-zero formatter frames, minimum 4.
  There is no run shorter than 4 frames and no other non-fill content
  between them.

The non-zero data is not random corruption, most of them are decodable as
ARC Trace message. And a further experiment confirms that the error mode is
overwritting not inserting, where the zeros are removed and trying to decode
the remaining stream still reports errors.

The next step is trying to figure out how the overwriting happens by writing
a fixed pattern 0x5a5aa5a5 to the ETR flat buffer before enabling it, and a
call to dma_sync_single_for_device() is added to make sure the patterns
are flushed to memory.

Then the issue cannot be reproduced any more, it is detected a cache sync
problem (dma_sync_single_for_device fixed the issue) without too much effect
since the debug change is small.

> > Agree, without the sync, the dirty data may overwrites the trace data.

> I don't think __tmc_etr_enable_hw() is the best place for the sync, as
> it can be called frequently when an event is enabled, e.g. when a task
> is scheduled in or migrated between CPUs. We should be able to sync
> once after dma_alloc_noncoherent() instead.

Agree, perform the sync just after the buffer/page allocation is reasonable
and this is what ETR_SG and CATU paths already do.

> The issue is not limited to buffer init. The driver also injects barrier
> packets into the bounce buffer, which can race with the sink. Even
> worse, the barrier packet write may collide with trace data when they
> share a cache line.

I think the timing of the barrier packet writing need further confirmation.
Is it only written to the buffer when the ETR is disabled?

> I think we should consider writing barrier packets directly into the
> AUX buffer. This would avoid stale cache data from barrier packet writes
> and simplify the flow without additional sync operations.

The AUX buffer only covers Perf path, and what I used is the
sysfs path:
  echo 0x10000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
  echo 1          > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1          > /sys/bus/coresight/devices/arct0/enable_source
  # Run the workload here
  echo 0          > /sys/bus/coresight/devices/arct0/enable_source
  echo 0          > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  cat /dev/tmc_etr0 > arc-trace.bin

Need a solution for both paths.

> Would you mind if I pick up this patch (keeping you as the author) and
> add a second patch to address the barrier packet issue? That part may
> need some several rounds refactoring so can have better shape, I think
> it would be easier to consolidate the fixes on my side.

Please go ahead.

> Thanks,
> Leo

> P.s. Please CC me on future CoreSight patches. If you're using the
> mainline ./scripts/get_maintainer.pl, it should add me automatically.
> I didn't receive this patch directly, which is why I'm replying to
> Jie's email (also thanks Jie's review).

It's my fault, I did not get the list from the latest trunk.
