Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181729;
	b=ZnRr9C0LmI0tpvkNPs4Pe2JEFD4581MEf1D9hRkHvWrinK446OaA2mer9OGYrMsfGE0r
	 BlELEvrIHtrmTZJMzDudVQxTXNBVmlhSkJxm5ZTVYibbvtyJfIoFTOTaZT6axt+geOoXi
	 3ZY+RYyXxdhDTiVlSlO7xddGv8D1MtQ43HZBuk9l4Ok+f77MWU/atIzpBLfqG11eVAZw1
	 u13TzVUY9aVUeS20r09pKGVSqquEQY+NrSYPS/hXVied0A4yryzK4Y9U8/iDgz2S8kMDo
	 nt5oBCSIJ7hhHlrXU5O+biXTCcPphZBOayE9KIEc6fxy8iq8G186e35Llk2vcH21XRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181729;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FxsAl7oUpN9mIxTmLwAjYjg626bJ1YxstdL4c3GhFDE=;
	b=MQ1H3e31lun3FkkFHVseWMrHss3b1GuJqjELXDQtMhcOO3KT5am95VlAABf89YaKrKSz
	 Bk2e8Fbp6MHfl58ypAIytYU47YsRIdBsfIim5vb3B4qTIAmqhW+8G0NxzUYc9/X+63ICD
	 sOHpBDKGigFpgmqQeUwk0IC7BfQiLBszzOR3KObQgggxMyDBU+82M+D98DcfT2OBibi+z
	 UnhOEsN0ADQYo18BIoyV0WvTct+6uc/71lEKAbAzhoYf+0YPHG5rgrbBMr3p7aTqir6Ft
	 NUmaJ6B4cYyDnPoVRJ1M5t2ye3BVP0loTOe/zXqIxg6xaFz2a1f1LMhY0aNd6aHtueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WJZcts8J;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631A606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9631A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WJZcts8J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794181725; x=1794440925;
	bh=FxsAl7oUpN9mIxTmLwAjYjg626bJ1YxstdL4c3GhFDE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WJZcts8Jm8/ZcRqZ50nuZkgwEBATp3ThPa8EnX5UWQhGtUhNd9u9doptKFcBFeBwI
	 9ZENP7MWyqzUISrEE9gLLCPECm8+lPnimmzTPO1t+BlEo01uH1CR0QzMlcp4AjFvoJ
	 oeuw/8yFFLh+h0ooYum/2/ehb+SGNCfPT9dTcepYE3OukB17fEeyrssWCWkNkYLlES
	 S5i2xbxlwGjYC93Q6OQLe3CWJmRHteCqS4RvOfsourZvGMrR4OcGS3+iCrLundeNvZ
	 I5IlVm7KEjC/2MyoN1Qjwc4qXGTygvHwG5nq9PF5t3v81d3bXOweRlVNENVZYxyY0A
	 d95MDzMXwEJ8Q==
Date: Sun, 08 Nov 2026 23:48:40 +0000
To: "johannes@sipsolutions.net" <johannes@sipsolutions.net>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] wifi: nl80211: validate NAN band config attributes
Message-ID: <PW-zvNbgilyuL29zHSYyuFfnaC9f9CzpLyO8bwRTIi-pLSvN7Z8tz3qnzuLFPtQSBfHV3rFbUhNR6xJ94oznhlEgD4GYkscISrImNQdwsxs=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: cfa57541218ad76ead6d92f4f617b019aae63d99
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

nl80211_parse_nan_conf() parses NL80211_NAN_CONFIG and each nested
band config with a NULL nla policy, and the per-band index is taken
from a raw u8 attribute without any bounds check:

    band =3D nla_get_u8(tb[NL80211_NAN_BAND_CONF_BAND]);
    if (conf->bands && !(conf->bands & BIT(band)))
        return -EINVAL;

    cfg =3D &conf->band_cfgs[band];

band_cfgs[] has NUM_NL80211_BANDS (6) entries of 16 bytes, and conf is
a struct cfg80211_nan_conf on the stack of nl80211_start_nan() /
nl80211_nan_change_config(). Both guards are bypassable: BIT(band)
with band >=3D 64 is compiled as a shift of band mod 64, so band values
such as 64, 128 or 192 alias to bit 0 (2.4 GHz) and pass the
nan_supported_bands test; the conf->bands test is skipped entirely
when NL80211_ATTR_BANDS is not supplied. The band-config writes
(rssi_close, rssi_middle, awake_dw_interval, disable_scan) then land
roughly 1 KB to 3.1 KB past the 128-byte stack object - three
attacker-controlled bytes plus a zero byte per attribute, at
16-byte-strided offsets chosen by the band value.

The path is reachable by an unprivileged user when user namespaces
are enabled: START_NAN needs CAP_NET_ADMIN over a netns, and
mac80211_hwsim (which registers .start_nan and nan_supported_bands)
lets any user create a NAN-capable radio in their own netns via
HWSIM_CMD_NEW_RADIO (GENL_UNS_ADMIN_PERM, netnsok family). Real
hardware paths (mt7925, iwlwifi MLD) are covered by the same code.

The patch adds the missing bounds check and also requires an
ETH_ALEN-sized CLUSTER_ID attribute, whose ether_addr_copy() currently
reads 6 bytes from a policy-less attribute of arbitrary length. A full
fix would additionally give both nested policies real NLA_POLICY
entries.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), net/wireless/nl80211.c:17043-17087 (nl80211_=
parse_nan_band_config), :17165-17194 (band_configs loop), :17133-17135 and =
:17173-17176 (NULL nla policies), :17183-17187 (band =3D nla_get_u8; cfg =
=3D &conf->band_cfgs[band]), :17140-17142 (cluster_id copy), :17259 and :17=
634 (stack frames holding struct cfg80211_nan_conf), include/net/cfg80211.h=
:4176-4182 and :4210-4224 (band_cfgs[NUM_NL80211_BANDS=3D6], 16-byte elemen=
ts)
Introduced with the NAN band-configuration UAPI (before the reviewed window=
; present in the whole 7.3/7.4 series).

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204ae..4dea7afcdc 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17138,6 +17138,8 @@ static int nl80211_parse_nan_conf(struct wiphy *wip=
hy,
=20
 =09changed |=3D CFG80211_NAN_CONF_CHANGED_CONFIG;
 =09if (attrs[NL80211_NAN_CONF_CLUSTER_ID] && start) {
+=09if (nla_len(attrs[NL80211_NAN_CONF_CLUSTER_ID]) !=3D ETH_ALEN)
+=09=09return -EINVAL;
 =09=09ether_addr_copy(conf->cluster_id,
 =09=09=09=09nla_data(attrs[NL80211_NAN_CONF_CLUSTER_ID]));
 =09} else if (start) {
@@ -17184,6 +17186,8 @@ static int nl80211_parse_nan_conf(struct wiphy *wip=
hy,
 =09=09=09if (conf->bands && !(conf->bands & BIT(band)))
 =09=09=09=09return -EINVAL;
=20
+=09=09=09if (band >=3D NUM_NL80211_BANDS)
+=09=09=09=09return -EINVAL;
 =09=09=09cfg =3D &conf->band_cfgs[band];
=20
 =09=09=09err =3D nl80211_parse_nan_band_config(wiphy, tb, cfg,

