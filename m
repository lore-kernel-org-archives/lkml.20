Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014231E830
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402529; cv=none; b=Ge8YsxWysjQemnuTJKvXmkm2XQXvKpOquYqLyfgJe5ydfJkXpj4ah1b2GQyAzRC9u5d4SQPEeFTrhwjk/wYX3vCDNNqmrTcPqg1c2xT7PVDCmFF54ncvYXOB+39CV9Wm3p8zgkvw43vTq8lV33u+/XIVIyfFSm5FSL1pfi5cyxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402529; c=relaxed/simple;
	bh=MlS3IX0xH3F6kltkBlDgyiNzI+eN5idd3Z1w/9mta0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cqdFPI602tshwArevIDgLP2OZViHwWX1AyI9WC+EZe8blF9YlEiHYJZL2TvUEwHGiYNkbYO1bLWQkeqBq8KMscElRTWQHJW39BnS0CnBvxe+jfktF049jydNevvuPpqx01I4kanMK2+9CZYNrJRY+ahwyDkQovUOLSniTHGGpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKDBwDMN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKDBwDMN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso606638a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788402528; x=1789007328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5h9wrn+mfzp9QC7ABJOSoQKED7IPugC4MTokiR4EUYE=;
        b=CKDBwDMN5U+nI776xYf3WukymksUp8/+sF1XrHfKNvZCbmfaXFb8WK6XG9NRKpppTu
         PIvRBAg36dZTZiGmxwOCTwM2QqA5eDSgBY1PZX3fvOZBgXPCLX1oFvcXXMrPeQQ0dYfv
         /EwGxbXGwpPseCWEn5EZvSrDxxoIZt0gCnIDguHTgZMmPkrbK6P5G3IMob+gVQB37IzF
         2QazuZ6MPIAH7p/jEHtqRax3i4CPipGfSvaAIRUZllLnPHWrlDFX7Q5g2HXVAKrnNRrO
         n+c5SZ+rQ+n/aodXD5r9fSOrMNWXseqaN1b1PLx5XhYT07NsOwKTzxT1OuRRtiT+VPhF
         +3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402528; x=1789007328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5h9wrn+mfzp9QC7ABJOSoQKED7IPugC4MTokiR4EUYE=;
        b=dyxf9xrMqzCE4jPdXtLEEezG85mYTy0EMIvUzWLzrOlLkNLQLK9NYa1mrZE0s+FSK9
         jAMKIFs2/c+Z2t0S8cS2DTCkCJ6qiN2F8Ctn33x39NeDWr86ME2d4FsYLpTYFZLivjnX
         QXyeEc+A+1LY4glZx4MAp6vsEtwtQRlCdyUoAzUdVjzE5dqtki6mG9QGkOsmI7DGYGbj
         sQs94ga005rk3oCHLgirsEj/48p+gGNR81uAhfnV4j6naqnFVHVSF1gikw/fp2NtQmar
         P79pC72UwansxCFqTQuvkLqhaxWdiOox45bvWVhVk7OCnfsRdnPjAk2vYKcRtM/elb62
         /pAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzps+6dW5kTX9QJTTXgsUiV3vKhSjOLCSygN9aFn8MbpXeHK07egZqsd2t+rPgp0tcUeSwSY+e+BTf/YfI=@vger.kernel.org
X-Gm-Message-State: AFuF++kn5mFLFVtp9Xn30Ldae56+mjUEMRvLeAVERyzX9UuBLf6iMQTV
	irqwIQuPovrjv25bUmK6bN9tKjy8H+stdLgIIW/Xdbv0gJTaM1hzHpQ=
X-Gm-Gg: AYBFou0I7D63yiEANMZl7bnjWk0nrSOon54Ce34etoSLIvrbwkh7yqDYQj/Femn+U3C
	bzKU7KdT1Lnjzk38Q+VhcQJP2oG5/oEY0ElwGJPwo+PLxf+RNGoQV3jTSqhMxqU6SK6BXbwjFTJ
	WsU87BL32U0v4jFAAZm7TCKxT38D8K6kSCP4mFaTnhv/NB8v+t2N//c/mGp6bvyu8JncU2LeqN3
	QGCAc2CaCER/gcD8eN6zyvCY35NIFqPm9shXdjAg4jdNgW3AuiYQFD0umRaCdMBg69laDOoi1zd
	aiQcLi50kag5T/Rzu0cTIEm5TZoR6dNRfcZNn1rfNz0R8yro39cBmq7pvLVYCTp/Bxh6c+QH46O
	FM+WS5tceFuV9ItmcAmxP78cKH5xko9MK7Xl1qnLN3Ra816WURGCXZTU7ZMQIsRh9iVwsULXEKc
	tzSzOWgzRVTFQqZElt0DOU+cSc5rrOyKoqUwkZsgC3k7GzWJPtJLrovPgQP79wK27B7GVQCzorp
	zBUEcQ59ZF987v5hY5avgaBHVA=
X-Received: by 2002:a17:90b:50cb:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39b13222d5dmr705565a91.5.1788402527851;
        Wed, 02 Sep 2026 19:28:47 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:b22d:ab57:a1be:ef30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm2152818a91.3.2026.09.02.19.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:28:47 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phy: dp83867: handle the active-high LED polarity mode
Date: Thu,  3 Sep 2026 11:28:38 +0900
Message-ID: <20260903022839.4006614-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
LEDs") added PHY_LED_ACTIVE_HIGH and made of_phy_led() set the matching
bit in the modes mask when a LED node carries the 'active-high'
property. dp83867 was not part of that series.

dp83867_led_polarity_set() only recognizes PHY_LED_ACTIVE_LOW, so
PHY_LED_ACTIVE_HIGH falls through to the default case and returns -EINVAL.
of_phy_led() propagates the error, of_phy_leds() drops the LEDs registered
so far and passes it on, and phy_probe() fails. A device tree marking a
DP83867 LED as 'active-high', which leds/common.yaml allows and
ethernet-phy.yaml references for led@N nodes, thus stops the PHY from
probing.

Active high is what the function programs when no polarity mode is
requested at all, so the initial value of polarity already satisfies the
request and only the case label is missing.

The same series updated mxl-gpy in commit eb89c79c1b8f ("net: phy:
mxl-gpy: correctly describe LED polarity") and aquantia in
commit 9d55e68b19f2 ("net: phy: aquantia: correctly describe LED
polarity override").

Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Compile tested only. I have no DP83867 hardware, so the failure path was
traced by inspection through of_phy_led(), of_phy_leds() and phy_probe().

The polarity bit sense assumed here matches the datasheet: LEDCR2 bits
2, 6, 10 and 14 are LED_x_POLARITY with 1 = active high, 0 = active low,
and they reset to 1 (SNLS484J, Table 8-24).

 drivers/net/phy/dp83867.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cd..61a941aa02d9 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -1150,6 +1150,9 @@ static int dp83867_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			polarity = 0;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			polarity = DP83867_LED_POLARITY(index);
+			break;
 		default:
 			return -EINVAL;
 		}

base-commit: 5a3f7a683aee56e1f15c9d53041f3236767eaae7
-- 
2.53.0

