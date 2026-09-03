Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A244E1405
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449133; cv=none; b=boNKe3pvzQtAvQokrLYHa541qIqrYAduFynO7kb2L9CvXlLspoADxkbFPgL4fELF9NSQNLmyNJnmsuyPQW/EBUOShBCwNH8DHGOWnXKMVwzGbgBFNOXhm0X2uVYloR6FeIxQRxv8FuZmz/FtHiso0+qMOOKtpezwKmCG0J/QwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449133; c=relaxed/simple;
	bh=7x6k3CoQtycsyrx00Mon8kDDGXAjBXWuI79x9y09/hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IDUacqbpfgSA/X9PMaD5ca2HZ3lC3e1pyLrF51pvwzwh6MMzz8CDhZ3FM2IF0j8Cwdjt6eyySWQ779wFxDZn9zWbN0VYMlSkSOTfo3fpGVrXoFsNkdztMduL00mMNfTRLqfItvfPUYlSha43Z2l9/eOInkMnCICVj2WaKtliiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLFzdNuF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLFzdNuF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8687630fso21892195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449129; x=1789053929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJ0eJNAdxkEACL4i1LkrRsC16NHPzemhDd0NbgM2FuQ=;
        b=rLFzdNuF+VH/qrjJa+Yz5hBrq3j3PxpCtBYtDeTm/6uZyBRcPLEJ4quXkdUPjn8I+m
         VU8iv0A1YbeIKwtRuSdBTp2wtPIqSYcqIOkrR1T+OOVmiCiwzqkusQ+U8JdjZFxpnI/t
         2tWinf64tPsXJqPk5sEjdfWTZiWaNqLLI2DhbaV2b9O/io+S90sYGhiy8/YcStU07ytW
         WjoVFb1SiyXFWKeHoHsTvPasjkZ03EH4kjTGyytZpjnRadcgbj6gXN5KiedaRy4bmkAx
         TKpqd5e4msOmr/qK/1hYCYBvkt/gkaVTmH7/1FRP+Cs+c+11Zx8+As6sN+NOX+5LyaN2
         GAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449129; x=1789053929;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJ0eJNAdxkEACL4i1LkrRsC16NHPzemhDd0NbgM2FuQ=;
        b=oz5iugcGUyK+/k3NUnaXUODoZzv1AOEzlH4HgqXVaZAnxfMXylPGh1sJOMGMrU5092
         n5yeCl1dpd+guEBfPM4ivF0M8RC7HggdPorFm95WWFIEei1CtGyaYi3zFKe4naTp2vLP
         UESq9uvKftq1eJRY3+rTGiU0PtGS1H9lmwwe7YxAv0GQhGIKX0q/wemCq36uZt1GjnI5
         sUW+AveOnkf8EUyq39jSIklTCRcfYkmJazAdLGNWHjUox9lPmD8K45RT/uMtf2QcEOU1
         bGVPxKXtmdXDd84RKoNqijufSaiekOS+zGxY2LP4E90TBjj02zLTBg6kO683lCQlLwwX
         4g/w==
X-Forwarded-Encrypted: i=1; AKwUvByD9TfKjXWPk1OJsRdLl5z4JoB0Pbi9VQWd8/4byISoboQyp+G4Vn/z2B+f9MLNuvsrRx8DPegkCIoBiW0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXwothbjnF63IwYnxzC5cKCsCtYnwyw7cUhxiS6lHZ9AKcf4Kc
	LT0/Xy+IVlZpm2+QI3lPlMa3WRj81lDKXRAsJ0OOPOWXVO+ZMDJdn9zm
X-Gm-Gg: AYBFou2o//Sqfkd/uKJk8WlmB+aXS7lJ8c/fNmCUsfTFHKBug9BDEZVZqEND+pg7eC7
	zBo2rlGp5oAYFuB5IRS41UJORK1e5hzufjRf1nC31qG4nSqKseW4lIr2hxf6Qzo3Gt9+dgQb2E9
	K75wUDraUGLObplQg6HJbmybpyj99lWdhEQeWzXzMbw1mUiLkZe0rkMFOTZlHbYORUEIFQqcyiA
	EeMDGopt2VnVW9hOm2h4JtrRktPIX+NwP692NNmFUptYMxG80g6ScEQMg3diU/1t7v/kZdWIfnA
	sFStr8QZ8oaD+NvJTsFOqVEbcS1o36VxFj+kMKeqFLMzpEdHBJH/Xv30KCyWJ0rbFrZqn+5UVcj
	aAwcucA/LrURQ8qPyGVvMaC62O42UPrPL0vbl5KBmEcGm3te1rldvXPJo3fMRAOizLRyjwK1VPj
	zzWujtvtelTaj4oYK35+lr/ib4Eb+aPZEq+fIfvOOIOo/hY0JDR+2+UdenKCE=
X-Received: by 2002:a05:600c:1d11:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49ce582a54amr228971615e9.14.1788449128877;
        Thu, 03 Sep 2026 08:25:28 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm93729425e9.12.2026.09.03.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:25:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matthew Sakai <msakai@redhat.com>,
	dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dm vdo: Fix spelling mistake "postive" -> "positive"
Date: Thu,  3 Sep 2026 16:23:25 +0100
Message-ID: <20260903152325.16304-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is another spelling mistake in a vdo_log_error message that
I somehow overlooked last time. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
index 1d8375cc3c3e..043549b1fc2e 100644
--- a/drivers/md/dm-vdo/dm-vdo-target.c
+++ b/drivers/md/dm-vdo/dm-vdo-target.c
@@ -443,7 +443,7 @@ static int __must_check parse_slab_size(const char *slab_str, block_count_t *sla
 
 	result = kstrtoull(slab_str, 10, &value);
 	if (result) {
-		vdo_log_error("optional parameter error: invalid slab size, must be a postive integer");
+		vdo_log_error("optional parameter error: invalid slab size, must be a positive integer");
 		return -EINVAL;
 	}
 
-- 
2.55.0

