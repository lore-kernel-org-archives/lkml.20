Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548895;
	b=3bhdx8qw+cByV6P5fPhUsNP/RuUzdUeq+3XOaKW5UNlv/VG3gQ8YRlrJ3H2WFdQlWJLL
	 ZwVFMjjAQaKKLhjg3yteTtagK6s40x7ho/toexfdmDNjXro87rg2cERuioyyLCrpirkFL
	 8q8H+SVUmpmbYEp8TLTCT/D5MWHnqqPn1/hNrpFeU4tfYObj61czaEspqjHndqb/hSphK
	 J2s4oq44saq6vyZcAz5Thyp1pVez8NUXxyjWzeEwFgtpncmNCociXecqTVOUL8Zc1zU8Q
	 thMR+hy38UfBmZ9/wsZ4DsgHnyxcUvWfkgdzIKhAAItapOZFcAyWFhybjNAh1Zy0rgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548895;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VCSjjerN4swAyojavdxydNFi5ohpFUbrii0bTBGDcD8=;
	b=4R4M4k3LHFsbARX0IR3VjamzWsEOkTQ0Fw8zG3NGHptgi8xMlqVFDS7YdX1I5nkssAwq
	 tBCBtXU8Fh1hYLdqzGAajeebOJE13xMCme/rc2X6MlocTYjUO/uYjaHUWdCsacV6SWQlw
	 CQiM6Q91I4HW3z06NXtvb46mgPGA54RjEUUiwEKDJrbiSEn8GYEDo1m25RprNRUjl2hCY
	 EvCGEieMFHGrcIxDMQ9sGbpZg13ZGFL1IL0xfPdU9AHMIGknb0pm33a/a9QUQVe2RULmr
	 qJZ8/uujG6iFAZBJtwlskXs6Pb8g2hYtzEWQ+lL1URJX/sdvciXzHyix1/62pRuDKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b="V1K/be/r";
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE73606A325;
	Sun,  1 Nov 2026 16:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE73606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=V1K/be/r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793548882;
	bh=VCSjjerN4swAyojavdxydNFi5ohpFUbrii0bTBGDcD8=;
	h=From:To:Cc:Subject:Date;
	b=V1K/be/rl7UewVJPmyNAnSjaLlEPQs3AdgvRhjU/xfYPBOB0hn/zu7S4POvPz2qQe
	 UZmC/jb2+VK8D9LPvHaSDe9kaa9UdtHc6JcyCUkysQzxvDCDWslM+ZmeQCBSExpSF7
	 Qxju0FL5zqGDHnG0ydkdoOTEHmPWKUt8Qo9uUK5g=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4D84AD9; Mon, 02 Nov 2026 00:01:13 +0800
X-QQ-mid: xmsmtpt1793548873t57elxer6
Message-ID: <tencent_123976BCEABEFB4C0F5CE28BCAA346A72405@qq.com>
X-QQ-XMAILINFO: M+6QKz8nsrJQPjexYpMHD+dPrJhsMYfcpG2PkQZZq3oezjMOep2zSZHp6AmknP
	 JNspPK74ZH5/uM7T643swzukTR+V81mIc8RJ/VTw9qeRw1jNbl+HgSPTMmJUSplj1BFNj8Z7AoYH
	 1IZGExuUmtYjO8+bCDvFP0AFAoXcrm1ZZY/bjHbbUnz28fLXRMkmczxpDt8pFWT4PQ7aIYp44kjb
	 5RP0VL5urWns6fee4jRI3AWLHOPI0oZ7EkxoEuVFHsPiFNGnxRJ9/wlapxthXRmYpQufJMUK0EuU
	 Q0ssYwZwOXqV63D/XN8U3E83wpLJWRt1sjtwnnZO8oHuaCi1/JND5WGhk2MsgvTO5SfDUL5uV6j0
	 x7o6/5Qa7/IedswcGWPZEqG5i/Zddg3MF2U9Mh8DqPqZRe3eHvj8ET/J/p/IBuUFYdsbnSj6KfUJ
	 XKZLXm6SfI9OZhw+2xinkD+YpN3MBdA88kTmTREX+wglJh/nWXl5Hf1ND7w5KieSEosyTd5J/4pq
	 nfhwLTHRUfhLfJCmD5uBEG9DdtlrwSi61pnBOUsLCCJ1NB09xMrqMFoo+ba+Z6zrc/L+ihT5m17g
	 LGKacS0SpSq17trQgZVs/HNvbsRSMUaLuTTRHs5RL9BbMbpv95CvNMNE/QJmQevj1056Gkm1io7k
	 ALfWvvNdYpe3ke5noogKuO2So9SB3PkwQSE3HHtVbec8amRgSBE3lyx4E5hFezoaMSIQ10DqYSbC
	 J7vEBCzYbJz89XiX1DeQLnOSfoEl7b7KLVP7FU6wspO+ZyzcHICg8tH+F7XSKhryEwUsehYBYuVe
	 R3T55EffN9OVBvkxuDxOS70sSo22yT0bdAazd6F09m7cBlD3F2kCLoD0e66hVnLGNj7IljBfXBXk
	 ldLAXRURns/4ZrOnNWoDJje9KXrtew172bCJEoZMdyuMIxO7OMiya9cC0P1yWx1KptpYkj7VEk27
	 ih6xrNSjGND0HWZ57XNQCKaItU0zly2z8HlH+qTF5jKFvK2GaAgbpZu5+la3IhNi0KJHNymHt/ly
	 bk706fmOixvf9YwRw59/1huAw4nAzg5Vt0gFKsLVx9k/V36w8e/GR6O5wwUSou67Y71P4lpQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Haozhen Li <dezige131@foxmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	=?UTF-8?q?Dawid=20Wr=C3=B3bel?= <me@dawidwrobel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haozhen Li <dezige131@foxmail.com>
Subject: [RFC PATCH 0/2] firmware: qcom: scm: QSEECOM app loading and listener support
Date: Sun,  1 Nov 2026 16:01:07 +0000
X-OQ-MSGID: <20261101160110.3622-1-dezige131@foxmail.com>
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

The QSEECOM interface in qcom_scm.c currently only supports interacting
with pre-loaded trusted applications via qcom_scm_qseecom_app_get_id() and
qcom_scm_qseecom_app_send(). It lacks support for loading applications at
runtime, unloading them, and servicing normal-world listener requests.

When an application requires normal-world interaction, the SMC returns
QSEECOM_RESULT_INCOMPLETE. Currently, qcom_scm_qseecom_call() issues a
WARN_ON() and returns 0 on incomplete calls, leaving the application
blocked in TrustZone and rendering subsequent QSEECOM calls unresponsive
(-EBUSY). This behavior is the primary reason the driver currently relies
on a machine allowlist (qcom_scm_qseecom_allowlist).

Design rationale:
Currently, QSEECOM expects apps to be pre-loaded by early bootloaders.
However, runtime loading via APP_START is required for modular devices
and trusted applications (e.g. fingerprint) whose lifecycles are tied to
user-space daemons or loadable drivers. Furthermore, dynamic loading and
unloading frees secure-world memory when the app is idle. We believe
providing qcom_scm_qseecom_app_load() and shutdown() within qcom_scm is
the least intrusive way to expose this firmware capability, but feedback
on whether this belongs here or should eventually hook into a higher-level
tee subsystem is very welcome.

This series implements the missing app-manager and listener commands:

Patch 1 adds qcom_scm_qseecom_app_load() and
qcom_scm_qseecom_app_shutdown() using the APP_START and APP_SHUTDOWN SMC
commands. It supports both split (.mdt) and single signed ELF images, and
enforces a <4 GiB physical address check required by the 32-bit SMC32
arguments.

Patch 2 introduces listener registration and request handling. During an
incomplete call, qcom_scm_qseecom_call() dispatches the request to the
registered listener callback and returns the result via LISTENER_RESPONSE.
An iteration limit prevents indefinite blocking in case of misbehaving
applications. The listener shared buffer is conservatively required to lie
entirely below 4 GiB, mirroring the image constraint of patch 1.

Removing the machine allowlist is deferred to follow-up work once existing
callers have been verified for re-entrancy.

This work builds upon the QSEECOM transport logic developed by Dawid Wrobel
and samcday [1], adapted to modern mainline interfaces (qcom_tzmem,
lockdep, and proper kerneldoc constraints).

In accordance with Documentation/process/generated-content.rst: an AI
assistant was used to port the transport logic onto current mainline APIs
and to draft the kerneldoc and commit messages. The architecture and code
were reviewed and validated on hardware by the author, who assumes full
DCO responsibility.

Build-tested on arm64 with defconfig and CONFIG_QCOM_QSEECOM=y (W=1 clean,
checkpatch --strict clean).

The transport logic this series ports has been exercised on hardware
before: on SDM670 through the work it derives from [1], and on sc8280xp
(huawei,gaokun3) through the equivalent out-of-tree patch. This exact
series has been boot-tested on sc8280xp (huawei,gaokun3) with an
out-of-tree client of the fingerprint trusted application: trustlet
loading and shutdown verified across multiple start/shutdown cycles
with consecutive loads succeeding (confirming that APP_SHUTDOWN releases
the secure-world memory and name), sensor initialization and image
capture stable across repeated enroll and verify transactions, and no
dmesg regressions compared to the out-of-tree baseline.

[1] https://github.com/samcday/linux
    branch codex/sargo-fingerprint-kernel11-baseline

Signed-off-by: Haozhen Li <dezige131@foxmail.com>

Haozhen Li (2):
  firmware: qcom: scm: Add QSEECOM app loading and shutdown
  firmware: qcom: scm: Handle QSEECOM listener callbacks

 drivers/firmware/qcom/qcom_scm.c       | 394 ++++++++++++++++++++++++-
 include/linux/firmware/qcom/qcom_scm.h |  62 ++++
 2 files changed, 444 insertions(+), 12 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

