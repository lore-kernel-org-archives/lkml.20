Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD840379C32
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520443; cv=none; b=WCp5+sI+Xfulro9EJAAjg0r49vwjwgCRcEJAKeipq8jIiviEo540H2PFdkIuDAYKh5oKj1PwM0BgCNTiQwk9D2I6AtVAvF1Hue3u3Cc7GYkWUoBiJPIxpzIeKYYB72XinnwLYcaXGLN/lsYzF4Q2RMTTaWT7Zc27CLCR2cDs300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520443; c=relaxed/simple;
	bh=xPK2t4dVouE2ovJ9joBM9NP69qWKdD0UzEOb1CVD8zM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4TTr4q71/RKirfMB4MIr/8oxMSVOr5S2GSXwl604tcqN14G4/coi0NT4QT6Szrc/xzZGXhPFL1pcfkPaHuq1Jux4V0V5w29/DOn+klJrwjLiJHroj4W/Nyc+5i6FAtPmLFbSl1wVrhTFMvdud7Ko9feLVYKDiAJ1sqqIWhe/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt9NA05w; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt9NA05w"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd68a16955so17931915ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520442; x=1790125242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGlFz15R1rbiCxHN0uJe/I5FW6CkIy16D/PLU4iFFD4=;
        b=kt9NA05w9eAmUicSXICjMMEgNjVVsLoqWQG4+HyoTB5GOMaQdmQ5O94kdHChMc7lIx
         kXxP7i8o9stdcz4YgP1QYDOl3GEHSsFpbsYdsd4wiEw4PKRnNnUFraz2iDvFPIRFr4Sb
         pWScPPUD2O6JcMV9oFvvPNBEXddVWD0xSmKIhV2wABNpPIA/u0ovG47SSpCo30FWwrhZ
         7OwMXY4O0AgNwQJYc6uPdAJZJGCCYQgRfBAngg+nvaOn/DYokEsFS0tCh2mqa5L3E2Ws
         fel1mE40DQ+WyEkGlN6LVhpPEYLsFCBR/5jPnsdYqAZKP2v7tjikccpn9MB/AFdregRN
         lr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520442; x=1790125242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGlFz15R1rbiCxHN0uJe/I5FW6CkIy16D/PLU4iFFD4=;
        b=mxB9tBM4q24I4iUTUoe0V+7E53atu92zPnoSzCAv7w0kEemqtiDJMvYkAH796dLm72
         UoKooDp9BmM66Elyl+oceNn2Y7Sw27r0kBNhn8C0+RZb50uEzExjk+p6JsIKqvxfjf8P
         x3SpWsQ5OqC6h6W8yFgmqcLqX++xodJXP7HgfnA8TB68zgV6es0X+qCJGl/Das4s33UK
         dcknmPIw63gHsHBrfPGhfL5ufrUCADqH9Q28AV4jHTLKb2rbDeRfDRktVTg3+C6nURgZ
         Gx46Hv3jOaZJv9OPr8Ypp4Isnef6Ud1cDY9ZlqVy+zRQtKZyNzTYZ7F5uPBmQ1iD1K8U
         S1uw==
X-Forwarded-Encrypted: i=1; AKwUvBzcS/5U19iksUHS7hB0iup+962zIGWtXG/1ZAUR1oTBvFm8qBoBXvU2rHpZYm3QfysdPlCoNzDH9BtVFns=@vger.kernel.org
X-Gm-Message-State: AFuF++m0txfHG1V3CDsLtxW3GgqA3e8U4uL0pE2eqaHqRV7b6jXUSSPf
	4sTPfdiGBZfWBH0HO+WmsIVCq4BEA4m7zdRmOFPmDNtwohTqByROU+0C
X-Gm-Gg: AYBFou36TJVzuV0F0emAbCZsO9VTjLIbekIx51fXd1VK6AvU096XitECITIwiH4dufg
	/xkCcpdLlFaOQYK6zPJA4bqdTrDQ9WryYrgOP48TdoO2JCqy8NYc9dcZMSL7plRbuPykYhb5vS5
	HsUAKfMa/Z2W6CTfUE6acEdaSEEYvdrFImndW/2ZccghL9NdVCQsldOj2XC+jOFNS/pizHw18T4
	9F3lg/XENGl15qz6jOSrHQpWa9qU+MMCvy1ltqW6J6zjzkPP1QXtuXxKdaMVSKnamBlW9sxPFfe
	7tVW3IIMc4k6UlUBhVQ4bQAC4YwyRHqZBkEL9nJOYwMT68iyPJn0Z1ofHFfVAqScRJFQg3LbORE
	wtGJ+NVvtCexMQBuSB3MY2tvCLebt2zyFmTXJBF7O/9DgB4lAhetPc5+OcuqwUs99e1MtBgUEqH
	EkVacgB99yCmyILUZGGjVJVdHS0qrwycmL7J78G06Ar/V+6lCT0yUWpwvwAaoZXiCGM4uAJQuk3
	Ychd1OULl42hN+ZotnqO+Y2l1g/uwl3fE3zqA==
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr8791472a91.23.1789520440642;
        Tue, 15 Sep 2026 18:00:40 -0700 (PDT)
Received: from narcisav-mac.thefacebook.com ([2620:10d:c090:400::5:7b05])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm2123023c88.0.2026.09.15.18.00.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Sep 2026 18:00:40 -0700 (PDT)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev@vger.kernel.org,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Anubhav Singh <anubhavsinggh@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	Coco Li <lixiaoyan@google.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	narcisav.kernel@gmail.com
Subject: [PATCH net] selftests: net: gro: fix OOB access when under-coalescing
Date: Tue, 15 Sep 2026 18:00:29 -0700
Message-ID: <20260916010029.50911-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When more packets than expected are received, num_pkt
could index beyond the end of the array. Add a check to prevent
OOB access.

Continue receiving until the FIN is received to obtain
the total packet count. This helps diagnose issues by
distinguishing the cases where no coalescing happened from
the partial-coalescing cases that didn't meet the test check.

Fixes: 7d1575014a63 ("selftests/net: GRO coalesce test")
Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
 tools/testing/selftests/net/lib/gro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 7a333155de1a..85ba69eeb6aa 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -1211,7 +1211,8 @@ static void check_recv_pkts(int fd, int *correct_payload,
 				- sizeof(struct tcphdr) - sizeof(struct iphdr);
 		}
 		vlog("%d ", data_len);
-		if (data_len != correct_payload[num_pkt]) {
+		if (num_pkt < correct_num_pkts &&
+		    data_len != correct_payload[num_pkt]) {
 			vlog("[!=%d]", correct_payload[num_pkt]);
 			bad_packet = true;
 		}
-- 
2.53.0-Meta

