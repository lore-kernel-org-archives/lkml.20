Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912428;
	b=z9AHOqrB0JS3WHttZ/JH1aaa2BbMkZQeTLUwRROLFwe08lULTEi6pIGD0wKxhT+IKbm3
	 XIRHVIo8VKriIEJ4antKM25xIKdG7+Sz+3cl5lYXOoQwDzvcl8s91Y0bO4wwIIOLfmAIu
	 ykKVnrW/WFKhEppVKybWlCkjyL4+RG1wv4/+pHa0AjsII03S89DNDLjVyeVO0iNHfr6Ey
	 rIDpgqID/tiMwbBYOHiUBGNPc8Dsgsa43m2Hr5wgMf4DiQzhL5poEY/tGAN0BpRC6S5k4
	 6VxrJ+8OUi2rq6RaxLezzl0WmWQ8oFTSL2pc91NcLTplzOTiAXoqvHV9CyMFK5RMCgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
	b=kEzi6aqQaArj8jY8OPjrGVPNMFRffTa4cRBEsyxCMtzHLpbXvhdUuzbw7yBHYWIPgiYM
	 SpXWwyBwHh3yUFBCA1lRtDUX9CSO4PPUOPJo5H6YHwTIyyBpo7/cvHiOFBnre2rgIY873
	 UMyutIaQ4DFeD09ko5oyLCJSvk8Ob3A+ynoXZIJhhwjCQiA9qkNIU4gCgt4ibCQFtYwHp
	 xsCbthus8//Zu48N9G2qRxNUVmvJ7E41X+jsk6CkucnIjME+f1hRS7sM1GnXwJOsrNDfx
	 nDMr2og55BWxMqGqmV3jd91jm8JcBfv2E+GbQndQoyhJIHvACsOQBdRWa3wnmps/w/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfdiHtmI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMTUUIjV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6C606A8A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D6C606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfdiHtmI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMTUUIjV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8XZFe3624144
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=; b=VfdiHtmIg6Db1BiO
	mrffSkLDi36r8Fi1hVhk55DQ03HmiuecR8GeeFPhxhwT+wl8PP/8VGV+kadhpsY8
	WExf1/+tRp8evBFfTWYQX9NgsgBHvlWxG6XxP889MPPIH7/hSPSE3F7efB14+nOn
	MOldFl1O5sUgwmBqNVithNiNRUHmnbxqdKsdmS1BqXs/Q47pxA8o3Fjrf/bRHfoy
	x6yD6Eksjl4YJa95QEyZrLP6GODX1eiJQXS5S+/2ezf1llAGeYcpYGYPjkFcgxXI
	FVsb5miAYbhQLZ2NbD7cKMthUBa/c4weczYTY4YyyNPufVB00ayT0yPnmyq3psQq
	jnqqHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek6dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso134994885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912425; x=1795517225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=jMTUUIjV4Q6R38fGmxmWHFsGU9jRh99nJFc90Bryns3X4ynDI8PN8d6wTrdkB57ie5
         h/vlNfo5gJ4C7QYy8bItk/AJwRzTAyaC6jv3EA1315T6oXtA2bJYrX9frgyrVb9NiRJN
         OKes3WCbzmVzen6/WbRM4ywHIHa8rwmlygQpOGWx/UmuTca+1pCo/WHWHRDY7hlwUe5/
         TXI9rR4RH8DMwjHn8oUjlSJfGcEYuhEPBHP0asYzdFZasdOQRxmfJXwXGpkXpbR9gNcf
         fo/SqUhptAvlilDU4U8pbqxytz935RiZ6+VrLqwdcke1BQVD//9br1E94eerYagNjkJ6
         5n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912425; x=1795517225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=u7BspE5WNsjdXWFqkiEbUl5DJKdFFfc8xWFcXvnqEBVjiMwcR1842pS6WDc48ZG9ot
         hLOyBKe9ebivYRr4jHKyQRL+ZRGkwkNvPfkTCZVQ+pJ8aWjxK9qHeoG/MNT95YSwKMaz
         UjQBUPD4kQanL0vaT3j69WwCj5sfxNEpSuniGIeyNLmTwhB7R8N0xrq/YiA8P/CvNKpl
         xhDgZUMawHJp9r8rQTORJ7WQls9zydL+oS2W2L7tV6XoY1Lc4pM9/IFSM7U+L6CJkefd
         YJggr7hm/EkmyQFkeYkw933aBByv4I4XzkgWX0q7MP4MADDCh6gTBUOq9GU10AGLr+43
         mPQw==
X-Forwarded-Encrypted: i=1; AL+hErG7qclAI89wuYL4Uvk5noLL8aRKKPl7b1LvpAxpKPFwi0kSwLinQlN21Vf43KRvBrL9chT4lEbVSsrvahk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QCu1aSomDoWiIRa/iP7JRkdgCop5cZVwID9ZmHpFP2QcG2Ihc
	znCtXYjT5m3b9iH/JcQckvmCpMY5n7+nFO8sZf+84vw7wRNSLJQewU+fUzffMD7Yl7gyh2m42Cr
	Bs6AJXxTKRW/sS1h3BEjbAxMcokk6SEX7ZOy42uFdb0bhOi97BhOOwjFsimVKDNeRkM8=
X-Gm-Gg: AYBFou2APZEPMxRyOfLSmRIyN1MCr69M8Q/kRDLmQGtqf1AqjnItmhinc8fj7cnK/NR
	KCeprOrBKzokTcOMk5eyuJoygoNPISwS955ZwAc78HMR7M0ip0Iu8GXjkO27dk7vFXs/KhfYOQi
	PrZHTyEQtFwujnsjQ0RQJ9v8zQfhEUWIDMXxTdOpAEmraekGq+Z61O3te61cxSzqdaKJYGFWvwk
	DCwf4QTUvRTL21KCm7RxHOaBG6NLHVjZVv25TCHs4HPsvL8JxYByCL5qDvcekFfxTnt24bA93oB
	Gd51z+FLfz40QW/EyNicdH3LLORMpVpGo4fwaarhCjlly2BJz5I1q0lYCw6DiWrNt5E8CqRYVUl
	AfP/ouv6BZ4NvIqfMQK2hUkvhV0kVTDO6lPxGsSEgH1msmPNmWvOI/dIbQ1i3zkkKwjV4aA0oCq
	6QCXe5fcsi5IA5T4hx2CVMQ9Zbm+cldDb5TLc1iACnsi+IfOt9ulvyS0Tx9NRWkkkLWn+s3K6hu
	b4Xdmf4kyA5XQYlD9r8oL8mQZ8=
X-Received: by 2002:a05:620a:6884:b0:949:589e:4bd5 with SMTP id af79cd13be357-9498b8ef60dmr332824685a.23.1794912425388;
        Tue, 17 Nov 2026 02:47:05 -0800 (PST)
X-Received: by 2002:a05:620a:6884:b0:949:589e:4bd5 with SMTP id af79cd13be357-9498b8ef60dmr332821285a.23.1794912424899;
        Tue, 17 Nov 2026 02:47:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:55 +0100
Subject: [PATCH v2 3/3] media: qcom: iris: venc: reject encoder crop
 rectangles larger than the source
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
Message-Id: <20261117-iris-fixes-v2-3-0b21201ab137@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX05LVCafx95hu
 bJw/99kheEaMUbXtZM3nqoaBw9dF12QFBOMPruhaPAclfb8/22UeK3Mdy0Kyl1WiPShUX4FyW+q
 PiudwKE0I9Q9QtSmiEkLA4LuLgWeTWY=
X-Proofpoint-ORIG-GUID: bmlSkc6ElY6XDhbalvRggG27tTuTlvf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXx64/scHEuwVw
 JX1WksWQEWyTublGSdFuWpcwbJue+e8naAHjTRNt6Y5dV6XO58vzG8WpEK93mb5XcclyOb/CKQy
 YqYt9+YH6eiCwlDaetTTEdZrNVTuD+u1BTmmRX/McVaPdsT9VC5y5UU9+C7y8FXucHrZzSzmSBu
 WfhyyjCqfiGMzGnEbmoe/jhH4CmAL81g45HOsnxT+kmK2SeYulFdmSMXjFwHe3HlXmZR6gsRtaG
 qeN9jyu7KvVQJb7nKCiVpYrDRpJDwC7k+2X6Dy7IgYAQU815qKSqKUIgVUEksyaWfN4rcqpgVmx
 To2FGGEONPNIBR+fJy38fB3KMMy/xvfXYhtcWK/YTk0apLbv5oDyVAhsrTPqbIdBgq4dh6mZYIv
 fvRHxmQEqFRyMhJC5MGjajNtxtRSsbOZEZo+5YmpanJSmPlrNlq9tvrrvPgw+FcZH3wmjYEU+u8
 jsxvD0jAxLy7oF/XZIA==
X-Proofpoint-GUID: bmlSkc6ElY6XDhbalvRggG27tTuTlvf2
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc30aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3rA8L1DBDF8j2ObvkVYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

iris_venc_s_selection() bounded the V4L2_SEL_TGT_CROP rectangle by
inst->fmt_src, the padded buffer geometry, instead of the visible
resolution in enc_raw_width and enc_raw_height. fmt_src is rounded up, so
userspace could set a crop larger than the frame it submits.

iris_hfi_gen2_set_crop_offsets() then underflows

	bottom_offset = inst->enc_raw_height - inst->crop.height;

and the encode fails silently. All ioctls succeed and the EOS event is
delivered, but the encoder produces no data and nothing is logged.

Bound the rectangle by enc_raw_* instead.

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --set-selection-output=target=crop,width=1280,height=730 \
      --stream-mmap --stream-out-mmap --stream-count=30 \
      --stream-to=out.h264

Before, 1280x730 is accepted because fmt_src is 1280x736, and out.h264 is
0 bytes. After:

  VIDIOC_S_SELECTION: failed: Invalid argument

Rectangles within the source, like 1280x704 and 640x360, are still
accepted.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index b367367ac2ccf874a00606b8b1352fed37b37a57..1af692d10bcf77060fa95c6c3906e9067d167d84 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -380,8 +380,8 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		s->r.left = 0;
 		s->r.top = 0;
 
-		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
-		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+		if (s->r.width > inst->enc_raw_width ||
+		    s->r.height > inst->enc_raw_height)
 			return -EINVAL;
 
 		inst->crop.left = s->r.left;

-- 
2.34.1

