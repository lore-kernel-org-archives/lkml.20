Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912425;
	b=1XhA3HMbUHKXeWvZMhnf5x51T1qodOEEVuFbvMNtgtgor0CWPTHR2V/11yoL0m0dhqdJ
	 O2hS6r757LrqXXA6yFtLFXOctySBhmuDXVGs6yD1W1upM7wbMdA7h86UKLsmBRZRKa6U3
	 G02R/rW2IQdBUOOb9lPlYAjCw8GpUAaFv4JznW0kKvUk+n9uCcAlAu+umo20GF0Z7yEAC
	 qanuTnr26YmUB4hGbaQGxFcIuB/8+yGj6Yc+o6Ho7Yq1K3dn4CVnVi+1O5ici1Ns1eTk7
	 b7kA49jDWF4Ni4zgjcYuhk8Gj/wi73fpgjbBnN6F/orBvR62Ms5/cb6VvozKgx4SdSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
	b=QHFmHyLv3qGazdzl060daBXbkLOt43aQJCIcT2cIgZDDz4tlVFGZy4tSwVuBvzWwhMdv
	 brUl5jPJ7XCG0Y36j8MszxmcFCee+4CE7paz0XyZhkvFc6LwHsY3lQKMunPqbj3ixRz1O
	 hlG+ElQPwW3jqjwR/EGRYibQLwOZvvUVIoiQug0vVqd4JZAYgWcljHqyjwcwge1dEUOoU
	 VLOvIr0iRbpUZkYo7DLi92Gjz79Z85fYDr+t65b+ELg23VaUm492OE09vjbnWTKwIkZOw
	 NLlxh/SJhw7Z4NeRA+uyRsOgPe8udosNfBbi5P3gXB+gC0EawYUyBxbkrXO9HEG1lVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+ROPzlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEuUlNbJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743FA606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743FA606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+ROPzlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEuUlNbJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHA4xfO2790622
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=; b=O+ROPzlcOMj2mgr3
	1VsDNsZlAT6WiXJTYMdgnyuzxuTUUbMwjb81PmZ2UjhDRqUhw+6GLvLKbBZcIxp5
	YLjMJrE4GI7wseLDWWUt7mAnHZa/VwVkr3zj8zQHc9Unyb3grf2rGN25qm+9Ws3j
	amznl0owijfOd/Q+N4FM1zCc7K7ohLMwfZp1j2hjo1g/0J2y9Am8VSUuSktp1vsc
	wCSmlDpmsDoR/g+uwy+aM6HDbyUV3ghU8OVNXcJJsEqfkiafxN5PXBc/zqUuwmGz
	btQH584uOo4Lpnwtf5ISdRfL48JXVqLptZXswHXukW6PHCvJfTAB/1OEM+rKrF8e
	xDNDAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv105ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so1123925985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912424; x=1795517224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
        b=VEuUlNbJoWmCbqaHAinowMUl34/DVih/siaS3O4iHA2bb5HmCgkcBH/SHqMWZF3jeG
         7zUKeFnHmStPVaDgczJLNHAWzxtLpyPFA6s4kceK+LYL1e2YW2TnL+jFHx0WK1VLsdSe
         ftr4EBvDFbbyjV8OsLqJsng9frrL0pSu6nGEs6nxo3dba439qlqOmb13nvOR/wL75t/l
         WZfA4z86fyieqEESKR5nwFOfNkjkIoBnIW2fryd6nwG4A3yGgOydWGRBdykSW9Q8CqOq
         2ZVuzujiOW4aViKVITiVJXsSlVownYl3zKUa+UR2Bu6t9dZ81fvqQKMfRTaivbVfkR0U
         kytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912424; x=1795517224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
        b=njmHypE6jeqTCUl4Ma1SbvcYvunnpzrMetY1ujSTkygWRV4CSm34KRmQjOdWOZVFMS
         tli8z5RXF0AnEbIUsfHwloXVR+o2IuzoBdnpU92Oh9eYqAikopzj5galYyEWcHLE1uKL
         EfuJSQn6TcKgF0pNUFC/pAwvvaoSBoDqTQbHKsP/bZ04wVinAddVJNLL/E7JKxFWfb/t
         Wa2LgD163oLkPD05a+HBzAq2ju1jw/RIdsdQFUuKBV1bpxXadlKDzGpdSKH6QnScXls+
         5gYjZkkuz0um4FxKdjXRPIdKy/6HwIbgo6QaqYxSZ+3qnsEYdkBgiDU+mwQJyrHO478q
         THlA==
X-Forwarded-Encrypted: i=1; AL+hErHa48bTGXIQNKyiSViRTMHIsNnwD/qVBhu18oJDtkwCKFwKRISYIe5qY8HDEnPsvhjt2WujLRRTwSkJDio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ta6k62CF1TX8Ti/MByRoF/NQIbdRi3O+zwDYySDcm+iTtgO7M
	/hVSXYgM+Bz+XUG7KhxQU6cyHJa5bSb9ANkLFWbSJlTtjD7UDd8kXH2wBdHQkxOb5EmRJJnWUYW
	rbTc/UOznC9fKeXQNMIDsitBkv6fzrJnFXfMkzbc4+DxceWq5enkqcwrJ/VTbm1LAlY4=
X-Gm-Gg: AYBFou2+4K1Z6jZttnnf2yz/O3DZ4fxY8uSt09WGb3OdUN/xNSB8dlf8EgO7n+TLfeO
	A/ZPRLG60MZpzcc4RVHIMsRrPuYrjDbFTH6oKMyA65fwENFWOOq0TWCTB/QSfufGo83G12k7+6+
	JPoeY9eTy6Am7+Hd5vYYypWJncFCDgOYR4MhdjAnw6OTxuFXpKHf4YfiTz6CW89Gvs9Tzyr/Kso
	JvQl+LkatqIpD0KDtcDtRmrIE7XhmRKysm8ui1ITeU+uuG649OJH9CCW7tgwMFK0o6kD1nUh4j6
	fQx155aaMctV+NeTeRoXaQaEqtpdwnIqw6Mu11Od5YRslIK36T1qVrk7FiLbFGJgExkuCixpFYV
	fGS5txr3R5nJALS1s0C7N7gTqzXd6IyuIdd2RsoS/Ip40TNnJm+TEGabSJyYj7+3BJdC/mEvmIV
	RTpJyJ3ZaJxVt+2QcyiqsSxaMLIQgvnv5v3dFZTKc6jRJZQetvHShAQEmxfQuP5G/H7dicfWpkj
	FQ7Du11VL4nmz1kpu9FYLoy7fc=
X-Received: by 2002:a05:620a:25c6:b0:93e:bdeb:f067 with SMTP id af79cd13be357-9494bc0cdcbmr2164049985a.48.1794912423809;
        Tue, 17 Nov 2026 02:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:93e:bdeb:f067 with SMTP id af79cd13be357-9494bc0cdcbmr2164048385a.48.1794912423355;
        Tue, 17 Nov 2026 02:47:03 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:02 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:54 +0100
Subject: [PATCH v2 2/3] media: qcom: iris: venc: detect scaling against the
 visible resolution
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
Message-Id: <20261117-iris-fixes-v2-2-0b21201ab137@oss.qualcomm.com>
References: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
In-Reply-To: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: kglZset6f5u_fhwxbdLodCwlytR9P1gX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX640DwmJ+LhuR
 o9JrqXZliDeeN6vF8auRskG905GBLBF8Gb6RIN67odfDIr59mCmORyHBMqznzyUN0jzm3dnDkps
 7v6I4+JiI7KRNJ5dxRIYufru1hw4zas=
X-Proofpoint-ORIG-GUID: kglZset6f5u_fhwxbdLodCwlytR9P1gX
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc30a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WErB8th0LOlg1rsA1XYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX1nYNCmPdwz0A
 6Qa4oJTWbnt/yMfMe8VJZwKl3lbhl77LS0SNuutDapRNSV4OC2dTc7mWf5aLfMPfGsMgIjS3LSa
 wjKxOYXObZyy1Ih1y9ahzTKp+mfm3YxCGTbuhp5AdaKSZnn2lQ9f/5iJ8MLZszSOsihuFAWP8CQ
 xsiCgjQ6kHrWoaAK5tIPfAaZysditqqZHS662GqUiaaVLa8aIy13H2So7U6dvAJBjHLjrPFRMlN
 8D39/xfw99DqjILrHv7aifgwodj2d9XTuPkyw5zkQS6h0CefMSlnOXNj8XGc3BXXxglDa+HpMdr
 3QA0LsuPWHdlCG3ceW8pp1grEqTOjPsFQ00wdibHLGF15+IQ9AnmP+982zSJhvRucXSPinEO65n
 gIhUWsGPrGnDrrrOKezDWlAFQ1pCbkTcZ02zF/2rt4wy399F6sM+j6MpluPEZMpklepcp6CBgGf
 b2R7JRdlWJZGKIqFY7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

iris_venc_s_fmt_output() decides whether the session scales by comparing
the requested coded size against inst->fmt_src, the padded buffer
geometry, while enc_scale_* is relative to the visible resolution in
enc_raw_*. A 1280x720 session that sets the same 1280x720 on the CAPTURE
queue is therefore taken for a 736 -> 720 downscale.

Compare against enc_raw_* instead. iris_venc_s_fmt_input() has to seed
fmt_dst from the visible size too, otherwise the internal S_FMT it issues
on the CAPTURE queue hits the same mismatch. The encoder does not use
fmt_dst for stride programming.

Seeding fmt_dst from the visible size also means the codec alignment has
to be applied on every path and not only when scaling, so that the
CAPTURE queue keeps reporting the coded size. For 1920x1080 that is 1088,
and the firmware signals the visible 1080 with SPS frame cropping.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index c55d2d905c0064c6d292158ac741571a1471dc82..b367367ac2ccf874a00606b8b1352fed37b37a57 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -240,14 +240,18 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 	 * If output format size != input format size,
 	 * it is considered a scaling case,
 	 * and the scaled size needs to be saved.
+	 * Compare against the visible source resolution.
 	 */
-	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
-	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+	if (f->fmt.pix_mp.width != inst->enc_raw_width ||
+	    f->fmt.pix_mp.height != inst->enc_raw_height) {
 		inst->enc_scale_width = f->fmt.pix_mp.width;
 		inst->enc_scale_height = f->fmt.pix_mp.height;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
 	}
+
+	/* The CAPTURE queue reports the coded size, in whole macroblocks. */
+	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -293,8 +297,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
 	output_fmt = inst->fmt_dst;
-	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
-	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
+	output_fmt->fmt.pix_mp.width = f->fmt.pix_mp.width;
+	output_fmt->fmt.pix_mp.height = f->fmt.pix_mp.height;
 	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
 	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
 	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;

-- 
2.34.1

