Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073390;
	b=dPjuMkGt/HLJFiexm7RkD5r/BTDaxaDr5U1A/KJ+O+c0f8FncWN+I5EHE6rUcrrSVt3+
	 cWsXDNO6c2zglifkpSZAHj+QCSqhmBXiFC3I/RXqGCg5XgCuV9eG/u8phUSF8HkReNDO9
	 uJP+EAFhYIGyrJNIskwfyTmYdk+aIvgMcxzAsiqGI6a/WYlX6/VRpfnlnINv5muOUgCIL
	 ydVYSgWguJhasOpl/k3AohUKFGlXSkrx8VeI+NhOt1aeo9KjHZahBrvlDIDCItu0qBAnD
	 yXuN1et4bShN07Hs7Fo8sYghSyU9X4HZYRV0LYpfbBTxy74W1SQlt+ilrAITJZNN6+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r9DC+v4ThjyXVkuemQANfxNZK1eNGzIbXEHQZPaQePg=;
	b=kl7KZHM7Vmcscmh1BeNb0JfQkMa8EPlAcRMdqlw9NleSxKHvoielCyadyiUnq8LnCMPs
	 VpnIehTXDZxh1OvnX3VXIxZTqGuf75X1RkdZ+x73D5vbfEuB4RStSd98W7x31GvxsTPph
	 lw0qjRM9CNnt8LrTEcWDMTQPu7I0N0PaDtpIzqoLb7DxlA7oq++57FFAkm9uKgrUhjNxi
	 6gmu6GwXkTx7Is07cYi3nbJh1xXSxiy/zcstbb++ddIY4JLjuYD0qH7/SacvlGoGhVYx9
	 JHPxfZenw5g1N+1T+AAJrsV7q9+LJc3Gc5VT7etJOZb2Ds/ltcv4vPRtQqG3xtFLj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rxb9lujx;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F0606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rxb9lujx
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2932611c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073389; x=1794678189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9DC+v4ThjyXVkuemQANfxNZK1eNGzIbXEHQZPaQePg=;
        b=Rxb9lujxGPUME3b1i/eC4aXp9DX2xCrUprkmuSxBCKq8S3r3qgoyam9vcaqWuCtbq8
         zuhiZ5ZFmR61Cq/o88kRlaa02cx8kyos4tzqFjRYA02912Py0uKBR1wPHQ7lE9hflhXT
         hdVQ2RVVomqER7QS9q60QGv0U0HwrBo+DzHvOBzM3tcHDMZopN7mqMVMMHw5SBntH6Xl
         aVYUxGZ0ctI8GXB+wkmpib13aiiTeHTU70vekeKhcJnmYjSDIZovppXiNos/NzhKfUIy
         BElPrLk0M8XrCCXu335UsKubNbugf0QLBnzXcepAWFEl4ePeX6SUM9NRgevIqfYQBzrN
         Je/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073389; x=1794678189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9DC+v4ThjyXVkuemQANfxNZK1eNGzIbXEHQZPaQePg=;
        b=u+gVFuQBJpd+widuclg1L7TzLVEcTRGJuXj/yT4h8rW4rlz4/L4WZQG4fah/bgIOcm
         ktq3kZ4X0G0/KAiXbIs/nPXFghkZZ9XY8MFrCN8YzZ+Aj+l+FYONCpUvj0oaQVn9VmDF
         89dSgT/XnOLLybIyYgQhE9unLuaO3cwzk6MWRw4SocUueEIAjqEb5QBwXvHlP7btvDDl
         FElbMhZHmo2fVjYEX0ZJSqxfYsccZ0rPpeS8CJsLTvJ+AyMv1GzpB8EUyBxac4EOcOY5
         5tjn+sIKGv/j5Lc7cbsQwkTqfihO6v0GULac+0UCVQwA7F7spDIIEFQliNaa+qnAFdf7
         D4xg==
X-Forwarded-Encrypted: i=1; AKwUvBx0wq+jFseU4GXGlzXo+2emPPlmJ6PIe6PaRqi1cM8dZQbEycMbwrLvfp5pkn3hhqHqZtsIEPO8/Id6zv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pIQjnqbquGOm/7+61FSrSq2vCnT8jJQT5skD9opktHlM+dTm1
	gkEqfGIicvC2aRMbWiq4P7lvRKORYsOgXgQy0hMeh1kGV7DoH2Nw+IPK
X-Gm-Gg: AYBFou04Esnton2TUbyUxqxZgo3Zfzf/XPs3qivJu0rNnjUT/sZ8BLRyFWjQ0YygWKx
	4sox2dfPJscvcK8DhLqD3oC5OpG08knvOClKrSr2NVHGlmKqoq3Ub9qjrFxXDA3/AWvO8JPOank
	OaP3zJeWnF3VqYE1TxQEkSILJ0S3FY9WS8jsW2ctFNoKqdoOpwhQEeN8vW7FwWwMaM37Uvu+7+J
	WQWB6Jj8dBjdC9GvIR+2aPt3oEkYYyEtpV0I9rizE2nrUakXSeYn9iBXLKtP1FdpxHLfCxwg790
	P8YoVEslUmQGXHVI3yNxP7l316NUp2d8EZyIvAG4VDAZnldwmtGKIm06jfy7Yf3vdOXCgqRSH76
	nOlNgb7IfWQ4N0UtflONIEU0pua5pth+E7R88kvIhRftjhA1FC1i4LZHwwNJU5FzHuDmGD5fgKV
	dOnDn3LODKL/ux8YLYQJxJnyhu14Wnuaf27Fnm7pAdKPenBfqHtJ3ZR+2r99kvglK1HTYPhlcy+
	QxtogwRkLCRbWR7PEKGG2ZNLMg99UWRwrW8azGBxY3QbLaA9r1QzFSWPNdy3/I/8Q1+vogXyR0G
	DVvtucTwc/S2wx52xOZtd156mO4pi1qlRpbZl3cW73al6luVEZI=
X-Received: by 2002:a05:7022:3f0e:b0:168:fe32:35a with SMTP id a92af1059eb24-1b25d334fc8mr7817275c88.20.1794073388791;
        Sat, 07 Nov 2026 09:43:08 -0800 (PST)
Received: from IdeaPad ([2401:4900:1c54:f394:91ce:f63f:7155:e3c6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm15306719c88.17.2026.11.07.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:43:08 -0800 (PST)
From: Daksh Sahni <swizzguy76@gmail.com>
To: karol.wachowski@linux.intel.com,
	andrzej.kacprowski@linux.intel.com,
	ogabbay@kernel.org
Cc: jacek.lawrynowicz@linux.intel.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Daksh Sahni <swizzguy76@gmail.com>
Subject: [PATCH] accel/ivpu: Disable recovery work on probe failure
Date: Sat,  7 Nov 2026 23:12:15 +0530
Message-ID: <20261107174215.15818-1-swizzguy76@gmail.com>
X-Mailer: git-send-email 2.53.0
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

If the NPU raises an error interrupt while ivpu_dev_init() boots the
firmware, the Buttress, MMU or WDT IRQ handler calls
ivpu_pm_trigger_recovery(), which queues recovery_work. When ivpu_boot()
then fails, the err_ipc_fini path tears the device down without
disabling recovery_work and probe returns an error. devres unmaps the
register BARs while the work is still queued or running, and the work
faults on the first register access:

  BUG: unable to handle page fault for address: ffffcfc6680200f4
  Workqueue: events_unbound ivpu_pm_recovery_work [intel_vpu]
  RIP: 0010:ivpu_hw_ip_ipc_rx_addr_get+0xc/0xb0 [intel_vpu]
  Call Trace:
   ivpu_wait_for_ready+0x155/0x220 [intel_vpu]
   ivpu_boot+0x9e/0x270 [intel_vpu]
   ivpu_resume+0xa4/0xd0 [intel_vpu]
   ivpu_pm_reset_complete+0x2c/0x90 [intel_vpu]
   ivpu_pm_recovery_work+0xf6/0x140 [intel_vpu]
   process_one_work+0x1da/0x3c0
   worker_thread+0x1af/0x340
   kthread+0xfa/0x130
   ret_from_fork+0x2b9/0x380
   ret_from_fork_asm+0x1a/0x30

The work dies between pm_runtime_disable() in ivpu_pm_reset_begin() and
pm_runtime_enable() in ivpu_pm_reset_complete(), so the PCI device is
also left with runtime PM disabled and never autosuspends after a later
rebind.

Commit 5eaa49741119 ("accel/ivpu: Prevent recovery invocation during
probe and resume") stopped IPC failures during probe from triggering
recovery, but the IRQ handlers still can.

Call ivpu_pm_disable_recovery() at the start of the err_ipc_fini path,
as ivpu_dev_fini() already does, so the work is flushed and cannot be
queued again before the device is torn down.

Reproduced on Meteor Lake (Core Ultra 5 125H, vpu_37xx firmware
20260219) by kexec'ing with the NPU runtime-suspended: probe in the new
kernel gets an ATS_ERR Buttress IRQ during firmware boot. With this
change probe still fails with -ECANCELED, there is no oops, and an FLR
followed by a rebind brings the NPU back.

Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
Cc: stable@vger.kernel.org
Signed-off-by: Daksh Sahni <swizzguy76@gmail.com>
---

Notes:
    Tested on v7.4-rc1 (d48723711bae).
    
    Two things this patch does not address:
    
    The trigger is kexec with the NPU runtime-suspended in the old kernel.
    The driver has no .shutdown hook, so the new kernel's probe sees stale
    NPU state and gets ATS_ERR. A cold boot doesn't hit it. Whether that
    wants a shutdown hook or a reset at probe seems like your call.
    
    In one of four runs that hit ATS_ERR, probe succeeded while
    recovery_work was running concurrently. Probe returned 0, but the
    autosuspend request from ivpu_pm_enable() landed while recovery had
    runtime PM disabled, so the NPU stayed active until first use. Not
    allowing IRQ-triggered recovery until ivpu_pm_enable() would cover both
    cases; I can send a v2 that does that if you prefer.

 drivers/accel/ivpu/ivpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 247ed6b2ff62..4fcccf78ec5d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -852,6 +852,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	return 0;
 
 err_ipc_fini:
+	ivpu_pm_disable_recovery(vdev);
 	ivpu_ipc_fini(vdev);
 err_fw_fini:
 	ivpu_fw_fini(vdev);
-- 
2.53.0

