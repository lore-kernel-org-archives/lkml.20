Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C744607B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818093; cv=none; b=XVKVo0Uqpu3Dl8Gpln8ThLs4M6s2mw5ymS7yAv0hGdOmxmRkoMaDzBFwfe7cjMgqouTALRR6Gzzd8viWK+9loAxM3cVlGIal3kqJ8Y/EOEjvvHvG4fDUDd3ygj+EdjgyGcfBV5OOtdSaSYff2kRuLIQ9kedcpD5ymORcZ8dNEzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818093; c=relaxed/simple;
	bh=dSgp3zWwSjr9wqGRxsOA9TZ7pvQN36MEudn4AjbW3aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYZjkXz0jRiHmI1jo1L8pCOfJziGu4GWsQpSAhO6g6Lqbpr1rfeH3y2J8O556oP0i39kXOzZHfjlYeNP3OXb5Br42AnY+yQdvru+5KUnnS5OaOFe6pqUasKUOLxXUuFB4p9pEE+qrH8DH5RCXkjHTncGhQPymBUPTxyf/bzaTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOKxDYex; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOKxDYex"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-861145fc841so31891097b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818085; x=1789422885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yLPkFJQmuAEoKFXhrbZigHnjiojakFwcy+wMysCsSc=;
        b=iOKxDYexOWdYt48aqmNLAKaaI0hZvjQuto94utzuN5ThUmbbZ2fVxpT2Wnkj8dwKQj
         KwMzAUnsE5RMpeNTZSZmYVBcPjjAL1XzGfLiOUOGKuTNa+QZkShNHNoHvpmrdVeh2W1w
         pUn8ItYuGmey0EuLVuJF9XGiIB3xzl2S+071wu2TNsqIijbQ/G/QsUYS77M2nj5PHwd+
         tz7nO+iwpDrHCSTCroJ/MFEZl7hhTUNv2ZgFJrcjVmR/rTOoSZEId6neXikrE88OBHV8
         zEboIv4oewBaOE66t3DG/ScdJZMEaqBe2jeMs5qolF/9AxpJlUmMUl+UtllkbvnASGLr
         MDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818085; x=1789422885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yLPkFJQmuAEoKFXhrbZigHnjiojakFwcy+wMysCsSc=;
        b=phzlyzdYqfH85Q8+OsbZSLPSc/qCMdjA2CtROrePt1g6ViWZQklp/p+Mpjkpe8s3t8
         lIahjfEKgGRvjXSzvTxtEG9Nm9nWLgfWArgJfYyAruqSljfddLjT4l0bgS6tasCxGmc2
         3FlYKQaYyJOKa7rqpqORslmoxnjA8Wz1wy7K2fXMVKADzpfZzUOfEtAb0JQUmBNT3m0u
         uR7dupiXK1svNqtJA7TTMw2sJQP/lCT2btrwsH8j2qP2RT/9ZbK2jU6rYPhdbnA/ciNQ
         io9Qo0cEIsIpZdW8QwvddXKO0K2JvTtetVzqgge/5fk5qSef3Disv/Bkp/j0y6kEgC2E
         RoKw==
X-Forwarded-Encrypted: i=1; AKwUvBz89MJN3IxlLVarvCz49ECw685usNJhcA3TerPqS7gnkh+pk/Vtw9yAbixeOPn+yHlbH3RdmwqCUBt5lIs=@vger.kernel.org
X-Gm-Message-State: AFuF++k9aZIyxjNiRnzy2cVC08sbiDF1bYROGspD54ugr6AtUkv/dvG3
	WX/xeUeFYI8h09RRtsExOX0S3IMTS4nyUGQjW2PJDN5JY9bB2H3rcp7Y
X-Gm-Gg: AYBFou1pKhVGOEDHRqQk/ah4WJXpfKhjqjuwvk/ZyFzRLcxqudatTcrlcp9Czv19APX
	RbuXHcVJ163JYYrscarZLCUv4O463Midw2BpDBNGFRuDxd3BHORnS6xu+ICqFtmmmP5bDZfWLqU
	f6MoMh9bKF28IyjGjLjY2WIQ5rCGfI/IHI/lokeTFrd2L2WgqwPpdh73Z0pMFRQsCERfFAMbJr7
	WjlJWAaJtfi+5Uf4WMbCYWEN37Is56j+CS8olwQmBF5eb93dA3JvAPiAIVnx4H445Nxt4rQg8hF
	nD4timkR1lItocz0vtKn2Rg4SxctQRvgLEfhnPk99fvpJFr7BTIg+U9S81eTFct58NtkMEqB06K
	XpO07f5XkMcCaS8sEj33YzpMZLWsqcH9ZARSzoDszSbyIeVNGykq/W3SZIDOqJRtYLELh3EXzSZ
	yWzf36r8zFKEXpq9MYyrIBpQ0k2ZQmNy9nDG0NjcqmX/LoRor43dmL7pMdCm0rYq8+EtcgA38hR
	Q943YqI3oDCrKG6JA==
X-Received: by 2002:a05:690c:698f:b0:81d:6af3:b9b5 with SMTP id 00721157ae682-87125a1c600mr104053797b3.9.1788818085373;
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315127sm78135637b3.10.2026.09.07.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/9] ixgbe: use linkmode_and() return value in ixgbe_get_eee_fw()
Date: Mon,  7 Sep 2026 17:54:33 -0400
Message-ID: <20260907215439.409858-5-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the return value of linkmode_and() to determine whether EEE is
active instead of scanning the common link mode bitmap separately.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
index 36e43b5e88d1..a7b7f89f29e4 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -3751,8 +3751,7 @@ ixgbe_get_eee_fw(struct ixgbe_adapter *adapter, struct ethtool_keee *edata)
 	edata->eee_enabled = !linkmode_empty(edata->advertised);
 	edata->tx_lpi_enabled = edata->eee_enabled;
 
-	linkmode_and(common, edata->advertised, edata->lp_advertised);
-	edata->eee_active = !linkmode_empty(common);
+	edata->eee_active = linkmode_and(common, edata->advertised, edata->lp_advertised);
 
 	return 0;
 }
-- 
2.53.0

