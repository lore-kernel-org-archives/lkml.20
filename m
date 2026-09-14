Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021233260B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368258; cv=none; b=ATYQQpiAzb+/pb7Tw1k+R1aXnGDjyegpkADeuZM7yc+oX/ArWdd65Jr5QFZzfsvp4nzdlPCXKfiniRmNfUgM3Yll2U/YQGnY9shBHZG2bH2waJuXQa/VsHklCaBDfDnqnda0hZ9dbHhGX0S6DZK48u8UYUskGqF+UUNmU7ky8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368258; c=relaxed/simple;
	bh=PVsMwaNVpZd4UiWHqxTTws5LFW4YyUdvehtqzhFsSL0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHpB/39gokYH6CaLyvoWKZskndI9NuZSq+MwgG2aEK479zV/MhUI6fg45+ccE8gazOf/8gw8NkNWqC12OsdbuQtdPKPx/xpVqvBqMBlzTn+UA8p95eF3/I31VGEf3oJjN6rfESyzqZ8ZP+Ub7bDOwUXUKXAOaXgKECWn5gxd3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3UvdQEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XroZoowJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3UvdQEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XroZoowJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jXIC237707
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3VwgneHH/rWpuPJKdEurX
	tnPpT2xnItEnNcDucOK8k=; b=Q3UvdQEARWayoePybyNiUthloz/XXIq//Cx40r
	wwBMAQWF0FVTC3t7P5zgJqfzTkET6pyw5DAwk/jQLknyNlrVbwerIZg7/a8cICdT
	sjRPVzUKyx+kYSdjMxTn6wUn7QtD8tOfID/vtYgqDnJTycyEkoWaCLvp24Rp4JNS
	yjUQy0805FR+ythqZYNB3VYaNKsJbXLes+t4XWFfrw+SziEszQWgKuXuJyh0Izd1
	EyyXnygVW1upmdgXNRShmxGWPukFCjoxqfXg+NoIuvTl8BUiYiM9nM05Td63cp6+
	Selii3QFpZq2CQPK4NCAfQzjkf/k5cbXyFnAxS/YtF69tSzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnd28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:44:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso258343685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368255; x=1789973055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q3VwgneHH/rWpuPJKdEurXtnPpT2xnItEnNcDucOK8k=;
        b=XroZoowJvBVJoT+qJhjt72q762Pn4DlBcpGSDiyn1HPrnqauQrIpK4jb68yhB8G67J
         YQstVGFwWRrxSFOR5GXdQ/RhqqnjkVvkWfo0OIfA/hweXQmYK2juls2EF+QA9wd8XLIR
         iO/bsCnnVuYZ6VvDR6O1wo4uVKgduYedh5rM3F6y2A1Z9GdrGT7XSqrw959MKKQbQEif
         7AA1H3cDTRQx89L53jYawuQH5Wwgzy4YzgUD8DiHGJzdDoPACymVBShI+oqSbI12aLbQ
         sJyDkOAIJdmOcotYr7g4L9l6bq8TpJus/CWWjXoWb9FGGcOlZAEDiUt0gaMo3Su5laHl
         8w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368255; x=1789973055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3VwgneHH/rWpuPJKdEurXtnPpT2xnItEnNcDucOK8k=;
        b=E8FWqufdPCt4f1651f60SUUCn9gWB/fyeFhn9Rv47HeRyBM0lTwMLXzEF0036+FRwk
         2OWiH4B46SKkR9TvuAiNOKfSVfIVBXPaC0Pgtxmo9j015QyqizOCBTz6XQ/pKJC5iI7S
         b844HGoTACbCB1FDJR6VJSIwQRR+Ie7HeYuuO8zMZZchHRpDaac7ZEyi3pfvV77pydYR
         c3peeOlMK1C/4Cqb56nVtyCSF8cOv0ENCoYy8zq0+ozw00Q7wDzMH7HSMC9ZJ1vyJSC8
         JERPFsrp4zkbyCYGBv9ENSoAxnuFvO3Y012EhFudy+cfG7eOyQNNoYcvMnGwqrJPL5jM
         6aYg==
X-Forwarded-Encrypted: i=1; AKwUvBwpckZAciagH6rr9jvCSLqWYP4f6eMFdwN/QuypPB1TdVNPl+MUo5+A2dNeeXAnKxtHjs3RtBafyuShXaU=@vger.kernel.org
X-Gm-Message-State: AFuF++kZGotcrMQT3q/wsXNwsgeh82MKDZoCzmse1Zi72MdRAH7mmf4F
	DYIFNjd5i+qyUvOdK2mtXCkWdkBZSm225v8OfW4N3K+oOYMN5/oEIyjgIAWedI55h7WImbT91R0
	LNibcfrJr9OmeaqG5oOITedbi30mpOJy+lO5IytkOJ/LTg0IQQMXYljWCAey6XXlOuw0=
X-Gm-Gg: AYBFou1HSOIpJBzVEeIDcQgXSj/jlljrUSGgfxI32aWj3YfO62V7aKF/wfUc8n7oSAk
	4oMwaK8poSNOdoaLJkA4N2toF74OShlcShNBjdmKr68S6OZhOrq6KSox8fguKh0h7QAMU5p1RAC
	NwLSncbqO1Pcpg5aF6aLHEgV8v61hfVo+UGbEDb5Qvb7vTy8jo0bS3BqqVQvWL3K50qMQLH15OL
	NX4DUPoH5eKrtNp/eXRLi2mb8R2jhbhUWZik1j/hN90w/neL9gayheFVYzAs4iPPkoZWs/ogAAo
	/6bTRP8lBHlsgOI5zr/9eC48uBDIBbvUw0ojDZlXkbFyjXN3WBKdEwrERM9zZ9sTau1W1nlSrlF
	fXDGoGeHslEGHWHoEuqac0Lo=
X-Received: by 2002:a05:620a:8081:b0:92e:541e:632b with SMTP id af79cd13be357-93a2973d12fmr196484185a.2.1789368254927;
        Sun, 13 Sep 2026 23:44:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:92e:541e:632b with SMTP id af79cd13be357-93a2973d12fmr196481785a.2.1789368254453;
        Sun, 13 Sep 2026 23:44:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Date: Mon, 14 Sep 2026 08:44:03 +0200
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oza7CIBAF4FcxrMUU6J+ufI+buxjgqBgLFmpzb
 0zfXaoLNxrdTHKSM9/MlSVEh8Q2iyuLGF1ywedQLhfMHMjvwZ3NmclC1kUpW+78gGiC9zAD703
 ouDmBPKfY1SUnGEskUCmhWTbOETv3d/d/fh85XfQx787o3Di4NIT4f39gFHPv21uj4AVHrY3aN
 a2SVm9DSqv+Qqfc7FZ5sPnkKJ9oJapPqMwoWUCbRlXr2r5B1RNtZPEJVRldlxIt0EBbeoFO03Q
 DRK+/K40BAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PVsMwaNVpZd4UiWHqxTTws5LFW4YyUdvehtqzhFsSL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e3XUKEdpklYVPyX4YhJsTH0XW1kqsPtqwsw
 v6d9wWinBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXtwAKCRDBN2bmhouD
 179fD/4yaUDPB5yPXczOLrAhAfwuQOReVZ7J/ETEAmeKvmEsZn1BGhrNUUgrbI9Xh5x3VnL0MC4
 yE7wQkgPaIl2yB8jJcvQRI0MgxGX33Aorp5M5iGhyN3ZJjM2POjzO+bzZeNQcMWQVEmXVvK3GXP
 WwRb42ZTH4DuhoEjWfS4NoqHlRPWBR04yelX/1LLM839lmDCkSid7HGYO6JdlkodveOn3wxBz2/
 DWxGMNlYQsuoeVudBinUncv3w0QZurLOE+bsyfTR6KcN2rWeYMEWB1FgCI0gj7fOXnXD/zfXKdD
 YvTBocqbclU3J5u/MAcyjGs5nGf4aGFKASP0RDh7TU5nsIdpNZk08VFyW087d1Vh0FMbN1f4m/Z
 WzFHcfIrj1lSygxb6CzWt/Xy2h+C8/fXXk/hh+JvM9uuKEWxcFDjviaRHb9811xWuLn8SOzawmp
 rQwfbSRPzPiKdQxXTL0/ZeRczTVrmxszDIxFrEUu1p4Ts/Mwx09utIo3DYkifo8Os+ArJFuJVlD
 zrLpP7AoVD8xb8pBuDspxFKCeghX58jRXRFR1oGWKXexHp0zT8YBrmCq3hBxuQsO/4DAaeQtQP2
 7e6qJqFEKToDCfQ7FXHZbF7VtRZuAt9tNrbZWlEWo13PXXaBt/rJfwrMgfobmRyFd5HyABCNmEy
 Mp30oBtd5E2+b3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ChIzAeRRJ-IZXtFwsNhNYahghtDSvASr
X-Proofpoint-ORIG-GUID: ChIzAeRRJ-IZXtFwsNhNYahghtDSvASr
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa797bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tjA5nVWDIhs3vSZUhDcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5MyBTYWx0ZWRfX+PdP1Affbl7e
 6sX1hN7PnYd51cPDQ2sGDKE8B9/tovy0233ibEwhrtWQTPGFuY8WoU+7JMPv9BlUE+RJ8N30zgA
 qBm0nXXYeD05fxvbc9fCZMo8novIJ84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5MyBTYWx0ZWRfXwIpXbMfjknPJ
 kBqP7W0lHGC96KqlE5hSVg7NRo2pRamt6jZsZIf7+3hGutvxGXvh04CY9UquxpGJBDRtdjWLRHY
 S9iPxrAGyQ4/aaMognFMLMPNqoxJzB0O0oLHTCHnVB4n25tHsLLU8VCe9+BD+yKfDRbwEGBZg8I
 G53V0h2f9HmZJGnPWXzpdtlMv72nTb5G5W8ULSpZz5QPDfg8olYWGm06grK3VbRudTbVvBoVrC1
 j/9+zq0TzVSooQR6yeaOQabskI4hA9asExqBNGebuM3GBEFlNvr9vi3qHggdPrCowFd1WPfRnUK
 koT+X2lhJ+/6HeJMt4YUmV9/R5cuQ/enJxXVOdk05ZWCq2yAWag1v/jtmD/OnOX/67AuEaL1nQg
 Za2xDCgRD2iLiZOvP787a0X2RveWcpvagrgmCtM5Y42zp6Bdk8zqqnGru14Wf7QsvVFO/g2Dtvy
 tRU7iWygFSmxbl84SYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140093

v3 was not picked, can this finally be applied?

Changes in v4:
- Add also Shikra since this was waiting so long that other drivers got
  merged in between!
- Split out defconfig update.
- Link to v3: https://patch.msgid.link/20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      interconnect: qcom: Make important drivers default
      interconnect: qcom: Add missing depends to Hawi, Maili, Nord and Shikra

 drivers/interconnect/qcom/Kconfig | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
---
base-commit: 15331b9ab4bdf066cda327e4f99ebee61915e68f
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

