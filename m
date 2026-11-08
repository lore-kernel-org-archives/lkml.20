Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182038;
	b=bHxHOdjUnjxB1CVOQFpKSX41y6ouzTf6XeUG8rTPwjvb01Re9NtE32a1KvVYQcI/TKiR
	 etD8sfQvw7vt77RfydFKOAgsobF0UmNSOfr/L7lB8pLgEXtjri5OA19rRXbYw+5GBKz6u
	 RSD6Q7McfX4CCdcBUK4SXownPurcxRE2UaHgR2eKmC3luOn062aYUwJ3yxySrMAAa3Qzd
	 fS0QqUxJQ81pNN/E/s+afkZVc7L3fsD6OWChFaMMBBaxxnu1AfXAJGpiYkkymLM3GIG19
	 miAWBYqeZqzeG4/LZiRrI2a2ci5lROCd7zS1JEHRwFkAY7AgU1V7b9YQ8zpIKhSqIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182038;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=evz169vZnZOkt+DBEIxf1iWH+BScdmBgNvk08n0btTY=;
	b=iRpDWIH/d6RBB/hkUP4RFjSVpUVQZwEZ5I+pjGq6dDZs0WydO2QGPAyoM2Juf0wgryQB
	 D4JYLmcVcAGoYGH+00Y4VEKQEiSSXeR4JNy/Ihub9bzLDWMXQnJRVj8Y7x5Tk07iHTlFF
	 RBSzDkRr7LtjSRZ2mLXRUdQvYR1hef75BO0YkVuNcOHYe7hg/JFDKNYho5ST9TFokHy16
	 EpWZSiISgNPwJnIAxWPxEZkoxvR5LcPud6p9P36M6Vdctf3a6iwt0SCS7EfWZdUsyJb+4
	 8J5af0kjlVyQQtLn/f3EFi7rCq9hxruKUB7vKb2652xduw2ZhpA3UQ+Z4lRtaG9Xmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Tmdc+mqt;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF7606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Tmdc+mqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182036; x=1794441236;
	bh=evz169vZnZOkt+DBEIxf1iWH+BScdmBgNvk08n0btTY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Tmdc+mqtjd2tSNfnHdGuDCePcxxej4dYy9uIt1N/t3dpnYednPl/jh97u3vU24jFU
	 YV1YkjDS3QVJ56oKrLltpgnmh9rqqAp4PsE0HEHnNvftHvZeto0u2YJ1QBa7Cqaer7
	 YVB7aavCdej7UdmXY7QiBrv/o7Y/t7UhqqEncljxsWCdrPdLyuW/Xd5rAxXGLpbyK1
	 3tppiJqijBnS3Jp0Wo+oL09RoyV3+LXILyvptdE6/9cABYZsfRzwr1nCNRgvR2q4wi
	 ZKcCSgbuxMiYUj2YVLDE6STtMJTeHvwKk9h3Qb0mEFvi2lUyhg309B4xtF1HUcTB2s
	 QOEIU8dwuRY0g==
Date: Sun, 08 Nov 2026 23:53:52 +0000
To: "michael.chan@broadcom.com" <michael.chan@broadcom.com>, "pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] net: bnxt: validate HWRM response length
Message-ID: <TIlHjNE2soPd4hqQEaUjl54m4NFcW_adHswMv3pH_yaDdgd7LS0NoMFDR0Db1Uh39Ijcz3vUPreYR6OQTCFavkEKMuOCGYe1oMuyODuMo9o=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: abfb112a27ecdf29805ea6638ebafef4992d8587
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

Both HWRM completion paths compute the address of the valid bit
from the firmware-provided response length without bounding it to the
response area:

    len =3D le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
    valid =3D ((u8 *)ctx->resp) + len - 1;
    ...
    if (*valid)   /* poll */
    ...
    *valid =3D 0;   /* zero for compatibility */

The response area is the last PAGE_SIZE of the 2*PAGE_SIZE DMA
allocation (BNXT_HWRM_RESP_RESERVED). Firmware that reports a
resp_len above PAGE_SIZE (the field is u16, so up to 65535) makes the
poll read and the *valid =3D 0 write land up to ~61 KB past the
allocation, on every command. Lengths below the response header size
are also accepted today.

The patch rejects both cases before the pointer arithmetic, on the
interrupt path and the polling path.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm=
.c:589-590 and :609 and :648-649 (len =3D le16_to_cpu(ctx->resp->resp_len);=
 valid =3D ((u8 *)ctx->resp) + len - 1), :650-662 (poll loop reads *valid),=
 :672-676 (*valid =3D 0), bnxt_hwrm.h:68-73 (response area =3D last PAGE_SI=
ZE of a 2*PAGE_SIZE DMA allocation, BNXT_HWRM_RESP_RESERVED =3D PAGE_SIZE)
Longstanding pattern; the context-based HWRM rework kept it.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/e=
thernet/broadcom/bnxt/bnxt_hwrm.c
index 5bfabdca7d..3425c180d1 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -587,6 +587,10 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hw=
rm_ctx *ctx)
 =09=09=09goto exit;
 =09=09}
 =09=09len =3D le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+=09=09if (len < sizeof(*ctx->resp) || len > BNXT_HWRM_RESP_RESERVED) {
+=09=09=09hwrm_err(bp, ctx, "Invalid resp len: %u\n", len);
+=09=09=09goto exit;
+=09=09}
 =09=09valid =3D ((u8 *)ctx->resp) + len - 1;
 =09} else {
 =09=09__le16 seen_out_of_seq =3D ctx->req->seq_id; /* will never see */
@@ -646,6 +650,10 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hw=
rm_ctx *ctx)
 =09=09}
=20
 =09=09/* Last byte of resp contains valid bit */
+=09=09if (len < sizeof(*ctx->resp) || len > BNXT_HWRM_RESP_RESERVED) {
+=09=09=09hwrm_err(bp, ctx, "Invalid resp len: %u\n", len);
+=09=09=09goto exit;
+=09=09}
 =09=09valid =3D ((u8 *)ctx->resp) + len - 1;
 =09=09for (j =3D 0; j < HWRM_VALID_BIT_DELAY_USEC; ) {
 =09=09=09/* make sure we read from updated DMA memory */

