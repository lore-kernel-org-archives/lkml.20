Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E594C33CE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005157; cv=none; b=EZTSvP237P0FnJdD/u64HRQpsPtSvG4QsTQqbfDaBxS+VeUrjR9OitgUA00pHRRVft4gWUhM7uqjXqz5FpYy1vpeaDIqKnLpUUMFp5ETldsHAKquTWixr7TuCznO6n0zQ3lQ+H1G8fAnMmpvf3Up5wGCwDlAfZyTqD+ZG015vfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005157; c=relaxed/simple;
	bh=GJDLDKF1u5CPMp4Uv16UsWMnehm7Urz6TVe/2jIm/eQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tGdWP6eF+UQJZX8X4dR1vj6dKUY5x5zy4AZwPOMR8JPDCQqL1K9uySYfemX2XDAvuQQW44rC8kzPUxTRsl0Zid4NJLvXNTpBF93tSR6+fr5AyrNb+3etjsisKgV2uAw/YAYLwP/r4bJjGPRQ0S6SoBdM9K0n32TVKYii3EBRrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeaK/cHY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeaK/cHY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so2759640b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005156; x=1790609956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X79HRIHH4he9wBEHQfrVBFJwF+UUIpDljtJ3hHJkuQ=;
        b=HeaK/cHYu3aIk8htG6QpSieWavPUbbG3LfBmZ/sda9d0iGkVoWqO+9IPaxIMNjxBxh
         jbySz9Oa/ojvkLe68+m7a187lBdctzW+fSdDdwbwZNAYuB1IzCjMGXOx1CRuPUsvJY8H
         SXDRQFyZGKI7IuMPCEygnzcj2LGBAyDpHN/EbjSE0aEFQwGepifzNTso4An44RCmgSGY
         hbcPj8WLsDU3oBR9mp4KVsBW7hHdvWokjX+6kC5ZPiKlekABTecICf9RftwHx1dCr9Zx
         ge3VohAMbl7+0+JsoBcfgkEqdxOvSbeb6BoAaZ3jQ92NqXwVEfJYVGxnuq3sI7OIcX8u
         gqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005156; x=1790609956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1X79HRIHH4he9wBEHQfrVBFJwF+UUIpDljtJ3hHJkuQ=;
        b=vFTj9dGuFhgPttDrX92DZKckOmnLYauAqvLL32LvVm5fLXc+ptjME2Vvnnoi6Vphtv
         tjYc1Gw54GNCh2weYxeOiYQZAJeBTTgk58+JEz/vWyWWIXWG67zVIgBDZqlJPBvYtcl8
         eH/XCKigMiQNH9rBsC2Z1gpyEwk1Cv+34DZDmqcAVnABv+giI6jpGfXMsgHNIfz1u4Ie
         UDEnQiCkqGyvOBLlswehR2wE/Td4pihHGmeM5YiujRIfHxQX/T5EB54Ffg94qEx4VMas
         XR1hyrp+ZIEAXK9TWUh4hr8nbix84gG/pa3/mokG/U7ujd/7b+1lB92lLdlqRB4udjXf
         Jq4w==
X-Gm-Message-State: AFuF++nuaXyxe5DwlGcoVUxn1f5etKGN+yFhVCRLlopZ/xj742q36J+a
	Xm9ryXK74m6nY9A1EkRFy/+2FkkGvtjXArg83o33yzdGUjPNRwJU8hzq
X-Gm-Gg: AYBFou3mGPHW+W2lLGh6lZZIMvQ043gOA9h+tMIMlIvrrplst2fotDlP+zhnVXtrNm4
	MPBwNpTjRAiSYcwbCAwaESE7sRg3tvQkzzXdLMy4gHp6zcVt+kdzqP4Zs6dAQHpNA5014eao0NO
	+B+aus7PX5uFYgbp4CKfQhMcEPoqSFMTnBnsQ68goXZf6Uq1vrPb+6ut3ByfR+BOx4Etm/o3qxb
	xfXfvTeKhYtTZJGle8rj9udedr7yhFgTUDplzNOmCjE2I8/e5+KwY9IVPhanNyoazy43i1fs2PW
	UUcuU250HoHmCQ6YNFhFhFapceEE9PJQqENB6LFzI+Q4XxjjrIJ7Xed+Y3TWxjAWnSAk49diA5U
	K1Fpi2gwzqPO4/37EiR2WZSPKax/iKRx1vX2GRmhZc716YkM+ynXQYtMMb3FEaoD8lDX9iE/fs5
	d0DmqWPbcHdrPQluS68zUQEbqp8WY/hZF0wGSmLw+fc1A+8EWpOg4lTUKfTpTcNclnbQ==
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr15944015b3a.25.1790005155685;
        Mon, 21 Sep 2026 08:39:15 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm3448186b3a.2.2026.09.21.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:39:15 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marco Elver <elver@google.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 1/5] Bluetooth: L2CAP: ignore close requests for deleted channels
Date: Mon, 21 Sep 2026 23:38:58 +0800
Message-Id: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

l2cap_chan_del() keeps chan->conn alive until channel destruction and
marks removal with FLAG_DEL, but does not necessarily change the state.
A caller retaining a temporary reference can therefore enter
l2cap_chan_close_unlocked() after deletion and follow a stale connected
state, rearming the channel timer and sending another disconnection
request for a channel no longer on the connection list.

Check FLAG_DEL after taking the channel and connection locks so that
concurrent deletion is serialized with the decision to close. Return
without further timer or signaling work when the channel is deleted.

Fixes: b66774b48dd9 ("Bluetooth: L2CAP: Fix UAF in channel timeout by holding conn ref")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/l2cap_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 49a998804908..65e957fdc7ae 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -939,8 +939,10 @@ void l2cap_chan_close_unlocked(struct l2cap_chan *chan, int reason)
 
 	have_conn = l2cap_chan_lock_conn(chan);
 
-	/* Context analysis: consider chan->conn->lock held also if conn NULL */
-	context_unsafe(__l2cap_chan_close(chan, reason));
+	if (!test_bit(FLAG_DEL, &chan->flags)) {
+		/* Consider chan->conn->lock held also if conn NULL */
+		context_unsafe(__l2cap_chan_close(chan, reason));
+	}
 
 	l2cap_chan_unlock_conn(chan, have_conn);
 }

base-commit: 019debf20bfd648b40ba10377ee0168db5eb241e
-- 
2.43.0

