Received: from sonic312-21.consmr.mail.bf2.yahoo.com (sonic312-21.consmr.mail.bf2.yahoo.com [74.6.128.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA73BED61
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.128.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825829; cv=none; b=rSYwONXUIDxagdV4n2j1yQaVPdQwi372y4VKv2afaszJfr0wAExZCekIiwBLfS6m+II7T3xOZS1cRbk5c9QDoeZGxzATnMDLo6VlX+6daFwINj9zU0EhgYQdfmqpySmCcLyDfQL7gO7bzVpVtg0D6DLOP+OCOIpvLCVeYPSonEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825829; c=relaxed/simple;
	bh=Qq5lg+/KK8RrQalbUvmh4PsXiH2MEbm5xlw8OY6f0zY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=Su4hBuGjMa2sODsSFVpdSXnKCfphe5cyTQ+ZBtZxY5LrxCtewR7oJHFtz/gi/ELAFHFMkihh1CBJg4AbTYvQe4gxhvsDstwREe3ev/qjBvSHLcDxuvRffYAhik7C9GFOtKf6ZtJKluL5wxmTrrw7v05qQvZUoK91f3OP68/TTAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=hOmaBawH; arc=none smtp.client-ip=74.6.128.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="hOmaBawH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791825817; bh=aiPGsXoHuTrTDXi7HMPlxUVp/rFcxDZgwaZcH8dnfDg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=hOmaBawHs/0aUokdp9Tz1vuGuSyKjYmxxImM5Sj23VB7LTkQeGOsrmlZ9NLVmZZhUXLxfdBCyCfOhAA4y3pN+2sNXadiWQ9RBACuL+akhNb2rdICwpiIN3HTuwzo4ipmKyP8ZaegzfA+a+muApAnozZEx+e/FoKxRGLlq4BOTPrheBwXUTmwuWMz31i8l7cwN7dToioNOxDEqbjokMRzFIBhp4/FcjdcDYNhuZLeKjJBnym3AyG3nYwiJUkH/VAPUU90ls0vzKndKuT2NiUPC+ATgFJLheFS3EDpVAwve+lpr4YVBHKn2BJfQaFYa3xAICl+TtkkNaBfkgafbKNW4A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791825817; bh=W6dJMTeO+yLVTFvK6yBqPPq+uMWyDEZToQxY6OHcqR1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=apLSwxNXUNyHhIELUBslUrYd3XLICKF4L23Bv3quAx70Rq+fc2IaAr+3ol4a3c17Dxut2njlalGsVLNFf/SrlYwOxTLGnP4bvb9xNDVmiDtI0FJP+DEEs+5C6XKZxwvR9ktlkUYI7GMbOoIQHdE0s57i0wBCX618GA8snEWDfJc9d2DzTvnnj8r/puB9Avdag1DQmnxVOhJrwtRocKfbNO/imtbPyVm7MtpE7jNzTJL6q2JKxBtZofsKZofUF+N3MGXh62cRWmKs4vGUtKp6G2z8D16gxjT1Qbu1joukPur74jJXJKqd1wlRvI0aB3bVQK03LTtyLHSb6PQlLhOvVw==
X-YMail-OSG: VdJdwSwVM1m2YEcr48bWkairBpFdQ5PWU0IVp2aZe9bLXz6J9zlBPjiKFh2DzmL
 yDH7a3ejtHaYg.CX20rCHtcB0l5m.jDz5zbkExFJ2htjwT7sK1b1C_j2LVBaAsB7XbGb9ao8kS2g
 fYvufSiGbqnS0gQxiD7SSnaPjExAY44rY78uIHufziiGHzGAoeKfCL.shATDhTTnwZZh.iTq59Gy
 atxWh_inT_876vQNwrXpc0Po7Fa3Td9iz7xaRkd6Tdv_BwRjbq83H1f8VaJ8R4_F.7O6VXfA8d5n
 Nos8_WVChG67qL0ZD4jWai.WiFsIgTIw32Lgc57zJa_kbLlWSkODoPTNQPc6Q8u0iFYP4DCTFUX0
 SgJaWAYHQ7EVXG.qLGnpQpCcgUSYGAoOZmUBKcxevJmpX4x.bew9MsaVqCefQwSsP3Ah4QlGpSER
 Fh69tNeLfXdoX_BGGZQxH5rVB3_nrNZyHOBvHKZG1SCnMl3YHS_fn6oglmxZBQdhhplEMfp3X9El
 QOYAkg6gf8R3_cu1mTIj8gtmt0M6a3XIhgy30VxnJ1SQ53hNHCAH9dEFDazRxiHjEfEocvbUSNm8
 rb.vbI1EWStrO6tL8BY4snMxH13.tReSJ3dZOtavKpnE8xQh0P7u0XbTHZj48AQNJAN.7DnP9Bmj
 El8vE1Y0Qmh0bCWvqDdWNXQxSeKMWuktdCPzbQHokBxbsqD54yZwkQ0kgfRieFx5uCTmtgKD__ew
 eI2ak6f4X9BFetaIWLXWJ81oDoya5g1WarypZXAa437uJW17fq0Cjef8mkjvm40XmbTrBg3inpzz
 na.KaLk6yEnAFb6i96RYn.YqG02zakdSTOwllGLMUxnm3PgQ9UGgh5nPngcHyH7QxlOizY84Mkpl
 PxwzV14o5N8Sd_P4vD.W_tx_JGTdFaO.fm6l5e2AskDUWo5wJyiq4xz198ggMu0fpLES8EJWgmfN
 PN_GVRyviUF.Ja0xGGtzioU51ddqeVY7nzh49rFRKSVdADDGMc7Tg0jTYhF6RH7GpJZ5ke9ZJAKT
 gHTx4xgjXYYeUvcszeU_71bqLxkkH9D_qo_1JalhIv_9Oir2_TNejlWq4nksVaeJZ3uXDvpLR4SB
 y.RtFrGtlW9nXsCmFeSJYjdmsJZ.kG1.8Va8o0Oxxf1FQJwNDeJHf4lfwkz41sWIzZo.SW9u_4Hx
 ...CZm_EoKm0jJHaOa2Jin2jLkjXfGl14lnGuKNFjlB3B_6Uh3c6lCkPsCgh0j.Wy6emiMc2phpc
 7plhnNYRHmcxrHhvh9n6bMrHcLSfiKQj_85UvVhDIOrz8MMazrP6YpDBk6VASmh_YFxW9Hf6nqnw
 3inKEnUhsDejGKROT_csPqtCI9Mq.E32WrR.FgsTFkyD76B59wXSUjikX8.z2LGRgtiScNH7UF8_
 GFHDTUOtxqel1h.r77FQiNRucao7m5WV2qtUkq0xQoxU66rTnmOgcAa24Le1WTkaLa2NXRggS3c7
 p8pNgCbsE7LcqlsYuCxR5h2vJgtIDSiJ1HVtC6wm41.dfwlayJlg56VY5R0Ka__gZXU85s7z_dyW
 Z5vjDR4tj3tInDPAfuabQmZFTcfsUyxJmLPgAKrBx3AK_k.rQkL1OGSGzA1UQxlqWQh67O8gSccD
 440PEMK8JDIl.NTGRMtvsI.nB4cIdRo_jEsYdYF5NArfROKo7TXXZHH457.r4r5qWqVs86LRac9U
 xFGwNGc9pXv0KGYYtpRiBppwF3JrH9v1qYS2aDCAzuZ455_373snXLu7NpgU5NIHFqaCrD8n2pnu
 fW1d_OggrOPr44EsQ8Y7_h8sTN1Ur4tozCavxzHswcaup1vjb.yLjGJJKnrqTPio6T5FqGm.pF3w
 OEFdn2mCvgbBtyErrH7AB2gR7JdTIpKaY2rWQ2mbUWrTz0GVIRF4iRwnsz.tWInGYHOzpeS4uPBd
 F7.a3UGybDcIA2h5bEMkMR.XQF2GpTZNewFaurW07KGZtJizW__He7pr5aV1jCwE4SOSA_ormPK4
 dL7.EdwrVzJnYtVMIjIclfbkElSG.IoHPziVfOVEUKNjxrCcJgL2oJW55lYM_aCIEGln940mUf_0
 px2kBjIf1HxHP5qZ85lq1sTHbBlKYsRknvcvif92NjgALlJR0xD8Rd1k5S49m7ZGP651AbjitXb4
 psiqY4mAuzXG_1ytYxXj5BUk9Pq0WPeNcFV.BptAoTU970r8Y0QvGp7JHsGDVRkWnPl3HNBMq_hx
 y8I_d7c9rbKYOLS9Ld8l4Sn8fne4HlaT_IeGflEEDpBs-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 0b8be0f1-f212-4fa5-bb1a-6c7326a34fc0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Mon, 12 Oct 2026 17:23:37 +0000
Received: by hermes--production-bf1-6d6877594b-ndv54 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0063891ab483cbb0d918918136582532;
          Mon, 12 Oct 2026 17:13:22 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Jeremy Dean Clifton <deaner92@yahoo.com>
Subject: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
Date: Mon, 12 Oct 2026 17:13:12 +0000
Message-ID: <20261012171312.5998-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261012171312.5998-1-deaner92.ref@yahoo.com>

Use guard(mutex) for sync_write_mutex. The lock is released
automatically on every return path. This removes the three
mutex_unlock() calls and simplifies the -ENOMEM error path.

No functional change.

Assisted-by: LLM
Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
 drivers/staging/nvec/nvec.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..716b1b482568 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -298,17 +298,15 @@ int nvec_write_sync(struct nvec_chip *nvec,
 		    const unsigned char *data, short size,
 		    struct nvec_msg **msg)
 {
-	mutex_lock(&nvec->sync_write_mutex);
+	guard(mutex)(&nvec->sync_write_mutex);
 
 	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
 
-	if (nvec_write_async(nvec, data, size) < 0) {
-		mutex_unlock(&nvec->sync_write_mutex);
+	if (nvec_write_async(nvec, data, size) < 0)
 		return -ENOMEM;
-	}
 
 	dev_dbg(nvec->dev, "nvec_sync_write: 0x%04x\n",
 		nvec->sync_write_pending);
@@ -316,7 +314,6 @@ int nvec_write_sync(struct nvec_chip *nvec,
 					  msecs_to_jiffies(2000)))) {
 		dev_warn(nvec->dev,
 			 "Timeout waiting for sync write to complete\n");
-		mutex_unlock(&nvec->sync_write_mutex);
 		return -ETIMEDOUT;
 	}
 
@@ -327,8 +324,6 @@ int nvec_write_sync(struct nvec_chip *nvec,
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
 
-	mutex_unlock(&nvec->sync_write_mutex);
-
 	return 0;
 }
 EXPORT_SYMBOL(nvec_write_sync);
-- 
2.43.0

