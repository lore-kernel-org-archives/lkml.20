Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA237C91B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629034; cv=none; b=hH6GA8SDhIoJNk1hiXnuTK07uW3F3/uoOHpyz0B7FS48VIszJuv+ZU/rq6slqAcx31Pi1sn6qfnRhhTZ4+7woMcH0ufvyUTVVtWfHYA+EJasbqNV4K4LuTV4b02VgsOi2cL3wrEaBa85UxQBgbUJLlnCng150LdsFjJcxGyI2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629034; c=relaxed/simple;
	bh=yWZPLYEyGfP0HHe67FDBqXKi4TyGTcrHZJvf97kZk9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=ha/3k/ywXMQZGlF40teuMDghsoPab6NwfRHtEWEI9lUvDL5pEnUaQ+zkUeWrBDIa75S1wVmklk/iDUMeq0QDMWZ5Mw7lZ5F8q2NlAkNV3C0t1vZTa5rxN00bMOxaBodCkaHDQLJKIi9mnAQQkStFgRu79PbVOAo2n/MaJioMSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=cVilCsVX; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="cVilCsVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1788629031; bh=R0oa9KbHeZZiYIYBgdbtFmS+LAlM9b3g1zxDXiDvJfA=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=cVilCsVX38qzkR2o7wi+sowqTMnTKyrdklPR6fIKp7SDZH33y6qE749Mmc3O7AEvLdt03N/3XeAEEhcOxdmvDdWp+yaik62fACemKlmR7Usgsmg6vtMlejDDVULxcezmALLL0fd5IOq9WW4TrPz7p1pTIkk/RuLZknXAx3ki6kNx+O8q5CZrZdKZBXR3Q0uMLVRwTwytEsLgVSAV+D/tXcQrLnp3OygitEmJnWRcODxrearnwfsO8kTQBECFFQcv6pUcoj+6iiRVLNdBWEMpinw8le1h+0E26/bd4hv3kpE/E1cdVqbFWZUoYwAJHVHnzuH4CsN4zXZKqyJ8z9RMhA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788629031; bh=AthzvnOu5O25dYL+t9X1iWAP2jwZuEIpZgvQWnURKIA=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=e20urrqw0XfQDUObWpAB5Pbe4ATCM5aU/2QtT+bvun9Jzx4vZ9BZrTvQqtSznfnxsywhqdkJADnOMs/rai6TlArPqFKWKt0lSvAaWKBgGG/4RmSX1PSC0HhVYt19+rVTh7cuWouv21lKstxFQK0ywV9VDKKGOaI9l133kf0EEmGN/ei6i8dYKg6cHE26OKFH6eA1C06Yw92OVIDNVsCb4zFcXwf6cCXaV774gZ3m1aFDygUuEMH6SqWCBPd05mFqNTpm6gHJrZWW+vmfYZtYDDECqNF7pMlq3kN4GU2aT5AYUHJo0yg0tgzRoKfJGIbrq/xcjJC3ulj224IDAjku+A==
X-YMail-OSG: ZK_aG.YVM1la_ZVZn8JUNE8ihaCq.Jg6Kwy_hY6cQPHIFAdIDZ2uYLSuLC_QOps
 ymeh9pRwtV5DTDSBFifdobN1h.V_1C_oD17D3Nzi5.Yx7RgHSU6rRaZWaOW5q1NJBqlO4j_kmi99
 9Imuv9vmvtvM75CwfASLHC61bypbvFsvdiQNmPf1IFeiY8Q1FX_pkkqV0OP_QvZ8dt7PeFcJfzvW
 ioi_4HjSm0iFvLMsv3VF7FCSx9O_dZLc6sqaMxURwIS4fVPSjdcYVcRX2rtKdvvP2LUxd_gEquAU
 iYbGFn.vBNfAuyDTcZ6Ldc.tgbBJT__yuxw316syk56nDmZ8eRsXIe68lzWUvULZrEyYgr311ZGL
 UOrf5hYu9ULbVdtVkhlgQTQqRLH3PxQKitfiTZQevLHZpazZDZSnOgleZ7YEIJxl3Fv_3p5Z0SPY
 TnaLvWIVK4qwtJkvoEi8kqr1kjxCIixeNjuC2Z1nPZUozSOBAgUa_7k.pFdovO5lUKYBrAI2_wvZ
 a.WVnqPnLgRNqXmQIlkMN0Y3ibVhsAx9Pk5XjektubQgrDXIPPEwhoYS9vGcMiozH.ObyH5vIP0L
 8_lenbvSD6.KUz3FQy2iwtoF6wPmvmgA4Z94qOHaNNF85KiXa4qBAqcWRLjkCPm3tx9RPvwf.Jq4
 YJPt2SJXGlAxfz7uczecohb.zUWibsKbEIsXjY_XQYYGzSJVs5rpkV7qJPSlSl94lA761Tzdju.H
 AVk0zcAU7YXnwgll9nHPv0mrHs5NITyQot9TzOJwZAlTa7AjIKLV8oUoIvxHAReblYokyaub5oRV
 eACc3qv73TkCVuEU0VnqhcuzOZfTNH3lcOAEuKKunx9wGmM1t8dtKpo3zl4h6DpnLd0iyjsqUUZZ
 9Cbz0Uca8cE0N8SV5Qe31kOxIai0LQIw0aw2dOp8QzQ8rXJJdJERDmJ_dj41IMMfH1GhS4IdHQNG
 RSdLfNyF0TM8ZD6Rw_cUokGm6__1jQLCIFPlqiZZI5czTDywo5AxYHWoK8kfYXTKBNOGm0kycVkL
 KyF4bmPopf8DRGK1a9G5zX2RhxV4.4FBHVewOaoQZEc6I8RKZtKwgoPfNzF7_G3AoUpElVLCBpYB
 d_8IHK.R56BDken4ijw_061RRWOG2Jh4pTwBJjD8PD5e8PL_HayCu1v8kNZrfp5s4oje9nldwByj
 KpBMqe_xFqdlSdMwBhleEPhuX666.kzW5c6JQPhq1LVvfGyw9LBwChJpk46E6SOCjvurY.Ef8icj
 lG6Iff_YwgsgxCOYF6Hy1sHnbhtAX2cvU19WbTi1b45uo2Lw9uWZ0OgnFAETlKOlfxPObjfVi_wr
 N2A9c64XYYPshIZp9peEu7YWIq21T28HHTJwCh0e7RekTEaGmLVfeFxwhvgXd0Mu5XjTNKQFT0_m
 eUngsslOSnKdLR0mlXD2Ggi9KL95nbZZ.zH9wW5bNRCHN3nwbmXWlGApDtHa1wAUFBHc.p6ndRrO
 Ga9WxO8CN9Lf4Op9zo62OQ83qXIjFWeGMM7UoxPKJXuoD3BbHPYAxlgZlxTkFLgWfQ0lwNAlgbsz
 zOyh1RhI4QpWxm7KenOgqpHZo6bg_raceYVUXYSQ6cKKiwgK8F992gIZ97L912qHMqsG4WzupwIt
 Hww8Fzy._x4vr8pZy67gJyyDcB9gm0hPwvHtt1NdA8KOCbS2lt7AbDFHiaLXF4W4iHXD.cWmltSJ
 z.lVmYIzxxyL3raaeEfCQgDM9wK5rhmi9zvWcmV8783hITTK58ofoHl.fayQqIEaadVo4JGPK1o6
 S6iZiK5hnTVf0GPizMTyV6xKKYK6fgj5LaLhD2D3B0CRyJW97sTImJ0v2NPcABgCBtI44bsQNaVG
 FI7CrJPrY0v2A30UhzCu.Sv8_Tdet71F3nmozhI01w8_sxzYiZP5s0Ewk6jlbk1_fVC1GKQUiPhA
 jxUsyMilo2ndd9gjeUcJK_PYpNhAqmsM9OF.pMS0O9qlNHuWnKghe_E_oqKt8Ng6uZLTf641v5nv
 Gax_ZIzcoB5cRvYRgem0TNUieVgNSxuFMzuEQ2TbTotWF
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ddc04572-35e9-45a4-8dde-977e2ee764ac
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sat, 5 Sep 2026 17:23:51 +0000
Received: from dip26.lsn.ir2.yahoo.com ([87.248.99.35])
          by hello (SMTP) with SMTP ID 5a1964415642f1a1c1a51f671a4d8acf;
          Sat, 05 Sep 2026 17:23:46 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 05 Sep 2026 19:23:45 +0200
Subject: [PATCH v2] staging: rtl8723bs: fix comment formatting for
 pintf_dev in rtw_io.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-rtl8723bs-rtw-io-comment-v2-v2-1-ee5791206cdb@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm1Sivh3FcOCGavWyIyZDmhCu
 Lsj7t63eTOYJBWDUzVDkklNYyjgTQX+3oeboF6KgYl3dKQWU34e9tw4K/VGjejjMEjIODE6Yl+
 7LRNJDeXwSnLVz3o/d3/b6B7i828Jy/IFM6M9eX8AAAA=
X-Change-ID: 20260905-rtl8723bs-rtw-io-comment-v2-b02c1b4200e1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788629025; l=1860;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=yWZPLYEyGfP0HHe67FDBqXKi4TyGTcrHZJvf97kZk9c=;
 b=qY5PDkSSPBazhfQa+60R53tElOdrR9tQho+GO7HjinCfDDoa+wRAtqNcYcwn5FFtvwvcE5X9A
 Q2nrD8AGk6xBBgms7D4Zc7aDgnHxit1/LEAorY9ouUnMR8XefQCcnVb
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260905-rtl8723bs-rtw-io-comment-v2-v2-1-ee5791206cdb.ref@yahoo.pl>

Add a space before the comment, remove the stray space before a tab
inside it, and drop the unnecessary parentheses around
&padapter->dvobjpriv.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Dan Carpenter reviewed the previous "space before tab" comment fix
for rtw_io.h and pointed out two more issues in the same comment: a
missing space before the comment itself, and unnecessary parentheses.

This v2 fixes both, per his review.
---
Changes in v2 (per Dan Carpenter's review):
- Dan noted there should be a space before the comment, and that the
  parentheses around &(padapter->dvobjpriv) are unnecessary. Both are
  fixed here, in addition to the original space-before-tab fix.
- Add an Assisted-by: trailer disclosing AI assistance, per
  Documentation/process/coding-assistants.rst (the original v1 had no
  such disclosure).

Verified with checkpatch.pl - no new warnings introduced by this change
(and removes a pre-existing "space before tabs" warning on the modified line).

Assisted-by: Claude:claude-sonnet-5
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 3c99a2bc19bd..a613db80d349 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -24,7 +24,7 @@ struct _io_ops {
 
 struct	intf_hdl {
 	struct adapter *padapter;
-	struct dvobj_priv *pintf_dev;/* 	pointer to &(padapter->dvobjpriv); */
+	struct dvobj_priv *pintf_dev; /* pointer to &padapter->dvobjpriv */
 
 	struct _io_ops	io_ops;
 };

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260905-rtl8723bs-rtw-io-comment-v2-b02c1b4200e1

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

