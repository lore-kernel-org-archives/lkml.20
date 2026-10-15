Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF849E128
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050270; cv=none; b=mrcj12Okw0+cSOdCVlQsfCchIT+p7js/88+2bKNqKRzDtUGdstLOgJJAV9U/J74s80RlEbj2cRQFmZIcM/FxQZwKtCQ8aYKKC8wzuhY/ipnEIOk7wpC+zaDrGjjuUXT5QGgKme0VuwaAbOscw1TER6Ank1KqbeEaiWhjNJotfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050270; c=relaxed/simple;
	bh=7y+yRF81iZ5p6JHx/r1efbfLA9EYlv8GHW0hYZ1HWxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr42DKAxYNOrD2NsZ/tPSh83lQ6BN+voZwnMAb/aA4sJMVPO0J9IPL8KIJfRvxj/kabC/dgpz7kVM/lsMgF7lXwknSmWsKXe2o2+18/vLzysQeJU4ujAlgaoPDK7APD6ScwOYkNtJ+7+w2zgU2iijxQ2DA91ZhHwuLdR5981fU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btJke9aI; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btJke9aI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc502d509c0so824750a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050266; x=1792655066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8GsylX4a4lqmTRbuX4pJqRcRdmdE+d0tyzRFMMnoIk=;
        b=btJke9aIqxkQtjWT7vRYpxNwGweO8aEBks1u2n5nU8nX2AzvP9zw5ULWV6vTPfA93N
         nvn/IF3fl/omzAq2qvXFR4ixN79uY+ccjAikjx3qd1FqjU6JGZUPV+ElrNz/nuLQHPmk
         JUx2XQntvvQTMxBFIs4KbiDvFh9ztKlImvRTpeRt+urYKJjxsRB/F5WDVcQjH8hk8lN3
         memFz2HF3/MmeKlkZ3AcG/S2e+KRw94LITXbFYDfhtptrYsbSaH28WtekPXbr9a/54zl
         dtLcZ+Ri6LypLFA/6LXxAVAAeUE0WOaJzhVVn7egkYIcjqpa89EwEieJZzKX9sbz7MNX
         zKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050266; x=1792655066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8GsylX4a4lqmTRbuX4pJqRcRdmdE+d0tyzRFMMnoIk=;
        b=Crz7xoBuvgRqtXorTol0MjBDPpMDW1fHlsyVsj3b5NpBOxos+v2VHTOTAeCEJih77G
         Ix6hj8gTSl8CaJuMknNRBs2/Ee6jGR/FB2uAmqR24enkevYU0mNHJejeYgQ9LC4LG/ua
         pua5yC9eFDD4/kyuydUp9VLPJKMvDHO84kwsE8J1JqgwF78PCPy2VGvvPDzpHACts8jG
         L7vsCdMkh52/FEzkE+svxugPvQiEgITDXfE1RdLj1Vyo3+66EswG4b9BQX5IC8ATC1sa
         7dPzpCUV3zljUEpdXiSzh+sip0RwqFp/fyIeUs6SCZpIBx/0OUX8/OIhyeSQ4jyV2hm5
         kx2Q==
X-Forwarded-Encrypted: i=1; AKwUvByJa3kIvVEJ6BNSgvzHo5lvZa4/FHpmUj7T+Nz58rCcXyaBhJeJWNwFe9XhVgZHvE8ACHY2WsKaeLQAyS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJagIDUJAAh308ZfKB5Ze5cpGgtzAG0fGf8yWYn4roN8PAi6MuU
	P06LuuS6u/2fzRCSdN/WfNA6C9FCbwSulxFwNlNwjiP29zChKnScsOsb
X-Gm-Gg: AYBFou3IOhuJc+Dyfq//WrTHEwALRpRLThb3BHuFjhjGZ7+i/YG92JAlQFAv7RAtjC+
	xDvzh1UlZSk0yfFvwZgt5tCgARLmSPUaazI75t2rVf/TLkj9EEFez7NUNIKg7/Wf2hau6B9CbTi
	+qU6B+KVKHSPezREeY42iOOloRGKmtuEj6YkXP1hWXkKvvMcEtkjr6d451inLcEKCOzKA5yYWT+
	0kdGXgrWbYZN5Tk5JLIg5VYhrm/nmx4ZsDdYkB3qfV7r93KFsqy5uYSVU3t86cOWli9Arn/7Gck
	atzOe6lxX4TJ8ou/xys9u0QsXUZdDHCNmf47rJudQ/ZABTsYR+osmHib0ZNBF321y5Tg+awRad1
	bea5wQITaG89ZT24dhmNfQzD2mdpaRiZzZSARNKtdH1Ckqiagdca74TetwRd+JGfM13plcIiTvs
	Iz13EHPyZYTMVyqIH7VndAlWaRREzOhS2Gxuy3/AKrf1VSBxAlYCl8D7WgqfjVq0jJW5wMp2fz2
	dcHKBrdvnZvnZg38F9tFEIkU/zZjRPYsCtC
X-Received: by 2002:a17:90b:2d0b:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ab3a97a71dmr15876690a91.59.1792050265773;
        Thu, 15 Oct 2026 00:44:25 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:25 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 2/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Thu, 15 Oct 2026 13:13:39 +0530
Message-ID: <20261015074339.27388-3-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames.  A get-brightness
reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
reflects the original frame size, so the parser consumes the stray byte
as payload and mistakes the real payload for the checksum, returning
-EIO.

On the first checksum failure for a frame longer than the minimum size,
drop the byte at the first payload offset, shift the remaining data down
by one, and call dell_uart_bl_receive_data() again to re-fetch the
checksum byte from the wire and re-validate.

Limit this single-byte resync to once per command via a resync_used flag
cleared at the start of each transaction. A second mismatch is still a
hard error.  Well-formed replies pass on the first check and never enter
the recovery path.

Tested on Dell OptiPlex AIO 7410 65W (0TKWC4) where the EC inserts a
stray byte on every get-brightness response -- resync fixes it
transparently.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index b61499d7b3f8..085dcc055554 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -60,6 +60,7 @@ struct dell_uart_backlight {
 	u8 resp_len;
 	u8 resp_max_len;
 	u8 pending_cmd;
+	bool resync_used;
 	int status;
 	int power;
 };
@@ -91,6 +92,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
 	dell_bl->resp_len = -1; /* Invalid / unset */
 	dell_bl->resp_max_len = resp_max_len;
 	dell_bl->pending_cmd = cmd[1];
+	dell_bl->resync_used = false;
 
 	/* The TTY buffer should be big enough to take the entire cmd in one go */
 	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
@@ -270,8 +272,27 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	if (ret < 0)
 		return len; /* Response not complete yet */
 
+	/* Stray byte after cmd-echo? Drop it, shift data down, re-fetch checksum. */
+	if (dell_bl->status == -EIO &&
+	    !dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
+		dell_bl->resync_used = true;
+		dell_bl->status = -EBUSY;
+
+		dev_dbg(dell_bl->dev, "Resync: dropping stray byte 0x%02x at offset %d\n",
+			dell_bl->resp[RESP_DATA], RESP_DATA);
+
+		memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
+			dell_bl->resp_len - RESP_DATA - 1);
+		dell_bl->resp_idx = dell_bl->resp_len - 1;
+
+		/* Re-fetch checksum byte from remaining data */
+		ret = dell_uart_bl_receive_data(dell_bl, data + ret, len - ret);
+		if (ret < 0)
+			return len; /* Need more data for checksum byte */
+	}
+
 	wake_up(&dell_bl->wait_queue);
-	return ret;
+	return len;
 }
 
 static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
-- 
2.43.0

