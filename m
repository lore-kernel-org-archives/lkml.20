Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129779;
	b=20GwZmUiQ0Mcb1t3irERi38226r+f4EbxGIYr7EDz08PRmIFMut8T7OzqN/L8KHEyChl
	 Rdjlo5fSSQUKILvOT0Hb77TASs3LraNs9I7VDOlnZOJRJARMQ+Sw9HMRKqooitGYcYCpI
	 SdyBdUgF+5UyKFse8mYS5nbSF9a6xGryuUl4+upH6YNm0k+p2jF89u58lH4qvhl1Bsjeb
	 Dq5n2De/5HE5jJOLtprLKGG+gwOznt9IqCNGEB4hdq1x0hsmZImQleeqd/YSd2uvwHbBM
	 lZ5DPWfwsrNMHTdfFPVmZjvTr1kzJJWWFU+OEQ+m5BeTXXqzgmAwbhB4uiPN+uLzxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
	b=yN8aHtm9ZeJCBAWqnI6JR2jb0p6uRdm86SfFaCtMGGDX4W2vDQOq5Pdo6Rl0bVaETG09
	 l/wunhgIQ54yA4SXULfhcc7TO1F2DdNzayKUA/1qDVAIp5fXr3a5OTI5NnenGNWuPtNJI
	 zmRN4tFTZDnytQy7oajJxSQBt2uMLwLoBTowQX2/t85n7yNhzwP/SOVdaa1ZwxKUfzFwJ
	 bg+x3Bw084wF5n1p1vLvl7317yPHWafF/nGxp4pDH1VDrgZbLOW3usv62QVafjsUrjKsX
	 uB0CfakiTt0OGIgGdej+6cUyrH10M0eccja32IBhXjUxbwpJN++KCogXdfNWQe0j7kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN6SR6ap;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4BE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN6SR6ap
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso368198e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793129777; x=1793734577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
        b=xN6SR6ap5IXfeCgA8OXe2bxckrC1vO7HqetaYx/ySe8B3Ppi/qI1AXBkkfczygyHHC
         WjYGcZJaW0VjYK79le4mWgblVX8hVEFuNnKy+rS4iyIqTctNgjYPby59jB8eMUiCEjnw
         qb87EpTATl9CEj1NEHtVvtHIObuv+iFfMAnov6qjNFoQZdp4xswiq/GHrsIE8121qLe1
         Vo99Hp0nSCEBLKvpMECK09JKe0q98zOhzpkjCIY2HBL1x3z4Ysm+TRrkZYhVI4THw+li
         bTKoJGAc2EVHNXf6Cd/SrMs/9ydn1UIKyVx/eFB2DyQYxchlfNVGt8FyKHCLLJL9exmT
         06wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129777; x=1793734577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeGAm90AgmXouwn4W32/Qv5tF0RL+dNfBc4p7xQPPeA=;
        b=eWwynDpVXf2q0vs6OjQ3xuCICNUI+GXW9ivRCecpPVaXFaCbNrXBqBo2jkoQ0T2iYO
         qDPuapebylP7ERIdgsyDWsN+WDDyVC7fJJRceE+4PwLaPtfYchztT+W7RCSditNJMCWP
         dd4QQL5WgygSiFqNY+YyqnWHGqGJ4Bk5izDevoIGOIoCXrgcSH1d4m1o5d8IiXEU/FLt
         G709sw4zdPC1ypsHoq+Ttnj8FZTJFKRJYQ6j+ZnrQislIpBelWnP9jpQRmgGL/YZQh69
         Z+E1k7O3W1X3UlmXrC0VdyACJiOhwCo23mtPBAGx9gCr4TCV/7NQp+WaAq/d+6ZxbuS1
         ZEfg==
X-Forwarded-Encrypted: i=1; AKwUvBySesCSuUmQNl+aA3R4Sb7tn66BUZygws8TqIv8cLJbie7GuKXGpoFdh6bfY+N8KigTzBzx1ewhZbnnZlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoD91URwNn3Lajm3aId0O8ikrnUadmNP5yTo42qkH1HCCHSfGa
	qgF7rCePub4iSmWu4UtwF6DhoQsCsHWiLZu+ZPhKAP7kgfWu4+/4fXa4
X-Gm-Gg: AYBFou28PeCgpgggnLZCrw9sZ46wGniVc9Fs161oC5Zc8JL3tPx1pqdGYEBUUcK7jcP
	c4U7MQijA86b3yl4RaSzkY6BSTfbq7rtYS22B9QbqT7nbCUWFvvf4b4YA+i0gYLMBDhLMvE512w
	FF4Em1Bkmky1dZsK+oCqpmdqU1hnbvQA5uhu5m8c0BgK+SQYGAMg16EBa2kjiJ8P5jeAgO/UJMn
	oOtaopZVWl/7RZ2LZUuRq1m3OQAktebqT4JoEt1Z322PXXG80+/fcOLu9Qcm+LelyAGON9MTRE3
	k8J2XB/58k6lYeD9qpSSxlSwcAd5TfA4xAeuHXkkRu8G4YVskgvJwPKQtAVKZNilTTh+NEzVGRo
	hIl1EbMTEh7PRkqgWZWt7KYTKVLkSCUE3Nx7z/5165jRVnm10+h2r1sbQt/IQXrvI6A61O5M5Lv
	zJ7gT0+gVY596CGX9wzbRU1bxrHfCLRDGZcWQRhVyDzptQ/oTgkMs0fa0A6hhovEjA4raKicZwD
	Jc4gg0f/eTiOvyd+9esYvTmLza8X/iqO7r7N9ftVC8MCqUATgZFxDh+WFLV39NQq1bunkdH96D8
	Li1o6pRHkEiotRTtn1t2Z/kJ8KdD
X-Received: by 2002:a05:6512:304f:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfcada2450mr124586e87.48.1793129777315;
        Tue, 27 Oct 2026 12:36:17 -0700 (PDT)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5a2a25sm158477e87.60.2026.10.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:36:16 -0700 (PDT)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	lumag@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Fix WCN3950 missing regulator release
Date: Tue, 27 Oct 2026 21:36:15 +0200
Message-ID: <20261027193615.1930624-1-valorcool@gmail.com>
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

hci_qca driver is missing release of power regulators when module is
powered off or serial device is removed. This issue is most noticeable
during system shutdown, since the regulator core is firing a warning
backtrace that regulator to be freed still has enable_count.

The issue was found with the help of Claude Opus 5 (Anthropic), which
was asked to review drivers/bluetooth/hci_qca.c for the appearing
regulator warning backtrace during system shutdown. The fix itself was
generated by the tool and reviewed by me by applying it, building the
code and verifying issue is not reproduced anymore.

Tested on real hardware, but not on Linux's master branch. Driver was
backported to Linux 5.15 for internal testing and this is when the issue
was noticed.

Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..e22e2269efd7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2247,6 +2247,7 @@ static void qca_power_off(struct hci_uart *hu)
 	power = qcadev->bt_power;
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2271,6 +2272,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2582,6 +2584,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_power *power = qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
-- 
2.53.0

