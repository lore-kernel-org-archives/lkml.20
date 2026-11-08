Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152709;
	b=axpeU6qKxClzYQ4I1XMAedZpv+caaNrgr1esm71bUElz0zD43lB1IoUZZPAeNIPhB4yt
	 GBj//hzK7OSd02OZBe6DFs03aEPYqODmO2BhxmLf1W+WziZQ+E2hUuhpwBWD4ZCLpreFw
	 rG8wPHlo3j4/42/KxmIN8OZkyueh4un7K2eleekuaSMXoKmJs7Ct9KVQzKmuNFhm9bnu9
	 O8W0qaFUKLNJDPBe6BYadZV28IZ/tiH0w4VRp3J8exPWOZg0CDQBRxY2XwSsW1gw9Vc+r
	 o6GtMgvXWrer3BQVulay0cVWqhaCkd/hiwKNeOJZ09Fr0BEtpFl3omXibB4YSn0E+wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IYgeKW2ILwzKm0XojR9/sa2c/Zca6UEWbaskTpVbLWc=;
	b=R/crbH2JfHD0x3VxwqZMeGsj0nipTq6tyNoJha+8aeBjzGkdPpUAsSpNdR1vW7tiJJqX
	 q7zv0LKcKXy2xu2RG1JtGgVpSOh27SxrFqYy2hxyDaSOLgEO+4DKNFsanUn052YE738Rk
	 Ib6iycammVK9o0zEgVlT+8dWhh/jhsLACTj+JLCpnXE9Yhjzjh+6fdgnBR3h/Kjm0XUbR
	 6WsWw27f4SdTFxR4s1QmtHFAnRd671qP6UAGK6F/P9cDoNG+HPDGqXriEyJmrZZqS+H/X
	 BNlGkuWmqczXPSkh8oQWn4MBtAE679MlzD5Oenns13cHd0m27We8/j1HJVYAA11Z65A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KrJyKC2/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A750606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A750606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KrJyKC2/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so484395e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152707; x=1794757507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYgeKW2ILwzKm0XojR9/sa2c/Zca6UEWbaskTpVbLWc=;
        b=KrJyKC2/qZSKP64fWnaBN7uKwFwGb3DWg1jSy6cVrNeSHug2NejRETt2+npsKiYCV4
         5NngmT5F1yeRjAHedzbd6p1fecktgvYdtRn9Jv/xtQLtr+BSaD/SiLfnZucjC1VNJ2t8
         tFMcuNIbobuV2O9fKPpPp7j/cT477wHTimINM4f91XEi/QLTrdYayQMAsVzVUm8IFlrp
         yxViOpf6gVawaa4Af7zpT0+R/pWlBSo9j/ferAbL0HM6ljXtLQaVRND8neqmXisOlITv
         AjTGevMLrgKq+IRsD0rJErFK4cZAB9RRLFVXs2BlK0Nih+Bta0u/8vVhSvEtpw5njv0j
         zKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152707; x=1794757507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYgeKW2ILwzKm0XojR9/sa2c/Zca6UEWbaskTpVbLWc=;
        b=KoOfXXgubyYdlGtDb4GvFPGa7m65kLFF+pKwL1oiZ00N1gHYbBXuUJ9uAV7cyzcTui
         5oiOdV7G7lJSTDdJKgMjCIqXQVCHen1QyLu7pDBK6qK5r1FzS9u4m8acPMnQgJvV7xjT
         qH35/vTjdctg6MGjKkTfIihkpxQlCuZfmhk8+4n+S7GKkw/ZG//rsErStH8oqAzYf9JZ
         u2v5plvajVz7EPLTTMxtWNPZTDiDmpNa0qAJivoC7z6zSqGRLDd3u+me9WT72uJr7F7T
         6S/adSBF3Q0t5mW3Ckf3JM6+IS6RjojytjjHyCILacO49Xnt+RSgAlSJ4rOkrxXSzwpg
         /rzw==
X-Gm-Message-State: APuU4Z/3p0gMMdHm+mL6ftVD6JXlh2qvVcx8pxcLCZnzBQNoiTlFo8MB
	rCCZai8Zm4UT431Pm/l2g9c++Ejt1hGqZpukdNcJYVtfLp0j2jg0zu17J+xKKKLO
X-Gm-Gg: AYBFou2SllQTi06HS2uIn8CBXTatcY9xmehzVQym7+ESTtUi61zvSNzTlmkyL0/Phg7
	hQFXbvjyXnc5olu7wHur9hOGxvP3VRxhrFt2I4mZWp8I5dPPFn7/oxOrQF34MAGGw55H59afpll
	jj3DoRU/SikE+SNZpB83j4i1xd0jXuMDqlqyFtMEYCdInHGJ6ULkzoKpyJiey5esS4TofIwpJmS
	MnnI66tenRWsuagDAg5ctbTk3uKferTykHNrz+op2vFp9CJ0ItA0F3lDPf6s137Geq87KjxDz+7
	iGBD4BSVMxbh04yHLUQ7dt+Co7jzHf6yUfgoMM6wPDW7M0yp2XuCvujLMOv+wAC/fYuO+QTmkIA
	ZnG9iPcb7QNAdF/SWOIIqwa9v6cyqkCl7HpQWGU8rQUMH1N/lcxCN9Cy9LxKJGQRN53zUHP5ff5
	PFZd5fgGx2YHMOzDmOVlQp9QccvkIQ2tAfiTqog/yz7dzc7C5fEOd5R4du1NMQ9Q7BGFc7zhM7/
	rv7dKm04ICctIP5cyGEbXj8XLouzXo1bshf4ztNOm87NO5A3Sj5eadzMTa4GQ/5TAfxtuFSXiEE
	NQMf+X+HqiFHLnMl1KOFczv69LI3
X-Received: by 2002:a05:600c:8b21:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4b960d9aff8mr32853895e9.7.1794152707207;
        Sun, 08 Nov 2026 07:45:07 -0800 (PST)
Received: from localhost ([176.240.213.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb76697sm97004205e9.0.2026.11.08.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:45:06 -0800 (PST)
From: AwesomeNick <kizilgunmete@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: AwesomeNick <kizilgunmete@gmail.com>
Subject: [PATCH] Add kernel.cpp
Date: Sun,  8 Nov 2026 18:45:03 +0300
Message-ID: <20261108154503.17529-1-kizilgunmete@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Please add this to the kernel now. It would be a shame if you don't.

CRUNCHY CRUNCHY, MADE BY AI

Signed-off-by: AwesomeNick <kizilgunmete@gmail.com>
---
 kernel.cpp | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 kernel.cpp

diff --git a/kernel.cpp b/kernel.cpp
new file mode 100644
index 0000000..7202cfd
--- /dev/null
+++ b/kernel.cpp
@@ -0,0 +1,6 @@
+#include <cstdio>
+
+int main() {
+    printf("I am the kernel's great update!\n");
+    return 0;
+}
-- 
2.54.0

