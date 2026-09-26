Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE543CEEC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428104; cv=none; b=lH+hfUhyu0YAXzPh0TiCjO13rNv7BxllADuJKWsQC03tiMD54uTWaWLs+rclfPfaCflSKYCuoyfpWGPeRu5tn9KvTuv/xAWPesa2Fz0zMmELcimTOg7P9ac0lCM3vwyHWDkEOR/62U4fCx9weEnzloNhlpggFaqTwKt5/0IM0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428104; c=relaxed/simple;
	bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/gS4Cg4961Usj6DLKHYzxiI7quGC3ylXfK0oSlJl8XfedaPyQvG7ONFJdebIAsvLP6gPMACiq8EeXm07hmPM1zEGZheZO9/kMaBTNQTNf7jlB0fRjCuaOpDTyDFLXKdFaftF7ujKSdeMi19V9X9AQsAEqWxI0D8mGC3sSgLrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHsNr42T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anI75ES6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHsNr42T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anI75ES6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAnxGh183559
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=; b=lHsNr42Tw4Yf4LE2
	N1xU3kuQAZdEaTG4Cw/2oqWZszsxeXgNdU+2aMEWLLm/3jGdE5fmOR7s0u47J0we
	FZTpOzw+CcRw6vvCy2FzFYOQgqpK6tS9CVW3SdcBgtTd/EHMTFtGkQG0r3XMTQSy
	NqCweTRKEmOwhauacA/T4FhyvJEDrKabmG8orQt9EAkCgkvf4TOS9g9sKOj5Oz4L
	Rbf6YFxbGt0VQsg92/QnEEvVwdzAwEMrXJmTaKnc3EJmJQcqNDQCc5ywY/lUpcXU
	LEopOjeb51QPaRMjcOH5qt2lOLvHHVgX/n4SmlFsTL4IRXNPG+UsoQbGGONXdgZd
	PNi7Pw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw8xxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2961639eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790428101; x=1791032901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=anI75ES6EcMVxEQkOPIJHc8tN0lkzFrMeccjYLlXvFNfDkqKONDH64NFWGWGmkLmXJ
         u/8eAsqDg/LwlhYV86ezxv+nzg1C3NCkZg7/Zp94p2GLckcvAq67sRSOPtLX/LYaTb0P
         UfFdxCLmhZUpBjCAsijfgGzgxmd3OXwXlC+heS/Mxrm+FlEB97H/3erz06qacuBDT2El
         aKNocMoflihBffCdm9lMMACSD31E3Ow1scFXC15/NSBB5HOtCidVn4tSbY4rFd8aKtCa
         nW4DPK0/MZ7lT1n4N0SrMplo1yR8ex+/qVxD428RRbebzPWriY9MEo5CRfLrTCCJT5B2
         X3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428101; x=1791032901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=DxWrpQOWhB4P7REeNG6sU9AjAtd+ITkvXFSDcDaJm+LEzfJERO31jlW+uLTtoUuIZf
         6lYJA3XR6SJ1tUZTpvw802gzf93TInP88Hnw6JsB4flCQApo1cqUwTJJOh3om4Mwub98
         ZsHUdoYCI8R6SzdwpMXBjewNaQ5NaAbmcKI/IJfqL3RtKfkYFy1+vucSMFEa97oNkg6a
         mE2UCWrUHywlcHkZggGPTGy0MPlCYZPYOv8HdXkb2t9GlY+Lt6vQgWdgVMNRRP89AM4c
         nvknEPkC+6srSPBNBgZ2K2tin6R0RjZC0MjvhsZK4WsUgq1mtcAF/1rVbpzECh2jyToL
         Eb+g==
X-Forwarded-Encrypted: i=1; AKwUvBzH1pWznm0NVkAGl2D/EVUfxJTo5zreD1/OfCnnD4Au1Dx9RX+AqUY/2IXiKd3cGcU9XW493jv+lgRKoig=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS26cCiE98GKEt8JZewlaRZ7Zt0KnBQyCDnJn4R3uo4Kml4JxX
	UnOdW5EGC8eVMrJHVYvfcXc8GqS/rlp1fiNxovqAj9efEH4jRyrXH76j0OGoQgYAT1qp/IVULW4
	PrWOOELnJu9x8aoRrEl6giW5b+an4kGuvkFDKLYSDgG6fIzPQfcXmB9YBa0aHCm+ga7o=
X-Gm-Gg: AYBFou3gx0wkZn/c29hhRLSgmuwT1gc+QtD7QyKjz0jffM2T2ptoN5/nCwqlsll5lui
	x2uBw4hxlNa2AyDWu196DWvaUdIE5CkwX0L3pInOsMbO8hsIgLlEVk6YURO+Sox63yygQVjR1Jl
	GC1WrMuiBVhhf6rBGfYBElkjUMdI6sAuZdoPCM+nc2KJAI+kKdaU7+ljc+eqdcEuUmQGxFE7ZPX
	O0dyzaPbsAMr0J5yBJ0+bNy8Dy/0SVp5IqGgDDK4n/I+bCHxb98gwN4oeyICrgVoGGtn8jQYlI5
	yEveOFIY8OoId4wkVhFQeia7vyGtQWQczeCdpyQy5ejFtPRlv4yaVHEQj47wsyE2Hx5aKeAT6Uh
	9CeOT5AJmkNZPq+lSR0F2LzRHv8kBijs=
X-Received: by 2002:a05:693c:87d7:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-343868677bfmr1025476eec.29.1790428100756;
        Sat, 26 Sep 2026 06:08:20 -0700 (PDT)
X-Received: by 2002:a05:693c:87d7:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-343868677bfmr1025445eec.29.1790428100180;
        Sat, 26 Sep 2026 06:08:20 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm15356614eec.29.2026.09.26.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:08:19 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 18:38:06 +0530
Subject: [PATCH v2 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v2-1-83dd80765dee@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790428092; l=2664;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
 b=AEdACCjyVfp+bw2inhvFvXZGAPJpY96uo6TSdMr8dHDcu0H8Z7vmVhV0mAYyZwvXUpnZKgUYN
 KOn2OBgrvEOAde/vNfcYaf4gC+QMLnTB9/5YEubHFi6MOptGuqyVf5w
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: nL8R6Z-gpDwUUdcS7SVkOC8D0O6kdmYE
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab7c3c5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nL8R6Z-gpDwUUdcS7SVkOC8D0O6kdmYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX8Z04CszlmQ9e
 ApNokAmIzOfWKN6K4m9kKDx6sEchm+4Xcud4UfzUpQsmBLXeDuQemJDp4UWCq9eT3uzJvcp6rVC
 zwQ+HMXccb5vgH0o2lhQzLB/jnV+bq75ob+T8KdwgbREiieHlv2Kec7080HRuKpYZdFWbpjVNwl
 Uopv9fNWI/i/xXM/cwk96h0vSsAUtQ4MIfM6ETjBh1ZokXgxB0ZA6tx0Z+lCi122vEPfGSoiSIb
 jz1m38Bt7q9KvJeJujwxqZKTnyox9a2fSApiONUyBbwXulqvrlz4fsp7NvwjgsREGO6ObPLgvHx
 xy70yO097GAfUsS91gvu7piPtHzS//5380TPq9BrhyNqnpk5N5U516DKW6rEmbtixmzBRO4rQLQ
 RzPzfW8enMI319bTgOhUPtYGsnxSBNR0Bf0XE4rfU9gkbEXUHb8SOveIWXesUkra8wJfdoML5ZM
 tkrN78jFzMiuhIUozcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX0mbGGNkgXJtN
 GhorY7+1yPGqlcrVA6fmQyaZimJVgRihtTY4kRhNrMjIbvcfceUEIYCm5+8lOOt/tUeKtnTILYT
 ZXoO9pE9YQjC5ycO3KgNethUhdOXxiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260052

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1

