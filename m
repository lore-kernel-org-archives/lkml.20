Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780671;
	b=SW6o9dRSHNbGLzyFz1Dc3RQmPuWdNQAow/BbowyCqB86E2uLLtSIs8F5sjkrXhqxWOWv
	 G3z1GmtDwzlArZM/x31DUs1IHIsb34V+yXBTiwI2nHEP7AuJxxffEFRIJlFqHLMNNaXDn
	 iKiU/GhZrzvrdlv5r3XJsTd+6NOf8xbeGzFXcIIrKgDv+PMgxTFgRomEq1bRnnTfU6F4Y
	 X5JNHcjEnoi72rV+QKEmH3UhWJRzI1Fo23HQkV5LVUuMTKZ3VlJWRgj22aW+vRJ+6O98Z
	 YFkTmy/Ip5ZkFgL2XEPEIpYlabdCvm3HrCoRrZXq2UcOLRI7jwLi2sbZMBYY2Io4Dig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780671;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=HcwQGTJkmHdpPn9o96l0Zi+mfegkg4uqSWeDmDiJTuM=;
	b=zmERuVbeEUQrXM7qNzUOdV8tcq7bhEUSVQiCJyG1JFBCnOb9g2IRIRo/R8jksz2Kii4T
	 BJMkz6Ia8/0ppXWHhqq511EHX9qB6RzgVd4JdmYNao7jQoWGTB2m7qbQAzSRqlYXS/xMQ
	 EIprdmU7qfMBw4L1LhjSxc0IG5/qP7v20dEx2SDKe78wFQvSwrZZx/psbUouSE6xz8XbI
	 qhtAjucyI7b3i2wp/05+EhKu/OMDDg5+D50h4eEvl47Rsfl6HVcqv8d8AuUdwEZdWGB6h
	 86ojXfYxq1k7YPuejVOLW4eYq26VdP34duuZQlazRu8t6XncPt80sOjz2DmwZoTyzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=To4grt43;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30573606A31B;
	Wed,  4 Nov 2026 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30573606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=To4grt43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1793780584;
	bh=HcwQGTJkmHdpPn9o96l0Zi+mfegkg4uqSWeDmDiJTuM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=To4grt43kQUAiMlrHL5F9Oakv6MaQHJ3oBgb1qqxU3d9e+TILnx2o+AmArXLE/XaA
	 aH88MFjm69p0woBLRToOkWuJ1F/hxQId0vhzunn6a+Sr2CejzwStwW8nQqEHObJ7PF
	 VPjfnTEuEYHwuMTqKt/6bdgW8FhgRr/F5asbIseo=
X-QQ-mid: esmtpgz16t1793780566t338792c9
X-QQ-Originating-IP: wMpve81B9v3xTZE/AIUMdVdmdLXd4jC7JlwMhT+Fsl8=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 16:22:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4249673309043299330
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	luiz.von.dentz@intel.com,
	brgl@kernel.org,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] ALSA: intel8x0: keep AC97 PCM descriptors for ICH4 capture
Date: Wed,  4 Nov 2026 16:22:42 +0800
Message-ID: <856CCC6453C59FC5+20261104082242.3987826-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NKtNg66QPLmaEZibMQs3Af1AxjBMUqpxFkRTRAPz5ZPVYIG/5+XCcdpy
	+Qa1htgrNniKS1aQ3DLJEmjodxHZRJp9l5fT3sxR9Vzhs6mIYHcVee0iIhr5jQAySxdHMn4
	8s/8dxDbjseRECpp1cmn5C52B51unEcKIHag6Tnqjh/bXaw7wcmvjc7LLYiZM7H+kJbCxEo
	XDaCt4f9SG0yTzYgbglcCG2soEpGxftYh7KH94X2P1hENqN1xoRNO04D/+suonTQxfHQxfz
	T0MW12D1SRxriJZSudUt498DCpcnGJedrBzmay1GkIhYWOtdvC8dn7X8Fn00GdMAytmNifr
	oFF7J1DC+ZH7PSBqARQP+RvWITlF87GXBqUCTqkXusOB1bwO4+TMMVAKVrBndLo3OrYHjjm
	ntdVLTlY8uZXqugtknRAvnNsoJ6Z9a8Ae1wrdufKLfI77peQU4ZreM5laHfSRKeFzYm1nx0
	y8ttMPFbajCKxhGT3pHJBWoBoIGPuNbYcFxJXOoCjhK3RsBjelAd5xeZA1ZQEwFjcg71nBN
	1Gh0eUTN0OOOpKtSz6WX3BrvX/eDRn0YIGmGc38nrmdEQCO+/ZEA59rGU5JKvXFSeP0lUvw
	kpCyDct2CiHdOHXNfK3AWhrInwGOnRZivtUntK3dHnIYi8pjTK/DzThcEpWxSQvbrItom9J
	yj9gR2NZMErPhVXtbX597gUZNrKA4Jc/gZpwijecgPX5LInNManDZF5uNxXSKqjBVqv+3uJ
	OsriG/RThSB3wnputDaKZKzFs0SoGb664AmH/MZcY55Eezx5RS9EiKlE9231Pnai2bOsDiR
	D1YKzohQla+27cGKFmWPVO4JOAPXAW+c0WDK3c4dGJK9I61l8h5NlUMBaz7O6YG6CRMhnbI
	0PhQcchTmj036iLlFOlnXXTmGzm1ZTKstGFlNLYMF386vFlcpNTZMjvaWn2ZVfHGnVLG1pX
	jtKWfbMJWczbAyhNhVUmR3MvgA3otfVkWVy/j4Y8tzM3HGrzTMqJoq+4ScUp0p7kIVsjLpO
	IuwMWFQC9YVVQvbkpUSUz1GVBcJPEZetbbi+js1groEj0dzn3hv9K+rRd1R2z8ZrzCS3F3f
	sjiIGB8PIub
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

When S/PDIF uses the AC-link, spdif_idx is negative and the AC97
PCM assignment drops its last descriptor.  On ICH4 this leaves five
entries, but PCM2IN and MIC2 still use entries four and five.
Opening MIC2 then reads beyond the allocated descriptor array.

Keep all six descriptors on ICH4 so the capture stream indices stay
valid.  The S/PDIF descriptor occupies its fixed position but does
not create a separate hardware PCM when S/PDIF uses the AC-link.
Other controller types retain their existing descriptor counts.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/pci/intel8x0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 339024182a26..75db97501c72 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2291,7 +2291,8 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 	i = ARRAY_SIZE(ac97_pcm_defs);
 	if (chip->device_type != DEVICE_INTEL_ICH4)
 		i -= 2;		/* do not allocate PCM2IN and MIC2 */
-	if (chip->spdif_idx < 0)
+	/* ICH4 PCM2IN and MIC2 still need entries 4 and 5. */
+	if (chip->spdif_idx < 0 && chip->device_type != DEVICE_INTEL_ICH4)
 		i--;		/* do not allocate S/PDIF */
 	err = snd_ac97_pcm_assign(pbus, i, ac97_pcm_defs);
 	if (err < 0)
--
2.50.1

