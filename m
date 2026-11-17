Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912424;
	b=2issphDVqI6kCFdmG3WdN7KgpXadkLqjrO7ZtAh+dAQdWyDIXy69VCMd2Y4yqOMXe4If
	 Kzlm6CTIctFeMsEDZfBfHeAHpykZmYtNLcicQAHfrFOzGy+kWVilaxUzBrx7+s6E/8gJN
	 X6UZaLa6l3Nng8elZsrn7WCLAlrmL6FpcZRV1pw+nx26cbQP1kBIb8hFnxIjwaKSkFcSA
	 8Y3Z8V4LGcoUIQFmZRH8D/8YjTvCUeWSDFQRaDJRyM/e2/cxnzMxDvCGoNvg0yRqA2oIW
	 2Ff/iSIg+7nI2taP3ZCS5JEN4wtDjupcxBo6nJTLmw3Yz74Cn5QMg2Dow3oZ/n6R25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
	b=dkv63/cld1gUHyejHSRRSa7DI9UH60bDkPV/CTlYre3BjNHoJFK51KLMKvvBurWxyBXA
	 i1XFaUP5ffn2DN6bzWbyOU8xtYwUTyeseF7YV8TMWMckf5vg3o3ZYHz5gjzNCjvHaYXy9
	 3Ea+cXEz1HgBJfUP53WN8CSgqL5zDub7PRqe0IwbZtF8oO5P1owHRDNrJ/T1JWl0I17j1
	 m1ND3nz2NomXnlUq08ywHqEDiFEKR9gubNAPJxKULRNBbcWA0eUKNESw8XwPMy6a8ntit
	 Y9vM89gmclxqYk51qRjQzrzfj2zSv9n13/A6EhzQ1esmuUPBsYXOlPGu/UUFy7sFKkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAUwo6gP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDDD606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDDD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAUwo6gP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8P0UA3407582
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=; b=BG7faaCpNM49oeVZ
	98k+QTU6JqdwQDU/yQ9DzR/9PmK3ci/tDVOtfKExdnjJ9Lweqcf3bjXI5lyFQ6Rn
	h2tOe2VXIdJ8mkaLLNmwvU5QA3dM624m4V8w8mc+eXKEpUMW8SonPCfftic+1V4U
	eiWpGi7CJzPozK0jFNQMbrt0Z4mgfUV3ElTsy8aHiyRit2t5ZsK2pGRfqopnOsgQ
	Q+sBa5siuP6ZlrlR2ZzWoC5Vkzz0DoeP2oCrBXOjiITPCIfB1K/vrjheUbkGkjfh
	YkAkxMeaZrugoTj8cIrpupd1uJJ8u9CPiWqOvN/7CShW3Y/QgUigpTyyWQDln3iE
	CN/AfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htjpjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so418930785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912422; x=1795517222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=JAUwo6gP25hRSI8Oy4GhKhX6JfOi7IRgA9Dj28wlW6qQSNn7XhqdxdLV9op7JvY2cW
         XbpaFlQthQr10Rh+d4ZaPTKFwY0Qoq/PSVRhaVckkqxNiVG1zaUQdxMJffqVk9FALWF7
         jr2t8170TvMH1+pnyBOFkrbELeSFpxpunniXTJRfZ41jXmbSGtKBBDkY/2jshE4uJX+Q
         V5NAeJOdyLToAh9jDQBllzpNCD8ARt878B2dXReAat6d5Hwo04X58m5ItDmfwTNprP+c
         0q/gyZ+9oLlSZ3RRMwwf0pjjmvmlIaZsgIEAMsd4MSQVDyWoWOSxE0Zop55kw+dzs+Tv
         GoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912422; x=1795517222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=PumhxBh02YbcNy2HQ3Y5OPlgktvHzuOJybRbtvZzJbMvfReupCDyMG4gKUfWxrcj54
         jTJLpYFgrCW8hW58Y4M9Cd7hrOFMOU1gYml2bitxJgBlt6CGDFY347vpEixdOK6nHEhU
         Zfx/FxnKUECeVpRwe1GKM9eJmVZ/X9Lvj7Xkyo3PKbYtu5Rsx7ThR23AMUKsHKVRwNK4
         Y7Yggl9F3OTs/RpO+VkdMAyKXSiYo/pEkiwHnRceRdnrhz5OYimNmh2yxIFhWifoFlPZ
         8dNISIMfb2MuahTx+pwcITa8UxHDrr/WtkZPA7p7dfm8E9JbJ9Fhi5sKpXy2ViUoBa5r
         mqYw==
X-Forwarded-Encrypted: i=1; AL+hErHTDc8Z7ozA4nLuZzThB2X/OffIH9f0ikiHffeDxzRCy9+bfwOLDaEx3T/ytlfZ1uixFADzdzkS1tg2pns=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VA3eF/4GA3t9zyMOq4ExTzyx0lpUyFqvPw4LjVcFMXBZJNw7q
	0bZhaemHCj11DS3aYhcjtDtUif4P59FXhCT4r0l7jrsxmA3bS9/kbOW/uovFT07CSFkrBJyyiMC
	WeMLtqPdcQ7dixRrQM2E8XSwzKx0s4HRI+E4h4vUygIit2Qhe81sfAH0RVMmaVAD/UGA=
X-Gm-Gg: AYBFou33GVwxirkk8YodgBbGNtnuOOULY+DrIiAN9DvFS+hzRkt4YIS8cDMfd+Wl0Y9
	8Vl1Axgsf7mIQbA8FAUVNnVkbNk1m7Nc9rxRYyLI0XLAL8/CXQirhU6VTFbb+3CD5ahPxms21my
	juxgblW2dXeCprxz1d2/RHWZboCxUt9YlzRRop62s53anpb03Q3vi583S1lzbHDV7GFklDGhmlC
	WgSBklJojGAPWRyr+baSZqB5rPU11W6zZYnnp77eSljQ3q3qyZG3BMawpZW0huBNvr7X9KUTSA4
	VZ6qZqVm81i601nPPsajThlLGukTwDszdp0qFXGXvoT5Jf1mAaHkyC9uQGlKwRqJu4p9rgy3xSd
	z9WS+xYRCD4cjXHEqdtP9KC5G5OzKfe7o4HmP1vtjXq0e04bK+4rZJs/99c0YCY64tmue9DS5p6
	Z2LhUkvrnSJVW3CTO3MdCdJVbdo/bkRzJdwTZvWPZdmf9IPLOGJDMKU+Sl3YWPtbUNQpcSsKJIs
	a455DmzdnTz/+vf0X1T+JxYRzI=
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289416385a.31.1794912422424;
        Tue, 17 Nov 2026 02:47:02 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289413485a.31.1794912421916;
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:53 +0100
Subject: [PATCH v2 1/3] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
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
Message-Id: <20261117-iris-fixes-v2-1-0b21201ab137@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX5OdeR8MrbIFj
 9CBSBLWrFkjnD0kiyo1vDHFHfEW8iDqV7ahVIVyYQhjlJhmsQn9UzlObk6SZNUtbNbXvA6S7PK7
 hBeJZqQhkIgb+DxvL2+YSbrffiA3IoQ=
X-Proofpoint-ORIG-GUID: FOm0zY_fctuWBBQhAZr2TEiGGRemPKLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXyKfqaThAU8Vt
 Lak3fs1QBoEwcOC2+NqsK7Ev8AIQPZyUcqCkQGjxQZEj6WHGB1cRCDGpuvfnJD+l9r00yIgzoqm
 U+CsXuQZVTFAQnLfaTEMKobxYm7KHI02A6hblFTYNUmfhGMbCnH1wlHh0MQOcQTykXq/uTvp4eR
 Ct5p/2W5+TgnuLzRcabNQJzmBFEE3MwYWvUv4qnW5JB48ZeCTPxcd5CyJ8SsLTh5qYgBMyD100F
 NlTVu20ZATePw9y5wjRQV+5rlPnwGVpU1QVLH646G+sog6kVkzZCSvR3vKBX6uFMzHszZIQAthe
 QlEdWsiFUUg2/d7Gm/gMAToVGhB9gXmalxEhg9mG7w/Qfc0vFNC0P1JgO7b1bxNf1PFXQJvuhVQ
 DjFqO09aIL7mO8aZd0ol3bYMb4JeehKWZ/TVgf65texn1l1d1Hfn6qVW4JqIC07pxAsgdoO57i6
 HHuOvVq3q8qP//Ak/sw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc30a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WErB8th0LOlg1rsA1XYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FOm0zY_fctuWBBQhAZr2TEiGGRemPKLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

The encoder keeps two source resolutions. inst->fmt_src holds the padded
buffer geometry handed to userspace, with width aligned to 128 and height
to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
to the firmware as HFI_PROP_RAW_RESOLUTION.

inst->crop must use the visible resolution, because
iris_hfi_gen2_set_crop_offsets() computes

	bottom_offset = inst->enc_raw_height - inst->crop.height;

iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
so any height that is not a multiple of 32 underflows. Both offsets share
one payload word, so the right offset is corrupted too.

Seed inst->crop from the requested visible size, and report CROP_BOUNDS
and CROP_DEFAULT from enc_raw_*, so the bounds match the real source frame.

G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
report the vertical luma padding, and the hardware is programmed with
scanline_y = ALIGN(h, 32).

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --get-selection-output=target=crop

Before:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736

After:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..c55d2d905c0064c6d292158ac741571a1471dc82 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -312,8 +312,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-		inst->crop.width = fmt->fmt.pix_mp.width;
-		inst->crop.height = fmt->fmt.pix_mp.height;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
 
 		iris_venc_s_fmt_output(inst, output_fmt);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		switch (s->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
 		case V4L2_SEL_TGT_CROP_DEFAULT:
-			s->r.width = inst->fmt_src->fmt.pix_mp.width;
-			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			s->r.width = inst->enc_raw_width;
+			s->r.height = inst->enc_raw_height;
 			break;
 		case V4L2_SEL_TGT_CROP:
 			s->r.width = inst->crop.width;

-- 
2.34.1

