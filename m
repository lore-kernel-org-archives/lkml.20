Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699690;
	b=BkVu1pJyipc9Ax5QeU7FPG3ZXXP8ILa359vGdSimtRzR7td2V6wqJ1yNmMul/W0AJEIm
	 geJIJGMspsnsf/mPGI3IIs4KFvMBFAvjfQJHtcjbDM4uQvcclENeLbsaCCpUm3Qu9fWtr
	 qYSHaXb23P26SJ9Y9Nre4kDxtIdJaDHhKB1BK9n/mEF+4e5B6ig1uXvnY7Mn/RMAfHbI1
	 bKhyLw1Xtl4cq+v/l5UUNdazRnqnbmhqVCg1baeCUUFEThGFwTgr0upIJEyq3uAnW7Rs5
	 DvHPt7OsOArCYyFjOv8m2VeNoJSrNZ3EZwnriEUc3QWjmuWnPgP8adXKOdvZT88XcBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699690;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S/0XOoet5tly8N9TLzqlqqGcLoqit/qE1XfqjvmdQD0=;
	b=Mz5RgF7Wf+m9dHYo6oZqn1ca0EBs68fAgC/zXRFDdCk3ibHwbxs+LrNdK4dg7ok9Ov3w
	 MR8Xh2Vlm81PufAJnGGUV3mDnWNvYsjc2J7wbvy7b3sXN2/PBQiIMqeaINbgYIJcPZ+oD
	 KgLNUw69eOU9s3HECOF59/VDLtIZxa6pNl+4ttnssQv8IIy8YuERBBJPSm2Zb4iq2DKA9
	 njhRzJ08xKrfNYmI9bygdUls/SEeUjY5v8HcC96UG12RvZ8xLKxr/q2YtIp/3pYJ0ZM0b
	 Eq1IR0GHCAF28GHLBo+FG8nO5vqMKYF4JiIlePxJkzUE8Oo/NLMMiSqYgu8yoPJ8wLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJXBuTL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EB606D806;
	Tue,  3 Nov 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJXBuTL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE6B1F000C1;
	Tue,  3 Nov 2026 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699689;
	bh=S/0XOoet5tly8N9TLzqlqqGcLoqit/qE1XfqjvmdQD0=;
	h=From:To:Cc:Subject:Date;
	b=oJXBuTL26MDM7IwRn/P7PHosK6ubnsKYLr7jemLU3nnjn94vDv2ROiTG+7M4rQAvb
	 PiUGeGyon0qCp3VUeGj854JaMTtYouDGKv9e2lSw4PtgrOUuNCAK3P3upkxW7OpfZJ
	 WS7sZcPVOIj+52FIOMpwZ7S8UZvOdxIx55kDvwWfqMv80Zuala2OfZ7MP6sxICIRGx
	 AX++BnxPu/s5FzjbarhY6wlkebwNyKWWxSiN+TncgjFbrMtzPt0cKqQOsvHgSHGo80
	 hsOghQzXHEm2d9nRu+zIOn/JxudJXrREpO826svLkszeNZDsju4n0msPnuIDEa3RUE
	 T6XpnrGMlIv2Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 00/10] soundwire: Fix Critical and High issues reported by Sashiko
Date: Tue,  3 Nov 2026 09:53:44 +0000
Message-ID: <20261103095445.81414-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

v1 => v2:
 - Drop "ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT streams" (applied by Mark Brown)
 - Drop AMD SoundWire patches to be handled separately by the AMD team
 - Drop Fixes and Stable tags per Vinod
 - Only increment m_rt_count in sdw_stream_add_master() when master ports are allocated
 - Replace cleanup.h guards with explicit mutex_lock()/mutex_unlock() in intel_ace2x_bpt_{open,close}_stream()
 - Check nports >= maxport and unwind port_mask on overflow in qcom_swrm_stream_alloc_ports()

Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>

Lee Jones (10):
  soundwire: bus: Hold bus_lock when looking up slave devices
  soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
  soundwire: stream: Prevent m_rt_count underflow in
    sdw_stream_remove_master()
  soundwire: stream: Clean up allocated runtime resources on config
    failure
  soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
  soundwire: qcom: Prevent pconfig buffer overflow in
    qcom_swrm_stream_alloc_ports()
  soundwire: qcom: Disable runtime PM and avoid clock underflow in
    qcom_swrm_remove()
  soundwire: qcom: Check clk_prepare_enable() return value
  soundwire: qcom: Serialise ctrl->intr_mask updates
  soundwire: qcom: Prevent stale broadcast IRQ from completing
    subsequent command

 drivers/soundwire/bus.c             |  6 +-
 drivers/soundwire/intel_ace2x.c     | 20 ++++--
 drivers/soundwire/qcom.c            | 96 ++++++++++++++++++++++++-----
 drivers/soundwire/stream.c          | 44 +++++++++----
 drivers/soundwire/sysfs_slave.c     |  6 +-
 drivers/soundwire/sysfs_slave_dpn.c |  8 +--
 6 files changed, 137 insertions(+), 43 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

