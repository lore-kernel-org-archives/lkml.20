Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82B4E5338
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733137; cv=none; b=j6u2/f+/hjq+3AJnLFMHy8OEG/3hAVwvBKNfA/EBiyHy7qPrLPw16qUgqlnCaSpLpSm4Rj4hUlZrR6TPX5+6dy23z3mVFzeAZ07FYsQ0EIZZZorWfw9WYHQNd1PiqcozphrRS6v67SwL4SNZ/G7OxMrcnriLBgKZUiTA5/rOnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733137; c=relaxed/simple;
	bh=Nyed4En6PwZe5yiCtAXyDUFH5d5UVwQL26E6t0jTMDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=stn7eYYTBDfjxPLh5ZCfW+AApgz899y+4KMJ/vFJjWq74BVfm3NxGLmqLDpWDpMl1XHdW01oe1IIARc4zrjzgVd6gfkV8rT5AXbOLiphE29Ci8OuwXyBFnAv3mUWy2VcTpYDH9GwuNJOIDJjRyE3Luvo8a7ymvLK5VZH+e3PtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUUmQwaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CitdiXtF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUUmQwaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CitdiXtF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dd2c3801915
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZ
	dX73J1mw=; b=BUUmQwaWHcxeOPQjyd8UGMBGsgiR8EwAy2DYafwKyKMrlp8KhBm
	SsUtlRW5Kh7324DJho6rOPHMDgvhvpC5U3Q6pFy/lmt/epa2A+QbHQr91wu8m8Yi
	nQzFGw1CJzIH4WERgyHZLNm7L50Z2r5xCOtgV+ay3xbEeSWTCy6AaG32gqcYdyF3
	XPWpq2bcR/eSGEwjpLsRp/H2KgstILRkWRIQWCt2epCu0WbW6jKHzmzL9hvBbn2j
	dEkqGynrgU/o0hbVhbJoimh7aJ4CPoPU4+wAQ7AHLkbfn3V1Frsep5KhkbqzsAV7
	Vn3vvdmCEkOtr8kcm3q+F5IRJZuk/3Ero/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kueet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so124049685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733133; x=1790337933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZdX73J1mw=;
        b=CitdiXtFxcVj4cUXf8kTx0dHwAJ3oStF1cdw3S/YbqTUMr6G3XeeWd8mO9O4DUSjXN
         Nu2af1i+6idF+DbGzvOZWLadkaZx7qOspbZ5DU3HpJzKP46IYWQIsW3P/9apA5vF4PHO
         dN0HXHewZ+vSonhyrARWnetTBw7ut3Qd5X1sogeb9x4z5EPMOIBQglEtra1o6WtwCrTU
         blZgee+fJZefKzQAxfreaK04BP4mlZDEklueNc+XigRJ5tYQpv9JoymYegbdGGb21iQZ
         htAPhIUT6OlU5M+clOp04l5Bvz2Nekuq7PLJWsb2HCglnfUr+0388nksOSNPd01bHY/3
         htsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733133; x=1790337933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZdX73J1mw=;
        b=ipT0uOj9MbLcoy6aG6GUAXeL2Nr6aL2qogSwAKBcsBSVYkNZs8fA3B6CGcQtf1tAWm
         RuoCWOPNuVZiINNlYK9mVt8K8HgxqbBdKx6lhd87OZS1arJl8SfVCpJJt2UGt7mLQbju
         LdUq7NIoqqNm4STHVEFD07q0E7cKtoAJmywn9Uyhy+BQSgWGOTUBeMsLXQoHJIoFq4i9
         V+VLCngqEa6O8BDzPYkQvUKtxHtfh0KNKpMzIyUg7ag+hBcFjyvcTiwoSWxpLJv+PFNy
         Qo8rYTYFOoB9B8K797tNDKYnBbjA17ILfvGRIrFe2KH9FC2sksfu9ttcrL0CF53st4s8
         sTSg==
X-Forwarded-Encrypted: i=1; AKwUvBy0eggIJqEO/hS1zxgScRPJQ6jEHSUiYAvGpD2z+mcrBlsVVGdeWl123xVigte+qDg0x28c9xTLz0vmsek=@vger.kernel.org
X-Gm-Message-State: AFuF++ngjwTYhW5tJ5tujdDgXvXsyj7my2PGF6cBwJjMeiNphKkopBTS
	3YaVLZ4rtqz8FSmoEjFp0P2o/HuHxlS1NYxSxUaQCz3ciiX5F5PIetzDb7NBtypXCqG9hw2TqVn
	Hnokv3QG2JqGrixhomPQb31H8Xh8z3+JPnp8vibpbKV45z2EaNw42+52jcOtQnwbhCvo=
X-Gm-Gg: AYBFou0hRgiN56W66k5uLAE/lj2jV3wlACgSf/Bvp7jrgyJQYAfE4I0ul/dnC2MpD6z
	YPKMBey7hmqkKNCBipOTz8kBxPiVVV3h4OSBSm/GD7DFgZadzEtBN5J633bh7fLNDcG+xyLARZo
	u5JDB0wvTLTmZIMH99ks6znVbx0miChDHW2mX88x4cV8Xaez45UOnl8Lja4eiZ/JpPqDTd2pZaJ
	aOP00VcnjDIs6dq45nhJflV6l4pTXYFb/UBbuS8zVjGBRK4k/Y7QDlyYSFI6hoBFfMBSbGYuAHi
	hchmUM4S6hV7Ti5SC9H8XUfqYxc7fJUdnOokx2c8ddLoLDhv1YUB4Rfc2VFqE90YB7t/u1ZmMio
	zTnzzoZGuX+vXdQ==
X-Received: by 2002:a05:620a:458a:b0:937:80a9:94b4 with SMTP id af79cd13be357-93bdc64f822mr298204685a.2.1789733133157;
        Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:937:80a9:94b4 with SMTP id af79cd13be357-93bdc64f822mr298196685a.2.1789733132563;
        Fri, 18 Sep 2026 05:05:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Fri, 18 Sep 2026 13:05:12 +0100
Message-ID: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfXxssqahDAvZeG
 MtLdZvkTs8rDoj7GFnJJybP09p7fJuA6O8pfUxoYPj0bDKjm8KpMiQjlBki8p1Y261We394KeEX
 wkNa96y3IXCZayxqhzUVNPTGYyv7tBd2KS0/oMeoj0henNTiZaLZS1PVRHKu5lctAFJqY2YvJcG
 JrB8fjlKHA7KbGMAI3FClEySSGyo4ug+e53yuREcxrpHW5sl5myaSrmBYeAIV8TD5iuKslifxIi
 5QJ0WS42SUSvPLeCgt6pUvDU38Vti5DRVfjY6r+1DeYKB6WfHk+POCn+Yop0ag/olX+0FdIwJKf
 2biUHypq2QMVBYdA3AoMJZj6HLUuO6K1Oznm3UZCYv5mdYtEIwE8UBHrnnUelrvbqj+aWSIzto0
 Uff6pyX3m/vBAqucJr54YNEo/dD/rDlriUYl3LQm0Y8j/unjzZFyWSkurqvZKiuZ+lrZD2CV2gH
 F5CG+87rmWxz6wTI7Ng==
X-Proofpoint-GUID: NvLfdPVJsyqWJxhnYxkQgGbX44j9titt
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad290d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=J05Q59ynWE-0mZ9N3MUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX8llimwUiFuxc
 YScJR0Pif+Bt4dsfEYg+ujRkjORaZ7MiScpfw9C7hAC1ygGbNmO4glOGBTVxJMefe6Q+5btMXRD
 3F7oqcM0aAcYO/kNnVOyYJxaOr90JYY=
X-Proofpoint-ORIG-GUID: NvLfdPVJsyqWJxhnYxkQgGbX44j9titt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua and
follows the Gen 6 T14s pattern with distinct -lcd / -oled variants.
Patch 2 adds an edp_panels[] entry for the CSOT MNE007QB1-1 (CSW
0x1465), the 1920x1200 IPS panel shipped on the LCD SKU.  Patch 3 is
the T14s Gen 7 (LCD) device tree itself; it follows the Qualcomm Glymur
reference design used by mahua-crd.

Currently working on the board: internal eDP display, WSA8845 speaker
playback and DMIC capture, DisplayPort audio on the two USB-C DP
outputs (DP0/DP1), USB-C (host + charging on both ports), WCN7850
Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch.  WWAN wiring is included but untested (no
such SKU on hand).

Changes since v1 [1]:
 - Split board compatible into lenovo,thinkpad-t14s-gen7-{lcd,oled}
   with lenovo,thinkpad-t14s-gen7 as the base, matching the Gen 6 T14s
   pattern; renamed the .dts to mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
   (Krzysztof)
 - Drop the on-board HDMI-A / RTD2171A bring-up; DP-side link training
   succeeded but the bridge did not produce an HDMI signal downstream.
   Will be re-worked and re-submitted alongside the headset audio patch
   in a follow-up
 - Wire misc_3p3_reg_en pinctrl to the vreg_misc_3p3 regulator so the
   PMIC GPIO pad gets its documented drive-push-pull / power-source
   settings applied instead of relying on defaults (Sashiko AI)
 - Drop the unused wcd_default pinctrl state; T14s uses WSA8845 + DMICs
   and has no WCD codec (Sashiko AI)
 - Sort regulator nodes alphabetically (Konrad)
 - Drop the redundant &remoteproc_soccp { status = "okay"; } override;
   soccp is enabled by default in mahua/glymur (Konrad)
 - Rename WSA speaker labels left_spk/right_spk -> left_spkr/right_spkr
 - Include the raw EDID + decoded identifier fields in the panel-edp
   commit message (Doug); the CSOT datasheet was not available so
   timings remain the conservative delay_200_500_e50 preset shared
   with the sibling MNE007QB/QS entries
 - Picked up Reviewed-by: Abel Vesa on the DTS patch

[1] https://lore.kernel.org/all/20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  drm/panel-edp: add CSOT MNE007QB1-1 entry
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1213 +++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 4 files changed, 1222 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts

-- 
2.53.0

