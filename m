Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752962;
	b=e8gi2vIk6uRrsXsii//4WzeiGeUAMfhoPfxEXXUIW9vb0jVbdEn+CHP628+6c4pfu4Yq
	 N3g7RR5NFQiYT1vI94u+uTRsfxbocf+DgwdSUS4wCr7SvroSYOoODm1Fg5wYTWMJlvGQO
	 TdBcOjqsFYN6S4MtX4mxJ+lyXjTUbDK0TzTAXixkJw4ycIbmKga43apqd9LdCocNOMgIp
	 CnykXQ+aMRgtR8ULY8BWKQ3UEGFohwB5n2YFajMJZAXn06ugSuXVuUB1CdJquC/J7s7ky
	 UB9LDGaqKq8p5nCdkCpFGSC46k5iGsiKa4kOd8aFHyTGt+kVndALRrvhvapnazaav5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752962;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:
	 X-Rspamd-Score:DKIM-Signature;
	bh=LIUtwVZijcaea8PHqry13WEVg1Y0ZG+St9hFxwNLtd4=;
	b=nL9hcYD42KLnJuEqSX8Z9nfu8D6RUcVIKi3SWAIVK3sFM/rIj6Gw9bPFhIB4iu+/6xNl
	 qpKZQtdekqQrPPL8Mf2VapcJ7auCPLVEhRr08Jr0GTW1D6QKt0CBNlcSaTdpTkSbKvgUx
	 QpAtNDeBaKTO99+X3mgm9+c22y0dBRBNu8cz4sW0QW6COXcaT7lfMvAklgSwlXSbQ9G/N
	 LeDIjT9GdAvs9wKjhXtDOaV5sHBTWc4+u+qcFtZDrPuAnlb7+yDQwKuSjTfnMtHFAHpxy
	 vFwqMxACLBxXAbpK9StUfH9wzgd1JHxZg8sWQmY5eNFOkb2qN7AEka2BkBA0vOdy0hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b="nTECe/ak";
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B9606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=nTECe/ak
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 0645360D6D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:29:20 +0100 (CET)
Received: (qmail 28843 invoked by uid 990); 15 Nov 2026 14:29:19 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 15:29:19 +0100
Message-ID: <3813f20a-7e0a-436e-b8f6-a29756280a74@lausen.nl>
Date: Sun, 15 Nov 2026 15:29:18 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: rtw88: 8822c: filter hardware-handled control
 frames on SDIO
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261115142330.359247-2-leonard@lausen.nl>
 <20261115142330.359247-4-leonard@lausen.nl>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <20261115142330.359247-4-leonard@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.089999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=gsaC/4/UTX3ni3aFcTq1jM1TUloizS3Ttt12uTCL2X8=;
	b=nTECe/akQIMrRRC7vGgLQIr15P+dQ8YGAnKp6ZSGFNYv/SAVL9Woa/qdftW8WEXdsXTWosXtU+
	AQnlYogzaS5Ef5nDIBf9M6n303MbJMcjd1oQVHUlNUHRPM/wwWvpsH3Pjg3IvbQIaze3XywBX0ZG
	SPnCRjnX5aT91d5bOp/hqgP/JM2OhKP4zbgdfYV/sWVM98+wyLlJ5NTJ8IoQrxWbud1SLyr/tBWj
	TjV+67w/8fdOKFhFg464yjmEUNWXBJRX1ScOeUQ9Gu/avSP9hVo1TlMV50kZT1tIRUpY/vgWBYoV
	YdzxJ95FtwypaTEANZB8+O5v6PaG1Mre5KZSzkqThMG/lV+f4X4kE3PHiTBCEPMA/TDk92gx3fzV
	Hyux0gqWlINC4cCNhf37gOtPdY0YloUy89b7YN/uGKE/7ioE9PO9968DjLVNhX/HQubSaDoyNvml
	yIW638ttdNbMkixyKdGfmuoY8T4MPPw1s75JXMvZJP48YT3pj47WtTrF4eVz2T1h6HGtA6jf9RHL
	5Fyw4XhghBlEaV1vDssCg2xvysq9FuTHuGE9YXoXI5AIBJ8uCL9zfTknhlE+EHFOfKLhGkmmfFwl
	8TYTO+C4g3iX63e12t0d9q6bb8ApbRZ6T/RM9O4V1+S9ciy3NOux3CMDE7jdrMT9opX5Njwixsy9
	s=

RTL8822C forwards every control-frame subtype to the host by default.
ACK, Block Ack, RTS and CTS frames are handled by hardware, but forwarding
them also adds small SDIO transfers to the data path.

Clear these four subtypes from the SDIO default RX filter. Retain BAR,
PS-Poll and the remaining subtypes, and store the default in rxfltmap1
so FIF_CONTROL can still request all control frames.

Limit the new default to SDIO, where profiling identified the overhead
and throughput tests measured a benefit. PCIe and USB use different
receive paths and have not been validated with this filter setting.

FriendlyElec's RTL8822CS driver also filters control frames at startup;
this change retains additional subtypes for mac80211.

On RTL8822CS/NanoPi M5 at 198 MHz SDR104, this patch alone increased
median TCP upload from 170 to 258 Mbit/s (+52%).
A separate download test (four 30-second samples per configuration)
measured 241 to 263 Mbit/s (+9%).

Link: 
https://github.com/friendlyarm/rtl8822cs/blob/c8b944a34bba2116fcdb060362bde40242bb87e5/hal/rtl8822c/rtl8822c_halinit.c
Assisted-by: LLM
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
Resending with the Signed-off-by and Assisted-by tags.

  drivers/net/wireless/realtek/rtw88/reg.h      | 4 ++++
  drivers/net/wireless/realtek/rtw88/rtw8822c.c | 9 +++++++++
  2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/reg.h 
b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a1..8e220580be4f8 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -587,6 +587,10 @@
   #define REG_RXFLTMAP0		0x06A0
  #define REG_RXFLTMAP1		0x06A2
+#define BIT_RXFLTMAP1_BACK	BIT(9)
+#define BIT_RXFLTMAP1_RTS	BIT(11)
+#define BIT_RXFLTMAP1_CTS	BIT(12)
+#define BIT_RXFLTMAP1_ACK	BIT(13)
  #define REG_RXFLTMAP2		0x06A4
  #define REG_RXFLTMAP4		0x068A
  #define REG_BT_COEX_TABLE0	0x06C0
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c 
b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 32d9709f2c243..9c9e4f2397282 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -2096,6 +2096,15 @@ static int rtw8822c_mac_init(struct rtw_dev *rtwdev)
  	rtw_write8(rtwdev, REG_WMAC_TRXPTCL_CTL_H  + 2, WLAN_BAR_ACK_TYPE);
  	rtw_write16(rtwdev, REG_RXFLTMAP0, WLAN_RX_FILTER0);
  	rtwdev->hal.rxfltmap1 = WLAN_RX_FILTER1;
+	if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_SDIO) {
+		/* Hardware handles these frames; retain BAR and PS-Poll for
+		 * mac80211. FIF_CONTROL restores all subtypes for monitors.
+		 */
+		rtwdev->hal.rxfltmap1 &= ~(BIT_RXFLTMAP1_BACK |
+						BIT_RXFLTMAP1_RTS |
+						BIT_RXFLTMAP1_CTS |
+						BIT_RXFLTMAP1_ACK);
+	}
  	rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);
  	rtw_write16(rtwdev, REG_RXFLTMAP2, WLAN_RX_FILTER2);
  	rtw_write32(rtwdev, REG_RCR, WLAN_RCR_CFG);
