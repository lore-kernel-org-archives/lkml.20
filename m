Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EDC253B42
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073783; cv=none; b=YIqn1tLTC0APy0/w+HCxZL4I/XnLIr+z+kJci+QIgKcwkF0To2sqoYUHpXmx3OPCxU3F4uSAiakPZFqyV8WlLc3+6Mx45GY6GDqqo/bklccozj92ieV/0bLP9EuQNC3UzX7z8wSkZzMdeQFKVRijezMYhUwZH28RJjGNop10NIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073783; c=relaxed/simple;
	bh=HZ/8zzEzCk4QoAnviOA0mONaVqcL84QGBpPGDjnH5+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5L946i8Pypw4jqX4FlVSACPffal2x5A81ssdHoX05Hczkb3ntd80cIsCV/JHqn6nylkxXO3KxPh6oE8KQZyYeSfDs1rC4o2ZZcVu6JZsOQmydIcPz2bcVnzdfW50CJMFJQHSmvlQJOu2HPOseD/pXtUcWYIDiVNlsd+YFTx/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4HeP6LW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf7Cd+2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4HeP6LW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf7Cd+2i"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MATAir1023008
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jaBxcazFz0PPiUEsWBeW/e
	srkQg0kJx7mpugkd7tDGs=; b=L4HeP6LW/1pp4Qj8u9aWLDS2O+Mfxah/kXzjTl
	OdMxuXmEcdaRHvTqJusJTtXOy3OOWwht45REm6glIdywCfJKP2Ad2EftVUOvxcnx
	J8saHc9PSXJa0n37dkfNI0U8Tk7OXQgdRtbBfRiRNaD5pmWSsQ6U+pSOIY58j1IF
	Vj7MmTsYvzbRlFkd9OlKlOERd6Ys1OG4/K6U7mGhYZBADPaP2aUrEEcPv3geTxlK
	Qsh6DNkv7kdQakNuhfDqVm884t6uNOvOn5fSiGTmSIs/DTL2GG5sa+w5Uq3+WIUQ
	Xdb4u4ssOka6IwM4/M9DCIVonaeDuq+ik7xRfYH6mchn9FqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycr1q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2222769a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073781; x=1790678581; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jaBxcazFz0PPiUEsWBeW/esrkQg0kJx7mpugkd7tDGs=;
        b=Tf7Cd+2igXtNXJl6KpCSe91h1uI84ZAQf6mzEptkpu+UF9meL2fCR9X/omxJ54UOKB
         xanjBh5fNrETxm4Aj3nwQp5Rn0R6c4d5f9Hp77lFW6O48mRsun8rFubwpCn40FXLwlC8
         EPlEtPlo4dvXlfmVoWqlnCiZPv1ov434qydYeuf0j/3UNF4QTw/PwM6tliUeoy+95MBS
         JwlNDDie2jM18M5NLxmvXHW3GqYA7wMInP7oqxkapPnw1dnChJxPxFGp87MuPq1YXJYq
         ptZOFukW2cdxuJbgYYiEfBzPu9S5ypyyUwTOhHR9LsuEXKzUWFFc1hWYtF6O10KIVes8
         bGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073781; x=1790678581;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jaBxcazFz0PPiUEsWBeW/esrkQg0kJx7mpugkd7tDGs=;
        b=Zp+TpbiP/IaGAH57TeMBaxNXFzS6GhT5MEwktdeuxnnaBACCb/SN2VPEr5ZES94pY+
         lPlIkhZMp6rtSJeA8pDOm4LuzLGATH84srrLuk8VMPpJaMHxgiGlsLAi8ig30sqbp0pp
         S5aQhU1CbRtgOI7DRWCqac2aaoVCGRhWSZugRegnOPz1UIgAY9d7ESbfzhNgHARMDlqC
         r4aYncQWfdkcxV615hXxu0jHjL0BQTYnEoJ8Fo3muGnSOGmkgUlFDseZLyvkpt/bW7Se
         8KQzqtN3RI0956lQ7Wc8VK5hJ/s/UupCSMF382bbkDTMHFF4dJfu+jTzvPCoTnxmWvSq
         /JlA==
X-Forwarded-Encrypted: i=1; AKwUvBwS0R5ysE3w8wJ88Fxu0ZA/sERkoqkBSUOtXq4E0tptVQQfFPSyWXq+zKhGNbo9V8AXf4iNiiMDgr88aH4=@vger.kernel.org
X-Gm-Message-State: AFuF++n8tU5kRysPF2NzbDL+7JiArShv9mCfj8FaViZ+Jt/PLWffIKbS
	OREotBe7bap8fmSB2ikc9ocb0e5HZuXYM3uORo8H6Ljc3igX7bYeoanEUKqsBFVeiv30zCptNDo
	2yRf9o52nHFr4kiuclUE6hvaWDqLw106s0la1lP8z4GqSSl8hkaRsCtmL5P3p3H4u5Nk=
X-Gm-Gg: AYBFou0WtN23HOQQc6e35xwG6su1+xPYZ2s4H6kIG2ypUQxnwt4frHIBdPvbNjUYhLa
	ZcwY/19vcrHKUlEUooQbsmIQEkmL5mWjPmDbzwo+oNSgfX0eOq9sUXjQDfBroDBXXyZz+MlPdwO
	41ms44kvCEOfeuYQuNfk5rfSPrq4WVBBBRxfRCEhZ+piVHym3YnZba9Z+eL5fTipfOD2trDk3mo
	tc6Cur8DhlK+g+6UPxk4Otj5SjygscD8vzW6rFetVHeGevJR/Yc+SWlZlgsSeQwO6DQpXKIRtxx
	7cmt9R6HyJ94QQMdyPokEnyYBbip/GfuKqf+QmSc9nI+U0AlyERzFxL39UMw7azfSveUlw49BEB
	Jnl7SwCRfRLecrLE+wAUI5hPDw4l9wM4=
X-Received: by 2002:a05:6a20:7283:b0:3dd:85aa:452f with SMTP id adf61e73a8af0-3ddec72edabmr851863637.33.1790073780769;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3dd:85aa:452f with SMTP id adf61e73a8af0-3ddec72edabmr851833637.33.1790073780354;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:42:59 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add eDP display overlays for
 hamoa and purwa IoT EVKs
Date: Tue, 22 Sep 2026 16:12:50 +0530
Message-Id: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpbsmoC/yXMQQ6CMBBG4auQWdukGRXUqxhDsP2rY0xLpkgwh
 LtbYfkt3pspQwWZLtVMilGypFiw31Xknl18wIgvJrZc2zOzge/bNELf3bcNSU3ENBg++aNtcLD
 BgUraK4JM6/Z625w/9xfc8H/RsvwArrO4L3gAAAA=
X-Change-ID: 20260922-edp_overlay_for-next-28d507e40fce
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=2070;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=HZ/8zzEzCk4QoAnviOA0mONaVqcL84QGBpPGDjnH5+Y=;
 b=f+HWO0YlFe8s2bNfhd7ZB/TGsIbJW1DiAXCDV6KJaI4uLbku1Q1s7hoNqcCXJC8iH0Df04kx3
 9MGQsYl1SUdCRffvI5NeO3Ak/Q+xozuqYIc/FBKX9veDVOtpRWC1OCO
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: Bmiin4tRWcC_O8WlLEBVQlXPi-tH30so
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX0kHHUb7eads5
 gLIjSE6wI8Yxm1oKZ3H15og8kKj/I8DAQ+g3nZjzhwuTg1lEMn6prNmKg+Ka2WQxV6s4OWnCItA
 ECFEH55msDJqo15uHAvILv/RxCKweewYPmUxm67k0Djyj2rMqLOui6sEDsvPzYB+FxKTkdCLHjV
 MenTBtIIzd0MNv0g1WYnYm0obDTTs2eXkBqbZ6V3Pu38v3vZYJ52dY3IydS83XZiAA1Fcv/FZRv
 reaZ9yILGIIC6QnsCcoyFULjWEljEkoPxGJySy3XG79q+v60RWCZ226Tre8l1rgxhcvdw/GGWWm
 W0fkhx58nGnvdLx4JJLbnI/ficq9npsdA3TrTbsJ7uMRduXG5RBrJZP+LATXymtCltn6LkwilXI
 OFxUvESeFQDgoVRw5Lz0gWsmNI8qYdGqxHvM89v3XdeRsk6eLj3b3q2slCr2Q29boN7x6XPhWyn
 ey+WI9vMbhqDntF6zzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX5x4FDBdhKoze
 89xUo9uqt/XvST7u2ezDiUZnIP5eInreM9cB8a+xpq7lTgyg1CdR7hqLhDynJO8PX5YGvdHrXMT
 G287mDv6qjEaHWRqh8AK8Rniw1Zxohc=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab25bb5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AOooBFONsbaObJAzweMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Bmiin4tRWcC_O8WlLEBVQlXPi-tH30so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Both Hamoa and Purwa IoT EVKs are available in headed and headless
variants. The headed variants use an eDP display panel connected via
the DP3 controller, while the headless variants do not include a
display.

The existing DT causes the eDP-panel driver to probe an unavailable
panel, resulting in AUX probe timeouts and missing display modes.
Userspace then attempts display commits through the eDP connector,
causing repeated DPU vblank, frame-done, and IRQ timeout errors.

Move the eDP-specific nodes out of the base DTS files into separate
DTBO overlays for each board. This allows the base DTBs to be used
as-is for headless variants, while the composite DTBs enable eDP
support on headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v3:
- Rebased on the latest for-next.
- Link to v2:
  https://lore.kernel.org/all/20260818-edp_overlay_for-next-v2-0-bd811d378fb7@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

 arch/arm64/boot/dts/qcom/Makefile               |   6 ++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 5 files changed, 254 insertions(+), 214 deletions(-)
---
base-commit: 43d09481a91466a7388cbffc6de3b1df8e5aa35b
change-id: 20260922-edp_overlay_for-next-28d507e40fce

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

