Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564669;
	b=cMt/me7Z9uAnwc1zZ3hNdOmTE9ZgZ3LzKjj3QsxjePRxDfmafRKkIGqp6itnak2//lUU
	 305U9dO2b9d0j3T7WvYj4U3bb1zFqiE2HPn/JyZEFxx6EzEVLtl+JwMUxkzv+tdNdeewS
	 clkRHyDCeFN+e8yB3Md41x528ebs6K0Lrva6xlpTOXIDxaXai2/I2TcpjLtWr9jmay5ZV
	 L94CMqwzCFRW7LqKSoN/InNS/S37v8d2J642zYYLaO4ThzRuQnT62meVnbz215/2Y4VR5
	 Dq2fARvExlkagtKo312Q/c5w0NtLaj3UldL4MxQGREnMPpZS+lC/NhynKuWVqoyvceQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
	b=BCvh0Mtz4MUH38CQd+cINY7P+e2mvGnKm9irUYcg2Mls3R2JP3Y1QwmGVX0VAz4sCyxi
	 psF+F82g/7HPseDtilIiwNMvj75S08WLnLmeDnRQDfg+ZXt3wv2sb3yh61oleRbioBjON
	 O6YwUSKGJ35hOYy1SBarHh/kjkqy9n+HlyXf8wzBM4zaXJ3azQnThkm/8eF8GXIsSJTYY
	 MnhKF9PIJL0l2Hjw6OqTGlGByXWojL0IZYUntejQhj89YRgjfAXy8gjejLwkfRfjTV4X8
	 LkDuW6GE/wWYc8X+GZRDmx8GLIijB6Lf8CxkwKbeukeTpeCQWEFBhH9ieuy7LYJJ/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPZoGfiG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2afyjV1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE2606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AE2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPZoGfiG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2afyjV1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK925733013
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BN36EzrJIxm
	0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=; b=EPZoGfiGKVuM5qwPwgq4MgM+XNI
	ofryv1Ef5/gFgFsG14n0C/7B4ae469OsjcgZjhPyH3V1vFjTp8IRmp2s2+xqVrBP
	REUifM2Jv0MtwLHMOOh8rajHciJTTWoa23Dduxhl5s395M/m4qaGETeEy7IF5Xrp
	rFHJsdEEEjudLH9Jn9hCyy8z6kNzHm/KqNayx+g8K1WBdVNaUYvhE9+c85qAJaRw
	Z9KTgVd9dvuqT4qBFv+0pLG/TYnEvloSZ9i/dKhZq5UhU/hCrWTbsPt7nFYcue9q
	1W6d4Dv7i8UFGUh8qRv1+rBbr4GoiSfv378jic8y2WntFAySKEkjA+pz4Jg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7v3xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:24:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7886e8dfso51343866d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793564661; x=1794169461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
        b=R2afyjV118vIypOB8GcPNYDmCChBRYoQ6fdOSaagFffVE1bbM66CcjXpIfaqugZPTO
         CEnpR3/i6t/5eELCHFiZNNy/vvZyhM59bb/YlfEbVnwsFQNUsTc0uuBffKUv8OjFYZfd
         N6DeYX71X5Zm5Erm7QoUvp1V36+zQv3HiDQ6dwggP0OlUjWRWniiFG5brcdnQzNVfG0a
         Nq3IEObtb8w1PCbSF94zdRlpsMMKJJ7O6WtNfM5qGP+40gBcabUlDqVLZknlufkyWpWg
         6hvQ7x2fTgx4JwOdyfX9Z7boUWfv0wUD8YmPY8XnkssfHj8waeXWaYQLV/crMt76cgES
         tpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564661; x=1794169461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
        b=S+kjo/MZpTJEudPq7H3gvpvzCEFixTB2HlvKIrSB+EoMT1xmxRqWKNBBvU4zxhPKFQ
         JsFga75dDYLpU1CEiun3A1l60h6WZOKmwRYSZno9ohuqa8eIaiMoruIOK8+kjSwBx4c1
         RyYsO3zAP2nrU9oT4nDoDAFXQlKge640EGmU4udd4eJNhs0AR63MHDMyV3NJKYiwi6bh
         4j9B1bMhj5Bh8KNqRfjz0iVYeRoCOglvnipGvuwh7CXiIZXBEF4XGjFWL9y+V940w/l2
         l++wCMAGQ4xfUq5nW8brl3BkM46hTEaEgD/DW2PGeNLeysg8xagvambLQsdXumofmhaO
         07Fw==
X-Forwarded-Encrypted: i=1; AKwUvByJtSuIfWAoheF2rC/POGPioXnHt0qJd4U5gYuimfFd4kPNOF8SKVP0Vvpks5sLMuNyZq8U9ouNrEV2g8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOx1s7EcfGT/yNkiIttk1Z1fwsJ/zqmXMQ1YN3776U0ZKt6ZZG
	YuiDFZuEPL2nX7D8snHT49soA+BSAKS5cvV9j0SGkw5smJCA6IgVVE0fQh/MfgvsRjdPeLISKm3
	pLeLZto5NUDuP3Cxqf3px87avyNw/LrF5v+z7InSqc/OoxO5tSWTAbn7DJkkhXPr0tHo=
X-Gm-Gg: AYBFou3y6epAvE1Ev+/D+5MSa6Se0kMOvEQGFrdF9qHD/IJEnz+ih7W+o1Q/ng1I27P
	drm23OkTaWGC/g7W/ZOSrYwpWSArxUS5P/mhCOoKKcpQPL6TptkwK379aX5T8JkMsyhRLsipbqD
	OQNSIeJlKfkfIcSwVEcR2p2AXmqLm8N5mqWKkE4JhSzjCvJMzakJF1NmyR/tjhjzY9i7zAh5Iom
	1R+C9O2vESqjB/cZlzpcairoA//gbBuDlYCWgDjbqJIx9t16QipxKjC7jgIc4KFC5yHqKJAFgfF
	BFQFMzTRfl/xNA27F6opkFKuusqR0lzMNeh59hNb7JqeJ+d6kSlZhrDD7GEvrTj07m62dWLM0F+
	0cVmwWXxnBq4P3gHXcBStdmrTNYs/5SSwxikbcI1UHK91BhNEq2/bMxjzfRPJGQ==
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1314584385a.1.1793564660672;
        Sun, 01 Nov 2026 12:24:20 -0800 (PST)
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1314582885a.1.1793564660178;
        Sun, 01 Nov 2026 12:24:20 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm16796675f8f.52.2026.11.01.12.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:24:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 2/3] soc: qcom: smp2p: Fix out-of-bounds with incorrect DTB of too many outbound entries
Date: Sun,  1 Nov 2026 21:24:06 +0100
Message-ID: <20261101202404.156522-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WdISjf2NXOI+jjWzEjpgNs4nXLCjUS3m6VKS68MzI8Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq55/lc6UBqMjQ2dRfBG+z7dddlgUqjDhQIF1n+
 g/0dEkWPeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauef5QAKCRDBN2bmhouD
 11llD/47815t6bq0RYdIVHpfpCVLKTLjM3aKQbrfwNw/9OWtNZ0Tk//Tx9T4MQApA00RpDnMGLf
 4Xm1Do1vhQTUW/9CJBNJxCMVIDjqRsJxsm5eSjsVQOoslzF0VcE/uo/G9cPy9ghZrqW/dLv2vNq
 P3VfPljCDCR3XX5rvBh3mnx74vO0f6EayW4kKHGJgYQMCnSa4Oprz6WPo5NPf6KfN5YxoDA6/UE
 qJFtXavk81Kk3xGDJIs+K1Gz1/E08L2MScvZ1cveFCpt5+p/4AUP2R02Bw3ROPLb4r0J9ZGrruT
 WS6LP4UDRUsb2hrD4AvUocA0wNAkA2wlSDMMSZbJH+rZap3qHKp5OsP2bVl4n+s0if4bqMUrOgD
 eqvX3SrREAmB5Y+O+vPzlOm3WqeUqnA72GV5OHXmS9KKyM3+/wID3/jInLGKrHQ5l59aDxeWBok
 kSRe74E+N0e4q+b6cnelxL2SazNaZ4V1ICAE+S0r6L2Hh4/oKQFxFaPrnVD8hufPjEdhYCpi5li
 iQo0DESBWlzxtpWQ5mCGY5WGkw/BVUt4VOEZfdBzQGhfgorO15bkixIWCOH7Nj2DTzqcEwLN84z
 2AS9Nu3un0HgWRSYCXy8z7dscUrV4EFAWcylQKwY4mq05gfucP4zI2ZITlfoPZO74Lz9jqO4cTp 3XYRBfrlhDo+Z5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oSJf37LIrg2FsOKFI6VV7qPYp2gWAhuX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfXwz5Jf5jT7Y17
 gF3CD7LOVh0HzxgGwYUYr9TimescKk33IV9TroJgESPNrND2AQAginYpup5QkEbNm4qJjGIEecm
 s609R4AnO2l+5q1TPi0Q+/J33dDrNKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfXxRb81zryGc6/
 6gv80J7a+CoBPwb+FY4/7x4mzjkzhy3NjEJdrk6ijRTcKmO+JP9fI+r/vENCAGFptlCccgugv/F
 +VSGkNBmYJ7Spn9JRfKdxZepF4niAIpvIqR3oSCUiDciuy0bVAzV0mXFW+vpR0gr68W3GCVZls0
 OxO4K0dxnFbEgSuyHVvxv4UGblc9yIft8BQHqM31Y6NvlTWGfNhoiWYM2RmR7R88QqVSyXeHkO7
 Ltaaug6GZL6scLMo905FyDWMrMDGtUjkFjfzxUVtDG9oU1n+FMW2gPHpGXhCaDXo2mEe12d2A/I
 D8LpLZhSJgFOq1FNtgYTpxaewXElwSbXAA3iFax39NLVQGS7Yb5sChMmRnbUbTeZwzvE7XSSN66
 XQgMuprrbLMI7rMGiWJti6uJhcjXoqBJud9ZevA6cyqrQpqWTtyIaRSODgVWX3NpkIeL1AqU6T7
 9UDxkW1xjHQVDxfg86Q==
X-Proofpoint-GUID: oSJf37LIrg2FsOKFI6VV7qPYp2gWAhuX
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae79ff5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lFa8o7j6PwDw3F3-yxEA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010081

The outbound SMEM item has a fixed array of SMP2P_MAX_ENTRY (16)
entries, thus driver should be sure that DTB does not have more of
these, otherwise such incorrect DTB would cause out-of-bounds writes.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-eaf9beb4-cc0d-4d8e-be28-4c12b039b3c8
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 7c1684c65e3b..784a164cf367 100644
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

