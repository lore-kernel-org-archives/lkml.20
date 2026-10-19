Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8C4AA59E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402766; cv=none; b=EmO2brmcfTYbS1RPdjNFRx/fo6D8YzrsBvdqdtsTPxfIt7LLulJJrhJi6Y/LPrMdJ96oque+GvgyX6eNcVGLT96RGPCVykT9SuydGy8sRX+BS/IQaP8ZR7svUFCuS5cRLGq2Td2H11VpzgeFN6951CVXkonovSR6MYEAUbO0aEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402766; c=relaxed/simple;
	bh=I8YGh9EA8mdehfClcMuTGb+WumIem5wJNu4LocA+N6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcUX2pXwQUa8B3oS/9hcfNHih+JuJWT8ph7QIkUWbT78Wu+7X4Hh8vSo5IeqydVe8ffApNLeoKvW7w5I5qfE6wvsMmRFxMKE4EzhfyQf37zLN2bYHMJuj+GMcNEbWCyQCXzbo475maCfc1kLPg0AeYn2frmm8KnajnZ8+kyaris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI6X8foJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ato1lABM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI6X8foJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ato1lABM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Outm2752288
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CO3dX4XR59N
	PcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=; b=MI6X8foJacqsgxr0c8hfBZac+k0
	QfIKw9uM9H5zC3HL/UvwEjJw9OguFljPHmYJKF9A4ys8/Pt26Fa/WGV40BHyUwCd
	1ikXa/VjhyBrskVuw9GWjQoHKynD/B8M0wNxcDs6Po3d+UCt0UU2R7VcDqAzyeVI
	B0Wce8EPB0dTPtxyAYNcpgj+RbQ5zPVkHxoBHOYEQ1cynzOFQbl2MgdCTirbpVbv
	baU7dYsToVebNdpw0rEGvgTEp/eMjUSTs82uYqdj1N6zc2XH1U0ehr5jVFWhgeyl
	SbgPb5zuLdgnsriI1mPsiBCazojUlSU3H0jf/H9a2om1dm7GE4PS2Woi8Mg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gdu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab46165261so1074103a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402763; x=1793007563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO3dX4XR59NPcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=;
        b=ato1lABMSvbyNpx0++05kIk1HXGBGBHQM0HdAiUa3YN/3n2PBzIkFS0x6UqwHyokNu
         bAJYeHHM7N7L8DArNw91HbEf38BWvrqu9aYpeIItcLZvZB7hO1gb5kHDHIt19ruU3BWY
         jfPxgyyh601WqXlZ1l38CYj1gunrEAoMJqJFEbG8Tqxta/NdxwjszIhZNxSZGeRTbmnk
         Z+rsGUixTEDGkklinUPV3QIZbtPu9Pj9LIQav25ysv4Fl4mkimDjT7GqYMk4GixuxIoz
         Z3b30dhMkZw9JVz5K6YiO0c90cF+f+ceojNrHKZNZMbrqF5/E16HHXjeiNHBGGu2hDR+
         p53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402763; x=1793007563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CO3dX4XR59NPcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=;
        b=NreHLhkccRagDsr9qAImwMsLjEmJe0nRfYUIa2cjDxz9RTD0lQ/yWK0IuHtAIyfmQ7
         oNbJkJlDtldTrzO7+oSM2CDPkPj5KcpENs4IsjU7cxLjrYMZMsQgx/RuRJpPPs4iAgN/
         HFWll11mVDLZJqB7JPSIkOdRKE04OTJ/MRa1nOHTT8j2JOIufa04XMhTZYpXbwCz0fIA
         MKhc9TzImrK8jAiuX+wh3S1fThiuE4fUdjd6Tk0fRMyPsoET9Pq9iJ8rWXICmI46SPMR
         XSao4+ORtJMD3M5AAL6jgCOjoa8dUkUNOBUWaLhQxJyDeetAQvHvLTK4Xy8ljr2WEiS+
         Vp7w==
X-Forwarded-Encrypted: i=1; AKwUvBwAEmeJ+JtJZ1qZHLR5+VcGwtiqe21eH6oqrzpZ+TJ3x6NwFqXIHfRLnCgQFovCUWCbg83eq63yxKiuXGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1tyseh+AvaHUhAE6EmZeZCZzfGAgGk/jAfrdv0U/Fapde1rDD
	aBqrSzdezJioeumrwxeodW+d46djhY2qkaBqDY4Gr6MdPEzdxXYAz29wTPpq07HgDcZD1O8zhq6
	q079T4v3a48jf79FVWnVKpBa9izj/u/UCyZflJJ0juxDHv3PaObvB6J/9KSMjGfktvEc=
X-Gm-Gg: AYBFou1Zvp9zqz0SBJjxyHP0U4QOqHYgFe0YdN7JmQYG5AhC113Bl6h3GkeoFE/nVFi
	TiL1+Vo/P3MWryMhw1dS+/tcGmyf2xhsFwD0BtQP5mD9Ejluf42IQc9PWbBLqcwGcFg3BZvGSlP
	F5LjQEHqnR8RCfJAmPZ9o3BIW25sr5y+eJc0OJYSCRmpgfmmNRJniMXsh29Qvg6CpiPsb7I1AH2
	+uJHI2f2+zfrXXPbNovcBmXzo3GG2CwSn4GMWfRzGWeA5Z5XWgFYi8X/McXMXq392jCBTdFHyMA
	Uo8PK6XL+rbGZwQMPM5DyTqJI/1tYo5RCPPM83+fwBhe/4usCeMItl/mL8qr5ArBYMMB49zgf0b
	aJFMhq7Y/wKjvbN/X46Vz7wjv0v+n
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr10747943a91.4.1792402762990;
        Mon, 19 Oct 2026 02:39:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr10747882a91.4.1792402761700;
        Mon, 19 Oct 2026 02:39:21 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:21 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Mon, 19 Oct 2026 17:39:08 +0800
Message-ID: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX2UEZVIlirXfG
 w4OeCA7V83GA2ITK1dKVM4VdRIQ3s/223/VR3oRJZV0/1hvzaGNRIW0Qz7hHSCB3+uRlcGxXGdr
 Dx0+4qvtyiu7aLjLb+8HFOOUYB+xHrPo8vfEiq/z+Z7Nb0IgdbaeQkPIbaPr5TUiVDGSalnQ+x/
 RzXoYzvVPWIC09LOFNSFZQbn0gF8rruR3x98M6e0XjjCXb4HIJJCufScJfK8CoyRqCQQ0rDB2lQ
 zM4TlYDVRSjXkMV07VLjL9/iJMaYZ8ulipxb4xAk3ufdJCuUdvfV+zp2ntMtpDcXMAa57F5xsKv
 N3P90PmaO1bFGb+7ewiN/kx3+y9jQkt7TzbxJ2k7ET+i2ycQK11lrfckuXUur4G/Rutu5OyQpW0
 GI4Y0M0EAfdFeHxCrKtT4RL+SxIsGeyHQ82BvPEbryINsKc6622UY7EoYnh0EGH3nEIK5M974gB
 pOQZtNmsdvUBQV69Pmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXx9HtpBFhNJ5b
 8HYhXz2NIkzTU/JprHHP+ZckC9++ZtkrDd4kCrXJJZVsTjmHD569N6je9P7kzYzbiNVyKkPF7Pr
 rUuxUPhw+T+N+X8ZYRFNzmBfAXKstvk=
X-Proofpoint-ORIG-GUID: bgn-e4b7bPEYNCsbWmRVNCrWOgY6AEFi
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e54c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hnRN73myjJn4I1-c90oA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bgn-e4b7bPEYNCsbWmRVNCrWOgY6AEFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources need to remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series has been runtime-tested on qcom-next and kernel 6.18.y on
Shikra hardware.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Changes in v3:
- Use the "dt-bindings: regulator:" prefix for the binding patch.
- Drop the RFC marker.
- Replace the "must" wording in the wake behavior description.
- Report runtime validation on qcom-next and kernel 6.18.y.

Linghui Wu (3):
  dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.43.0
