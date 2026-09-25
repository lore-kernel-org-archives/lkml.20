Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D51A6807
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295049; cv=none; b=lUeLC5uHXTNA0fcz1iMKU/zq3oZWY1Rq/Fs+VUbcC2nuNLhdmnxO2+77bXfVNiKiFsv5Qwxe1mTllGZuFn3R5llc2CGg95Gg4U0M5XXpfUYLExmEXa3CGrjDnz0E7/Md3R27eGG5g4PfIiLUe+osY12nwT/w7tO0Gn5q+Q6PDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295049; c=relaxed/simple;
	bh=1rvaVBS5z3PcQvipdDAj9WVWm6JugqJIhc+zC3OYV1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lO/mvmEEbG9xzbe7cmxnNEtDzLf6e0g/389bH1epH5uP9qfu6FYPcb3ezW8XtpWJEzUVCtp0Edk7DlGDCDJ7XxvLm4WfQp1/xie5+os+Szh9UTP/yeehRYHXnaiTk0zobyDBIKfQvJMCGbrdHrZ3xYvpsaO0aEe+uVw5+PKmm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EBdYKyLI; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EBdYKyLI"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13fc403e373so1528517c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790295047; x=1790899847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoMaAm02Pyqn85C4te1/bOInshnG9mfbEU4HCghL9sk=;
        b=EBdYKyLIywsel9vL2v0ZMC0C7AlLUSwzpcten36NL/AK8/zjsODH9r5iyS85MOf2NS
         vUjIKyUszy3/ciYK8N33oUrRXXW+E+aGhatSK0mqX6q2rY0qDIo+s06Ebp+AL4oTsiJL
         bEqdTtz1Lj+w4H1wJkNobd7Ju/3/NKD2Q1ImxpHMokwxClgILKTtDGtJg1499RZvSo1b
         7SBqyE0CsBhSdYgd7Ce/Ag8SxCfTl4MEnejeqcvOwqQjWaiBMfqbU88TFMO07/bZwKO0
         l7mHfvWnAW7hrjiBqR4rGGScRER2znSK/gmk28O55zsz6N9Tn4Nq/+wyCv4GAUYwW+Ix
         oUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295047; x=1790899847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoMaAm02Pyqn85C4te1/bOInshnG9mfbEU4HCghL9sk=;
        b=AxpCPvIMT6Y++4PrW5dEPudUP8cdGtSCvHX4GhGcll/5GGGDfmxfKzKpWBmQT6LvlK
         uhx70ieMJf0c3FOpP1i2V3vm55Ge0TOY1huoiq8mzWIxu0GtGmK5QMqvsqtevHfjwHrX
         ldOk4igSNDIAEbUHzsSXWZZOu9Y/EBVn9esAy+x5LMNCLb7kM6AruKGmNGkB9xFYxAgA
         Kfxhbmeb52j4wzOb5zbUu6JzZa0igjgu1XMiGsvNwV9LDObEMVdzZgqgTw2x0wf6Hbmt
         9o53Th6ML9yBj/sH8XNhkKqbBrxuObT2HDpnA8/aGetfv5eFl8ISA7jaBIThfKnYbOu+
         7q4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmYdjBiM4fODKh9jib5c6bw+Oo+NxoLcVZeusv/YhA4Li5K9pKkO0fmL2tamiIsVBzq8nBjagweTOgnJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kWV4r8cNYzxZhpq/i9CEDqQe0dQCoGSKBt84GyBMoieK4GRDUt
	GtLtWYEYsgtZxw4PiwWAe/vR5l73GBRaD72XO+kCCbO8sdp59anM8tsSu2b4Y4f8PkemdlIPsED
	b57vzVj4=
X-Gm-Gg: AYBFou2lolEjU+O9pknQwuyftJRfhNPQLsk+1cM5ws5r9X0ir6dSwBx1bzvMRXMdheO
	hQfOnqlBc+oRq3je6R+H17c6b2T7uitD851m8vf96x4mcykZKSTKtX4/Q/tgBWqLoeL3qecK3g8
	8z5SgW6vSTF5bPwAd4DGmb74EqtaJ2PJ7aCIas8HeAKTbmUQCVQVZ7++oSFvT/8oQYJCwbsciMK
	xcUx4hFizSOHoaYt42Y/MbT+DBCLSTPN+gIFB1hIBu72W0Rph1r3i0q0zdDYFq9NdFrBgOSP3mD
	hsz9a/Bj9PJqWkfwLRgK9ugeWswmV0RzUtllDA/zca4/MCMVLsBZOhrXsidS//2YpsWCW+SONGB
	RCJR0yhGLenaRp4sKX6t/A6vpZLU+wK7TDgje4bxUpEGy/+qxV3EyDbtw1Wc5NndKPgn6CLu6qI
	FaKojYsJIXgfdhegzLIvN032xRbpWLB9NwWEPVJM/VxCEbbohTPYXU3K45jlK5kARTWDTkuSrhY
	g==
X-Received: by 2002:a05:701b:4254:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-1450403dc38mr3141393c88.10.1790295042387;
        Thu, 24 Sep 2026 17:10:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm1787647eec.22.2026.09.24.17.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:10:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 24 Sep 2026 17:10:37 -0700
Subject: [PATCH v7 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-i2c-xiic-v7-3-df7e752332ef@nexthop.ai>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790295038; l=2009;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1rvaVBS5z3PcQvipdDAj9WVWm6JugqJIhc+zC3OYV1M=;
 b=CeyCZ+j6PyXwi2IxNzqHNhjgrX9Og3sz3PrfkkWqKWWMlqelDQm1WAl8kwmODXCZf5TYFasH7
 auvAVv5l3aKDqLqlLiHm/m/SAC2AwA1Kj6Zst3jMHnPM3mIuPqGGkse
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

At the end of a SMBus block read the BNB handler force-set
tx_msg->len = 1 to push xiic_tx_space() to zero so the STATE_DONE
branch would fire. Two problems:

1. tx_msg and rx_msg alias the same i2c_msg struct during a receive
   (see xiic_start_recv), so overwriting tx_msg->len also changes
   rx_msg->len. The i2c core's i2c_smbus_check_pec() then reads the
   PEC from the wrong offset -- buf[0] instead of buf[rxmsg_len + 1]
   -- and either mis-validates or returns -EBADMSG.

2. xiic_start_recv sets tx_pos = msg->len (typically 2 when PEC is
   enabled). xiic_tx_space() is unsigned msg->len - tx_pos, so
   setting msg->len = 1 with tx_pos = 2 underflows to 0xFFFFFFFF and
   xiic_tx_space() never compares equal to 0 -- the STATE_DONE check
   falls through to STATE_ERROR, giving -EIO.

Instead, advance tx_pos up to msg->len. That drives tx_space to 0
without touching msg->len, preserving the buffer length that
xiic_smbus_block_read_setup() already grew to cover the length byte,
the payload and the optional PEC byte.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5cd737c7608f..5e397a7e63f6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -889,8 +889,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.54.0

