Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699652;
	b=2GyJ7SGhWVJk7GhFRlaCi6NK1PKNQw+6aTlb5d/FPEuzQ200yZBQwP6YJjG2Ku9S6cbR
	 p8Tm9dOM/WCyYuNriYasUIOBGZ4QKFCL54sFF95TB9t7INuLhOFiUwGWoSqgEdZpMuyRr
	 BSQRZ/QLZfekq5ZQSljVDItusWBBVo8GU9zRf4tKqINH3v7qohfgDpQKxMgYQeb2qDTL3
	 o167Dsi/ZDPeciw8Mt6wACaFRcWDUGRXgTq/kDDJkFPt7JtrubpSDcBca9v1J+rnGkT04
	 +PF2X0jmpVx6EVJARPkH8l9Ai+Qih1gzLipvf51xjW8sOWyB2nectpiVleeUoxIA2eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bEaC9cqGjO/waX3lszZK3l+LxB2AmWUBiYfX+wYhT3o=;
	b=bNoRxF0nDdntJSuEMFQQ9JXlShTQ8eyCbCa3UL4/n1jUuNvrk7bhsX3qQ408ufJxfArL
	 IyjCjDshsjLe7DaqGnY/2Ir8vApdlRANyBjL9oskud7dR6ABeXtgCQpO3IAPKA62t96py
	 vhSMo6XwDQHYOO9R+u8AyJ7QME4tbjhZeqvrF5CISOJqzvkXIdfxPIFNgWCbs6bYQbv2C
	 YLi+FoqNW6paBDdIt1feQBPKhkiq1mRsN7sSeSimev2dasdjP8IG8CYCZf6Q1g5O7NuKm
	 kfvIur5JJFyq8/zYYXjgNkXW6b2SMcn3dEd+J1xcKrljvIMq88F0OHHd/4byOxY5teg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPV0q2F;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E46085081
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055E46085081
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPV0q2F
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4000400c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699651; x=1794304451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEaC9cqGjO/waX3lszZK3l+LxB2AmWUBiYfX+wYhT3o=;
        b=VWPV0q2Fql7iwZXyb2WpBVW1604iWAwJ49R1dY/T1xlKmrcuPfXP1aPT8r15f06qki
         Mg0Cs6Qvxcl/eOhdk+fWXFTfOJn6OlcYKu06Rnk4hVzegy5W4M9nBqD3R+jg2HicPSHb
         VTrvhTDIEw41kwu+7w4vtKbrylmqg1v+H0wQmOb4/5Xk25+Kq2Mm7XXJt+3vo/h5Rd3D
         cSY0mwwHeEKWtBEF0beETgc+x8pl803f43Lb/E3Ft/Ny6Ia7tcsJduZh4R89PT0LRGLi
         nMnP7qTR5wQzsh0293uLJHNfLMiMP5jLNWSVt+9U1+oRzGnhaYqi992wVpehb65q2sNz
         hcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699651; x=1794304451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEaC9cqGjO/waX3lszZK3l+LxB2AmWUBiYfX+wYhT3o=;
        b=i50saCnIwBy/xJ9ZU1CVIexkK4QsOWCZmrKBgVNpl/jhvVV1HK7qXJ0VoeQUEiwSAi
         Oc+a0dhVftu6gf5/yRQekCVh5rq4JW7eaWkP1k15kUhQrEjHEYc7brJftLNtr8uzvYWs
         X09X0U64RW2LFrZ/pjj4KHcZxSpjIPSi16FihXgrrClOUceAv1SU4YbZC0AH0/tPUUBx
         YRFyquxqWwr0qpbCl6LpeIadoaqBTFxa/1k95NMMx8fREstMyKLYq52/aFG5r8mVduh8
         E3uhBFudZPAzpu2hGy9xGkmdtuQ+lmsU47Esjq2eWGARwR3emM3dVDEMn9ciJ3NKukFo
         I7sw==
X-Forwarded-Encrypted: i=1; AKwUvByKpYPt9Z9I29UmplZJG9pz/j/NWQdOJ1DQCYQyXQMNnuVHmfj/2MG3IStornQ76g1sNvI4JCKNB/fCkeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8arrAdFSvDDm9mZtaLnUa3NK3FPq8YR0VUpUIWs3nBP2VAV96I
	/A+tzM1zHuIXxQRSKJw7XUS+l0wKwwWtysvsg4hGanaAtj59GFs3Zqym
X-Gm-Gg: AYBFou3OITaGV0ISTRxrDNCVff7eP0DS1sjCUgnGJp7X/r+tvo8emKlGcwCkHlEpR/9
	Cn6fJiOsD1dBAVDMYyozFKC0nhZeklDB1LBBqj/fpGi/wP4Qp/zOSxl7G/04EAFNZJMzpOcdq6z
	sqftw/fwKJF/N1j2M69Fk4cdGfAIirrQSoVEsxKNdnKLDoAHZptkVxtc1kBZdz0TnnNJoed6toT
	4pgPZXv+LNBCHg6Z82mQ7xxzeIQ7naB9HXDIT3sJoE9zTxL2ERvazTOBZeZMIZrUJXntI/Fp0Pv
	Dsge1wgi4CJ4oxdKMG+Oiy9D0nDXoFZZxNARezjEmJobxAuYHu7mTar0otx21G3GkDrhDvZMU1n
	0U3vPfSMYFedoYjCiVlSAJEvv/aOE8V+jHTJuTF74d2pDxOQp0t7dsfsnSlvomYW79+mqvm/+ct
	WfwTzMN76IV925LCHfA6TudFmeKvjRGmwRTVrFZPuIsw9W83NFVkGo3F0YHTJUW+mtkRCY355gb
	IHGhRtuh/5TNicggnVqReM/1xjY0IPPR2dWmkXMCWC7HIuOlo1FsmIyIlM+h2gIp44rHM8hrVU8
	lnbQRYYhPvM8X/DXz8WbXmkPP4AzHVQsIUwO7zqEwH9/T/kYNq+gMzJPnwSt5nwvzV/wm2AstXB
	06IUke7Dc
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr24148676c88.24.1793699651034;
        Tue, 03 Nov 2026 01:54:11 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:9e8b:5db3:accd:585c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm44178383c88.12.2026.11.03.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:10 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
Date: Tue,  3 Nov 2026 17:52:51 +0800
Message-ID: <20261103095256.949327-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095256.949327-1-hjf3108@gmail.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
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

Only the first frame of an A-MPDU comes with the PHY status.
This makes mac80211 report the correct value when queried from iw.

Test results (2.4 GHz):
   before after
TX 6.1    5.2
RX 29.1   27.1

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a34492030c6..a8910cdbfa0979 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -425,6 +425,9 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 						     stats->rx_bufshift);
 		_rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
 						  p_drvinfo);
+	} else {
+		/* Only the first frame of an A-MPDU has the PHY status. */
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 	}
 	/*rx_status->qual = stats->signal; */
 	rx_status->signal = stats->recvsignalpower + 10;
-- 
2.53.0

