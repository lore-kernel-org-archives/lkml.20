Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432767;
	b=zoY8h0z15OwkKmjBaER3DhNv03FrrtGBB6fWjD8FgUa6H43Y/Tx5QoyEEufZj62Xqz6C
	 e3aWWxMiczseI+EuEP+nB65S6ECjd+fBYCX5OuVaz29GkiU64Nous430Zl59t3be9pYiC
	 MW3xOifGF37nvNoeJtZa6gntC5SCn5QZFG8yPHYaygf69eZGh0lyRHc2Lf1vfAcKQepWs
	 FRgOHbuW1bQy+cukYstXUQYdVuSKib5IW0u1QvL1qSxlywVPyzs1jSH3cuODxqAtYfU62
	 IXX9G8xV4M3SwTtmNknEk4qRDNqhvt38Nq9eZdP6xL987G3UUhKS/1gfN49Hv96lP6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
	b=joLmsDBMoC2ItkjWNGdDFqFOxJeVIW/xTIG5QPUAFbwaGpxrSZpXczGFTMQ3ZLz8U6tW
	 cEf6LdTd4CzdH+QL4xG1F5veyPnejqXijOzBmRmfqk4VpOpPcQY8zjJuAXCXCjlzJTcoK
	 v0ILPSSlyRxiQgX9yBEQDmo1+2J8kZBlNL0kfCi6L9nf4vPVgCP/RwbpJNymVNrqqDBS6
	 eAc6pX5XOycMXVhcai0I+++xX+AOg8YJJQzVzzxDRj88VdN2DfVpu2eZzCFJMF2qNo50R
	 +qxu2jIqC2hPwna0TNZ78NMalm+qycwOam4OZNlZJG8m2EXmMBstTRSHgUDOVLTolRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGg1OGQd;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130160A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A130160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGg1OGQd
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so29677035e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432765; x=1795037565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
        b=vGg1OGQdEqFYG+5OJ7Ad2rzugyxyNRWf0uU1ZduzAA3z/MeFo9zfKmcOLQUDZabkBT
         CruN3VwUOphpIrqSXn9eD3gIUlx98BY8GZuv+qBckXx8f7Sc1ZdPEmg9uqshs/z+bzzT
         6onrDJcUKOW121BLcx7+2whSiFhJnvkQF1+45+GZzH6qU0ByIMwcEYSLPbvIBWA9MLjA
         Wb31qEOLvK9v7sjxj1LfltJQT6UDaymAmuMybDdLutZYawKVpe/07lzXwNP+RxQiboIJ
         0LRBslXqh/7amG179abKNq2JJ+fJ570q5P2I2aqHRDcbhusn9XSRVhefiLrtdDK4l87W
         xv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432765; x=1795037565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
        b=p5sEaFLl+89bZDAPUpl4lNznJQV9lskNEARuxeJxDRBKvNWyDdov0GHBvoVFTP43sY
         ipgfsgXjXLKlhhRuAAzK7fIJ2saiv+9uxZmqkumy5iUv7Mfpv3uHbI9ZM/AMRluHuR4M
         IIQc93F7fGD5YcUdm5eeXWjzm/wf5GIE5j/mPeap7myWCjdvmd1lSj2rZK1XaZ0PJW4T
         ehrS02RPnk9YhOuwpvxKtF0c0wmcQMAIi1HIigybrb+nSmCI/mONoxOQO1ByBL/sRQN4
         P20WOR47ZhR1wM92sP3vejl5BLsc/vHRYoZJtTxQUf6nxRlcM8yWhxLJ1G3PIQJsMBoG
         /tIA==
X-Forwarded-Encrypted: i=1; AL+hErEwutPNlptwzm1qRxPh9N9njdgd/m/oQ5hX87Oyh6RYOxSuZbRub4eo6uS/HPtK5A3j8+WAka2EZuFhr3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yLi0yfWAFi4Riofzmlq/Us8p5l9Nub5RYkxKVavZLTLwGb+ta
	bXLaqfL6WNzZdxlfzHXc48NIoDmqaBgom21zirhcbrKsAvGQY2b5cO7w
X-Gm-Gg: AYBFou1iyvzPCus9BdOL/p6N3CdUkrsORYEUEdIS8Oiu51tPOOah9vRl+iytixc2k8A
	8spBAq/cv+35k/LGoSI36WT0N6lRElfnnYjdHBuzHLjOeRHlut2xqPbI6QuTSxsvFsqpW6v6nU/
	jnjBCCoMow3jn5Ea0pWKgUJdGYdoPdvYLJQ9/Fb0wF4U2PciPEb6094Oxge8LosfT15N0K8vpvz
	qB8leVE1LxaigYAGEA1HFzMeeuB1oDFk5khG2zLSdS+pTHihQR8ebQA1MoRREEG4tfGY+BN/zQZ
	2pyOB9VHg91h5BYQ3luZj5ZktVJMaVTHlqdM31P3qsDt+63cvLBUFYM9P7aNz0ZqgeNMnb4tUpa
	cT6wu/w+/pH/vGAyM9+eTYVrT+8rwWpJocGkHSBK3bR/CET8blM2jBbR2VpmV0DwnGUU4IHo33W
	WJeQ36okyhUJBL8PPkT3UckbQ5+woLGCdLpZRMDIQYgekNBm2mAeyRxkZ8hWamICfO1eCd0Wkg7
	n+1x22YJc2Jp/CJ9ps7HmA+2XqEV0hUWH8OxSLdWI3KbOSD4qSSISTbD6dzbpPDgPV3fWelBnfl
	aV8ks3Txg/YhC79VQluo9HeheJFKiYuSanA=
X-Received: by 2002:a05:600c:e545:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ba093bdb35mr49832185e9.26.1794432764885;
        Wed, 11 Nov 2026 13:32:44 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:44 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Wed, 11 Nov 2026 22:32:39 +0100
Message-ID: <20261111213239.569224-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111213239.569224-1-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index ce65a1a80840..8e7ae747b900 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

