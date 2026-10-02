Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C852F5A06;
	Fri,  2 Oct 2026 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971310; cv=none; b=Pg/ziruyy1XITPZZ2gHlWvlWgeziXuHM+u5cAdH42UwMmd4VL/UznUNSVo5jPUKRIIRl6zpJJfxG/5GxjVkrlYGVXSCjXdxab/Tam+4IQ3NinZlyNvJO3rCit/0NELrguMFK228iz93xrjsS41eD3qBW/WyfyN+RhFmWXX5PAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971310; c=relaxed/simple;
	bh=itjzMvT2icyz/iJKwzAe09yKJfqBluYov6F6xn8HFsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljo3KwdyJ+Mwhbw3vlHumVWSJp0j36LsYY/syE/9n8cd75cV1lxqbt1yWvOaED6k3vCIDOAQRygAqxCIbki3MjcEh8P0kBP//MBT+7EEtK/VlxmWm+brvGoghbQ9znr7NZVWZRyiJP6tb+t6q2Lx9YnvwLEDgLCGNOwAbd9sP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XiNqbwgl; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=uMIWlvKL; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XiNqbwgl";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="uMIWlvKL"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790971297; bh=ZxHKHJEB1uzrQpW9YHNsTrJ
	ODTalxGJjXkQsxxH/RnE=; b=XiNqbwgl+bsMp5eLp3pL6F6x0S+f5mwdET1V8/5vdYtlDKoixJ
	Aany963uy+0euaBrV9VKUkgM1fH+DIkaq3N+wGqLHJqTLs5KWFKcp0InR3lEKiB8xx+ZMiQKGlX
	SrTOdCtGpUXfjfipeWIggjzmqKJM9IksfqJ9EKn+OwVPTJYCapvOYYUJAivJSvMyfsw2dxn8xKi
	xVtNuc+ijE95A5UtKYiPAbkkNYBwE/gFARc9BbjpKXwnx0FZzBp53vcEaNyAOY8uWhD5/cQqqMA
	dg8esSqFsyz8GSmczhbxAHeNt9xQxHE4SkHiDBYL+ZHYbXmNoew52ZNI2Dp5WLBZ8Sw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790971297; bh=ZxHKHJEB1uzrQpW9YHNsTrJ
	ODTalxGJjXkQsxxH/RnE=; b=uMIWlvKLJY+oIkTtGB0juMvbQROieoPjM23JOCyNCDsfvGmlOL
	WhQANLlgzXy837CYF2lIG4tr+MxgOTmOmaDg==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH 0/1] misc: fastrpc: Fix SMMU context fault on sensors PD
Date: Sat,  3 Oct 2026 01:31:17 +0530
Message-ID: <20261002200118.138837-1-pc1598@mainlining.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas, Greg,

While bringing up the sensors DSP (SLPI) on Qualcomm SM8150 devices, I ran
into an SMMU context fault whenever userspace (hexagonrpcd) tries to attach
to the sensors protection domain (/dev/fastrpc-sdsp).

The issue comes down to fastrpc_get_args(): if the device tree defines a
stream ID (sid) for the context bank, FastRPC allocates the message buffer
through the SMMU using fastrpc_buf_alloc(). However, the sensors PD on SLPI
firmware expects this buffer in physical shared memory from the remote heap,
bypassing the context bank. Handing it an SMMU-mapped IOVA triggers an
immediate fault:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x1fffff000, fsynr=0x330001, cbfrsynra=0x5a1, cb=11
  qcom_q6v5_pas 2400000.remoteproc: fatal error received: PDM: service 'sensor_process' crash
  remoteproc remoteproc0: crash detected in slpi: type fatal error

This patch checks for SENSORS_PD and ensures its message buffer is always
allocated from the remote heap, even when an SMMU sid is configured. Other
workloads (compute, camera, audio) remain unaffected.

After applying this fix:
- hexagonrpcd attaches cleanly without crashing SLPI or dropping pipes.
- SLPI remains up with zero SMMU faults.
- Sensor queries over QRTR/SEE (service 400) succeed and stream live
  accelerometer, gyro, and magnetometer data to userspace.

Tested on Xiaomi Redmi K20 Pro running 7.3-rc5.

Thanks,
Piyush Raj Chouhan

Piyush Raj Chouhan (1):
  misc: fastrpc: Allocate message buffer from remote heap for sensors PD

 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.55.0
