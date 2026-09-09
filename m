Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C22BE7BA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916098; cv=none; b=p3RWDDWEDcKZmf0ZFAWqaOjLb0puho7LMJeKwZ8Lur7K1pgKpOYljXL3Or5TC+DjbSxrU+aOMCwkv+gdSlBWbADMKqJzntfpMu6KgevDP+aGZbByfPGZZdXKFTCF4054liJiWZJfF2FH5ZQ/K9ePl51wOG9njGT6QB21lIk2OW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916098; c=relaxed/simple;
	bh=o5vDWEBXBvQGT+uOAUaMfiCv44D9Ll5+4DYhNLBjOUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTlEw+jY+FbQRZAu22RUfc3zuhV5QO+gp35p77Jqw/C2Uuy9NImda6VQ/JDdbpgos69oU5fmQ1uG5GhXDt9SJU12qyAYkrYt0Z/u6lJ+S+akQnPhgr1dfeEcAaHGWS2y8l8/Z9yGlgHeAx7erKjOoYAJmUZANnMsdlGD4ILg4PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnT/c1FK; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnT/c1FK"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so5608740a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916096; x=1789520896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSr+aJCl9Nbo53QwUJBq5S+WfBghs3WzUC0GUb18194=;
        b=TnT/c1FKbUwmyjUONhDNojnSrpH+KVzLMIAWcrMtbTcXtJ72Ur02BNzNJ3cBCvdQvP
         gBNtCxlTz23SSMkNDfgTRtj6OzzQiRU8OX/SFvSpzOIAvhA5UqXvloSnD/5bZpSBo5dh
         OKMFTGaC6rTKGdlZIvM+Fp06fyzzPvZqgnfeluCwTAB5/SMDk9UUZRxyBdhOV8xRbG7v
         y5dKC957Qw2UMBz+8nEFYvtPK0NZ+0ePqAs8rg2zQJvvDb9Wt1G//2aFoufOARuLbREs
         J13ZStHQ0huRWcy/m9428iF41yHVM52GIszQevtG9oj+c6KDrz9GjlzB9Daop8NAM0fQ
         FHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916096; x=1789520896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSr+aJCl9Nbo53QwUJBq5S+WfBghs3WzUC0GUb18194=;
        b=lXCfEsA7mzjtpZ3Fw2xTW9hA/oJt99aLroGCxWRioHdTXo+LyvfsumspS8HrR6Zp1z
         AjZLq+UNqz6BALB2yBSL1QbXHJXpjfTK+SCb58tO5YcWlNbWLECWmLY9xSWQY8sY5LdS
         alhXBmAllUymniVHdDs2cQJ14l3sWBUI4+cQcNpNbUOZ5UiwzhWVYDKUNQkqz/NEvd0U
         bAcw5qzkiyPjQ4sATTc+rxv+9ENfqM6+8nBeAKzJAWnozLX2Ik9OXyoJxi4LXpZNbsKy
         /S2gcyxmRb/P0Nl/a7NSveeJW9bRiFG97lVeBGIeXGKKnrX/qMDKq9XW0UZJa1U0Q2rX
         xOnQ==
X-Forwarded-Encrypted: i=1; AKwUvByXHQdtk8ZUeyhhv770TstcDEaiUu3e5eyJLBhu2vUR5Gn4tQFvHNY9P7WmlkW5o+Ojv4ItgYAsm2FpNno=@vger.kernel.org
X-Gm-Message-State: AFuF++lbHAdvyv03h12wYaYV+6wRz7ylx7s2R71Ewh6og/38E+cpg/RU
	qH0GWa54TnAaNsUvmqH0AnZ937wOnCL+HE+xX2dwz4UWR5yFPTbcwEe7
X-Gm-Gg: AYBFou2yXOKdGswQ6oSRnFgq0tW7GmeOFUifrysgj67mIV8CIHqkt1S2xAQCufQC3uW
	eJ8dYfQK0VgdXgK7Sfscg9Y9ZGVHMFyi/BskRsPJzmwjjbhv8xLs8fE0EhAFlU2eBmT/UDddJCM
	57AMYzTaCbBU6sY25S2NyoH0JgKAC4UwNL+WQ1R0p8A6gpDaGXLKae4miKVNhmF0eZUFfm9gXvP
	DQMy0zPNftsgPDxQvvJTBfG2ISfzLmohL6Qpj1O4lr+koxUsCyhPKEKoMJUOKu2POgv+p/jLoLt
	slnoFqd3mJVHzZyjr7t+8hfVt6r3VeEqL4MhHFl79RrMWSJIgCTQ8dlP3goLR1lPUrMkf1/5mJN
	bGO1O8NKiTTcBAjNvllJCf3Goa1DfwpajkRMa6aTKk56k/YBp+QlsHCKfSXKQ4bApekmKcu7O0q
	dJF8fBkHJQd0+r3i22fiE9mXn0GxMWxuKH4YNz/q0FWJn6h24+zhOCVKZWgBs9NutV9EhaGRImQ
	6mx8eLCr9A=
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr47303688a91.1.1788916095795;
        Tue, 08 Sep 2026 18:08:15 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm34696115a91.7.2026.09.08.18.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:08:15 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Reject oversized XDomain properties responses
Date: Wed,  9 Sep 2026 10:07:37 +0900
Message-ID: <20260909010737.1883610-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tb_xdp_properties_request() allocates room for 45 data dwords in its
252-byte response buffer.  The XDomain length field is six bits wide,
however, and a malicious peer can set it to 63.  After the fixed response
fields are subtracted, the driver treats this as 48 data dwords.

Commit 322e93448d90 ("thunderbolt: Clamp XDomain response data copy to
allocation size") only bounds the copy against data_len.  If data_len is
at least 48, memcpy() reads 192 bytes from the 180-byte res->data array,
causing a 12-byte heap out-of-bounds read.  Commit 4db2bd2ed478
("thunderbolt: Limit XDomain response copy to actual frame size") limits
the earlier copy but does not constrain this header-derived length.

Reject response data lengths that exceed the allocated source buffer
before copying them into the assembled property block.

Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
A private synthetic KUnit reproducer is available to the individual
maintainers on request. It observed adjacent memory copied on 3/3 fresh
boots; the fixed control passed on 3/3 fresh boots. Physical Thunderbolt
peer injection was not available and was not tested.

Tested on current mainline 893e11787f78:
- allmodconfig W=1 drivers/thunderbolt/xdomain.o build
- strict checkpatch
- clean git am with matching result tree and patch-id
- clean apply to current linux-next, Thunderbolt next, v7.2,
  v6.12.105, and hardened-v1-7.2-rc5

 drivers/thunderbolt/xdomain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index c179bd751fe42..0e1e6d90a977f 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -377,6 +377,10 @@ static int tb_xdp_properties_request(struct tb_ctl *ctl, u64 route,
 
 		len += sizeof(res->hdr.xd_hdr) / 4;
 		len -= sizeof(*res) / 4;
+		if (len > TB_XDP_PROPERTIES_MAX_DATA_LENGTH) {
+			ret = -EINVAL;
+			goto err;
+		}
 
 		if (res->offset != req.offset) {
 			ret = -EINVAL;

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
