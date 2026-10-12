Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032A4746AA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844188; cv=none; b=Jk4nG2ibHaRLZLP5WvxQTgIz5BWU74UgAbjZ9aS7Mzaonw9yTf/LRUIUFOefH3FFFJQlr7iezpfpMZH4jEZFXh/UBiWCcbmbkuB+zRi1uPKmrMguNPOuCtVpqNU0F+bAoWvrMvN2I+jxqPH8AmbTZho3MSL9ODaN5j+Qm8LHfHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844188; c=relaxed/simple;
	bh=gCXOaRk/vTK1DhL6qLIW+SHbOH4P6Jjkw3OH9+v59+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=OF1T0GfLoEobYWiII3HHGq7IGqJ0F/DnLGuB+nY53porvHA1xenkvJqm2WYGKwsYF6h6QNtqn1ob3Tpo1ZSRg+rLug0qi+Jr7iHVFNNx4QklqsTIVx9aLB7mDgmtEYk3POyDBfpx7NCKC5ZYok9cVLYdGISXLOF0XgL0Y8kH/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Pu/Eqi6C; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Pu/Eqi6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791844178; bh=1kalAvIfHRcDXkPRqDq1U6FEwWATH8wlkkkNkAB8hQU=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Pu/Eqi6C2k8bpY2GQjU+CDm5qDw6BG/PnDFN4RbVJdwG+RBT10+IDgpmA7Oq+Ly8VbQdD9yq9FwQ59JotXNlu21B4CnDV9zqHH4JcU7E8qqgnzVrrco6ELVRCp+DGMk4g0RaEDvlpeOSwgjas5deWYM1TsGYcIpUa/W7tvX1ziXN/coHu56aFHLHriIpJC437iB5+SWCrRl7q4AOvum5tAw4aLUMxHlQQ/G0dV7Sxw54Dbyl2n7atvd0F6wxC8Yrw+WVx5D6k08qzc0mquR4W+z0UjgGNUV6lfKyMyNe/UCJgoxFutrSredAPTobMhthJykg4rvEmzp7TmyfALjGTQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791844178; bh=dPut+QXQrwKrQd1l6S7yf684bkbEZeKdvJH070AMRrG=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=NnNmGmg5S8H2XS7oZqzeXoLPeZ7Z56VndVKN1PmQZ/8lCzaDMRUn0W00pQaMHo3X3Nm5M374kG3ifd4mfUHBKZhIvMJL4T9PEjcJu2IZUc70dciHwnYD/PzhD6vW6tSUuOiqU+0edCleFIXgsJx6G7AOhJ/fqLd1j42Rfp0MEhErtSWN+PKDCC8yuwDUQOec6NkvzPg1yqAZGZtx8fOC+2whApMWC8Qqb818g50eMpqR/r9pm3GvEju2K8ad4BOkQxlHhobGRhtQPbfE1usgdzIhoxxQQLsunkZfodqm8xQ+DGCaqmuK/a1GUtz3QjEu/I6vISp9a2e3B4UMNZ8OnA==
X-YMail-OSG: WsPGVZ4VM1lk5rK6O8INNCb4QEKv4quJAIRBag814Wjy4Z_pNv8UvTlYC8wOQK8
 oC1ONmI9jqNUZ2Vml97YYPrS1PYkrbOMRP9bvB0FKNWD2jMhzKk3eTXrGkdfxfu6kFK7XHxTw2eV
 GvFCbUdETotJ3kOts530bBsaVRpKnBEBMCGgQtNXDuYeH4p0yHn4LNDRmFVTZFgJzNDVbLgIj_eV
 3W4BotQgNHmEw.rhWhCc7LxCX4hdNkA3UZnsHLzA6MDhVVIDQ.gLKs.l7Xmr_9YkQdR6uDIA.Xa_
 epBLhDZYPdcBw_Zr1IR2kWI94WjP_dbT91dR4oNoK0Y6lCLUSGtrDu5MzOEincW2JRxuSD7ebbA_
 SrJ6s5CgWdDasS5oBlJ1JtwCi7MVjXxJmtu79K4ZYoH9ZyDAfmVNE6caZb8VJU4BZ8tIua4PyeNA
 cwYX0FYD5qOmQNyHU9_juJZIfQim5sBaM2gE1a0xXljJ0xzNQKXKO7aOvnYkKJKCKwUgN9XSbSxh
 LjiYOoacyJ7Qz8Zyjp9YjlONK42mY9eT1b062lEj359glBG4Q3ZpPkmusIDAU2E0TsmV4c.dWidA
 ZM8SIC9LRxo0XSs1Mjjkjkg9CCc9vepX2eFxsuYyIQ_wSAO3DueamvVibwGxBFIK980HO04yHOu9
 8zV43_mRwpcldbixsr.oHg.dloVDz8DJN_HBBUODVoaNW.jiXUup3yQG3xgMgT2kipcdEIiRGsLK
 6UGQUo7vxOedQOchdVHEN50a7R7jADSXA1Mjqk7o_Srql2pI7TUz1Pqc69NTURmllkufaqMx0yRl
 pQshNX1OcMnsT5tKqSN8FI7WmG9DJ8a0LNjuTWBvVH0Kw4uM01HCcYXxW9eBnW3iIEq8bLZ3ZQKm
 nDN.ilq2NfqX8jDilTkrpO9y1qkuVLqz8klQipypeA2aCVweDVwUv7KaVtuPBQdBVNrE35WNYTnK
 M88kMjBAeO2Nl7BMPIZcMXxcu0ycrT3yLrV9ru2k.JsXL5jiP4XcY24gtofK.8fsFd1qWbtIdRN2
 1NmkPcn9kgYTaeiokrXlbFKZbHPzA1EwhGpmYZ0BMPA3aCYhXPlAd41V2KIOswwqI4H9NSZ2jfkH
 A1giNabkV9EvitU.UCIV2.ubHmQJNg.RCKCR4yLhzcadacgGyOpYXvOdum30PIOULHHKwNS2vLwc
 sajljcqGfENyHnBn4y26BWHjS6XAo9WlpLJ26NxpE6kaUrPt6.KZ_Zeb6sAdAAtyWvTxmJ0Vyd0W
 NY79l61YppTAKSTmrHqi62sgxEEu7jLNoy.mAl.2RpTWLYrpCmpPV5lkmHVhyhuedTzsNGKaTSkN
 asxiOg_f.W9owsf03AVpYO1hTavSKqxe.EFefYETrdzLz3v6lssSrfL8O7aauyZUAXzZYj.5Hqc2
 _1XdqOZlcYUruh3cL1rVLyHmvurIvmpTjdLJ_gflCC4BcEClA8B2rEPCuxpJrwJhLpHXGnOmDquO
 UJ7PNABoufp9Qh76fQticUKd0DhnLZymajmzgua3.klXwzI0NtEiDDjGmNYE3AT6U2Xe8ZXbd4.v
 veMPjFmyGBH4HSjVxYoi_X0COkXwDGucHOQT2n6KP5qKtYMMIcPaI11bgLTCosDRJhrzuQjrTOyj
 d0Tc6bY6_KgCqcUci.baGMSQXdlvBnrg82ftuk0Altdr7s5hfeTnn3Luc.IhoNjkDNZ6Rml26HUv
 atVrnZx_bLEDLIKTKTGF5WpKQATuPbGsa7TC5V33.21oE_l9admAoIiMWnoUfyFQHtFBP7vDyyIb
 YAKqcJNhQwBn1Bs_V8OLKVU89dhNZoBjNfoonf_F4uMyU9qBCq5aQgGhvo.amDnVpuBGA.HFtK6Z
 Kx_XMNdzH1eoPGtMOt.hCq4mLh.RTWvUiRKYx_C8Pa9wkXH8.3Ke.EmgZFw3696S1xbVjewnJHiR
 0zVuUxoh9pq_nppSCgp9hUtVLqJyAGXD..j_QO.2_v6qSKkhFzTVRHVfVdSCip_V.XON5QRxGiLm
 n1ssUXIQkSKoPzQ1DMPJI4njM2qDIDDuAB0w.v_bgatW9.hyp3_ibc1mPT3bbOE_p_sdRZxghPtd
 LhS_bl7DAX6xE4N5is1VmCphjaBQ1Eb8_ijwfoa8NGbPZ8cYb7UJL3z1qVvTdVkVd9RUIRYUufLw
 RIEznecBoYG813GOwfnCfa7UjIWVSlWW_goqYF1jPSuThCIpuFErSu6zpTP6jJIx5DZxUNw4x5F0
 DoMzJHrJOkA9zsRw2AM1exAuNggsVjLe4ueww.GQNvxvt7yE-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 63af6003-ef7e-44ad-9aba-94ad906a4aae
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Mon, 12 Oct 2026 22:29:38 +0000
Received: by hermes--production-bf1-6d6877594b-hmvct (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d1b8cc93bac081ab1177366705bb57b9;
          Mon, 12 Oct 2026 22:29:33 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>,
	Jeremy Dean Clifton <deaner92@yahoo.com>
Subject: [PATCH v2] staging: nvec: use guard(mutex) in nvec_write_sync()
Date: Mon, 12 Oct 2026 22:29:26 +0000
Message-ID: <20261012222926.7754-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261012222926.7754-1-deaner92.ref@yahoo.com>

The three return paths of nvec_write_sync() each release
sync_write_mutex with explicit unlock calls.

Use guard(mutex) to unlock the lock automatically on any return
path.

This removes the three mutex_unlock() calls.

No functional change.

Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
v2:
 - Reword the commit message to state the motivation and to make
   clear that removing the mutex_unlock() calls is the result of
   the change (Julia Lawall).
v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/

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

