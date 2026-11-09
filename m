Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266195;
	b=PQybIkHuvlmjZ2SfovRRR0givv/utwMOWAN8mRvBFWUbOS7Q42xzRH7zbiu4r/xDQXYL
	 JwDOEljXnYaeGWZy83tBqWUiFGLRIrooGo1cIyfi9wXU+WlHn+9d2Ld6l7ns9sBzH8bJQ
	 xUxyqw4YILu1hugmvxAbQchtFHqAg8hrBdNZaFT5efieaKbDb7EtSpK7H4OClhKdbWFW0
	 erMAbm0J6JFvCCb+VHUrvauEzVqXFgIIM31ufmUIN2ORztQOiBNPin3BOaFNUACFSWNNc
	 gHA6kQXGBm6CAi2E3z3AvDHac63v4eCLLvWDVNT++s+lc0NFLlG57jmPdlm6wMagTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266195;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 References;
	bh=ltnr/+G+3z7GhzFVAEBSNNIy+NSu2Lv4d3u3TtzEZtU=;
	b=eBWbRi0TtWikNWu+dO+6IdifJ3rgElh8gRcd8VhuzNbnnIGdnUubxRKvM8WSB3ganSha
	 TvNynNDgYFzO8xPgc39xLyPXNcwlJqpVBkT6olKMnxq8Kyl+TjAAaVUaqS26ahJeETLyI
	 07yTaK5vJP/WG7Dy9xpjSvk+X/CkmL2HwVooDTvUxbn4rQInPx9F/yyxndM23QMbEwkIz
	 Cy9nVhTnmaOna6YzrKmiFF+p/frRZWBbzBjcggyVACMP2dfhsq8JIUog+pSCOzlUiijDk
	 hVc7jo5zcy5H9lOdvkKe4ev/1HYmboXryLaSEU4YW5Zn53xM4P9/NN7NSSEgsN5IdsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8F606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD8F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794266187; bh=ltnr/+G+3z7GhzFVAEBSNNIy+NSu2Lv4d3u3TtzEZtU=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=kxHFFzIFI9s+fT2cRQiWF0EV2klmDt9uTiUbl94uKx5arcZ3JfOoSQYaXlXIgAYwgVP8TVBDCZFLID7Xm6F1gm0NUhz73kWLHRp/rHVC0Gwz3n3VKEaqAkn/6aZM36isosKymDATCuk2iplJy9q6qss9BSpeAkUYiYVjCzniOt8ySSEYf+JCqX/+aSfb08v/XdEQlDccX649FwvKpX7duk+zOhAj1BXSj8we2J8cuHSctbh7JkFnDLzkAJlARte7FhUxkSxmK0vtteAsKgLHsfAE9O1JhajBBx4ma/u1b8KTuhNEIine90ZB38i7ELBYNdp10R7+wgDz80VL7Hqutw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794266187; bh=ujjZToLGF/dNgRfErsyg9RSGiqWvxnqDWgUYtKWrwla=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=MdmLwmEDvwjvkg8E21jh8BkQamV1RCMgQOxWoBEAXIMJKa33bte1Sy+6R3Tgh71WGKHxvcWDBKFtIuCQ9jqYfgNI7cqp0qSlW0u5qLveF/gzSdaDdHOh7wPlgltwvwanjNBUiddBdrrIrTZhI/Y4ZrE2sXyBa1/IIc32vEpqZgNPFlJiWKaEoHOMngTfcnJspOesUVQLEPsi5rpLEPNOMu/V4GioNoU0zYHmqmAKqGXHkO1JHhYZ0kzJm48N/6PI+QAxDm3pR3VHfhPVD6eiLZeVf+BpZJZk+ygeRE79bse7HkXO1ehoD6fxFwItLxASsW0TH8SXet5mfFORkY5iYA==
X-YMail-OSG: WSBXLAoVM1kzegwyILIQ4bV70tIvWNhLI47AQ.Purmnegym10mkmYYKfn0IwFQB
 CkFKdTgKdqll3SgCXbR2lAlEMUOnzhwxaaukjM2_iTdWYLOphjiHTKycARpvYPYx027D19MWEp.h
 adAmHWO_zZHQF7Kui47c6L52IsSB5CAFeNFyaS10torClpaZuMTn4vsDjcbY69N8kJEC3QYFbaqb
 TlYHzqdQSZESiqaFJ_ZvLrb0VBMROAaIKQ3DfHth8j0gVXCMsik6WXKLBDGNl6s1T6mAYNkqzopq
 H20W6GdeL0WgkEjCDS8VcFfByXRSn60BHiggkDDLhPPlPYr32LItnHGehnUT.ApmckXtHU_H4d_A
 5F7Kc8bLG.JBL6tXtdeYWDUyQX6csoVrWlyAqyMnA_KvG4HX0HKwMV2pA533vrHtDhTcNwzjmduI
 biPlClb9bDmSmtAgOBXSn.a7GTN0cQ6zclZMFjLngCQKOTF9JqERQTcPBtXFrV1fvd6Ic4TudmzN
 v9LeeO1LRrd.Ev8teEH4KnrfS44gpRyMFXrIQpzTvrDDNzQSf6.ESgAk7oi8I4G_3pLD_ICZ5y65
 AcH0xEoD4bowoPHKcaEXXnuchQeEVMrieSdGxJzuJNLikOpFJdzVdwpNqL2MA7s.DPKh3KneWc.D
 etK9ZNIFujdi.XSnZCv4tbNG4lDSvm0LAtMVq2P2BBM30NNRDdZ1e_ODPLsN7OchkFn4x.Pkhys9
 Yjj8IRukB_u.FVjlOSxRYuMzmBTE2uv6oGI.wSCk1sfN4BBFemKkyONuiXGvQPt5KJwoDZGKkFjD
 Cl.Y2MxgtS0P084r_vIJPUwOTQiJ.Hep98lTtonxZbVnv8uAFFB_v4T7W7N70PS3H8fC5Ezzo0pk
 au_.Pa9dHtMkz9Lf66uCUz58KjHBTBsSyTQbUimrIkMLcCEpxVEb8.Lnkp49yAn_wI6XsSyYQVFF
 w11IGjQcGVNjQTF6uOhB4KRGG1QxrfrLtUTTPy0YkQdRrBt4.yF6JeY0RyMd7kxqyKaLeeu5i3Mx
 PuTsxRv.t9Lb8Zut_bVz30Wy0tfBBBRRRCa3ZxZ618KWINpG4w9auv_KPR2fjdp07RxLHorT7258
 Q4_SSTIv0z6tOFFLvap0S1hppgOP6MgxjLMkxnLuAqpJRZb_.le31t1ZsgguSe3X39Bx6w.r28NM
 F7Goy06xRFfftq2OmM5cRtBXzkJ5vubOLHG0iNNtSXU35eBPB5jhxLperQasEEJrhAl4LyvSDpxb
 ey0v8g3wLkEVcxNF1VKh9wxMqVTYM3r1zhrpXVj8hK3ClupPO2y7eGsskG0WCiRo9QOrNkJrNfse
 BnKOcdpqYlE42RGSY7cyndJQvqn1Q4P9YCq3rDjgD80uFJztjn0ljrC5b6rElV2qdYnyvjG5u9_1
 EwQ05og.e0N7vEmZPCoj2RXiwqdD6Rbm592hTYHKo9BkW36ICbOajLUQxlnGOqvHao9cUUDOvvKp
 KKF9B8emnYxvf_sriPC2kgHKO8SrhuoBlEGNYPq0t55XARtH.EZY_WHYndT8HgHNgIUoaAXWznov
 xHeZOrGXoJQL_jsp06ZH_N1_0LY3_X4a50gjx5srUNRj.rafBq2jK7rktWgeU0hFAsjwoHjNfaZU
 iznrmXo2bv9ynEFUM36I0az398EgIcRhdAM6.yIUJEC5BOUhAccjePhbfDMNkIoWhXh_eze1cFxy
 4A5uoZa5KimrJCusy5Xru4yZBN_vU_YVyUSEzURm8b.ElLyxj1pp4KW1NGK3CN22bfBMjJ27TNSY
 Q7pjatwEyJWaVNWXb2Rwo1TQ7c3slosWYbHI9gavsqbNt_JJlBuiiOBHsMDcwqPgNTvdenJ5Hbcr
 Y0duLk92idBNc9MA1l2U3PfS2CK7w3_IJfChF1blRybaMLxFUmDDHfIJ7JlhgQcUp24TGMdEqynQ
 d161Ay1RLE4BrfZX0SJEvta01vmQv9eUstCjMY89IsfAoN42oqH7HEGWpvrx.YO8JSXY0VnM.Yri
 YpfcfP4hzuC8mVjDWIvHwY2I-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 8f642e59-6e65-4565-a8a9-eba782ec6a9d
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Mon, 9 Nov 2026 23:16:27 +0000
Received: from dip144.lsn.ir2.yahoo.com ([87.248.99.153])
          by hello (SMTP) with SMTP ID d24e8f6e67628daad9045ce19de4aea3;
          Mon, 09 Nov 2026 23:16:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Nov 2026 00:16:20 +0100
Subject: [PATCH] staging: media: av7110: remove commented-out code in
 av7110_hw.c
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
Message-Id: <20261110-av7110-hw-commented-dead-code-v1-1-3ef26d2673df@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSDgsuvopxUTq/MiYU0yKaE
 N7doquTb3M2ykiGTOdqo4TVss2xQE4VhdHHO9i0mGpXNyLi2K/tkfHNYZ4mxAXKCq+FCg591w/
 iusa1QuXxTLjZ5/e/XP/Or+GBsBxT2vcv1mReLYEAAAA=
X-Change-ID: 20261110-av7110-hw-commented-dead-code-c989b1086071
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794266181; l=2420;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=8L0SKizL+Q76ZAVeVC8cUXjbPIjPKGIzYD7kON3gByI=;
 b=VIgdqiaP729AfNuiNU5zXY4DYf6KGLEQ/aE6L8JoWqUgBLZtvxAw+T4c4U08pZ/uQV/fPliXh
 4LrABBUUhPdDw8VB1zpCswjj5ewzw8qCWjQnOp1Xq8LpBNhazG4X55Q
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261110-av7110-hw-commented-dead-code-v1-1-3ef26d2673df.ref@yahoo.pl>

Remove commented-out code from av7110_hw.c: two saa7146_setgpio()
calls and an ARM_ClearIrq() call in av7110_bootarm(), and three
dprintk() debug calls in __av7110_send_fw_cmd(), av7110_send_fw_cmd()
and av7110_fw_cmd().

All of these lines have been commented out since the beginning of git
history (Linux 2.6.12-rc2). They serve no purpose and only clutter the
source.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/av7110/av7110_hw.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index b0bd7666d48b..13ed214e6ef9 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -209,8 +209,6 @@ int av7110_bootarm(struct av7110 *av7110)
 	/* boot */
 	dprintk(1, "load boot code\n");
 	saa7146_setgpio(dev, ARM_IRQ_LINE, SAA7146_GPIO_IRQLO);
-	//saa7146_setgpio(dev, DEBI_DONE_LINE, SAA7146_GPIO_INPUT);
-	//saa7146_setgpio(dev, 3, SAA7146_GPIO_INPUT);
 
 	ret = request_firmware(&fw, fw_name, &dev->pci->dev);
 	if (ret) {
@@ -248,7 +246,6 @@ int av7110_bootarm(struct av7110 *av7110)
 	saa7146_setgpio(dev, RESET_LINE, SAA7146_GPIO_OUTHI);
 	msleep(30);	/* the firmware needs some time to initialize */
 
-	//ARM_ClearIrq(av7110);
 	ARM_ResetMailBox(av7110);
 	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
 	SAA7146_IER_ENABLE(av7110->dev, MASK_03);
@@ -303,8 +300,6 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 	u32 stat;
 	int err;
 
-//	dprintk(4, "%p\n", av7110);
-
 	if (!av7110->arm_ready) {
 		dprintk(1, "arm not ready.\n");
 		return -ENXIO;
@@ -430,8 +425,6 @@ static int av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 {
 	int ret;
 
-//	dprintk(4, "%p\n", av7110);
-
 	if (!av7110->arm_ready) {
 		dprintk(1, "arm not ready.\n");
 		return -1;
@@ -452,8 +445,6 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)
 	u16 buf[MAX_XFER_SIZE];
 	int i, ret;
 
-//	dprintk(4, "%p\n", av7110);
-
 	if (2 + num > ARRAY_SIZE(buf)) {
 		pr_warn("%s(): len=%d is too big!\n", __func__, num);
 		return -EINVAL;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-av7110-hw-commented-dead-code-c989b1086071

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

