Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1B3D1AA4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074873; cv=none; b=pt44FY081vRCuDpXfCwz9aexIJu/mSAXkqOHISmvp/L0Nvip0bS/YMKVdvcGJuLPsNbTM8kAIGdU45C+PzgPGrMr3QLsdi+FAosRR4DvzDsLZ+PoOS1BUR/bPgZMHtVoarmwFdviY52pZzwNzFJEM1nGLBhlbE6BIxFbl5wQd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074873; c=relaxed/simple;
	bh=CQ4xayDEoFvr1jT9OHWxpjAmKzgZYc3hdWOA8DdGpNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ux9XBNcJxfnw0FOx2Xj2s3HLp7sYPI3ZGE9F4fWUzY5T1Ge+RARelaEnr7dfzfoTj+SpsZPajt5RmWdgMepeJZ8NP1ViSDhAC8DFJPsvqYhH8XBWLzfCIXO2JpcOjhRfT9psZy3rnSqkC0nFj1zhrigzHUqcZTIHvik0vQ+uObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeWsgo6W; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeWsgo6W"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35de2661992so984956eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074871; x=1792679671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8neBvXrJ3PxtaBrYkVCU0EsbaYcYW7zqj6dnSnPhyTE=;
        b=UeWsgo6W8k3ihlyGUhMs/xIqPgvrEsbgmJjvEprAtB05UFaqyjeswMdWjZOoug+3YR
         fFbf3v+UZDECbEn/SHBg3LCqWIDS1PVcDEy/30thn8bNiRENpP3o2jKzNoMRWg3U65kL
         OpQs2FJzjnpEuZ0BhH1UFT2ymANbco05SjB3FsnBUJJtGK/WrzU2Wud4PrDlNqHs16wt
         OJbnPSILL27mY358jus398kfBHj+HyqZ31AjjR0QJ9y1ykAkWiDsgmQGb1fwtTJi4eVI
         cu8JkaKUxyDhsBtcPb53zpSboVxtUL9lHhrGFZbygcVF9idYNNKWNS96pKraC5ZY5clR
         Yc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074871; x=1792679671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8neBvXrJ3PxtaBrYkVCU0EsbaYcYW7zqj6dnSnPhyTE=;
        b=HUt1+JydmGiG+L988pC0zZ/gCCpQdWyjVstNScqQR0ayiygkAN+Ahuz3h3EF+Gn5kp
         TESmrejs7bdQi4gCZkb8qUXY0Nppn7fYLA90mmzXsn7jp76gWR0PYxQgM4lvUrh+d2dC
         IJ+GkCr0IP8hB6l8IiODap8+2w1NKAkris9Qxk8gwf+63us9wPFMX0B0VQem+NTPjH87
         OJNpckn1rrvCmQytvD8zhmmKcP4Bm4e+rnLpqTq7WkJgDZ/nKjIgTv/ud8iltqMkTDPE
         Xp1NrzhQkKCpeKLBxZid4tLUAV/1g9sUaIq6o2SJjlKSZcC2YVcn+G8of02OjHM7VvFL
         CktA==
X-Gm-Message-State: AFq9FYK2lumnCqgdsqXtyQaEYinGfgH+kTeithFuweY8zJyABRu5JP//
	xklXer9H/j9gLZvXyoMT8NM/JGEWIj/nvdOPHuWiDIDtkQiLrBL20F3DHxuXh4UgKLiM/8dU
X-Gm-Gg: AYBFou2zYssqjzOO5hyta9Zenr02UrrTgrCkbIwBMUdYb4I9O9Mz+6i4RvQIeM9PMr1
	LPXmbTQKs2TKprqRTJAsY1D4h3wu167z4LPg+nQnwWEghUv0hpd9gjQPhxMINh1i+LqerVBNcAa
	igJit3f1PLA91I7SJ5/UV2tO3t63xGVSChkQSy3VE0xd7W3Kc01vMVgsZKXRX739M7dnA5YwUQw
	TjdHPCYB4JRsjHK5C6GPLnHZVbiqsXhefdI0q9gJv2dK1+qNFHue4IPCPcUHdJT6/i32Kv72lNl
	BL27bnxb9cRH1tHPxoa8dyk/su0s58uzPc/FzbHi4JLyealFSsv4JzOi9e/pJU32bZNMLWNWlGK
	3iqJX50Pc7ct70ptUX42P8FC21EF4zmuR/U0wlcfFFEnGI+uXxmsr5sWbi8dNdgNNA7CWXNzF+a
	mPKQuywwxE/u679aRBl4XN37ospjCA6gFB/fQ1YGqDrDM1FMCWH/+OAqzHh2qC0KuVawGazbXEs
	VjgDpi4m0yRCnsx8GMNIIOL55TYsssAPBiY4KEBlucEVH/HyADnbWZkdJ9Vi3gv+MagerFAOP+v
	23XSwapg1QVOcdX33+ucxU715RnRwgVKUA==
X-Received: by 2002:a05:7301:1a05:b0:358:eccb:af7c with SMTP id 5a478bee46e88-358eccbc89dmr21550282eec.33.1792074871413;
        Thu, 15 Oct 2026 07:34:31 -0700 (PDT)
Received: from localhost (ec2-18-163-127-16.ap-east-1.compute.amazonaws.com. [18.163.127.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm61569751eec.13.2026.10.15.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:34:31 -0700 (PDT)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-fsdevel@vger.kernel.org (open list:FILESYSTEMS (VFS and infrastructure)),
	nvdimm@lists.linux.dev (open list:FILESYSTEM DIRECT ACCESS (DAX))
Subject: [PATCH v3] dax: fix wrong error code returned from dax_dedupe_file_range_compare()
Date: Thu, 15 Oct 2026 22:34:25 +0800
Message-Id: <20261015143426.17620-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

When dax_range_compare_iter() returns a negative error code (e.g. -EIO),
dax_dedupe_file_range_compare() incorrectly returns 'ret' which holds the
positive return value from iomap_iter() indicating more iterations remain.
This positive value leaks to the caller, where vfs_dedupe_file_range()
interprets it as success (bytes_deduped = len), causing userspace to
incorrectly believe deduplication completed.

Return 'status' instead to propagate the actual error code.

Fixes: 0e79e3736d54 ("fsdax: dedupe: iter two files at the same time")
Cc: stable@vger.kernel.org
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
Changes in v3:
- Fix the Fixes tag to point to the commit that actually introduced
  the bug (0e79e3736d54), not the one that renamed the variable
- Add Reviewed-by from Darrick J. Wong

Link: https://lore.kernel.org/lkml/20261012144925.6728-1-jianyungao89@gmail.com/ # v2
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 6ba50142eeb2..1f6a4fbb97bd 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -2261,7 +2261,7 @@ int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
 		status = dax_range_compare_iter(&src_iter, &dst_iter,
 				min(src_iter.len, dst_iter.len), same);
 		if (status < 0)
-			return ret;
+			return status;
 		src_iter.status = dst_iter.status = status;
 	}
 	return ret;
-- 
2.34.1

