Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626544;
	b=hTE6OXwyCro9PS0jQfMU3HpTZPE/YW7M3n7odUbfNtIXLRAy/s8TBWWceFT6DLbn8UhA
	 QIyKNpTpkeRMACQD5m7AeXj0btCXtJatbVJZO8rbiYZKRmH2tWD7tTflJ14cvUmrm2v9I
	 favP5Y0wAvO7pGAZSsuP3PE5hQHqTTvo1As9+j7AZnJLHOeyB1tenNVM9ORXyc9mx0OcN
	 HA5Vdr1LRrGkQuld/81/kLfGjIkYqCvGXDbZLOCcNHdHs5wYMp4vDl+mkN9StgDWVRD/a
	 PsSRPdz4X7xGofqP5SeCoIKjE/DClLGNRsxPVniOVLiACGhdWssocRHGKlV3CiQbWEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qRdWYn95ZaWm6oy1LdHIRbsN9PX4lhhSO6t2mSmf2i4=;
	b=AA9+Q0uJRCN3GBGUCMupavWY7KOn994TofX2JhI5O00QlcBcGYp9HJDRWkMPPFwQiz7F
	 s/kh2klB7bL0INcF49Kg/ePd6r52x4IiDmNs2caXOJZ9X59kCw6kqJVtAXzxt96HyaW7e
	 s4mupOyYa1r6A+1O7FvycX9cCG48Dd6vX7bEUSQ5F2LpldxW19JBEU0sdFoosQksWEPNV
	 oyPdant3Jnu3Ef5VRRyN2c4m+3IyqPxLKmX36I3GlkK6MmrTb3lW8lbyU07AGP2Zaqc7q
	 fGlsRrcmLOm0FZDA1YEzV5xJTDHyeeBZohJ9okm7amkHgjxQbGtzvMovt0EMZXrTNHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DePitHCx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sr6T8w54;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89460A2624
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A89460A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DePitHCx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sr6T8w54
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAHuf2902123
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qRdWYn95ZaW
	m6oy1LdHIRbsN9PX4lhhSO6t2mSmf2i4=; b=DePitHCxXjc4rq9gX5pue6c9Sbk
	W9EE3NTucaG+w1zVYvKWspgPR02IGwTefpQaEC3Dg4DFcL+hi/HOZS6Mw3GJ1JJo
	IOqqH58uktsmOBkjyDnOx2oCNVbVoK5EYREQ0iumubPZcYFeG43CjByu9vFCM3NM
	prcdNsJKlw3aZ7CyumrPrnN3cxnQn5uElsdRIBTkdbrelQfFKTC45AhIQKbl5Dvs
	lIgEAvqa6cO0kM+P1D7v2e1GgQv9I03TpjCyv235usNW8Ubbv19R7Kn/GCVb0r0u
	s9BXVmITWYLgIGjuPFnSRk5kSumxPTYfXsH80ADoefral5sgW2PmN7zr+Ow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavghdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:35:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf45382794so2658563137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626542; x=1794231342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRdWYn95ZaWm6oy1LdHIRbsN9PX4lhhSO6t2mSmf2i4=;
        b=Sr6T8w54EkstpzOVvRFtqviuKo7pyblF+7ZqOAkhiJgZmFHwPJybUR2Mk4rZbpxjlT
         JePK7XcgLcXaJq7CaT61abtXsZZQ6g+11kwLQVsb3qDtfMOBh6SGySEnrH6seFnMwj2l
         2ujxU3OWUcqYyd4JM3ha1vfKkN7LhDpDsU7301s0QenFIHMXYuzImR+85h6lnMKsKOYh
         t0Ho09OvxgSKMO4SkIziW34OD2DTlAART+yGLIDWQM74cpL5SAN7a9Fi1fj2DJnL01Xr
         Emy1KZtLU2viYiQX0rQhLyEED8YhwPVy1NmMLVUSJrFF+VgP9NN5l9g/6k9S/MbRUVsB
         qezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626542; x=1794231342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRdWYn95ZaWm6oy1LdHIRbsN9PX4lhhSO6t2mSmf2i4=;
        b=oT7sd1E/mJXw2REBgT++SSQAgR3rVM6NR3dorhw162cvPcwjtAqB5dRjLFX0jk0qN+
         IBQyclPeztWMkhuUkKyHcgmOgmqTUyVcoiKXS4DkdW6sggkwNIt0ZuDmHuskPOua61uV
         1DgJHVbaw+GFter2gvbnYMkqT3cHltz5nQpO5Anf/KFm36Lb++qNW7/ck11PZ09AOuKH
         /brDp9+gZjNzB+ju1R+Xrzv3KYZX2SINXGnWS3fkBPj+vTrqKtqR2ibjj2R25uzKXHb9
         EFT84mDhbwMTMH1jH8+WJIROvnUm3Fg/oofwH9rZffrmYIZtvkhcCuXhhgg+Gz+Uo7Je
         8Fyg==
X-Forwarded-Encrypted: i=1; AKwUvBxWyEhAXsmO2XKxtQLlmfQldOnzNO8d7VPKQxwEB39RAjP9kEjzzSvwJCh4MUm3aGJjcePR2gCgK2A4O68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E28eU0woGBzHt6f/VWI/lz4vIoan7QKyiWlny9edZ+p1hagld
	NYVQOKxaANuz2NOT0DqrPzIV68SejnSkqbspfqWJpxEsy4DILs8g6O9XpujcIEXAwL2mmaLA5PO
	3CSIhMCMw/fm8+O71Ix2Zpa4PHA2yuT4gvgtzUY5YPSGIriXNKZMmnd17togGTxFYt3E=
X-Gm-Gg: AYBFou1zSzHY9Dblt5sEQN6qHezllkETxJ6hKUjoAArnl6Wtj6B7x+d6d3U1GQ+kWNq
	jFdTjNA73SB5knXSkB2UMAaV8hh4sWJKbdQTrEfR95dh4Nhlgk0AgbiBUWEdxwvS8QhyOO8QvKS
	iwy7jmHSHoNLULiOhe4FTcfBpc3PwsuNYvuI2I8DuLkG3UajQFNUkgWw2paXhsg2CRNeflLYvpi
	UgpvTvnH/9q3XxHNq6IBbDfeSz6WcrT2ojCXHJA3ht+e/b/5IaOmbpYPTpvRAYDCx+KtxMcwunl
	lmxJ5VhcxVZiJj4JquBukcj0+vzQiScNZS2yuqkr7dqXy0BXfmjoEaV+GbNAY5MsraNSiwIE0UV
	ocwh/CZt/FcZ9XSj/hd4SyQocFXCmO2U6z48K7Iedfd/OTzDPrKaecRVnX8yT3Q==
X-Received: by 2002:a05:6102:5811:b0:7bf:74c1:b607 with SMTP id ada2fe7eead31-7d0728adb49mr4475451137.34.1793626541732;
        Mon, 02 Nov 2026 05:35:41 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7bf:74c1:b607 with SMTP id ada2fe7eead31-7d0728adb49mr4475431137.34.1793626541242;
        Mon, 02 Nov 2026 05:35:41 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm25735864f8f.53.2026.11.02.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/3] soc: qcom: smp2p: Fix out-of-bounds with incorrect DTB of too many outbound entries
Date: Mon,  2 Nov 2026 14:35:33 +0100
Message-ID: <20261102133531.173434-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yrLnmfOt/ROm8h8K9Imo4uMtO8yY2Hc0DvStAQL5SHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6JGkvrUbyfQWKXRVbixCwBnKu7593Roui559S
 zoG/bSxCb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiRpAAKCRDBN2bmhouD
 1xHPD/4v5eySVecnfwRobUdUpHQutJluQ0vZtyhjVQJNf6+Ohz29j86NaTY/Zy1EuWjlyWVLffK
 xSRUsH5qF50PxZn2A/pTQAxuQ01LxHaFarzDuJjNJjprOM7fSULhy6tMIud5hrccSF6eqbSm+Ni
 1EnM+ViR2F3D0a46yhchSPLvX4iIiOlGeCMH7xUYYJoZbhCO3mUUbOR+4IYdcygFAgSGc2Hf4fk
 rcBVdrlqSUgJCx7E2R/gHX3hpe92+r805dg4wqdaQ3T7Jc0nhNqahHLpxk0wA4AB/Wdapf/6CFp
 mH4y/mlGb54hNbd1DLXwbpq5T455rB70BX/BLlzTMu6r17XqP8CpuSFACWlxwdQP6D4fs0s8FIU
 DYMiOQs+uvfCRMOyZFQMn5WrEgo+2xOTeDRSJBb4Xy2m9AS3nnK7m4cvmWen75eeNR0mSjo9567
 QtTLRt9Ril1saSEVXYwPpwK/2hXisD/LX7ZrGwT5o03l+PfKwpqHFuiI9ODFws+MVZ4AGjwxmRL
 H4gp5ZlnK6FY2MUg0er0CX6uY331ZloPY17roi41/FPFdWpP5sKN5WGz7mwMWxp9dbJuL0NlBsL
 1u51PEBktqgFnCSoIapaGwHSNp7PO2OFag08Jry4oyV7ZrsDkqv9zFKjt2qEuy0VGRc3krrjgUa lLyQpCbKxox6hMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX2NVaP+vNgR7W
 ukLeW9FXCOEnB8v2LjwDBk0QODbsGRhJ8ec2Ey76/LlCo0ynGHlJM+1OOXXJa0aayQQYBQJPPfA
 5P/NHuO6wHw56kxLrgQOSzqZzmA9UyqGMESS/qF13IC8g9f+W3zMbJ3/YOQt8spLrVMyCJurOfp
 o4sbWSdp/9rvHfxmqP9BnVlxSVZb4RzqvT6/1Sez+kwC74a9mSMaZvKgkYTGjhdFiNzraidmFgk
 kXtkLxG13DQpGBOM1TzM5zwiSxq6hIHEPAYmf1zVrHRGmTSReR5UjWfBrRCYQgW3706VpBJYDCX
 UfIOAVTHQ5XNIuG6ksq14UYdoTWCCwH3ldOH1zKKaNue4xUWm3QcP6IJxu9zfdzA0ITWcCP8vdF
 pfdPzTa/uK5fOHsE6jLfdgWyU5BZQpgj+ZX9LBpL0d8PX4NufzKboiHfBirC4h3nuhdsPl7Gn8C
 +kc4uS44kvFVqBnqkdQ==
X-Proofpoint-GUID: Z3sMjnPSpNG_oYjc-apiaY8OG9Z2uuEQ
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae891ae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lFa8o7j6PwDw3F3-yxEA:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX+Y9sCSxxDujr
 VHv+CCwYICm3fgQ4jiMvFdnZsVAzI30U9ykpxv8m0Z/K/KQEQvtbu9N7j+GoFaeoKs8HaokXHTk
 J0jgSTMcMUqyR90/kBwAPSB5mDTsrfg=
X-Proofpoint-ORIG-GUID: Z3sMjnPSpNG_oYjc-apiaY8OG9Z2uuEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

The outbound SMEM item has a fixed array of SMP2P_MAX_ENTRY (16)
entries, thus driver should be sure that DTB does not have more of
these, otherwise such incorrect DTB would cause out-of-bounds writes.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-eaf9beb4-cc0d-4d8e-be28-4c12b039b3c8
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None (Sashiko comment looks like duplicate of previous patch issue)
---
 drivers/soc/qcom/smp2p.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 9b6e0627ed0f..49fb738d02a9 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -517,6 +517,11 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
 	struct smp2p_smem_item *out = smp2p->out;
 	char buf[SMP2P_MAX_ENTRY_NAME] = {};
 
+	if (out->valid_entries >= SMP2P_MAX_ENTRY) {
+		dev_err(smp2p->dev, "too many outbound entries\n");
+		return -EINVAL;
+	}
+
 	/* Allocate an entry from the smem item */
 	strscpy(buf, entry->name, SMP2P_MAX_ENTRY_NAME);
 	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
-- 
2.53.0

