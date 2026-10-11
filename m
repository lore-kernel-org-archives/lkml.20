Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CC3C1F3A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699550; cv=none; b=ZqqXNAcYeSgSuEgmSTozwaTVw2qAr5db7PlIbiHZ/ki3P1qAWTxAcIqV2yOac4jUqLvYnq4GcqSA2aCem6NOlRlwrChtpRI8R4d57PCSFoKclHl/AK9wjLNVVVZAMD4QzCh9xIuDpwjh8XOr63ZorcHxNFc2oBSyNaZbfrt5wDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699550; c=relaxed/simple;
	bh=Syvtv5TU8G84sqxZF16vSthDh1pVvlT04GZe8z2on7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISE9GtKDNqQyFntZjyttO/RBgmf1c2GIDvveMfngrTanEqQBrWhY5GDrKoaRnt2UhLP6DMHMIdfp2BFYD4Osqt0TejvSXlGY8LbApE/V4RspP4lZMvhkTeeYob6oHSvh8lhg2ycVT6OgMpGh6l4GStnf9BI5jz2tUyo/JtigIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0ra3FKk; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0ra3FKk"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso150145a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791699547; x=1792304347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKqO8U0N9KUIsp9WaO2HUaajoGpB7Ld3fzjtW+oaxw0=;
        b=h0ra3FKkgi1bntL3d93K0eKvQM2MwWYC4UQu9EB+4Km2asZQ0pmPW+aA6FviLqV8nc
         moFoGLC8JZSuGbAP7tH2eya8rD3me5xKVbtHKP/LXBBtYIVOSPlD4nCdvsLiETTPzQAC
         XCPEy5Sf7RnWDlKrf46AA+WedO3gVrhqEtHpxUjP4H1Hab3fy8Hc+Y83wo5Qxr+2gIfE
         bFSyzSi8kExWtPBdZacV5bSgeMXRQQ+FG/VEbCRT+Jukd7xaf10Id4LGVcnP0DX4qVJ6
         qWVD8YHV9QlFB1vGKleVovj7Vs1HCr2K/LtlshQq7jog3U/7jQvWeFv/t2deC9plsHRw
         c6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791699547; x=1792304347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKqO8U0N9KUIsp9WaO2HUaajoGpB7Ld3fzjtW+oaxw0=;
        b=rI41P4p2BMsm7kxlRlr+eQFmRTvngGQx4qhf73bDdjwOpWxA4k1rvi73qWkOxzTMBi
         Vsh4eMtU9U5pY8PXWTE0ZtorOrLXmHfaU1ykYEj0ZeAyK1E3t8tBQEGPC0rWloGeAIwM
         UdGybxhxRVjsLv3f/kT5KWomgVZB9ixBoPvXcXnsfULYEqQLCVRPoudXsVkD4BsJ1N6i
         PAc6l8PH1Oylu1LEuMP0UJfE6qF5tKx/eGZPyPbr4CGi++l8v0spIT2r8dvM0O+3SzkW
         86ndfIIrVITWwY8F2lYsBFdOzUNbCQ9j6edFdT5b9dYpwMJ0pMrWq225Z0qUdbhkBFQZ
         yIlw==
X-Forwarded-Encrypted: i=1; AKwUvBwk+zH1mok26sO+WfManOFTxvsFGFx0a7aAyv5rbDkvWUXAhJcJX0jDLiUB9nRbI9+IIwsVDAEZ7Znm0rY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN4Jbc4iU2SwV7RU7S4iy9QRtjjLf8PjIbUOx7Zk6RhXO4GrOA
	zlllDs4yitLIeXH3RNiK6EGpc/chkvoude2ft3s5ca2zuHf88cDYIQ/w
X-Gm-Gg: AYBFou19uBhT6C800NUUhSi965BQZHsYOBfVgJ5ouNBK72xYtJRMfu99IbGLCJGD0zo
	rcmXXwifzratPS+4BshybJoOHuA4zCLphT64Um2Rq4qCfx0DCzQ1CZVFiYlsGDwtVCa1K+6+OOE
	IIIYsTtwFhGJe+uYTZnzb7W2bd6Ax+CCUFsXQkfBXhFaxofOd7aZfktFkIuPCd0SE9ecQj4k866
	UYaEhGau/Mtjw7XGdEO9lGioRXHZS5ige4yP5FqJK+YtSMkt7zZWziSDwIAWB0KZyiaGBucDLAf
	o6u5LSws1eCopq3iZgF7owWEQaBMq+YGn6q54BylhM1HaVqG/Ov2L11TGzmRxS7eh5yfwqOIvS+
	140iJTac2oEljQf099TWyIOMIX8s/DTGqxO9VQ/o0NBLUKZ2f0xafavCnbAIcl4QHRHMSlYezJb
	RzvdEPoED8NVksJ/rm6cxCyu4VJ/09xPDILHJfm/5/yK+XmoNsqYhsS1p46qoX1j5p/vPhq2O9k
	A==
X-Received: by 2002:a17:90b:3c04:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3ab3a932622mr5820088a91.49.1791699547210;
        Sat, 10 Oct 2026 23:19:07 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm10789409a91.8.2026.10.10.23.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:19:06 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+dc50906b100ac7a1c34d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ecryptfs: validate key payload size before using it as an auth_tok
Date: Sun, 11 Oct 2026 13:19:01 +0700
Message-ID: <20261011061902.144716-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ecryptfs_get_key_payload_data() casts the payload of a "user" or
"encrypted" key straight to struct ecryptfs_auth_tok. The payload size is
chosen by whoever added the key, so a payload shorter than the struct
makes later accesses run past the allocation. For example, a 712-byte
"user" key makes write_tag_3_packet() read the password signature beyond
the end of the kmalloc-1k object:

  BUG: KASAN: slab-out-of-bounds in ecryptfs_from_hex+0x18c/0x1d0
  Read of size 1
   write_tag_3_packet+0x145/0x1430
   ecryptfs_generate_key_packet_set+0x7ae/0x1880
   ecryptfs_write_metadata+0x590/0x930
   ecryptfs_create+0x393/0x550

Reject payloads smaller than struct ecryptfs_auth_tok with -EINVAL. The
callers already propagate errors from this helper, so mounting with such
a key now fails cleanly.

Reported-by: syzbot+dc50906b100ac7a1c34d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dc50906b100ac7a1c34d
Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Notes (not for the commit log):
syzbot reports "KASAN: slab-out-of-bounds Read in ecryptfs_from_hex". The
reproducer adds a 712-byte "user" key whose description matches
ecryptfs_sig=; the mount succeeds and the first create makes
write_tag_3_packet() read the signature past the end of the kmalloc-1k
object. Tested in QEMU with syzbot's KASAN config: base kernel hits the
KASAN report, patched kernel fails the mount with -EINVAL. Fixes points at
the initial ecryptfs commit since the history here is grafted; happy to
retarget.

 fs/ecryptfs/ecryptfs_kernel.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..863761b3847a 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *key)
 	if (!payload)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (payload->decrypted_datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)payload->payload_data;
 }
 
@@ -124,6 +127,9 @@ ecryptfs_get_key_payload_data(struct key *key)
 	if (!ukp)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)ukp->data;
 }
 
-- 
2.43.0

