Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B83CF200
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487256; cv=none; b=EkiFaapAzlssocn1vbOwZKSMNBhLqb5HDrktNv2LVld2Qs+Pusqpkchg3L0/7tvfu4gpCCpmP8HEJT7j7l4RIsCzHgwXnJ+9yK6RB3Jv70nwPW+N7LGEM6Ywk5CnQZ6Z9LxwH+SWW9MmBISWe7Osw1mn26vtEm676+iNizA3v34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487256; c=relaxed/simple;
	bh=fyyWB8kFM8yS/sTHX0FEktjdZHa2MY6B79uzjhYFx34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeOg938FBIh8UTpyIjMa0BM4Lzi9u31mbLcnZNGw1jBK1ZFYADbrFq2kgxx/j8KcybT9VvqUSNKzJOn5n2NNsBSAdMM+D++S93qXVtyXJS3prp+//Zl23UiH2d/Qw1Sa7+MYgO61c65rpvJp7aTuxGyy0V817EiIUWdgEQMvIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=MFY79B3d; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="MFY79B3d"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30b6dad2382so7798956eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487254; x=1792092054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auJr1ryaFMZM/c/xY8k4emAnc/zPgD5/4eqsxgMghaI=;
        b=MFY79B3dMOEbwASKpopB12c5mbcjiOCvnY+OUA/YqVXABTuPlWzMfMxKgZuHHz0tiY
         d9lVekltc0Tp8UKCK6JIpmdABqplorrGLnZtcMRGgyOSvXowbn8Vvw4G6bCxcG7ieCb1
         4LkPXXyXelyenno2ACDfLGieQVPRQE9dgjmxso3IrD0b6byFkrxKLLpm8KF+08CAgPTO
         dNpn7xRYnO0HUUhKALHh7ULvPO6fnQpQORXz+zCd+z7vKAu2BMnA3lpTVnOWezgjtO4h
         VLp9+bXk3/z9jxNZEYitjNMnOt1cqku6/AuB/imARgojl19oyVD1YTzWubvs1q6EC9XO
         FQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487254; x=1792092054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auJr1ryaFMZM/c/xY8k4emAnc/zPgD5/4eqsxgMghaI=;
        b=wsyeA3FA+GkiKEz0J/dgOqpPYoApSkfMoT6ccvx8GxBxxg7QzABkLLZpOImBZoxXnM
         O9H6b+qmVtoIaAP31EHLYb1Jepe1mKnYLNWiy9f+nv1NfD/kRGhmfiR179lUC/n8eyIc
         D6LA4bqZsSlDXcjHFQcu8sYtid8HZg20G1unAZVmwMQYU7tbhY6lxQ91kSdFhkeZq4Oq
         HWl4eYNlrcsSGv060rY4rHuPEkd6FVEtXcHvAQNwpOBtDt5j9nNXXKqw90ljHOx9IRYI
         MBbWRmJlA7mX3HFHfYR2qINRQtwUrEZ2uu5k6CMIsb1+PR7FPN770yTdmzwC9UZ7dAMp
         pLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBypujtJrzwYwRkNJDWQ6uUfZ4cS0uHb3szVk4WcM73lA7H8A5hvBp6jCr2Ge/2sxXWUK65U/JxJq0hFrj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLypwDZqmPpFTt5QWDQ2j+6Q1yk0kWN7RkbxqbstT3Y6dQNYzu/
	HlntIKXPtvmR+yxm2XU2p3INtoZL86kDyJZISy7dst9S0OzOfSNug1OgbfTUQa+djAVewSME+M9
	oUWUckyA6AA==
X-Gm-Gg: AYBFou2mMDjZvQtoCxzSO9ie9N3zU6/Hbns2X5NBMkn2YIXkBKux5pdGXBGoduWPcav
	8+VLVAsWschbGzedIyyYdfUrLk3NemTh1AwlPgOwSfgrae/lFyW9PgWea6/II3aQ4Nnf7o2xE69
	fquFU/EQRiNRX/20iGFcCudlPTHarqMuKw3mhGRz7JzDg/i5Kd5HAj0fDcHQVKIGTN8ml/ateng
	SZms35dLRmHcpEiWRjag2O9DXIJcxIKSh535c4gZhk+g4wEyMt14ab+LlQ0wrvdbrj1pNlP1cc9
	+8hy4szdd0GhuhfEQl98YKoqvGkR3Qru89rmkYOpBQgFRmR+NGgAYvPgsdzxL2sPcFP6Twt/6JX
	X6DXSJzBy6gE4a+DfTjjevM9cqtUm5b4mnMYcY0pNmGMGL5lKvQWj0qvuUbUd8vsITFK+CMxqaw
	261XXge4ppEgihnE3M3BBhx4LShhpGruuTZzPL3jkEhbJL5AIW93qxe4aTzYIdXWZuTjC9wRdpT
	Yp2ciaOx85V3G8oV9SxarSUpG1ck7DDi7Q7H0cwynOXx/4iOFzXch8irjaadCnMJOhGeJ0=
X-Received: by 2002:a05:7300:6007:b0:351:7108:c62 with SMTP id 5a478bee46e88-35171081ee4mr4681951eec.23.1791487252953;
        Thu, 08 Oct 2026 12:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm104325eec.5.2026.10.08.12.20.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:20:52 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Max Kellermann <max.kellermann@ionos.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	Jan Kara <jack@suse.cz>,
	Theodore Ts'o <tytso@mit.edu>,
	Jan Kara <jack@suse.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 1/2] jbd2: check need_resched() when skipping busy checkpoint buffers
Date: Thu,  8 Oct 2026 15:20:45 -0400
Message-ID: <20261008192048.98833-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192048.98833-1-artem@trailofbits.com>
References: <20261008192048.98833-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@ionos.com>

[ Upstream commit f213e12ff5c9590b1034ae8da0e6d09665c772d0 ]

journal_shrink_one_cp_list() skips busy checkpoint buffers when called
with JBD2_SHRINK_BUSY_SKIP.  The continue statement on this path also
skips the need_resched() check at the end of the loop body.

Consequently, when a checkpoint list contains mostly busy buffers, the
shrinker can walk the entire list while holding journal->j_list_lock,
even when a reschedule has been requested.  Large checkpoint lists under
memory pressure can therefore cause long lock hold times and leave other
CPUs spinning on j_list_lock, resulting in soft lockups or RCU stalls.

Route the busy-buffer path through the need_resched() check so that the
shrinker can release j_list_lock and reschedule promptly, restoring
parity with the clean-buffer path, which already checks need_resched().
This does not change which checkpoint buffers are eligible for removal.

[ Backport to 6.6.y: Use this tree's older shrink_type enumerator names
  while routing busy buffers through the existing reschedule check. ]

Fixes: b98dba273a0e ("jbd2: remove journal_clean_one_cp_list()")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Link: https://patch.msgid.link/20260713102229.1598812-2-max.kellermann@ionos.com
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-89566. Both targets skip the common
scheduling check on the busy-buffer continue path, allowing an unbounded
non-preemptible scan.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 fs/jbd2/checkpoint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jbd2/checkpoint.c b/fs/jbd2/checkpoint.c
index 32ed28cfb3a0..e8a7186eb8c3 100644
--- a/fs/jbd2/checkpoint.c
+++ b/fs/jbd2/checkpoint.c
@@ -391,7 +391,7 @@ static unsigned long journal_shrink_one_cp_list(struct journal_head *jh,
 			ret = jbd2_journal_try_remove_checkpoint(jh);
 			if (ret < 0) {
 				if (type == SHRINK_BUSY_SKIP)
-					continue;
+					goto next;
 				break;
 			}
 		}
@@ -402,6 +402,7 @@ static unsigned long journal_shrink_one_cp_list(struct journal_head *jh,
 			break;
 		}
 
+next:
 		if (need_resched())
 			break;
 	} while (jh != last_jh);
-- 
2.39.5
