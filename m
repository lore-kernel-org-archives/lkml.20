Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334557;
	b=D9TRubtKGSiZECrhqpXEDDiY1YAoyTcHbXlo11Ej48EeBylOdI4FgshP51uhVzhPe601
	 2uU/PVR626Mh5AWSTCwtREGw4f6I1XPYt+0pDtSfqXe/46xdZ8RFvkJLl1fSrETvh5hQk
	 T1NeCP0bITSYXiK68vWcQ/K/mUFPtDiHxhyfN2T9f6LG/gAzEhVAleLTHf16efSHJZ0Tf
	 2zclgrLwpXNtELAQgHuUJO6iCMCTQKVRIcZfW3utLlaal/BFX3PNQ6rBMKTg7pqLqbYXV
	 ZR3IZE1etmkfa29bFWy5kU6PyTP3yULsa31KiwOQbYsgP7jRP+J1S9ItCo1tZO1LKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TonUOmkC2Ho+zT3lPitxkCdvY2hn2C5qR7OoygKnims=;
	b=RIjS8ODQMVLlQjiG1zErOWUhaxIKolAFdao514uvmiqWb1EpVWEicEFhWrNi7nZBY+cV
	 ioEf1pPjT5fFaFpDrKIIuR/Pu8CI1D0PZXy5jCuHMh59M9ieHENF+Px0/RJM3HTOEcY/S
	 16hAKS1GyICU+q9qe6Wl+YRRgsjkPg017k35sJrZWozHxIiBGayJ+f31EkzlkB9hvfuWZ
	 5klrV8Y6BEqVHiOZ7PQgrMkfcc16WYGHhHpZNAy+6rJuOwNY5g58c/zWoUgRjGLRNu/Xx
	 RTp8J3sU33XU9EWAWFs5zlETKqkFh03ZPNdhyTX2SOKe0Q6YSf2YWhVwTU/IrUNJDuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=jePlDtbE;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=jePlDtbE
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5430f70c827so1617741cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793334555; x=1793939355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TonUOmkC2Ho+zT3lPitxkCdvY2hn2C5qR7OoygKnims=;
        b=jePlDtbEfVO4f1i5M6xZBxZnygixkiBJFneuq3WiL3C0trzneJUgCnL/sqy/38WINf
         mD1bhwjMCMo6YpGj7rHFRMDLxt99SwO8CDpBcSlvxXXng/qe2LzosSkvjMHtPV01bv50
         GiVOUUzyyCdO9kEtec90pFCIvmCXsid9mXKFpEdKvQjfXQexPndr9jSKSTsX5vqkQUko
         NYH65vBawki32Dji4Z5m5+bNu9m7kWBGqnbDaQfL5zS/fwjS2yCJXudNDUjk1JSYvonV
         vyDcNmb4WKZQZW7vMg5lYEmUrshegmoTXlfc+Ok1lBUT4VoAawszTq5bET4YF+3JOwul
         iUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334555; x=1793939355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TonUOmkC2Ho+zT3lPitxkCdvY2hn2C5qR7OoygKnims=;
        b=O3NGtwAhMKJPAJI1UUSSba9BQiTTzB5LYlvgKubhzB4xKLU0gTfesfv/CWJbiVQ1qQ
         Q5eBLqY2tPKAxvAvCX83EP3oCtVGTGyPPXSr2/s5I710oIeerfdg5FGcEig1h9ynw4Bt
         fFynGQ9pX2BBCkSby47+chng6My3FGUnOMqUuWGkWVi2xztRaMcUEhsuitRHp941wAZk
         iFSRcLgGp5JqsHoGtOLCeWO/IIOMETmfDRVTNZa9XAk5Hl9qc1Hj+vWpfcZGHiL4eejD
         DpBwT87oeeLMSfeFIhrSXmOjcW9W3oM5DnIfNHYgabXB6HK70Q3XvHcnS1fj90+LeYjV
         FIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/aquFAC758aBL7O1tSpuzXtWlV99Rr2LiEOKumBqvKZCSiMOMMcm26ltl5X9U6z+myTkdf9O2Bki14Pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3JuodiVBXIagZz1U+qAqUPolE/YI5Gnu0eTb+VyzzPczACMqM
	TIm/LbOaHMBBnxJ2Hgfal/k9EntgrgNGV4aRo6O3k5Yhv1OF6MSJzxyitMRWsQzw3g==
X-Gm-Gg: AYBFou3N+4/Gq3r+U2EykpU0U9f065Ty4Jqgh87YU2bXj0WUR+FWG2P9kyMw3dTSy77
	YJe7K+JGr/fXIQdHgc5F2oUcJm2uIu9WzrxkxL7GQygQOfXKQ3YYhqCSTIXfmv7zSEegP/YNoPq
	+AFxT30QchrA/olGVp+/Hqs0UnpHCdSY49LwYQ7vmFKtf5Rz7fAnhxQ47frAyJ97Kz++st8l96/
	0C/LRNwRVqP0JSA31EWtCBO/9LFwKnMRHlhPmYCd1p9oRwVuaFhff7boovDp0vif9avLBcPIo3b
	mo8FXiWxlh8MCwr3sFElU30+XuYWekwCo9af/JgkvEUohtCNl5TDfSl9H0OgqCpWDcEztLrS+cr
	P6CFeP8tmrObY5i4Q/ZvEtYPtPFtKYadRfFMGfuk5rDCKNAy1uQ+f/FlcLkKLdK0YrM0kC6AiLY
	ngcNSnTHNyrIB1sgtImlqSkZ/Qq52ErnfCkHBkYNxQN+MnTMv60dhVLg6ZsvAaMSEWGaRn7sEB6
	LOQwk7I24RJ//zKeiGC+vuDS7iaKllLldB+0iupj0QPy8a1xy2JP+V/6VyoVNLKDcamq5Akpo9F
	KpJhRMTQTfT+3QyBRL9ndoDwgVm/NpS4CxT6WMSfSyo0M3d+paUcQfvZtT6w8r7YAd8cl+GyAg=
	=
X-Received: by 2002:a05:622a:a584:b0:536:70cf:a87 with SMTP id d75a77b69052e-542b3e6877dmr17432931cf.2.1793334555403;
        Thu, 29 Oct 2026 21:29:15 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f254a1sm5058166d6.7.2026.10.29.21.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:15 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hfs: fall back to buffered I/O for direct writes past phys_size
Date: Fri, 30 Oct 2026 00:29:01 -0400
Message-ID: <20261030042903.4160506-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

As discussed in the setattr thread [1], a direct write that ends past
phys_size loses data at the last close, because hfs_file_truncate()
zeroes the file from phys_size up to i_size. Patch 1 makes such writes
fall back to buffered I/O, as FAT does. Patch 2 is the
hfs_file_truncate() cleanup you suggested.

The series applies on top of "hfs: report errors when extending files
with setattr" v2 [2], which patch 2 needs. The HFS+ fix is sent
separately.

Tested in KVM with KASAN, all 805 fstests on HFS with that v2 applied:
26 failures without the series, 14 with patch 1 and 15 with both, no
new failures. The extra one, generic/589, fails on and off on all three
kernels with "invalid MDB drNxtCNID", the next CNID issue from the CNID
thread.

[1] https://lore.kernel.org/linux-fsdevel/161fab786f919adb384fbf22dc19f3289bf5f24d.camel@dubeyko.com/
[2] https://lore.kernel.org/linux-fsdevel/20261021145627.288953-1-hengyul@cs.unc.edu/

Hengyu Liang (2):
  hfs: fall back to buffered I/O for direct writes past phys_size
  hfs: remove the dead grow path from hfs_file_truncate()

 fs/hfs/extent.c | 18 ++----------------
 fs/hfs/inode.c  | 10 ++++++++++
 2 files changed, 12 insertions(+), 16 deletions(-)


base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
prerequisite-patch-id: 737ea6125c4a7fa08a4deb38cf33d27fb791a812
-- 
2.53.0

