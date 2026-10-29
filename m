Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257724;
	b=yb9W+NpmZwvGCjNjI3hm3IjCiqK/T+tWU1WjgOdyk3fM/VQ9UUDNQIuScQeNvXA7ryPj
	 249aJodPu+WtxV2iQwpHLp8ho0KFAkQFMpBDJve8D1uMAI1xbqlVfZIb1J7M0vtYEdNlu
	 OAcWvPYeInRe61AABh6LHz5voZZRtB3oI2ENIuLCX4mXL2C4bkBB4XEyfUTTZVfn/P9jm
	 ARRUfRlqwGgPB2XtbDdcm2gwcA31qDwa2djqUOW1aU5IxyzyJeb8SGooljro6FH4T7R2J
	 9G41FeLydQB+NGjU74tbtXdGezCqzpCOK0xgPQJ//FBJdTSOL7X3BfiZCoPRRKEwGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=od3rktvThpmHG27AUgKJOFT+duaXCWPVODMzLp55jMA=;
	b=RATC2l1pSD7aImh4uGecmbtR8KcmMgku//V+B9le1YoR06YuVghItogGQ1dXHX/vgojW
	 g5RHdY75B3o9xv25+M8RHRHLjjuWjB7OUJtAriw118Bpv4I+Utwvd30vgcXuyf6N7c7Rk
	 KZdmaWp6hGASL3sHxSgP5hhzwkcfDei2h/4IKDLDbRSaGvTrw4kz7hrJ74uxraVh2fPFS
	 3HHup2FAF9O08KpIWh62OxbPq7D9XshCmyEgOd3Rp9f88g/vKu/LqZic+lC62jE5w5HpF
	 WPcCFNmiYr8X97S+0r9QFHdOqn4YaPptDxRCYJZ9APzOxxyHAJhTyY0hcXsMul7b7ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HyVBIC70;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7D606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA7D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HyVBIC70
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so1621856b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257723; x=1793862523; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=od3rktvThpmHG27AUgKJOFT+duaXCWPVODMzLp55jMA=;
        b=HyVBIC70hD8mnthnqdIJhsKQpoP0dlSBmgVrk4awRy1knIFUL0VFd3izX48WAOS0x8
         7S9cRNybzdUtrsXId7772cYkrdh16Ejrqf7ve9QmZ3veqxNPVSvGgBa0EHMIU2YPXOnJ
         J38SjYFQFjiBFzpC//DAlXUW88lAVFeLSPwMNlgbISiATQpX4N0lESipsxGqulmyKgzv
         WO7u5OgVacyoOdZ1ggMJf9cdA/vL6YBb/oPIZw++nIPg8MuoYzZmuztMucD0V4LBkCOk
         OFmZhiMDzSZ+YAp6BF+9WjxICPbWdCF9tj6aUO0DkfOBbWLinuLAb/XyFdhd9u++JhXM
         FU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257723; x=1793862523;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od3rktvThpmHG27AUgKJOFT+duaXCWPVODMzLp55jMA=;
        b=JJVQKrK93U1lCVjR7HTbti8bYtEQV9xxu1kqA9ZqYEq3HyfKz3MwhDSF973+BtL7oc
         Zz/jbNrMt9Hfy2dPPoK541eiKFqokwOTkndKEeTFExffKca89qM5slMuTB/Z9Ox3I9Gt
         Vt7iM1WnOxob8ohOLuz8NtlBYmezc7wfhZnMhmcVejDRQ+CHkxam7czeUp2VQlt5BIpu
         ndCWmu9FuiNw5xnJfyjppjRBryG9W1dAUZiFFE7r0PaCtBGsEP6nJIKYb+vUMVvvvJsX
         1kHli05Lp4NpvFLttNLp7U4zELlO2t0SIj8AREUpKPoUYk3w7eBzLyJ3xSdTUScmBOmx
         TGnw==
X-Forwarded-Encrypted: i=1; AKwUvBxPBgvCP8b8JueSnBLdwWlRG1MBIaiitB9qX0SvGanfP59eVDTmdxDEuJWuxB5WpVv6X34J+87QMWnhoK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/tno9FpVOW+fd3zG6nFx7Boan82EL8lejF7Kc5JgNL0Z47aoq
	CIDFNXg6tjpCg35D/bS+XMBZPf1Zg5gr8aGyrwCBDm15SF0fn39S7W6ERuvuJTSt/KyM7k6bCcV
	5iMKg+XNiWROUCEC4ZIc/ow==
X-Received: from pfbbr15.prod.google.com ([2002:a05:6a00:440f:b0:8a0:7c0e:8263])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1905:b0:82f:38df:681c with SMTP id d2e1a72fcca58-8a6e480a6dfmr3468902b3a.6.1793257722603;
 Thu, 29 Oct 2026 00:08:42 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:35 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040003.2100003-1-stanleyjhu@google.com>
Subject: [PATCH v2 0/5] scsi: ufs: Fix device management timeouts and runtime
 PM errors
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes two problems in UFS core entry points that issue
device management commands or touch host registers.

Patch 1/5 restores the millisecond to jiffies conversion of device
management command timeouts. Since the timeout moved to rq->timeout,
a 1500 ms query timeout waits 6 s with CONFIG_HZ=250.

Patches 2/5 to 5/5 handle runtime PM resume errors. Several UFS core,
sysfs, BSG, hwmon, and debugfs entry points call ufshcd_rpm_get_sync()
before accessing host registers or issuing device management and UIC
commands, but ignore its return value.

ufshcd_rpm_get_sync() wraps pm_runtime_get_sync() on the UFS device
W-LUN and returns a negative errno when runtime resume of the W-LUN or
host controller fails, leaving the device or controller in
RPM_SUSPENDED.

Continuing after such a failure can access host registers or issue
commands while the device or controller is not known to be active,
while checking pm_runtime_get_sync() directly would leave
power.usage_count elevated unless balanced with
pm_runtime_put_noidle().

Add ufshcd_rpm_resume_and_get() around pm_runtime_resume_and_get() and
convert the 20 external and helper call sites to abort and propagate the
error when resuming the W-LUN fails. The three lifecycle call sites in
ufshcd_rpm_dev_flush_recheck_work(), ufshcd_wl_shutdown(), and
ufshcd_remove(), plus ufshcd_err_handling_prepare(), are intentionally
left unchanged.

Tested on QEMU ARM64 UFS (SDB and MCQ) with W-LUN runtime resume and
suspend failures via sysfs offline (no behavior change on suspend
failure) and GDB power.disable_depth=1 to make ufshcd_rpm_get_sync()
fail, and on SDB with a timed out query request.

Changes since v1:
- Drop the incorrect claim that a failed W-LUN runtime suspend
  latches power.runtime_error from the cover letter and commit
  messages. The PM core latches a runtime suspend error only if it
  is neither -EBUSY nor -EAGAIN, and in-tree UFS drivers fail W-LUN
  runtime suspend only with -EBUSY or -EAGAIN (Bart).
- Say in the cover letter how the series was tested.
- Describe each failing sequence in patches 2-5 step by step in
  time order, and drop the runtime PM disabled (-EACCES) scenario.

Link: https://lore.kernel.org/linux-scsi/20261025013446.345974-1-stanleyjhu@google.com/

Stanley Jhu (5):
  scsi: ufs: core: Restore jiffies conversion of device management
    timeouts
  scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper
  scsi: ufs: sysfs: Propagate runtime PM resume errors
  scsi: ufs: bsg: Abort ufs_bsg_request() when runtime resume fails
  scsi: ufs: hwmon, debugfs: Propagate runtime PM resume errors

 drivers/ufs/core/ufs-debugfs.c |  8 +++-
 drivers/ufs/core/ufs-hwmon.c   | 12 +++++-
 drivers/ufs/core/ufs-sysfs.c   | 67 +++++++++++++++++++++++++++-------
 drivers/ufs/core/ufs_bsg.c     |  4 +-
 drivers/ufs/core/ufshcd-priv.h |  5 +++
 drivers/ufs/core/ufshcd.c      |  9 +++--
 6 files changed, 84 insertions(+), 21 deletions(-)


base-commit: 503e6172fa74da6b4944ece458f5534681e51d21
-- 
2.56.0.307.g5fe7bd680c-goog

