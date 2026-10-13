Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68125038F2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915441; cv=none; b=nR2b1UdpGWnDrltLbViyP0AWu4xRgV4R/a4yoBfJDoO3fCzWaJFKueld1q3IFEFuJdMHEAikLrYBXZY290EIhOXPM24XL7PfHryEHMiUEhtQe/MEy7A3aUB6lagkUyURgvMIyB6BN21aOIH5kR1vc6pb2gCwANxFID0N22KvRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915441; c=relaxed/simple;
	bh=QeTe9wNxPeN3Rj7daLJF/CCwjLiwp9m2Ayax8aPoSwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=PZd09goglmAwlGrzFI5mmOlLWDCRvwuInNB698pri51A2+y3f8itUPNWFEP03sDvqFbbVAwzWaaQhwPBY86Z/qLQNUS/QFlansNgQHDwQi5b77F49Js9UPfm35afJO4a0wpxML2UOPVtXlaPRAaetwFp6K2EWlqOAYChsWfhbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=i+ug+fhy; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="i+ug+fhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791915434; bh=XkqVp/ZZD2cQ4FRCT1GAA+WTLUt+WLAXDCG6fBGiyQY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=i+ug+fhylOAOBDvbedWkStfP8+BMeSmYvBLlkRwkz+jvd2P5RQLW4POCqxPxbirzXh2Enw+kOXUc8ES4JHys1npLNoDjpyA3+lt+fYFC2pgZq4JB3Ue6amnaJVjNu+IBPbpbGzyORKh65j/flKfr4CUJAvcEW/hHF3IL1oiSLUcDQWHexSwASn9kjw4VeRKquLCEIk4z5vp8vrj8jqevMrXrBUO8lFOCfl5wzHv++1BLldCq2v6Feg8PxdN47n1rqPjR/85Z3cb1nptcJ8mcfvpCBnEVjjlLjdY481iOM6vuFmrzno9rRQRdZlkHOUQDbxdbpiJekGBKR1r0fp8tQw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791915434; bh=COcrcW60cffFhX17NSdaDJUoYH0oSDGGZW1qIdOGREu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ZWKyRPNfnewy09Wba8GwMoAfID2od8CeE5bgocDD5fg3JdrPCMJ/HpT9WA2luZsOA80mSf/7V5SLNv80p7RcOrJmPFDgblyPp7hwk3aXxMV3Tp8JK5OsPOo+TgR82ud2HzNQQQhfoN0ooD1I3BrkPdEVEwgp9pAIhtwQhXuqxSr03NZm7sfeMFAP0LOipjk2Z1c1vJFZBOAGbBjQesyVqH9YzObY7WP3e7bFcjOsQ+KpgLsNnbVVHtbM8a6fQoMEcW1kyAggJ9LD1fnERfjaDWpgMVGgnoCtucmqrSPnxXeM3PJLljsNHYekkOq2Eg7xHUrWKAd1ntCxdEGYxpXJ+A==
X-YMail-OSG: kH10CUUVM1nyRnexVpeMI5mzOp.RNhv3YZbBLOGu37BDFr_RoxuaETgJgHqrgBS
 WroyMyqmP8XII1Qw.jommPyOTaXDyRZKoidamRjJKGXnNjSnnJNEOTFYXagQKwD7yQWVIPebNRGN
 3YMH0Ej_S9N3_pl.2IrhBIVbxlEf4m1hkv6uhnosn6D8BYMgPJuB3qFuoPmpv1hTtl0005fMAes1
 qU34_Pc6AHNnwODFCI87ARoh8IJtwT.jsHP.ebZtYQ8QckQmj7LOmp7JHZUikjfyDaVegPCeMnvb
 Tt8NYVveYxvSQENgCBzYC6ZEx9jACLR9P6vcMM6Uoq0f69yF5fIDD8tG9wU_4I1W9GcfbLE_vVWr
 aK0uY47Epp3UtP33VrHGsxXyIxj73d7Qm_Y77u.DD3jg_HLa87nwDdpyoqEjEUGlrtVx4HBLEgbR
 vztaSL_X_krLTuHpH4IFf8RTO6U66iEhuUd73Xe1LtDJm.GR2S1oNMajwzdIoFv29vOQWmvAKTg3
 Y8.jTT5Ykt9YlIk9.sR4J_oHuDUQ_tfIFdFeILVUaSfpQ5vUJr5LeNklsoCPoAR1UL8I3q7jyHN0
 Yiv2rhfd7urHGUyIIaadVkJAy8dlp0Lpq5oMLpsg2fTkT0FVOJyISXRhj6k3AkvUu_mmTGildS5K
 RTd62BQ6BlcGRKZ6hJRxNOMHD_JEALTyF91Mino0fVY7gv7sm.asJJEL76Ia2Q.aQIPmvuluT4.c
 KUOy5Ci2ofkCpbr7PkZDvPGrFSxLgSv4hpsw5ufIIgEtlHiglE8jOP0MoNWGvW_RUswDA8EVIiW8
 3yFsL4jcYjn5uY94hUPtR3urXWhfIbxGb51r3N91m4sSWCZmHrfb5g1kJXPZxAlnzzJqDLV6Ex0I
 jAkISCHQFpy5XVpqPCK8KMoCH6oum3OFHJHuz6sT1L6QeELTWt7HU00QS_EQCRP_JoxsHFEWojub
 64zVjXBJp4pXu1FXAS6g1QbDbQQX1MZXP579_Be0.OKytO0KNeTW5mjLh8A5oO4g9sE2emWF50Bi
 tQPMhzWi8CZ7tL_hnyuvFSrO7cSJuCD7ZyxbPQ1NH8DFDPnarUgcEtBXUe1Zh_xjm1Na2E8gjyJ2
 O0Y0WJa046xLnIddxBez9clGKG6KyKb_jBfig8UR9Zs12uAMFOtoqMGF2uAUvWcNMTot1z46wBRJ
 o1M2LmI7Zn_wMlfWBoOmowMT23FoCGDKnQrupXfXlCnup6bL0O420wxEM5JXjacN0JTw6V0gw8ws
 .HLyAqyJUztMD4kQaDyMA.7yYAqqd2t91KlTxA9eCiD_XoAWPEHhyPYFJY9Y9Bdj3ewn8vasvT8c
 _ceWHJHU3dHgLS8wov1LgipNhMbcLuj0SoRPvSW6dFMlbRYhzRRZEnTokN24BTs7AI9JsNjAtICG
 Qkoi1ScmHrREPPOTujzd2tdNZbj7A0G2bB1pKISUg7.nktL.DvizooR1lmoUTjLUYYImtUWQ5s54
 zjjU.DR3psnrj9oyzZ4.98lFpKl7fkMl2BBilDkSTP5BI7LsTz6_R99h_TLTLX3A_netvudgd65O
 9Ms1Es_s3ZDT4h9M7C6DOXuhIkBaGXAPbIYy_15lDCzVHXBuxFS3XA9A8zya.ebAqNz1QogOA6bG
 giAQxMlQSdPxlWkTWqMfsH3Y9eH2izkBZsVpbXJGkm45PKJXORI5AQyfReKqshrsWzIzvV.ekN2w
 TLAtWvP6LnrGEE6EID.qD6W1.MqRXAJe2_t1aaL_cq7J08TwvJ8nUZoXZzsZzsI_SeNGazeVQxYX
 6ORjJTkSOCds4KdMUcpNW72IbZ0Wc04pq44.O98fZ9bkM.elrY.NxKEgScKYdG5nL2AkdgfgCnCL
 XryR9rp0_bEd_QxZzucqOv7132fEaNc6tmycsw7xmc1m9WRd40sbJRkUoNM.nDPh34ouMH_Ucrqa
 EiYFSR5oBHTo8qiL0ykHDL_wbH4fl8LHH1NCNGfAo.Gy6H0IikNsmGu1LqagUVXy_b3tPX_KT2Zi
 rGrCq5IN5TWxnza_Zczd9Jnc95HgHxTuPk10eIe6_M.DG4hhaltUiNz2vk3eiheUtFTsHEjb2yNe
 .wPAusFKHLwNH3R9ZjzsqEtPSDoM2cd2fAaBSDB_XVarTfZ01e4.A00sChOEeVr5lEey6S.CVciw
 na1U5YYeplw8gfj3fSirXnQVozfPIegnARYZMrnstO8MwPr4O8nldWHg46Rovl_10WqT2cq9HE.d
 0WdA3wkckJCqlzK9f75zsXYNVH0H1GbmTR474mCdBnYiN1N4-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 5a9a272e-e8f0-4b39-8b01-0db91ec868b0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 13 Oct 2026 18:17:14 +0000
Received: by hermes--production-bf1-6d6877594b-cqkzp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8b744a7949a9725905e84cdc7265fd98;
          Tue, 13 Oct 2026 18:17:13 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove unused function 'to_fw_mgmt_connection'
Date: Tue, 13 Oct 2026 18:17:06 +0000
Message-ID: <20261013181707.29830-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261013181707.29830-1-deaner92.ref@yahoo.com>

Remove unused function from greybus driver to_fw_mgmt_connection.

This function is not exported or called from anywhere tree-wide.

Confirmed with git grep and cscope.

Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
 drivers/staging/greybus/fw-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 78321be80013..46b35ef55090 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -21,13 +21,6 @@ struct gb_fw_core {
 
 static struct spilib_ops *spilib_ops;
 
-struct gb_connection *to_fw_mgmt_connection(struct device *dev)
-{
-	struct gb_fw_core *fw_core = dev_get_drvdata(dev);
-
-	return fw_core->mgmt_connection;
-}
-
 static int gb_fw_spi_connection_init(struct gb_connection *connection)
 {
 	int ret;
-- 
2.43.0

