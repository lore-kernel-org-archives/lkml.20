Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908661;
	b=SCbW+xWu03i2+XZX8kV2WANgz6OmuF+a++cmMg00UEbLHY3N1HEtq2g3eFZ+FS69ue5I
	 uXdCjJ3wUlVa1MASRSfTmTeY4ZxYuTQPfQPQOrT+S3iwgJpCcfBaZvzrnjfFiILQ7+bS8
	 vaKZTAs8HqD/UnqSx3PdoDhECmQsFubFRPG+oZv/opbP8NREoV39kqIXYcC+i2jKKqamT
	 lnwd4MqFYt4fL7tHJli4HD+CRzni6E5J8ccs7mDeGcWp73WNlzzonXRaswjr8M9ar6+RZ
	 x8zmBt8OvItoDvQwvm+rv3GRxytMxxrYbihLlJDR9RQeLgjEZ7NAqjnptPo01OHic6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908661;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=;
	b=weSC8UqzFA7ttGD0paRa6arMI+zINted9s95BO1Qi1PHw5e2GqOugtm9DYBGaMaSFs9S
	 lvzkj0biZWZsd8buGUgfDjmp1Yng2MIlFAJP+s9qJkwLjD6eMsEzc1p84waTxCK1HFXjk
	 0MCMq2gThFE8//uscPqdbubJSZWvA0gKpPeSMiQ53EscCX+Ava1QLuYkM5mCG5dlfWpW+
	 rR6ltFGSKFXkD/NFIdyQFw/M7/zCxfVeUXdMZc+YJPPsCxxdYvVHJ7J33JMiTVfDlVhSL
	 6JLDBwRsBlwd6lNZiksoU2l8yFdbPv44u43ugstrfFLxsvjTyPdBAlBROtpXx50nhGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b="NX/ZVNUm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E060A382D;
	Tue, 17 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79E060A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=NX/ZVNUm
ARC-Seal: i=1; a=rsa-sha256; t=1794908505; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EzdVFzDFj0cCQ4ajqjVD1nK7h5nxaEri3vO3kDnBHiMfq0Bg7p9m8jDE9+6sFpXMAUG7bHKFOv2AhoDltKP/3vSRRiKiMhrTTSNgqnk5dSWLtxzY/gfR1EQDTzKgUUpB0CQ7A8ilh60PFgTNgRIWbdJEioaM9G4wE6FWr3uZpRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908505; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=; 
	b=f65W9fUs8170dkGN/Rfg/Z/H9zPp4uI7ZLgT5/FWOXlBXdCq/HVXtUUCaeZIZ0JRIDPoSrqXa5Sw1XtbfOReTp4SpUUQlE0qb8gfQOdQXIOG88cfHud+DLI5NMnmvfn+l5F7XWHsl/d+s+Gd7LrL6d402e7MrS1z5kF9v3we6Vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=NX/ZVNUmrnrupsev8ejXNgmmWw7Dg/DYeDTSnEYdySYFkQOE59PomTBa7CCe54qVNxBLcsaGU3XyYEOO8FU+986H8tHmD1+U/0tFfeE6RaQuohedm6YxKfjt3P4mseTCopLYyNTAlFS2+aS4jaikCAtChYC0ac9HOLIs3/J3QVKkLDpOQie44WxGtRKSDL4PfkWOcdPYCiSO2mLupydtV118TvKVi/ja96k1J8G/pjZbgIpjdGfwPaksXzKPbbQYOEDHXuBwSPJ1vMat5v38dHMMbeC6Y5odw6ULNTlt7lfoVnUJdsONhXKRVLOz0JuS/khjji3lRxNRTGgfT873bw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908503541181.40351159060526;
	Tue, 17 Nov 2026 01:41:43 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 2/5] wifi: rtw89: handle negative rate index for injected frames
Date: Tue, 17 Nov 2026 14:41:32 +0500
Message-ID: <20261117094135.1772-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
References: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

When user space injects a frame with a radiotap rate that is not
supported on the current band (for example 1 Mbps CCK on 5 GHz),
mac80211 sets the rate index to -1. Storing that index in an unsigned
byte turns it into 0xff and programs an invalid hardware rate into the
TX descriptor.

Clamp negative rate indices to 0 so the lowest valid band rate (1 Mbps
on 2.4 GHz, 6 Mbps on 5/6 GHz) is selected.

Fixes: e96abe4fd7cd ("wifi: rtw89: consider data rate/bandwidth/GI for injected packets")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 1e8b60e..37ff745 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1259,7 +1259,7 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	enum mac80211_rate_control_flags flags = info->control.rates[0].flags;
 	struct rtw89_tx_desc_info *desc_info = &tx_req->desc_info;
 	const struct rtw89_chan *chan;
-	u8 idx = info->control.rates[0].idx;
+	u8 idx = max_t(s8, info->control.rates[0].idx, 0);
 	u8 nss, mcs;
 
 	desc_info->use_rate = true;
-- 
2.56.0.windows.4

