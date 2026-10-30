Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398113;
	b=vCHrra+7sWMFy7ygnxZZLKqzwb8vomKlYx9fwvnwI/kLfE01+iU4wKrhACKDlIAKIyI3
	 d+SKhmLaXYJL2fd4BXeLGYN2vQn0SIzAlvqaflcMyCWaG1mszfaKaD+uFJ6pFL+aCvHoG
	 qTCUWezMpBC1XbZLwejBGhqm4GRG26jay2ZPF0JcnlbOUqUKxOYTf/jERV9LHzpuqGFQ6
	 WojGRyyhlNaUIPXtqil6l94rFbVjzdr9wVcQi94i6+P8EI9DAQ0emzKlrX7rH6LOAWuuJ
	 oFkouMKbjqowAUaa3qIG5wuPgiUhRawI9NLD2eKsro9r+cakFLrvL4uzapdeVDNpeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=;
	b=lsYHNChpiaNpp7tH/vmhQSnV+3W75uZeYPyNAQBagnn5biYF3+5onKz6Dpo6oYXy5qgj
	 mAMqlVqm13ZjYt1WKOjVjE6Q1FLY5T7Dv9zU3nfZFRvb4qR29YHZLMT0JAuHKbxmkGjEn
	 8MLmCRhLz0QinKz6Jg8CUXJV/0T6kcW3KtwuIXMHj4PwLa1oKgOgXrgNcdBFrP2nhwpbl
	 K8Z3I95wIME6A5gRsDxkKDR6EnfYUG/rFjJPtRcWnTSz0sS2Glfp2PIhVzVeZIAMY1l2K
	 +LqyPUzuYtbe7Jp+IwWq6fPUTSaWHRuRMDds7xDoIymwEowG/ZZ+oHGCTvBawY7WZjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5ROq6Fo;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A00606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5ROq6Fo
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so9707575e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398112; x=1794002912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=;
        b=L5ROq6FoGlq0fHySlhzwU6d4RO9R/lvJjXYtDrQ0QrsfGtYJpwjHBNiFyKLioh5fsd
         5xAxJl6zabb5Ss4kqp0z2tH5sddoM4CqcDOstWmLffmsBFFcwMFsQVmcOzfZ6jENPo12
         pd5UrGVf8Z+J8HAE4m0TucLSFCAXtyF3GvL/GHBT74UzxUsgyKsj5WzwtPTmDw1wjPcn
         G58+dDNgwkezAHUSgG5NMeXzGaUD/MtLE211Rwam2+JmpQM0T4hC8e/77yCex8PV0+nF
         mQYeFImsn8o5PIbb7Ovb1MwHzuU4aTmZbzJoYRz0JdyJZilwRzFJ64agkrYmRbOF3YTw
         OobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398112; x=1794002912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PupxROefZP66Lbc6uSw6pabAOiXrtuAPfPVHNPe6jA=;
        b=DE8VNYRSwbUFNxzXOU5qObj8/PXqvNbWEg3Ke5oNmiBdOcpCwerpydE2qqYR31lhAX
         k2qQr/sCmjkSYUNLf6/6iBqvGjvOQORx6f4EoitR59zHVqINcf4CsanemXd/cw9cgQg0
         fOUaa7nzMpttcAXDGpipjWt/k733PgY6Vk7shc5e3FiCW5a1kv+wPB/NAdBYk3pf5J3I
         06gxlPAbH0umsUKLO5kzSDQTFPdJsTdAblOh3uCFaqgQsm9OZM/SK2quulgT3U2bkyik
         txdwGYDtCuoC2xGZy0oukZDGDddSPcJrsfOleZvbpVDB/tguXE9PasMDwY8N0jetexel
         fj4w==
X-Forwarded-Encrypted: i=1; AKwUvBwfC2vHYczD3ndyVX6NXGD3iiH7lZXEJzJGMX4p4PMHn8j18Rfa40d9Bck1qWfyvo0HCVN3MeAs0ONSEEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe2hcfa1eG3a5XK3XqU69M5WaQKImPDKT3p6UZN1DMAFrjhHyV
	R4lSs+h25z1f9sl/Fpxf0Dq+Glo0maN6DO5n4k8bz4+fuw9EHM1RgnXu
X-Gm-Gg: AYBFou3193GHGrvdxJoqizd/gMHVQvK3OLCI+sLswyPUQ7K3/joVfnTTS/sRtAI7i4r
	Nie0f84it+4ZPKw+ugfmDCVhUL808hgPU2UAOiq9qzLCH2ubZEiF9KcP1KxBSQSN40yGa1NSCpk
	vsgdprs8s+8YEEInCoBeXMmDc54dLt64t/125xL4wr9ZI+47vk/XpdNHjA05w85aUjOnzcwZRbw
	vQNxJc0wWENM1zRlKcaEPQfHCs7UEc7G2GQlgbKlDCpJ+Fk03TjAH8hshq1YYwrgRbDDtAJSx3V
	gcIZw8v2jzCbH1RFkpeUbuxjIUJ8qejllg9cb1neN3GgO/082VcNgO67VsyiFJVAD6ED4YFqCDQ
	DU3AhOkC/upZTQDb+9RteEA/C3QFMITMYuxjwzXBdk3qw89rORJgVJ6dku93Zr/LLa0OXGY1/Ev
	46bfQr6nLZ95X9qFcsiglTwXjWelpbtGNEfBzlveQ3oyqDCOICRjK7xT5F6Z9vSzfzCuMpb6uBt
	VXUwcpGZEvncK+sc8yvefyWeFwMlubjU5uLJIYFH8kw/WLKUnEgEoYFF6fjApNqlHx5vKicx4LU
	Z9kv6Bjiikm0cu7pDxIexBLn8/H2/il/MzxoaMwBE4KyTYqtTEtS6/VGosKbsd2e8+L3nwV/TdG
	pqVnZA8KugU8NbXhe3VRcP2zwIDvDTITr3QqAIZ03jtte7PzeuN518sQdMg==
X-Received: by 2002:a05:600c:6387:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ac1904a81amr85938675e9.24.1793398111701;
        Fri, 30 Oct 2026 15:08:31 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:31 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/3] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Fri, 30 Oct 2026 23:08:21 +0100
Message-ID: <20261030220824.915760-1-gsustek@gmail.com>
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

With QCN9274 firmware WLAN.WBE.1.6-01243 (the newest in
ath12k-firmware) the driver logs three warnings at every boot:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

The firmware is not at fault: it requests the AFC memory region
(QMI memory type 10) and advertises a direct buffer ring for CV
upload (module 2), both defined in Qualcomm's interface headers but
not yet known to the driver.

Patch 1 allocates the AFC region instead of answering with a NULL
address. Patch 2 makes the DMA ring capability parser skip unknown
module IDs instead of aborting the event, and fixes the zero-filled
entry a plain skip would leave. Patch 3 names modules 2 and 3.

The idea of patch 2 was posted earlier by Nazar Mokrynskyi:
https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/

Tested on a QCN9274 hw2.0 PCI board (single device, AP MLD on 5 GHz
and 2.4 GHz) with the series on top of v7.3.1: all three warnings are
gone, the device comes up with both links, and there is no firmware
crash, call trace or IOMMU fault.

Goran Sustek (3):
  wifi: ath12k: allocate the AFC memory region requested by firmware
  wifi: ath12k: skip unknown direct buffer ring module IDs
  wifi: ath12k: name direct buffer ring modules 2 and 3

 drivers/net/wireless/ath/ath12k/qmi.c |   17 +++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |    3 ++
 drivers/net/wireless/ath/ath12k/wmi.c |   43 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath12k/wmi.h |    2 ++
 4 files changed, 50 insertions(+), 15 deletions(-)


base-commit: 7b14c8f4a9615579b09cbcdc4515b65ae6124753
--
2.47.0
