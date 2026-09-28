Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95B48EC6D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585316; cv=none; b=UBjQSc6UsB/qKKkxNoH/yVAqMoh6gUms6kDqTk4BijBjli3bEjrOuZpUfpFRA7w2zr2K2cJXn1CMdQc3LCBk3slxpgtwcNR+DiOZpejMssQcKAk8sObr5Ozwrxh8NfNUhQNEDQ/cWjFxsVXdCUdyvgKkevvdKWqyB0ajwGTc+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585316; c=relaxed/simple;
	bh=RYRoyEZy3AZX96/W22uGNOvKvksOSwlIn7uO1WdQA74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jW4DO/vEJv9Ixlm5GGSabzBGy8nxx6rhFCb60A4Q64u4ySpbDotJvWw8ArzfACuCKne0QG1HPgrewa47J6itgj7FygXy9vqUINUHH66D5S2q0yT3rpXEYuMGrSsfQqNMbBniFj1XHYJzffa49jKvunO7WCVWY++igNyTDgGuPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPoXHJLF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPoXHJLF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so8893265e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585312; x=1791190112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/GiZQj0CaseyrQZxOd/ioPb55nZ1v2BOlX+DpEu3BI=;
        b=bPoXHJLF+XF7W3GG1m/hUTsZ23MtnLwud/DKjpYqb49jXKOdyE4iLwWWvMiZoXaS6K
         +jC8sz/94dqDUA9Kw9qCGY/xJ6ByGOaWA2hHR7cdybx3iJ14FvGJW0g9A6H2/dc0zsTe
         +MzF9NDzM+/RXhAqP+3x2LktjPAh80pNuoIUk2cQiHjia7gufCy+ygXl40O6asVwpiwF
         jOEHJ/UxnrygMYcQ+1rT/UCg3uJ4GGw0WdUfs7NITbZ0PXJSr/eDpvbN30SyfhfLi5ik
         dhL8AENaQCXI0ohPIEBWM1BtwPzeAl6+YcJEbmKI41YSjtrx1MWUDOctwhywYpGXuh1S
         BmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585312; x=1791190112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/GiZQj0CaseyrQZxOd/ioPb55nZ1v2BOlX+DpEu3BI=;
        b=o1MRaxCRJX3eLC+3g6v/MmUsrjEVXUjKO+tcl4dPgml7O65OMyM2Sc+wVysF/Rm8HF
         uospWlQl64j3l4on0jUkCcsexSlAIZ6kjmdOVcqRXu3C9tLeMjs5B3icYKD9QN1D79rI
         F8dO/mbecgv/P6hNSPF8preE/9/P4gGs7mkTAumOKVd5MT7CZVb/JkuMS5dtVW6kcwzc
         W4Rs4f6jyL3Eeg+NomBsy7vyCYvNnrWfLmSSYERNaBC3K+4edn9DmQKMkTB98/ljB6FX
         FZ0Nih9CxOoYCioaM7uadvZEkKwl3ZqdbIO4RDWf0WQx7LF4utkAI8g/1fU5DAYUmMVD
         xjkQ==
X-Forwarded-Encrypted: i=1; AKwUvByuIBt7Ndcj1eVGep+LqkD5nDQluhLrJpM15+ejo7Du3OOFS/cRDZ57rxOhTlZDLma2fJlu2hCv6rumJl0=@vger.kernel.org
X-Gm-Message-State: AFuF++mf1FEGhl3WNwAnjYxR8Qn97/sRlQ3Z1YOStF+0lGMbiyNCB/FH
	CCHJOhgUGXs+Ty7JTnE9VQ4BRX8OzcVgofjINwKkUyQAT2eypaYh3Fn3
X-Gm-Gg: AYBFou0JHufwdoUsGgfdEbYGGw63GYyr4si+/Hlwdf08hTjn6xZxi/BuFqB6FWxqg5c
	rvh2vn1D3LLlTIZhDy/nhlWlo0402DABBDyhIeAZFI+0f7I5XOD+NSe44iWOdhJPhzzRF+5J2IS
	1/NFaSc3NqS0/8XEtu6BNADApgXvMkvOfGZgywgj7SsIsk+3xeIdR3DO6fgnE77gqHgvRyBgE2S
	F5CqWxnsi9euYqxtwfvfxrvh7vkJT3oJDiu6vsuJRXRy3vG63h060wPx+Ni4rs1VDJxRjYCmzn0
	543G3g7fwtSDtPDljC4qWBYNC59hUoDCy8Lp2zJ0RpRFTLBrSMCUpj90+OEWbC5+uz2d4SDbzPy
	qWRlQEsK9wXUBLs2UJ3J1x6857uL/cFtxmaqsriIBghKdIx45ZCqqNHynJ03IC0ZR/l0ymkawbb
	hWHeWr/oU7C0q8ZGk28kqTfc/iZP4WR5Ckcm0t6s9bidKLZEZwPFjhZgbY5o15yLpFer7MmAwg5
	GzuhqYgFosYdsxrVTkhnDs8CnZ2Skwgvh7lOiO0EPnjWuTZEZ0O6/ClhmBvNiviDR/iS2MQ6vUc
	2i6Z
X-Received: by 2002:a05:600c:4f47:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-49ff06ed9c1mr189367295e9.28.1790585312467;
        Mon, 28 Sep 2026 01:48:32 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm182584705e9.5.2026.09.28.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:48:32 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 3/4] iomap: don't lose a fiemap iteration error when emitting the last extent
Date: Mon, 28 Sep 2026 10:48:08 +0200
Message-ID: <250226e33b3b23c6b1714a45dc3c465c2a45cdc0.1790342457.git.parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790342457.git.parri.andrea@gmail.com>
References: <cover.1790342457.git.parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iomap_fiemap() emits extents one behind: iomap_fiemap_iter() flushes the
previous extent and remembers the current one, and the remembered extent
is written with FIEMAP_EXTENT_LAST after the iteration loop.

That final flush overwrites ret, so when ->iomap_begin() fails partway
through the iteration the error is replaced by the result of
iomap_to_fiemap() (zero on success) and iomap_fiemap() returns success
with a truncated extent list whose last entry is wrongly marked as the
last extent in the file.  The pre-iomap_iter code returned the error
from inside the loop, before flushing the pending extent.

Check for the iteration error before flushing the pending extent, so
that real errors are propagated and only a successful iteration emits
the final FIEMAP_EXTENT_LAST extent.  -ENOENT (no mapping) is still not
an error, and the pending extent is still emitted in that case.

Fixes: 7892386d3571 ("iomap: switch iomap_fiemap to use iomap_iter")
Cc: <stable@vger.kernel.org> # v5.15
Reviewed-by: Brian Foster <bfoster@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 fs/iomap/fiemap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
index d11dadff82865..54b824b7edb5c 100644
--- a/fs/iomap/fiemap.c
+++ b/fs/iomap/fiemap.c
@@ -76,15 +76,15 @@ int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.status = iomap_fiemap_iter(&iter, fi, &prev);
 
+	/* inode with no (attribute) mapping will give ENOENT */
+	if (ret < 0 && ret != -ENOENT)
+		return ret;
+
 	if (prev.type != IOMAP_HOLE) {
 		ret = iomap_to_fiemap(fi, &prev, FIEMAP_EXTENT_LAST);
 		if (ret < 0)
 			return ret;
 	}
-
-	/* inode with no (attribute) mapping will give ENOENT */
-	if (ret < 0 && ret != -ENOENT)
-		return ret;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(iomap_fiemap);
-- 
2.53.0

