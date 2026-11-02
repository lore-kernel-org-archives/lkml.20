Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627976;
	b=aU+HxQ29jq3SLmAWEuqZQm98+Z7LlHg1ee8nb0qCUAFsxae/ClBh+s082hFm0hkqzkBd
	 V9pUazzg1gITRj01lDewqa10dYYFLQRo/Rqcx7KzlX777tnQtN78cIfiY+z6ZfDOMDBLQ
	 VXi1HJk3iFcLDYZVgfKZlu7CgiX4nCpMCv/jpCje9Vvswm7RVx08kdk/XaSGCdp8d591i
	 KDk+QyR/1rhZkgjHPsVbriq3M6j4x+PzPT8RPI5dBHZ/XOg7AUbLgZV26wvYHxasztXRT
	 VgieTi4bNnSSEnOsq0obQISLYECil0RuMNHWJ6i5Z0UjkB2cXmVKtZ3lwviZZU49Ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JDW3C0JG9F+VgV3yAEYWd1Rq691qrVYJKPbnw+u7tgM=;
	b=owdaiCNJ3XSIOQwoktrCJ7ls1zif8euMRPsgyHeaWdu806yqCtNT7gHVkVvgC+0gW0FW
	 un7efx0FE+/XmfyaqE/S8G9fVFBOe5rsFJJvCjQALxQFJqEV955IUzF/VqR6gHebbB1OJ
	 BP4LPPLF4lHPPFKyX6xWGCr2nV5I+F6K365nK/Kiqiu5tqtHCoE33JZvHe/N+zzaDgQWG
	 BRSp9r9amzl7MYKmDdgG4GGCKCsZZv4uUBY9ZJ1B7lJCvfXU4NtX0EyTk+x2p2K/yb9nU
	 KNl7a0bpO0I6GKfbFSdn+pvsh64gFf669tjcfsgEO3GdkVKQqhu0KxxG6QVPP6c6Hsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXFr0qft;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06860A3816
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF06860A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXFr0qft
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso30213055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627974; x=1794232774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDW3C0JG9F+VgV3yAEYWd1Rq691qrVYJKPbnw+u7tgM=;
        b=kXFr0qftq8TpaDfhB3HDXokLdzchLcJzDmVA0zhPPblEpo3JTgmFsJpojcN/BHrZ9G
         3WSwIF35i6AoJfSUkrD4ytMa754Sf8B8AwAXG+pw/q71WkBYxqL+SyCAu2gpTx38JadK
         +Gla5T9a5vJdXM7PYhInRx6R1gZK9IwsKw9XVzamXU+XL67sKpja0v4JCaf1VYVMbsJN
         YOiUvDokYHkWF1Lsm21gaeoFrw4wSeBcF5hvw2DJot6QwqBFf7xUaDuLrGCE4J/4Y4S2
         +Qm6qYH545glnEsHbBm/1v7TsObieZnz+0OfrMW7O56D5pFbNSxQzi2/n5DoFIDix8Op
         rC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627974; x=1794232774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDW3C0JG9F+VgV3yAEYWd1Rq691qrVYJKPbnw+u7tgM=;
        b=zo+luo+rX+lZiPwL7ZupzJfABSXnKLWCAH0WtiSc7aP0phCqFe7yGxDP7AAe4RoarX
         pzFJx/d0tAYzI4FrUwxFNebiXS4zTo5ZURKHb7hdQcH3wXyTHragrmRlWig7SyIzN5uq
         KteT/BJHuRpWmeMtwgZF82Oc+ay0IsOAAKzatNFBfNlm3sd2KwmJtEzDEsNKht+SzUjw
         dTfiJkuNl1yqzJ0KlnCHvPJXv2CAu7UFw35kVGFYUyXf2nWaBgd2rwDaGEjO6JRGYGca
         yGjZjh6Pb+NxlNWiV+4NmnvhV1vEy+/LXE9hMNK/dpH7kRvc1I43tQQMEKgTaCG/kA4F
         PyqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU7r42KPhhuvhRkZ1+zb30xNAwUuq4VuM+klZtJtflmoKHJzgRWq31yVANibc0Qkzd1w+M81b7XQaEjYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAm/Nh8/Umh9L7696gWWf0xNOvfkTEV9cVszO95OklrdY3ZGBl
	dOzd9BaBnxXA1Y1i60sPI6C0Ql2dqsBcWQP77iV16/408sVGwMBjKsI=
X-Gm-Gg: AYBFou34Lm4wbW7GtIa1fQxHDvkPJ9z6spkI1I33ghaKprx8fRESYbUfWkR2dEZs+hA
	1a5/Uib51oeAFHMblG+NrFR39Pbri6sY7CqBcARoCmgSPEGKYU54K4bL6jy9gKYIIPzUFFemWWg
	DkZAOyNWiZ3srPa+uHcd4kUy4011mJfGJmafWvcw9fG1BOqqkj0CDt+e3wPBEJe3xnLHG3rwzn/
	UqOg65x06kVGlmPsWoYjX8AMrDOFXnyJvlw9NtvHo+txAJztBTtb5cnht2SLe3Ar8ff9cP+93VD
	SUbZM5mMfVX4V3HXsaHYDWXjO93xiA6oGvMQqwXzrG/+AeIH+lw+Xmbm81jtbMP/ndWTD73+9KX
	//3fUxipaeOJZ6cMZAd2Md0UTZkLR1EnF2IE4aQz0BBimD+fLkCi2zaz3+Y8MAs9GtnksbqfyzJ
	Zc+HlV7JV4awc80meb/UwzzaKpL5FqJ5MXz8Td9QPlrcpburI9nFVkWPKMG90tmF0UUlfVyD0KO
	VGcM4exJj6iTqONbww1l/fCyRsI7d6WuPENoBF0lqYUSEw3kwiJQufsXCoXux04VkVdDsq8CWnM
	CXDtsO2h208=
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr231274955e9.27.1793627974216;
        Mon, 02 Nov 2026 05:59:34 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm352680265e9.12.2026.11.02.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:59:33 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: briannorris@chromium.org,
	francesco@dolcini.it
Cc: bzhao@marvell.com,
	akarwar@marvell.com,
	linville@tuxdriver.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 2/2] wifi: mwifiex: validate command response size against buffer length
Date: Mon,  2 Nov 2026 13:59:30 +0000
Message-ID: <20261102135930.701845-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102135930.701845-1-tristan@talencesecurity.com>
References: <20261102135930.701845-1-tristan@talencesecurity.com>
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

mwifiex_process_cmdresp() reads the firmware-provided resp->size field
and passes it to individual command handlers that use it to determine
how much data to process, but never validates it against the actual
response buffer length. A firmware response with an inflated size
field causes subsequent handlers to read past the buffer.

Add a check early in command response processing that validates the
declared response size fits within the response skb.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 6e04d7da62179..f59b53c2e7b5f 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -821,6 +821,20 @@ int mwifiex_process_cmdresp(struct mwifiex_adapter *adapter)
 	orig_cmdresp_no = le16_to_cpu(resp->command);
 	cmdresp_no = (orig_cmdresp_no & HostCmd_CMD_ID_MASK);
 
+	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
+		mwifiex_dbg(adapter, ERROR,
+			    "CMD_RESP: resp size %u exceeds buffer %u\n",
+			    le16_to_cpu(resp->size),
+			    adapter->curr_cmd->resp_skb->len);
+		if (adapter->curr_cmd->wait_q_enabled)
+			adapter->cmd_wait_q.status = -1;
+		mwifiex_recycle_cmd_node(adapter, adapter->curr_cmd);
+		spin_lock_bh(&adapter->mwifiex_cmd_lock);
+		adapter->curr_cmd = NULL;
+		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
+		return -1;
+	}
+
 	if (adapter->curr_cmd->cmd_no != cmdresp_no) {
 		mwifiex_dbg(adapter, ERROR,
 			    "cmdresp error: cmd=0x%x cmd_resp=0x%x\n",
-- 
2.47.3

