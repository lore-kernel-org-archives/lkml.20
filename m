Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3314F5DEB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416167; cv=none; b=JZmP96Y5zFwnwlcGBc1k66z5+0bSxf4Gucvv8hsozWoL4t37QGIZI1dhNZboO6Ia+5zFdMkf/12+U1qFTYfYpd+NUtIyjt8R+zBZ/H+mW8DQ89Y7MNA0eqciDSnNZdfhxcGt2a4dGNoz2geZ+jyCZFBxov8ufqbF17M6uq/tOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416167; c=relaxed/simple;
	bh=msKvYvR54L5v+xpFEQnqbETY7La5nljKFpMylDn9Am0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qpj2qRN980O8OZ5mW85+WRW7FxHk/ABsdiF3A6JPUG9wizw+42Pa4zVPKQPgbwPTfCnZpGMbq6gLtQU6Vjqhg5w2ju/MXevRoG6iS+b72QYz8sfoE/Z6qxJ0pLUlUa2bLMPIzdJOQxOF4Za5U90IEn7i2TdsRfwM/MUbts6fcBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkXgFSAf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkXgFSAf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e985106c0cso13852385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416165; x=1793020965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT6gv6W3rD17CuhmPPas4mfHdPdygOfvNmWG3PSK5s8=;
        b=WkXgFSAfONReF38m+B8848R92y7Qk+ULbJ11hQU2//a2Uv65UDOOwsMFuqXwE8nuV5
         H3FVo0mrX4mBdC8fqLeK8v9JD6NOqhyG4m1iP/cz65la8s6k4VS/9teBooZgi556CpRn
         A9vrvyHyN1amVJ8XKHUMlllKvtf65EGFUj938UwYgrqH2Lk5cEhjsg1GoVdjOTGSIP+i
         8bFe9Gfq4qD/ecXQARH/7TspxRWM4ibv6qusYPloO2ZwHJb4CKPP1rDBstYVjpIAyLGj
         cnsscBiEUEZkrwvWQR/MlPzrUNFv+Krlo4gcY9f4GJ/CV6gKie9sn/92Rtx9XrgtLCVC
         ny3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416165; x=1793020965;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MT6gv6W3rD17CuhmPPas4mfHdPdygOfvNmWG3PSK5s8=;
        b=sUqO7b0OU1pRz8+XuZbVxp2By83+gmO0Uk5omJDyR9qFLL+yEJ5yq3Gmb5lP8eUWuk
         BRfO2fkd1Q8fHg66q3wm29VkXu8EtB04Hi1O8Pl5Lnnv/ySwuRNujBgqSzs4iC9JT4HJ
         ktWIeTmRORz1q3UujLmFiXqrJMbvbkvlxHW/dvW4LCGkrQnAf9KbRbUCQCDokG0fUzf3
         fsC4ZFzEQu6lxYzf81Tsc19mAU4LNqJr+NqCe7QXPhuGD6qJAHxE/JVT696NAd7BzI+Q
         VSR8x9J6LcqwUBCCYji84G/MAJyahA8tVU4mDF1C9+N+sw05ygI39eDX9/jL3ho26Vm4
         UHnw==
X-Forwarded-Encrypted: i=1; AKwUvByzqV5AP8D+nwzonOMpJJrZTtvfeLywnGcrE12ZhHne1yPLkWRgnWf5ScoIW9bR0y/JH14HZJIQriVyzUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjK9jmXqcMkLPNncVPnzocBlMn0aK4y9X/pRkM548wakVt1pkX
	EvfTKi6ylYRpo1qT/py8prBEC2LKI2O0gndOT0HRBSzl2EmqBsLgmKXaeXsB19GGD3c=
X-Gm-Gg: AYBFou3sEy2sarW5b6hoKQBzfZWSqFTQia/w9yjVTDFpbjKlcdPvGRMAymcDMbwVoBY
	qDfp6/j99L+uJC8crWRO3eOuy0fodYNWOXNUoVZJZmdA7yGBRhl91flX5nHtR54U/hqRwCVQdus
	JZEcVCD7KVuLNTR9qxpVXoJO8PIHdiPmr7BnFYthPynhR7PpKZDiZXgX3kwDHGF1zDUg9kHtf6E
	bn4Xs8e6KTIxCOkDaGAH7aIc1/iZozg8cSQc7dXB/S1k3KPJmS/wP+b2kBONlqcgjxfG1yWhkBM
	C1WCyeIEi5YNeKuRvvauFofM/8D1i6X3ZjBmiNoGFtj6x00k9yrF5YKt6i+2fRuqioI5/gWAvYr
	SwlfgAHAYs8+3tQJpVa1iWThhZAdmAUURrneDttLUt27Xvz1mhRtizd//TdC5d994/W4gtA5Pg/
	bsb19PCAgVRIqVbIDhRIaSVbSAZ0i3x7FgG0pvuEyQgTyrkmZjqPxQNBxWRZkh18xmxJqVmhB8K
	hi7Ew==
X-Received: by 2002:a17:902:e547:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e9a6d1d13fmr68305325ad.19.1792416165567;
        Mon, 19 Oct 2026 06:22:45 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e25bsm661025ad.45.2026.10.19.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:45 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: Jian Shen <shenjian15@huawei.com>, Jijie Shao <shaojijie@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] net: hns3: bound debugfs queue-name sprintf with scnprintf
Date: Mon, 19 Oct 2026 21:22:43 +0800
Message-ID: <179241616311.5916.9868151766207198451@whr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

hns3_dbg_bd_file_init() builds one debugfs file name per queue with an
unbounded sprintf into a stack buffer.

    char name[HNS3_DBG_FILE_NAME_LEN];
    sprintf(name, "%s%u", hns3_dbg_cmd[cmd].name, i);

The only two table entries that reach this sprintf use the 11-char prefixes
"tx_bd_queue" and "rx_bd_queue".  i is a u16 loop index bounded by
max_queue_num = hns3_get_max_available_channels(handle), a
firmware-reported u16 with no kernel-side clamp on either the PF path
(le16 tqp_num, ext_tqp_num, pf_rss_size_max from the hclge config
command) or the VF mailbox path.  When firmware reports >= 10000
queues, i reaches five decimal digits and the write becomes

    11 (prefix) + 5 (digits) + 1 (NUL) = 17 > 16

so the NUL terminator lands one byte past the 16-byte stack buffer.

Replace sprintf with scnprintf(name, sizeof(name), ...) so the write is
bounded, guarding against a potential overflow.  Queue counts below
10000 are unaffected (no truncation); in the firmware-misreport case
the name is truncated instead of corrupting the stack.

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
index 1347edac7..e186ec940 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
@@ -860,7 +860,7 @@ static int hns3_dbg_bd_file_init(struct hnae3_handle *handle, u32 cmd)
 		data[i].handle = handle;
 		data[i].cmd = hns3_dbg_cmd[cmd].cmd;
 		data[i].qid = i;
-		sprintf(name, "%s%u", hns3_dbg_cmd[cmd].name, i);
+		scnprintf(name, sizeof(name), "%s%u", hns3_dbg_cmd[cmd].name, i);
 		debugfs_create_file(name, 0400, entry_dir, &data[i],
 				    &hns3_dbg_bd_info_fops);
 	}
