Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345561;
	b=y+tnKpvuqMFdEUtkr7xp0ktfYZoz8G8I77l4qW7P/7Eg9htsnCZHRFUFnQUKkg6g8fmf
	 5mRqr2XhI79iU0YuFoaIqxdwzDUoy5xrwVRKdyPXrEEP2BDr9JG4AGd8Yaix+PltGJHi2
	 doUl2RlpgOYfN5MkfEy7CFmPGTQ7Wg3AgAjgiGM3JhQz+OENSAlUQMy1VmyF0ofel3azj
	 FhYXt6tsaT+dcD/XAIVXy9QK/4mEYs08ZN1JvMnRbu5+d7XsoSI/BfsEZtlO8oiiocuZW
	 YwgRlorp/UDMSui50gj6CGFoZTEs+dxOfW8RTYx4hG9etBE4cIkZu2zlWkR/MvTe5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345561;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 References;
	bh=VpcLYgwS/PX1ShnTKnfV2h0X6i5pERvbSlRUrOK6K7k=;
	b=UhuEGj4zmml9hP1+XF8YULREvnXSjkPIKxXy3P6e5AgaQVqMUOCft+deMliGkHZXCzcY
	 BVogHubGJx8K02OuVlcIwWYZ5F34CDDtw6qwOoux4jtVN1OvdsTeE+U87QgV9NNbz9Rng
	 321aLnl8bS96F+OA+zgv0d+IHhzXImI+NodD5bf8CoE2nlQ5JkmyW9OJiSjOhk0P0vHRc
	 Ef9X53RrW0kjYsaqMHq6J2ijRiOa/HLZP8V8XZZ+PevmDdgdq2P5UeHg32KH2YdwxxG/a
	 1jQQuPQvCGOH+pBtl6A4gus4nmZMsae0ciO0ZzCtn65JTqU5bu70xSChiV+CsXPfq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=d3xwAYVc;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=d3xwAYVc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794345559; bh=VpcLYgwS/PX1ShnTKnfV2h0X6i5pERvbSlRUrOK6K7k=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=d3xwAYVcmGYwroBM6k+ZOLiDWxHVQMGSISPynr1Dx2qdAB2rQCvzK9+CxpvIamZuLkWfNUWPXB54kopjVEVkRUUTLUSEavpI8oxM/JulTZ7Bs22DgfT1ryqaDXmn3DPvjTZ9rTejMOZeGLDjn75LEjOxLujH3HXnp717gaDGuk1t+fUK58zMZ+XGiuePmJAl6tS3a71TveRa28Oel9QbpwfwydpfLxapmwe2u+iXSXIGrhCfn8iM/5k4A1Y5fm3+gtG9bcHKsOpCtZBJz0AgbtHKmMa8D4rqaKQ9Xoa7di083EgK1GXUn5Oa37XT+YRadSrk8niXe3jVOtllZBnFaQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794345559; bh=51YrFdxi3Prycdxvw8KMZ7ffDiaFkmmDQ4wwxzWLICE=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=D0axbtHYMyg07kZTJDzipva56JU4Y0levtQbG7ywc5l8gClFNY5R61PucjybUK+O3ubv9DJp1zVcQA4gQ8vRvBF5+r8LsD7NC6Ju2FYajjmZv1Z4xV1j6DpQXG3vajjRO8eed6cY9Mcmq3DiWaTh31OUzK5HDanI4u/sQYMhfHQOE3ZUTEhDFQ0zrGaWTTJJdlwv3Yb8l9Vozvo4ZJrfcr62MrkWjp4/D9VstBy+ZNm9s97DgbvYCCQp0Yq7cJgkn89m5XEnzhz2AcjHAdCR7/EeazfdZTcXIav+S1IH7BxRtk8NBWycIh4xkkWhIJPzFXrm/sqhPzz3hhzhvVz35Q==
X-YMail-OSG: YdG1UoUVM1mnVFaYCmrrP0wZC6W8NBNJrMC4ac6CLSCefxeUwN8UNIBuoVZCEtg
 TUhKZ9YKzmfOVdDgbQPKPAsRHIWhTH78qiQ6o68XfzzCIhv54xlYS3jClyQ1SxsEo30ZLYV9row_
 iuwfyO4svMI4fVLLRX_QT09eXZfzUB7h51tmrMtLZyk7AA7Vkn.Gv2TH8OYHkqnwW3NXbZUYmwSs
 WlApaOBVNkCaep0N5KOSqti504C.Jf7BO1Vdp63NTzvLMtKAS09FDwLEbryzq_34zR1Fzej9mrYG
 aIOTK8XNvEp.Hzr9L5eFMVV3VM3Sba3VbE4C1kGxffCum8RXSaRsjaLCmMqIqJAIpGelrQmVzbAl
 kZ_MFL_m4DFLw8OBg563bRg4LmvC3G05k20iLXKpjg1sq3dYl7QmTFyFjchWtMZR633I8ekIwxeA
 r5ajDp3wjGDLNgGZuPuP3dR6Ayd7d2O9Smw1mFVCnCj20rsFJ9bhBR7G6CLs.7EJUlS6iW9gD3Hb
 1Y.uwEWbdPjw4iu_CRiYZ71rxrDtkFO51rvelERoGR7DHZWkqvKqTo71NeY1lkqAP9AmQgOAcg2K
 rDaau31gPvvRg6OUxT1DsNtlP7dQHu5L6lle4CKIjvSufLZv0nnZCsbt81zEHHEaiZ23GWhY4Pbd
 WPukamDzZ7ZYWbPRhgqNno6kamZm9oor8MRtoBAaEgetuPgacfeBkN0dpBUZspokrbGfBOWZQxbW
 TtUjkSrNZCQPZHK.TWjr4ry3VyG15h8TnpKCjrB3MozKYbFKGVSvbGZvZ9cShfCX7_KG39k6OiVT
 irlHwZwzMdM4mBK_CQeLmnteuC7XaFGzPmSXGaGmbxA77RNVNIWQ7sKtpET55rjZ59fIZreLWjDE
 RM3fDGa4FjB.NFGSzg9.L3V82PJK2tKJsNt5TjdMumHl9VgZ2dQSMkNzTg4tg6rePE1lttSVwu6u
 p1ChJxvIalgzQ37PvBq3GlKPbc50mqjnAIC5gieDkAdT00s8uJZgwX8NjO_WuPaDV1qg83pEOARA
 uNZpCI8j34CkyNCkDdd_N_NEuFfzeqJADsWQHfYQYSWUVEzIcLe8RNyMAoC3W6U8zQ1SdFZdbRhm
 BXDZu2nyf2Eygv7rt7MFqE.NKVuwHyWaVHox08pSPSmUV56E25Rruv0OSct0qh9PKBl9D3a5vsSF
 x3SXA.wnZ_bMmYxOZklanMr7QjHYebC8rCNcypNyikU_NDvsVOxO5p.gfLh70DSIEMEDAwFQfLJQ
 HdEyM4moTF0lLNu4XyOl8l3Z6MVsR1x8NYsnsVucvEzwsxDjhUT9ITFPtx7I4kg_QPabvHFK_vfh
 IHs4cZZ5Fa7WWBUDRdtBhxVsEISKLwNKlLFDHjFZsdEVpJBJLoY5OiolqinTCtNP2gnioUQnWXay
 5mZy0fUrNhoth3Ntpyz7_LokgcrFFnoEHVtC9u_aXhAeSR15AMlF78nz3j92vSYDTPGe6jt5_KyU
 Q4gdzTt22uDMcti5VvmrcYZW1JI0_jXbblTJWWCHXOZDs8pVwTX9VP2Gkyyo7Evc1twpwEzgVkrM
 L26ws.YFvH0yC7lGqfJLNHolPT6Do.2TBbP_Fcu_KFNJ1B_M8Hh9cx9YdsTRF2R94jTUt7O0.g_7
 ZJUPPjIkAYkaWTAVMONCDF1upWQHHAPsQh3HqmUVnrAXZm0yYf_Dvj5meiCQ4VMt1byQhIknIKmW
 3DZRnj9t_.H4fYtUfyDR2C2CZFgCsRdXBkuGC63JnMvFksyE1O4KhPtrk0_aKXGwj4bCrzv3zkbm
 yOIhKk_V1o9Hb8GebcCDqf.v0ELMNYwoyueSy8QA0zU6DjaMS8fV21h3i5GfbBaENXuYIppju1vx
 gnTRFeZuWpESG6U7mEeng8SMbEqSUJLEZ1jokX_RedDTMw8lvHzH8VZB0.pGaurnXOrce4qeEF07
 qB70kO2gbEWT0Oec2n4ktm6aj7H3hzo4fy5VImufgsNF_lQ9D_aVUzt6FKz_s78DTUKR7mqxTTvf
 MUW6MZYpx9CBu51P433tL5enBkfyN4oIM
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: d2fa957c-0ead-4eab-81cd-4baf9fd6782c
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-103 with HTTP; Tue, 10 Nov 2026 21:19:19 +0000
Received: from dip25.lsn.ir2.yahoo.com ([87.248.99.34])
          by hello (SMTP) with SMTP ID 03cef679bc453ba6e1b10609214e8ae7;
          Tue, 10 Nov 2026 21:19:15 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Nov 2026 22:19:14 +0100
Subject: [PATCH] firmware: raspberrypi: Add missing kernel-doc Return
 sections
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
Message-Id: <20261110-rpi-fw-kdoc-return-v1-1-ea77334d63b5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB3IiFT0KuJCk4lOC4lMtC2Id
 2+sy7f4/4DEKpygKw5QfkuSGDKoLMAuY5gZxWVDZaoHERnUVdB/8OWiReVt14COGppaqn1tR8j
 hquzl+5/2w+20T0+223WC8/wBhlmhfHYAAAA=
X-Change-ID: 20261110-rpi-fw-kdoc-return-d171b914f4ca
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345554; l=2837;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=RocfDV3azCnjucfftjAZPZe8YGko7H2P/b4rxHKfH8U=;
 b=h2QOzDW24W7rG41ySRcTZCNWEtaG0XaPi1AuLa58B3EP6/wX8AIeb1IxJBnLjJNBZE6H+Ohq7
 PyWe4wKd88HCJuV6Nwd+qBIuFoZe8JOvwJHAz0eR5TA6DBhI0S6Yg9v
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261110-rpi-fw-kdoc-return-v1-1-ea77334d63b5.ref@yahoo.pl>

scripts/kernel-doc -Wall reports four functions in this file with no
description of their return value:

  rpi_firmware_property_list()
  rpi_firmware_property()
  rpi_firmware_get()
  devm_rpi_firmware_get()

Add a "Return:" section to the first two. The last two already describe
the return value, but in a free-form "Returns NULL is ..." sentence that
kernel-doc does not recognize. Convert it to a "Return:" section and fix
the "is" -> "if" typo while at it. For devm_rpi_firmware_get() also
mention that NULL is returned when registering the devm release action
fails.

No functional change.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/firmware/raspberrypi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..61c0e1f7b3e3 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -85,6 +85,8 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
  * don't need to be supplied, just the actual tags for your operation.
  * See struct rpi_firmware_property_tag_header for the per-tag
  * structure.
+ *
+ * Return: 0 on success, or a negative error code on failure.
  */
 int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size)
@@ -148,6 +150,8 @@ EXPORT_SYMBOL_GPL(rpi_firmware_property_list);
  * This is a convenience wrapper around
  * rpi_firmware_property_list() to avoid some of the
  * boilerplate in property calls.
+ *
+ * Return: 0 on success, or a negative error code on failure.
  */
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *tag_data, size_t buf_size)
@@ -373,7 +377,8 @@ EXPORT_SYMBOL_GPL(rpi_firmware_find_node);
  *
  * The reference to rpi_firmware has to be released with rpi_firmware_put().
  *
- * Returns NULL is the firmware device is not ready.
+ * Return: pointer to the rpi_firmware structure, or NULL if the firmware
+ * device is not ready.
  */
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 {
@@ -405,7 +410,8 @@ EXPORT_SYMBOL_GPL(rpi_firmware_get);
  * @dev:              The firmware device structure
  * @firmware_node:    Pointer to the firmware Device Tree node.
  *
- * Returns NULL is the firmware device is not ready.
+ * Return: pointer to the rpi_firmware structure, or NULL if the firmware
+ * device is not ready or the release action could not be registered.
  */
 struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
 					   struct device_node *firmware_node)

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-rpi-fw-kdoc-return-d171b914f4ca

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

