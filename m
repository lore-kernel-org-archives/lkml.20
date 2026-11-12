Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472646;
	b=mCmVONGXizS7JxU8SnPz+M0afUaEoDUwmMxfacIY09zWPtg5tG3hhC8jaAiSucqNAml0
	 EV1Np01b2fZsQYDDWdl6KDPsVh0z/O1ig2ILAd1tL5zNSFagezjb2SakB8Y2LprONx+oe
	 7D9DmjYGRTt42QeUAA1e6MkIctNb/BubTKKU7LyGLt2bWvocIAxETHn6vw9MZhmO+GiYp
	 4HPXgkpOodkdYj34r1DslyRYh99ouAmfqVtQlt/EAZ1B1hI9gwwbEgAY09ZGqunTUK3t9
	 b1PKx0+mYkM48bK/IhWIvtixPkCXUCzhnU6DGPCkxns7wChX+dwI297CmHo0J0WyeJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
	b=lJenaLGrw1zAgnFbU1iXKyJ1bmRqPFPtlmPS6o/QMawf7E9bWPxptXI5O3fhb6doHlpp
	 qK/cfQ6ngqduDMW42m2R1jRE2Rv5TIMgsBpMOrzoVpSeWirsDP37jGImqBgFtamhkLLtN
	 vt4aJq6nOsFe49Cv8gD7fIi0MdtpqmY4zvB6w5UTOOkfHyZR1BGpq4OPkBscC3avaxh3e
	 UVQW9birtzfghi7EsSooQD0lilPdS1uOxd9qjSdEK0IgSL0F2SmmKM9u8A/YbiMBEcwwd
	 qclcKPv67OAronccLyx9yXq0DRTBsimPyzHXfF9c5htU/v8xwAqjXVDZDStd5kO3cbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orqG9Kdh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYESPl2O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67709606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67709606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orqG9Kdh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYESPl2O
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j4Tq126395
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s5cKFc01sUo7AIsK7qLrqS
	CayN1KrsD+idNIcq4Lk6c=; b=orqG9Kdh/tdqL4fz7sOYHAtrn0k/aWng3KKYcW
	yeRLNlj2ZIMXbyHNDxvf+QWdUG5AYsM6UeqXJhPSlzXz1Q0x4hnBYy0DCyGc2nKM
	ZX+jr6E4eMQ+o8TgEFBpEUCIBGU/6WIMIx00y5XWZUuL7SjG+LSQ2l1P3N/6PVv4
	Hmm4VR9798W7RlExyV9yEtGOnxU06EWfFyrrVSeQs8ee2rAQmokhyu2O1sYZ9+xL
	PNFRoHES1PdTHhbBDuhNyEY4f4/9OSYbmHRHM6eeL+tfWWgkXLVxGsffculJUxjw
	o10H6Wm635TurdWgfTVNXlDiE+Mv+nFhJEI/QrfQXuOw4y9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a086ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:37:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so46550745ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472644; x=1795077444; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
        b=dYESPl2OzRLQlsdCFFe3NNcqgotFXhrxP992b4Q6CzH7bG3mfiGP7bJZI8MrIsBsU/
         zsMY+D6/ou3lOaaZibM5l4ucmDoyZvZyS/djiWyX+XJJFbBsnDjgRZ5wIEfpHRmYkFVj
         DgfcS3CsjXtkRit65S5L6ihoVB/b3SOMyUGureiHh+nyuxXx1PZikLaxjdyqjXYQX3pK
         Dz0wjplyfP0esmYagaiXMgeWocamL2L4wQGtORC4NNT+Wd1xx5EJ4zZ0Y3X4AAdLlhuN
         mZNa99Or8e2j+NJfj2HsBQ/nJo5Cv97Xqy2PUJ+HcKX54e35ioX7oXF8hFoqzk43jQd9
         mxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472644; x=1795077444;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
        b=XuFO96X7sd+uP57aF2PYoA/xxzFeKj2Dm9ubWs0v21GIIos6V2FJ7CHAXRZA4YpmZc
         tDOuWgvVAJPHm9ZwqL28jtotkeAOOznlFV/BJgUUT8msS1JQZtHlXbct2DJcIiuLG+wf
         SZcpjS5o14FiM3ds82D08lXQDRWvazm/8/qQxIg7h/sDNuhQvabeuypgVnzV6DpO1YpF
         MqbQwG/1Q3Fwu5WlO8GV7Qtx2GFHjQl3G2UAuLSXByoxTCDzNknC8NpxSzUcwowqVkKh
         AlyviEoPxBVMRqPZqVueB8h1QN+miB9qmMHjEUuZx7DZBtw2fipXmU2e8WpITbCnPEhs
         wqjA==
X-Forwarded-Encrypted: i=1; AL+hErEIc8qVWLcdKL0H5YNFtoL1tYrhJr8Whe/E4IUUWeSf6X310pPcX66LYA28+zYYiwU2MUkFrMn8ckkVbds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+wW/bKBBEA+ZprgKS3ehgPIw5SI3Vl2rlTRGlTmCtEHRjNohd
	d1hk6y5BReBGZjoAtZzZPXB9o6fhLrIxK9zR0/qy5ZhUaHEXXNDIcsGypeuDosDaDRKoiHDmNkS
	Onl0WEEIkYKnGlmZgQW53L3PQoQ3LicXqSkZvt2I8ed8100d4EVxlaK69MwRyzkjf21E=
X-Gm-Gg: AYBFou3AZfcpUpuaeVcpv7ESNzmkJ0t4NDqmfuRGd7krhlaItFyyUC4EnyDaTt1A1ad
	bAJVPLGrBFcNGTMyFa8P836L8WtkuBrxv6UyGcgm04deDWhcMhuAKYaJ4odc3l38TVvOxQzg4vo
	3fHG6GOlSFWGEZBadUG3bvUDY4zaZyt+o4sJZuRcm53F8yrApAsQ3FbjDhiCY9ll8FzzP9PbNXZ
	/+sTmNgC0KL7bdVAl5/hnRevZgyUuRVNiuShd9KmmD/SnRZR4O62NOoRttdBXBErBHcG1Q3n9ft
	AgJkpbuQaNxBw0Yp9t+dZxCWbCxSCeIhSCnk6w/79frh8ivHBfqKswrcWOrfgY3MZ6UOOGiShFU
	P61XNLwVny2PntFOxuMmK4LapqcDiWeNMPmwUb8HDxyp2jUCMZajq3LLQTtxuTLoZDhls/Zxb21
	WQEp3txBoltIMMXce1YoEbteysUD4QiJOExUDiMyL+sg==
X-Received: by 2002:a17:902:ebc2:b0:2ed:3f47:9699 with SMTP id d9443c01a7336-2edd78bda33mr53951485ad.38.1794472644293;
        Thu, 12 Nov 2026 00:37:24 -0800 (PST)
X-Received: by 2002:a17:902:ebc2:b0:2ed:3f47:9699 with SMTP id d9443c01a7336-2edd78bda33mr53951225ad.38.1794472643787;
        Thu, 12 Nov 2026 00:37:23 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6db8d85sm29639215ad.52.2026.11.12.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:37:23 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:07:15 +0530
Subject: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
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
Message-Id: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALp69WoC/yXMSwrCQBCE4auEXjuQNKLEq4iLnkxF20cy9CQqh
 NzdVjcFHxT/QgWmKHSoFjI8teg4OHhTUXeR4YygyU1c865um30ojxgMGTLBQh5fvnfITfyJRnp
 OaRuFW/JANvT6/sWPp7/LHK/opm+R1vUD+mJT334AAAA=
X-Change-ID: 20260917-smb-repeater-power-leakage-e1af2dd4ba29
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472640; l=1815;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=4R+eF9bAIL6YSMUPTI+knUnLAkaWbtl4NCeVfR71log=;
 b=ZzNZ+VdQvHot5SMcCNqgJgKYaaddWL+guQ4LprSNJ84wkPMgXfnCsEJU/+VVitfVEvcIk9tA7
 liQBUwOBojMBKkLkVq9Ir2jrjnjrzXmlrtY/SfN+frKUoPDOgZu1k+L
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: _UB5ugjSr5vIQN7OZsXOX28Kcx6kWy1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX60M6hLPo6kPr
 azT3NcweG8YiCfQMcfAyh7a44ekh9+jjj+Ft9jzjpMET0hNqOf2fVN0OSjBMLf3gYowRHw3578m
 cCXlfxphrHnDa8yPCr2REuO/TYddZ+gqdLOMcMRWJGf/X3aWVBSGG1kdSQC+GrmmWjHH/a4CbGs
 xmbKMDMmVMER6TB9k9Jgs1ghcC8N0AdmLwjorgyB+nxINTIQf4OKSEqe3KDOsXHjeo2ni+5ngGy
 XY1hhp7ZrE1YSn7ThEVS9pc6EA5F6aeliNzMgpqtyLLi6QZboFHWFzKeIPo1zDTQJQ4bN8masgT
 /+ytxcCaVbGrl3cmyxY7g/uyWddFNGXa2BOJpZxF5EVIJyedL3xTCrmVyLgl9oJRF90dOSc9rdp
 WXxjk/CcFwuooncnhFTQlkVUMQLJ+O8xSBHwV+l+U7UrtDdfuTDN2wA+fHutVVpqoKc2uyzwxVw
 let73Sg+2kJNmETRDOQ==
X-Proofpoint-ORIG-GUID: _UB5ugjSr5vIQN7OZsXOX28Kcx6kWy1G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX6f1EZ8ykq4Gj
 qZpgocOIvOQstVgvw2rfADml+wJx0r26rpvBe+76DUGqLe4/kTsGRCQuPjIl/OCdKp+YHQocodL
 wseEUf/jgcyTog2R3Gcah9Mqxuj0iTg=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af57ac5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Hjf45h_rMJPOqh1JJtUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120034

On Glymur, it is observed that although the exit call is done, there is a
power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
well). As per recommendation of HW team, disable the repeater during the
exit call to prevent this power leakage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of phy-next since [1] removes the base variable in rptr struct 
- Kept the RB Tags intact since its a rebase

Link to v1:
https://lore.kernel.org/all/20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com/

Compile tested v2.

[1]: https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 89bc1c89fc85..607b5a5a1713 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -227,7 +227,9 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 static int eusb2_repeater_exit(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	struct regmap *regmap = rptr->regmap;
 
+	regmap_write(regmap, EUSB2_EN_CTL1, 0);
 	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260917-smb-repeater-power-leakage-e1af2dd4ba29

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

