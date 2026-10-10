Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF343BB68F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648112; cv=none; b=LgYXqViW2XwvHJudFy9wX9ZcS8MuzxHCSDJqjXQFqNkQXhtk64buNSb/91C7X0i6E/JFiwgEb4yF1h6PPPU6XrwEF3ltMVZ13DLqCQRF1yLnlH4Xh6UJJWWXZKh40gzH7iwOtkb1lMZuCDIhL1IWonTgsRcLq7I/hKKCsbH2rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648112; c=relaxed/simple;
	bh=zTEIKTFLzHZXtE/A3+jk/VVlG2VZw/zJplZ3MmFf0cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ye4qymWZ0oUAy8C8VJhvx4qW7VKf1NfIP3ruDGbPsX0o1WAdXcmMZlljETMu7wYunkhCEhSUyICWl3LETPYeFMiAq7UvSYkaIlwmqrLOIfKXoAvLWWtQQ8JslzZaPYVFUcQECcF5kHj/SwhO/8J9ocb/gDegNM4+nUNUbmksxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npTm5TEV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npTm5TEV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so310696f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648109; x=1792252909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=npTm5TEVWD0nmpjY9pVMJRTtKdSreUOgjWhlzXsl7ts1IujCYWa4EdocjF6wCNvIxC
         +R2W5x/FJwGcn5kHgKpHD8Px26I2Pu57rV5xNjbzVM9riFXItyAbJ1KVQpdYNOUkcgVj
         mCTvERjo1jZeCvtBr2/Oh7YU6H63Qev4/6UvJDHTV0IdZ0fpq1t5bgq99T5O1pO84RN8
         cGMUqr2CDjguq6zCTttHHhLPe5bgajgvqhqsI7739UUenDl+XOo1j0Wl8cc5ASQkwJtf
         cbgUhPQNCIXQRoSck7oxXmcvCuvf+a+m9Knjhlmj5MbHw89U9FFXqLpK3VuX9+qrlkGD
         Xucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648109; x=1792252909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=kv31KIHc8NKSEr1RuZE0Iy5dqULjxvXHmzpTWnxY8SNkgk+Ts6CwfuBRiUfogxDuFA
         Ta5/MVGrlPn4YEQxanZ2LDlkFXT1dm0iOdOUPGAPVZiU/il/OP00arZJs3MbDi6hUC6A
         R5LJZ/Nk0vqiD8opzrtYpVr3DhOi3Mg1xFHvEQxI1KQgoulBwhcVcrm5MYOzn6B7pCp6
         KukCimYS2SssGoCEksIgrEUeUTLp/dQ5qVyG9Mzd+kQ6EHTrcW5vspaqgxNavvWLuDY8
         mdQSoWWmzF7IzDZ8P/2todf8X+6xTjWtfVHjW9fSlmgIra2ToCbBk1ElfXi/ljARsIiV
         9/zg==
X-Forwarded-Encrypted: i=1; AKwUvBy8kNk6O7/TKw0JCxc4/cDGIUfcbTdXGjn41+iRcdjalWP7IYAsd/ZW6n3gtOdvUsGePrOMW2sbctXO2Lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFVryOfaoACc13TF8Wi5wo+zf5NsshhYe34NmcC1lNg7YivYO0
	NEuYUESYVRBGmVsQWtlXCAD8dNEVZHPnJ9DOepIJuLYbVIiV80yy7Afj
X-Gm-Gg: AYBFou3ZyGwenRjdVChZl25tG65tPy4yccx6oQpREcD4qy/haGiYyFeIee88n2z/pls
	LeznVZd3RfR2IafnvvscV4PDj12B2KWV9FpPctwbnp4MxMHzKJ+Ybei+XvDc4LdWkCxEipg0E64
	N5qOrmMUt1Ic8w9vE8rE0zZpAEdx62+gd1TxlYqrAlNSs0l8aeWVRgsEaRMjVDAVll/kwKPALNv
	4vu8x7KyVSDQyswZFqXBGF9QE0wPwSSt/eY/07SOrtduxdCTQiXFJtgfMZmGZdLAq16C+97Xd95
	9GDny9yA5VzvulbkVsGQECH7ftanyiVb5qYcip8BvE5Byq0tBqGybCjYm9O5qTmveI68xMiqR68
	/UKy4UsYSXZUgm3XKrWgWPcC5DoYES/pgiHI8ecsMlaSu0RTdQMQw/1Au2GSqAqx9vnYX+RaQcK
	57+jnuqCt/Z0gdcVWR1NMurQE/MqB431Bjql+VHOROb1Ef4yQwwKKrgN9kgOzTUoOXZw==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr10490477f8f.10.1791648108898;
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm8579603f8f.41.2026.10.10.09.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe
Date: Sat, 10 Oct 2026 18:01:30 +0200
Message-ID: <20261010160134.112136-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function for mt8173-apmixedsys needs drvdata to correctly
unregister apmixedsys clocks, but the probe function never calls
platform_set_drvdata. Add the missing call to platform_set_drvdata on
probe success.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This issue was identified by Sashiko while I was working on the mt8167
apmixedsys, but it is present on the current mt8173 driver too.

 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
-- 
2.43.0

