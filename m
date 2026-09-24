Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7E4477F1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241179; cv=none; b=EJIOkTqcL8Obyp9RQwfcyUuRH4+rtCtynN2rv6seqovqy/+lHbSxjOk8KNpZyrpckV+Ot2LmbzaYzJoPAQFC4142wep6yjfaKKU9n7Yc1R1Lce+tjN4tT1xnhu5yzL6nN/RYubuOAdURqdWj5WB0iSp4FmCNlpJ/y7pqUKmjbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241179; c=relaxed/simple;
	bh=gbD38OZ+K8pV/KQl4DgCWHt3UcaEpwGclj1C9Ynx0P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lL6dGPALJD6f4y1FGVwcELjzl+3evfj3xbMlfYEkQy9TiO+eeSo09dd2nqVMlOBaxsR2ttQ7A2DKQr34IALgTYfbv4U5fXVb5GAT3oTdlTftBtAnBNgRDpJ/D2Uu1agpejN0bTULVulzGL1CLdkiAElSTpRlV5MSNOzASWPv+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgWIybPP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgWIybPP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1496426f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790241175; x=1790845975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T6gy4Aw3WfHFoNTCiQ4B3uP/bh3QfbEnAm8LgQjvIs=;
        b=FgWIybPPwptnGoIMYOj7kdxjQrBorZKG+GaAjJrLTGeUftBhTV3d+SI23asRa+NFwg
         I3jExrtk+cXsFIDIuHWylnuAaVx78XEHGz5AAa/WuIkT+MBlb91KRUWOVddZCUv38i98
         G+uDfnn2hMgcK82bdMJCaDmOtlUfVzC8oFZy2dD2AxW5953XUe0XdyS+qwH+DmSCkwJ3
         dRG1GtI7UfF2x8BHqCinLwDhj8z/bPOuPEKXQ426y9I96ucVMvmz8ikXDu4nDt5ri/MA
         XY1DZcBhfJh3lw3UF2Nlo1OuFrNLJEzor1KBncDMWjEGpToTNgCZx0A8vauo8UJ3y1cL
         HY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241175; x=1790845975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T6gy4Aw3WfHFoNTCiQ4B3uP/bh3QfbEnAm8LgQjvIs=;
        b=FHohpgYmImIniWN0N+IVKMq3g6Y9uQEVm+4cqbPesIrYzzgr1gAn/gaTIWcg0B2hk9
         Ds1+gE5lWgfdSLGWCpXFHZ+5PpkJl+e3VJv1RdepZ9j+sAeo6jKcvpqYu4S+KoAvkW+k
         mMH215VAbVjyUb7jMjCx0xvoxTYWjV4Wuza5TU4WPiAGN7YbSHLeJVzENcsx7ORBAXGs
         9o19TUUfsJURu1bY6XQUcL/LhRsYbg5o5P8sPZ3l6P1VQKs8duvnm8o8/xERPi3rZMli
         o25rtfICVmAYi7zMvLf2dQDd6FwhxTG0+AcoXVH5pbgZ8abOmT8hmSCEblemCOPROKtH
         GYvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQoA00krxkJ1VY3+XWi/kfWn6RW2JxQlKYkBU/iVTVCh1Pyq2duzsv9CjkhWy3BPPLD1XFdpoGJxNVy18=@vger.kernel.org
X-Gm-Message-State: AFuF++lVZeAhMCa17Qn7dhx4PxNxpDpBCIpIfG9qYckArJhV3Co/GamL
	N0FYarweD/ujXzvh+ilo9RhXrpKeOKOHGAci3a0YS7tmmNIrYrIr/tSe
X-Gm-Gg: AYBFou2q0dIQYvEJ1YZj6XBlCTcZYO3FwkomPcK4hmoZv0dHq5xevMm5LR3j+zVlNXp
	pz46iTOcfEVxV60OepQ4tB1vIxvZjYkkzx5N7OxTRngz6jJkhrLbyWOSTfxU6A14N0xec/uu2jS
	dcDM3X3OemfY2C/gvLn1C63mtqcQe5glJRSH/VC3qQkAphjwBHoQXuTqdfTZwHXpxQ2WzO1otq4
	wlkEiJe4FZ89Q6evcyiUAV+by8i/GzrFwkUKxB31tbsbc122w6+jwquOSg+fMlEd0kbc2Mw5bQS
	tAa63rn+VuLXHk/jDxknbwI0jRiSCToRq+oG3Fs5ChKPJgcEb2iax+EJm7q6j1XS/h2Oq3klwM/
	gDoi6oNPpZMY6a05ePyONDU9Msx5qMBSDtJdh55EN5rK7AMCAUsi5y5kCWolDMh/TF6ZLcdjJ48
	5ulo7FJqKPWuMCTOrc4XsB4xfiXDjEUUqwFuXRi+HkqLh+imeYaWJ/6MUHM2bLtrhSFougwTY/b
	sOaIC/PqHNplhfBlmT+BD5HgX2znnqKYgDMW6mt5xgxH4mWHWC7B8cJnNoDmca7wdx2dxNwcmGB
	lS6B
X-Received: by 2002:a05:6000:604:b0:487:d60:aa69 with SMTP id ffacd0b85a97d-488716b74a7mr3595554f8f.7.1790241175505;
        Thu, 24 Sep 2026 02:12:55 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm12756677f8f.6.2026.09.24.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:12:55 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] iomap: don't resubmit an ioend after ->writeback_submit() failed
Date: Thu, 24 Sep 2026 11:11:51 +0200
Message-ID: <20260924091203.198225-2-parri.andrea@gmail.com>
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

iomap_add_to_ioend() submits the pending ioend through
->writeback_submit() before allocating a new one for the current range.
When the submission fails the helper completes the ioend with an error,
but iomap_add_to_ioend() returns the error without clearing
wpc->wb_ctx.  iomap_writepages() then submits whatever wpc->wb_ctx
points to, so the already completed ioend is submitted a second time.

For XFS the second bio_endio() lands in xfs_end_bio(), which
list_add_tail()s the already linked ioend into ip->i_ioend_list.  This
corrupts the list and leaves a use-after-free/double-free window against
the ioend completion worker.  Reproduced with a fault-injected
->writeback_submit() failure on a reflinked XFS file with several
CoW writeback ranges in flight: the unfixed kernel hits repeated
"list_add double add" warnings from __list_add_valid_or_report(),
the fixed kernel fails writeback cleanly.

Clear wpc->wb_ctx when ->writeback_submit() fails.  The old
iomap_submit_ioend() cleared the context unconditionally; that clear was
lost when submission moved to iomap_ioend_writeback_submit().  The final
->writeback_submit() call in iomap_writepages() needs no equivalent fix:
it is the last thing the function does before returning, and every
caller allocates its iomap_writepage_ctx on the stack for a single call,
so wpc->wb_ctx is never read again afterwards.

Fixes: f4fa7981fa26 ("iomap: hide ioends from the generic writeback code")
Cc: <stable@vger.kernel.org> # v6.17
Reviewed-by: Brian Foster <bfoster@redhat.com>
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 fs/iomap/ioend.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/ioend.c b/fs/iomap/ioend.c
index 7bbbb417f9152..32ae292a84cbe 100644
--- a/fs/iomap/ioend.c
+++ b/fs/iomap/ioend.c
@@ -246,8 +246,16 @@ ssize_t iomap_add_to_ioend(struct iomap_writepage_ctx *wpc, struct folio *folio,
 new_ioend:
 		if (ioend) {
 			error = wpc->ops->writeback_submit(wpc, 0);
-			if (error)
+			if (error) {
+				/*
+				 * ->writeback_submit() completed the ioend
+				 * with an error, so drop the stale context;
+				 * iomap_writepages() would otherwise submit
+				 * it a second time.
+				 */
+				wpc->wb_ctx = NULL;
 				return error;
+			}
 		}
 		wpc->wb_ctx = ioend = iomap_alloc_ioend(wpc, pos, ioend_flags);
 	}
-- 
2.53.0

