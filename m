Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811872;
	b=dGtvW0Vnreon/X1ArAn5BNyB0NTMPfjjLYb3LYH6yzqqzOsdgDpc8dF+SyiTQRGo3u5I
	 UU8s2lak7325bUIUVRPYw45qqiXyn4+vZnLI/XzY3b8dx6ytUAD1u55Y4sUSAcVNTTdoN
	 P5cHaPnFq9qlFuNqT5xjEqsA/w5vZPIG/DZOWO/ZKwKAioHfDX6lxrulY7jpA9lKY9sS6
	 HHEJhxGlEyQtyGvktX9r29pFsZQoyW4Zi9fn2JH67wl3gzSyKI4CUDl4d+YO5I8Y/0yZS
	 p63GRgcugrNt12Oja1OmWfQF1zkYI/9NIAsdGjgX8t7seq9N044mDPm2W0aOysscpqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
	b=uebsZtatkBfKwQDgwlyxmHa2fUIUQs8GOW1N7R5aqNE/3IAI02355OHIWXDhuLOiDeNG
	 AQwQ0oofKkJgaWpl+EUXq/MFRqSqLyp2nK29hspRAOjFi+vZvPQzF3MAUphP4ME5SccfF
	 j0DXrKmX9bYaTEx7dwh2w+3GCUFhH8DT9Xdzv7vggEqt6GMQvLynyoqK30BEZT4gn1kuD
	 53HqruGffEjresiDtsG6qE26GiIXZDIDfP+h+9MOkP5c6ud20ZoXJpfqLaarmMU+QcVcc
	 HCeFbxwEEJN2AIro+IZ8kkL8Di4XPe3i2mYzV5eqcZg/qNsR3X0+EwfCNC9TQX0/j2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot3IjQ+j;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot3IjQ+j
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so519556f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811870; x=1794416670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
        b=ot3IjQ+jG2FOxRpDI5geJv/xMcVJs9tpGafAakIEQWj6jZgIhemPS9HE8xJn80Al1O
         MNm7EwScNB108UwfZ1uBUGyk0ZW76lxRHh9HNGYTlyRhqHF8Qn9TUByemFfIzm2mZhwD
         DjKhTmdZKsdpqpDdbCYCUfjnD9XhKVj6uD1Ccmt75PIHdi/GnaXzxBDoALNkuH859hcP
         l6XeymxFNsCxLHi8D/8TD4U5vf+AOj7fUkzG5t7N4FaXeciLHVuKMZtrJvl1iyqoo4hs
         CqS8Pljcq11wXHopu0VxKU4vMniQtUjbhBKWzfSFIi+Ng45gAdicbuw0muD/nkLqtf4R
         Nqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811870; x=1794416670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
        b=iC9/vpZg4lSgNNJRFGLup9VuOG3w9iD1dpoSnUS2NJ4nj0OR/2+IsA9ZefYq4eXOEq
         pyW7MRhd45TIvGa4AghgPMdDasGWbFniKJY4J6s7Z7XmX0FDPGm2fzU785zxblcs2h2Z
         v1VHm6rqSg3XJE15HO9uOju2etw9XXvvWKe77zhBpo567vENZRJZm1/MHSHeyhwHw8Fl
         GmtMlMjYF6fq2mN3yINBN+H0XkBykKDW9mrHoij2YH7y6ukLlKoyUNVUS/g18iofjdzP
         VmC+oSXU3Ec1JQ+B400wI6ANlcqo6FR5pTbv7H/9lHlLCsmvYxrlqvpoxIG/+pBzT5uw
         UWBA==
X-Forwarded-Encrypted: i=1; AKwUvBwC9guzWvV7OaA6BYDtHXJJgIqaYIhRv3fqADmylSo5E5tcnwazzrjTwOS5lWZBIbf4obOKjMNuMfWZzzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dPsUqcUBFFQi5MZW0H4JxF8aJ27Cs58wZ+vAu/SSAPBvNK3y8
	lG2dVwEHy+tOEOEa0nKBYo4FKYlsnpCDydWmX+nyFmesSbVEEyChuy7jpZOYrg==
X-Gm-Gg: AYBFou2rsY803BCMQRyRbPkazu/xGXNBbr6iYmt2939cPrsnqactFmBkUQPf1+SZ0o+
	TroGGxJvxGj+pt2JQkSTjfXK6HCnANGGz2AkhxriLkGSf1LJzNRg1JmPrRgtMuHjrb/i9+ds4O+
	df0FS2BSXXwTaNcv/BhympbU2DoUwlQLdF63P0yzBwOqs8DAjxC3oKEJUDL8BP7tdU7jXftsoMG
	Cn1mFfll03+RQ8L3DgZPhHX1e7v/hs4jSXn9oKB7td7+W3DVjZhUkcS8g9C6JuXXoZIGWXL0Wab
	TeFmxDG/4k+zAAFxU9u3y7g9IH1IXqoItc1tZfIwzEIQOwBno76begmaVzwNtUdPPt+aCeZiqPP
	L1wvv0q9mpc07AISnOmebOPUAnh9KrRPeaIuYs2KzU4Viaa7RvPCU4NlRaetwZyjLlVPNcPN7wG
	AMPTC6fT00Kff9i8ft0y9uiAbj3VXf/EJR5obvToaXhDgoYh6b3UNGFZSPg+sspRsxRib275e9Q
	jDE+kO0DFjrc5FMeU2Esmy0Hu5uHppl3FLYPrL4fna/zYfjR/2Cbw1H5qMW2VE9ypfEpxWpTdlW
	dmdNLFlJqR6PNgvawDjpAWXu5WtknglvgLAqIWzEuUHVKVdXyvMsPIaDa+cnIgjF/X+r/cWnbwT
	VUHcvnHXTbm4=
X-Received: by 2002:adf:e19c:0:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-4900ae2b9a7mr4474785f8f.30.1793811869589;
        Wed, 04 Nov 2026 09:04:29 -0800 (PST)
Received: from User-PC.localdomain (185-80-76-65.ptr185.nosmadeira.net. [185.80.76.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm4747263f8f.10.2026.11.04.09.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:04:28 -0800 (PST)
From: Jeff Campbell <inca.jeff.campbell@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: brcmfmac: enable 2.4 GHz VHT on BCM4366 before AP bring-up
Date: Wed,  4 Nov 2026 17:04:26 +0000
Message-ID: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
X-Mailer: git-send-email 2.47.3
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

On BCM4366 firmware 10.28.2 (r769115) the 2.4 GHz radio defaults to
vht_features 6: proprietary rates and 1024-QAM on, 2.4 GHz VHT off.
brcmfmac never sets this iovar. As an AP the d11 PSM watchdog then fires
repeatedly once a client passes traffic, the client disassociates and
never completes DHCP.  This renders the radio unusable as an AP.

On an ASUS RT-AC86U (BCM43666 2.4 GHz radio), with every other bring-up
setting held fixed, values 0 and 6 fail and values 1 and 7 are stable,
so bit 0 alone decides it. The ASUS firmware for this router sets 7.

Set bit 0, keeping the other bits, on the primary 2.4 GHz BSS of the
4366 family while the radio is still down. 5 GHz is left alone: it
keeps 6 and is stable.  This stabilizes 2.4GHz AP and clients now
associate, DHCP and pass traffic at normal levels.

Signed-off-by: Jeff Campbell <inca.jeff.campbell@gmail.com>
---
Tested on an ASUS RT-AC86U, firmware 10.28.2 (r769115), AP mode, 2.4 GHz
channel 1 at 20 MHz, one client. The router runs OpenWrt on 6.12, so this
is wireless-next brcmfmac at 991a73f49 built as a module with a small
local shim for the older cfg80211 API (not part of this patch), not a
wireless-next kernel. The two builds differ only by this patch:

  with patch:    vht_features 7, three speed test runs on one association,
                 no watchdog, DHCP completes, 560/155917 tx failed
  without patch: vht_features 6, 16 PSM watchdogs in the first 102 s after
                 boot, client retries DHCP and gives up

5 GHz stays at 6 in both builds. One speed test run there was clean, with
no tx failures and no watchdog.

The chip check covers the 4366
family, but only the 43666 2.4 GHz radio on this board has been tested.

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871..e971057fb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5253,6 +5253,36 @@ brcmf_parse_configure_security(struct brcmf_if *ifp,
 	return err;
 }
 
+#define BRCMF_VHT_FEATURES_2G_ENAB	BIT(0)
+
+static void brcmf_cfg80211_4366_2g_vht(struct brcmf_if *ifp,
+				       const struct cfg80211_chan_def *chandef)
+{
+	u32 chip = ifp->drvr->bus_if->chip;
+	u32 val, want;
+	s32 err;
+
+	if (chandef->chan->band != NL80211_BAND_2GHZ)
+		return;
+	if (chip != BRCM_CC_4366_CHIP_ID && chip != BRCM_CC_43664_CHIP_ID &&
+	    chip != BRCM_CC_43666_CHIP_ID)
+		return;
+	err = brcmf_fil_iovar_int_get(ifp, "vht_features", &val);
+	if (err < 0) {
+		brcmf_dbg(INFO, "vht_features get failed (%d)\n", err);
+		return;
+	}
+	if (val & BRCMF_VHT_FEATURES_2G_ENAB)
+		return;
+	want = val | BRCMF_VHT_FEATURES_2G_ENAB;
+	err = brcmf_fil_iovar_int_set(ifp, "vht_features", want);
+	if (err < 0)
+		bphy_err(ifp->drvr, "vht_features 2.4 GHz enable failed (%d)\n",
+			 err);
+	else
+		brcmf_dbg(INFO, "vht_features 0x%x -> 0x%x\n", val, want);
+}
+
 static s32
 brcmf_cfg80211_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 			struct cfg80211_ap_settings *settings)
@@ -5397,6 +5427,8 @@ brcmf_cfg80211_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 				goto exit;
 			}
 		}
+		if (!mbss)
+			brcmf_cfg80211_4366_2g_vht(ifp, &settings->chandef);
 		err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_UP, 1);
 		if (err < 0) {
 			bphy_err(drvr, "BRCMF_C_UP error (%d)\n", err);

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.47.3

