Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614121;
	b=caWJSmq36Bb+EnUxsXsBDHwUkYx+mfzynzSPGN1AagdxhpFAbYtaqZYuTpl8YqNKj7c9
	 VyJtsGpXTJdDC67v5LO91xHSf+I/8VRhDF3GPKWRcyEULJhBlhemlc6fwDIKzk5Q/661/
	 +E/Zg8sHc0eGuQyWbkcCHGRduTT8glSl2iACqrgpEIn7WWbLISG9NFeGPO4MBvkBU4aLX
	 K3BeROebld/A2vs8QRLYdqB5Yifdn5QDif1eFTB5khBY+TXKtz3behud9Ie8uGSFOcdox
	 aKx4nZFFNOeRigysV9CveZiVO8nTJzkeXcDGLq7C4wV2EW+LmgNHRqr5Ki5I2FQycRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614121;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=BDmNp4Xz5w21MkSPxai69E07DBPtE9YzGQTBFDr72RM=;
	b=jxfNPXqgUo+jaqzDOknb0gxl7nbEPcaNWayDlDs8wYhGWqQH7I0s1vEg2oH3hG4JhYu1
	 XXvHLFYWX1u7D4awPHPsFpoK3cgblF+UYBkQrTK+crhGAL6m5pe/zGLOrqlMPNAmgeNWy
	 b8n2xFIDOnMkrKsjhFblSO4klyx9N8vwWWSuhd9Ehf9x2W+9IzmsiY0VK0LwvyIT6c4dp
	 RjQSp1Y/2J2U6YQ1xRIrZ/9iOS3IwhSyboa4oiMiicEvmbSiCRqL20WOGLrhMc2x0fRA0
	 xR+R8QfKuNv9U5t4d533cgRM6fwlnJ7/Kmm4qnLLSj7bqTZRdKXTYmNUUZXscDAyAVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=OwtDwi9i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBBC606A338;
	Fri, 13 Nov 2026 23:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBBC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=OwtDwi9i
ARC-Seal: i=1; a=rsa-sha256; t=1794613948; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XSSJdMnEGl862DCS2sZZd3iwWjRkkAxX2HE5ENpDy667wonU6nXkRQCjqxzzciLBGs9/WxeANjjjpdC+CGsR1FV/N5qPznojNkN9RrPLGeUkAsTSUCe7VkywGuYYKFtVuMn2td0wioGeWdxgacyc0+DLpGtSpCnzqSNEIi2a9XU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613948; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BDmNp4Xz5w21MkSPxai69E07DBPtE9YzGQTBFDr72RM=; 
	b=H6jkBfXk6x8iIY2AY0XROd6V4S6aY/KacDUsJ/3PYa8v2dGSQn2Aas+0Z6ZvPyTiV/vab1t6NAyPosg9rMXdIbGcXDxgT5HKmiKipUDVb1kiBFZr/UIZ5ZTnhaKr2hDTlgS5XJY3gleFeyRkvkksxXbsjkDB7TR9NT+spb8L4qY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=OwtDwi9iH0zjcqE6mIKqwHjP+yiHjFFAgc4x1oxw31hQ1S86WJ41ML1cmJw/cpNQs8EXaL3rJ3TsJ/5IDRU4uwJRM4eRsZ/vondLMia4IbGuqAJPulZXiRYlkOkyCaspoz6nSJek3L1NW5/Kzsp2qM4+USz++rxcAE59jL+LHT430w4hzf3m/+TcO2pfPY4zeV+F08LJBf8PK7oDJm400KBdACHSrJ1Pm+VvrYkSpGOHyC7DUXgVa0Xzrq6fpJ8lxAKNf++AKzjSRzFiYMpIym7azMS19lhLmKft/2MllgFd1liczOM4pWJDnK/ORBaldghAbnT3bmbiD8osSg4lCw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=BDmNp4Xz5w21MkSPxai69E07DBPtE9YzGQTBFDr72RM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613946521832.1566096560762;
	Fri, 13 Nov 2026 15:52:26 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for monitor interfaces
Date: Sat, 14 Nov 2026 04:52:06 +0500
Message-ID: <20261113235211.1911-6-owner@ph4ntom-rev.uz>
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

rtw89_vif_type_mapping() leaves net_type and self_role zero for
NL80211_IFTYPE_MONITOR, i.e. RTW89_NET_TYPE_NO_LINK and
RTW89_SELF_ROLE_CLIENT. When rtw89_mac_add_vif() initializes the
interface, rtw89_mac_vif_init() first creates the role via H2C
ROLE_MAINTAIN and then sends JoinInfo with disassoc set (op == 1) and
this client role.

In firmware (verified on RTL8852AE firmware 0.13.36.2), the JoinInfo
H2C handler treats (self_role != RTW89_SELF_ROLE_AP && op == 1) as a
station disconnect request (HAL8852A_Role_Disconnect), which clears the
newly created role's active bit in the firmware role table and skips
initializing its CMAC control table entry (CCTL_ResetByMacid). Frames
queued on that MAC ID are then silently dropped instead of transmitted.

With self_role set to RTW89_SELF_ROLE_AP and net_type kept at
RTW89_NET_TYPE_NO_LINK, the JoinInfo H2C handler initializes the
MAC ID's CMAC control entry and connects the role without enabling
client TBTT tracking (gated on RTW89_SELF_ROLE_CLIENT) or AP beacon
transmission (gated on RTW89_NET_TYPE_AP_MODE). Set both fields
explicitly for monitor interfaces.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 3447f0e..9cf2b03 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5756,6 +5756,8 @@ void rtw89_vif_type_mapping(struct rtw89_vif_link *rtwvif_link, bool assoc)
 		rtwvif_link->self_role = RTW89_SELF_ROLE_CLIENT;
 		break;
 	case NL80211_IFTYPE_MONITOR:
+		rtwvif_link->net_type = RTW89_NET_TYPE_NO_LINK;
+		rtwvif_link->self_role = RTW89_SELF_ROLE_AP;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.56.0.windows.4

