Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A8399899
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074229; cv=none; b=klRSZ+Oym7gUkpKjzF/Imk0tt4bZ2h2dGeF4EBCR0ncEWcmOqyVcxoxu5X4q7lR2Jcv4n4vCJllkfVDcYuprDf3sBLT1LfvI72hJcaC05qxKp6M6Zbe61inIuhd+NCaoN0v/6fTBovX4LAhM4wNtfBGH13q8OvtezoPd9l5mm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074229; c=relaxed/simple;
	bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjoNZLYUKjpuM7BVcMnSDNuGglPyWLNf96dEODqgD3JRUrkIevDy/h/rj3Wg+GX0kAkQPVso8kcmzYGiofEln3f6xiEz7ZDeMFxrOzIbppg3DcNaiyvLJU0wLKCcV9sUNjEm47iA4B4B2QrRFU6fcsMM1+agpNSml/nhzBLuL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nndw5mpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6THkbIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nndw5mpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6THkbIl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHwY4077449
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=; b=Nndw5mpDjPBn483Z
	v3nFokO/xnRH01UKlRSK/rM4IsPJHsprulwZDnIoDUyf4pX1cftCXxuTIMs9Qx0H
	OpgUVaz6CAg0YlOgoNItzg4tBkKQVXZk5p0K2ZpvFM5YyYfWgzW3spITH8tE6yen
	wA3X+3MwTV364wduYrhIpCyyF70BAuBDC/eOuaoDpj305iMHPGsZo2j1vfvSEhWU
	0o1AHlCFxrQbR+wwSbWBSD15OVUvZT1UGsTD5J6P87YwgbWbCITmhfeZ4RB3DSLl
	jCtIlJbPAcTYVpW8nNjfhEQ1kpaxq2KQKw7dbziXFjBDN0t8axDHjDl89zNfNaQP
	TFYniQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc15nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:23:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so14979255eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074227; x=1792679027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=Y6THkbIl6f1LCAn8mRNqqz/uH2wfWvGmLIr3XcxQrrJRYkbb6SOV6pGVY/cyqQcy9m
         AWZAWavTrqS0o2BQIh7GESh2k4CQQP0uKyIeFgB+CImWWer9NhcNw+WvAj9U5kZq460e
         /5JCXvhMF6uBwSS6scbze0HtFbp2QOJ32u5JlfTTstswDyb4xB9A52Ky9bj05UZDCcTM
         pXRzEd+PG0UtAgCcMzWmDKFY+yY6+zZDTLu4KO2KKRCDZ5u4Lfgi3+VzPago0+YUlNL1
         wFpvKHXLRHufPKRclSD7zvHaaAVcn032y3qtKNT0mwigkgj59AQ9FRp+griRQcdiR6NU
         qcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074227; x=1792679027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=26U9z4wcgcX4nMEvGQoZ+XYVbX48nqqHtGV1bhWT/PEEWG6uh7V8OSQmH+iNJrZzGR
         LMmmPyyac8hX3FzeN7/dGYWaB36X7mu1W1SNVaMXQe+Bdnl9iLGSVLf12DLHCj5VJydM
         cJYbvjF2iAnO8Oj1jOwwt11HQ3WY722NbT/+ObEALTlXBjeox+d5xMOpa1fA4pu5jsWh
         bc2/GEg0swT8A5d0MCUiLBPYgnBrx/PXiFjri/qX9lQOByfsmsEFXi8houp+0FVXqBiD
         /evbdrkepKP4PRIcbsMdtgrZCcoegl2YDwJ/QEIRRHbBmdl+gG7EbOu6uPxV/CNJ5xtF
         8wYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv6iiDoMLDlL5Xi+9DJUNhDtnk+Y7+Zpt62uoP2Qbze/NPtGu+DFO2Jykv9Pvzaf9qocUl9dCo0K6SI80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP1o2Dbvthx0nK5yfoen8vP2hA15+pvJ+WivQ+NF2Zkxt0V7K3
	BUnukTF9Bz9bGPYtt1CGgc1rU9BX5jVmscduNPT3qPNrZ3nRwTBX+Btf8VzYgowePSEq9kzlsSK
	bUTBlDz2EmK+HHpwYGgIxgrWe9Oc8ZVTt8JHmk4d5DPpynKIUzNcEZbqfOcMDAaQfvjo=
X-Gm-Gg: AYBFou0RVv6lXeFIF7IbZckYWDjJoTrvzU5mMFVusiHvbTx7OlZTXr0mx1Gvnl6zhSr
	iwVjglo1HDmbykzf+yQsVpNDQLyDHCZkzFtf1s62FvbPE3XQrsI2HUCEDM9YPext0pvF4EYjpAo
	EH7SC9E0GPFKdZwHonjuCJ/M7SD0iHu9y98YiQUbj2uAHBS8WA3WPDJydUIBvJmc/DoFGqQFjS6
	ISCGSDfSmFaQY3gua3FHODDRlDFEpYFaKj2jiB9wDkRhsD6LndR18MxsVKewNXnLAjdPvz4/vSl
	PtD1vLNBt1HLYIXKPeGlcY1PmhkcZsUmJeao/vkwgR1Wy5VfPzeqOCYsDmx2a03yyGv64Wvfc9z
	WM8+EHgV6dIZyL/NH5Yovg7lsTDwYCSWvUZ0=
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25814192c88.2.1792074227130;
        Thu, 15 Oct 2026 07:23:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25813448c88.2.1792074211417;
        Thu, 15 Oct 2026 07:23:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm22921139c88.6.2026.10.15.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:52:59 +0530
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add
 wakeup-enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074202; l=2259;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
 b=FOBgz70IKuMobP9CO5V242l4NMyi+psI4lueJUV5e32urGCGy5yzg3Bu1le31B40XYGC9lwSI
 To8GoIm/ykBDe1LSWI259wD32z21qPLMDXAPClnL/oAcySc0eF29Xzx
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0e1f4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q4uxw_U0XqAMYNGLDEUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXwKhi25tO8lK3
 qKz4PVP4xVosVVkHTNOcp3YTdX9mfLOfNw7WdDrUCEsTpxN7Q/cYFg/zeW7wIFzVwCc7aJHBNZM
 skACxGC8z64FRynklHPGMf7jYydJq+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXw++9I3cazjnb
 2K38gbX4pu8MEJmQjfbr9zcFuxTgGA5Zp3yYvUbxT06cWhVpWJE6bRWGoCnCnaF1kW090hnAFpU
 Z4Ii7RdHgr05mx5bMmpMkRHy0JPyj+RRO0CTNzVeAKNNVhhTMhe3yyAoo0ozHqT1fMCIga9g2r9
 LdK3ysy3wyYsHnauupQm9OXS9zEj3B5q0DN+s12r8yVk9MaQVWwOWv8kdNuhJVvwd/cdYPSuUkh
 Bbx9qGAoUhPGwZTuitn93BYIBWIwx4EQy5djBZqMU1Bu1IJjabliyNz2QBsQ+zlvjGd5jst5hoF
 AW0P4l/x0nM673ytoYA05ePVam2bmUWrXLpjOCvKF2hD6eXSSEuh7JHz+zY9gFTbFbm2AC7SqsQ
 WyExonfPOTJuFjRo7MIcfHRl0UJb2E6JNt0x3aRc+OCqEyoC4CN6RujxfwcvwqEdVaHgYyIiiUK
 foCTHFxyIx6ZHmxkx9g==
X-Proofpoint-ORIG-GUID: 9VKcMDHiGtkoOdzTg8z7KYUIEfeRJRmE
X-Proofpoint-GUID: 9VKcMDHiGtkoOdzTg8z7KYUIEfeRJRmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

The TLMM can gate whether a toggle of a pad is transferred to the wake up
controller (PDC/MPM) while the system is in a low power mode. The pinctrl
driver arms this for pins it requests as GPIO interrupts, but that path
takes over the pin mux, so it cannot be used for a pin that has to stay
muxed to a peripheral function.

Such a pin exists on boards with a SoundWire codec: while the bus is clock
stopped the codec requests a wake up by toggling the SoundWire data line,
which is muxed to the SoundWire function and not to GPIO. Unless the pad is
armed, the toggle never reaches the wake up controller, the controller is
never resumed and the event - a headset insertion, for instance - is lost
until something else happens to wake the bus.

Add a pin configuration property so such a pin can be armed from its own
pin configuration, without being turned into a GPIO.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0..95f539611 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,18 @@ $defs:
       output-high: true
       output-low: true
 
+      wakeup-enable:
+        type: boolean
+        description:
+          Allow a toggle of the specified pins to be transferred to the wake up
+          controller while the system is in a low power mode. The driver arms
+          this on its own for pins requested as GPIO interrupts, so it is only
+          needed for pins that stay muxed to a peripheral function and are
+          toggled by an external device to request a wake up, such as a
+          SoundWire data line driven by a codec while the bus is clock stopped.
+          Only supported on pins that are marked as wakeup capable by the
+          hardware.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

