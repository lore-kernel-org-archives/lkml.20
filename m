Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561838;
	b=Wn79b0auP/VV8X/jtaq5HznUpFhvsird1Wra+wPGCvN5ZyDUxtpAtufO3ZatnTlF4pxi
	 AU/2DlYehonOGgdK2UnJj1XFnUHs0/kXZyqaZKThiHujwrhlc4yvTSMPvQ2hqoYb+EE34
	 pRvAdUy/m45GGobH6pzd8FLg7r07zZofP55zZbVHDuKOQOMHxwjM4j2adF5bcZC+h/Pr6
	 STCGKNA3ofXNH6pGyFFetD4424OLXGxHuLXmURSFp8E0zUOB61bJ5/qRjvVk9oGGTu4M4
	 sTD+ELE7i/MCyy6CNlOmMQQPT01GwVBATyOpoFuSAjJAsZETzAdjVOmNTW89/0XsUUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
	b=OdHLxcCJ9RtJK8jySKUxM+h7OW6uuW1pjljMhM+SY7P+QwNFRh09EmI5yjNE4sDUCAPS
	 QX9NPhS+T71TkbAQNxXiESkHoffsWZkUrfDFdFslVUov7XTIt/StFVv+YqFN5emnr4uWS
	 HVt0dxKV97kTsBB+pHbdsjpCnlAddZszFYScvFaLoXUX3nHVeORLDo/381ADIwKVVqix+
	 tIDd+PYfv5YCBeYWEkN9GpPyZ4lc6WvNVIZDJk2axYa7euPZOtvYSFSY1QQey59qHCWkn
	 37FLmzCYN3iOc2ryDRrAnrELwhtdJIjQPALipTlTE0EueeHb/26xKJmAHItcABwI3Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFdSXrag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC6606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDC6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFdSXrag
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvEq2181341
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=; b=ZPkhEpS1uetK6yjQ
	lvttE82layk9/4/5Qd1qwGY/KYHhBmNtM8Tbk00kFrJweTJtK+1kKB7y8Nr+m+dI
	dvn1szx8s498bqmiHNsrGdmGTmmogUCGuy7a+inMz6o+ucyg4oFmZ4FIc2iFqJ40
	pxqAaI2/JK3kg3bmDHUUL+sL5EXeUezkDYBQN1T5286PwmVTP8k8m5uOWZApe4Es
	f7/3sSfE/Xk77UFbf/B+rxXGcpqixYsYXC6uBQxfiN30zrf34mAdlO1h1/jswVU/
	kr+OgNaRm47l3NQUToL/vqJTfaADd1eqO1HswywJ5KyjhUEDDIHlOLX+r3Y3Ssdl
	uF34ow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rpp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso22420385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794561837; x=1795166637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=TFdSXragtz2RhjkNFy6cdtpP4q/+CBN1awTXquGFb9ElslzIAOl2rx8c8ffUc5ILRV
         53GMo6oYN+4Yem7lPO8Eh1RA4Pg1hMGUzrFnUGrQxovzRLhOSO9r+lm7zHkjXzYJUMxb
         j8xaSQE0vZSEhVyvEw6AxU7It2TDeopksRWL7p7DlctEe9eqw5KzKLezw3B7bPvZomZc
         mRbVioeXV1CuhqLo1ipYMB9s3X4G8/hcABCQlK7zIjVOeTd1ADNlcowbnRyBM5CbQOgR
         t7kB2Xjqr20RUIEJytO7KWMPBet4wgL4VWA0+vm17bwfnoUnMk9Bjj/xblcnTrbW7ria
         cXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561837; x=1795166637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=w5ytizeNa/0cwHFZIVK4h3dBpb++NVBXhhfOcqO2f9YAufLyL2A0U/XYJAPxNv+d7b
         OFP+wAtg2xOXNUtksjewREnZ0TDNP5hMDFMZ6sMKe5noTYRsVwkzDzUmmWzGfSoq2PZ9
         zui+2gi9W+56Ps/XHZ1+vzxj5LLIEknV2aWTxUfd2WSsYpscFxWGLkiZ+CSAe9QhovZh
         36nAzogcuDLRpeY6tGZ2TZHA1buN/+qLFUkbAFUy98GRs8Fls+DWh3b+n0YrXb2GHVU3
         6wwOZuh6Bri9E6NsHTcQmB0Wwvco5l0XMtplgAVdvS1BrvqZPn3fwQClbFxmf7IEqmVm
         We0w==
X-Forwarded-Encrypted: i=1; AL+hErHxRE20po813amZayzI/UUIRFS30D/6gkQAkPHVq8+0o42Z1Vu8YQrTNMFzx6ZQvkLmtBwWhYBua5YDZSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3AyD1QWiJ5nfv3Lnbh2Df3hpoPUHG2paVcbABn9+X0U1kturp
	WZgKeuMXydHkF0Uua57+9c5BGFs2QSGDOM/A45ak4WnESGeQqqNl6miIjux4Bc1Wh8ccC6Qhx7Y
	5BKrdiA6pzy4hEEhPBEjYUevYEmmqLfE5FzKbLjeKceK/usNwEJSriDChO9AnIjJk+b0=
X-Gm-Gg: AYBFou0+I5MjvxgbNwaRooGWBm7UkX6xsNklBR4ciVYcWimR6zkExB5DBqRHD4SRzh2
	klhehxzuqq0uDsLRrPvAd5QA2xZ30S3UDxwyAExh8PYD1gFQGA+CMPOzAo7BRHfptBmmrCKZeVz
	EgCIqfa/NLl0frn/u39PRS/ligxZqUkOD4AwDEutBWxpFbaeFfar7RmRQtNdEHMwtte+lcwrZCo
	BHUI6GL/YwniaE1EglrFDnqRghFDSRtWhm9Xk2O7G5vK7yMxJungqPfLDyfXqEsKm8i1DiaCE77
	nv7gZHtF+yWkyp4iwHEJP6xxoyZhZFmTLr7P8Zc7wIzX5pQq36mp/2q10ZvJ3Qvo+VNfpc7oYES
	R6sTPlDgP62InPM6bzUBPrZIffsCTC/NmxGM+uNeijQn8V8rRXXlvW0zq+FdwsUhhriDo6og=
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299602385a.5.1794561836545;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299599185a.5.1794561836026;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b427ddsm70563166b.43.2026.11.13.01.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:23:55 -0800 (PST)
Message-ID: <36d49272-f164-4bce-8203-622038d35e8c@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:23:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] interconnect: qcom: sdm845: Drop the bootloader
 vote on ALC
To: Michael Auer <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013202611.3070778-1-mick@yoxcu.de>
 <d58c1d15-49c3-4740-b24c-17b850b3ddf3@oss.qualcomm.com>
 <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfXzrWlU1nZXpmb
 HvWG1J2UdB6tpgrfOfM04nXiei5mpEhCboxDHVbT0nmcAqvyM+3SbFIY679i7cF/jPmn7sa+3Yc
 nT73s4Gv3DkUf0hXHY5Ql8m7hmd/BVmFqWRtQPpovEMrCmKlWt3LNzss9650peO5EEWQwQbingY
 NLVsir2h8JQFZOExJpyrr4rjG9dGF2eMcfX+xbzJiLEMoNJRMK8OnaXeTMp/CibkI6CZgm626AE
 lPYclJAgIZ47e8nnP2PwWq6wmgpJGnidCjfIGJEVbjA+u+HYpAEF+n6ZFk9f/lJEwRAQvLm0xSG
 q2nAYeFpooeSpgH0eP/8cFrHXCVtlFWh9x6bclxLPuIaR/umWPif+2IPF5WN8Am3892gTKUz7ze
 eOH0qWd+7qDa5/SI60/VZE0rloDo00qJBoKvhpQVd4s6WSGVcIF0yjefHG6XrO/c/RErn8GKHji
 0UQLPO8CCsy4raqB9rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX7/SSapJz2CY0
 eI/HgerH7ZzWfjH3+GtSgmXjDki9S4pCtlhMyCZqc+5EMa6/d5csDREce4L2jlP+liJ0wAffvZA
 CEvnLBem2rMO1oD/RhdUcvHCVFRayms=
X-Proofpoint-GUID: YRlVtkpHWFXcbhTDF3JlFIi9bVxhTLxg
X-Proofpoint-ORIG-GUID: YRlVtkpHWFXcbhTDF3JlFIi9bVxhTLxg
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6d72d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DHITo_NZqFMnFYMPA4wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130037

On 10/23/26 10:02 PM, Michael Auer wrote:
> On 10/19/26 2:22 PM, Konrad Dybcio wrote:
>> ALC essentially translates into "prevent DDR from sleeping to reduce
>> latency", I don't know what a good framework for that func would be,
>> but interconnect (even though it has the plumbing for BCMs) doesn't
>> seem like it.
> 
> Thanks, that explains why the vote is so expensive in suspend.
> 
> I don't really want to add a consumer API for that.
> I only want to get rid of the vote the bootloader leaves behind.

For a start, let's do something like:

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 0880a287b0c0..f9d51f3d586d 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -390,6 +390,46 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_commit);
 
+/*
+ * ALC is not modeled by any icc node, but the bootloader may leave it voted,
+ * which prevents the SoC from reaching CX collapse and AOSS shutdown.
+ */
+static void bcm_voter_clear_alc(struct bcm_voter *voter)
+{
+       struct tcs_cmd cmd;
+       u32 addr;
+       int ret;
+
+       addr = cmd_db_read_addr("ALC");
+       if (!addr)
+               return;
+
+       tcs_cmd_gen(&cmd, 12, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_AMC));
+
+       ret = rpmh_write(voter->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC AMC RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_WAKE));
+
+       ret = rpmh_write(voter->dev, RPMH_WAKE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC WAKE RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_SLEEP));
+
+       ret = rpmh_write(voter->dev, RPMH_SLEEP_STATE, &cmd, 1);
+       if (ret)
+               dev_err(voter->dev, "Error sending ALC SLEEP RPMH request (%d)\n", ret);
+}
+
 static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
 {
        struct device_node *np = pdev->dev.of_node;
@@ -409,6 +449,8 @@ static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
        INIT_LIST_HEAD(&voter->commit_list);
        INIT_LIST_HEAD(&voter->ws_list);
 
+       bcm_voter_clear_alc(voter);
+
        mutex_lock(&bcm_voter_lock);
        list_add_tail(&voter->voter_node, &bcm_voters);
        mutex_unlock(&bcm_voter_lock);

Konrad
