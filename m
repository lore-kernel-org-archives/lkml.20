Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842C33998
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628768; cv=none; b=nM6XWyEsfDJy7zB252d6HIw3sbJdWrVxIipYciattTR7KTrVSsi/zhKdEO2u5O4nl5MVaz2VqzIPme0fo62wG65vqt/1SUal3fbIbGC+r1dU4WpRUcOxo+6iMlKPTieyXceaWDy557ArMzDX549a01MLdKZYK+oFUK7EVCkFbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628768; c=relaxed/simple;
	bh=L5X60tDzwdlPbgo2/TkEhKnyTPonOo4bDVkqRQ2shIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc:
	 References; b=tlJLlvi2iRWiX52KQ8l9mywMxbgFbhvvU2RGiRrS8lRu5g+PC4N30orUVfOs36A1Fuwmd05jKYJPuT6jNn5nhQBxTkZSokhcvC8VMrHJffpQyBI7Zb2bAYLRZeWyqggyTVqx8UPDo++32HtcrPo2+tSlvbnsmGK7PA0xucA6HvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=YTkrTgY2; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="YTkrTgY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1788628765; bh=I8sDhOx8DNqEto8aArvO+O2Sfsozjh+/Wz3BZg/iW7w=; h=From:Subject:Date:To:Cc:References:From:Subject:Reply-To; b=YTkrTgY2PjFE8YZAnQrph3I9ahNG+R0nz4NS8ctBfTfMEPtKMTRJ+A3ksegnT3VPbAjJ/KthJqFIrbKfHQU/5NK/N9aXfYNLLCcWNcM7XtLOOx0Wv18USPpqyVYyedpwOfPG4QYlOXHN49ggks/auuH0z3dNBaD4sETTkfuXqxrgJa8LbpNBcHgsE8NC2ELNW4jxvfG/mmHe8jXpqIWe0BIN54yGeO81ft1lSs8CXOuQ42oQ2gvCwoSDfLuBxZQfm0MslFlseA+B5PWBzODOmA8+d9c32+Zbi6Toz/h3n+I8SxGqMY5gGOm7g+5PHQdrpO+pG4TlpYorsiMUODvUpA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788628765; bh=rXdYKfLfe6k45q/yZA8/ciED1gdU8h3I+9r1v8Y/1wi=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=Nn0JRftzTL5t4it/XPm30NW2c0dKax/tBYbRjOgZbC/aO4zCg24MUruth837HR2JEJg81UubTxc21mAjM2d37XiAJVbQF/u6n3jHPH+nmYX1MCeKnQOysVpRhb7cPTv+rwse/N4EBvDHIbbXETws63sXPDP8ESFIP3YJ1QynyS22tf/GzCAV55XBni03qMAhaNZ5HR/MIlpmzy99sK5a+Kmv+DWQhsebh2JaESP1Ogr54GsHUrjKV3FHqLtMh4qlvhJEyP0zNP5QIa3TxFOiVp+bY3H8f7N8net+aTcm4jlrSzj7LSbhWjJZCIm2+nYAbhj3nj6Sv0IrYLPgVbVRBA==
X-YMail-OSG: GkHuoDwVM1kBnv9s1wl8fzUlG67NW5AyxY1dkU.1XH12MfwK6_NNHIl.Q9fqIzs
 tZT6h2Pa9ttWvWCa1swYVlhID_aLJUTAbdbv1CgrtXgBFQaYuAtOW79uooNY8Bq.7ha6xfbO8QLA
 XBDM1yWBsEANxXytINSZczQthXKeZ0Xr_JIsBVn0MVDvJy78lFlHNACP9Hn0okLYwne1.WLrvGD3
 RMlR_X1HUvNLlRvOO0hLFBE52W77k9aN8OdcdIvVZ1qE0YWWnnopBD5tniQF6yadzxoj4vdH1JUS
 8eNiv59tenVcA_X8bAfPi5QAFHEd59xEHxLg6jAte5JApW23vHgootXGj9XzAClRBGLv5EeKQnVi
 uRpmBr_zwm60te7.WcdPe_HljbOte3lTrDn33Csp8xgUX35KxH28jo.LTrPwnopWea3FKo9NC1FP
 QrU499Ig2fbZGmm1DCTOEGYFQ_2euF1mv08klCK66zqGG.SqbgQX8p3t3zpyrVWopRRTwXFQKrq5
 nmzgctjJyLl_jEVoFOcuTorn5D0GD_MfDQCc8J0IU9I3JWC.EfjFa.1ZRflEAdSkdDDbsmBkG56f
 hyRwPMVhTvATv01O9uQ1NiLhBY8wF6zDOI2FhIWVMtYHFinsUQOgOMU3qwh0_Yza0sWZnyPpHRCr
 hj3MiMnf6bq7U_VjCQT1MqWMeMhpHjbNkfWtIIszApz_8g4A36_hnqaRkwS03wtEVm5i1JH1J33x
 EX1JpJgU2Za8Lmwtslx8WyqExA5WvEj88wJ7Z.ul5iwn5bzgtTbFwz96Ec3N_JaaM5ekKIdA5Woa
 sDCQSMQF5ptNHnuZjZa4nzoNWlM25IxNCQuxnQP5wAH0LqwL453WGXTH5sSfjSk7qO7S.82HuRGq
 ivUXW98dot.8y_ocbaoGR1s1hXl_qH678P5bRJov6GWwDR6YJsCeRUOpbsmCBZZdDcLz_c8KmNk3
 ZYbgOoy6sid1oD9Q_P2SeZQKLmlo._zT7WyRaONE7P6hCCUoy8narhJ2NakLiVXq4H6XKugzqi6K
 T4f29KbbLShly0sGUxYMrX82Oyv7mqp28Xt7pf90ihNRRzWVDYl8kauojQMoN8R4wLqARyltjQeT
 MRCQyJy4yP0yqXE3OI4xSrATWUOAHYvfP2Daj8PaoZQEeSfCQLzLg8w41SRC2WdkSXp_9GRAKkay
 QqH26b6pLgqv.65jxhGZPpwA_VItNlImUs9Njhl1yWqhGpq5p59jJ8N3A2khjC8dmarbSWd4WYBs
 Z3IdUGGDdS_YbcXuDE_OYTM7cN3jYYNB5Zz4c592yYX8s3v7nT4xuytj0AFOJJXRI.N71T8lwakG
 PiaP0dXM9sm7Tb6d9Pu1K2u19csayY0IIgaRJ4lOYUjs3d6dZb_blJdTA5NiFxnElx0tdvIbqjZB
 IkROIsfYN.5oyiX4jyi2ekUsQqhmBOeJvNGd_uy1wyx0s8PnY7vrF5FwCStCog3uQQjsfOIsSGFB
 e9Ps2Dls6CnFXYGBoFts0dGj12i8bzk236iMJ0oSuhJZkKzE2o2VChelWxIPn4UxJMz7cgHM2KNZ
 CygTamh_jK3HmA3SjTY6uuVSCyKIMLx1mVCTKGEB3s07Oz0jEjZ60D3BS6o54JJh6vQ9z5dTQluz
 XumVEfOr6RKq1vSeZd7R4W4SQ3CE.B1aVZpTq9wBRxfhh7x_EH9zuIz0MXZpeROkdyBFBKWtFxWy
 fmVp918UCa_Eir3gY4uXulN9k.Dln7Lrw4e6BrL0s9iimSv_ICNh93dT3nPr7mZ5C.30ZwTMA4es
 DP8J7lE3SBHwDSGF9wvhzCnHSyGra7meRLOEB7CURU9XSWjWxKCOR0XDiyp99OkjqlASiZB5bBVe
 sIjMWL8jbxJTGctATQZyj4QP1jYvcXRoyfni3gsXd0quimqn1TbMJBkEKVO7isjLMAYBIBi8Y_rk
 _IJVZ5STXPW.J_o9.vPERiOAyND_IzexTbIS1bUrvynGM9fVeUEV0MB4XN6oYNVCO.KcGPqxXYHg
 kW24JdWkPEVc__ompoekm7zU-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b7cc6fa9-e8f3-447c-85e4-719e755df6fe
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sat, 5 Sep 2026 17:19:25 +0000
Received: from dip195.lsn.ir2.yahoo.com ([87.248.99.204])
          by hello (SMTP) with SMTP ID b05c3f01957e7b76b0689228583129d6;
          Sat, 05 Sep 2026 17:19:21 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v2 0/2] staging: rtl8723bs: address Dan Carpenter's review
 of comment fixes
Date: Sat, 05 Sep 2026 19:19:19 +0200
Message-Id: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CQAxA4auQrm0yFHDUqxgX0FatkZ/MDISEc
 HdHXX6b9zaIGkwjXIoNgi4WbRwy6FAAP9vhoWiSDeTo6M6uwZDeJ09VF5F7wbW3hKKtII+iuBD
 6unQV+aZUYsiVKejd1t/hevs7zt1LOX2zsO8fHJ4LHoMAAAA=
X-Change-ID: 20260905-rtl8723bs-cmd-xmit-dead-code-v2-741032751e2c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788628760; l=966;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=L5X60tDzwdlPbgo2/TkEhKnyTPonOo4bDVkqRQ2shIM=;
 b=7nRijubw9uQN9Ps8BBuP1aZ1wgfpDm/vqCESdSTU4wjq6+kE7q4kTTLj8l10G2Lz2WECKKVlL
 IqkgcrJ/+1gDTWod+ELL84yaMgrATOCJOPk3HSjXU+aIA60wBIkRb1H
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872.ref@yahoo.pl>

Dan Carpenter reviewed the previous "space before tab" comment fixes
for rtl8723b_cmd.c and rtl8723b_xmit.h and suggested going further:
deleting the dead commented-out mdelay(10) call outright instead of
just reformatting it, and questioned whether the duplicated blank
comment lines in the "Rate" banner add any value.

This v2 addresses both points directly.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Tomasz Unger (2):
      staging: rtl8723bs: remove dead code in rtl8723b_download_BTCoex_AP_mode_rsvd_page
      staging: rtl8723bs: fix Rate comment banner in rtl8723b_xmit.h

 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260905-rtl8723bs-cmd-xmit-dead-code-v2-741032751e2c

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

