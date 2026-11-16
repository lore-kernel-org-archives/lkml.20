Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846395;
	b=HRlKmh9++WVFpInNEscskYIPkKhw8eHobDee7nI48eLDgCHc15yvusKFACuNVshVpn/t
	 /zlsSgNL6e04bUVoDyuIzP5jp2hlDaqiiy3Gz/5LtXE275HFi7/+jF1tYYM4wTjCsrQkf
	 FLx9OEL8jRdNfz6YHrRBv0eRBOGklFbJaQB6MAESr+7xiFOPI1yczf0d7bq+aCEJ4cJqp
	 275qIlqHVyALTWOKqtM4miKJNL7KpVyABhvgMfJWb7cIsfwpQnlKio6KdvndZa6zczxaG
	 YXQybabBJKFtUBNTVv9UlkDErDaxj8yqYoZWrr+gVISEX/Xu7YYtGePYVB0mOkcC08g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846395;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=0LDtyOaBPaCfHTwJNyj4KDFIDjeAApU7lcCq8Fl6tdM=;
	b=Q2L1wT5x1msCTDp5vxApiCcSM1fnVFBglR+49UB9dEg++pj9hnSYSiDjLwuwM36Or7pX
	 yUw3iZry1GVMa2GCJtxkkVt2lzSecN+yr/k2sK5uKuXQxud6MsLXCt9ZCfqpTijXvlt9y
	 z9k/qVWASX2hMAku5ZwGt4X3eqexv9kUNXtULlDbEBytwmwcvJlklbVNkpqtDYZZl2kLY
	 cwz1PJvBccZduCLSQ2xA7seZ1leClqItjFxHEWgT+RfLJPbs7P/6PSzdf8NhBEJK5YNg9
	 Lo+cYCMkFw9Jrxl+a9G+arofzZZuoWm24uCFmASvPGaq8XfALocAilQuQSbgfYYmMdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=XEt6sPKd;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC3606A323;
	Mon, 16 Nov 2026 16:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=XEt6sPKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794846391; x=1795105591;
	bh=0LDtyOaBPaCfHTwJNyj4KDFIDjeAApU7lcCq8Fl6tdM=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XEt6sPKdfP0jfg1Lt1GIAcnwvtaqGomIJXOwWUXbM+CuoYSU6/uQMyQpVrqZiNZYB
	 Rg3e/B6KCDpIOM7O/HXzK6vPqJRoRHViazVeIWywgqpvHa6o7qOZXKAhmZ2qyAxxDN
	 FOR0i5dmDwhFkq/K97onfKXS4pH2WOJo22KFFiPEJzVcdYzKMxwIGDWEbhWKbC5/Mu
	 bR7HuyCKzF/hDgpqHFTpNDbcmx9APNjrHOBsqHur+IBaM1rPfx451f9AmMeMa0dUdf
	 C7wUdCEldGOCE1sZtwIR00zjnXbjofvrQWvbjoz5PXWPeGFzQgHZGwhtvaBeTnABXB
	 9dcL1WtFrx5fA==
X-Pm-Submission-Id: 4jStXh2BYyz1DF5G
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com, enderaoelyther@gmail.com
Date: Mon, 16 Nov 2026 16:26:21 +0000
Subject: [PATCH v3 0/5] Bluetooth: qca: Power off WCN3950
Message-ID: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Zhao, thanks for the review. I've split the serdev unregister fix into
its own patch as requested.

The final code is unchanged from v2, which I tested on my Moto G10. I've
also build-tested the standalone fix and rerun the regression tests.

Thanks,
Michael

Changes in v3:
- Split the generic unregister fix out as patch 1, with a stable Cc.
- Keep the port-state-dependent TX flush with the QCA power-off change.
- No changes to the final source tree.

Patch 1 applies independently. The remaining series keeps the separate
Marvell port-lifetime fix as a prerequisite, as in v2.

v2: https://lore.kernel.org/179468159400.2456.8302096233933976388.wcn3950-poweroff-v2-0@michaelmcallister.org/

Michael McAllister (5):
  Bluetooth: hci_serdev: Unregister HCI before freeing the TX buffer
  Bluetooth: hci_serdev: Track whether the serial port is open
  Bluetooth: qca: Power off after unregistering the HCI device
  Bluetooth: qca: Handle failed power-pulse writes
  Bluetooth: qca: Power off WCN3950

 drivers/bluetooth/hci_qca.c    | 35 ++++++-----------------
 drivers/bluetooth/hci_serdev.c | 52 +++++++++++++++++++++++++++-------
 drivers/bluetooth/hci_uart.h   |  3 ++
 3 files changed, 54 insertions(+), 36 deletions(-)


base-commit: da3cc02587c629420603df4395179ec82955c941
prerequisite-patch-id: 517b9cfef6a60777b0869a8f46d4c07be7f77c13
-- 
2.39.5

