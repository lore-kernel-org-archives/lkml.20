Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6714CC62E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159938; cv=none; b=HEdN+Tzwmg1vAuuXXwQPwvvGeYhwdOzl0PzbC2Uq8YyoKsrDM9bXLlBiEEvLe9E+BJSxlV6TNTAMJI6j6vGNK57c0o/tl1dlZuPwirXdqWgaKmI4JsGGcChAJ1L+TOivr9Dlbo8G45V2pn9FvErq/qEOILWXHSbQz5d5psoeVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159938; c=relaxed/simple;
	bh=DyaBOf+OwSUzR1R9eT0BmgFC8LjBn0yOH1OGqxKZC7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mon6yut3t1ZFgpniNfcaP0kn0gXuHjRNHecNThdTqm5eEVEmbImyOkwpct0drPKoMcG0WQrM4euMISRnZUmckCucY5ZOl2fIUySejnqe15wFs2qIuJ9/f66r2lS/Y5YDitjihxSjNqHB2FNQEGvhf57EKuzP7A+zuov3IVotjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3uO4mBV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb+u0G14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3uO4mBV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb+u0G14"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5qfv3577671
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n01F7caqk2A
	Q9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=; b=K3uO4mBVqcAXEcNok7dRyQccDx6
	ZaaORXxI39UBGi4/EV0xwZPrvi8kwev855N5KiJb/6ZNLdidJhN5zt1xcoM6v3eQ
	NVwd6Tdv5iVX59rg3a03Sg6PJSBweahi6uxioOE5f0NM44QwvJreAjdKFTmmJxOm
	kouP5X5x+A4R+VSjJCUfNp57CQ2w6a3jzic88iaEKVTpSq6XAYbEjnQfptjkPtrF
	DbjBNLfVYAc7lzqs+kfsxjOs1vP+olP7WVIYOyT5L44EXFTK2RwNVDF+b118LpCu
	rsHEBS6pOlkeIe2fq70SzEpMX25y+XiGJZG0+GZxZFd05mUrKcMI03HxrfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262nhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so13251976eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159932; x=1792764732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=Xb+u0G14UThvQqVeqIsOCjnrYFAHX38roc2QLRaciPezirh/b3VVcnxnZzKOsvYLGo
         XQK/p9xAmfe+ePAezG83RsrEqRUfWfdhnSdMffMY0mLobLJJkcuGOKKfq7ovO2JXgvIM
         YX0n4gLd+WlHyaFkVZeYFVH5u7yeY0FPpCNEUgbPBTUUQ3jLSnRCA+coiqf9vhPVTu3T
         yuiFRuPmR9m5R8UvftjO+Qv75TsNRa1AYraJw1/zDiHleWnMeJ0eu6pTZFaCiVZu8tZO
         RsrHyavneoCU4w4pOTCJXVgE7f4D2QEQSQlzhlcWdaOqVzMFFBkdHg5WzEHc8PweXTHK
         KaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159932; x=1792764732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=zs/OO45d/TMka8rMdevK/svtCUFhCae+5mZprmM1JMS20xcYHIea5QrXWO15XO9NLd
         pi+96FfKE/vsjspzXsb1AIdFHC9TdMWQ+rh6kyfCffmHbEnU1p9GMrHK7h50ECfa4Pze
         am0tJjByBYhBMRhv84zSidzL2r694LpUf6tVXu8p52cFd/bxJaWGZqthX+gelExfDnfp
         WXvQtAY8wWgM+t1hp6i0Bgncedh0rtrEm7F1aJWMzhZq4ArMS/+RLXz97HUzW65jT8Lr
         gdBj7tvEh39iH0r+VFY/yaJ+ZPnnWYA+mTbq52Hu3Ix6RtBEKnkt4CH1knZBjwclBi+P
         H2eA==
X-Forwarded-Encrypted: i=1; AKwUvBy3ebGInl9E2KVigdLveXVp2TrgrOSOVpk5PvGcizT+fSSDXKL4uLjUpAU9hAhr61qD6CfGcaLMimuOKSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVChSNeLoahoORsy+bO/mrod5qcHvaBYSHps9/Ilt3ikXNg2OP
	+wUCEDGsvSeXeTFjb+o8VSOAFHRzQuGRiR41rGijjtXcDk5rnYvjT8uaVP55FZ9ofl18uhMTgu3
	f898yyYMi/6U0aD/8k/m+6+Ni/+q0UigEkHyWlZmye2rB7MJY1+2+h0zjT3dq3WBBBBY=
X-Gm-Gg: AYBFou2tIv3j5QFcA2KclW/ryCLmj78ywvnubI3jGtnorb72KGtJsBkcbHGlWHAgG7y
	UpzWx/YXPwIOz6QnXxOI6hJ8Mor3s6fWWISPG7Kki0cp/mzZTx837F44Cpp5TK0F2rCGaPXnTc+
	LH3bRqZ3JIUE48q+9R/m7CAE8n445W4cRTPG++wwVyP91RXvVD3jfcLzP/4JwTMGWmSqws/b/ki
	BLkX+oG3JlapEquzbQDaHvXUzRx/Vj2PHmnyb4Xv5TfspTNLE5N+QWEEBba4R/exvrkQB9nZm5y
	vYH4r51L8FDn4vqRS00+JiIV/kjX0XpCrFchF4x5mT3idFPWiyvRntp0dOv0EUtHibvHizkixvX
	uSeg68tn7BgTN28+YUWzdVEGkxtDY/kz+hG2veRsdp9cyJcCiWSVZicX7LII=
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr49014c88.33.1792159931876;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr48985c88.33.1792159931220;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
Date: Fri, 16 Oct 2026 22:11:51 +0800
Message-ID: <20261016141153.1346219-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad230bc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UQ7_avvXQmqc8gSTc3kA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8pFHjJWXn64d
 3gwqqSP+z3lYUXt1rXTS/2toQBsCThQ71HEaVhgjJ/t/0+EJ36NofQPgOhuSt0xQZNV6n1RVIKx
 yjVJF6p9uiHQrbvCuQzOUT22VRApLsAnkNFDyFPASuSkIwao/YCMPjSnh3g0ZXAA/DTe/AoOmPK
 zB5lxizc3nzR7tQrHZnmLY6JEr9h70P4uzFwre1Kli9FSL9Mn5Kc7KkZ1rLMdEVErzKh526vzP0
 shclujxfl3b8/0/VnL9UEUq8DTGVc+4npE8BQkwi7De4iGMqbZ+6K6hnWIetfwKFRxWm3vNIuO3
 8EBBpLi+8rfhGoYE2oE5CL8ezJjjcuaCAWdYyiP+y0kmZii4VOBbh/YWMNRgemAuUkY7ccUdklo
 Ef2oR4tzFqKD1sVemCPTFU48L6pPI6pOhyZdWOp6kbSNsFb+NfgRe0MSrRYYlKJwrCCFRm+ckKp
 bHv5vRSs5LRW5MAZPFg==
X-Proofpoint-ORIG-GUID: iD8CJGgSBcM-VdBg-uLizTUixXDA7ldX
X-Proofpoint-GUID: iD8CJGgSBcM-VdBg-uLizTUixXDA7ldX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXwYUaDTiucBkr
 TTkoxLcVcQ+A8PtkIu3iFV8n//bOF36n7inx2cGUHj6w6lIFVZzoeuK/kLUq1CF15C13IO3HNKR
 /9bzAocb4vXXAXSKOturUuS2vBjg4ws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet whose payload carries the acknowledged
opcode and the status. apm_callback() stores hdr->opcode, i.e.
GPR_BASIC_RSP_RESULT itself, as the result opcode, so
audioreach_send_cmd_sync(), which waits for 0x0100100d, never sees a
match and gives up after five seconds even though the DSP has already
processed the command:

  qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

Each mapped graph costs a five second stall on unmap, and the forced
status of 0 also hides real DSP failures from the caller.

Record the opcode and status from the response payload, like the other
basic-result commands do, and only drop the cached mapping handle when
the DSP reports success.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index ea6680925f21..702df80d2fb8 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -959,17 +959,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
-			apm->result.status = 0;
-			rsp = data->payload;
-
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info)
-				info->mem_map_handle = 0;
-			else
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info && !result->status)
+				info->mem_map_handle = 0;
+
 			wake_up(&apm->wait);
 			break;
 		default:
-- 
2.43.0

