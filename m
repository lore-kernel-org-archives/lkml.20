Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391604;
	b=b5QVmmGfqeadEUuXN3ACtO0N3o2ovIbWSMswtxKM/ikqhxYKG4ITR6d+ah+Jv2kmoDaK
	 ObvZzB23Zyt5pmgqF4ct8xHFBhyQjNxTPjjmJYhdbfNfOXd3jI7eyXkemyOo1wY4J8VIc
	 zlp8O2A9NS8446zylWEPF6dGKOi5FLjG3uqrktkBGHNRSIYSQwtogYuR1gxCKfs8fGJe/
	 fXQR1f3LIjiM0e7U+pwyJms4sgInGiods7JLqJLlDbwbiLs44sElkVWs3uEVFZ/F6ty3f
	 e7eUqiV6+lLp6ToHZKvfKZmdbpD/tkh1utyevLtk/4n1JCHNmlPKHcQHZDin7qM5WlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
	b=RtnSFt0sQqoMghnm8E0xnsxoYP0oJKrPYHEv+mkU4/BHHDtlAEI71Tp3O72dOEvw+rKB
	 A1T7HiQre45nlVwbyABLJFU3HustdhJAHwG8zaJ5n/Pw08J/h1vQIv/V2W1iMuB01rsmC
	 b/b2wARdbICv88MRjuHX+DMrQUus1q7IfuCYDIaSL9i83YyYB41fUs67r40BUJ4/15ssZ
	 wFTe0uaN2K6L3p6rhu5wc2liV0QO7wRW+bDA+G+EqDlJlbutFD2KmE6SjW9XUqge8s033
	 H8cjQE4ZHjz9YcsL/urPvS0ZPNQw0qFB5sgmhve3PMWF3ZkGFfBRfF6BJSYqbtVa5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA52A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhxQ94119680
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=; b=XEHnNNLiribYBojf
	rMyutTB8EFM96PKO2WMpzEMS96jggqPIRgn9nTNXJy/NlRYToVSMI9374QFm3Nhk
	lZ22b7cDlXiKWsi9v/KjMv6Hb+4t/uT+B+jdlWiaNY0vERznA7pdvNZkTe9McR1e
	cJvLIGR0PTE4o4HUjzbSPVWzZ6F+u8w/NAL5EX0DJ6VgXDpuLiNOHWC60PbsUOYz
	lB47WItYAKpJGJq/tykKrTqqRUWxdfBNUQiJv6ix/81OdmivwzAqm8SHaUiO7XOb
	MsiCLi1MOWnxKdxWTy7EnAOAG+x1xvkeODr86la2YQOOGgPmJgOoUP4gHIkq6ZhC
	nBpEnw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sb88ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so4470733eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391599; x=1793996399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=ffG+QajbvDDawrR7GcXGZ9KAaNvFa6bkKwzbxQQ5k24ktEY9RjRsdZfALIHpdz9iWy
         XCAx1GqChn7ZrGhcxpRNTYMjkP6Fb7+FekqtQQJMk3AFhNI0cBIknyNhaLqXuxopHJRi
         +tgy9kvr0krLeZ4W7SNQ+jDpjzgu14q2rjSU1JgBpTV6e5I4SwU51nB9+mcnF5hfQa9i
         ezwhYGKaegUqQk4VzvRCgeT7Kgrtt1nJCWLx5VjiOMc+VI81MBKsthck+dP6vi5/dAdm
         Y3F2nCde6bAvinRkXSyIsFx+moJ3eXu6oytS50Hz0dhA95qahMVzXpFJ9/m8fBcT2OTO
         sT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391599; x=1793996399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=m2p+SLNC0d1cqV6PdraTX1tvJsZUoI8LiqSPF65Z6yNUk3BkCt6V19/fZJGRR+Wiom
         eTZwC6phNaZLRoa0+RlPKq6OLZv0HWmNko8OeLEhz0YXWD3DZFd/O1sO/CZcCoo50Nxo
         ISreIbadRWeCt+2Esd3D7tpS0GxBX/v+59o7osDR5aIqkEXoeGLeVhmK/q++LRx03nUV
         s35o43qKK7k6Ba0RFG1PzV5lhMdTAJRGgxI2qK66w24u3Y/xEwcftlDi92K5ON6A/u+m
         CkETUXYE+tTR4Ng4FU6QqJUHHIOKAF9TDFVq+rnKY/BXUf4xAbYQoxFdqRTl9Acy+2qn
         Sx8w==
X-Forwarded-Encrypted: i=1; AKwUvBweIc2aTR9XnDZDLzYbAEJJF4QTZHC14MVJLVVa8D20ZDryqzvzhFVQcB/mgacKoehGL1dWuTvjdsX8wmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbn1G1/y2GZfMZax0mDT3WGXx9eiXR4pFmzF5wgVv90u1RVatK
	T351S7ssHOtYOd6fMhRJZCWLCd9p+7zDG+kreZSl9bs1yymj6rWu2J8HLYGtQxBrMOuqJee5IMG
	lR792kLTBPXE8C6fhQyPhvUrZePgci4avDepe5E/9CFT3buFumXDIjClJ0tnuHhgUxBo=
X-Gm-Gg: AYBFou2HIASoekGnSKKJSMrwKZtTdrTjBfj0clJdYHBANe9VNqxC9vIDOuJAjDiY0V8
	dL5CPy/pUN+9lAJ2WHjFV9ow+NQyDmgKgq9gSGTIDaDUHuukawzg55AWBai/RQFkawKsjq6KDAv
	rA84f1ozRI9xbDJRuX8QoW+1keeBfxXKN4p481NZHh3zY6K+aI4UG6Z3qAVatmwmsz2P/XxjpMN
	A84J+QGm6Nn2IAaFsELgtDsjgaLNB6otHY2uVy77fj6vEmRMA/dVqu1NhsxVhMyzqO6OR9knf4m
	5fOI9kSGv2/1JtF1m95fawHErHoOpsBO08HuCcCJOhFq/fuYoxENJcqWoJBUuBi07q/WQmjtk60
	xOivdYr/0TU8crmboMcFzuerZ17fTJGF/Il7sKtO+T79EeUM/5KCQBScKEH5n9/lByWoGpyaMwQ
	DzBdk5Pg==
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724087eec.16.1793391599157;
        Fri, 30 Oct 2026 13:19:59 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724029eec.16.1793391598552;
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:10 +0530
Subject: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
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
Message-Id: <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1653;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Fs8gGyy1BbD06vtwlN2GhfJTzyeqxPW+qZIMwCmZHYE=;
 b=n7tOrzm5p7DVClpQrshqWegTukL0PD/boqowsTA9qtKnrF0uCA3VMjiX7SRmhfJ3Dshm0WGG8
 saP89Hzn4TOBEPD2bHaI7bJhfjIQ9E9u8ZF9DJufX5VTEP306eWovys
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: R5QAIKn1tQ6i-Jb-2KFGrhi1iD4rFBAy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX4Ub7JV31qohh
 Y9/CIRPAR9ee2iqyZm9esBnyDtPxxN6pDJNtuGlQsLXM8aegdn9Ogw4LSxeJ5EJPgxHulMNdeye
 /vCzWgJBp66ViXcGkjf5sD/dT0SPcMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX8J0gWtyKwRwJ
 ldci8DBet/eAJ4awS7bmXkoQ82tiqRRzKwxITeOkBtdUOM0NUMkKpFiGepZ7aF/KBpYP3sdIuC6
 ij/lcKs4NYz8+sEPpoISY6weIkv7igCeug5s6GHKwN/hwhj5240dgVLxu2JiaYYBIVjN2YqqnZ+
 BUXhG+2pJBBubhaf8+04WMntKRnoWDZQPVBwlwvwWUEfv8pEi8MViyrVimEoLV7KiYNfltdSglH
 DzIXhnxjXlCRLL/nwSREc4ElAwUw1u4wBQSJ96HY4YGVzjeoWbI+aDQkrRvooxQgvfKfrmEQtmO
 KHDpBi2MEKIlCqIwJahfn4wJq8qP2oYKMZ9B8QoLcW/A2rJTsRMw/CwfUddQAMel/Tk4G2p4X4h
 ysQJ/stduHkW7qg1aleSU+9Rrfx35HSUXTWgvTRPc7wqOT+wLLUaOW0QtTuy3rp21LKY7/obsMq
 +sErLOZmKFrSICT1VOQ==
X-Authority-Analysis: v=2.4 cv=JNKuIMKb c=1 sm=1 tr=0 ts=6ae4fbf0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r_SgFHEyvr_bYIatxkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: R5QAIKn1tQ6i-Jb-2KFGrhi1iD4rFBAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300081

HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
caps also define a .set callback. As a result, iris_set_properties()
programs HFI_PROP_TIER again through the generic cap path.

The generic property loop sets TIER first and TIER_AV1 last. For non AV1
codecs, the TIER_AV1 property is programmed after the correct tier value
and overrides it. Remove the .set callbacks from both caps. This ensures
HFI_PROP_TIER is programmed only once with the value for the active codec.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..6888aecec902 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -997,7 +997,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
 	},
 	{
 		.cap_id = TIER_AV1,
@@ -1007,7 +1006,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = 0,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
 	},
 	{
 		.cap_id = DRAP,

-- 
2.34.1

