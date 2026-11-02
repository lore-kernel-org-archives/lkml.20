Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631681;
	b=xWTZK1xfG/onotU2b2+wRVgULypTEK13jAfU6DovFHNSKIe4Nm97mUbS5ydj8Tp+polf
	 hZ1yuotW83Rm0MUdux58mWe3jQD942b+KPQArg8ATQa0YSLz3i4aRiQ49fU5KgDZ1Vjj0
	 C/H1MmkJ0YMd/7Wo4Ek9vCYGgZRcUIfnNIHl2dKy9NOrI3NQGSxPhDjNbgdWJElm9CioC
	 fHBY7pboliR7OkaxFE7wh5fmgr7t/zGBoEZ3Z6TvJHGen1VnhDnkuf45ArO3UhhVnY819
	 49LrhLNF1tAhCt42+tJFCVJuCQ69nBNh5X5UUaLwFcZzDdHViUyKiwmVjEYixbrdaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
	b=SpLFVcB3HiIRSez06mbQ59AJbBVH9lpDA5hDeL513Idciq/jVhqauxjbs5eNYOCgx9DT
	 eBm7Z0E39+GDN05SmjvXUyeLVrM7olykZ1onIQYPmEBnLeFQL+SoLNy3lO8AB5VIOgy6g
	 +4VBGgw0oX5jg4/8QkgjqvWUAwNC4hvDmCdNSsKMzOD6cZRER6SQuKJQucKRlRtEzbK5Z
	 9dw0OHLBcBn9yV6Uspr9T8hx+G5g3SwY4ASx5RyXqXY/d/QGDKs7u7QYVogFACq18bFvJ
	 CkaMmDhjA9cKs9PjeGMby59DJilTAc9vjnm2C/tQt0LDCv02+w84qOO1rQVlFLiGp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYYcQ4EU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2AvWQf8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB56070D8E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEB56070D8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYYcQ4EU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2AvWQf8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpYd13512838
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlTo
	azOp5HEw=; b=RYYcQ4EUdTxB/gqilviCGo4lwnmTO/r6IXYKIec0HqXxv0Xi9L3
	fg3yElEq+XQ3CdCe0i3irk0z6guSTj7IYvWeca7OA+dE/3KhkqDN4tncT0Y21+vk
	4FhSMVkzgXmrH85iHVHMeCno9SBJAl2YUkMD9BuNQrloTA8UzCxbcnYz7j6b4z6h
	fEPwDOMYtO3qvpoailED5xucaCUimezlWTKk0+3aQog1KdeEmW8h+Rc4fKkZKCmz
	Uy/zZn0a8m3xVrzY9TfR1NExZoxkuzFJA9ONl9vw0wS3bcbN1GbszJi8JVeZ4RA8
	SVV/Jan11UUiVnSEMN0pGcnXMrtKDDcZ/yQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrhd4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:01:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so3155975e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631678; x=1794236478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
        b=T2AvWQf8H1a21hll/btJuE3+L/e0MH01lx74kubO/OEteWlbNAeStsIXdAGbN0d69+
         si4TqjpJmBGbrb/Da2/Ahb3EMcS67TMnLY6ExriWPk9EJ65eQxBlqDzYztzx29P3TtM4
         jvQagumHnCimLfFN0ebMEGjrcNw6N2xYmwrCsFr97F9bbQgBPFyWrmELRqdQfnYVSGPJ
         UVUia2Jpf2xTTXIr2AAOkHYdXJBDJ2T63Gc/2AENCl4AJx9XT2K/RaylMC2DyiGAVhlp
         nDHI7Tf3/JXYW/fTWkTruv59xofvy2EewlfHEIpWBcxjemrEdM7uKoYRRbYAUD2k1O+T
         Ldiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631678; x=1794236478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FihYy7TOnYbSFAFPXg+VCzs/2XkXfUorlToazOp5HEw=;
        b=0v7vpamknpkDRuoqyBxHHkZC5fIjfN4rP4EaA3ZsAZdvvMT831T6YCklgMWDxT9rDY
         fWVB9SwZ0SZQjXe11W4pkj54dr77Q08mO3pR51VL55koozMXDFen4xlUJjbb0vM0fsRj
         zv4qPhBscabsT6KrEFfDrehqFKAjiVJSmn5VWPFX78UKPrRLBl1se6OS46etV9qnTn7N
         Fx2MtvnV0S+2xARe6Yx1TYTsZH3ZzQiGNK1Avib39D2Ou5xuK2iRRGPbHslp4aRja2AE
         EMKM8b/hIzQSHczf+S/5VyCicjKelFZSE883Irw1Pe+nGk1Nm/ahl4k17GISAPfjwRSD
         2kbg==
X-Forwarded-Encrypted: i=1; AKwUvBw6I8vG9gJkdOUIvEF4y0W6TsP1+SfCNEKkF1YZ0T9EBwNHFzN6uSDJfPV/aUl0RVQMFc3ZydBwhg7l34k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lMHq7xM03MoUW4oLl+gLxm5fES9NOy8tXVlNTC9FndWy4s5im
	TZDwl6F/9bESdTHLNJo2xlxw46/28jVRFRzeuEqXb/gJ6n2U3nYzmusyKaX1e9D0Zl6LSJ1Ug2M
	5SVtR8ItJCqT8Oip2sY7R4uL8K+1TOUfAmsTEQLl9o1pF8+8EqoTK20978eVem6kzEBM=
X-Gm-Gg: AYBFou02GTIEMgNLL3ztdmJ+b9j0VOlmn2E1Oaa6i4d9+1HIDIGNtt4XL8hj2oJqwO4
	+D4Ej+orpXNY+CTh+eGNxNiJ0fD20qpCIgMOCdfoU44pMLd1kStO3oaatbl4905qlcEcpY8R9E3
	7qkekRQLVlRtuFoWzpc014qJy/CdDi8P0UoXxbMhk3aVeyGJ5BoE0S654bj2C4KWBdhDcEMVitK
	zaH9VGlBw7PXP+t6OzCtEsObP5dLzYILR1Cw9umTdmuOPBHCbrAZMujv3fo8DevhUDKNu8aPb2p
	/ZiFtlRm18PwQPeeuzL1IcwwsN9DnWI+ub7w74JqwOPXX50DGxW1RbDi8PAK8e0VxPeXiA3u9BT
	Vg2ajWPFBRvey/2HIhpCuagOTriQLq3bWZOEV3gv7+1WdbGxmXGgOVm8FlW0HCw==
X-Received: by 2002:a05:6122:e46c:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5ec68953084mr4605338e0c.6.1793631678352;
        Mon, 02 Nov 2026 07:01:18 -0800 (PST)
X-Received: by 2002:a05:6122:e46c:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5ec68953084mr4605215e0c.6.1793631677480;
        Mon, 02 Nov 2026 07:01:17 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm279827185e9.2.2026.11.02.07.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] firmware: qcom: pas-tee: Always initialize resource table output size
Date: Mon,  2 Nov 2026 16:01:11 +0100
Message-ID: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Rm/Oh/L9WyT5D8rfKiKyP1ZCHuU35dMVl3bZ70YesSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6KW2ngE+f+BWLvW3FLnusMQw+cBFT3BIDe8d9
 8u0rCz/LB+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiltgAKCRDBN2bmhouD
 1+y7D/9C2sfocUr5eTVqoUPCXIpyKG2rvbdLrh2vkYMCn/yS+UNOClQniwFuFdhtfc/8A7rUU+k
 kHo3hcLXFHBT5R/qDuxDwzyqFg3Y87pxMCGVIPRtzMtkx1KXg7nydNaATDz+wT9G1wJgW+FXr27
 IHXK5MP+txGYQqD6VRZfgLLXX7Vb3U1fMzu/QBXkCLaDGXnkjPymqyfrBW2v4DUpqyLCNIVsk97
 Okco7j4SeyFLX8MCRsx2LstAUP1CnFda2WTobB96I+Q0s89daP63aDBsXzAfBd51pdONMp0AEOy
 I6YA5/CgxN7cv/A0DRaVGnExxmOUELF239Jisjh/mF0nXm5EnDofoTam7sGs8ul4USaQb6kfvi5
 p3SP3H7M/hb6HJEHwTDDNp0Hdtu0IQlsoypfXNCCf7v3UWBS03WKVheUIrd53f54dcEOyuiExU8
 EtzwTLFthLjk+WComIu5YH5UalTRfXvy4hiYwbRpc2KnEbrQw6SMBOd6GFAWP3YMWLQU8jgGtLd
 7XraOe6YCiiPj7khPUkRCPegZo5JIORkvNkCPvLgUiXEhERYOZbCUC28W46Lywkk4KYCXOI3+5z
 5vo6W3TL2u6256bzNDcXyQU88R+x1QT6IudvuIz0o0PX3TNzzk6zW7C52Mqc1goca5+TP6TEVHH MYp2qikRwJxOaKQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8a5c0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lnzBmoKy2Z76xE5QrQcA:9
 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: KbqPNGdBkMk3FxSAaMkM9PhiZsyjhLko
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXwfv0yyUrhpPZ
 5hpkGcAkhYIGK5P2Js6OI5hrHsldT/ARNEH78dGuT+dP01SbXixcK+WxsnNTHg+/REIZdy8AazB
 tlX9vqnFE9Xss0jmcRgezwII7Hx7CEc=
X-Proofpoint-ORIG-GUID: KbqPNGdBkMk3FxSAaMkM9PhiZsyjhLko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX2XCIkyG0Tdx7
 KcR4So9zJ4r2azxMSltBQI8zgvifThVr0RwnPar8G9+xy9CwM+FtmAKPFuQEnqzL4hxpn7fpn0q
 md8m2M8k4GX70khfm7EBVU/YlMR2NLJreCmatJFyeG+1YZkiuV0ypH2bVDwOWOJonTq3cZBc0O9
 eeR8JeFywwagL/4Rgd0yN5P/aO6ujdoRe+gxLJu8h9Dw3VqyJUVzZQqOu87vgYj/9F9zYf2PPps
 6F7LE/2IVYBn5ABN6QFogJVHLnod2JLbl8gvU9bNRfor3ZJ3mhpT6O3cdkVxcz2Im4PXqe21tOw
 fvN21rGXvvqMStkRaKqbVyMWZJ8PkNnSj6MdSxoHLEuQDTeaJdboTm0S5qef5fSlZlOkkEwluI+
 gvWX7RzzCKeB6398n65ak5fw0oHecRckxkMNKIst1cdTVoZFExEelmv9oGhkIZoA/H3wafnqRiZ
 KqiwC0cVNs0zKx2GwDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020059

qcom_pas_tee_get_rsc_table() sets the "output_rt_size" only when the first
TEE invocation reports a size smaller than the input table, or when the
second invocation returns a non-zero size.  If the TEE reports a size
bigger or equal to the input size on the first call, but then returns
size of 0 on the second call, the function returns NULL (no table) and
leaves "output_rt_size" output parameter untouched.

Caller of qcom_pas_tee_get_rsc_table() treats NULL as success, thus
uninitialized "output_rt_size" output argument could in theory lead to
out-of-bounds accesses further.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-bb15726c-4185-460a-a5f0-f779d5ee144a
Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..ba9957023ec8 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -275,6 +275,8 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
 			if (!rt_buf)
 				return ERR_PTR(-ENOMEM);
+		} else {
+			*output_rt_size = 0;
 		}
 	} else {
 		*output_rt_size = 0;
-- 
2.53.0

