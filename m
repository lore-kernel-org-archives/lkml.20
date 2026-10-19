Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC04E01EF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407193; cv=none; b=RQTD1fHuxi7d8VRo5UNGj5XqKwzM69XNaGT1XnTqgRtA0TkiYvr/GG+lYEuZeO30e466LfuDHcnbmvLxbw5JkrVRUQpvdsl9bMnmp8b0biPuQC3FI1mi/kfC9Wmlua6A8DZMXpMGmlIy5BfqVNQRLBX166XGo1I6hq7CuPRmHg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407193; c=relaxed/simple;
	bh=fhUwoTKLYGKGuq8P3S7f5SHePS+ZUOdqU5pfS0O0ebc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MY8xwUAvFtXR3sPAR4rrzF+m0DIRVSl6LgB3dDdIBvKmCAoo7lp7YwX2xTTZAoIlmvfbcOOC22Fv9f73/gz/z8THlBAFcdAucI7mFPomePMTDF1b/T0EdqR4qtpNlz3QAT+UytnJyxf/n3exoC9mJ/MFvkprigLsRGnk4PQbCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=el2GgpNj; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="el2GgpNj"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0006B3F2D6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792407186;
	bh=q8A8Zrm0+PIOnWjaNbzg+cn4gn/yB12bYA1j7GbTog8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=el2GgpNjmEOnFypXt8dEGgP0/d+5kGdQdvvd/ab2XDv0SBdq700Q3xkqcFAPnd7FB
	 j7tZ3uYXd/8dJIo2nKxoIe5oKFSSOXYlCSeDTBcV2RcgT4DxkIpWV0xoXF+bXvrE22
	 Uv7pSTWik7W7FvpRG6A3sansPoWZW6GC0WlDQT0o2GGJbrkrZ6pXa3wHTXjxwY69gR
	 3mh7uvzG/tjlsIKf4N6obqqHx7uDUudat/nlYfxWHwWkdV1w6Klj3cDti6HioVyshn
	 FV1UtyhkvgyTFyDtG5Yf88JJgkdJVMx9AVomivgInviscaZaKBq+W7qTtvnyooSqUt
	 MWMY3m7AvQxrNXLzMv+tvGKPHFwSdNx8UFU4fhLIslZ5phe6WmJlYGfg7VPFuEqIBU
	 PG+O4/DHdzrouClr9QBEXcluCSiAKMzd52I3wP6rTvwVALYkhZzQzIghwbrkP8MVrT
	 b9UkbiNr9vkty+ERYb3Y65SKgJlyuGPCLwMoAdELFcqUcB5Yredxc8/y5fv92+7zBF
	 BMgfTQgB4K6ZtwnyZXfAzgsSCcSr6W3Ec5A6F0D4EqLXhWLfwIOkppvW6orSMXobOv
	 +cxwE+xd0PdjKok+BvX4tAnZWUgr7MX3WlqwqNvAjOn1bU8Jt/bMZyCjztsAGU/PD7
	 TR8PaY9xQc7je3/i/813j7Ig=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48afcecb035so615573f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407185; x=1793011985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8A8Zrm0+PIOnWjaNbzg+cn4gn/yB12bYA1j7GbTog8=;
        b=o8ndTgX3u+OQUvSCnTb2TFkaGgncKQS9rx0YnW5JXMs3nZsyOpS0N8GT+RQywqzDey
         ofvJEyKo344zH1G2uhaUEqOJna6WU04gTlOaoyy8364Mrpv554wmiZh9+Ji6heVNjN5a
         r4NQYUJpvJJACHj73PbgNO/rtJpt1ysBbVf+U58Z9sbnsyHq/AIeaITl201I69GWROao
         /PC3VwnqHe4mC3zxkNjagfXYabwGBinClKDpPmbpKerNjgCrF1laQVo4bBMG6LR4eIQJ
         RJ5j6oh2u1XB53F+oU6Ng6iMGSb51TQY5stmZ87MV39GQUaijhrCJWT0y35eIZJ39O3y
         aw9Q==
X-Forwarded-Encrypted: i=1; AKwUvBypOf73VN0lQlhWy4ZGeotGXJvCyt2Wv2YNCSDlArKP1gR7XLwQMdMIMSeqYqI4kIUVYxk7S+kmkTGogQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJubywAkMof13y52dkdewQBYQpV8LzUCmZ1ZiOVuobHSqm1TNMM
	ZwZOkaT58gnnnbl8sebaBx8I3JsD5K5/SDC+tQ4B5HRxL/eWdKM9BtrPpWt7/7sVNwHX7yZpnpI
	WwZguctwuPm5QM8rFnOOvRukhByQfRhYBA2uXOdv08N39pzF0cBNLwp9o/9yYpJ0tlY5EFkboDv
	tGO96DxA==
X-Gm-Gg: AYBFou3AG/LTVtFqvjj8evbYbqpgrZ89bVu80wpN2hq5z+3J3gHMLw5Kect9uKA+l8Q
	BzhtNEDY4GpzYMmSQBauoYnbAYiKJ3es4nywL+6UvS6dRArK3FI/glkFbR3ok6nrz8uiHGFhcCH
	+xWvnyAp7g6u2RaJc5jei9SQGld4WuP6cciTIeFMp/uChslA2LgMVStn1FjGk2oU/+ioG47KhHD
	UoJ01Ft1/45vlSVQ2EFvOaVlMM78r+/MswwtZVCUywHpiZaSN+WehyONu6I7apIPKqTm+e/aFUm
	QrUIZwlO3j6L81OzoqTYRRqXG7AoiOE2hajnSXxEqQszZUzhNa3FtE6mEZ7oLF5DEPSn34Krfit
	5bgOJzU0eGr11Y4gTyrLp5UM/Rf/2/hWz/Y0GeJIQ7T2j/KibDEDR+GPdvXejQhZe2uI7bUDwKF
	aqs9n768z+Xrlnfzdtv6H09XpAceMcZ0BoDGAv/hpSHtPm8b7jRiLEfiebQNqdBvgiMnqboD1i5
	x0Vy3P97UvM8KGXKDTpxk1BJmhlvYMh8gZ3dao/
X-Received: by 2002:a05:6000:298d:20b0:48d:f9dd:e3e0 with SMTP id ffacd0b85a97d-48e07bab931mr10390505f8f.4.1792407185505;
        Mon, 19 Oct 2026 03:53:05 -0700 (PDT)
X-Received: by 2002:a05:6000:298d:20b0:48d:f9dd:e3e0 with SMTP id ffacd0b85a97d-48e07bab931mr10390471f8f.4.1792407185140;
        Mon, 19 Oct 2026 03:53:05 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23238930f8f.55.2026.10.19.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:53:04 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Nowlin <dan.nowlin@intel.com>,
	Brett Creeley <brett.creeley@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS)
Subject: [PATCH 4/5] ice: clear DVM boost table before scanning package hints
Date: Mon, 19 Oct 2026 18:51:54 +0800
Message-ID: <20261019105155.3793063-5-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019105155.3793063-1-aaron.ma@canonical.com>
References: <20261019105155.3793063-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ice_init_pkg_hints() clears hw->tnl before enumerating package labels,
but leaves hw->dvm_upd untouched. Every subsequent call to
ice_init_pkg() during reset recovery appends duplicate DVM and SVM boost
entries to hw->dvm_upd.tbl[] until hw->dvm_upd.count saturates at
ICE_DVM_MAX_ENTRIES (48).

During package download, ice_set_dvm_boost_entries() then issues a
redundant Update Package Admin Queue command for every accumulated
duplicate while holding the firmware Global Configuration Lock.

Zero hw->dvm_upd alongside hw->tnl before enumerating package hints.

Fixes: a1ffafb0b4a4 ("ice: Support configuring the device to Double VLAN Mode")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_ddp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_ddp.c b/drivers/net/ethernet/intel/ice/ice_ddp.c
index b71f3fb791db7..a86ef097826d5 100644
--- a/drivers/net/ethernet/intel/ice/ice_ddp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ddp.c
@@ -2101,6 +2101,7 @@ static void ice_init_pkg_hints(struct ice_hw *hw, struct ice_seg *ice_seg)
 	int i;
 
 	memset(&hw->tnl, 0, sizeof(hw->tnl));
+	memset(&hw->dvm_upd, 0, sizeof(hw->dvm_upd));
 	memset(&state, 0, sizeof(state));
 
 	if (!ice_seg)
-- 
2.53.0

