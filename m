Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794551526;
	b=q3GducJ85xGzNpMLvEThtEnDVEWvfBVYfkrTT04gvlVUWX53JiQrWZki4AspHBaP0XR8
	 9qlc7+VhdxeRP2lGWz297v2/N+78xj5hXOv5Olk46puixmZME9YGbBpIM9kNIFIp9Kl31
	 d7mxjfszZo7OQ8tdX94qwZ/7FOlFVTVtcBAQDc/ehu6jaZpnO+2+eSQF1aQCMOoZXJwp4
	 Aaw+FLMLljaGoxlDkUDtKv1oYzJ2jiMtFEGLZ6yQjL0PPtVSF/RqlXoXByYZdL18CdF9e
	 7mFHBv7c2zHfjo1VJZ81nBA6zsdq07Kk7wTuXx52SuFUEjHHbSMvcRvdUAJLExpuDBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551526;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YmWFfab+E2ZaatuW5a+x18MB647hdFjiS4Sr9Z50EvA=;
	b=T20R8bY/wT9as0+vssMK04jxQWOjDV46ZgYfjFp2nCMquyWhNj37TVMUn/u5ua6nXPvn
	 hNy6ge1nOyos8lBjDhir7GIP26jEIrU6CBAHJJRBA9Z+6L7Hj3lfGVZDR5dzmXa0l9RTR
	 Y12Pj9k7GOzzcbH1y6TKw0nLYp+ox8guVWlPaRYH2saoZFyZfKIukgTeFWCPkbuDebQUx
	 p4OUOiB75UhAF3a68YQej+aYh9KHRNxUSJhjiQvuoUZ3kXS0zOoXm/rH4qbzAlWusUrX0
	 M6nfldXhPGTo5ngLjSL6sln8+IYK0dhXmxj4FKZW6A1PhYYc+8sPzqnWqBNDCY80xhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmSKI5IH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA0606A323;
	Fri, 13 Nov 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmSKI5IH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794551525;
	b=3qpkTm6RDWUBMtonSz3wFXHNF5YPYhm4Gjz8O6QbjrSDuIp/AwTy1ShNJ7Jc/TFkD5oQ
	 6IfwVXlgraIEIsFzF+mHRSLQPgPpk8SQwX8Nitxu6CSjsYb8TvMhcDu8p3H4ACY7wQwCF
	 m3q67hKyz58DnAVqL0oy/kzxg8dSu8Xo+/UNC3FlPprwknakB7FzYEmUvFi44Wr93mSvG
	 DyVjdi7g9RZ2AU2idTyk5x5/V4mR2Fl5sKjT56Xn9TcCL7Qt257bwR9rg5c/XfKuht5LH
	 Prwx2YI4FOtblPGnQj0bFmHmsGDOUGhDwAZgkJ1CYftukazL6ikETOxux859pnTwfSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794551525;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YmWFfab+E2ZaatuW5a+x18MB647hdFjiS4Sr9Z50EvA=;
	b=kQ+Rpw9t+BiPanHfUeB6YCbrO4ZRE6+9WldWG1/Pu2Ra3nK5Xh4T+TqJplodpAWEP/3W
	 rlp4iXps7FH3cU022w9t/sNGiCFlmz55br+YCqXmUsSPi9p2uVg+o4iMLQIt7Rszn4YUu
	 aMz/WWOMswgeg/+aurHOQCJbGQuKQTWbRpyVLVpdGD72faRsApCn3kgtwCZlWrAnejeb6
	 WkH4uhu8atNlsXVrEqoNCoxUbhhn6Ft297SSa5tJ/1QBImuqafEg0eggHo6MtaitmGI22
	 /CBycs/XtIi26K9+TZvrpQTER9+ZkGcOKZ/xj5c1WbOh7htE+OQSSIGi8L6O0xjJl/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 134871F000C6;
	Fri, 13 Nov 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794551525;
	bh=YmWFfab+E2ZaatuW5a+x18MB647hdFjiS4Sr9Z50EvA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FmSKI5IHR3BKfOo4RG3denXlTh6lraS4v2dsEjan0JLaqw4NRXQQmxkDKZpgk3j89
	 gUpVW+R8uENx3ddYVXUsO4rTrZXXM6YwGjMWZqrXa0eAMKPiM0w7BjEQmCAubclyVR
	 Wih0/dJaOYWylNmALwZkXo7KJAcl8YGPoRUsDf7QNjFFnr3Lqdkt+LtMB9xUV1bY0Z
	 X+rKh9W90lhX2tdw6tbUwQG/VXFdW71M0ZIc3TFIB15pUa8wtpB3onuKXxkQj0MED7
	 tKp+N5Bl92xK+xqL7d8iw0TJQ12gPiw9WY4lkXl5a1gfnhqZNIuKlyjkCcxQhWXqEz
	 A1fzDvRTqneKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7BF6047622;
	Fri, 13 Nov 2026 06:32:04 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 06:31:55 +0000
Subject: [PATCH wireless-next 1/4] wifi: brcmfmac: Add support for 6 GHz
 chanspecs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-6ghz-v1-1-0b9a67e413a9@gmail.com>
References: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
In-Reply-To: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: asahi@lists.linux.dev, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>, 
 Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794551523; l=5582;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=I8Dn0B0/ZXLgxEeo25bE3yyy9LMgsSW2UPLw3KLxDLs=;
 b=LZss0WT+9OEW4S9grQeQ8nmkxYR13aw4wu/oUAidV5zoJ7w/4lzEYIrqNm8wLW340YT4q5zqx
 Pj2ESOlsrqaBvdtfIky5MS8yLiKIep/fVL9sEGa/I3qWwtD4KQYI9a2
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Daniel Berlin <dberlin@dberlin.org>

Although the AC chanspec format defines a band value for 6 GHz, the
driver currently neither encodes nor decodes it.

Extend the chanspec encoder and decoder to support the 6 GHz band,
replacing the obsolete and unused 3 GHz definition. Populate the band
when converting cfg80211 channels to chanspecs.

Additionally, initialise channel structures prior to encoding in the P2P
path, as the encoder now requires a valid band field.

Tested-by: Yureka Lilian <yureka@cyberchaos.dev>
Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 28 +++++++++++++---------
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |  6 ++---
 .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |  7 +++++-
 .../broadcom/brcm80211/include/brcmu_d11.h         |  3 ++-
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b0eaf96413b7..c4ef4f6d3a06 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -326,6 +326,21 @@ static u8 nl80211_band_to_fwil(enum nl80211_band band)
 	return 0;
 }
 
+static u8 nl80211_band_to_chanspec_band(enum nl80211_band band)
+{
+	switch (band) {
+	case NL80211_BAND_2GHZ:
+		return BRCMU_CHAN_BAND_2G;
+	case NL80211_BAND_5GHZ:
+		return BRCMU_CHAN_BAND_5G;
+	case NL80211_BAND_6GHZ:
+		return BRCMU_CHAN_BAND_6G;
+	default:
+		WARN_ON_ONCE(1);
+		return BRCMU_CHAN_BAND_2G;
+	}
+}
+
 static u16 chandef_to_chanspec(struct brcmu_d11inf *d11inf,
 			       struct cfg80211_chan_def *ch)
 {
@@ -385,17 +400,7 @@ static u16 chandef_to_chanspec(struct brcmu_d11inf *d11inf,
 	default:
 		WARN_ON_ONCE(1);
 	}
-	switch (ch->chan->band) {
-	case NL80211_BAND_2GHZ:
-		ch_inf.band = BRCMU_CHAN_BAND_2G;
-		break;
-	case NL80211_BAND_5GHZ:
-		ch_inf.band = BRCMU_CHAN_BAND_5G;
-		break;
-	case NL80211_BAND_60GHZ:
-	default:
-		WARN_ON_ONCE(1);
-	}
+	ch_inf.band = nl80211_band_to_chanspec_band(ch->chan->band);
 	d11inf->encchspec(&ch_inf);
 
 	brcmf_dbg(TRACE, "chanspec: 0x%x\n", ch_inf.chspec);
@@ -409,6 +414,7 @@ u16 channel_to_chanspec(struct brcmu_d11inf *d11inf,
 
 	ch_inf.chnum = ieee80211_frequency_to_channel(ch->center_freq);
 	ch_inf.bw = BRCMU_CHAN_BW_20;
+	ch_inf.band = nl80211_band_to_chanspec_band(ch->band);
 	d11inf->encchspec(&ch_inf);
 
 	return ch_inf.chspec;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 813cc15d8b87..06e0d90b194a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -958,7 +958,7 @@ brcmf_p2p_discover_listen(struct brcmf_p2p_info *p2p, u16 channel, u32 duration)
 {
 	struct brcmf_pub *drvr = p2p->cfg->pub;
 	struct brcmf_cfg80211_vif *vif;
-	struct brcmu_chan ch;
+	struct brcmu_chan ch = {};
 	s32 err = 0;
 
 	vif = p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
@@ -1092,7 +1092,7 @@ static s32 brcmf_p2p_act_frm_search(struct brcmf_p2p_info *p2p, u16 channel)
 	u32 channel_cnt;
 	u16 *default_chan_list;
 	u32 i;
-	struct brcmu_chan ch;
+	struct brcmu_chan ch = {};
 
 	brcmf_dbg(TRACE, "Enter\n");
 
@@ -2031,7 +2031,7 @@ static void brcmf_p2p_get_current_chanspec(struct brcmf_p2p_info *p2p,
 {
 	struct brcmf_if *ifp;
 	u8 mac_addr[ETH_ALEN];
-	struct brcmu_chan ch;
+	struct brcmu_chan ch = {};
 	struct brcmf_bss_info_le *bi;
 	u8 *buf;
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/d11.c b/drivers/net/wireless/broadcom/brcm80211/brcmutil/d11.c
index 1e2b1e487eb7..6cd43920fe67 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmutil/d11.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/d11.c
@@ -87,7 +87,9 @@ static void brcmu_d11ac_encchspec(struct brcmu_chan *ch)
 			0, d11ac_bw(ch->bw));
 
 	ch->chspec &= ~BRCMU_CHSPEC_D11AC_BND_MASK;
-	if (ch->chnum <= CH_MAX_2G_CHANNEL)
+	if (ch->band == BRCMU_CHAN_BAND_6G)
+		ch->chspec |= BRCMU_CHSPEC_D11AC_BND_6G;
+	else if (ch->chnum <= CH_MAX_2G_CHANNEL)
 		ch->chspec |= BRCMU_CHSPEC_D11AC_BND_2G;
 	else
 		ch->chspec |= BRCMU_CHSPEC_D11AC_BND_5G;
@@ -222,6 +224,9 @@ static void brcmu_d11ac_decchspec(struct brcmu_chan *ch)
 	}
 
 	switch (ch->chspec & BRCMU_CHSPEC_D11AC_BND_MASK) {
+	case BRCMU_CHSPEC_D11AC_BND_6G:
+		ch->band = BRCMU_CHAN_BAND_6G;
+		break;
 	case BRCMU_CHSPEC_D11AC_BND_5G:
 		ch->band = BRCMU_CHAN_BAND_5G;
 		break;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcmu_d11.h b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_d11.h
index f6344023855c..aae75329e266 100644
--- a/drivers/net/wireless/broadcom/brcm80211/include/brcmu_d11.h
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_d11.h
@@ -81,12 +81,13 @@
 #define BRCMU_CHSPEC_D11AC_BND_MASK	0xc000
 #define BRCMU_CHSPEC_D11AC_BND_SHIFT	14
 #define  BRCMU_CHSPEC_D11AC_BND_2G	0x0000
-#define  BRCMU_CHSPEC_D11AC_BND_3G	0x4000
+#define  BRCMU_CHSPEC_D11AC_BND_6G	0x4000
 #define  BRCMU_CHSPEC_D11AC_BND_4G	0x8000
 #define  BRCMU_CHSPEC_D11AC_BND_5G	0xc000
 
 #define BRCMU_CHAN_BAND_2G		0
 #define BRCMU_CHAN_BAND_5G		1
+#define BRCMU_CHAN_BAND_6G		2
 
 enum brcmu_chan_bw {
 	BRCMU_CHAN_BW_20,

-- 
2.56.0


