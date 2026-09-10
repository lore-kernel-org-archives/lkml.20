Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C69384CEC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055347; cv=none; b=gpjU8ctnLrAPXfKo5JF8AIpHqtTdXN5oLiXFzAbY9Pg96ovTcofIzuaBvO2aAktaIC+QghMfZkKmB1XjwKZuCxWl2kVlV3Gyf8S4Ti7GXRKGT0HZdZcC4sDpFEyXPhT8G+uyEXYhAJuSy6i5+e9ScpWDGv6JARPhIz9UnzWibhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055347; c=relaxed/simple;
	bh=ed1DkJwZyVbeDkIHPU5UKGSzGAr4itCweBML3B4NvpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3yCMEnb5h0V0P5vFD63Ru1RG3xTx7SMVfMVAzEVfzF3RCzUaD33lid8G2sF+MxoBI3RgUDz/nap23pdVKn7ULmo2nFfv1d/c/GbkSf8FjE6wOsnigjCB1ByoJG0a6DTHLPvYzyUT0+fOC3AdWJiopFQhlh9M+gHAdgJO7JzA54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnG6NUnV; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnG6NUnV"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-87f4e914a45so33848477b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055344; x=1789660144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+b1rUPajXnIz3K03+u8nWNAorrkHepuPd1JCl0GIhBY=;
        b=TnG6NUnVy4+iHlRBW43ceTsWEWc5DYDndaKq7FUa/onhk8JRABWoNwMMO4KqwfSWXT
         msXRVWj5HOcqR+bWE8UVfDJd4pNS7Olr2I8B06FTRPtD5X+dM4HQdB0kgZ1YR/JMUqVR
         /rgJhIKZTnEALKkGowgyYAftIBMAIQNK9LH7D7wBJTEzI/OjRYuSeFdFZJeDAE1oL+Ef
         1nscFOvMwQRlDyX50J7LoTgK2yNi3n8K+k+GvyvLMfGIFxNTzIPsLMHvzf5xvFgXaIrk
         AGcsUaROCmM+rpGEeSFC25PuLEnJuPuu52J5k/8lpse5vVqKoEziTwhH1JwheW02wTrG
         4h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055344; x=1789660144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+b1rUPajXnIz3K03+u8nWNAorrkHepuPd1JCl0GIhBY=;
        b=b2ExIxe14eEaKfBZVjukyVaU2Duhr7fg9VzaS3rn5O4BxBUDsJv0VBWp5o3l8FIHmN
         0Onr9aFt1G0u7OknyFVJTUwPNCZkfzlIK2Yrzsl9vnhkCEqsO0r3OVi65DUP35Xz/sAs
         D+zxqqSbVfSC2BVAlCiBeQhTADdm5dZELcdbd3VL+ip8owqX3JkwecV0ED1HOZAJDVQP
         BvCDxjkn21gZhmls8jc4Gk9xbDl0Tn0OM3ZSkU+kcQKo+YuVatBkA4/NCEMJxpLL34Ww
         MtXwq2ElTwjE4YiuU4zhhj4Kv8a+WJg2fEH3lijX8HJ9m7HC3Jo3uvpdsJ1ymUlHJ0UN
         x93w==
X-Forwarded-Encrypted: i=1; AKwUvBwjXMzzSev0L7rsegNm/o6kTE5+sDN+ku3IJ5+tsSl4bQttdixSG6vjnlr1yWCcRilQwOLEpUHH8bSmXjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k6cCtmCh/xsZ/9l4Zm/JJDXVRWRP5BUXTiG477fcA6BwRZ2rrF
	PYhtM2/b7T1hcCQjVt+vlxvzethK/ZIbS0KOUYx+oVYjR2iUhN7yUGDA
X-Gm-Gg: AYBFou1OHh3670QNwzMVxfcHZ8vhflJ/64uHZ+oFnG0XQCwvUlMkHDDv+tuJEUBJeel
	PbB/nKXfGSKu9aoZR0bhQfCVlOpvDJIosNzAYPv3IDq0CyDm39hkoK31LK24rvTgYE7ehlDRW8O
	L106+vwt5yvv6BBbWkBI2om0UZPBFY6V3QJC65uhLujwRW7ALcttSWDR71pXs4iWN268gF4rfmF
	+2gofMu8GSg+M+OeEVTzfP9F4WFUMmweHO4003XFFct9kzKNNkdl0Tkq7ZHRJ06SPQrAW4GWVis
	7cMQ2MRgexSgh/rMos3B4AuhV2PUdtIPGWKyexH51UDsjmIAD8po/biSs+04YrcA3e4ft+TEp4Z
	BqYqRAqsT8D7j0iduj693Uw6GVPDd8hWRrPfcdootKIeNmzlI44jHrs774ag4wKfSpYAtq8cPFU
	vuEv7Ywu0Sqw54KfDjPoKba65xoUjXPvfpV52msP5EqZuwevPxAWqVJH8kOHCdqviMgDXOUbHBR
	iwiY/y5zajOIFLu98mjrU+5FoeYrEgYFPTqZgRZMolBmvvkYYkLwqK+PPPTmTXIrtDiPWrX1AqW
	UqXxKjy1mt47Xr0Wct1hmfqyvFO1yvBSzNcHeEkCNrzLUYgnNWqSH3sN5QJPd6V94U8rl8k/lg=
	=
X-Received: by 2002:a05:690c:6508:b0:873:5ddf:d871 with SMTP id 00721157ae682-8735ddfd9f7mr135085687b3.60.1789055343629;
        Thu, 10 Sep 2026 08:49:03 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a0f5:ee47:8227:6ffc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm174102926d6.14.2026.09.10.08.49.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 08:49:03 -0700 (PDT)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Stellman <astellman@stellman-greene.com>
Subject: [PATCH] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs
Date: Thu, 10 Sep 2026 11:48:49 -0400
Message-ID: <20260910154849.66095-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_ns_ana_grpid_store() and nvmet_ana_groups_make_group() accept an
ANA group ID in the closed range 1..NVMET_MAX_ANAGRPS, but then pass it
through array_index_nospec() with NVMET_MAX_ANAGRPS as the size.  That
helper treats the size as a half-open bound, so the maximum valid ID,
128, is rewritten to 0.

nvmet_ana_group_enabled[] is NVMET_MAX_ANAGRPS + 1 entries wide, so
index 128 is a valid slot, and the controller advertises ANAGRPMAX =
NVMET_MAX_ANAGRPS.  NVMe Base Specification 2.4, section 8.1.1
(Asymmetric Namespace Access Reporting), "ANA Groups", defines a valid
ANA Group Identifier as "a non-zero value that is less than or equal to
ANAGRPMAX".

Two visible effects.  Writing 128 to a namespace's ana_grpid succeeds
but the namespace lands in the reserved group 0, which Identify
Namespace then reports.  Creating and removing ports/N/ana_groups/128
increments slot 0 on create but decrements slot 128 on release, leaving
nvmet_ana_group_enabled[128] at 0xffffffff, so every subsequent ANA log
page reports a group 128 with no namespaces in the Inaccessible state.

Use NVMET_MAX_ANAGRPS + 1 as the array_index_nospec() bound at both
sites, matching the array's actual size.  A namespace assigned to group
128 now follows the same path as any other group: its ANA state is
Inaccessible until ports/N/ana_groups/128 is created and configured,
where before it sat in group 0 with an uninitialized state and I/O was
allowed.

Tested on 7.3.0-rc1-qpb-cc-base+ (unpatched) and 7.3.0-rc1-qpb-cc-anagrpid+
(patched) in an arm64 QEMU guest with nvmet over NVMe/TCP to
127.0.0.1.  Before: ana_grpid written as 128 reads back 0, and the ANA
log after mkdir+rmdir of ana_groups/128 lists group 128 with nnsids 0,
state inaccessible.  After: ana_grpid reads back 128 and the ANA log
lists only group 1.

The issue was found by Claude Opus 5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook

Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
Assisted-by: Claude:claude-opus-5 [Quality Playbook]
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
 drivers/nvme/target/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 413ee2d16d29..0d4c69c4697a 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -698,7 +698,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct config_item *item,
 
 	down_write(&nvmet_ana_sem);
 	oldgrpid = ns->anagrpid;
-	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
+	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[newgrpid]++;
 	ns->anagrpid = newgrpid;
 	nvmet_ana_group_enabled[oldgrpid]--;
@@ -1976,7 +1976,7 @@ static struct config_group *nvmet_ana_groups_make_group(
 	grp->grpid = grpid;
 
 	down_write(&nvmet_ana_sem);
-	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS);
+	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[grpid]++;
 	up_write(&nvmet_ana_sem);
 

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.53.0

