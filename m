Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF513F1058
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753111; cv=none; b=Dy/0r5xmJXtXXFQy909EioQwHQGG9kWSXvLB46c+UYFcFosDmtHIjrNCOOESZZ5DohzZYlIBt1eTkZKpFqsW2wrOPkIMCc08/gqyTIuk8whrxFizs39z0ZqRNGQKxTXHVCNNTRvJ8CugeeVwenCGBWPwXOo9wQ6UluU3c3z+btU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753111; c=relaxed/simple;
	bh=34AoH/Y6BEowfqAYgIkUCUrtzEJre6JVBRjDqttQayM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZosvEAa6G33euxXDMHPMNEAsMI0IVY3Y5yg8UmYK/zs3Hsl+Pao+dU53X3ucS498z8fSVUIymLazz1vuxcqjypyFvHzus5Ncu2ksHFlkKY08IMQBCyS+H9cMpEySGMrGXO+quVtC7Zj07mMBB3KkXK0RkwF0BwZ843kMeMYTSyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiFAUXFS; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiFAUXFS"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so1863852a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788753107; x=1789357907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JnA2gu7/i1xFuuiE6p9ox85cIr8aNojoYOj8kCahsw=;
        b=oiFAUXFSHALrAOyczILFktNHMMNnnsfwXD+ktEr922kY2UFU4e4wVqs/QPG812Q5VF
         KzjE5hJjktyOwLqdwVQASQF4Z4KKbKbAqtg3dNA0eLOpFQpUJv+NbRbyWzPbP0gB6NTX
         ZZ7ZC61q3CGzqH9J4udL4r7/QjJ7O0Pd02v2M0EPEZ0voYdAoqQqmipqCTPRdyJ/X886
         0S4iCeY0YPZMZbY3fQnMrG0q7Bqw3bahe14KLuYllrJ/gteiFVr4PBAWTt29GLBRZEuJ
         VdopWpqec2bDa0Glj9Dce3sAH7NCpL008hnrQEguPyPDQQYZ95NFGG/3HUmCwoTiAPHb
         IAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753107; x=1789357907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JnA2gu7/i1xFuuiE6p9ox85cIr8aNojoYOj8kCahsw=;
        b=Pz9VMnaBl45DLg4F2XCp2u4hznC0mWH1hYHISjhDOuU81sU9B0eYBq7yrl867/76bZ
         0zQIiE9MjzdbMQQ8ZRaL2aZDGoN+QUPhog2vuJzoWVRD23JYhZ76Py0+9TS8gEwIQCpw
         0EnSGeAsaFib222G6/Ung8iMw/G9+kfILKF0kiMfl9CJ9D8OOSdXCrbpWD6RJQtAt3cX
         M0zahAlwWYCeURk+77uhgNhGAFhDY+JTe3aGJ4fquaRT/0ZmpZtORJbQSBots03jPkcQ
         8BWpf0Ggs6ETv+qoldS11CKxUBB5DeCUfe6yy0/EAuxGIhUf/KbL/3IhYBrOtltOiOMa
         CS3Q==
X-Forwarded-Encrypted: i=1; AKwUvByj+GQYoj0r1z90emokHUUe17OaLZXhd6PdeJAEH2/ZBXAaeF63uNA+uOLsV9dAZ/UTj8+5myLcBIZpzJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPXB/kFjbllznrf6/Vs+/5cC0si+Hlb+RqYh2wqTp//8yIe5Hz
	/9rC2FYr+XXaL0ZQx9tlmfT8AaQ7zpXOfBh3J8IcUIFVB37P/DTz5gp2
X-Gm-Gg: AYBFou1OPtHCsOzg5TMZ7JyBiqujdjCqID1cJnEjiezTE9jGtysr9Gaq68oVohOiOQ6
	CarrTdW14bolMwXH4+hTBqOPhn1Mqecp6+PzpGZQTUFCjTqCrTAFwvPHNu792ENWLkiMIGzfSuu
	uQMBzOd5JdHfJB0EuCpvezinSr8BcVIh7AE+YTTRLrB5eBXW+rvuMBgMOGVJcnlvaQGgr8h0oJf
	TC85ZaKuAMqPAVmm4VI16E/jpVpr8A7WjtZE/31+4yUK4Skt/hbm1pSoODOdJrFPjIJx0a5S2Yw
	QGvFR1cEsTKIfcl72UCL05Er3sdQrvcPzgoXi+0hm4yiWcUJFUeBwcMDeXD8xt8G6aVBZ4sENiS
	wj/8ZBHrZC2zQaIaPYaT1Ib8mcLfr3K5tyHYPQbdveEWlO+kYufU3sL8B79U+EiR61L+DoGlu5A
	iVPpIeL1cnPjcv2ag/qoTlvccDte5tj/KzQvOvaWNiXCGUzVSHkDyjTjQRkigHpANdAq5ogKg+2
	dyaOnpGz6GZRFnbLmveZilLMw==
X-Received: by 2002:a05:6a21:48a:b0:3d3:b00b:50fc with SMTP id adf61e73a8af0-3da3a19faa1mr31235533637.28.1788753107306;
        Sun, 06 Sep 2026 20:51:47 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46b4cd51esm2194121a12.2.2026.09.06.20.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:51:46 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered writes
Date: Mon,  7 Sep 2026 11:51:39 +0800
Message-ID: <20260907035139.2183535-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
References: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 16:56:53 +0800, Chao Yu wrote:
> It detaches from fault injection, why we need to change to use
> __filemap_get_folio()?

Thanks. I missed that.

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
@@ f2fs_write_begin()
 	fgp |= fgf_set_order(len);
-	folio = __filemap_get_folio(mapping, index, fgp,
-				    mapping_gfp_mask(mapping));
+	folio = f2fs_filemap_get_folio(mapping, index, fgp,
+				       mapping_gfp_mask(mapping));

Could you take a look?

-- 
Nanzhe Zhao
