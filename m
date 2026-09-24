Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF544998D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241184; cv=none; b=BGt3VQXJlUmFWtz094GgMQA/gL80uwaomG9Xg+IRmTsF0CgQbW46KSDMI4O+uofNxBPoc0OmaIi6CjZngJzAQFP/1DfCpOO4wufIDqG3byNeOKQKAwaJfd1md/IqJYwJY+LjLdlYiNJJ+h9XFizjlES6U3n7V8MM23VqY5aRL1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241184; c=relaxed/simple;
	bh=RYRoyEZy3AZX96/W22uGNOvKvksOSwlIn7uO1WdQA74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CON2SBnxTbbA9fg/G1w4EjhmXtui/YyVQj76iVoq/Tb+7d251GxbZP/CxpKH1pWRl71d6zwj0aYqtyP+IEdRP1mbT0BmVEi55FfGHS7u3Svzn4ZgL++m7/YlFrFfop3MLakm0aDmoIAqpQCCc7Pi5liHDC+rVpMpgrUyKd/BxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWJgp0cD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWJgp0cD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so734088f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790241181; x=1790845981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/GiZQj0CaseyrQZxOd/ioPb55nZ1v2BOlX+DpEu3BI=;
        b=mWJgp0cD0DM87D2738zgSOVYuR5hlg//Uu1mCt4DFc1sNCWyFPabhj8TSsKKcg+9f1
         Cn6RagoOVukVH8bJwQHzu3Zb7vpj4zNXSxWlcP5xUh+B7F+bQdvVi4c3CJ7LAlTIRcch
         vhpAEH9DvQETawOVRa0mhXxkAPUjQqR8s57Ix3z+Y/zp29yX6rm+4yod+sHu5k9l1AKE
         etGCuatNuKciF/FjDiLvPczKZ+Q9MI0M6+AhUdAYn9AVMTWqi1rjEYZs4KhO5JY1weKi
         AI1AapihHnre2QpaWYSd6n5ihPyGGlrt1sRR42XZSEbjFWZmOGyFRuUVqMpAXInq+9Td
         +wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241181; x=1790845981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/GiZQj0CaseyrQZxOd/ioPb55nZ1v2BOlX+DpEu3BI=;
        b=NVwrSUI60MuskhCo6SoToee2C8vX0MCOjk9y+D3IOXOYrDCECtpVVydm3kWFGYBCU3
         /VNHpSY4AwLQropZ8vbe+ngob/O8eaK06BL2b70y4teU6PhmMAqT/+6VWNei7F4M3R9E
         SU8dIC/wX8uDZGfAjMml8vVenEvUG/lO8NKepFTev787xDCtbNMhEgpoNtm1VkF5OaBB
         jGFJgYV8tUEBDIoMplZMIOWPrEt1Cu62NICjQfPJkMxBiY6+mKE5rj3xNQy07nC+eTay
         4uSv0gYralpAZkqLJT2dL8LUdxD8LglDcvJJ0tU/VqT+Cd80UrD0QVIHYp61gE67E4M/
         9g2g==
X-Forwarded-Encrypted: i=1; AKwUvBzNDa7jiCk7pciALvqQAf1c2eMQ3QA3S+BNT0Trn+iTVWRrN/AA3Bi66Czx7lwghR00RzuiX8UNgfGcIeI=@vger.kernel.org
X-Gm-Message-State: AFuF++k8XT8nIvYBy18sgx4iKyVOP0RiIkuFVzmPxPtOh7Djmnb8WJnO
	1wIuiYZzKHXF0sWF/sCLWw0ESelNDt+qPuWSZQoa5Pi40vIvXpuP/K1zCverf5W30Pk=
X-Gm-Gg: AYBFou1sgyE84Ws/UYTMt0c1r8pPNJkNP8rBNCTLMk16QBQDS97CnCFpIOp84kXwHgT
	SOpnkgVMRGNjR1fNE+AqTHOrTXX2dJkc6W4fCeWeS3pYJe5G8UCbuf/dwCg9WoK5C9drtG6pNFL
	+Vv5QinHFUxLLEyVOkCVj3M/GJuWdkK3LNg2l29OG381a1uUBWON29gqqMVDP3Sb4SBtPHsEhyN
	IgLDqZjzC05o4cXU/6WSYJ9oHyiMIl/oOSyV67gn1eiQ9+ePDV9ml/HoDzFeOkLSL95rj2yu5pD
	ed1VcQ2qVuZvAhPBPWHRjrw9yxQJLIXL+xQQp5YsuVFB9M2UG/09o3+VBIOGwRY5j+hkHuAJyVy
	oPw9vXDDcixLvCTxQg639LDPFUUi1ddYHQXIt73r3MAbP2LTuSN4JjL6kJwV0ShvyJMalwKeyqM
	0DM0o3ui2zM67OslIov3QGIhwIkKZ04ZAYM5/vt/J5fVFZLZMVDK8yJuk26oyTXRFfeEIeMHNie
	n+ub4wfr5vzY+MbAG4knfDpoxQrFq4PXJY9N/FvWZ/oFKk8UahvIAqEvavGmAlObsg3gna9A/wD
	wmHT
X-Received: by 2002:a05:6000:41f5:b0:47f:9158:5924 with SMTP id ffacd0b85a97d-4887169cfd7mr3162682f8f.9.1790241180882;
        Thu, 24 Sep 2026 02:13:00 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm12756677f8f.6.2026.09.24.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:13:00 -0700 (PDT)
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
Subject: [PATCH v2 3/4] iomap: don't lose a fiemap iteration error when emitting the last extent
Date: Thu, 24 Sep 2026 11:11:53 +0200
Message-ID: <20260924091203.198225-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924091203.198225-1-parri.andrea@gmail.com>
References: <20260924091203.198225-1-parri.andrea@gmail.com>
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

