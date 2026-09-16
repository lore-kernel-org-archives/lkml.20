Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699BA4AF149
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554575; cv=none; b=I+Mj4t3Ex/pp4/RKzCnTK+ZZ5hr/HFkPO0Y1HJLemLuQyjAJr8qSJrPTbuSL+DL0DqrdUe9yjthUKUleTvqKY1Wo13J36Y6eTi/+o3HLLpWRFC0NjjWGP8CmueF9NXKsYXE0OMX56TsyjOsurwbgHZ4vkMP0WR46mp64Ghlm124=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554575; c=relaxed/simple;
	bh=NPylee/uXOo4zFpWq9gIhUUvSkU2nYYwInU3Y2Na6+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AUZsA44c+l8rA0MJ/KX0GTCorJoIeF+x9Hyb9HBeToWY6faB0QG1Lwz4lgTMOqQfBXMiDocJxfE2H88vXGHwoAsuIRXMRBrBnTDErMNbXtNCrn5SKiq3hv2RX52IN6bik7+T7xtVcgxvHgonUvPx8hSPM7xORU34isO81TFwf8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me3UrtiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceT9wwWL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me3UrtiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceT9wwWL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92rcQ2122516
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kRatnm5APUsWvW99FSxiNT
	KlxKX26P2Yml2hD6sgr0Q=; b=Me3UrtiAT5FtC/6rB9/c8M57aIY8HUJEod0aqv
	v+/Uv3jZwZTg9u036Lyua02FvFc34zjShdiEocFhp6K0bmRc4hY9b+aUz34sF4mq
	W6WEI/vo4j9LHAQwmQpkbvlxdGm8azpxit8oUN4FezgGfqLfrMGqtqdtB6+R/gpB
	IF9PkoS3/gJLb3LvozW4usQrtgw12G7dNQwMLrIr47pihwlo5O6AxHHr9i724n8a
	+ij4xw2eN7UUY1RbBn+Ns5iyNBt9RSVkJ0xjeDRQ9WaMJvbfRmS7iXHl06IkPIOn
	rASQp43Tn3FboCSUOIdxpkVlDvQul1DmG2NHjHSQpFTd0WZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7hhpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso967871285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554557; x=1790159357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRatnm5APUsWvW99FSxiNTKlxKX26P2Yml2hD6sgr0Q=;
        b=ceT9wwWLVYnBtmSKWH6fFyzBKi4MmWgTew4g6VZ04EabqrHd/VJkQBdySEnx+sP17R
         KgjvxHOb6EOBGESmy7q10zM2iexhyKsWxJ6XdW1hi5fdTD/b1l52KIyP5sbNJpi7TZEo
         weW3ycm1XUOrqKwoEQCspLDJH4X9Pxat87OQiK1/J9vUPoKgXJMbfdMYxtSr7ftTXZ2A
         esmcbZ0QSfPuc4klqKGjiUPzTELWBDIury5WjAqBhQBt+id0KZm70nvil46TcW0EeWLi
         CkOpoFiTTN605yORIAxYWX3etZmWymjMKxKvpIYHSGNLRIaNfSaqEYBiZkSIZPgyHVaY
         mE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554557; x=1790159357;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRatnm5APUsWvW99FSxiNTKlxKX26P2Yml2hD6sgr0Q=;
        b=v0GHap/sNDpmsh+Y3PyYKVv8f3VFM1FVRwOoeaB3DFW8UV6VAkONPRxhZ1Psp7bDbB
         M+UJAJuuOm1anP54RRtHuz/1V8KS7b0svh0Br6hzVqWLeRLh2G8lVr6qW5wiXdsQ6a9Y
         u7s3NoxVz7jlEMxEL1QgIZb7fIhryccY0XeXCeqjxj0EUss55kWoHJK6qdfcD7G1HoEQ
         GpQcBKAky8RZ/PM6CElGIhruBwrXZtOW+UppckTGys9O/iTfe4lQV2wcqafYrQwsMhtN
         0dxIzPosqEGRGZv3krCSqwL/pm9tJL74T8BKl00HLk/Sz75xYdVGJ2pPHMpADFjPQMAL
         apIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6mlOCC5dC9EQzXWvTpk1qpJttKtzBODu4bkChT+kUovyt3Pi+vyz0ACQkqy/6zcekmvVUOOhwTIcjViM=@vger.kernel.org
X-Gm-Message-State: AFuF++lf6hJsAlnDMNxxYQb1JFXn93NiwKmiRn2T8G7/wyw4PB56WR2H
	AYP53XwIFfQEVaqGelDRHBMgkr/MkijxwQIMI5vcsdq+yMc+XbfVK11LanUEGRcqFiXxDRNbNJR
	1BIO/oWLgHDF3Qn3REkFqH6Kx+ZRpD0kdJBt3udoUIfHLXughrUksMWsd7XYhtTQdvi8=
X-Gm-Gg: AYBFou0W+hYd4Mt9ZT9mfglA/usKD80WXkxhVk/0mwg88FDHjo/pJmyETb5e1KUGwih
	EUKTmuDHlcoRjhR8rwS2WvAb4GDaduNb2OyIP9ovQTrc29JEB26ZNwicgGSJ562cd2V95jLVBf2
	nzxQ1s1kcyNroQBC4ilvXkh2uLkgXGikFplQICXBgvxJwC9avt9G2PqoFU8TK4OESlu/omONTm3
	GLn8bGwVht8kgpmi1G7lz/WwEfdXkUKjGYcxA5/WIBK56IoXP+DTIIb7uLpxe0gxUHe1gvjbYRk
	X0McGXujI1ah8927Myw1Mnzld61keEqEd53QV0+RgJG0KpRK2wGENvpT7UutZx3iS3jbR1L9vVO
	vZxUYA1w=
X-Received: by 2002:a05:620a:890b:b0:93a:2a9e:99ba with SMTP id af79cd13be357-93bb79500edmr324344385a.35.1789554556724;
        Wed, 16 Sep 2026 03:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93a:2a9e:99ba with SMTP id af79cd13be357-93bb79500edmr324340785a.35.1789554556148;
        Wed, 16 Sep 2026 03:29:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/48] clk: qcom: Use common probe data for always-on
 clocks
Date: Wed, 16 Sep 2026 13:28:16 +0300
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFvqmoC/2WOwW6DMBBEfwX53JWwMTbwK1UOZr2mLgQnXkgaR
 fn3uknVS2/zpNHMuwumHInFUN1FpkvkmNYC8q0S+OHWiSD6wkLVytS9NIDLDGdMR8h0TXmGhSa
 HN3DL1d0Y0loKCWeGbiRTd50JndairJ0yhfj1fHo/vJj38ZNw+5n/bWQ670Vhe9XE6JigfB3jN
 lRkqGl721trvdEmUIMWe+3RWe8bFUbVet2G59mf+lD9F58QS2AjWyhGgKedGaY1IaQQmDZQVhk
 tne6V1MNFisPj8Q1hbV/6KAEAAA==
X-Change-ID: 20260916-clk-qcom-rework-legacy-always-on-clocks-8be60886f844
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8023;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NPylee/uXOo4zFpWq9gIhUUvSkU2nYYwInU3Y2Na6+U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9KtPaObkxToJEPWgnrlaQnIPGGMC72IQtmv
 eTGh1AJDMOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvSgAKCRAbX0TJAJUV
 VlQOD/0SxUktFNOna3LM2LUKbPp2MtFTBSvAA4SiIs0gO+y+TndXZfxmrRj4pBd+Pr+yzuxojiY
 qNABJ1LYD+I5xQpasdbQQi/eNMNgIOGXfizQJGXgHl4zpH2XfZ9fcuaOmkr7AEf9hLlE1pQnni3
 Q8u30EBWiU6UjPfjJei3s8E8k1yDpzAt8ko9L5C6uO2f78d4nSpYsAqUOpZOO9U9izyPGhAtprC
 F67+vKzIk3zOmaBJ/U4BI7/S3NiAti0MG0ZfatfDVC3AwmeKiotiWt3RXyJJhWD2Bks4jwe91NO
 xFIGjyEzD6XvLgliT74ICLe1ViUHnMVDPqkg/RDpjpHMpjVsEvtX0/G+GAR8gienVJyxkvqn72i
 BwWQQO6uuiX9x1qZYTvu6aEb3g89avxy1otyh4WOS+O4GbnUeO0//6+8MD5+upntC0bsj47EaZg
 9Wrx7yzgf0f+IJqz6BxF7vDYxzAnT9KjWieqFgkLuLiCeBNH5Fqm7N+dhZaEYbBS0yDWJpAgfKV
 V2TxiB4dBRQdrRDEOLut/AcQAgh+ZsIfMKnmYj4T1JHqhocKd9GKytm5pdvcpu0y+TltPnHNIxT
 r2UBlTu58nK1Ti2HxqQR8YluKwZoB+k6aS8JWQbxdFbln9srC/ZcVoVJ2VshSC1FkwYkpmj4T4i
 XB+9q/lINn8fWyw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: wQ3XY4MV-HoItmhq7p5FzLTSu8xc_04O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1tWBpi0kbZDY
 M+QsPLnz5mCgHKVny5ZRJ/tdAqCAXkrhwxGH0FRkv8dmMBUYqcHRPBvlq1NnvjZk/8mPlyQ5P7W
 mwbx4YbVuyVnkx5zGyiev8yV2Q+FSV0DzJncXiAc5LrmZsF06jRUs6WryvPgP/3umeOioW87R9e
 Xci+NT4Fqh17J9D9p02tpSECsidaa5HPfRCBsMgYMiNP3VBIhwySvMzPr5zufWqnBcOev9TQ/6C
 d0VBYigJMlApxPkMznJ/iTVbTSGIgFpBP2ObVB/KnDDZxD081zZwcjkElf2t/wyDW5EjlJnHTSb
 eIMfn9cjB2uUFPCcjnCg4MkG+pobwc6qnK1Crm2acet8CnAZ7Hec2336I7lq+PSfOiGe/L2F7j5
 v7F3mQV11U/TdjfQq8+jICZkkwy9TUvSdwE8THh2cgBAELkfo5YjstPj13gcgvcwIemtGAONnNP
 P+VBoJH/Vy9UiAvtp5g==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa6f7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=orvn4SbcT7PIIwNxgBIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6n2tmU6B4EXG
 OpwCz6cPrUdhqoyoIr+FtYEcF8xgq1Rt53d5Y8Y/PVN2AWBmuS2mm3Kz1NZuVqfV6jXBMu7ZATM
 69Vpyunxm7Mz5+XphDK1KHP6MynFObg=
X-Proofpoint-GUID: wQ3XY4MV-HoItmhq7p5FzLTSu8xc_04O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Many Qualcomm clock controller drivers still enable always-on branches
with individual qcom_branch_set_clk_en() calls in their probe functions.
The common probe code already supports describing these register offsets
through the clk_cbcrs and num_clk_cbcrs fields of qcom_cc_driver_data.

Convert the remaining users of these direct calls to per-controller
critical_cbcrs arrays. This centralizes branch enable handling in the
common probe path and makes the always-on register lists easier to review
alongside the other controller data.

For GCC drivers, also describe DFS RCGs through the common driver data and
move auxiliary register programming into clk_regs_configure callbacks
where appropriate. Drivers whose initialization is fully covered by the
common path can then use qcom_cc_probe() directly. Keep device-specific
setup in the remaining probe functions, including the separate CBCR lists
needed by the SA8775P/QCS8300 camera and SM8350/SC8280XP video variants.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (48):
      clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
      clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: gcc-qcs615: Use common clock controller probe data
      clk: qcom: gcc-qcs8300: Use common clock controller probe data
      clk: qcom: gcc-sa8775p: Use common clock controller probe data
      clk: qcom: gcc-sar2130p: Use common clock controller probe data
      clk: qcom: gcc-sc7180: Use common clock controller probe data
      clk: qcom: gcc-sc7280: Use common clock controller probe data
      clk: qcom: gcc-sc8280xp: Use common clock controller probe data
      clk: qcom: gcc-sdx55: Use common clock controller probe data
      clk: qcom: gcc-sdx65: Use common clock controller probe data
      clk: qcom: gcc-sdx75: Use common clock controller probe data
      clk: qcom: gcc-sm4450: Use common clock controller probe data
      clk: qcom: gcc-sm6375: Use common clock controller probe data
      clk: qcom: gcc-sm7150: Use common clock controller probe data
      clk: qcom: gcc-sm8250: Use common clock controller probe data
      clk: qcom: gcc-sm8350: Use common clock controller probe data
      clk: qcom: gcc-sm8450: Use common clock controller probe data
      clk: qcom: gcc-sm8550: Use common clock controller probe data
      clk: qcom: gcc-sm8650: Use common clock controller probe data
      clk: qcom: gcc-sm8750: Use common clock controller probe data
      clk: qcom: gcc-x1e80100: Use common clock controller probe data
      clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
      clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
      clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks

 drivers/clk/qcom/camcc-sa8775p.c      | 36 ++++++++++++-----
 drivers/clk/qcom/camcc-sc8280xp.c     | 13 ++++--
 drivers/clk/qcom/camcc-sm7150.c       | 13 ++++--
 drivers/clk/qcom/camcc-sm8150.c       | 13 ++++--
 drivers/clk/qcom/dispcc-sc7280.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sc8280xp.c    | 18 ++++++---
 drivers/clk/qcom/dispcc-sm4450.c      | 15 +++++--
 drivers/clk/qcom/dispcc-sm6115.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm7150.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8250.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8550.c      | 13 ++++--
 drivers/clk/qcom/dispcc-sm8750.c      | 19 ++++++---
 drivers/clk/qcom/dispcc-x1e80100.c    | 15 +++++--
 drivers/clk/qcom/dispcc0-sa8775p.c    | 15 +++++--
 drivers/clk/qcom/dispcc1-sa8775p.c    | 15 +++++--
 drivers/clk/qcom/gcc-qcs615.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-qcs8300.c        | 51 +++++++++++------------
 drivers/clk/qcom/gcc-sa8775p.c        | 55 ++++++++++++-------------
 drivers/clk/qcom/gcc-sar2130p.c       | 45 +++++++++++----------
 drivers/clk/qcom/gcc-sc7180.c         | 60 +++++++++++++--------------
 drivers/clk/qcom/gcc-sc7280.c         | 54 +++++++++++++------------
 drivers/clk/qcom/gcc-sc8280xp.c       | 35 +++++++++-------
 drivers/clk/qcom/gcc-sdx55.c          | 31 ++++++++------
 drivers/clk/qcom/gcc-sdx65.c          | 31 ++++++++------
 drivers/clk/qcom/gcc-sdx75.c          | 31 +++++++-------
 drivers/clk/qcom/gcc-sm4450.c         | 64 ++++++++++++++++-------------
 drivers/clk/qcom/gcc-sm6375.c         | 46 +++++++++++----------
 drivers/clk/qcom/gcc-sm7150.c         | 60 +++++++++++++--------------
 drivers/clk/qcom/gcc-sm8250.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-sm8350.c         | 52 ++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c         | 51 +++++++++++------------
 drivers/clk/qcom/gcc-sm8550.c         | 57 +++++++++++++-------------
 drivers/clk/qcom/gcc-sm8650.c         | 59 ++++++++++++++-------------
 drivers/clk/qcom/gcc-sm8750.c         | 76 +++++++++++++++--------------------
 drivers/clk/qcom/gcc-x1e80100.c       | 61 ++++++++++++++--------------
 drivers/clk/qcom/gpucc-sar2130p.c     | 13 ++++--
 drivers/clk/qcom/gpucc-sc7280.c       | 22 +++++++---
 drivers/clk/qcom/gpucc-sc8280xp.c     | 15 +++++--
 drivers/clk/qcom/gpucc-sm4450.c       | 17 +++++---
 drivers/clk/qcom/gpucc-sm8550.c       | 15 +++++--
 drivers/clk/qcom/gpucc-x1e80100.c     | 13 ++++--
 drivers/clk/qcom/gpucc-x1p42100.c     | 17 +++++---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 31 +++++++++-----
 drivers/clk/qcom/videocc-sa8775p.c    | 17 +++++---
 drivers/clk/qcom/videocc-sm6350.c     | 13 ++++--
 drivers/clk/qcom/videocc-sm7150.c     | 13 ++++--
 drivers/clk/qcom/videocc-sm8250.c     | 15 +++++--
 drivers/clk/qcom/videocc-sm8350.c     | 31 ++++++++++----
 48 files changed, 873 insertions(+), 629 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-rework-legacy-always-on-clocks-8be60886f844
prerequisite-change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214:v1
prerequisite-patch-id: eb58e7f69eb18fb6f7d490e8094d8a3f2c0d0b2f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

