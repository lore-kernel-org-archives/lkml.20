Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182115;
	b=Qdg2ItoyPD9tG3hjfS2QFiTTZOgR76/tfgQeS9Y1G8WFWqjQ9nNL6VcOqQILBmaxwYvE
	 ZRksuPuo3+IC4IO0f3HoQILOCehbpHcJ5tXklYvGYOe4D2Ycd/r5a+AsIIrnI9CoNL8jR
	 23fk2ZXqCLbgz2bYNlIGz0NwE+eaEq8FK2lpBosWTSdgkXd/Pt7FpwuzOoStMJngwFGrS
	 MQXAaModZMEJvRC0Ed8BCrtz/jBal+WaU4iEyLPE27bZwZ/sjT22cxEODmX2HiqpFGFMF
	 zJDNACcQLcp3gf9sPpgLXJoS3Q0QRvT8xQeDw7+NPlZJ0HSz7qe7ZVrQW3ClZaUiezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182115;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LlwLIJIo3WRDHPhp+jT9Zside115erkeBhAFWROWUrE=;
	b=l0xp7jAlNogvil0Hn2hc3Ep1SnmdikJxUe2WBafakPGx2H1RlIHlMJGcxurwDTi8HfUp
	 cux7gEd3MdDKbMmvnoT/vtNtJwR41cdY6MBr+t5o+UF6HFABLPHYTP5o56g+grmJF5tH+
	 1pHAYccXsPxy4oP8jWP+6bYnxthQp1nQZD9rJMLFLvtuRGkHm1c3dVFGOZ4BOrIvUxLDB
	 VMt3KNROz7Ha5I3M5dKLGK22fzplQrPiA8UzcgdCr5mIwDS7uMJnkGSbTbfH4mZs8KX3a
	 AAjS6esww7/COx6Ii2id9gTtYwb5jwUQSQ+hXQxwu8LgQraQsp22QnA5JPvCnT1jRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="q3NEh/Qc";
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18701606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18701606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=q3NEh/Qc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182112; x=1794441312;
	bh=LlwLIJIo3WRDHPhp+jT9Zside115erkeBhAFWROWUrE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=q3NEh/QcxZlDhTEvQcRxaXA3WJmWicwSv/++zuJBAsl4oDWbzjEbk6P7QwRnjN4bv
	 z2WR0KXhZBilchswNT7GZnp3+NSOzEIg+0L6EfMu0/onXQxf009xIvFhLVwDhyrtHd
	 mQ1xRYa5PuBfto81ygIt2xZFpeXcaVkdZoLlBMqOTemXal0U9HvjXp/Z3bVM/yehRT
	 JIrBdB5/RDKdrsj1ngEtMmcA0tE7y9xF3aHAplsmEzSkqY5tjr6fYTXO2eIYffj0tK
	 7pFPsl4ocklrhJQm+gS3eTNBQ8gIRuQnyWdUxx5BpBNmdwzMr4lo7o5RSu63/+z1Zf
	 c5MtDyyvGhzMw==
Date: Sun, 08 Nov 2026 23:55:06 +0000
To: "anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>, "przemyslaw.kitszel@intel.com" <przemyslaw.kitszel@intel.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ice: clamp package info count to the response buffer
Message-ID: <sjs92jrAG9X58za0SnZA1OOA4Db3R79dv436O7U-AytolZQYhuWSppqWG-OobUCTshYLEhYP6LgQAlvVSGMJhdUj9DSi6of3Q6huctkjXQg=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: ed649a71fc7a2a23f607e4270626c917b61a0ae9
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

ice_get_pkg_info() and the DDP-load compatibility check iterate
over the count field of the admin-queue GET_PKG_INFO response, but
the response buffer is a flexible array sized ICE_PKG_CNT (4):

    DEFINE_RAW_FLEX(struct ice_aqc_get_pkg_info_resp, pkg_info, pkg_info,
                    ICE_PKG_CNT);
    ...
    for (i =3D 0; i < le32_to_cpu(pkg_info->count); i++) {

A device (or compromised firmware) that reports more than four
entries makes both loops read past the stack buffer, and the
'active package' name/version handling then copies out-of-bounds
stack data into hw->active_pkg_name. The patch clamps both loops to
the buffer size.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/net/ethernet/intel/ice/ice_ddp.c:199=
3-2015 (ice_get_pkg_info: DEFINE_RAW_FLEX(..., ICE_PKG_CNT =3D 4) then for =
(i =3D 0; i < le32_to_cpu(pkg_info->count); i++)), :2067-2077 (same pattern=
 with pkg->count)
Longstanding; converted to DEFINE_RAW_FLEX at some point without adding the=
 clamp.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/net/ethernet/intel/ice/ice_ddp.c b/drivers/net/etherne=
t/intel/ice/ice_ddp.c
index 3b2d9c4369..bb037ee96b 100644
--- a/drivers/net/ethernet/intel/ice/ice_ddp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ddp.c
@@ -1998,7 +1998,7 @@ static enum ice_ddp_state ice_get_pkg_info(struct ice=
_hw *hw)
 =09if (ice_aq_get_pkg_info_list(hw, pkg_info, size, NULL))
 =09=09return ICE_DDP_PKG_ERR;
=20
-=09for (i =3D 0; i < le32_to_cpu(pkg_info->count); i++) {
+=09for (i =3D 0; i < le32_to_cpu(pkg_info->count) && i < ICE_PKG_CNT; i++)=
 {
 #define ICE_PKG_FLAG_COUNT 4
 =09=09char flags[ICE_PKG_FLAG_COUNT + 1] =3D { 0 };
 =09=09u8 place =3D 0;
@@ -2067,7 +2067,7 @@ static enum ice_ddp_state ice_chk_pkg_compat(struct i=
ce_hw *hw,
 =09if (ice_aq_get_pkg_info_list(hw, pkg, size, NULL))
 =09=09return ICE_DDP_PKG_LOAD_ERROR;
=20
-=09for (i =3D 0; i < le32_to_cpu(pkg->count); i++) {
+=09for (i =3D 0; i < le32_to_cpu(pkg->count) && i < ICE_PKG_CNT; i++) {
 =09=09/* loop till we find the NVM package */
 =09=09if (!pkg->pkg_info[i].is_in_nvm)
 =09=09=09continue;

