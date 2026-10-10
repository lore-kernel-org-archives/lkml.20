Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE93FF8AD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629688; cv=none; b=Tzbp2igOvam6vRXUGFvXQ2J2fqTSRCHl+0jlNBsqApRZRwQtAghFBks0uSZ0+YtbfWGkA5fJ8/ywFYooNBbRFsJqLw+nRkyCVqtUbJLYWQvuhhdH/xhGkieN63peXfYOgqiZt2uN6FFyeVUSQiLElQSLKvSjJ8aza0rsJMjeyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629688; c=relaxed/simple;
	bh=Lx4pYf7ox2ftKijZw338RFHnP5fJrmBZaR9iQNhr5fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKztiC0hrj6gbcSTU2IfDICyjzOgpom+z9zDi3wHYeBnTn6/J/u86AT4y9eyhsDYEsHogPwDoA/J7WP5rVvCiNAeypPrvpStb1t7ftgZBhaqgEDU6oL51aSFjEiqgqmSqURMBpZbH3V4x0FY/oPQnYm4dMyGO4GJdNho44xNaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=m2mxfjzZ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="m2mxfjzZ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e762768f3so67152485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791629684; x=1792234484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q++ROavf5Dntc+2Fvf5HgOibvKYoyzYPl6CilCM+dkk=;
        b=m2mxfjzZix1oEhOzoj2ZW6wmgD/o7IARnsVTgaza9BEdIbkJlDHdOKp2llm1VeL1w9
         5cOBxOU/GXJQyS59F0dnsvFnAVPqUun5GhQFN8BNDR+2xvqkDxkk+mxTPadUvMM1/I1a
         vV5UVqtxe6aR9PKJFaMdwBWdakGebYKkWC4UE+EBNiNLIXzKDCuGlSK4ZtRtyQY5VBvM
         sRUcnTX4ay7aMQgVsaQ0twmv1JWWjZOYREWM8oao4QAM0/bM972lFeFgLlR8I2kJrIZX
         0N42M1k4r66epuESs0wx1a4iJdKfLBcX/az8MfGO6yUzhW+/S4W0DclOAr+iGLhKPsmt
         llug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629684; x=1792234484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q++ROavf5Dntc+2Fvf5HgOibvKYoyzYPl6CilCM+dkk=;
        b=yDlZ/u3rASI0yTiQrPFZV1UllZ5CTcTGvc4eCut7JJXFpzOZzH61KbvfzTK7m06vkD
         lYaJSBJNWzHmEa/YszunElFWZyPoKiz/nyqmY8gn0G1RismvopXw36Kx0bZIZA5NM3MP
         jo+rGRTCgSp0eEpdM5GrMGxpHI4oeGnYIBwDTuhu39O/AzRAl9YK4RQ2lKwD/nHf+xxj
         V3xJiY5vLrSLqhZvWABkVeoWAHvB8Wbhawl9EaUAlwiSYrCNWgCSe7XLJXo54MceVcB8
         PG9BqNfS2LBmWl6vbOX+rwSUq4JA5pqsxQNVKNmqRfpJ06+G3nKTJQL8rdtXBObu483C
         tf+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxAaBEYh2j3sXyA4ZnoTALhUUrmYGY4udYA+nkgk5SAyoO9nxOcVXwqV4TNnoYM5UrftucgE08Le1BkRbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPD1lGOFr0hl6Vh5hNUkCNs4abSWNuKgjre7bDjnz8nGyu85tT
	sYjSRt7XacVS9mk2+54DuyfEiP2dzpStbPnsy1oZykinfJ5UHTrHOMb6pD6R/rYJZ2+O0+sKInL
	v1c72iA==
X-Gm-Gg: AYBFou36Yx6IYuwiSFjxMwpU7bJnf/Wd1srVo/mmR2/JRjE126MVSvAoltjZ2m9UwVL
	KNKlN9BciZKqPkM1kzNykMbTHKRSbQVLPNm7E89BOcFABiVjGqw4Vn112keXMf3X3K1VhpEiuVu
	EZy8L1o9pjzdAZQKz+uRTLXXJT6vU1CDuatYE2z+zyo88nX6vEo1vYbF/EhsylWJbNBhzCJQD0p
	/ZZqWqSfiytklMaV9SXLy58vG0m92ncGZuVc71JTNsfvtIfQes2HgB398SjuWi5kt1rueilcjae
	d82xYkQ7b6RzNYrbjfHzrinSUzxowBMvP3CMzaIQF1AXOGmj2u0/6eeaXM4fVnLnplgY4PLS0zo
	m+JSJTHaqHZG9F+gnqmQtjQpqPKgGcqiZuGaOdedc5+NxqwxvcOFJco9CD4QWe8hsLEPTOVYztg
	9JaFFpGRZc/ALXd/h2Bj87ulLUjuWb7ynSMMM9TZRkqHU1+K9E/LkYYTCHpmS1BBk1xqDm7wf6p
	zZFEm6P2AsAZw8kS0fawQ==
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:f13b with SMTP id af79cd13be357-93ec12d085amr605390185a.69.1791629684570;
        Sat, 10 Oct 2026 03:54:44 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm394602785a.32.2026.10.10.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:54:44 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Filipe Manana <fdmanana@suse.com>,
	Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] btrfs: fix chattr failing on nodatasum files that have the compress flag
Date: Sat, 10 Oct 2026 06:54:25 -0400
Message-ID: <20261010105425.165104-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cf1afec09e9f ("btrfs: validate properties before setting them")
made btrfs_set_prop() validate a property before setting it. For the
compression property, the validation fails with -EINVAL when the inode
has NODATASUM.

However, a file created on a filesystem mounted with nodatasum has
NODATASUM and still inherits the compress flag from its directory, and
btrfs_fileattr_set() sets the compression property whenever the new
flags include FS_COMPR_FL. As of now, chattr fails on such a file, even
when it only changes another flag.

The issue can be reproduced with:

    mkfs.btrfs -f /dev/sdb
    mount -o nodatasum /dev/sdb /mnt
    mkdir /mnt/dir
    chattr +c /mnt/dir
    touch /mnt/dir/file
    chattr +A /mnt/dir/file

Before commit cf1afec09e9f ("btrfs: validate properties before setting
them"), the last command succeeds.

After that commit, it fails with EINVAL.

This patch will make btrfs_fileattr_set() set the compression property
only when the inode can be compressed.

Fixes: cf1afec09e9f ("btrfs: validate properties before setting them")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/btrfs/ioctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 52aab510aea0..347509043f2e 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -421,7 +421,12 @@ int btrfs_fileattr_set(struct mnt_idmap *idmap,
 	if (IS_ERR(trans))
 		return PTR_ERR(trans);
 
-	if (comp) {
+	/*
+	 * An inode with NODATASUM can not be compressed but can still have the
+	 * compress flag, inherited from its parent directory. Setting the
+	 * property fails validation for such an inode, so leave it unset.
+	 */
+	if (comp && btrfs_inode_can_compress(inode)) {
 		ret = btrfs_set_prop(trans, inode, "btrfs.compression",
 				     comp, strlen(comp), 0);
 		if (ret)
-- 
2.53.0

