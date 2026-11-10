Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336260;
	b=TU5aBcFMe8uX/6bljV3JS9jlGVtMH1oPFwNzyJ8proigcutSqwII1KpsSsb9TMcBkozq
	 cgbO4RWNS4smc9CL4uD2pcRKgUabTnyXw6qPBomd9XN9439kAnxuTHjE7vb+XtG2Pi1Ul
	 /BJ4Y1ZX7IJ3irTbu/hOWOwWFn6smp+dO9o/0rPxDpTB5QpUMmxMMbgCaIJuO2NqSHYu9
	 rqNd61rIBJ1UkInSXHYTeNMJGF8UslQfLJAZgyc2YCcJcJ1qNgesSKnJHYqbc7Z3U/nMR
	 JxNQht4s7BQNIbI525wwpsGvhfz8bV1XeN5mAt7CwqYTcuGsIF3kqjRV0MJB+dpLL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
	b=F2KNRtm4IztuQkgiScqXFMEljItQsQl5EfhcF2rwpwUDXpCckD6xQ18RgD7mWBM07Uvm
	 rQFssqUYuov2cg+3F8NebFprk+TB/dIYL3WFrI/Zj0ZqQDKIcg/ai5K0P9bI3eo53QkJF
	 90VkHuYuumW2xB8JdoMqbuWzomxQOaU2OtQN8b/LTO78Oli2w+qdEqZEDgGl7ql1ZbBMR
	 +bz8fvnPFITEisvFFfb3giBYZcbAoPehOgWJKeaTs6T4/605E2uqy2CrAI8BDIARRHTME
	 Rh34xJSihISobIGhe2dECqK/x6NhRF94hROQ5l/672ToHXqOIP8x02zDcgmhIcx4Ugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZjGM/NKK";
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68560A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A68560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZjGM/NKK
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so1834479eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336258; x=1794941058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
        b=ZjGM/NKKIahyCdeAEugfhBaswvi4jQuac0fGU9sb1F/Fg2H5FLlQ5hEV1IU0zCIIUi
         8QbV6WhvFJsrCemnCgMd6siOe0bNfQP7exJ+T8zYW6OdnYjV31fORtQsFYkuDpoYgQBR
         ipAagzkoopuDdmDHjo4OBM8RHhxzD0beMQwyelV3V38dyQto/5XouRc2FPdZopS1rMMW
         Nb5wLcAVFyOFs/SFUB1so3ioDJ6558g2Bg5vfhnjYV+SM2JjykEei7nIJvV429DJGNmw
         twLD9Vb7csxdwF61YyMHPhux7ZFti3HU4sdpF+d7k//0RVlDp5MAc2gMxKhq9fTxsMhV
         JsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336258; x=1794941058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDwnKu6rYRHQfo6CNzHsjTmYdeML/TrBGtrikCBhO8=;
        b=A/fAU4SfrFnAMVKzteVXJsV0yAXev1+8/rlyh1jfmrKXSmcBcTD5FKL1wnlK6gzzgm
         iaQbI5LwapK9NKbjFjha/kV1GG68SpmbO57nIWlYcBFGmCE+SgrkGGXrv2NzQEyEBhof
         7mINPOBznWHeEm0P1ui+LLa/2Sa6iIRwb8yi3eNo4VK0UzECA9WSqUyhAGtw5sj1jbTl
         9UHmXZzo81XIUJJpPqnceo5ORUZBj/1U2jucgLOaJEDCP5GgqVo+lPIIZD8ywtfJdW1F
         UJQ1qJ7YaCqfJ6nbbjTfAtn9vw+k0RGvJY+4TDCNx96Aru6enSiv/5MG9d9VEc2E0L1c
         yglQ==
X-Forwarded-Encrypted: i=1; AL+hErGPysQPiJScAV1pQXOwSMmRuxIJuCU4edN/iq8Fjq0kuFn0elseHAJmMGm36N9hvxAMDvS+53RX56dCBmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z0PQq4fPoEDTvIkw9qqsPVYZ9pThf0/G+Xh1Pf17M+dtJD64h
	8NwrijwsHju83WHnjdCAKCf82gf6wY7PauV5BNlTnB8ufyIZuDVnbQhWXCX3bdOoHxg=
X-Gm-Gg: AYBFou3IhzIHi9dkDFFzOYWuoykCJah3wsUp/EsOnao24hZh2JnzHCP0Nom7Px4T4h/
	FBOZYQggcTxkmrouHwcjT1bY0YQ/buh0NRREd+arH20389AD7622pAr9mq/eLZjyDIUeMIQwzpZ
	GurlgIdIPaqzrlzm4IFK7fzOuGSIISu3SyMzGusVVrCIvQbN9vyKS/WfmPwE96O45dq6OUGRSZp
	DMx0Nr+MyT2W22ttUpUePSCsjFecoLCPvOlUI3ngcGIkVxXJYbbnS2Dm1K4B+gGCVhg2Ffnr9Ij
	FKF/Nl36TgRXlGTXMveqN1zeWRuYqLjpQNhxqak9D7imDMLNu/yKtwbTxZSIyXa11JWEVAZuDr+
	k+G4opga4rAqoFJEKObTs7Hh52kQeSk6QFaoWhefL3qXRGjiUHtOxsRPL3/mO7xsZKa3CgGLdBl
	mJmsmVv6uyQruvlgYm5QaWb515slg1yfpFkJLsGrJ2opRdRGJcocGfsYF+q/LeNlTvOCydg8LS+
	hsZ599CZBUHPhGikNdG+LjlUNOAzAN7nuWKZhujY1imFZ64I07VcGBMYJhYB9Td2FCCfzFbU7XZ
	uTAD6JCwqbp7dTOV65PIwSvDkiYTDXqZaQ==
X-Received: by 2002:a05:6820:c0d4:20b0:6da:9dae:a2b with SMTP id 006d021491bc7-718a576b1e8mr1386827eaf.18.1794336258196;
        Tue, 10 Nov 2026 10:44:18 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:16 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 6/6] wifi: rtlwifi: remove byte(), packet_get_type() and FILL_OCTET_STRING()
Date: Tue, 10 Nov 2026 12:44:09 -0600
Message-ID: <20261110184409.42205-7-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

byte() in wifi.h has a single user. rtl8192se takes the low byte of the
firmware header version with it, which is just a mask. Open code that
as & 0xff.

packet_get_type() and FILL_OCTET_STRING() have no users at all.
packet_get_type() also refers to EF1BYTE(), which no longer exists in
the driver, so it could not be used even if someone wanted to.

Remove the three macros.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c | 2 +-
 drivers/net/wireless/realtek/rtlwifi/wifi.h         | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
index 0719d0bb2cac..c18d5fffb0a1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
@@ -334,7 +334,7 @@ int rtl92s_download_fw(struct ieee80211_hw *hw)
 	/* 1. Retrieve FW header. */
 	firmware->pfwheader = (struct fw_hdr *) puc_mappedfile;
 	pfwheader = firmware->pfwheader;
-	firmware->firmwareversion =  byte(pfwheader->version, 0);
+	firmware->firmwareversion = pfwheader->version & 0xff;
 	firmware->pfwheader->fwpriv.hci_sel = 1;/* pcie */
 
 	rtl_dbg(rtlpriv, COMP_INIT, DBG_LOUD,
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index e289a88e9666..98b685754e8a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2806,9 +2806,6 @@ enum bt_radio_shared {
 	BT_RADIO_INDIVIDUAL = 1,
 };
 
-#define byte(x, n) ((x >> (8 * n)) & 0xff)
-
-#define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
 #define RTL_WATCH_DOG_TIME	2000
 #define rtl_dm(rtlpriv)		(&((rtlpriv)->dm))
 
@@ -2833,10 +2830,6 @@ enum bt_radio_shared {
 #define	RT_SET_PS_LEVEL(ppsc, _ps_flg)		\
 	(ppsc->cur_ps_level |= _ps_flg)
 
-#define FILL_OCTET_STRING(_os, _octet, _len)	\
-		(_os).octet = (u8 *)(_octet);		\
-		(_os).length = (_len);
-
 #define	LDPC_HT_ENABLE_RX			BIT(0)
 #define	LDPC_HT_ENABLE_TX			BIT(1)
 #define	LDPC_HT_TEST_TX_ENABLE			BIT(2)
-- 
2.43.0

