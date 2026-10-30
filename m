Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391596;
	b=Iq+1a18cDyCf1qTEZJwvvIgiO/MH9lGfSbXyxxVk65vty8xRADj0Bl/zRDeKrlSZtKEG
	 E5Gq9LNjZFd7gBmMW8JpWj5BPNf7jli/0BWEmWORsJZ5xksJfjkOScRvW6GXOx/QjWZ12
	 UNezhZaj5w2h93R7fSfLW5qSV6O2Oc36iK2WuYm/z7JHh03tf7CjDYU3CEWGooJ7VUFPR
	 uOr6l3TYpgpwnJRJUxYCRtD4nJ9VqA9MCs46xIbPbYcoqRxzqI3xqtO5/5x6fKmZX16Ym
	 bNPogiBwgScXF/4rY0tFT2+QelugOWrhePUYtV3I6bbwaKxn6sLvIDQAKaQlFq2pgDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=x9djq8lpkDbtF0xst6XB55IrPUd5b2z4iUl6yGghJlXAXfsJoDv6Ltvl5eYtOSPYqQB4
	 kYivhgb2zydhIaFM5lq5YECg4TVwadkaWvq3mfrs5wtow5OEsV/9VaYGCs4CBY811eoQr
	 n4+hi8t4g+cV6LXFVQNhz8dtsDZioXGgadLjjLwZytlj+0I6xRMXcByzlCbkhYAirnsIq
	 FP8OtNH2T8CYN0PwLOd8vPJRNpYiHPVOi0s+8IPa+veoHHP/h9yF1zXt58QY9gbWiFgSA
	 ZooHDzo6rzzqf+DcKXKHrZqGHvuUB9kZWWo8c+Wjrqtoh8u+Do+8z91B1r8bpMMU43Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KHi/hL7Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD62606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD62606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHi/hL7Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhx2M4119675
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=KHi/hL7Qrdb3RLH8
	H2PwyMvxxHdNyzd/HCkNcYQ7v77xFqg/AhqMQiwZ6UFOGU5uXhLDzYDXm+c4Ngzc
	V66neTPztiJxr2tWfeEV+Tv304E/UWrBZqNWOqwrswVqHA5XdbhJTkQ7JVtpgm3f
	JPeSGwZwFo+4dilSG2e1aoJppwwChXKHTtdhaKuhkvuzHh6E9YbtOKdvgFqR4Odn
	0uC4RjY0EWT4vyzkAIgK/UHiGYx4z/fuQXRY6GTxMz+kusbH/qLlbdANv0MRXQ6c
	O1eBuz6YCYYQGx88r14WyMjAqprVl5CLUekw3qlxUVVTb7+MoNklXhSF/+/DkxZ6
	zPxh0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sb88wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso2926755eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391594; x=1793996394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=gfBdm2j4zir9TDsSLp/K8Ff10mf5dW3wVc/kciv3Vp9l6u+zpxdn0QqmQ4CoLLhUS6
         XHQ33EEw9D818pQpmCnryXPNoHbr1q1Z1zE9rUiP5QdEjRHdzbKe+VSHg9HD64u/mpoe
         v84pGSOd/eayunXZZ3is1gptUjfuWiKfqTZG5+bd5P0T6XefLxYUfkJ+j3Njwt7IZoII
         3A2PMcWQ1/0mSlyolFolRekCF5lf/xSqj/VRLrk1nxERnxZhG2K53gAq7XRqZ+U8JH0I
         UO4Per497PWNB/vx55wEQv33tUXFEdtERGhZP8/F+iAZq7z2J+0QgIfCeTF2Hu37y+9u
         M07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391594; x=1793996394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=C3J2kpjbmoaXCZkKuVuN38n0FOaLCBFNe0ZXKGV3bJ08iGa9vl7xq32TAvGuDXSnO/
         HENvunD0EbScOJ3re3qrc95izh3aX37Za/yhILPAjzPYO0c0+69WC+nV4er8FMTT9kaB
         l+IeLbnTtSe2GMSPoRcau0/I7n7fBescBmcX+6IzFoKjwGAWeiBZBp8FU086ZkTzagCs
         jZn0hTag4O7DjfpeFM/0OSwOZe6S7s7IrpVnbjvVqbdFCsHlMSieDVoSXoYYS3bDYQNO
         MIbTBAHK6VbiMFMh/xQyhGphQTy9io+gKGfJX49YYYMfyuYDExWb2OaI2rQUeDwDequW
         6l4g==
X-Forwarded-Encrypted: i=1; AKwUvBy1nw0QheJcvf/4Blm8kbIzXSoBiNV6cTb7yY3nJnU3zorR2CAY/UvYTMp5zri5zaYHOssF1sfsUbdx6CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn7OoCUQqsasyZHyleTUB8AaYT3WaO6F5YiO5DdTORMLIwBUpP
	21O2lxUIHcMWU3mClMYbTc9KmWNBnVctN2N5wlBxQwY5c6iAZfc3iF0uQ2jqU9z+xQMLE+xUazR
	Yt6LqXKlmZp18wABXoH//ylWGB5jptr8v4BtJnCJ/uQ3KdjxWbqx7WmgwcFQ1U5OkzYY=
X-Gm-Gg: AYBFou1Lak3L+BxNuDjhd/rCE762c0AMjZVMGIcyKXddsUde8gVbzPMveHa6PQPLqNw
	cyWIyTYw5ykX9hwVUMyMzpWl0aIGtomglzqZBYEGGgB479EJZRgQw8dPHeXlmeEPsus5xZpYhAk
	GCU3CbzyoIAQ/dgFLEy3zF12mGLdwSqAnOAnlTa8lIs8ilYcod1z+Wqdr/I/5LSBN0FPcJ2QsbH
	eGqPzpTQrKRsvN7VIoiNSdQslFsiR5oWomPyRwpz5ppbNpYbxZUs2/i9449DxHpvGxwnZFaHYBa
	5tR+M82PA29IFAeMepWb0r4n7ZFrgr4ZbRYw06mtTgJREmygosD8s75m/7pROOhJQEwH8AxwO6+
	nTi0YlcmRPsL8PZH3zcDPwr8ijRzbwRAAYuWBL+VCTcFbl+xvQijazoNyKVaMxH066pYnWwQpLx
	W2AHYLZw==
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616466eec.6.1793391593808;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616418eec.6.1793391593086;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:09 +0530
Subject: [PATCH 1/3] media: iris: Skip redundant decoder input config
 params
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
Message-Id: <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=6S571aqhfJ5YJwehy77XWoQ85ejcyXyUVLjoWWjhnPXbeza6WEjZz9CDIoLDe/8OAuoiY/cvI
 MaPULRwlQiEAKzD3uELQl5xhtL2q+d00mo1f5bIyUWLAVkAhSN/iGff
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: 9BvHzCFsd7fkbkjEQJB5OPSM_v2U5TDt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX7+C9haoibc+b
 wdrhzZjVx/gvuDnTfNhF7PQFYCSRthgrOOEQQk0J5iMdaawO5cd36nl6odURcBbDIzcC8JPLw4+
 QGJHslvi/K4IOKi7P1G0GAIkISfUfoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfXzbVIUXViOJ16
 m4LUjPZDzzJg3OGpAasnqqNHzQvNED0Fsz3hGHv+6ADExV+vA70Jy67NtlSDAwHpDJFnk5oi0JU
 tailtcsNf0EC+/IhpurbLobVsCEsioxWldPYGPCvyKpXWLILElZGB2iDBzYdAnY1tRE3zTePdy6
 m2gArPmJVBmq+d0m5W7fLtmO3XYHqE5NbC2CBWFFupYYPtJcYLvN0btlDlN8/EMU6MetXh+tB2w
 PWDhcvKiJ4E0WJYyyBQTlafEHOxSyrDdIO1FR6BI5zDy94ey1u+WcvMvsVCjs5yEFiOeWJVMjtg
 RLLdkWhyNVaLEszNWtYQPob+qcsseloPYriZPu5qFS6c8BqxTCs4q5IEQISn6TMHf7E8Een3irg
 P+nmPajhe8LiUI39tJbaAEqJkyXvraRQt6njnyQAY4+60azby808BsD+dXIRI1YroewQ67oYoqv
 JVqDzjSTYuxspIc877w==
X-Authority-Analysis: v=2.4 cv=JNKuIMKb c=1 sm=1 tr=0 ts=6ae4fbea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 9BvHzCFsd7fkbkjEQJB5OPSM_v2U5TDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300080

The decoder input configuration parameters are sent to the firmware every
time the output plane is streamed on. This includes streamon after a seek.
Resending these parameters generates a port settings change (PSC) event
even when the input configuration has not changed. The client then
receives a redundant resolution change notification on every seek. A seek
hang was observed when redundant PSC events were generated for the same
configuration.

Skip sending decoder input configuration parameters once the input port
properties have been programmed. Reuse the existing ipsc_properties_set
state which tracks whether the input port subscription and properties have
been configured. This prevents redundant PSC events during seek operations
and avoids unnecessary resolution change notifications to the client.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

