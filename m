Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843308;
	b=zL84Wu4t0iK/KFqGHdaUd57x3iEE1m3IT/xzN0elufVL2Ux/y/Jl6U9DkN5anNpu2IKz
	 ySehzsBfS4T0XJ1NkdBko8/jTIEvEqzZlvldpRjTyCS7OMJ9Deq3QVlUq4aTv0nBEiBrb
	 +iugNY0y6mS5haAttWigzo6Ukj0u1yWqQ+kgXe7YuLTl2jMJkmmXL0/t3jviJde1rR08n
	 KLGprR7kQlQ9jAQy0yILmz/sRLVNNAvVygjHNFNNb/ByjK2vb3I4WLhMDsYvdHzmfsIaI
	 usFkcHYx3YnJeAiZDMec6Ht4BrjoM0pvqBTwgG6hTFob+aNN5yZYAFf2DgGAQpYgAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843308;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ofUF77oywNWCpwsnLT2i2Q7oO68s6mg0Qp5AM7aQI6A=;
	b=tmQ+raCZJZb3IoFAXywjr4XQ40aA5qiCJyi4MseEVubf+o30FaUI0hBA1CLdQsn8RiCP
	 lpim0fezZPG6cYdHtsG4DqUQn/x8tQwAhmG14WAw6AScK5gi0vm9A2EmMQiB+7S328LXn
	 ZLOoXIoi5TAatglIFu91ns5MsPdBIZioXZSsuEzbJ/BjlGe+gRBBq+iN9eV5rcMqOtmT6
	 NOnQWgkvjokQyOPE+Iu4KYas0cuLnMOVgJnxDQVhOQ1gziChFRAUssBnE5dv01htUaOMO
	 sn1SlXLMCGtbas02+S6cT3425SyeFm5FVPwD94GkL5RPmOzLHF5VHyxD55IUR6daEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=RMVlsqzW;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024C3606A31B;
	Thu,  5 Nov 2026 01:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=RMVlsqzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1793843222;
	bh=ofUF77oywNWCpwsnLT2i2Q7oO68s6mg0Qp5AM7aQI6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RMVlsqzWCh91N9VHpTpR0EGzzpBcmb9c8MFguhiVla4t+diqNMcwcyylpcmxzbKQ1
	 EdDe7WawcDkunNHCw0bl/uMDhrA7EJiXA0BhNNvxoMg85zrTslH3l3YXHDXsRpMdry
	 TArKNY82Rt9DrKgiKcCMErjgwzF3JMbyXwSYg9eM=
X-QQ-mid: esmtpsz16t1793843206tea9c35d8
X-QQ-Originating-IP: jy6+eKO2jeW0sZWkj3TdWUmveIympHx8jZKmpuARVig=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:46:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9435009914500537099
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	luiz.von.dentz@intel.com,
	pmenzel@molgen.mpg.de,
	pengpeng@iscas.ac.cn,
	brgl@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH v2] ALSA: intel8x0: keep AC97 PCM descriptors for ICH4 capture
Date: Thu,  5 Nov 2026 09:46:42 +0800
Message-ID: <5387AE07DB9C7930+20261105014642.73877-1-raoxu@uniontech.com>
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
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NvxNySBpH0QlG3lu1wPPSa1zkDPjjUIJX8sZXesL9bg5wywe5nxdKG7L
	/dwzx9l2Xwft0qHgrcnOAw/NSR0S2BGd2gGbIzD/zHPb7CSlBzkmhhINZ44bNwxHq8Q2K76
	nUToJMApItsgSVMqTpvHdrVf6BnH3siVbDcRrDuq1fM92QSeCg7gx2X9Ua7amSFQpO9WrhE
	265IifN8KVVFCsozRcEvVMncWkFFgqLHw7rLBG9tR0oZWaxRvIeLaiKRUiyoXB3FqlCBRwH
	fG+Ojd+C+E54qf/W4W0JZeprFqy7IGqG6xrIR4aDsqhZAyIjix1zvIFcEpxf4x5ILNAwwnw
	ukhfBhS9c9Ot+ufGYaZyC2EbH1dY2T7vYsfockI2nXIhzrTFsEmI+Uj6ZLcO27bxRBQATWc
	kSJxZjVuTaGeWqF94K+euJsKDCTcv7efUHhIo8Ojd3VcCaVRKIEiyOmjfoRDfevosfIQsT9
	lHr5K3obkR4QgYklm8on4i2cfVxOLPtNGI1dSDWKnwgzRDyqWUZYKtmj5hjXGb98Kfps7Hm
	5j8Iy58AIf0nseQko41en7HsoV2o0uly9pzg42RyeDqcqAtxkemtKjsSkkRFyj5JTzI0l6G
	9OuZhn0dqRaBgjvDPpylJNHioW33p/UsFXI8nhb0z+eB7Y3Q0rEsMDin43JUWXBmVonu8KN
	gF01cxMYf6wd8+sYV3IcwLgkWDZX9jc+y/OMTRpRtlZoR+4HnYBst6uAo5/hKh7ldqs8t6W
	QwF+w/7dwKDXpRAXlM1DsRhoit2G83haupvBDzgMj3IuD/xYw4vSFQ/iw7D6dN5XXw04bTm
	O57fdTNF7UBQythkoqmKXF8cjnDrGSeS2Pc0kh/ebmGZWC6r/WXLDQzUZknHUZrXhjE7OGz
	/xNKhsLwh/DwWVtoAZVERKiJqHZQmfIvS/TmJu1w2wxfboIC9WPKrHArbVbd0P/Ohf+L2U9
	Okow8hsXa1mlCz/JoAx+DzFPy/UtcnzxYOBhkmnTyKvHpgqDW0PhECRf0bRnx88YZR5/0GL
	vhNFCiqdAdQlxgOFninnYIbo0/cfhYpYfJc9uHEeTMfT9/RuP9+kdCUlwFpASHdY1WiXAGk
	g==
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
Changes in v2:
- Group the S/PDIF descriptor count adjustment with the non-ICH4 case,
  as suggested by Takashi Iwai.

 sound/pci/intel8x0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 339024182a26..69fe42747750 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2289,10 +2289,11 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 		pbus->isdin = 1;
 	/* find the available PCM streams */
 	i = ARRAY_SIZE(ac97_pcm_defs);
-	if (chip->device_type != DEVICE_INTEL_ICH4)
+	if (chip->device_type != DEVICE_INTEL_ICH4) {
 		i -= 2;		/* do not allocate PCM2IN and MIC2 */
-	if (chip->spdif_idx < 0)
-		i--;		/* do not allocate S/PDIF */
+		if (chip->spdif_idx < 0)
+			i--;		/* do not allocate S/PDIF */
+	}
 	err = snd_ac97_pcm_assign(pbus, i, ac97_pcm_defs);
 	if (err < 0)
 		goto __err;
--
2.50.1
