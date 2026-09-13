Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711140B6E0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339075; cv=none; b=KcVA+cMWN2jLNRu3/w1l73Nvb6G/djfsSV4CI5ngQuQvC1kfpcqPsnZvW0PdZtEas71IUYkyIlpBBXZ9/+CY95Fp1KHkva7fB02owg3wZsgueBdyFGcQfEPOK6FqxMqGEbfCNeh6342aLAlVIMISp5KPfG+zKpsJGvoXuAuBopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339075; c=relaxed/simple;
	bh=3cg8XnTyeUr/ZNUKpH7NMoYPPDGllIHKIhed8WWuR2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAlY132oaR8Ti7V/5b2h1w0ZnSWBEoGzi55EpSkLZqoc0yir7vMwGgF2AHdZ9X27mY9cDS8AbF6W0h42bawtBKlqOc1Wzz7KE7TJVwb/6vGhVKfvp0EerxAc2qlim0nZpwmWxcR4SfnnsvoZRdD7Rpiam2I4yg0mRVl3iWQBR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7MhVYyg; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7MhVYyg"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so19252336d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339072; x=1789943872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=P7MhVYygdmFzUlh8l8JVvhF9xGkdU2hXvdYR7Q0hkawsQX9d0BJQx2e8CBWKxy9iKh
         dXLzBe1Q3j2/k8SF3eMNwhSXJ95+I0Ip2a131jBL+HFEzG1WdbBWNS4jK+0+/j51igr0
         9KVUGn/Vt4m6eAE+3/gQqEASrJVM21OYKGU0H66Im/tH1xSlRlX4x+QALV2OJEQhkKg2
         ZG1SM52L4saxbH2HCKT4dbLC+s2h+UIvDm0Lg7z2y4GS9nj9SakSAh2tWiPB6q5LZHXO
         4kz3y7+Fb8fMKHxcLRwtZnUQS00fqIONAkQhI6Ert14jb0h6F6wjiI4yDAq+F1iDwHnT
         4MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339072; x=1789943872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=jNsgJObXkBwBo88C6c6uN7HeUk7ZzhoCrFJN7RqveTNCBRc+tTtr/jll4pnjWFECab
         oztrGGpwJIFNgk6xj+zQeL3ThGOfvVFub/8rKYtET7JCMc4fat71dSxUA0FySY3LxgDI
         M5lndoxKAh69UQhcADFEtY8xloV/diExIt4Vs9UkLCbUCaCDU7h8UNy7BH6OvjwT+alP
         NvnCQKlb11DpeLMQQNAlRCqjhK39r0IWXpTWM/bQmcL47hYwo3GDNAwVurKjsghMXS1C
         JXTeg1DLESmwO8S4PQ1ua4FjIev15i8OfyraBnd+EhjAct9ffExwjqjPNfjFcovcNcuw
         Rqrg==
X-Forwarded-Encrypted: i=1; AKwUvBxtTVJlHtq3abdwINg0WNy0xKqc89Qlm7eab2BVo7gzrmW1l26iTf+QooSngCMEy0CbzFDkAqf7hWuBOt8=@vger.kernel.org
X-Gm-Message-State: AFuF++l73ZJP9EZBP2WLKZZlSEU4N2zxqF/A5r2C4+nOnswhn8aykrWa
	jq2FpDA7yxuR0z00qqWH+TOHDhQl3esNAdrwVdtBVLlmzsmMbRWGAB8=
X-Gm-Gg: AYBFou3NfevqxeZYCX/uv2XbGB43RZTTHmLRzk5YmA3gEgWLPlqIMaa3xPpPhC2XnJP
	+zLRZ2bYoQkgmJLRLaTXOGoIFG2/p53JmnB6U2j+PwHB7PoNSD/cKvn4PccrSQ3j38JcUikne+a
	j/bmuA6x3LGY9Nufcw5i/5JCrk3bZv27WGbYrKM0X0ywC3DzsIhzB09O3m3YzBhGamekigkmVmg
	pkVTl8yKKLr7WBbBn+A4JtruXZpqBN9nFZdRL73aAikFWPL1nm7tlPcYji/kv/8APPrEF03tPJn
	evvn1/U/yRJHhVGiuTAT4qAPUtzXdWhDh5xhgJSz8z5uqNmX5dIkDHIpkZGsepIhU5M9QHKysYg
	Cw1KH9/yKcGbopLuLI2Zh+JTx4y1B6TY3U1fKIE5Ydat8Ys7eRCLpfX8uYRYQbPhYt8nIJORaZk
	+wWZqiNQn0LrBgzi6BTxvbdeaZI0tqbyHHAjU6RY64OLygOqFW+cJEnRmN0U1e2+OtrdtFkRyHk
	r1aJIkQe1NfGFoCin5jHxWtCPQDbRGJ9nzq0xBDLGSSMiZnSfYfUfouwdJDvE6L/KfxIv075SHB
	VJUuvqo/Vr2JF6b3ckWlT34uiLMfXWV4Bw==
X-Received: by 2002:a05:6214:4117:b0:907:bfc0:781e with SMTP id 6a1803df08f44-9122e55673emr2317736d6.30.1789339067037;
        Sun, 13 Sep 2026 15:37:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/3] usb: host: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:29 -0400
Message-ID: <20260913223732.92882-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three independent patches balance the controller wakeup enable in
the generic EHCI, generic OHCI and Exynos OHCI drivers. Each disables
controller wakeup after usb_remove_hcd(), before releasing the remaining
driver-owned resources. No shared USB core behavior is changed.

For generic EHCI, a wakeup-capable ACPI companion provides the capability
setting through acpi_bind_one(). For the two OHCI drivers, ohci_run() sets
controller capability when OHCI_CTRL_RWC is present. If probe successfully
enables wakeup, the attached source otherwise survives ordinary driver
unbind because the controller device itself remains registered.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code. The patches and explanations were prepared with LLM
assistance.

Compile-tested only; no hardware runtime testing was performed.

Myeonghun Pak (3):
  usb: ehci-platform: Disable controller wakeup on removal
  usb: ohci-platform: Disable controller wakeup on removal
  usb: ohci-exynos: Disable controller wakeup on removal

 drivers/usb/host/ehci-platform.c | 1 +
 drivers/usb/host/ohci-exynos.c   | 1 +
 drivers/usb/host/ohci-platform.c | 1 +
 3 files changed, 3 insertions(+)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
