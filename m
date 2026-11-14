Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694865;
	b=SaXPfT+m0uibYTsjJhFZ3gFybyiPYk3qqzb2biOnT9agoL3n+pS9pOcaVErgBNZhH2nl
	 DkBwIyM8WGwjtHKAztgR5rIIGLjtfMzdNrE71398LpT+nxqtNcO0r+KQrELUcgkUiVMn+
	 FgTbP5RVHx+H287TOlZIHjUU4qQHmenzBs8orRwdOMnFrPmg8EZXf0NA4CpHOvE56sNtE
	 OfiqQHrgLXqTW8mPfY4b5mSPbqOMDqnpfsfN4OsOvR2E0t5S7it5GLvozUdOb5Y0lsY7C
	 7vzQmuqj9jnw4i/VasEzpNvsA4ainD2ZLL2SUf8NTMaHa1irGilxfF9qx79Mcv0GWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
	b=d4r8nfH4LVgaVAeNTVRiy3uPOsgYrRlEpkK1Csfw9l/JuJrBPmDdUfeAlYvJfZiD90PR
	 ghCtqTCHVnY8QV6xglrjCbsNpTwSIkzXjiRKb55TwhFp0cM/urBwNulLvfslOgrxWkFQ9
	 9/zqFy+Z8im3UHkZR6diOTw7YXXPqUj+sRRwLxGSASQkN5xPaN6Te5sXDIdToa8z8ASCD
	 U/y4QSbI7yOrdpBXu5E2oHBfFuAkFGMZpd859ZJwhG0QowxwVbJ1Us6QK2d+4nfzV2cwX
	 fw+mg41dFyX082MufAG3C0al0TekYY0a26If2nYhQSyJc5A3IiA/3jHlTMGw8c37gPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=grCm89YS;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18B606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B18B606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=grCm89YS
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so413103766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694863; x=1795299663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=grCm89YSafaKGhWHnbOdmcBQQMZBIzYtfm8nDeinL992rgXWB/pbuEntRX0jIrmrrX
         PHPfahVC3Ti+Fa1TevXOwpId57jZnGIJefsfetN4UjrB9bA961MYSexkIPrhrfEKcDKj
         DezlwCmJSKLJnEwCvikf7MrIRP3SNxqQafscYjLeT/yRuc04XmsrWnu00so378umfqBS
         czPjwEJF1q5C4QhzpiuHehLA+ge7iWAxFmvtnrRKB8A78W2llyzjAxWxHaQNc6W8XhIy
         bmXk79wbXHULh/YcSC2jtTbS2+ajIbemmdnyP+5UXWySIGfqB45UUINNIk6ppQylJqO1
         5OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694863; x=1795299663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=Oq6NhTtKu3yMS99oswp5J8YPTa9IU8dbfjmgSGc7TGxeaKx3/0pRzZWM8LkGdTlgM3
         kdJ1nRMykxpgFdZDeCV2Mw5O5Tq67yBrLAH3jk1dz0eODWREv0+wp7/0vXc7kOPB+UDO
         Nm2+fn7q50Eb/eHCk7mw+PSEdsI8+f6YnIw2lDtr31mLpcMWf1xYy2n9HBiZMsT/7tOE
         G3UZLoCUDn4O2r8JybSQbpHkNDbXuyJlWAmKOUD9faUMXr6orP2/i+Dpkh+Z4vSS27ym
         Vyj79u9+lqiA0ZHWH/3YFDqbPVUV4LejenYMwuY6y8l4dqjGy7v3u6nLA3RxkOoU3SxS
         7CDQ==
X-Forwarded-Encrypted: i=1; AL+hErH0c0NUvFZLbV+HzviFHlOBhkmbkwwIfAY0Ve110r/wwFaUmtX+5PghYY2akW/djXUVfyLQUIGrUeVf4Gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XuKW7sTsdcI4rscp1GJekbR5DL7eg1cuqyvC8hnKDqPixi3Lf
	7VLv2QpbfLqFuvgC7dRrjhCwKJM3pW5rqehX/xpbIo5fK1OtVVL9L8cEnwCO+PL+oA==
X-Gm-Gg: AYBFou0+tUnDI3qqpk2/EfQG/11Te6TCb7IAjul20G4AIkPMFO2aB+YOZEEH132HIf+
	7gI2w9s5TMCamaKzAU02DVuQzccPnhgJAXTZ1HOowjYYoJCV1Bnuhap8J92iPu4WDNTQuVu8eXZ
	RHJsrtGjZXu4sodZnN8LG9GXMUsRvtWgLXZ8HBO8R3JI/leSRAed30Kqkc9MtT2uwB2riFfY6e8
	GejpMbEZSxsXMrG6sGcVnX5JnxxmAX7rHNr1YipprEWPfV0+dBLvpcj3N6b/L/ubkShHh+ugS7Z
	RiYCOPhNCjeyFQ2OrwQrI8ZJGYFpiAY7kiDVpMSvZrwDjR7o+AEb2VSKWDnSkgesI1N7LoaQiJC
	QE+lWk9k4BVwS+C1InNTzj2LItPWaxyyws45x+8HCOrKyAetbs8aYOUF41gJjUalkVswzjk3GUS
	DztP2vGyxo+8r431ygm4kkbtIfSCa0RU7zK3Jl63XAQd+uLVUl6FhAhwQZUN0l0FHRg2VR0K7XG
	8qbAO2eRQo2KorCXYXzKBnBIn1hAj/3x3Ls9mPIQB0Mp/MAdcS5RofXb8irBBop0hpoYqYN3ofO
	UJrf4rKRnj9QbAm8Ladb6hvcLSdsVqxiJAaj9Q1/mfoQ8I5oMMzyVcoC+UVA9wF7krwBku5KhG6
	ZTQmUPI6ZUgAgUpnrhZFL/qAMSMV+hyc5vZVK6hi2/tvs95JNFXKJmKGbVQU2bInaW+j+mdAYae
	Is0xq8kQ3wefg1Jwl/KZLltmv3kc3cb2DThRShkAkW1Ib+QoGETuAEC90fgwIx29es0LWnECosI
	lWJsEonV71/e+PqOU7a29kkYuP7kkxlSHassHrc5q3J35enombkWvdq/+VHW39zOi0FL+TUvCJH
	BJG7ZnA0RDqyzYgSFbOkZupyAY1m0CXxtsbSoeZYtLb+5qmB/YKryt6RPwIOpUqk
X-Received: by 2002:a17:907:a909:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c50963777b8mr508487166b.11.1794694862973;
        Sat, 14 Nov 2026 14:21:02 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:57 +0100
Message-ID: <20261114222058.184034-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
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

ath11k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, as OpenWrt sets, the lookup of
a missing file falls back to sysfs and sends a firmware uevent. OpenWrt's
procd hotplug handler answers it and logs "Could not find firmware
/lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin: No such file or
directory" each time the driver loads on an IPQ8074 device that ships no
firmware-2.bin.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Closes: https://github.com/openwrt/openwrt/issues/24743
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new 2/2: ath12k has the same pattern (Rameshkumar Sundaram's request to fix ath12k alongside ath11k)

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index ef1b4c81843a..88ec2ffd9f00 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 	struct ath11k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath11k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0

