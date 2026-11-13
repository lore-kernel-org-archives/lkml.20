Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580370;
	b=JLYrFjb0uAMWpwEGCthSy2ErDfb9s+lgyD629pNOaA2vpgbl2h5fb438+nBew3roRUHe
	 URYmbxqbS5KY3vhEGkf/FmBfxJWvH0HEDfFpBoXJXqC17hRdiO+0lm8f4Bwi8rCs/hur8
	 t43yyO45liAoXXcRJzcn5o1ZWtzdYPeoV1U05BFEr2ws6uUwAj0+gt+6Rkg75t5FhOELK
	 21I8Y3yDZz0mEcHjFpvNncx8+oyU/0qQULM6Z7jwyJlWXQeqMyq8KBhDmVGicVjGgvdxI
	 /xEDfLGlHuEsRl2eJlOItzjwvLxzD+r6wwFgE16IBA19A7JN19cq4KvYpHRcnJCA5kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
	b=n3JguICGJF0GOliaHYOUJJE7loVCLC0vtRiOe6K2S+jULsUa2+kwNuIG81fqkG7eokem
	 QyVXzLFjdZtjQX56K3g8T/hr/ChlQh9k6uHuLqOlnrdlQu+GULe73koNhyEO23h1ngakb
	 +cFYjycY2XSGLTIlcNDrEF+XK1d1m8A3TyDiDCRw4IpVp5cj53I4pZROgFfEd7rloBknW
	 vfJx3lbVVRZk8dDC3OvyddC0REH15AwNcrQSpySgN0g0lEj/qezHI+39NflvVXSE7TXgZ
	 nPa5G3S9bgfu8ZHW6gy65momUN8tDCGgxBWdStNrwYSxojBMJWtVurkUGo/fAcp23WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5147606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5147606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLa6u22w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkHAunv7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJp4n516581
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rjsZQSMnAfQ2xKNuqDsFY
	fnZ1wXBEQg1aBQ/7/A6tA=; b=HLa6u22wkwQbhtzocilLpOdaL41OcFYwoAwAkn
	0NLoL4GXoHwcp2KuMhTrLM4ZSpD9FcvlwxMtgxVhwoRLkM5cxM8JN016/kfl71pQ
	dbwFXK3I1WyDzXo1yHD7njVeZn+6s3Cbb4ES82JIfj2Lba2WRulmHhHqJM10xN7m
	rNdUq3siCq6jRdo/yi7qOM3zqx6R/Ao++PEnL07ZjK9za6TR6PyRJfKCXeVGObqI
	/aa8bN3kf2lC0SPmebL4fKVjjMis0luLRTCNlsHVNypl1Jp7UUK3+5gJclXMW/zR
	jqKzA/Zg4o+yVYQoeMHXDlucncp+i8f09v5bZ46IQxUDWl4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkjg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so186041985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580368; x=1795185168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=KkHAunv7+ZoEJzFDSgsTf8pMCW0XNVAVt4S9YnnStH0uw1Ne5L8PVh5zIhMSPP7JIz
         G373fT633YXavNT+ubyMaOZGtXVtFhrpx5F+BoAxDBkvUwCYSb9kuU+T4RlTjXkqUpAC
         HHkNfwBbTAOdMqjgcjWjR3QP3OqE+9z2Wl3YntZ4GquhFAkB3hnUWAoPwa9ZTe8Rot1X
         mHKCvqNsyOR2FNZHRHMnLY1GCoIaM4iVyXNT/FfdYi80PfEUm3ggVm/Qowoi9Qbwk+k2
         aFAAZtnq6uiI5LEC0+49jGzMJtHWV51fMmm108g0UueLwqH1q+T3AVddlzNvVU/+KhiL
         uWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580368; x=1795185168;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rjsZQSMnAfQ2xKNuqDsFYfnZ1wXBEQg1aBQ/7/A6tA=;
        b=GXfxJUkeOIpHLLqEw7wApB0Qzzd5+UCRYKYSRh28ftvecTf44EDtyXD/X7FrCcfRsr
         XZoCd2XYY1CWkSuVMpkDJxTRj92vG61wohglilPazv+LCtzv5KqiXk6nL9zcBvji+xZM
         Z80kFvAvZYPfBofa33ZTQS0vVAZFGB1KW2vu+SVIeE4onyEads/ux8bN1TNAlvP6FkGQ
         lsn8roJXqIRayvOAhZ2Ti0HSA0QfyU+LPQa/Fr8IvnTECMigDySIJ0hPcOcfs0bc67lY
         9qi5VR6xImfb41fB4DoS1lqUZjoDprURoCXcenqGHOyDqw8Mh5XU2xBJBcTG/CtYIWNx
         p4Hw==
X-Forwarded-Encrypted: i=1; AL+hErGLOYGL5HYa9HEB11d11FQ2EMlPrAcOAXBR/wnp1iEc0HVpty9TQfxM5Kt11IWfaPNF79w+l9vyGfwoIl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0+H8y5FSri4QUEuSSQ/OdgSsRROjkfSPgw57dHFlQcLhADMUq
	B3bsy/KN9QjZ1pqOfQSRKdlDWCtjhDdgWwU9taieWFEWqYSx++9JQhi5brYDjIJ90DhNv0az8av
	EX5gukxPMXdEevFfFB9sCITGUtInLefHjxu4Xgq/iJ8K+6gGTrcjPs9musDNTYE9oVdA=
X-Gm-Gg: AYBFou2462q1WFE55uBCtT3hHMWpUT4+al5P8On7JrsTxZrO/OEDETb5YKTV8ht7RdS
	YuUJnmQ28ZLNfsgzz4P+LhziC91zLFCm5VknVmxAWbeP7ogqJcl2TMq0p4WfiSF4s2TcPja8Cuz
	NNQEHnJ0Barip/0+3kAadItYVJVmHQW3uklzaLNJoWY4JP74LEjWnqEZYkdydy9+N/K7hagH+Hq
	a6cG+Ib+vv6Fk0eZghmcWZTK+idDJwIgQQT9lryofoUcSX5/zX0IRRiv2G/GPorBtO5HvnvsaYF
	YYhNrn5/j3sVIy/hIa49XRbp69Th1mtiLc/KAYK9U+aABYflt2KQzGy+Vo8JoPbKF+jGNoQATyW
	8KCcd2XseNlH0vDxfTaw7mo3gni+kFqrgt5eyRIREckBKI2P17A8DbiUcl6fTQIk=
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931369685a.27.1794580368100;
        Fri, 13 Nov 2026 06:32:48 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id af79cd13be357-949330d5136mr931363585a.27.1794580367477;
        Fri, 13 Nov 2026 06:32:47 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:46 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Fri, 13 Nov 2026 20:02:19 +0530
Message-Id: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHMf92oC/3XMwY7CIBDG8VcxnBczA6WAJ9/D7AHosCWrVkGb3
 Zi++1IPuk30Msl/ku93Y4VyosI2qxvLNKaShmMN9bFioXfHL+Kpq80EiBYsGl769J0dp73g5Ix
 trTQqyMDq4JQppp87tvus3adyGfLv3R5x/r5kRuTIQXsPWnjnJG6HUtbnq9uH4XBY18NmbRT/B
 AkLQXDgEYwQnpRzRG8E+RAQQC0EWYUWTdSyka1V4Y3QPAWEZiE0VbCaNKDtyMf4Qpim6Q+s+X+
 xcQEAAA==
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=3440;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=bCiMZ8Fv97xxgaf3+Qm3LMt3WxQjKVUrKaptjBGkrrs=;
 b=ZZASSHgFd3GJtQJ8e2kQl+5d+l+L5ObyCc571PvEnLX1MmTtshzTg1vSviPldWND+mWQfIvy9
 DYeHYEugw54ARU8COxidd8BOyxxXTkKgEomv6PXMkQcvMDBsWG3HYXD
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXyPFAB5lYWw5s
 8WqWT6yGtFIocngl2w5V8zWddAVBZbZfzB0X+iBNQrcCRyXwpTL6eVjfiz0hgwx7J/8xW5ki8NZ
 BzE3OrL4/c14kspKbJbJsvbhaWPOZAw=
X-Proofpoint-ORIG-GUID: PiG1GNT4udmMZmRBqMFC2BJxWz_Rs9Pm
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af71f91 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DOWZbCq784I2nnTUJM4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXyTY+1Vr/L0UO
 vtE56gqZ1X9Go68sKIRgrIHwlcTz2oWr66QT5jOhlyawntkUd5c9p3HQIPSZdju2BbF4N4KRtfe
 4RdmX1lsp9mvpz3HfQmnLWcFKugA+sC5cf+VwmciYUARLLRUKFSbb1s+UR1hsLkXin4p+xKb7bq
 Opmbe1f+8qRWeFxrsSC+iuln7/qFR78k/yusLmHNA50PzOuj2OQX1QWDIS4fMk4bZir9XhMMbqO
 kihjwWFK7mNZKacQ5oXywHeTzmJfha7+l+JNkiELQB843fdELcVWntDpVEOJbNvIHZ7bu9+1Ukp
 IrEdVbSXwG9BOizCdAvKSd1eIRn+5+AaG29E0zg72CjNkRFVHKThOzqJefOWmVz90no0nJS+6hl
 T2QHVXe7KwqB3W3hB8rv9TdzhlRPIj5tAvu8QukM37GYvAGLS9FLo0rnVoaQHy+IOamDsIzlFxa
 jQuSh9uEwfcqBAwUmAg==
X-Proofpoint-GUID: PiG1GNT4udmMZmRBqMFC2BJxWz_Rs9Pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  4 +++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 16 ++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 13 ++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 15 +++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 8 files changed, 100 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

