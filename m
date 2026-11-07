Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063697;
	b=yV39pq1X57G5B4ym5r/8gxe0cJCC5tkC2dVu2E2h0/ukyEykyzf5NofJ0kBSkDDwx5kj
	 mBWFTJxGdSAaoSRONqNtghjPyNw+6F2gBMgRpLMi78PBa5q4yNK0860A4Cn7s9k8tmvJ+
	 dkkVyUXY5f2thD6I0jX/vYrqlz+0qPcYSzWTAiJU6Qg9blOlPaxFKPoAqGW5k1ocTUFfp
	 LmgwrN9rWZq33OlVMbn2xGxJWB/N8aS4X0FdrKK1rq5CDekJNEDiwymE9KPcbvGhWYKkb
	 IRBZZixy4bUXmiqvR3ELEjA3bjYie9OslY15yihboblyyC/DE/hUdIWCGqtSZ+Fkmmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
	b=OqFNV7az2g4Ix3xz20g+k8ljXfavHPgT+HYZsLv1+FwJSuHyVlF6tWM+tOEJPn4ARLaK
	 uf3TsEUSMDmDmbyTyW1J5XlOD2isFAjtDrzeFyOQ9groXFLgG07Ez3AqyvixcIdMGHjNT
	 43lUDxIb0gOHq3VfIJVnziY52Eq2WmVObGBpliprwRJyzyVP+H028IUeRxlVA8drI8A1n
	 MyQW4yoU118H9ZvyHTlhIQQgUbxIgBHqmEYnuhnlG+aAyW1iPCCowjsHmSOzSTWEdx9/s
	 MDV427DtbklUoN0SNcupCRayj2fzJyuBqlHtI+BJOO3xSC9R0jVkKFPwfoh2JkxeJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnhxDt6n;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D20B606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D20B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnhxDt6n
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37000e7234bso2720894eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063696; x=1794668496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=NnhxDt6nUg3fxAndo05h5lnjvuR/6rtM5p+/SfcuOgwVxcCrC+wm5zJdVvcfL0/WZT
         B0zR7/sCZtx/JD+hHlOui2QWYb6hX7YDfXCcjpeliTRtaeTHSiKRZ9x9KQF5fdbqEpdv
         b8sL3vpsTStBLPu+Uslv7eqpq0OTDzqs8NVHuH15c74W0vYefAGEC946TSCj3DC7yE0p
         uB5j85ikVNScUBOnUeS1SyeY8Eu7VO8I1pFXb76n3Fnj4+J78X8OR3cI1J2Lv4YRizrG
         BNEle0obr2VpgpKwOW9LTOTsJ/+APx4eElvu5dwSOXdHVlhuMqvR8WWm5Xf20WzX/a9Z
         3A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063696; x=1794668496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=MZis+WN6R4Lel/M30yDG171FRBkb8sMbPpZvMXOU5vxd1LKD1bBcJgxjS1MjDicNdV
         ilbLe0DC14eNQMYTnM/NhJTqD7oQwzl1F68Jv7gdMUggTnsoNPG1SJwJ8dnn2ZeEiJ+v
         TsLZaHgsY0SGNB3UVPUcwCjA+XNmwoTkZxz3+iiFuPt2UXE3pLN/P6qpkojB9+ozkTVI
         AhXLfpcW220YhWMU1/nkTQGhH7leCGFfncH6XWAely6A9JSCuiDAg5aBSG+cUeShyu1Q
         fa2HxIiqmEKtKynXvIOeJ+w7IPWoB+2+pNhYTwslsI0WRc5vD2ArjaItU5jXz/IGdFQR
         k/1g==
X-Forwarded-Encrypted: i=1; AL+hErFuSvOreJazB66GTTchA2SHsokp22B506e39wclhwNoO+/N/CxanbrinbLrTn/yvW92XSGJwhWTx4YvYzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3g69OyqTFNNoymKoVbMI/R9T5fPcVvEUHBSDb9FbH2s352LEZ
	wC40X7CCkD+ppQWBI70f7jiC6zKphua7bSFueOnVz8flb++Owl3Bc2BD
X-Gm-Gg: AYBFou2KE4X2njKXAdcRtDcEorZL2uimjTnBuzX37Cj0dtVflveUGk1d3NXPi2yeV7z
	6rcqoP7ApebsCY8kpD1kjrupB2sH7k2h5Zx4dg+eCs4ThAORnHT05xPsyuGn3hSyr5dD/+sjQoG
	Ugk6ASE4MygtCGlaVYVLxyrouz6K0Y16UAgnzgGPpR10N9YsS2Boez8gUjBDUZWQDNbNCU8HgiM
	ycYK1hxxZGEiEA88UfDqeCZ8pkGkuG37kg/WyjpFMp7qgbbZDrFSCwog361agHOg3GFRxyLDrnE
	qAD6xnKrnY5Xhm8cPWykPQbepENyNWPaQIiH7BCIae8nZehZ/qondKl48QMRnk2jfoooCHpdIgm
	LpEMSwgTVa+mbEI0D6zpnsukvL5BNdXjJUDrQ12zvfWhq6eW36a+tPAESYs9MUvt7BjcCkLAg9L
	y3vC22P8L5ZabPge28zzWJtQW9OVENXs6nL2mRJ89A/HlEUzc6nparyv7JLqtEV52tHjr9WSavX
	ri5bbyMt2N7bkm46o3Q2rbQOWdbUpF+549F3Tlxy7RHRGYhKdMDbQKdNE7FUD501OwvkJxn1gch
	NDHeVFTmPCfdaoNJ1Wy+vAjcRwGn81vvgO5MSM3xAr7eCPpb9wE=
X-Received: by 2002:a05:7300:c7c3:b0:36c:bf78:967e with SMTP id 5a478bee46e88-36f75a2b06bmr8006122eec.10.1794063695913;
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm15540799eec.7.2026.11.07.07.01.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Jason Huang <jason.huang2@infineon.com>,
	Shelley Yang <shelley.yang@infineon.com>,
	Avraham Stern <avraham.stern@intel.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kurt.lee@cypress.com,
	Carella Chen <carella.chen@infineon.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Darren Li <hsin-hung.li@cypress.com>,
	Ryohei Hashimoto <laurel.medalist12@gmail.com>
Subject: [PATCH wireless] wifi: brcmfmac: skip beacon fixed fields when parsing SAE PWE rates
Date: Sat,  7 Nov 2026 23:01:11 +0800
Message-ID: <20261107150111.12424-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcmf_parse_configure_sae_pwe() passes settings->beacon.head directly to
brcmf_parse_tlvs() when searching for WLAN_EID_SUPP_RATES, so the 802.11
management header and fixed beacon fields are parsed as elements and
Supported Rates is missed. When BSS_MEMBERSHIP_SELECTOR_SAE_H2E is in
Supported Rates rather than Extended Supported Rates, an H2E-only AP is
configured to accept Hunting-and-Pecking as well.

Skip DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN first, as the SSID
lookup in brcmf_cfg80211_start_ap() already does.

AI assistance was used.

Fixes: f3d9c56e6eb2 ("wifi: brcmfmac: Set extsae_pwe parameter to Infineon firmware in SAP mode")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Compile-tested only; no new W=1 GCC/Clang, sparse or smatch warnings.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871260..0c91fdc406bd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5144,6 +5144,7 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	u8 ie_len, i;
 	u32 wpa_auth = 0;
 	u32 sae_pwe = 0; /* 0 = Hunting-and-Pecking only, 1 = H2E only, 2 = both */
+	u32 ie_offset = DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN;
 	s32 err = 0;
 
 	if (!brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
@@ -5167,8 +5168,8 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	 */
 
 	if (sae_pwe == 2) {
-		supp_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.head,
-						settings->beacon.head_len,
+		supp_rate_ie = brcmf_parse_tlvs(settings->beacon.head + ie_offset,
+						settings->beacon.head_len - ie_offset,
 						WLAN_EID_SUPP_RATES);
 		ext_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
 					       settings->beacon.tail_len,

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

