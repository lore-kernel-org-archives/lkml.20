Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19457417BDE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341704; cv=none; b=GsRr2NSwbF2qI8n7R3t8QZIwQjF2Lnqyts6vKK7wOS6WSnzI18qRfi2EhFJwrqxRqeDpdkoQMguTECRjEaN325UQoRq79MFc+LXPn5Yuh110jwv/alNVNOVlR3U7w3eR59wxyBBPF1y/sB1XXsmf8uLYyhPwv5SPdQG4MasFeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341704; c=relaxed/simple;
	bh=F98I+6PXV1vvQ1nKs0VPO8GBAmIlCI/gbHFfFY6zo9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5tiL9ZzD8Co8rgo+gCtI6smCZz3bkWUpLMVk3XYyql6GhrvvlCD5s+3KYsPdsYT/FUWJaEej1hd4sMN31ECakWQ7hIVLrzO0Vaiel35ojVqeho5Au+SHIB6ZnYPAaGGDo+6vpoXL5/i8eDcg2HzG63nW3jny/n6CsPy5Dc0wpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGY3rKWw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGY3rKWw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d53197d8b5so7406865ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788341702; x=1788946502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oncz24DQCI7h/SAy0ZeJzGJH6zM3Y5+xwZoSuFu7ZrM=;
        b=hGY3rKWwL+XDUlbhqP6UdfJPBO5/XUSsJSHE9tA58/Pqnm457pwqP+Ugk217QZcW8I
         an+5FJQ3sSkmU6nTgcVfV6FlDASPj6iQMDFuUKR8SFreNJRuerqv4mEpgiI4G0oIg1RR
         ex9DujBKIauxjrnGfp8EOUiCmBPQYWOmNbL1hRU/Sj6WVX04eNex6CoZv0szSjvwZBfD
         OLqYsH7RtR7k1sSCaBvFYMGIrHwOaxiUFhlPOH0cI2Y/PjuCqkGdBbzGzfqMOlHm+TY+
         lKjXex9wJZ/xQdgM0Qo238U+9SDI91qW6n+llc9xxdtr7u08UXRVg42xPy5fwV4Fw1+E
         g8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341702; x=1788946502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oncz24DQCI7h/SAy0ZeJzGJH6zM3Y5+xwZoSuFu7ZrM=;
        b=iJlF+YORNu3TZGT5e5eUlDZXmpKXx6qalJCtswuug7oFOPZjsjUHp89srlrPHY7bgS
         L9nL8IeZfjy6nuy86EuKUZtsHvmtYvjeL7cB4iS0quaGLM7uJFka1MtuGeNpAnCV1QjV
         jLy70W3N9pyT2U87dkX5DPtsfhSq/GhvfgPs2JgwJLW2JGtIUkaKPBf9owziGYR+6KMS
         ZJTIgS5xAeG9iO7ZfZqI7V0OEhL/oZ4TnkTIlYO/sm5H60KOyfVwadasOq4NBaPxgP5W
         GNombuyfFDuRrVpN0zQzFA+fm/VK1A3Xnwj+117bNXI/nJ9VoCk/Csnjtx65BPBcNW8b
         lLgg==
X-Forwarded-Encrypted: i=1; AKwUvBwzUSnWMSqX4Bs7SzqnfhpxhDe4lg2hd/db+qOHzihGJQ6yvsTfLjGsmLgeOSC/weNDzbz1iF+n7mSItcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ktM2V56DR/0V3ZH4LFKLfp0VAiDLDw6cLynIDRh07TPvYnI/TO
	UMmeUoNCZ7UVErwkuwNAuJ2F03t7wUd4++Y2KSIJog1jSwOTLaOtlTBoeBfvJ8do
X-Gm-Gg: AR+sD12tbFmHh6Ekp9MVRrg8P7h0Ba5W9ezY7zU3cf6YG92CTtpTmDnlTV9oJbGfag+
	y/qpltzGeXPAOTcjZz/OsN65Gmp+LbTEIPapJXFS9xHtdbkyfZQXFIPX10GmPsw46QB2YxSbccy
	hKsC1CKWTqHwotDrwAFEdm94FmVc4xfidOqClTF23LUMKHpGFQttg+ZFOxAfPitnYCzSkDsZIlS
	6WYHVGZK5ZqD654HskRNB1XJ1qgOeKfCbjaqP535NpY4AUSB3F7FVuXXKt2LFNNol+9D0P3aP8J
	wHmSfgvp5GG9xnOwWt9/nR3yHB6Md8pCvh5JCKTnZT93QU+KyrsgaEJJo8Zy7vImPBOl+NYHWGL
	Nut7IcYaFXZ42Ml0SZVSqVgrQuJoaqADm9UHttUmkvi+yeV1OFqiGmDcmG011l5044w5vxIMFFh
	I7Gsx+7ZFcfFAH3PnaL2IX7ydshMtR7rl7lnz0962RaLFrBjNtmNzFvQZlJlfnRtPYjy/7rcFt0
	5rAFbkE6fYk4no0YmxfWMdFzvJFHcvTJEA=
X-Received: by 2002:a17:903:1aab:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2daf1b16445mr22990685ad.3.1788341702379;
        Wed, 02 Sep 2026 02:35:02 -0700 (PDT)
Received: from archlinux.domain.name ([103.97.242.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7a175sm5257507eec.17.2026.09.02.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:35:01 -0700 (PDT)
From: Keshav Goyal <keshav74123@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Keshav Goyal <keshav74123@gmail.com>
Subject: [PATCH net-next] igc: remove unreachable break after return in XDP path
Date: Wed,  2 Sep 2026 15:04:43 +0530
Message-ID: <20260902093443.93466-1-keshav74123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The break statement after "return IGC_XDP_REDIRECT" in the XDP
switch case is dead code since the return exits the function
unconditionally. All other return statements in this switch are
not followed by a break.

This was flagged by checkpatch.pl:
WARNING: break is not useful after a return

Signed-off-by: Keshav Goyal <keshav74123@gmail.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 1fb5f3cbe93c..3b7dd104d8d9 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -2525,7 +2525,6 @@ static int __igc_xdp_run_prog(struct igc_adapter *adapter,
 		if (xdp_do_redirect(adapter->netdev, xdp, prog) < 0)
 			goto out_failure;
 		return IGC_XDP_REDIRECT;
-		break;
 	default:
 		bpf_warn_invalid_xdp_action(adapter->netdev, prog, act);
 		fallthrough;
-- 
2.55.0

