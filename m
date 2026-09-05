Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184B82E7391
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628768; cv=none; b=OiiD6mQHPaaMvYP9BxDl047BRt060tJmzYBAVBpBB4KBesRRKYvGzoizA95Z3rD86yS0ZqQhqQTqQK+JaAbtJGnKqT/oKuMDs+giSPRkTGbjS6demNLmKhtUSBy2VOu1JlDaIWZnQk0BQTr5RGe5XibDWhUwtHm+uo9ngauzqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628768; c=relaxed/simple;
	bh=ALipiPs3ZaL7FvqXJtdM2I+wbzGk3jaazMMz46xG9oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JroH58ukYoK20Xy7bJf1Y61zW9CqP2qSjxFIgYtsdPJc/qIqbiypZK3Wxhod1eviPcrYUn4jStwoZruCH++FLlcT8Gj2UF7R2O67cxQaYuKzJPN5EjhzrzZPSmvXNBgBk0iCUNJYW7LQvZOpEnYn869tAdZNEs2Vwjil3xSRECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=SbaMmvS/; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="SbaMmvS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1788628765; bh=0LmWV5Oa/pCVe1Q7/ypTVm94K3gzgB+MjuwaEes2ADI=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=SbaMmvS/NLBrZGy2WXcj87AFJFkVtZUdDuBwC5BWAp5vKqLNgdGYIKexC0aK2MaXOARXSiRN+JoYAYb/jW+8FD0jqKu8N9NCKJhN50AHGTnbaGQTXk7DbJk5XFFIc1la5BTU5OQnRmuETQTAllVHGjYq2nPlVbiZEFDKQYq47NzYZm12ohP5OhK3g3RuOQ7nTcR6PoUgtRc4paiB3tNGhDjuNMDVoNfhU8U1N+ahJfKgh+T6yo8Iy0svaApMFHoWriiyR8kDPfFHA1o5iBKP3SNEcWclzFtB36VnTV0FpAMS0REzplj4CWvrz0xVI9hyyvO4cY5Kxs2VIDtGBvyPBg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788628765; bh=EZO0QgheZuCTpRaMdDaF3ONCMGJONIWU9ywAYEr6xHo=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=LTJ6vvfMBWhYHlnyB2PJ75DLLjrwbzF4TOmaKN5ODzA6urrP9pYjTpWV9o093aVyFWkK4pcI5exo3cVNcnZOaFzwXknGqo+3j5oK95BrOd/zuEUGQsci63vqmCqpwRCvyIH9kqhKq/SP+e22DW9ucEwdfigpKrUYW268uqUCjZtxBoJzO7QD2bTMPtsSbrJBy0aFz0BK9/v7xEeu7SDPe/KSdwj9AfsqG98Apzt+qNKEGTGOvTmGz5oqBeF2ytI+hKgahLsTr+wYSg5KRjECLTkdJC9B6OtSix6TX/dV/OzpNcuovZ8H5rtnoOwu75WwaFaSpVuyh1WWCPiU8r61ag==
X-YMail-OSG: Kfg2RGwVM1nSL2rouiPm19GMSKantt6Four.8kLJgffImnn_MgcO7FvUCK2asi0
 rzwT8XmWnk.o0ODp8TPNUP9V2qPPcAMsQx6V8ZD9RZBysQHwpCNZefEy1IJWJiI_KeGyVGeH60.z
 ih7nmjsadiPdZTikZIHRnVwbIlJ9.f4QquEoAmcqwTFbGkdbqDABzHOdEJPV.HubidgTcfpaTRP6
 5AUm4aVWcOjcvzC3wSWOzuhQ6fgEs5Ov8pdQJDGf6BXaKSMWQWg2E5.ipcpboSiYy4l4x3.73gQ4
 N5cO3bIKqt5.HUNDZf_RR.CU8QxLimZVWFrwHC9Rssv8c6QF7y.tcjsO6kfTxXR8WYMBWCCuWbej
 4YVSddZhKnEjxwOX6wibrPkoTVaf9RLzNW13SfeBSI02AtWAS3BEEQV3rDuKXDfp1JXZLK2YL36Y
 LOORA3OLsaFUFUhzGeXjAtoiji9e765NaPE4Z41tUrJ2VOYx3wweAswOY1XRLVGi9i72aVVFc801
 AriZiW_c6uF2ERYdgPLtoQeWJNI4LWbAsgkDoE2BXXgBkiwiekim4OAZw4V5OWoQMJc0cNUEIHeP
 KaTw79rtgSKac.gxJUmfByim4pI0eeLxxqqxomlCNkg.8jAH1iwYNYMPm99dD4BA71oVF1BAKbIc
 uRgWLhbP8FgeUKXUtGa6jGDYoXELBwy__LRwFye3kblzHXBc_QY7tltbKwi0RR2UGmWmFdzlE4sA
 ApFbNfaA58cVxC2dZIw75iQCiq8GR5fezuF9YsTDu0UxAOzVUo6QY61NOsKHhqbCqTobpDkIeUbW
 0DSB_p8F.T72FGK5jbJyCwCn3jPVBrqq_VrAfS25.ZAAl5EIAff1xmiZb_p7qHlzvh8V6VQHd1ci
 FX8Ltjkd1bcLirDoeTgmKyUBfhLOBXmgcPmlU3LJRVVX1s0zdYGE57O_fq3axPZN_SjlJtTdWo7c
 Sbl07ioYRv.9_S9DDsfdpLSo40venNKgJvYE34livU1ZZ0sGsTsGSh321qtMVaALMrlSVIweikn7
 P2oMcuCCtnTrBiavvNXu.LCeTvB36fRC5r2nFaKiyIxM.9X.nutrsKwrs07NxE3fcAAJNji.H5.i
 2mSf9jHLJKAdKBLkgje706fu2IwdlKN6heNth2Dpf8ZLNc.JH5avuXupwZeer0pvpV_Z7Tkbs0.z
 aklZEbfWGTO6HdwMt2X9R2D8fBRX1xxJkBg1W.zI0Ats34ITkshdA0wHxnzjl4zznCLf5CGbyKaa
 bqarG_XU.AIXnR2aVjKVLM9k8NnB_hyqIGudzA1FoRbo1dlRjpfz163pdO7Br2BZvGNVh5d_0Vhe
 x1eg8sb7GBU5PbjKgREMjCghYLuSgUkppVxYBC5OxyArUuTwk8Dw_uAmPsVqiY8cFseuNihOP3Zj
 HUENWDIgKOJtyMFCXvQ5D7c8enwuwkJeyzvbxPC0BZXiPEDsKhGG9P3iFj.Amc95OcfJaYU.r6Xd
 _ItCNgHAUXH284BzB8aBHqdqMNyNBsQJcVptACVBA5arHXJcDQXwVqASjdvWIx3L8ud.AmThvR.j
 7fsl0ScJxjK4vLHQv_X_OmV8WB_kMzVlLPfmyRGqeXe2eZ0jOQ6C4CWiN0m8KR1G_jYgw_3a31Ki
 GTiVwct2iaftr1xT0D3myaj8ozj.jtKmQyFXb.CJPY3GeSl90_5OG2pwFVPLaw8iCiPQj93UbZJz
 FFZSmC29dcABitDU9HUly0XQ4PCwox7YozWliUooa82pe0fs.51DNtSUUzmCH2vVlYfD6F07Hfgi
 GaDtzSkXFRT5X8GASN5K5Yfit3Ig7mvDlCcNgMFou8boue64IU0Rd96WmQRUaxqIM00yTR8EdNU8
 PxUmvx3pR9jmBvnaTxj4KUjKhQtnqpXcSPnzivmu6z7HTHj9mVCdA9AdROLdXHdyaj2qPs2sq1kf
 _p3jIrxUWJ6q5wY.JS7HBGa1cde8DQhyaY9NeSURA3u.LYbJD_Jzxh5wT.02lv9VM36RFnsmJx1e
 C9OsVlyOC7iG8hrYIRn8p6KWNagKfV924lcJ6ZULc4FZl
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 90b19776-99a9-4c37-9a1c-6c016803993e
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sat, 5 Sep 2026 17:19:25 +0000
Received: from dip195.lsn.ir2.yahoo.com ([87.248.99.204])
          by hello (SMTP) with SMTP ID b05c3f01957e7b76b0689228583129d6;
          Sat, 05 Sep 2026 17:19:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 05 Sep 2026 19:19:20 +0200
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove dead code in
 rtl8723b_download_BTCoex_AP_mode_rsvd_page
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-1-07d433523872@yahoo.pl>
References: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872@yahoo.pl>
In-Reply-To: <20260905-rtl8723bs-cmd-xmit-dead-code-v2-v2-0-07d433523872@yahoo.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788628761; l=1348;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=ALipiPs3ZaL7FvqXJtdM2I+wbzGk3jaazMMz46xG9oE=;
 b=CS4FungOW8Nsz4LTswV/8jnvLaEm7AfQZLTcyaBjxlxxLz2zL27zRndM/z7XoDyc4JNMEA76c
 MDQ4ntY05MaAA37EA/9DJIPaUJ6/vxVzYCQrVhMfwln7f/MESlxcY8i
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=

Remove a commented-out mdelay(10) call left over as dead code in the
polling loop.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2 (per Dan Carpenter's review):
- Instead of just fixing the stray space before a tab in the comment,
  remove the commented-out mdelay(10) line entirely, since it is dead
  code ("Just delete dead code").
- Add an Assisted-by: trailer disclosing AI assistance, per
  Documentation/process/coding-assistants.rst (the original v1 had no
  such disclosure).

Verified with checkpatch.pl - no new warnings introduced by this change
(and removes a pre-existing "space before tabs" warning on the deleted line).

Assisted-by: Claude:claude-sonnet-5
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..d998758f7fcc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -895,7 +895,6 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;

-- 
2.55.0

