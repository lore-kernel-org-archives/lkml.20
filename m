Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B138A729
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116656; cv=none; b=nD/a9t9fQkhDrVeuQ7X8artABrrhBaa36YFf7y4hsJxuQ0sJiaVq5fAlDgtVMxrMjgnQqaYhOaWGIA5yc8ykFIutjKI7tBEPym1nJJlvKUz17wCefkAlS4g7Ffwo4aKR0gR+aYUvVF7U+qqARwqRUBGfHggQti2lTHw1WB1atcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116656; c=relaxed/simple;
	bh=KW7Gxhb9Rs7qDsVvu/Q6QOOYw2rabRWMk5SbCksXKzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6wKhSkMcmwenmelCjmZe+OlvBbDtT8eg5M5MWeCD7kIhnOCla9WNzDo39Tran/nb8KdXH8swuNi5kkCD9eG01wuuwQyHshAPckgQUJb0EJUfbouQ9R3VcU0fbgV0kZLVwDoZNdmuMWx1oCoqSP6jo4lDxygMCYa+H4QX1Lx5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=eb1ZUjcB; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="eb1ZUjcB"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so4869427eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792116653; x=1792721453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cv7YGJljtETyHQvSebav9gk0BxMvhnrylSgDpKzc0l8=;
        b=eb1ZUjcBOQpCvH6YlIrE4Nbd+BbLhike/naXXFfZYDLEKxkqwFtS7mHeONUl1mfOTy
         ugys6CgeQL+rv5WEb4kkE8oD3TtRulRoHLHUtB6ev+uMIf8Yeu35/DUKcR1wxYTZ9c6X
         qZb68keuuwpfyEsvjh13cRqiF7ZRC8FHvlyFp5AVKfyz66Vdf+eGY15GO18qJTJFx/VP
         /q4nFquEjqM81gHRPw5v9jZn9HqFY+SXutmS//HY2mUjtdPsC5FBJJ3AH7oQFwGPVtSj
         xdsV3yIVVEzMPPE5N0/MkE5mmqzIYyyZjWJzOxNAYBcU+HUWP0q11awxxTsxo82RNRoF
         lt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116653; x=1792721453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cv7YGJljtETyHQvSebav9gk0BxMvhnrylSgDpKzc0l8=;
        b=xM4fwtuBkJFgqWNTIZ7V8T2aSbhBa6crDIjKK4tWR+ZqbRyxPpDS9PkYvxwHM4e9PF
         R8u8L5QcTkSns5qwcbUiHvcmSWlRwMnBzTJbfxQAxgmyaNZYIHXMOsHFmO3Ti0QZxbxf
         Kt8pz84mMXpE3nFntHXchWgPcji3QndC00O7ibAU6wV0qwLcjfi2if9TKK9pjPuRY1M1
         IrHH67iErqHvgIB8T6NEIEVnfwFZlD1f4IFzMFcAmgZh51e6Inv943cjKPWX17d23Xhx
         quoySHgwB8j2QaFc/Pc81zyKyaABtMmSQl+I/qFP+sUK4a4F6xBGlY50S2wMLOglSMw+
         qJ8g==
X-Forwarded-Encrypted: i=1; AKwUvBzCJVbC4+/JuLnvky6Rh/C4rTgxKqRFjonMY5dq5/RVf4zklK7ZQSnEdU1bGKJPfEsotVep38ta2c7CmJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6FA0pN2jKW5YC94ggmJTpQTcvz05HnA/FLf7KaqmMErbzNPn8
	bujETWvFFYAQIXR8cQF/XzaM24Ec9fB9Bh5itHE8nxO1WbkcF61jZZC6rBdkR0FrW0s=
X-Gm-Gg: AYBFou0DrfeqhJlPpF4zaXPKfv17cwEjQW3747gfJ5QM+DhMQRDs1/3hvqSH7tz0Ytx
	jgH71vLjGoYkZw8w+D6oEib9AzgWgu6RMKltQe6izrc7d4lZlyXtx2heP9Bw/M7sfg11NZQLWPR
	s0DlF/O09qtcjLrdo9VVRSLvZo1ANMduU1E8TA7NdX3TWa1PuPfYs1yCziLz2Mw0XZ64b9sNuMP
	67u+jxPnqOwejmpkn+3gXjUjfrCQUziURcG++9aVboJcs5ekNTWi5WpyDurn6P7OkZNvS+ge+VU
	s4Sh9r3MKXLkNljbH1Ontv3XKRcf2loWxB2vkMUK9woOA1NxARWdnx4mwt96T0S0e/ZPxL+CQwz
	6Aia93PSyES3jPLd91y3RZgdHLqmLmzEoSf0AkEIAZRbMj9s7QyF0IX7BjQxieR9mwQgBeVnp1v
	2k1Mn6TP1P3AmzF27E3Ppjr3IaZqgL67Zpkdi2GgZqT7jYXD3/1EtBtlR59knPlSzNZipBl5Y8v
	T5VOCvRgXTeIwl4S08VJQLWw9qaQySHGidauEktvXuCuBQ/yWSzf7i5v95GHHeDxg2nSSs=
X-Received: by 2002:a05:7301:6e9a:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-358dfedd5fbmr22336352eec.5.1792116653426;
        Thu, 15 Oct 2026 19:10:53 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm2638280eec.28.2026.10.15.19.10.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:10:53 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: halves@igalia.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org
Subject: [PATCH 6.6.y 1/2] Bluetooth: hci_sync: Set HCI_CMD_DRAIN_WORKQUEUE during device close
Date: Thu, 15 Oct 2026 22:10:46 -0400
Message-ID: <20261016021047.16461-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016021047.16461-1-artem@trailofbits.com>
References: <20261016021047.16461-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heitor Alves de Siqueira <halves@igalia.com>

[ Upstream commit 525daaea459fc215f432de1b8debbd9144bf97b0 ]

Since hci_dev_close_sync() can now be called during the reset path, we
should also set HCI_CMD_DRAIN_WORKQUEUE. This avoids queuing timeouts
while the hdev workqueue is being drained.

Fixes: 877afadad2dc ("Bluetooth: When HCI work queue is drained, only queue chained work")
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-63974 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 net/bluetooth/hci_sync.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 607667cc357558ffefa812e1cf001ca923fdbf78..0c96e048d8816016c44f8d1b90c99f4addda8ed8 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5349,6 +5349,12 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "");
 
+	/* Set HCI_DRAIN_WORKQUEUE flag to prevent queuing work during
+	 * reset/close. See hci_cmd_work() and handle_cmd_cnt_and_timer().
+	 */
+	hci_dev_set_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE);
+	synchronize_rcu();
+
 	cancel_delayed_work(&hdev->power_off);
 	cancel_delayed_work(&hdev->ncmd_timer);
 	cancel_delayed_work(&hdev->le_scan_disable);
@@ -5367,6 +5373,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	if (!test_and_clear_bit(HCI_UP, &hdev->flags)) {
 		cancel_delayed_work_sync(&hdev->cmd_timer);
+		hci_dev_clear_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE);
 		return err;
 	}
 
@@ -5467,6 +5474,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	/* Clear flags */
 	hdev->flags &= BIT(HCI_RAW);
 	hci_dev_clear_volatile_flags(hdev);
+	hci_dev_clear_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE);
 
 	memset(hdev->eir, 0, sizeof(hdev->eir));
 	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
