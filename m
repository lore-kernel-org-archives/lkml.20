Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389187;
	b=pd1cCNxp5KDBUztwxCSGBoQITx8Z1GEwHp09beeJcCiuWG5qocbBaU7Iv2qjgl8IRJtC
	 yw1Ij8DYFlnprc9awP00QS3izsWFYQFydzru5Mw9rFtAJYcOOWOqyMFZrS/9ZhQU4NHTe
	 xIFlFoIbvwOPPaScdd9lRcw+W+mdneeByM6W3kgSVwJaryLcykWt02nnTyPsC8QMmutBt
	 LuPysNBMdF91oAM4IgmFGQ3mPpmJQi2NNE0AzexhIyxP5f8HZThhkedaV5uwoQ1u5KWf8
	 yPLBI6DapwBYzm5bRzXx4OHnNtXxYY6lMOqBeERVpPI1HewkP4UK/806aKot3jwspyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389187;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 References;
	bh=iuQyjg5p8wKLj1Lk1uwpRI0wGlleDkW+uz7LiYE4HwI=;
	b=3ZPKIsfsCxZVDrMNpQaS8Du5IHfpKwfCGsyvHJFlfyja5/KzJ/e+ExbPX/ACKZnv1seT
	 lv3ptelEi3mGV3Jjtk1bdR3LvAVxqSCctBJa23ud0+Odnqd6f9hDEAuPAbtf5Dza5StqW
	 uuPmEykuPpMO5BX6hocK1sghHl1Mp3LjSyEZwQoL5aqGz+GIK9WP1Z7G9WN3WBHh2Ptqf
	 G8OqeiafOSbcmFSgJFgUAZmcCU+uVorTbLVaD/3Vp2D5H0rWzMaqxdF2GaRDOnfC7damC
	 KRBAEhO/kUw6DN4oE+9Pd2z5KEsxLJv5xMJ88NzrrioNlsKcjpCAbdee9/WL3lxbJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=Ep2tMl8Y;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F24606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F24606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=Ep2tMl8Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794389184; bh=iuQyjg5p8wKLj1Lk1uwpRI0wGlleDkW+uz7LiYE4HwI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Ep2tMl8Y/Jc5+0fnWmTR8UlPkoyh5X0oI41mTRrIkp/7bcLP+ZodjnX72PtQ194evi/RUiW7IBco2tbgn5FqxVU7aH1rKT0Yp8a+9Amce64FbAHGQ+A9CFwXFQobJ7wARGaGFR+IStEmkEiMloF22dkQGXISeJtobSHIQ7wHw9H55CxvQGPAYdpQPMwVkHCgiGLbJBKeukRgYg5w892ZU1vncH+nLBmrz4KbL1S5699SqfybbO8r38ol7ZXDOka8tWSoIvThMDFgrdqznz5XkuM6MqhqmgzM31z2W5vo7P4CHYFtwWSGyhknPYRmnkHukqRUExqTLPiXMMFr9mj5jQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794389184; bh=DTjHI0kF8dHoCMzIQ7SmwJLAdDrhrdoYXdCfKLVG3Je=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Uab2M/iDLhq5vbGfVb37DtsQ45HUFV1TWxuogLbHMkgjZkMdcYV2yJXj8x4hYeVAcrZBgBQjisZUh7OvAoth2HmVjUhPizLKxs3K/gkhNRb9K0vamfNvayhwnTV51w5D/zQo8WpRJgSnq9rwD0dOVb5J7SRso/dg8WttlYD4P7uS2J3j2dHbfG8ixsuPJweyEGJw3TrG0jB4VMu8Yq2VWR8YUua5H83f8cS1UEV9PjOyq3crqlH/7mmPwrJw2xLHWLTmHRVVt3cyUGk1oy0zsKdvjaiCw6E8jaIslJqYEDSvEpQauuS5TlIXPl/0sOU9O4Su+SJY+8QCHdPqk22fgg==
X-YMail-OSG: p1wl_m8VM1kyDEYjDM1ik9JYVE4QUQDQc6m7lXx7XIh.E8pIyuQZCveUOx7BwGC
 DR4dAjLC_B2BBvrHo4kMQyvTRpzIRSxgEZPdXKpjHCJyPohgWkt5ZFHfd6xFxpYFKkotaW08h_A8
 cykLu5Wz7kkxCSsQNP8q85_V8j51fm5XycEko0fGEbiEgWTccLhPU6FYsYYcr28xHIJdXoI35ANS
 oqML95f8aeFAgIFa9d2_rxTBUZ0sp2m7abgTnvj0e5ruPPm5YHQkmAhWveP0ur1sr6a8smptgJyd
 ZBBtGvDSLaHeKPIdlHkW9ilAYSzwJghMcNpEMuFkf5YrMq5BVSggiKe70eFf9vXbFVETq2jokdqZ
 K4xdRRMcKRBmVdKN0ubzzMZNpmd7DU6V8h.xa1r8ZKdGeRB6YtA7lsWK7NIG5O5CfSgFoDUXGge8
 84KDwo2zVPJNA7oajNOQ9l5_2LWqqZVWVc3Q_Zl12LKQqRh1p.LDV98mJMu7kglC4ajylFV5OuCS
 7yOi4H11H2vu9w7Lt4bEM9fzhMxtYh2TFPGaZWL0b3SHIwRu8KeBFDq7vPQw6wMwt1XFB.ho6NQ1
 i7kF5SC5stduGmPnyWVXzxRjncStUGGBqG.WD2rrZrUuH9JLozQI0D5omfXuEMTrQ5iSJHMZhzAg
 9wtfTDAuDitgXw6aE0j6hmykp53.e_lEamEFFWWfOBZKqwgGXJuMbh2_PKb3mUff2.Ce1jDDFsEV
 1BFJEKEVHQIeDKlhMN6aAn8_dXUNwh4L0yuB74vRihSqGm4Sb71NlVF2u9J1POCb91gjQ6rctyhG
 22Vmd8Z09Qm.FbiH_jCYKRblBkuZjPBQFJ1dsyEpcEw8eBBKLqCB0SyFqS3uMz1OYUE4j9XZnlYj
 L.WnKqI7uocoL50J5bLQKxjND4bIzSqoD_gFB4Y9RoYwfOvCWwopO_J6tflq7mVEeMK3CcL.0kot
 XA1n0L63lAzmkQuGasBslLu9uXDYrYfUNiiix7a5NZxhHU0S2dlHYKzBjMG.5YLM53VnefCCuuva
 MX696BWuNCF380Rgq.Aqtv0MfXY19LsIOje9YirDauIbL9ZblkFOTg9NVoXgyatj1VmVzejTuDNx
 0tysukAwfhX9oxBUwcnTuil0lDRj3YoPrKQeZHLXxBaioj0hOSCrSNIn0EXzHnQ3wq6fSft81pqG
 Hgpkw.u8EV9sm67ANzdH9xcvFtj2WvwJNAISfw.wswJqw9iyhyahyw7DbCuIf8tHUsgc6qFu7sUJ
 oYz6sWSrxaOuwsmqDNI_s4gpOOnR5PDySq7nO5Pf0wqbkQx95UbclqYQaOqqV6Y8MlP0FwDRcofZ
 gE.JEUq4vFBIGXXo6MzDS4UfYuzEBiBFC4Te8_2PAHIZlwQKjuCuJiJAIdvzGKuH.xHr2OiSfGpy
 XnYrJP4Vv5_En1u8s6keSg5JA45LsTikrGO.9w.5MpYouL2QnpLN8qMtKUV9Kc9qLkajNDxZOsWX
 VLkv9iRwRfZDZr2xqfS1U71SiEMfJoTJBi3nf19y3WEgTyxwY8s2OKTiHpkAYrtNR7ZKF3MMaTmC
 kcZPFrDnHmtCatZ1OV7XP9jHEevFRcUwL55vDzjvUlPIqiFM6x.gmHgSQ0B6FVKCZeD0isiwIasw
 Fa_.AgA6FWnVAsN15DmUCziClais_YSynKPvx6AK4cUMSwxGotpl.khkeFDPjelP5RqKkhrooor1
 a1PaF70wbP9gCarJm_.StAd5WR9D8o_AK2c_cB4tCZ8ynRAdt_cs2OuqA2LrSA3nIdwvyaP1mzDy
 qIHwqTwN01FCwHeKlAQUfruPpEJRZwDybx7FuEc6F6.G0zui3V7RtPuLYa.U4OeH77dfKmzQi45F
 V12B3XwLLe_K3ksZDDxN49pIOZp25U2PVA2bMQetxSL8_CaR_zzd8hnHSc8DUcwW5QiocDi9gTzG
 qb81orLg0D9zzQvz5Bm3aK0G3.g8aHGxZf4Bnb.AqKFqt1AsKYXFoA7eD1mImOmAw3uRB9apjaPP
 JUtKGcPw69QxUO6t1_jZzk2KzbblH9_Y-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 5b150d41-e2dd-445e-8f6f-cedb14b63b87
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-104 with HTTP; Wed, 11 Nov 2026 09:26:24 +0000
Received: from dip74.lsn.ir2.yahoo.com ([87.248.99.83])
          by hello (SMTP) with SMTP ID 372b8f152ec78728707a347d713468c8;
          Wed, 11 Nov 2026 09:26:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 11 Nov 2026 10:26:21 +0100
Subject: [PATCH] platform/raspberrypi: vchiq: Remove unused macros
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
Message-Id: <20261111-vchiq-unused-macros-v1-1-11b435de1ed5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAxFryJZN+BIEfQqxYWTiRrBsU46UhDvb
 mw//MVbvHeAchJWaIsDEu+iskYD9yiApj6OjBKMoSqr2tlwp0k2zDErB1x6SquiqweyN8/gPZj
 5TjzI91d9dX/W7Gemz52C87wAbkpYxHcAAAA=
X-Change-ID: 20261111-vchiq-unused-macros-16fc16f94dbb
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794389182; l=3395;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=OXzgbhtQSqUsCb0f2iTa83Fm6i8oN+u3IxFOP4jlL/I=;
 b=bjSp/6QvUoFeiHPUX5Z18To++WoCoGJXPM0vPsm8KkaZ03ga8aJyhmGXHfor1gEbojiFHo/Ff
 LlstbhPkJZlBCnxEgESpJkm1yjpeYrvpTa3eIP7lpaMdbuLI0M0AtAS
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261111-vchiq-unused-macros-v1-1-11b435de1ed5.ref@yahoo.pl>

VCHIQ_SLOT_HANDLER_STACK, VCHIQ_PORT_IS_VALID(), VCHIQ_FOURCC_IS_LEGAL(),
HANDLE_STATE_SHIFT and DEBUGFS_WRITE_BUF_SIZE are defined but have no
users anywhere in the tree. Remove them.

No functional change.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Compiled the vchiq module for arm64 (defconfig) without warnings.
The generated code is unchanged except for the __LINE__ values stored
by DEBUG_TRACE() in vchiq_core.c, which shift by the six removed lines.

Verified on a Raspberry Pi 4 Model B Rev 1.5: the module loads, connects
to the VideoCore firmware, bcm2835-audio playback works and dmesg shows
no errors.
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c    | 6 ------
 drivers/platform/raspberrypi/vchiq-interface/vchiq_debugfs.c | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d74329..e9054bfc421a 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -18,8 +18,6 @@
 #include <linux/raspberrypi/vchiq_arm.h>
 #include <linux/raspberrypi/vchiq_core.h>
 
-#define VCHIQ_SLOT_HANDLER_STACK 8192
-
 #define VCHIQ_MSG_PADDING            0  /* -                                 */
 #define VCHIQ_MSG_CONNECT            1  /* -                                 */
 #define VCHIQ_MSG_OPEN               2  /* + (srcport, -), fourcc, client_id */
@@ -40,7 +38,6 @@
 
 #define VCHIQ_PORT_MAX                 (VCHIQ_MAX_SERVICES - 1)
 #define VCHIQ_PORT_FREE                0x1000
-#define VCHIQ_PORT_IS_VALID(port)      ((port) < VCHIQ_PORT_FREE)
 #define VCHIQ_MAKE_MSG(type, srcport, dstport) \
 	(((type) << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
 #define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> TYPE_SHIFT)
@@ -78,7 +75,6 @@ static_assert((unsigned int)VCHIQ_PORT_MAX < (unsigned int)VCHIQ_PORT_FREE);
 #define VCHIQ_MSGID_CLAIMED            0x40000000
 
 #define VCHIQ_FOURCC_INVALID           0x00000000
-#define VCHIQ_FOURCC_IS_LEGAL(fourcc)  ((fourcc) != VCHIQ_FOURCC_INVALID)
 
 #define VCHIQ_BULK_ACTUAL_ABORTED -1
 
@@ -93,8 +89,6 @@ static_assert((unsigned int)VCHIQ_PORT_MAX < (unsigned int)VCHIQ_PORT_FREE);
 #define VCHIQ_SERVICE_STATS_ADD(service, stat, addend) ((void)0)
 #endif
 
-#define HANDLE_STATE_SHIFT 12
-
 #define SLOT_INFO_FROM_INDEX(state, index) (state->slot_info + (index))
 #define SLOT_DATA_FROM_INDEX(state, index) (state->slot_data + (index))
 #define SLOT_INDEX_FROM_DATA(state, data) \
diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_debugfs.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_debugfs.c
index c82326a9b6d9..f8eabb302f35 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_debugfs.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_debugfs.c
@@ -11,8 +11,6 @@
 
 #ifdef CONFIG_DEBUG_FS
 
-#define DEBUGFS_WRITE_BUF_SIZE 256
-
 /* Global 'vchiq' debugfs and clients entry used by all instances */
 static struct dentry *vchiq_dbg_dir;
 static struct dentry *vchiq_dbg_clients;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-vchiq-unused-macros-16fc16f94dbb

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

