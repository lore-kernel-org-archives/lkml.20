Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B349DBB7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378506; cv=none; b=NvHsGvt4SczS/b0MWjCDGO/PI+z7K3VnUkYTzNypnyoHyTmbniABBBKGewVIGWEITjHEPK3gP3oGIf4XyW3khZiuN0KiDdWlWfMJuzDS0ObWyr3Dqeqbhk/cqJyOpi4LzL7zsLQJADbS/7Kou2BJ+xpdUGwKnkpmfNz8QMOxvU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378506; c=relaxed/simple;
	bh=AMMm7hRsydGhyrdkXG61mNze853XUub81eosJE+URdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/ArbCmXI0x9qjAZjOwnhdC5wDtpRmCPDCaIdFWQ5Kcudv9YBed4g1Vqd0ncvVRBo2GKg+/9HQfS3AQuZqvod39L2IKK7KSH7TNb1PR2991pvuTkO6CE9TWxg4jx67E6bo0MCUkIfTt+cu5PUvGEBqAD5s+vz1QHeJAAAXE/Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9MRTSDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSUlSNeH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9MRTSDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSUlSNeH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsA4I2485679
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSI8nDh7SJ+
	4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=f9MRTSDk3pl+Xm8LGcfZuQKkl63
	lF4WIoD4QuA5qHY2ReiJ3flaKBMFAM+uThec/wSWQz9etrgHEP6tcXEs7EIYFTBh
	dQ0XAExdAxSd0Duruih1RZkw2j8DFjKxqFwwSB/cg41jyekNlPgLBHRMSXLzVv6a
	qNB0MqF3nOAPv1KcMcAkOq6XyOs70W0/W2uWqLOA8jspbraRPopQBI0uAcsSQFNO
	DB9YR19g4ijdhghltd9v2NaGxrrP+gFRElnvS9D5ZrytBDsHs0sEYPx2B9JO8LLr
	rw936RaWCRxEbXgs9M4S+MMXlRqiYXM2BfyV/TQjHL7rBfQ0B0+MzlcUSfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9m94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2344361a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378491; x=1788983291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=WSUlSNeH7wroo6HrrqNZgp6DyjGBKUp7NCsotsxNvTpfjSaG06UMvNDEam/xpyZ1N/
         w96kvNPdZKqOPmUlbyvMCFYV/tq3CMpH5HuM1Fp49I5AYFq6K5JFf+Q6Hk3JpKObsrkD
         t6NuhW02YLTlhORhm1RZI2qhNIt/fZDo3YloU9UHC/9AxBNNru793u8ebjCuQCXZWPbr
         JoEWscNdxX5yOGvT1NDlbe57jhu/hqMWMrqbdaVFTY9dNhnXOhTZyu6d2TesvNZ5qZ/O
         pK6l99IXcXff8ZlyidgeH+Ja0eqAqajZa49vZE3zGPFOvL18Y4aW+8wxiaOZ2kdtP6RS
         3xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378491; x=1788983291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=MqdLMzoZW4ni71wQC0EQOyOW1C9i6nTsT8qDkDH2DDYpPKxC86+5BlNWwNZJnBN33g
         9kESRBwZaX5TLgksAffFyIE5MyAclf9eSAEVI6l8IqUhRHb+dZCHklNILzv+O3FKifOC
         h4pYxEMtKYLbCpmLwnh9kVnYFmPhDIP/w2TpjlUtxNt6+pxQ4Ehk7pdH1Lbk1IcnTjbe
         Pr4zn7Wx/NS2McheKB3zRPWC7AO6ATSkNHBTIjqlKMtRi/+HEPpiwHlD7ul5KF9O+m9Q
         VWzZzq6FZA0FgV0aNRqsKBE6Y7df/FG2Enc/xbqzDLoUyDdDwO40zUFnOGBSD1zRpxxo
         u0KQ==
X-Forwarded-Encrypted: i=1; AKwUvByJIukj0NJfNT5zramxfZJ3w7NFuUBiv+KeBX269DDr7ptPLq8t7l+anLZpba2q2p3mmCV6DJOER12DaS4=@vger.kernel.org
X-Gm-Message-State: AFuF++lIm0oWH/ROqoB8fE0b9WI3qArD+ylMp9mPdnUnrlNE1/EK37D0
	j90ktGCSSiSq7O5PppuMuh3SYbtyV1rOThesALpJsq1MOZW+g9hoJ+MdHE92FP/TOv45zlbmhyR
	Qb+SMtBDlZoYrIS2NfdU1iLYxVcS0tfNfS0BUJB3JHVkZsO58zBM8ZOXedXYMjwlCJzw=
X-Gm-Gg: AYBFou1Eq81HjbS+5acznqfcIm4kb+geha4FP+312YmD97gMNs68p8fBOgBHzn0V5C7
	hgYvfh7guyNsAynd5cAuta1KTuaJbsl7UYVp1oywbkcuTN3Qsi3SfuBT2i5L1qhOGqBYxn64tF4
	mUupRPt6fy3y4UXkXf8yUXf6X4JC+Q4sky6mA6kuAOuu4Cj7si+a5GokKJsBTTfUw9mer76kFsR
	exYQ7OX2DwvcHZIStArYwDWdRsA5pLdT3G0NtqHTQQ9bFdcLaP9JUo1Hx/pq+u3m2f0VI63i0mV
	s4RXtMzQ/ESBdM1gv2MSbWiY4kzWWAv4h8AEIiyNOQuuW26I8aasD04HOg3r6irHtCSyj0U0MOc
	aLbzMLZoQrxpws6PO4gBbz6oV0/8=
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442685a91.25.1788378490481;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442629a91.25.1788378490006;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 6/12] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:06 +0530
Message-ID: <20260902194712.2003414-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LXzJ8X2PCtFZa27uFdVcE4ohr84s7_ia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXx27DlmYKPROK
 iYW77P5x7WZSI978c8LM3G0tQxOCOqKMutNdIuyqxAXL9pWRknNL0+BPR4bVaYAWDvnY5FHjsCi
 qXpTR931YPiuiA0foxfgzYF1zRt/9ZZHOA4mMydp3QvYUezzp0XoKVlTYtDkBXnM8UmZip3Umr1
 v2EGzXuGueFCxsHsPs5gQIkd/Nj7OKnjvijzIkKsq6sqkt//ZmZsZ6QD7mYAZtCaTHq9ISkvr/R
 x8SwsU/LMfCuk3Ovo+u0nNau+M8vUlmGiH/BUl9uMhMkvwfpCrZEuPfUrr/id5k3v/B5DRJ2ThQ
 d193r0ul48EhLQjKfzgkGdRtYAUqlAts2nzl5gZN1YRQlBPBID/U49MjW9L2A2NygHXhD6RS6hv
 tHPXm2IFuC4cSMosOM48uPFPRWMJ4Gs2J3ix3MW9NGokhcq3wh1Fw+ptk3W3fff9pq7YXu2L7Io
 guvU+xhXBsdQxCbsdRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5qpjkpoqUdGV
 6EEW6Bd9F22X6xXSxr9vjA3o/5qXZnaJIwdUdgnvE/2aF+kh/7UAgTKxpqgK35vlOozwz5IjKD+
 KpG9l48/F/EfPeQEFn3v6rZs0xr06mw=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987d7b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LXzJ8X2PCtFZa27uFdVcE4ohr84s7_ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0

