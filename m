Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BF59221D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891627; cv=none; b=eRzuMODGmrvnyFWAcUNvPk4B+i8bEVchaF33jZK32jPbih+xf/Olv2Np+sM10vDWEOHxil5oiPRApMuhPPYk8RC6bua+MAziHJ/B12PuPGO7RbLGg6o9PUEgBvPmwyRe9wA3bqHzt1dXdhVp/kFWIpmgW3tTp8EdDQohLAOhtFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891627; c=relaxed/simple;
	bh=9gqaCgml/1yoR2uqs67zzXDLHbaZ33SmJXHPuxRz7nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oRjxU+vBLypZuoXvtWczw1Ph8vzcUhgc7q1bPD6q5/17t0LiroTcomG9lMsOj73rLLfcfHRxS/pJskNYckuQkRYiCwKeXH9R+NDS2WjxJdCXg+xKxxb8T4gJPQkMAIZTDX8XxmK5WNmmhmmVeuCYC9iFPeAIWfNdCaq2Fzhf/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peridio.com; spf=pass smtp.mailfrom=peridio.com; dkim=pass (2048-bit key) header.d=peridio.com header.i=@peridio.com header.b=rAt6+Ehw; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peridio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peridio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=peridio.com header.i=@peridio.com header.b="rAt6+Ehw"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4bdf2e95bso111073a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788891624; x=1789496424; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:feedback-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67m8V9jpR8y1as0snAJN1wqK54Xk4XUhkiLsE3v2LzY=;
        b=rAt6+Ehwp9KmzbSEF7feGuDwS76opqW45IP3hpXfZhhYyfi7inNktMvcFkhh8Ohz4t
         kih3qDP5nJB7jvsVdQRQoAkXJSdkdDPeAF8yb4scRLd/G76VNeDUdtdWQs5kHMbkEOW9
         Y6kaL6LKj5AiRrZsZb+W1fUUDYZYezwubD5RBU28Irty9rbFHvp2IyaKPulykKWaQto3
         aStpz8MMbLL+b+eyxC2IGVz5ZQDI+7uiYrJMDKqurXwU/aUrUnnpg5rR7NnmPx78V1M/
         qLviZEbwpPu/GZFypDZ6NFkh9b/KIG/CRSZh4+qh9Gem/TCTwVRpU5E6+ZCr04c5K6dz
         0FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891624; x=1789496424;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67m8V9jpR8y1as0snAJN1wqK54Xk4XUhkiLsE3v2LzY=;
        b=Yli9erLi3G1cXvdjFJkqsrwOXvRXoJveQHwWeexbh8izXFvoR8t0FZ9GIDnsMq745e
         fx8HY0NJkfpJSALJExcgyF48rqhmhpQbpzBZBuRGvuHC5uTjqGe9WXhpIgU6eqbeHEy8
         MfTF86jPZtYbPq8rJedVrhiY5yk61IFJ/4Kx/3BP2eEoAZYowFcei5azhqT/kOh7U8ux
         MsyY1c31RyU315kcuIRluHZIebz/eRsBVCPwc+kUbgpF16A7DpFA31vT0thGWfjWEuYF
         XqfiKktlnwiUQt2DhvDCTGASfse7dqidk4IV6ykhsGMGTOgm86MJDN/BWBPVL0iowyAr
         MU/w==
X-Forwarded-Encrypted: i=1; AKwUvBwVp+j6ieKaf1cGk7KEvxOfIepDFr1E1kQsQJ58kcFjYhTIiLyAlVHs+llZzKBP78pI1j71+jBbK+UmoAk=@vger.kernel.org
X-Gm-Message-State: AFuF++lFtJ6dDx0TN/bQ5Buf4cwtSMJoDnyoMPYyIGgS5CqtPtnUwiKT
	KZ63r56fOTvzBnoNY9R/+g6vzYJX+DuTUDz1vX7wc72Pu5+0qH+1ziM5XrhNUrUeI/I=
X-Gm-Gg: AYBFou03ZCXNQ7hFR7hXix0j7UkIy6kpfUcPzDz4sZnxVUropqBdGHytTjfuhJK7Zgz
	x2Q1up7UnyrHACotN0Al/D+9bAsby7229Sr6urICWZ4qvbMo7+cLurBX3AY6ol2EVkMl/mGCePZ
	BwnWi774cW/aCLMNLJZlhJVvZCTba/5fMzkltufsj8zj+TVVzRXVpeyKVVu0tmVy4qWgLH8YsOd
	jZGzsdBCSqRCtZadeQkI1QuAQXZsuEEkoRd/fzqg7fvAQYdzWPl3gCcDB4IKThyAEVy5XYNMJLY
	N/ERMECHEXNEYgxJujHYcDLe+wGXDg3Ej3OZF/EyCluu8DrWAnd5sRV/Lx6dY0GJfpo4PA7TI2j
	VnYzkXlE345Ylb5XEVA3OSNCvEHq8G/AxOhSGNz9Uad5ghG+wauFeaC8iecNNQsrDGKpkalY8kw
	HjSJwTKjpyTkAXnDf+Ul+QMf1ToF+7+qHDXtRYr2GF28CpZ/m++UtgWlmQ6MSRu7eCcnxRB2xQ0
	PDHAPwRWvWdgM+o400X+cM3VxmoWe8tsRkwY1cWM+ntTSDJDVnnfJ3XdBa4yw==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr14452470a34.0.1788891624437;
        Tue, 08 Sep 2026 11:20:24 -0700 (PDT)
Received: from fauth-b1-smtp.messagingengine.com (fauth-b1-smtp.messagingengine.com. [202.12.124.200])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f72d3d3csm15412864a34.18.2026.09.08.11.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:20:24 -0700 (PDT)
Received: from stl-compute-03.internal (stl-compute-03.internal [10.204.2.63])
	by mailfauth.stl.internal (Postfix) with ESMTP id 88ABA780043;
	Tue,  8 Sep 2026 14:20:23 -0400 (EDT)
Received: from stl-imap-04 ([10.204.2.95])
  by stl-compute-03.internal (MEProxy); Tue, 08 Sep 2026 14:20:23 -0400
X-ME-Sender: <xms:51GgagKrhuIzqzmdpi1LGsEJzfQNuiAcWDPKNPw-FhG7t2JzwWlokA>
    <xme:51Ggaq9vYa5aEt0d06dxFdKdCIDYCcPTP6fh4e95Amt1fGGoZqaD2c_-WNIB9ywxs
    vnbf7Ws7pAsJNAJHl736RaAMvfJ6-9pqyqLv0baz7igELqMC9aRVX_T>
X-ME-Proxy-Cause: dmFkZTFilRvDYxM0+mPcWpEG41zba1lK4fzyNrzkrZ+tqi263a1BKkSIcGLeZ6amZphXnf
    mGsCGkHqCmv2UrrA1hdiJrRu5fUDvYc7lD7iCIeXAnDCCS/00HqmP4Yolyn0Qt/g7NNnzb
    DvguZnQEFYBSswXaO/xAOsBmEt7JpN/FbPhAhedhBMlUmAqHZiGEsHkuhcxLNF2RaJCsW5
    VsRYqACf3h2v50wgDaDEP6+7nXQ8Kv9C6qIRjEW1UpmfYRYuFlW30EIhIuUi/3Kh7uT1C3
    /d+BTQNRp/P/7gEXiw0VMANY3D13MWebHFdi8KWBb5VD+J/FkGPQ+OtBgoHgvDBrXkbOeC
    58DSUPzvnw1npEBwIDm7lpO2rLOVGIh/tQOXlohusm/T4n+s/yidxomjbVZZrKtAuMeAmS
    cPrGRkJCId786f89l0y3Ym21m/l00uVbrkkFKs7RnlBXYuK9QKtmozhMKqoVJFMS0kAKxL
    VFiekScxWsCLhpYHddQQWx6zavyBUJEJR/g987awDN/A7heol/fbIVg7sRzYACKy50erx3
    Msmh3AFmzod+SIPKn39M4ZoDqRTUaBOCvnzxAsiD6crD66lwoPC7GR72qo/0q9aYg64/DA
    zy3plZnDix+wa73FkryKT+y06YSXRdBvociTQIGf1aa/iXitVcFurxTKY0hg
X-ME-Proxy: <xmx:51GgamFbio9SrPZb-H-oU4bk24wramk6VFCMyVhnb2GkisHs6bpH1g>
    <xmx:51GgauuEdtXAAef6MVh56DrkL-qsdvx_d4vDFU5ACtgUrCR5755sFA>
    <xmx:51Ggalu-U7DOo08EDHwXmTiFU-MT_sstpj3bQN2IUnD0_zRz8flXPg>
    <xmx:51GgasCq1aEi2qkREa_la6fYYiE4YUBH5_QJE0LJtU7cXpI-D77ikw>
    <xmx:51GgavOhEVfdh7VD4zhL-gs3JgsRbMt-UYX9xlkJzLCMtvLGI1U69Hoc>
Feedback-ID: if7264b73:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 5D66B80066; Tue,  8 Sep 2026 14:20:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <javier@peridio.com>
Date: Tue, 08 Sep 2026 10:16:12 -0600
Subject: [PATCH] xfs: reserve a full directory block when repair expands
 the tempdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-xrep-dir-total-v1-1-b982f1652fd7@peridio.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBA0V+RWXcgvtv+irjIY2KnFJVJFEH8d
 1NdnsW9OwQSpgDvbAehlQNPY0L+yMB+9DgQskuGQhWNeqknmgo3oRkdC8Yp6h+Wtm2dMtb7Oof
 UzUKet+vZ9bfDYr5k438Ex3EChMI2GHUAAAA=
X-Change-ID: 20260908-b4-xrep-dir-total-3c77d0bcff51
To: Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Chinner <dgc@kernel.org>, Javier Tia <javier@peridio.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=javier@peridio.com;
 h=from:subject:message-id; bh=yeYnN3Kgj2QBeSjNJistyZmYMpSHlsF/gZGDMLpjbS0=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqoDTLF+csU6SO0ohyKV++JiMgJxv4t7Si3crVR
 AYo4fpyeXeJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaqA0ywAKCRC17sMLqGd3
 H9RVDACBuYFaF45VMpgr6oj3C9hFvqcO575TXkK33bIIdMxdMzaMVlPzTeYm3Y+pPkayJPDnI9d
 UEcbzZsmMoe2AqOQSc19bjleKGEYmtN13Puf9KFU6JGvat07k/y0z7RjSUczNxbFdMhqzb5vwdD
 FvTCUzphP2txCrj79MqyuLwfcFFF2WURkVSBZrgxikKL4Mpq2Jg7a7LAI5GmHoX1gU2tjfRMNKX
 5qauJ75/3L2qyK1r1egyxaTGaO7Fy7ymdEWazw2UI2kLS+uFeV1OC0tMsXJni08j/RTLaQqfoF1
 WAsDX3HHp7K3kfVpT5RNCvYlPDCHrjTjJiJEYKZGMBrJcE0RQJ7cUsMm2tRr7URaDnI7Uk2gyef
 G/Rixam/+pbwDBNOHcOoXjF0Swnas70N8D6Rbh5LsKn9FvpdwDwb68zyJ5G2P3GmczAL71zeY0T
 z0ilR4aMQIVR84JRmSOTpB3n66xCtcb7a5fWCg5xdvXDqGrfI9dIESARXMDgcgDYIGHUk=
X-Developer-Key: i=javier@peridio.com; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F

xrep_dir_swap_prep() passes args.total = 1 to xfs_dir2_sf_to_block(),
but the conversion allocates args->geo->fsbcount filesystem blocks,
which is 1 << sb_dirblklog.  The two agree only when the directory
block size equals the filesystem block size, so the shortfall is
invisible on a 4k block filesystem and is four blocks on a 1k block
filesystem carrying a 4k directory block size.  xfs_da_grow_inode_int()
then subtracts more blocks than total ever held, underflowing it, and
hands the understated value to xfs_bmapi_write() as the remaining-space
hint the allocator sizes minleft from.

fsbcount is what the other caller of this conversion already reserves:
xfs_bmap_add_attrfork_local() sets dargs.total the same way, and it is
exactly what the single xfs_dir2_grow_inode() call underneath consumes.
The attribute counterpart in xrep_xattr_swap_prep() keeps its literal 1
because m_attr_geo->fsbcount is always 1.

Found by the reservation assert in xfs_da_grow_inode_int(), which Dave
Chinner hit running xfs/286 at 1k block size.

Fixes: b1991ee3e7cf ("xfs: online repair of directories")
Reported-by: Dave Chinner <dgc@kernel.org>
Closes: https://lore.kernel.org/linux-xfs/ap-mIH9nTNkpWq9K@dread/
Signed-off-by: Javier Tia <javier@peridio.com>
---
 fs/xfs/scrub/dir_repair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/dir_repair.c b/fs/xfs/scrub/dir_repair.c
index 31a23c5f386a..0a3d02d8f041 100644
--- a/fs/xfs/scrub/dir_repair.c
+++ b/fs/xfs/scrub/dir_repair.c
@@ -1488,7 +1488,7 @@ xrep_dir_swap_prep(
 			.geo		= sc->mp->m_dir_geo,
 			.whichfork	= XFS_DATA_FORK,
 			.trans		= sc->tp,
-			.total		= 1,
+			.total		= sc->mp->m_dir_geo->fsbcount,
 			.owner		= I_INO(sc->ip),
 		};
 

---
base-commit: 0ca15a1a115132dfebeee5447fd6abe46f66d61d
change-id: 20260908-b4-xrep-dir-total-3c77d0bcff51

Best regards,
-- 
Javier Tia <javier@peridio.com>

