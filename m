Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2313CD8CC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122355; cv=none; b=EvBLJ1GEip6Bfpk+dIOriieREbkZ9JBlonRDnlASsxfMlUflAdiBd+0cAfJNIO99Nb+4SaRuRuxmUKX0t4VxGHobGY9feiecRWgDDSI+CxYVc1FqBF3SUp6A4fkEDTZNXuaYPaYn9T+3U9Z6begBBXlNabCuSV88swZwMbq4t8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122355; c=relaxed/simple;
	bh=R8ljdZLMt2xYnTL65Zqez58q6Le00BsPCuyxSRtBZpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKR38N5fuDuZS1FgyyVcYpcqs9iZ5kmWsCgyPJGQ0ZcV0jezeZ9VtPxJ8F0jpbOGjMqJTjrAjo6YoZfuuFSbkmxTZnm9Re9muTTzSGzwluxi9lMwYSi2g12iijMMtLldr5LOuOr90J7+NAJbGWC/2tmCmOqCRdjvafsefBJpUro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvn5CIve; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvn5CIve"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso992785a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789122352; x=1789727152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pITEbVo1MvPI3pP4SrO6ivYEuuDr//vKXGqFMdO8JQ=;
        b=fvn5CIvemdGBFONUH8En0DePDvs16Brdh3RdToyYUbvWxlEHhsVXTELxXsw5KRtIlZ
         Opits4umc2qCNusq1rAOaC54fcGyfqvh6+PKzT7YgCNHVMpQQvDNG15mLT7P9/uXAMkE
         J5BuAHrKpYL+8x5RSi9B8DkEFLgWxf4sacIknOj1xQX5wT5C4A5esYbaL0AxVU9QYHxi
         TXv9pTam9eGuTdXa9nzvTDAJTsavYvqdVSXAglkQCTx9Kaz04K9OtoSiY8n6Sw/vZcnQ
         VfsggHoXiAGzJhKTDij/2TEFzBWC8qGg5bax3du/rv2vZqfuHgDl0I6HXMA6ceyNqBKO
         rY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122352; x=1789727152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pITEbVo1MvPI3pP4SrO6ivYEuuDr//vKXGqFMdO8JQ=;
        b=Fbu7386/+n95ZanVk46+qzhmtUj+N5Qs6B30i9JdsQYa5uDNX3ZW+p3aqVVN5LvrBb
         sVQrG3C82FfTzpx0hDcMI4NNcyLYF/lCU8JuQjb1w/eQ9GEuekLxxf6jfLC4G2/fyIRq
         ZFHnAE19fUxkKJy6a1NXWtnFiHCecBkCdPctOQIU4Rd7N9wAlflvM1oZzdVCU1vtA3Oj
         +eSont/qPbmeuKxalGreGPiiUYS8m63xHAWzswBus49vuYWQaypHUfzjcaxqUbDaCO1H
         KRMQeb+NSApuOKbmCzXDw3jr+6vP21jV0yijL4s+9yoTDZLmlqCbuTLKYDdyd4EaqZNa
         6tMw==
X-Forwarded-Encrypted: i=1; AKwUvBwREdJqMQCEXv23qANlyWuOp1jStET7m/bCHHHkpMjjYT/wHlnmSL6u2h4SNWS8cvfonDkhlDchRw8Dlso=@vger.kernel.org
X-Gm-Message-State: AFuF++nSKKaqMuU3f7rRzYINrV9df/F1VcOFTnwTlJDaqBU43rL4O+6T
	AatnwV6zcFYuFFnz6h+CyBg4M20JBLuLZCpU4ETto2Ns8nWhNkTvta6z
X-Gm-Gg: AYBFou1vzqqRR7Tonu3DUwCrG6A9KzMbmwEaEG8lh90jWdYxBy6dTXpnOiOs5w/NHTA
	TxNtwVPA9MFDw7gu+ph+GVKD/GdCYOx92aAJ3n16KCbdQxex3F3YGoxEjOsTQcc5ikIJgr7WaCb
	SYoK+x84Mv5EMtE0NV8jHAkIxrWYa6JwHlJt2wdjjheM/pTbEhOsg7I2ZtAmeWwkmv6e/Nb7p0l
	mURXFpKHSYMxJAeLNvVGXPso76dz+b0WN7Nq4ojQjTuW7RkFg18RdvpiR+CJ+ZvxK35wy0+rNaJ
	cE9BOw5KNnlK6cil4KkDRAKESO0EYS2o/YxcL0jcN5i6p9Ww2F/G4b4lvI/lLNckTqMWgMgA1+q
	aZtixl4Io1wxJn4yLUHjCep976tp5nvVwCUUDQIVDqmUasFTXfx8L8bgu6MA2hPxiekIt4cljcM
	m8+2nlk7q0ZLUPiUWgIkBnQ45/8QuciXG0jGsaCYz2TB+pc8FN9CdFhFxo41sb+F2GgtEOfOmRH
	uyM
X-Received: by 2002:a17:90a:d60e:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39d9c35a385mr6557159a91.24.1789122352281;
        Fri, 11 Sep 2026 03:25:52 -0700 (PDT)
Received: from Default ([2409:40f4:1034:ff33:e7d7:d190:816c:e597])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm6220095eec.15.2026.09.11.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:25:51 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: cem@kernel.org
Cc: dgc@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [RFC PATCH 0/2] xfs: change xfs log item refcount design
Date: Fri, 11 Sep 2026 15:55:00 +0530
Message-ID: <20260911102502.163566-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is the first of the series where we attempt to convert
the XFS Log item reference counting design to be more generic
compared to the previous type-specific state to fix the "zero
refcount but in AIL means alive" state. The patch series follows
instructions outlined here[1].

Obviously, the wrappers will be integrated in type-specific functions
later on.

No behavioral change as of yet.

[1]: https://lore.kernel.org/all/aqI6v-_dc2DDSbgB@dread/

Jeffin Philip (2):
  xfs: add lockref and generic helpers for refcounting
  xfs: change xfs_trans_ail_delete return type to bool

 fs/xfs/xfs_log.c        | 38 ++++++++++++++++++++++++++++++++++++++
 fs/xfs/xfs_trans.h      |  7 +++++++
 fs/xfs/xfs_trans_ail.c  |  5 +++--
 fs/xfs/xfs_trans_priv.h |  2 +-
 4 files changed, 49 insertions(+), 3 deletions(-)

-- 
2.55.0

