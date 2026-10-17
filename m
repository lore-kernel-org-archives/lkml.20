Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8E35AC0C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212348; cv=none; b=kKcs5YTZ015yYUXoEgoYAfCHTBipWj4wJBpQWqVL87Fl1Z7QyVfc+HtDjT1LQs8jGE2j8zRxIXEfODGKQUXy5e/9hsvZCMJKBoclnUsELCKxUCWwOigNCj36PsM1bGOWSNwqgBcbQ3IOG4Ej0U2SorzLSAgcTHfEU9wPjtdZKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212348; c=relaxed/simple;
	bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtN0tNMNfN1cKj56BH84MYmsQu74PyOVMD0p5wIhV0R25gJvc6PwoxjT61fWnChsUPbyfKwmNEJ2FqVsPoQjLoTFvEmz7LnHSq8W+EyvOQi1oLngcH64TzTo4R/kzW85qOjI/OoaiDMQQLKi+oK2eh6DsE/dnhJo1CdYylF2ooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmE4RL+7; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmE4RL+7"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so1131386eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792212347; x=1792817147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=XmE4RL+7W+7IvRz+92HIkEj1wHBzTDcSK3XxSNPdbbMwDEsIlxounfzfsAud/ZN/ZM
         DETXp5YTsPIvRsqoILXXGheZxdA/SpvZUpoiM0CeVlYCoe+jOZS1ERChSCHbCnmjGACe
         FORqYyQfalqbPFFzJc133uxFrE8xXgQnqilSByrwjD4FZ+9pWCnNMu0ojeicKBs17vGm
         Bqd6pZP6dFpGB6jWYWx2Ri8j7vLW1sMl4O5ul6Qqg/t8xH/La+hRooLH88w+mOTCvy2Y
         n+Fta5FC3qdLtcgUtQK/wpabWMQvdXCLyjY9bWhgl8p3YPJGCI60fMIgcWgVzQc2b3dx
         kbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212347; x=1792817147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=beqEAA3I+H3KeqwczfzuArY5SNcEyogmq5EdUOG/CY7QWdnKUugwXNIGWySKAts+uG
         E3PXM/OFsJAvefuR+yYkXhj8egR/IhWw9JggLkjciJoz8+4ujVAU4bymL/Z9zjvJX1Ks
         2PLREut1uH5Hr4Bxt24subZEqPfq8FQv3Fsut9UIWYxIVbTzdxoHXnhFNHRkbMUVc9xQ
         GMX8EYK0g2NShlcgNZLqr2O0FD9ua4luZXH+Z6BBC6S9sGuZtVH8XC/WV9vo5bVSRCRa
         MoGpBy1oKn+l8JG3b3kfOlsDpUSDjbaS5i5C/bi7+bCrsU/gVuhAbAdUJQNBKJb25Fq1
         c7Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzDqGAmHaZ8Ontu3KwCU3RavVs8bPB4Ahx4ZjXLeInJwYSSv+eWUS37mp4XrgHfm0CeCgmgQFwkPSosrpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2cS5p6SXTkqqcStiHQyOmpz+JeUDchWk90Mieb9pUuX4EHZ3I
	1VEMeeXjxya3j0tEIkCV+Txrkf3m5KMQABELzJai7WLpji+GWMXnBWzI
X-Gm-Gg: AYBFou33anv5rKyX4AaMIS2dtfFYyGtbxeKi/G45Wolvs9MAxebrYqBiliNRurUnK98
	heHXF9HYImD2T2Gs0HENO+HQYKt+eMaTuYb8UBUfkYuZfsZNNcsLe5yRsN1bZkh/G1aHLHtoNki
	UjvMdU8OHpAndGgIvp1P+CmrkcYf0NtPUq8OQj5bVpnC3U6kbEMpl/A3GlPnG52csLCiM7m7BqF
	dmDFz217Zt2frId6qTbmgRzYbQq3KkyAxzYwYqSm2gWrMnbnrX25f8VbWGk8ZXHP47kZxdh7kYs
	Cx+A6d2W4pKd4MdszDzyJOciEYedvY2mlTiCsIraabU+d5KUozmA1maFUO1PjYHWe1WZVc3b5Z1
	KFEPtXp/Rg1r18BUsmYjeWA9DbQSYFwBNyNrqaZvtD3fS33Ht71IAVPlvLeEK32wL1N8QBbbS6K
	EbDB2L10QWNtA6XG83CVr4ecEyHyQfg0qWfbSPX4g3y0QombZmFH4bcbI/fvl28GYS/noYeJ75k
	596ccq3qngYUifyFzkKLyBvF9001WiuC2mi4U2EvXN1qcaqGR1AnO3yJlDiiA==
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr3479430eec.17.1792212346779;
        Fri, 16 Oct 2026 21:45:46 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm18561568eec.28.2026.10.16.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:45:46 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: mohd.sohail.biz@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Fri, 16 Oct 2026 21:45:11 -0700
Message-ID: <20261017044545.251639-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver is being deprecated and removed, so patches
to it might no longer be accepted. This is according to Luka Gejak, the
maintainer of the rtl8723bs driver.

I found one of his messages here:
https://lore.kernel.org/linux-staging/5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev/
