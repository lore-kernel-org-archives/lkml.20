Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE82F5495
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762074; cv=none; b=NzY1JlUIV/5wqMy4lxFr73LYfadk+8j8m+rm4zDknANpCnJ7t82YhMk/Fn4vOFXdpP/38Ltyln6sDwgiXVnYGF666Z36JBo6NYhAfzyke/T3KxAzzllk+i+wMBkqlayLFdlxb9LYrLtyIbnSGl2xLOUOSSYndGwYV/udRok1nN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762074; c=relaxed/simple;
	bh=9XoIlqf40F9ERfOXTjyA1lCn/C+WtSDLODCelZg/niI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqkHArYSZKSt7uYkCDCZJkjYoxEge0nJpj0GzEtEYCtKriwgwA88CECWJPFrcbGnzy9cGSlijhF2AcxGpH2VV7dilxqvMD/89/IGNW9iN4TFLrlnhcBWwsU27XDrP6zyzb/TtihCKCYV6IHMYoStH4C3+wTwvH0ON4E57IpATGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7DBUiB+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7DBUiB+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3389527a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762072; x=1789366872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTn8RfNWMPERJ9eHXPlyufxsUVUk1MZYEguK7so9GjY=;
        b=B7DBUiB+LjqDQMEVTR0W7Bz3F+leBziPWqt9TokZiLTsEuXjc8XeeLR85J+yEgTGU5
         eWcTTBv1r0RX3KojPXcvkxNAd8ZQKSN9gHaIbpQCutDeURXR/3u2LfGt6J2hYSzcd3It
         VEzpARDSL5xkBvrjKWwEZfgqYRV3vnef+IneNabBe0HtgbbiYKgdZkOvCQb6y9IA9C54
         AShwWuRHplT2ZaP4Kvk9x/12oY7Tp1wsBMb/pQvTB+fOr1ALAZ4YMP4um4Crgurc1aFy
         xz2QV67yVV9fcPNE2jDmq+zkuzRsjrWJlbC+8RoPZymP+fJaTP96iWrkTJeeK570xa7y
         o/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762072; x=1789366872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTn8RfNWMPERJ9eHXPlyufxsUVUk1MZYEguK7so9GjY=;
        b=OBwTA7IxYy5IsuB5pNqI9wQdWphw3rbIXn3I81eSBBTmkKlNPahU/zbj67b3pQ1BtA
         rLAyVSv7Cagf1d3HyjseQMfKurscAviLxuVEC1UHpWXaf6M6sbN3RERvjsoiUX5Mh+na
         FJwLs2JeG6b96Rz24hRoUQ29Ub3CPy9dTJAVdqrzd9Q42pWw+eznH8bSglUrrfz8mfPB
         Kn+gHsfhTTgt/rp/wPDBImxDPSzfsfYg4Y5s9iN3AU2VvwRNEBDLdmq4bNHLVdvxGgYw
         TpDSnzBSHrTQ4RYaWj03PXeEnZdfGfZrmFFE+aufdAhxsz+RilX9i+PTngGvJKP5BiNe
         g+8A==
X-Forwarded-Encrypted: i=1; AKwUvBxCcf/lQetcggfXRW8YdRXk4xBz4FYz8C5HrSebljTQo5jIlXrQ6cu2eGv6PFb2ZOqAB7MUr2Ri0H/kf08=@vger.kernel.org
X-Gm-Message-State: AFuF++ljHmAA9fhOTSxR2IOHFw2QXQMsvoiGQsIZcITSTN0Kio4mHgxS
	9POGVVc8PuMoswEgpEpTe8GIB3QrKoSpr+hCmPAKBD9nSBcMiXPTpoUYTWd6/rfseuk=
X-Gm-Gg: AYBFou0QX+pVUvG1aqlHD1vuPAo3EoddnWaqX8I9FtR38U+dprA7S5vssnl9XVJCRy8
	dPZn239bGomSqqoHxJOevQobhWyXjrODpxgq5mU5943KbvDhmoB1fi0Zt2GjnGClnXoW9Eg3vM5
	qIHROsTyn4PP4sNPl8oVdWVGbcT0IVhnDEA4VLtnuHRUl9Kt7U5sBtWrB3nwwqa6sio6Us/Zlj9
	KHccnAUOFxtzJSk14BbLzO9OohhTjgQCGkL/rwl6lsT2FSQiI4negU6q6ELbZPPtJA3pLsh9xAs
	75/+47wCBI8dbtEaOcBkilbM7uZ1+krYHB4eZkNTuO3V+xMbnUCoRRt31OJpAKt08IQv4txziRk
	KpvDwmZwcyMDgKN/RHoILg+GMWBX1HlpY5NCUz7z5lW3LfqrXqvNlw/AsXj/oS7S0+3oGxBiNKJ
	DVFSbW39A773jhYR46+EqAjeLl/VK++4LGmaq2z97yCTLUO0FBMBm7M8slXHprf0RF7RsNHyMBm
	kFhOOzM5SKwfg==
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr29650367a91.19.1788762072077;
        Sun, 06 Sep 2026 23:21:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm26261340eec.24.2026.09.06.23.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:21:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fix typos in comments
Date: Mon,  7 Sep 2026 11:51:07 +0530
Message-ID: <20260907062107.6859-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/soc/tegra/bpmp-abi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 5c64b3e02211..4766ca988b7d 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -76,7 +76,7 @@
  * @ingroup MRQ_Format
  *
  * Request an answer from the peer.
- * This should be set in mrq_request::flags for all requests targetted
+ * This should be set in mrq_request::flags for all requests targeted
  * at BPMP. For requests originating in BPMP, this flag is optional except
  * for messages targeting MCE, for which the field must be set.
  * When this flag is not set, the remote peer must not send a response
@@ -2727,7 +2727,7 @@ struct mrq_abi_ratchet_request {
  * @brief Response to #MRQ_ABI_RATCHET
  *
  * #ratchet shall be #BPMP_ABI_RATCHET_VALUE from the ABI header
- * against which BPMP firwmare was compiled.
+ * against which BPMP firmware was compiled.
  *
  * If #ratchet is less than the requester's #BPMP_ABI_RATCHET_VALUE,
  * the requster must either interoperate with BPMP according to an ABI
-- 
2.48.1

