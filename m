Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614015;
	b=TYeUg9O9ygtlU3qTgHpH9n1O16mPNf13OV5Q9OV8yd9sCncBAcpR1hlPp+drlaox5P6U
	 Xe/p9aw0sACBfqHc1pXFyjyUGMw6CNl7speKeTQhnoifCLfaFEvrCKEAeC5T4UPvP4gDt
	 Mmo0aY/UaA2A3bNifgtVo3JHIAFOUD9mynGR7uNJx+dpcnmt0YKXHauG3qtFHIpxuZRoA
	 bxfflwA5SYSFd8TgYxdNbupMvruCCIncZya1vgHC42KwyJy+vvK+qTpHpRWFl1WhyxLS3
	 uEVmfo2Oyszh1wgGmipsEBAmtLQnwG187B5Yu2m1Kl9+McbVV96wTI6i1hks6hJuqwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=O6VzDFdrG/Id1/OfxjT7usA3UWowIlwkk52HZ2gep6Y=;
	b=5YesBRh5Tx3u4ln0wRZiOGr7jfqFg2tL4vFyRvmqOBEWD7RTJUUKk2NZz6FvpXyADvQB
	 sJTy3SQfXgexzU1ofItyOvNUzh7zBslr9cP3j8NbshAT/hpwQHYGIjS97ER9RsFSDJwoC
	 vdZVWfvmK8jNRxtrW/N+JgNwe0TSZHjvEQ9TpHGGmWMgtjWS/z06+H2vZiIdsgJ2uZ6lt
	 kOerY1Q2Hv0aQ0oN586HkqhxvtMcr6FzNNoGSjAoZIOn2z1gjsdTvjekZQY8ML9G/9n2C
	 eG/LfHZU+OKeMTlvtgxY9UNwbc1mignySpcYN2kKjDvnfJJ1jLO9rxKuAWCXvY3YUUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=rLyuT4qS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2774606A889;
	Fri, 13 Nov 2026 23:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2774606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=rLyuT4qS
ARC-Seal: i=1; a=rsa-sha256; t=1794613940; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JCpAIxTGY9MMMuVRbHrbGi3yTJuhJSLgAI9HtZMKTMDRzKXqUBCTcpGSRXhd7m+WYiA+ACXVlwPqPbDdwyiLDCFu40ijx3bvKIMNPt7623jc3+qtFeDoY8ojsCNH1jPTZjlHPw9m7q7DsgvwkJGl0S17RJQTjM85w3ZS57sptPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613940; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O6VzDFdrG/Id1/OfxjT7usA3UWowIlwkk52HZ2gep6Y=; 
	b=OUmJVillueBSFsYJNKTp7pDaEBsq0OqxJZJrop2+V/h/LQiWV9rI6q1fWczOr20G6bgkb1wYuKBqCpRO1g7hZ81f2JC3gqHRvclDITRuvXv78DVDS+Kxm4hje8RudO7Dof+A2R7KvfYJL3vRKyhAYEvAEeRfSktl/FulHUfKb1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=rLyuT4qSmWde065dwygi59/R1xudbjymhiKqMdE4BHu5NUAQrGbCpbXadS5tABCVbNxLf0i76hlxTSoSJu6jI558y4edHAQNG/2NutFsi2hjLsBamqUXdD982lcWvYjCdf+L03SaGTsJc/VovZbsOK2kd7PzFNtbINbKegnFPPbWv3R4CkbPiEFuMUUX+7xtVS+loEjn1E3xkOM/QH0EJWFjJ4oBNaYlwH+4F8SjFWhCEGa06hWhIyeoN9r2HUOF53Vn6ON/SRI134EFTSWQ/Vb1OHYiuHiJcOC4Ncf7cTS0was0AV+tET+JstZA7/1iktaYib/ABYBDyiHjnNMuOw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=O6VzDFdrG/Id1/OfxjT7usA3UWowIlwkk52HZ2gep6Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613940204291.9010366689007;
	Fri, 13 Nov 2026 15:52:20 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 02/10] wifi: rtw89: handle negative rate index for injected frames
Date: Sat, 14 Nov 2026 04:52:03 +0500
Message-ID: <20261113235211.1911-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
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

When the radiotap header of an injected frame carries no rate,
info->control.rates[0].idx is -1. rtw89_core_tx_update_injection()
stores the index in a u8, so the value becomes 0xff and is added to
the CCK1/OFDM6 base, programming an invalid hardware rate into the TX
descriptor.

Use a signed index. If it is negative, keep the rate already selected
by rtw89_core_tx_update_mgmt_info() for management frames, and fall
back to data_retry_lowest_rate (or OFDM6 when
IEEE80211_TX_CTL_NO_CCK_RATE is set) for data frames.

Fixes: e96abe4fd7cd ("wifi: rtw89: consider data rate/bandwidth/GI for injected packets")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index b7df97e..527593e 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1239,12 +1239,25 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	enum mac80211_rate_control_flags flags = info->control.rates[0].flags;
 	struct rtw89_tx_desc_info *desc_info = &tx_req->desc_info;
 	const struct rtw89_chan *chan;
-	u8 idx = info->control.rates[0].idx;
+	s8 idx = info->control.rates[0].idx;
 	u8 nss, mcs;
 
 	desc_info->use_rate = true;
 	desc_info->dis_data_fb = true;
 
+	/* No rate was given in the radiotap header. Management frames
+	 * already carry the rate from rtw89_core_tx_update_mgmt_info(), so
+	 * only data frames need a fallback.
+	 */
+	if (idx < 0) {
+		if (tx_req->tx_type == RTW89_CORE_TX_TYPE_DATA)
+			desc_info->data_rate =
+				info->flags & IEEE80211_TX_CTL_NO_CCK_RATE ?
+				RTW89_HW_RATE_OFDM6 :
+				desc_info->data_retry_lowest_rate;
+		return;
+	}
+
 	if (flags & IEEE80211_TX_RC_160_MHZ_WIDTH)
 		desc_info->data_bw = 3;
 	else if (flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
-- 
2.56.0.windows.4

