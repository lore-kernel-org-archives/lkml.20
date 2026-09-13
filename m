Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865D37E5EE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330730; cv=none; b=ZJXHG6x6ZAFPfE5GsG9ob4RiSFFpcVAfnZ/sczWjAMwBriiXV1k7Uj4EMJNsctrxYFBnohjULlOLcRiaSE/b685FaIUfFJq6kFpDlIoIZzFtw4/5KkoeXg9o7IgGv+6Fu3+6a/ONDjHeiWdTpUSeRGuu0LTEmV1hOVEFw8in7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330730; c=relaxed/simple;
	bh=c4wTHslrndNVpK5kjYJnzg6/X7lZc1ElumlIUbFLiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1Z3ZJiZawLeNuULGK/+k5AuuOHoZCwjOaRLHzcvnW77EMYudVKSqdZFhOvh48BeDmRagfgmA2EJO6RLmXTn5GYPWKyzSW/CEbEM2DgzBDN1/B0H1NrPqKX9uiM4kH6Zjhkxwv9tMqSlbgdcni6Ptk5eP35SF1+IsqOazhNvM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHfBJyxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUwmxCob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHfBJyxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUwmxCob"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxswv1986374
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bam
	U+HGQUsw=; b=LHfBJyxj7lCJ3xfHc9Y5znKfFxLG/iTbIh6TpbKJQZv0NFIcBo0
	La4SmCrHMksiBwImlJO5ZjnBsaAQom0JcVsWThYEUEWHb6Ojt+aXIHVDFmLNkyUU
	93CpoQa56PuCMyqcu1eMimvU87YtYGrPROt0/wb+JtXlnKafJ48wPURF2ikWh8bL
	lHKmG89cp8yHOLII8SNoJiiN/pqaOWtoB9EjQs3A7eHRmNKwEzDo0+p+GRrOz4lp
	iNAnBxnVwxIt1e3bWMlVbTfu8Lqi/LSnW9eA37at5bXtzN+mv6KTXoGWdeM67Wqf
	lCXXz/8US7dW832vMsUkg4JCLqoxh/GkBkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc1rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so140595985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330727; x=1789935527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=YUwmxCobMC0qV2zb4oKCexAOyo3kBJah242eeRLROjZVsLwohgLUcVievZnjtgWQdE
         3/t5Cf7J1/sfrwT+9o6jTKhu4XNX9gmrPSl/Ry4gECFEXqcEPjmeX3EU8zgLJIx7Oa9w
         hFSjG2FxV3kcXy5ICpip9GDOousG4x4TC5MH9ojqGnJ1fL12DqCyjuBVgmM+1033D94F
         nLI4L1S9uZ8BavoyBT5okk2iObqbpWAU/krdyDe8eHvTA9WNwkTX3oG55IwMBKvkeqh1
         waq34N7GqTy6Ug9sbJXEHFziKUEB8aisrUytELdR/vkfcbOOQ8XnAU4DgaUupTYjxZfV
         28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330727; x=1789935527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=qrHaYLRx8SsahBZlLr8/fjZE9WtoysOJt0UfPlmjln+A9jdZkfdPgCWE8waI0YMPG5
         533p++qu+5NQY4z3B6A7rsEWgn9sWzZh4/K/VNMI7mQy7l94Rpa8hGibJp3F+ZnoNAmG
         cdXic6PzeOpcraGl6qBGz1VK76KlfPNVGOGLDzyKQlEbzJ02VrWCs1xVvekHi6hzAaU2
         3RgSNAq4RVc93miZpMJwsJsuG1+d7Tr2Ppq6foPvcbYAKS00q5NFCFZ5kj+To55X+Ao0
         XN1lAVynKENW93Y6cZsMmbH+pSz7I/X8N37uQ205CFsdIvYzzPA+QmT1xUGp/9qyHbX0
         mE2g==
X-Forwarded-Encrypted: i=1; AKwUvBxrYxKUfq7xzHkz0300A7720IZqRYC/3kzsvrZah2rWbXMEiQnLhdopWcQBEEEE3H0u6oakZOnCxzSOJcA=@vger.kernel.org
X-Gm-Message-State: AFuF++l5u4AtF0EcDiG0ThWacjEfRnVMdfdYo7+qJd+pViT3mYkB1kAC
	xyArdmwq9VQOKS4hOtSuG9vB4xfLuEoFPu7VU4jlNNodHd9K7eNryCI8EMY7Tk043BOC2WjDLmz
	M+eeKgXUGpTKlRs8y+2gxycViqmwZQ+jbw/18FDazLVhbyvjHZOv0kFaIZ6pEM5Y8T3I=
X-Gm-Gg: AYBFou2e2p93a673BMIt++CJDccZavRKsif577kH5k7C4vy4dDdleCZpyf4zYLn8MbG
	mLUBBtU3/KylqEA8t6qgJFYLLhXQ0FeN2wvoyh2jLBngtG2t4pr+s2WzYRhKYl7YCVknAqq3oVW
	l05OnnmY4jpOQDX3OawpNU/BStIQ7TrJYokAt7EZ0RxWBI1H0s/BerwrVJ3xyhbk7JmyXDkdBVZ
	buYi4lYkfqaleGdBsw5VlRASeDkmiSUCj4rpiSSEf50evdif8bR8YzKVGh/gGWremuxo1MKsqM0
	jWxU9uHNQP/53gdtQMi29CdyeHLQvFQYxDUczhjUPyGY3NWrmwgNkNnwx4rNp4xZ7hIWPsOnotF
	MpaExghYhZGgpmQ==
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042405585a.14.1789330727174;
        Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042400685a.14.1789330726641;
        Sun, 13 Sep 2026 13:18:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:31 +0100
Message-ID: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XwN5yK8z9sVp8BKgfyUGDvy1JNE0JYyF
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa70527 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=8k6WQxmsAAAA:8 a=AzqT7FCsPe08lIGMPrUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX5S5qFqjrFaX4
 lzcN1QT8lFDfLpNzgS9sUEeg0U757rpkctap22wzwVD2MPkENAeset2joBu2PmSaYQ+bizjaSS6
 nZ1OUQYefeR1XTjEz3tFgvo2BslSvhc=
X-Proofpoint-ORIG-GUID: XwN5yK8z9sVp8BKgfyUGDvy1JNE0JYyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX4bB6gStlKSj6
 XwbdX59Wh03tzRwVc6P02VyiTrFZz9A/5PpX+CYB1x96mghFOAW0xHFjwnWqI1nDV3s8lBi6eIO
 /UgzwqiFZsl+1y6HxoddP2Lml51PpaxvQG/3sn+0NEjdhAKByi0V/8ppZzxm5jHommb+FUI7TCE
 gl1INJoK9Hzi6XoQW7f12eAT3IPchzKk4ca/ZmSXNjfP0o2yo2BC+x0dCu9GHjAQyIum7qYyNWh
 7n8TI+bG3ruDahBZcBPxZmuji35oy8ZjD97fWJ34NMFK8uZ+VFn+StqJtbqcCE4JyApQIL+Gylu
 bOq6/pJhnQM8M4Qv0QVpo6MdnPdgLFh+jKYYu/LbRZXy82b10ycUnc/FFC736VCurpckzmmurHL
 am586vitIyJdAgF9j7dTYshZkmPB2/D0NZEM/z1um5HvY8YHHkDcIZlA91zKSNV+wDBGLgO6h1p
 JQHDRWuGNVrn4dfpelA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130288

Add device tree support for the Lenovo ThinkPad T14s Gen 7 [1], a Mahua
(Snapdragon X2 Elite) laptop, together with the drm/panel-edp entry
for its internal panel and a QSEECOM allowlist entry.

Tested on the platform:
  - Display (internal eDP and external DP on both USB-C ports)
  - USB-C data + charging on both ports
  - Wi-Fi (WCN7850) and Bluetooth
  - NVMe on PCIe5
  - HID-I2C touchpad, keyboard, TrackPoint, lid switch
  - Audio playback (2x WSA8845 speakers) and capture (DMICs)
  - ADSP / CDSP / SoCCP

Not tested / out of scope:
  - WWAN (wiring included but no SKU with the modem to test)
  - GPU / GMU (kept out of scope for this bring-up)

my working tree is: https://github.com/Srinivas-Kandagatla/linux/tree/upstream/t14s-Gen7
alsa ucm is in : https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/t14s-gen7

I plan to enable DP audio and other things in parallel.

--srini

Depends on Bjorn's:
  - phy: qcom: edp: split power-on sequencing by PHY version
  - phy: qcom: edp: update v8 power-on programming sequence


[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T14s_Gen_7_Snapdragon/ThinkPad_T14s_Gen_7_Snapdragon_Spec.pdf
Srinivas Kandagatla (4):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  drm/panel-edp: add CSOT MNE007QB1-1 entry
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7.dts  | 1184 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 5 files changed, 1188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts

--
2.53.0

