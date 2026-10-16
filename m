Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5774D0A13
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159937; cv=none; b=brNG73xZoQp1ERNOhCGisnCeVYgjDet5IBRBaDAEINdTjuI37AX1Ma9qzvZnCjoF6e/rMLR71mUsm0hHNKcifvCv8U/WYjRBaue+zbG4GJWsLWKxOElYSXWaScinQZKPvMk96Z5fVEcNMqW93NhOLhb9OYX2tC//E0qcAP0l9lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159937; c=relaxed/simple;
	bh=j7d1Iwmc1nnbCs1Z7DoVwKKeYm/LCHvrRylj1tJCeTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbisODvAbU1aoRuh2u8pH26Q/ZuQSzap58rFb3vdLAhsKeCA9K9n4JGt4M3sXwDTbwSMFJR+Yr1wamVfA2yLgxcvxpjtztjhKi18VXoZol2HSDOlBJjFMqU4oS/ARgDjJivgsWq+dRx8DLxV9wGK4cdKWgsDUA4HjfcF69ltwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNiA4wSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjbfvX9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNiA4wSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjbfvX9p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5jll1910967
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incg
	cAnnUw7Y=; b=gNiA4wSewFnl0QFVXsYWju4qBVyN8VkMqgGAuIgMzTtFntcfCeh
	/pxxPUpsyqzX0j014wgXuXsJKu+Tqlrwv3eIIDPhXt3imQe0+mVC7Enh1Yv+o1uf
	EGRdCYVe5Yo/FVmkdOsx0qZsu6IaE7cUfDXMfPlreIwaYYQQNjwotlq4XLT1T8JA
	YbtajuJgDRDoYQUak636LNlg68/2JKtarzUqZrchzD3+wLVhofCZfRO+y6i5Q9DV
	p3oP1oWWa6XgjBVqnXuC5i1sFh7VVrtPIJieEr/UdTN5inkHr2fGCIFMNyBCoE11
	hfpc0ABNAqlYH+f+qFjGrgdRMtmV6rd2QNw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8pcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so13251875eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159928; x=1792764728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=cjbfvX9p2hhkWrTNxZXplJXzOaET4vEY88ON9XzQkr4I5vO7As5Pci300F1rhI3s6R
         8kADFjgl8kewNr/dhm/C2SryMnCZDfUaKR7Bu9gJ3AVMLsO4tAu8FoqCMveW6mT/Yv5x
         WqgOhz5BwuvhSSUgIOlpZwgZhS1ApeMIHZHwsSDI/mpQRhnxlvwq1zGRsBvFb6sEAKfQ
         smCHVa4fokIVVNchEOvmPQh7L5hrahWHl6p9Ms4Z4OtRO6qb8/bKpAyEgXN3Nqs9Qxbv
         giCwpcW93HSGql4hHjVTSgnvn7rgcCWtzkqqOX04ecyuQj2rLJlLnPrnZMOBIY7Xa2Nh
         P9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159928; x=1792764728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=xYyem5RQ1xAGY/XRO6tMvIzFqtljIc3sRlED5Hm4hVFxSc6vDzRWdkiNnCfbeWgXIH
         pW0Xn9ixOOhMd0T08CZKlkOFO0aPw1L++gEBe1wz1S1TMEdHRM93ZVVFm3DCdlqwoYno
         yGcLjw41hycmBbZRMEuZIvfecM5cn9GWFpj/PXB9DxthqcMS3V78aaAqxq7JBKipK3YC
         XqqBoFeB5evtjTTwwKvXOOGksb8yR2YYs+MbsBNw1Vzq/uS8oPpz8//zr3vwf3XeSpnZ
         EEPsPnh4aO7OHrytcdySsmVn6NUFcrwr8bXhG4mJeC1LH/WEsDlAVQAJYI/2NyIEp6uN
         E6aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvxuLjHoVmR8tBpkDqxc6FvN8y1ZCXP0FnSlFtRiYe1Q9fdyv16PRiyZjHeWAgFfccCZa24jUBveDQMRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7yp8ILy36bMl+mbuSJkxJkDvfKb0Zd5OmfrQ+gsL49f1yVp5J
	i3PnUXcOiKH4Gay6EkMCf7drRzmQYT+4eTdWo1pwvaTBUwqzRmO4MShcaCjLeZI6mfCBrJlzsOo
	Xl80ixbU2Rmr1SvW3emYvStosPuedKdFozw5PCm1TVvYuOtVT50YjwWJQrRLKawA6kO0=
X-Gm-Gg: AYBFou2zDwI7/tHF0u6VDIBIAy+BKzKfKyHaEt1z3mK/1b7MkzsBjvbqDAJEy/IIXkJ
	N77beaLbWAq4+VsnVHrpCgcTFcsJWhIAyT+yeyq19AtmxaqjvuS++0brPhWZfcK2MFanYseVbiv
	sqD5UdF8HgD3ZFa2GABcrkvmrvwrV0YONYAH85e1iFJ+7CZAUfC32gbiYDPVg9fUQyh6PrO8z5N
	p2nboCAHTT6sPcCXQsFm6G5sgycZBpnCCtabn/+9imbk+6Hl+7qpHXYThlXJ4aC1sdd8K69Kwz3
	4r+N5WZHVHtiULldeNbSmvVX4DWRE1plflu9nQ2e3e5Q2hhmcedT8uiCwaLZHmoGwWWguwXTwe1
	DBnyT9/K57M5n5ErCDstAh5Z653zgRTkCFdMlmr6oScS08sRCrm7sGJ7aq9E=
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59607c88.32.1792159927939;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59585c88.32.1792159927275;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Fri, 16 Oct 2026 22:11:50 +0800
Message-ID: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X_Lxkz8J8dId0ICdzmziQXrJVDY3d1YD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8KcXZxT0dRX2
 cpmh5xABkjyNFL9CjE1X5USS8Z37nGn6bPkooPnRWE1MvK5EFB0w5+qAb/GeTyuTcw2+764qr4f
 SOf7dc3XnOlUwuu3r4qCgWdpXnB23Fk=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad230b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jKFkqTp6JJoCw1ulDCgA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: X_Lxkz8J8dId0ICdzmziQXrJVDY3d1YD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/zjPxxpEwVTu
 mMSw8q6f448nP3cSmkFchtrmnA1ZSnhUxtbpV8wvpw13+qNcCHiA+rYazZCWSMbyD2ROIKlX+sQ
 //J5tE+AD6zBAjMDip67ZFQBuVEEUekj0Tv467MzeBRPVKMHhYutKNpfPjDbtScphpazfbKtK/g
 bud8ibNdk7djxiRPGnEvsfKrew+He2VIPrzlW3JhdlU1Vk8EiBqzcs67HRNDvymL0F1v6cXb+FA
 RT8i2EWyUvRdrfjI6zOfZCt6Do3aytzKukkIebRLbXcZ47fwlxwKyz1fWGAVrstfkkOP1iikFWc
 NfFKvFRQ1gYR0K4sAkDL2MKR9Ozgpt5i9X2Qtpqaq4QIhXxmPtHdTDqc+15qGJAPoO9IxgYDlVX
 QGhugPlGfTepWVnM/i80Fa1j6BMQfTkpsJLdhUlbPNNVAvRUDhPlt40rT81rFnXWOULbInFk8AV
 Dvu3HBbO75dqKGLAY6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Since the early buffer mapping, q6apm maps a front-end's DSP buffers
once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
few problems, which show up when the sound card is unbound and bound
again, e.g. by unbinding and binding any codec on the card:

- The card core removes the components before it frees the PCMs, so
  the topology and its graph info are gone by the time pcm_free()
  tries to unmap. The unmap is silently skipped, the DSP keeps the old
  mapping, and the next bind fails to create the PCM:

    qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
    snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

- Once unmap is actually sent, every command stalls for five seconds,
  because the response handler matches on the wrong opcode:

    qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

- Unmapping the position buffer clears the circular buffer's handle
  instead of its own.

Patch 1 fixes the unmap response handling, patch 2 makes the position
buffer unmap clear its own handle, and patch 3 moves the unmap to the
APM component's remove callback, before the topology is unloaded.
Patches 1 and 2 go first so that patch 3 does not introduce the five
second stalls.

Tested on Qualcomm Ride board by unbinding and binding the PCM1681
codec.

  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

