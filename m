Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E43E4C75
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051590; cv=none; b=Q3Ub5s+7sOa+6dIIHCa8jBzDI49t9xRHNpV3RzLjjkqyKVRWZZ6pxBTUbRy30mchOzkPclBdp4tar4RIPhQEb1rd9wJ91N90yiRJUOAqDgbSTl0oTbVoQPpiR2QeIbyhhP7kRE6QjbxVaDNR4KUw4ar+8Rec0P469iMNr8Meoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051590; c=relaxed/simple;
	bh=B6CpHE1fDzJtw02VVA6XiCr6+jtSG7DDQ8B6ZbaZFOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kFCZytWtYL4J9SYIgAM6ePz1k0HOj80mXFGFyqXQ3JIlFRVCYpdErInwB8MShWTFrNn8qN9u4dEl3E1sZrPvg4yBZ210hbSb/DFJnK9koQdpvfIYjBir1qtucMZJCgt1um9EkzPeB35+jUKYM8sF+cgQoSvzhRCb/rPpOLX/9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5ALZ20X; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5ALZ20X"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2003740f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790051587; x=1790656387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HkSG5y+EkU99t9dm75vxcWD0esNMkVyz0Y8AlZlwrNo=;
        b=C5ALZ20XsUS209xtO44XOm2SKIv/Ca/2QIKM9Tjwe7AMCZD5vMz1RYQtZq9+BXOXVM
         E0xorcAV+5MYEVcEAedy23NdDNYzh550mNTRYdRl/Nqqws7c8uSJq97sHgBxkBHb+brC
         /JuAqOZ5aebzMjhSE2CmiB5x9gBRKGkS7/hQ9IG/97NokkGhkSOTxo8qdBi99vJXUvNb
         DZ+7WxGcmXQ43EyzL2BEaBKGO+bBsSK9m4vVl5R8JOlOQcnfps7+aZ2JEUakUDZhxlGQ
         6cete4GNS1ZH7fUgpLQO6FabTpAR5tPrk0120UeQVFu++SLFk8fdIC58VGijA5GfJTYW
         aOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051587; x=1790656387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkSG5y+EkU99t9dm75vxcWD0esNMkVyz0Y8AlZlwrNo=;
        b=ggA6Rnj8wueeHZ47GJs9NRj7kJzCSBGI7JEgiY9emxb4MMfqTKiDjUkLuukMMDfkDx
         fHf9h66VgMh5cYsVBl3bGI5QXh2xxm9h15is2MlFvUk+hAHsukI/oWPHYo4wUYyuDlCS
         zcaoYzyxQKxAm/XTkZiBJxcwxLwWWqgO2AFaTIxhcQCWswtpecjoswtuwKuNhREBVQtt
         ZRLZT9FP0IwYfKGRF73oPES4YwK0Ub0ALr8heu84+uoffL99WcgPkloensJJBzLAeo+h
         TXzFCCoEvgLbWvd1FduPPu1unSFzkYzoCsGSju2H5i3GsvcqngpEe7D7zfyXsCo5R2eT
         lHQA==
X-Forwarded-Encrypted: i=1; AKwUvBxpKy6JVf4bWhsThS3Pi1aDFTjB3epZhDEc/JoxK2HjFrwInUhchla2L569HeDxmLkky8rE58yfhElPSrk=@vger.kernel.org
X-Gm-Message-State: AFuF++lXMnldaIrS8QF7JgbFx5jorE5CbRVZ9P6Ba1gPbPXu/jZTfd7q
	fr4aGhgP/AgiObHEFkzKzRYjtuzjB+e3cYBRZ8pD1g1dS6dUmJXd1HLZ
X-Gm-Gg: AYBFou0DKnBxL9o4oXVEbl/UmxzVatKH2wC1ntuwym+rtslSHUI3w6ryuuwgFqx9orn
	8lrCoGK71pm6TxxefYT3ysHlP7gaYMqdFUwApwcVAHD1boxBm2o+nxOuLCY8XhzS2ioK461KkzT
	LqOm+2QDNCOkzjdQkkimhBgfa/g3YtEFEaxCQaCAQ5ShOYjD1axZWEOOxAQCFF6DO5qF8+jRl69
	BDTHjFON4PIxK5pFaoOh1blrHiGBTef3aTO1CQ5nnPeSIYTb/fTihq3Tk5rNgA9UhrtWhtFK5i2
	JZH/F2q5jpoUkF7HhbELkx47twexJ5MbxdFjmB9Cq+JRuVqck9xPGzHJyNThHUeOxPkP30yWWf5
	/naNcV2bwdGF9W+/JrqVlA/rQfqnJmMbfZjXUsETaC8b2L8LuTAR95yafKfP+bzeQJQWw/FCgx4
	IO/S7pTMinywC9BDkwe/MyoazekCWc39qU5bIhW4z39lO18x4s1+G5/EKim64eOTSOvuB/znCn6
	iudLKLQp0isQrGEvwOM6BWRzMbeZJj1J3rXNBU7nHKxs+15HUJTz3T4Gujav9Emcu86b7REeORj
	qqkpU663EIcSh6iAnHlAxpcVdMLNIPLFsxu+zRLHmVyHPUSyCXUrt5MQdWgkYE8+z8iCDX/gP4K
	cXdPgZw==
X-Received: by 2002:a05:600c:3b98:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49fc56dba0dmr220453475e9.7.1790051586799;
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a5e6-3401-ecdc-1e24-2e52-02d6.310.pool.telefonica.de. [2a02:3100:a5e6:3401:ecdc:1e24:2e52:2d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm1751410f8f.6.2026.09.21.21.33.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: include the final partial cluster in sync writes
Date: Tue, 22 Sep 2026 06:33:01 +0200
Message-Id: <20260922043301.15101-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attrlist_repack() synchronously writes the replacement attribute
list before updating its mapping pairs and freeing the old run. With
512-byte clusters, a 544-byte list submits a 512-byte bio, but the
write returns 544 and repack accepts it as complete. If the later
buffered update does not reach disk, the replacement list lacks its
final 32 bytes.

__ntfs_inode_non_resident_attr_pwrite() converts attr_len to clusters
with ntfs_bytes_to_cluster(), which rounds down. Before repack, its
synchronous callers used either cluster-aligned lengths or lengths
smaller than one cluster, where max_t() selects one.

Round attr_len up so repack writes the final partial cluster before
publishing the new mapping pairs.

Fixes: b1d732e62a5b ("ntfs: repack $MFT/$ATTRIBUTE LIST")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Built fs/ntfs/ at 444c7dc82415 with W=1 and NTFS_FS=m for x86_64 and
i386 using GCC 15.2.0. Both builds completed without warnings.

Runtime-tested with QEMU 10.2.1, x86_64 TCG and virtio-blk cache=none
on 4904082812d5, a v7.2.7 stable queue containing b1d732e62a5b. Test
hooks called the normal unlocked update, forced the optional expansion
to return -ENOSPC and used a 64 KiB reserve on a 16 MiB image.

With 512-byte clusters and a 544-byte list, both kernels paused after
repack and before the buffered update. The old code submitted 512 bytes,
returned 544 and left a marker in the second cluster unchanged. The
fixed code submitted 1024 bytes and wrote the exact 32-byte tail. A
1024-byte list wrote exactly two clusters and left a marker in the
third cluster unchanged.

A test hook returned -EIO instead of submitting the 1024-byte BIO. The
rollback restored the original mapping and all 544 bytes, and freed the
entire replacement run. The image cleanly unmounted and remounted
with the unmodified queue kernel.

Runtime coverage was limited to the repack caller, which writes at
offset zero.

The base's scripts/checkpatch.pl --strict reports no findings.

 fs/ntfs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index cadf623d54d48..d8d3a7b7b8a9a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3761,7 +3761,9 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			struct runlist_element *rl;
 			int bio_err;
 
-			lcn_count = max_t(s64, 1, ntfs_bytes_to_cluster(vol, attr_len));
+			lcn_count = max_t(s64, 1,
+					  ntfs_bytes_to_cluster(vol, attr_len +
+								vol->cluster_size - 1));
 			vcn = ntfs_pidx_to_cluster(vol, folio->index);
 
 			do {

base-commit: 444c7dc82415a353b57e43189f276124cc5fd785
-- 
2.53.0

