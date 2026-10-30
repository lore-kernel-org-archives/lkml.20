Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381719;
	b=DJbm3QDpOruUvpi1v8cSGCCyiqJy2mRZc0FM9h+fTcE3DvfRRTt822FuNNTosWq6SCoQ
	 YQeehIEqYEH185Do6Gj9NdNeRHtYumrxwFctA6DS8zIS6kc6I3lexNi1KyFiCASedm9gf
	 4J/CUSGRRXP+97zUBnlYpOkhYxXPcwW+vD7sLDjQc3E977Cg+b5id63MlLoBSCyGcANb8
	 LOTJXPBxDjm9pZE6Fq/C3HoBgEyzj3KDNxMkdloo9LC8GqlAzLESf2lo8W2rZHYbJQ69U
	 gQEXCePuZCfx/qXoG5GXYjvV9GfuOOBLtbZyRpNnM6vIYlP4vb76i/Iu5NV2MZi7R+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
	b=PRkG1V7rtAyFyjYqZlaPS1x20kpIGccAm5cZTWnyS9wn47x5nRkLfa2EcaAMVVLC0cAe
	 byYaEQoLRNDIL6cDjsmH1wxEp5YqJ40ETMMAm84X8as+50BQkfGx8jceAjgem6vLKm3+4
	 reqrSKfUPOxKpuCn8f6vHlf4BorXPiV0oMpO6RmWEftddmweNKdLrqiiEnxMnoFm0DRiZ
	 mfwPQyIeasRhJwbPI/3IZz0BZu7zFfH/TZTkfS/gGqDP/GsxlVs5hB7jxTnbCq1jAx4E2
	 MRtkS+A/rSgCInOJdkN2SUCPM3Abv5aF8KRweuAzPf6wgzrRmq68BNJZdhFv95WThJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT13e42U;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A4E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT13e42U
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67990a45e02so883292d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381718; x=1793986518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
        b=jT13e42U4OFwVIhji0zXSJ4pfE3/a4dWKQOAKqkeIeQgijbHtJLL9YQwY9I6jRj3ud
         YiWf8veDgJJDdnzdLyaSOfPGptrhvLg6XSYzOoyl1HHX8CR9D9acKDe99ugeiK2ei2ZX
         zqqjweCm2NWIvjXKKOIEQO9pY4odBHSthTesmfgi4NVTzpsN13Qy7UG3CLpjbNWIEZ+s
         /TOtZWBeVdIi8qY/2Bgjxizys5OpX6sz70Im/fzSnJt98HxzhzF3ptnbE5Ur/qh8rxVg
         zxAbF86/VesZNCQ8yM8X/wWiOYrS/Jv+mPCwEkViDKyvCoBmFJGNTO7f1oMLrc7dc+sy
         em2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381718; x=1793986518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
        b=IYtwuvmX5M+M5avMLs+FLNapW5ETClCJiLlcH34LXrOfaRgE/y8C1qAw5nJUZDcRcf
         dfzZsrP/WK3+wPRg8ZpBUlNHasmQ1UH+E6A4OcTeigB5d8zo5nPJbyjzDg1fXOJlLVAi
         KlrSH/Hzt6wE4mYCKhQTeq0UP7f6fjdqJAPVf0bMzxY1ng8hVvqaE/oHl+XQKZGFr0in
         Ou9soaomIxYEhBt8wm+MYPc4YMYuuSmgLRGEyWanRRLK/nCeM6BTSb7u2vLChkQyDfGF
         FGLlm5DZUku9b7qNlzKMs1YfLMspK515nut2nlXKqJCby7oeveqLY4NSt/588kLZaz72
         /ZCQ==
X-Forwarded-Encrypted: i=1; AKwUvByw8rL5RNxuVeP07m/Ec/Hhrnd1TiqWaaVkb3bvjl+e1LgiOuW54ayWO4pyfkDGG7xgmodWYIToMUH+ZSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJij9cqeo26ERLWTitDuGa6bIkxc5ytzb05Kka9Ak3pAqmykuMj
	wVmUupFkeSuLVRBY0KDxycNyI+n1LPVVQ6kKix5gU2wZIG7+0R6csJ2G
X-Gm-Gg: AYBFou3qVPlQ45bS/AMzxTOE1tYaZXyKC2jSOkfb6TrSBoZSYR34LVbs0khVXcSttIj
	1rqF65S/ZDfmcJ8sY82tR/X/KHnECWW0sbNHZzE2HxB5Wssjguyhmahbnawkvv8p238rzojM2Pf
	k9dF5OT7XXSbw/IaQqYSmY3ShDfUGjIh0QxP0aSG46HCd+A7c+obs9AO6AXLfxyTZQLORC2DUvt
	9jhrSceY02vY3XIJMoDRmDtJa4eDQhH5jP3OsJGYZ4Tt2G2f2VgjcSuKnmwEOsmI25iuUlGDjMM
	G8fbLqtTG7zp/6AgSowqtlRyJrzBCMiPApppPiwk6g1ovqU6ANNH69g2WiJOGCUF6i3d3/KKr90
	OxatWNFgShkjLZeA7esYROIQXCk0PKNdTSSigs0gXHH/tmenHqk8ebkod7vNekNcovsr6XmEOLL
	62X9F9OfV/J2y9MS82OBeZ71qT43OEPqURVYEL55DbpdydTo/aLSIkXq9YCh9V+Oj57rB5/DwpP
	7NSfaBA0Vuil1n3WstiDKnVajo4BIFsqltnBGqMUj16E4+fWQB7/wViaQZxSG8GiqRUJz0I/Mnv
	JLiFvo8S86QeLVcKS3B5VypkPfM=
X-Received: by 2002:a05:690e:1915:b0:677:aee1:9f16 with SMTP id 956f58d0204a3-67ba4edd4fbmr2440015d50.34.1793381718129;
        Fri, 30 Oct 2026 10:35:18 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:31::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2aa655sm393389d50.10.2026.10.30.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:35:17 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	maxime.chevallier@bootlin.com
Subject: [PATCH net] selftests: drv-net: pause: Skip support tests without link autonegotiation
Date: Fri, 30 Oct 2026 10:35:16 -0700
Message-ID: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohsin Bashir <hmohsin@meta.com>

Devices without link autonegotiation support may reject both link-setting
requests in pause_test_support(). On fbnic, all four variants then fail
in cleanup when the deferred restore of unchanged link settings returns
EOPNOTSUPP. Removing the restore alone would report PASS without running
any pause checks.

Fix this by calling require_link_autoneg() before pause_setup() to skip
the test when either interface lacks link autonegotiation support. This
also skips devices that support only forced link configuration.

The issue was observed in the fbnic CI/CD pipeline. It was reproduced and
the fix was tested on a local fbnic device.

Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/pause.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..1537f88e0e77 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
     supported fields.
     """
 
+    require_link_autoneg(cfg)
     pause_setup(cfg)
 
     forced = forced_link_settings(cfg)
-- 
2.53.0-Meta

