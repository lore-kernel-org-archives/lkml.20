Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280974;
	b=GJfS0XtIaNUR2VOXbSvBhkiWQUiOXvFk8pXirGigv2vx4pn2PD3ClMv5aKjcVkTyEhfr
	 NpRzu1xPryuYATeCoaTe+0kjRvzeqdEK71tVAf85BEUFNXKGoXwKC+HZYBAzwHrhBCgfK
	 TSYFI6cmW7v1/QITe6VHK8lHV0a0+FXYCPoI6VRskGT4gmQ13ForntayVb4zCZA5cfyGu
	 qppCG+7z8KfY8V+e318Gi1RNLAKQWjallphmbusd9Fr7ExJPiUv9H/UjXfk7+H70CeTeY
	 /VzxLRrPY5tyFA6lZT33LoO9Av3kp2RDnIC77JyC3CrzqtpXUkOjEohxxJJl9ZyFrdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280974;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=YtfL+KmftQRDXEG9A8HUqiME9C/gwzCOqzjr/edIS24=;
	b=deZImX2iUh69YcnKnnflNZY/ivjaBc8FZ4emQQGzEZ2b/OtoFdShXnPNmub6GMr0m6Cq
	 wKiJm72gyGPUJAYIDlv+RhDHB3vEZ/q//QqjjVjbqufoySaxUtOkIW2JhbFyquUpUIPq3
	 UBGgxK/vYXoajYDutU6dFgNkmGA+N8SEK7q+OP4sRbADUVbTzokwGrbWMQOXgNUT1MFPc
	 8A5GHG3eC/NLbsQIEf+QxvU0MiKlnU4Ee7eeOml4vB/lVmrL9SAmxHEcUXlit+ObcT/cn
	 /ytIP1U+obp3TPjtVeJEyo9Xlk1zi+bl/Rg8S9Nj06FD9YyMOpqG6pjp7OCSTY+3/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIgwOcU3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C60606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIgwOcU3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0B21F01825;
	Thu, 29 Oct 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280973;
	bh=YtfL+KmftQRDXEG9A8HUqiME9C/gwzCOqzjr/edIS24=;
	h=From:Subject:Date:To:Cc;
	b=eIgwOcU3gB+Hc4pdOPgG15AfCe1PRg0nfjyKQTDpssmi+NxAG2p5+hZt7uT0OUptZ
	 iaFjSQKHUfVvPJmS1YXSxwa63dZb3S21cnjjR6RLvDfqK4fU0nElGB1H++8IrMa3my
	 hL1LsqhO5IOriepu4EEAPfQSTHrNIVDgDwtCIAnY3kugJ9Ml6Qpv8SyHSKzZom2TL7
	 b1+td4/Zs+LoaDiwpmjaoJyvnvcNfY8hHA6hbJpFpZQ3yaX9K41GoBOeT0n0zSQyUE
	 UsVHfmuOWu4JdAQujlXmHzNXkLe4VEEunM4HxUIMQ++8kmDHApU+dGCzDFzebK0+aq
	 kz99gzT+CGCuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v4 00/31] accel: ethosu: Another batch of fixes
Date: Thu, 29 Oct 2026 08:35:47 -0500
Message-Id: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBAF4KsY1mIoUH5ceQ/jotahRU0x0BJN0
 7sLdaHWuHyZ970ZUQBvIaDtakQeog3WdSnw9QrVbdU1gO0pZUQJFURRiaFvXRiwsXcIGKBUTAn
 QhBCUyM3DfEhif3jlMBzPUPd5IzdaG3rnH/O/WOTen+lYYIIZF0ZDpaQu6t0FfAfXjfMNytuRv
 rUmfKFp1lJIyZQsRcV/NPvUaqFZ0lwTA7QoqRLmS0/T9AQJMHZaNwEAAA==
X-Change-ID: 20260827-ethosu-fixes-ee58386e9000
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

This is another series of fixes to the ethosu driver. It's mostly probe 
error paths and cmd stream validation fixes. It's a mixture of 
AI reported issues, different solutions to other posted issues and 
fixes[1] and my own fixes. The last 2 patches are additional operation 
support.

The series adds rejecting OFM tranpose in cmd stream, but then a later 
patch adds support for it. I did this so the rejection can be 
backported, but maybe supporting OFM transpose is small enough that it 
should just be backported too?

Sashiko keeps raising issues about IRQs, but the h/w only generates an 
interrupt if a job was submitted. The scenarios sashiko talks about are 
not possible.

Rob

[1] https://lore.kernel.org/all/20260717061145.1478139-1-zhaoguohan@kylinos.cn

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v4:
- More patches added for existing issues raised by Sashiko in v3 and 
  local runs
- Combined the 2 patches for unknown cmds and unhandled parameters into  
  one patch 
- Link to v3: https://patch.msgid.link/20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org

Changes in v3:
- Address Sashiko comments
- Another runtime-PM fix for driver remove()
- Add a fix for NHCWB16 bounds calculation
- Link to v2: https://patch.msgid.link/20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org

Changes in v2:
- Dropped first 5 patches which are already applied
- Patches 11-17 and 19 are new patches with more cmd stream validation
- Add fix to diable clocks on PM setup failure
- Rework the runtime-PM to suspend after initialization and before 
  drm_dev_register(). This simplifies the error clean-up in probe.
- Handle quiescing jobs before scheduler teardown
- Rework the cmd stream register initialization tracking to use a bitmap 
  of registers instead of relying on initial state values.
- Handle U85 DMA 2D/3D modes correctly
- Link to v1: https://patch.msgid.link/20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org

---
Rob Herring (Arm) (31):
      accel: ethosu: Suspend after initialization
      accel: ethosu: Ensure suspended on removal
      accel: ethosu: Fix probe error cleanup
      accel: ethosu: Disable clocks on PM setup failure
      accel: ethosu: Quiesce jobs before scheduler teardown
      accel: ethosu: Fix runtime PM get error handling
      accel: ethosu: Limit perfmon counters to UAPI
      accel: ethosu: Serialize job completion
      accel: ethosu: Guard operations after unplug
      accel: ethosu: Keep scheduler after unplug
      accel: ethosu: Clear SRAM before submission
      accel: ethosu: Validate timeout command offset
      accel: ethosu: Prevent command stream export
      accel: ethosu: Move DMA mode to src/dst struct
      accel: ethosu: Track command stream register setup
      accel: ethosu: Factor buffer bounds checks
      accel: ethosu: Fix NHCWB16 bounds calculation
      accel: ethosu: Validate secondary streams
      accel: ethosu: Reject unsupported commands and params
      accel: ethosu: Validate all feature map tiles
      accel: ethosu: Account for feature map element size
      accel: ethosu: Validate convolution parameter
      accel: ethosu: Account for kernel dilation in IFM size
      accel: ethosu: Validate accumulator input
      accel: ethosu: Restrict dynamic IFM2 weights
      accel: ethosu: Split U65 and U85 DMA length validation
      accel: ethosu: Validate OFM transpose
      accel: ethosu: Validate resize operations
      accel: ethosu: Ensure cmd stream is multiple of 4 bytes
      accel: ethosu: Require active weight streams setup
      accel: ethosu: Support U85 IFM upscaling

 drivers/accel/ethosu/ethosu_device.h  |  40 ++
 drivers/accel/ethosu/ethosu_drv.c     |  56 +-
 drivers/accel/ethosu/ethosu_drv.h     |   6 +
 drivers/accel/ethosu/ethosu_gem.c     | 951 +++++++++++++++++++++++++++++++---
 drivers/accel/ethosu/ethosu_job.c     | 236 +++++++--
 drivers/accel/ethosu/ethosu_job.h     |   5 +-
 drivers/accel/ethosu/ethosu_perfmon.c | 123 +++--
 7 files changed, 1236 insertions(+), 181 deletions(-)
---
base-commit: 9a96e169c9267af918d28fb291df948d83112807
change-id: 20260827-ethosu-fixes-ee58386e9000

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

