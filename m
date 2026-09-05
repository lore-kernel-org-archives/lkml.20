Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F536165E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628769; cv=none; b=XwquveytzFdcin94Sv289bFkxIOGV2cOOrPbDDxj05RLCqRPBmasdElT8q4VSv3teuVacGvKRXg2C5IbO+qXELA6byF3bVjEqxhRsgQJf86r4nAJkCxT3NNo8Axh5hHzyPU0K+mBC3n4dAIuPUEFb4chgg4kURu8x30aUxU6k54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628769; c=relaxed/simple;
	bh=wUSp5fGsvKz4ymn9YnEDAbrAceVSPoj+u3iz8U88cns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcGnYRHO5wM9jhgXFvK6t1sz8M0uLZ6nn3CeiFtgVFp2pNJ3j71TXe4T2lNEWJiPMSC6/C/Msu9JmmScBs0q1M5HLBq4PmH40nt78GMYGtLNt0Bf1ZezkMFZsatjODEbUoauuh9ynm9lInEdDNWePBFVxD0wWSXjY7e6clHTrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=D1h1lk9o; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="D1h1lk9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1788628766; bh=Z0wZIJldWOnEnpt0HgYdakZRnCzsVIeFG4FR/4glr6Y=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=D1h1lk9oqtqDk289lRHrVzBHa3PZE241iSay+14FG5V6RkN2rm/Md4d4unnb5KRCQHnHA/9AywzxfHnMycV0fM8kqPLL55fZnvAWAQmkvwgsvoN7NMNK4MdOKHPi6YLX+jRSAVkYp0Gnc632gs/0ymAJaiTJNMUdUlgn3HpgaadUfz75M+HhOuDtUTVXDoIV4r3SnHbUqRGpTgtKRh8eLeSJxmIMLc621R+lHX70KlxW70UU9i0F1oPX7oVWl9GIjdhao5UB0Gpw6H0FlomgNaGBk6+1Ts59OrVKihXOk0wiKatGY6p3qUYtr+/jBJVRn4c2MW0Ma/3L4kIuZC5+hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788628766; bh=F/zBfpFKGSoT96wpUQ2WWb+0X/+s7aCwwGNlGJmQAuH=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=im8w3j4yPnOriy9dEs65hMKioPJ8B0Qe4M5x7bfqTZ6S7nhnMLudn7FI124fjm70OTSmPXwMTsdivNxZB8e9GLHzopXbyhM8eo3zby1euKmaTzEh3kiQWQQGbnROJqGDAIu9VTFaKuFXm4moDWGgpYGwPYvtRQpU8mir+QaN4w68YxnfPpXzHADtrTc7xww2VJHtl938ui8wjsussLU9LLtk+67FgiYdaTGQnJDUeIKYVUcAN8kt135LBkXtPK7aR2xjRllItXmFmieKHSG16G002t4vwixjnunRStC418dXJQgmRFh8ApQgn78RGDeqoGC8i3/6cJ0NiyNleVlOCQ==
X-YMail-OSG: LLQkgt4VM1lGUpQ2ANoFinM9Tmr6.uvd76zfwfkD6YfFJvyV_qs1F5VkjHURWmF
 lTL_3SSJbpInvJO6ZJ29sL7RJkFlIHf6DUuvW0JE9DUGLMZEQq.8gftY2Jz1OvrIct4UizO3Ye26
 8PdPWyP_wx7XVPATfDASbBp3bdzj0Wra8t1AT3acV2fUqe2cHpCtEHUnFzAlKjzFHAptw.I7_3qw
 YsSv7IupbhNoOOIIHBAUcedYLF34hMHAeSFzC_icPIWXLCVryTh.tJZe2M.NKFDYMUYETaHrSiHp
 906huHbLHJyyj.ZmcTNu1Vuw0SLJeIqXR3zWAAV5lmElXxDy0XMCftBDZhafBAIv60zUi2ykd5ZT
 YP5aSSDZr3sx.OxfnTOym3IwljaXeGuIRNnNYliXb0J2_7J8pHIqqd9HerEjtpEws5RHmXXNeH3.
 kRxqkYpaHZeLK_tk4YcLOEjY_sZQ.G2Sn1ufeBnivX5icrZyTnDTo0.MuEqhEnmzLE_dqeuCMKg2
 El51HHg3VwU4a9qSAJeGYscW3wvMDxjtD7jHDyAUj.Ea5AZdnoAZ.tDfP64slequdHS6BfOhp0gk
 6C7a4dakBZRliPXp0U..PzLPdUc_mxvR7J7nfI.I75KDvQ0xzVm1dWIu3ztpmMI1fKe0S9b6G1wc
 L5t8zd62411TLptqstHhNucj1hxl6STaCxhqdgODG5MbsGOgDf5JCnzQ6JRhDdqXTT2Ga5syUBSx
 xWqJK4p5Nw86HPwqFELhbbMXZj_eAlCRVyk5jdmegzCAMqcgcE1pt5SuxIYnN_OMspIkg6HR0q81
 2uI2wsJAJzRrRpeBtX5bkzVKw27AlBq1eNIiSRX3qzx.3EFRrvZSimMqledxb9272PiF9Gr_Kbkp
 iqupVWPKMBBYnam2Q6W_SqTMWupmDmBu273fo7fE.gIgNSt1teK5AT.24JxFa3Z_HH5As4_7slcF
 hokmvn40TvDo.0_hbWrW8ip7KojJE5cdXqKQI32wKMDhbzifhCOMKPxvOl.uddXFqNMeRABLEwEZ
 USZg7Ky16wuACEQ6K8OlOgm0VWFAQnsW5N4PEXk1GZOOLrbakOYpeCVRI9g5r5XmCx_0sjheJUYW
 wGUqUokADZhI1PFQWFvBwlp6__k7raIDPuMGWIf.UpTmOdty0QLBCZUbB18v9mBZuJz0zgKr.gbO
 xupm7Vvzqt93K.kXp05gT9cYdDn9UIvix5xBxSpemM36mjmKTgX3NRXwG9ZvV8W8q8t2zVAB91og
 ELd5FXqXvxcDjwKTyUn6VUG9m4L0Cpuh80FwwN8C_wuW64DrkC9AJAA82iYmKoWWEEx3Y0mTXtPA
 a.EiBAWbQEZwENRRmmP_4mjaEm8GE0e8jV1Cz2m0Y5IYeVM_Yt5m.FR8kiW6d5gJVK.YgDvlvUe3
 RE6GZdyQ_9bOh.6vjbEkfcrq4vdd7tAK8X_1h8g6I0N4ZNxP2TuZkzbZydpI1y9trb7.FrV1va2k
 MxYQi1ASoC473YImCB8mYiR07I.AUgin41O_elqOSB_vBV7qmyi.TFXAqn4xcaFsh5tlF4qOPBd.
 kOSN34sHDxIrKyLWRzUucqvr9ojfbvyikrYPZ4zkiUI55qXh_s6znmfXEqJsdPGveHqtadVtv3.D
 PvE7piwOXsA9n77_PwE88eB7Mpn00dUaaGWDaYufK_8wHtQFFw4z7P3qofQSbHx93gtTVZiinNpe
 bt6_UMn99NiHoXRt257Dj_.RV62Bmk1kIJfT_100VaxuqIDRun7z3jEoTRE7Q6gwdG3UXZCZZBUZ
 DxP06HMFHbGrb.lNRVz17raoNgkH.o9SZUSzrsPawKZdcdn5K9f.3nE1maYbGuxW7vrAEnbxoB0y
 b.xm4zYg2TvzG3GPyQCuRQgAzhk6xJ6r10KxHaPT7Q4Q3WAWEzi1KfxURS7bQwovkD880MVwe6xG
 7ogh9rdgalCqiYk_sMjdzE3cUl.pzT2.3vTGPdi5_CI88Dk4W0xP7AkjzAeTvjuEGpjB8nq_xR8M
 3GWLUf08zvIc9EofCjUGFdqnCLek8GKTPx35y0l38Wfw-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 66e7ae5b-e5cd-41c4-962f-9fde6b5590c3
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sat, 5 Sep 2026 17:19:26 +0000
Received: from dip195.lsn.ir2.yahoo.com ([87.248.99.204])
          by hello (SMTP) with SMTP ID b05c3f01957e7b76b0689228583129d6;
          Sat, 05 Sep 2026 17:19:24 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 05 Sep 2026 19:19:21 +0200
Subject: [PATCH v2 2/2] staging: rtl8723bs: fix Rate comment banner in
 rtl8723b_xmit.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-2-07d433523872@yahoo.pl>
References: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872@yahoo.pl>
In-Reply-To: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872@yahoo.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788628761; l=1662;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=wUSp5fGsvKz4ymn9YnEDAbrAceVSPoj+u3iz8U88cns=;
 b=CAIUtWRxBIwSaHqqGlhBvwvcBX0UOx9Evml84NucRFvwBt9vWraBUIRhQNwsqk023f9Xs6UQb
 Ftsqq6i0h53DvhFt49onRl2GxvIf0AL5TXgeRCP7xkOxln7AHpXBTbe
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=

Fix a stray space before a tab in the "Rate" section-header comment,
and remove two duplicate blank comment lines above/below the title
so the banner matches the style used by the other two banners in
this file (single blank comment line above and below).

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2 (per Dan Carpenter's review):
- Dan questioned whether these banner comments after #ifdef add any
  value. Rather than removing the banner outright (it is used
  consistently elsewhere in this file), remove the two redundant
  duplicate blank comment lines that made this occurrence
  inconsistent with the other two banners, while fixing the
  space-before-tab issue in the same comment.
- Add an Assisted-by: trailer disclosing AI assistance, per
  Documentation/process/coding-assistants.rst (the original v1 had no
  such disclosure).

Verified with checkpatch.pl - no new warnings introduced by this change
(and removes a pre-existing "space before tabs" warning on the modified line).

Assisted-by: Claude:claude-sonnet-5
---
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ddf868c7899b..83f1f0bb9954 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -365,9 +365,7 @@ struct txdesc_8723b {
 
 #endif
 /*  */
-/*  */
-/* 	Rate */
-/*  */
+/*	Rate */
 /*  */
 /*  CCK Rates, TxHT = 0 */
 #define DESC8723B_RATE1M				0x00

-- 
2.55.0

