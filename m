Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472370;
	b=0xf5j8sfOR55FTg51EEuxYHN+bF3DhidIuBWkLOR9UobzsN9ah0QIf9Ufe9rWuHCWe8F
	 AjaROZUhLfI+zYDyf5l9G4V3LMOwKc/ktgJCxm56p7ULgngQkI1YhLn9yY6WcsAipC3am
	 LGNGTmqTf1mGO6AZMY77t/Obj/HZV15qwk5IRS98SCf64/+doi2T+KlHZIoBDk8yDUiJL
	 +gsalDvTyAQ/asYC6cFzhbQVKknOC57sP2oSGdEZYnOuXh6btMyki/DfvdzYgQBPB2zua
	 i3V7BKM1uLrdWU6ekvt51jW//T4dEdUjj3GX7wUVYPBxx3P4NBu5uw5Xbrj5UOba2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=;
	b=QV0M9ttb3MDPbIsR599i1nKz245Yrfg/IigH8rsBH7iOlxMeSH2bV8uRDpgkluZIRsby
	 i+7PLt1k2GikYWTCVuWoEeI4KEZgI4NZHykoxWnOqoCHeUG3rnXIdGtPYSAkyzeeQ5aMc
	 LIGloER+mAMfee2uRqd+wwPW2ViPJxiyhdhQrSNu0CWogUHjusm0t8esorIZJwxaPyGtO
	 wQ4SJQ7RDOQY96fZxX47beg/7KC4xZIfYYWP1RGXItfTn7/y7CxSrC4CK1XuJzObQyvrX
	 AA4j9wFghSpxlC8BxEbIEugna5NldDDOuRAQs3aM+fetqCuwFlQ0iln9Znq0IxqlX2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FScqYM8a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjX4+8eR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453A60A2623
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7453A60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FScqYM8a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjX4+8eR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oVv32818498
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=; b=FScqYM8aikhQolXt
	YcS94TLUKiIJQTsBsfS9p+g195akfnGrugv9axUyrDHX+jLMjDabby9j3sMgczRF
	w8fO8zhaBpxLChlC4NH2PmbRU67bXPGHN73F/4SJXmDBce/ZrLbJx2zSt46AhtWc
	L5TmzSYId47JbmrzU27T6gpv/FfHl1ETYuY9ctFUijx8P30tkJcmPvp8FKHiwiIm
	LuXXkk3klJR3iN5C30FqgyWcTyyp55xtvFemCr3Mkdy/iaDEKWGnLHixQeMPV2O7
	P1lz+8UwS69ispoi4FSXRp9lJfwM70vG/BSq2EhKAl3cZlfQghGhFbgF1mRWpXuo
	ROu2Gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1857r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6969473a4so2619797a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472366; x=1795077166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=;
        b=MjX4+8eRuzwDxW7TRYPdsyzxXkvFimV+rOKF5vzAr5IvOis7fUZFXPd4pxmCLPtHiT
         0tKwMdgij/dHX4FFYrYWUjWQeAphRkcGhpnkzR0ChwHU1ea+5p68Lmf0ypxo2PgrodTs
         /tihkZl03aaufxumes12GbbNZO/bR76zo0jIC5786Tm6gckf4QB2bHCBKXoN5CpJNhuv
         okJkbcmkv/0o61JqbmtrqPZz+8wFrMRKJRKpdtmu8CUMs4aYyDVyAQDIyJRnZqiji9ZT
         0sOEaa8LcOuKDMzoErABUAmx7Q7neAX2KLyo5cdWMFb9AbXnIK8PAu0bM+cSQ7h/tALk
         rlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472366; x=1795077166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=;
        b=qKp8DNjYYNeky74zWAp3w8gc1k4Wy6gOIVpUsh+VqGV3aTRy9rUkYWGGXPRkKCeiE5
         B7Q6EQHuk2tBfnoXsA3ckv9UVw/43a01ktpe8taGqlIzau4v3Nnk6LYRUbIN8M2oD9XV
         puBF8OP29HJaeCLtPUVEKAQx3RyI1WERId9QaZcGkAuf4Djw/hXAIGiJb48vxd+qx4wP
         lOSSz0EDR9gQ8fY2OHUwlIdv0nbQodqAVtiC9OnHEqGW7XMKETA9kzhSaRNGFzjV6K39
         Mx0fVLniQiTk5lYoeKBhGmwQuMdPsliTnKbsSRtIsGji14DVpAG5fMLeCZJX4RJczTBL
         EakA==
X-Forwarded-Encrypted: i=1; AL+hErGxtHIAQI4AKMvsncszcTbVBy49FEPTdxACF+o0tbPcuovflcROX9ZWmHihq/TzhutFyWXrw3DuluRJWKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4XtASiVBVz/t9G5LyRrjpnI6HzWl8CkhVSJMwK8sWqsx7+nf/
	TtMjPhfxx0OkU1ATmBKc0a0mid2wmEcXwaFdYnuO2kBZECawMDV9zAbDFmuHcE0uKh9YJ8ULtF/
	lgrI3gTyfQn4T5MiQU3MbFioJJogFfzmCQlIIBAXbQLDS1dwcSZs4hgV0FsONagvcFXs=
X-Gm-Gg: AYBFou0GZFZMQVd92OhwVI6YtqPQXxB2WQpDTnzpbh4OKWJShaXHxAgsuupmulp76XZ
	M6lGirXa33nbsfeU0/f2M+FJvenvjJb4lnrOjzGxDYOnUyLEd2rTO5ySBgkTPfDDZzVmBlaw0Oo
	oh3IwhdwjGaPQJa1iQrx1yLzYtxIM0XMb/2rSZYC1AV7viHGcMo3axQn9rC5ZjLU8FThphxkqfV
	Z9CY6IQLNqo+lyqBSBpWStZ5mbNTcpri8lRF0PjPzUfco3AZpvXfDr2JsTC6Z0Hbvyfonb5dmY/
	EOlK2QPAfz6ARxcskZMvz5PWS64mDqN0rWq8pt8TSxJa/ISJJo3TEZg3X64kd0cHWgLmX/UkmRh
	CNU2EgjgGgGyu77Kqr0Sgfe/t+8I3z3ZcOnA+XOeBQvdeNrzgKHfW3bT/9JanAesYU5hmRfZ6mX
	vMss6bc790HliXa7c1BUWFXyCy2KyN02kyp8sw1pDRfSP8Tk81tgsM8HheO01cHT3svwQ2Cb/Ua
	g==
X-Received: by 2002:a17:90b:2584:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3b182f3eec3mr4251255a91.39.1794472365948;
        Thu, 12 Nov 2026 00:32:45 -0800 (PST)
X-Received: by 2002:a17:90b:2584:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3b182f3eec3mr4251241a91.39.1794472365406;
        Thu, 12 Nov 2026 00:32:45 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:44 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:18 +0530
Subject: [PATCH ath-next 04/15] wifi: ath12k: add QMI support for extended
 firmware binary download
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-4-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/wg2fpUTgcJ0
 UNAmiR1+AHlb26qrcetyYqaRmwyukkB+lkFiOMyWfg6wCz0IN7DNafl4nGWsMdYiL4mk11bd/in
 NWG9t+PviBS1CqJZDjqZMKOojTbuMq3WJs1IOaAk3NGpTwxh/yQbKKf1zLpr6tSJzhlBPPL60nV
 ZOGQ+e2WUfe9r5IEMaj11g1q4iSU3BZYNBaCWXrHGVQRnQ9yJu2M41aIvgVJzDNWhMSyInzNdB5
 CNOs+3HELC3DNkjDz1fRHPTo6wV84DerEdn8bvTvQowHNMy6AeSzVR/gCOOlVi7IH77FHVG3Dms
 814qZKMslIiApzBH6NjiXj+cCPhOlTjCi2agXudhjWbChhHZbBOpgyAUwQ5jvZ/b9XK11VK5WiJ
 WdyVkJf7+6LimLD6tO/v1wO6GIcyUXGEOIa/zV3DV8y7MDXeOn4kHPKuAPquTVmD0nDvbDCpKAW
 vVLK4Kvkw5Got+uuL1w==
X-Proofpoint-GUID: lPDEzflrMe7tqrj-yat3zTPCmGSd7ubc
X-Proofpoint-ORIG-GUID: lPDEzflrMe7tqrj-yat3zTPCmGSd7ubc
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af579af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3JWo-c6HkdcVygKZMrcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzeAwDmFeHfpl
 DMIoOqd6pz43Av3sCTWvL2A+8XdJ5347MF0ijtFv2Yf0d8aEPIMdtZE11SsY7xc7xERB2q8fVS8
 DWqFODs3RWJHcL+k1dQMAZXNMNCtukE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

ath12k uses separate per-image QMI messages to download firmware
binaries (M3, AUX uC). QCN9575 advertises support for
QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01 (0x0065), which carries multiple
firmware blobs in a single combined request. The existing download path
does not handle this mode and cannot bring up QCN9575.

QCN9575 introduces a new microcode image, mcss_ucode.bin, which is
required by its new hardware architecture. The host is only
responsible for downloading the image; initialization is handled by
the firmware.

Parse ext_fw_bin_download_support and ext_fw_bin_download_bitmap from
the target capability response and validate the bitmap in
ath12k_qmi_request_target_cap(). The bitmap tells the host which
images (M3, AUX uC, MCSS uC) the firmware expects the host to provide
in the combined extended download request; each set bit is one
qmi_wlanfw_ext_fw_bin_type_enum_v01 value.

QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK limits that validation
to the three types the host can actually load (M3, AUX uC, MCSS uC)
rather than the full qmi_wlanfw_ext_fw_bin_type_enum_v01 range,
because firmware defines four BDF sub-types and a QDSS config type
that this driver does not implement a loader for. Without this,
a bitmap that requires one of those unimplemented types would pass
the earlier range check and only be caught per-bit, inside the load
loop, where it would abort the download the same way a mandatory
M3/AUX uC/MCSS uC load failure now does, instead of being rejected up
front with a clear "unsupported type" error.

Add ath12k_qmi_ext_fw_bin_load() to source each bit's image the same
way the existing M3 and AUX uC loaders do: from the corresponding IE
embedded in firmware-N.bin, or a standalone binary (m3.bin,
aux_ucode.bin, or mcss_ucode.bin) if that IE is absent. M3, AUX uC, and
MCSS uC are all mandatory for QCN9575 firmware boot, so a load failure
for any of them aborts ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send()
and fails BDF load.

A device only ever uses one of the two download modes, so m3_mem and
aux_uc_mem are placed in a union with ext_fw_bin_mem[] rather than as
separate fields, saving the space of whichever set is unused. Since
ext_fw_bin_download_support never changes once set, add
ath12k_qmi_free_fw_bin_mem() to free only the union member that device's
own download path populated, rather than unconditionally freeing all
three and risking an aliased buffer being interpreted and freed twice.
Call it from both ath12k_qmi_deinit_service() and
ath12k_qmi_free_resource().

Define the extended firmware binary request/response QMI message
structures and element-info tables needed to carry per-binary DMA
address and size. When extended download support is advertised, use the
new combined request path in ath12k_qmi_event_load_bdf(); otherwise keep
the legacy M3 and AUX uC download messages. Release extended firmware
DMA buffers during QMI deinit.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/fw.c   |   8 +
 drivers/net/wireless/ath/ath12k/fw.h   |   1 +
 drivers/net/wireless/ath/ath12k/hw.h   |   1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 360 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h  |  60 +++++-
 6 files changed, 418 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..a8e8a55aa718 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1116,6 +1116,8 @@ struct ath12k_base {
 		size_t m3_len;
 		const u8 *aux_uc_data;
 		size_t aux_uc_len;
+		const u8 *mcss_uc_data;
+		size_t mcss_uc_len;
 
 		DECLARE_BITMAP(fw_features, ATH12K_FW_FEATURE_COUNT);
 		bool fw_features_valid;
diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 22074653cbb8..0e413ae7062e 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -129,6 +129,14 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 			ab->fw.aux_uc_data = data;
 			ab->fw.aux_uc_len = ie_len;
 			break;
+		case ATH12K_FW_IE_MCSS_UC_IMAGE:
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "found mcss_uc image ie (%zd B)\n",
+				   ie_len);
+
+			ab->fw.mcss_uc_data = data;
+			ab->fw.mcss_uc_len = ie_len;
+			break;
 		case ATH12K_FW_IE_AMSS_DUALMAC_IMAGE:
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "found dualmac fw image ie (%zd B)\n",
diff --git a/drivers/net/wireless/ath/ath12k/fw.h b/drivers/net/wireless/ath/ath12k/fw.h
index e146d24dfea4..f9edc7d336be 100644
--- a/drivers/net/wireless/ath/ath12k/fw.h
+++ b/drivers/net/wireless/ath/ath12k/fw.h
@@ -16,6 +16,7 @@ enum ath12k_fw_ie_type {
 	ATH12K_FW_IE_M3_IMAGE = 3,
 	ATH12K_FW_IE_AMSS_DUALMAC_IMAGE = 4,
 	ATH12K_FW_IE_AUX_UC_IMAGE = 5,
+	ATH12K_FW_IE_MCSS_UC_IMAGE = 6,
 };
 
 enum ath12k_fw_features {
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 138e556ac679..6fd87482425a 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -93,6 +93,7 @@
 #define ATH12K_AMSS_FILE		"amss.bin"
 #define ATH12K_M3_FILE			"m3.bin"
 #define ATH12K_AUX_UC_FILE		"aux_ucode.bin"
+#define ATH12K_MCSS_UC_FILE		"mcss_ucode.bin"
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
 #define ATH12K_PCIE_MAX_PAYLOAD_SIZE	128
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 69512b82aa3b..3b60d624b0aa 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -639,6 +639,42 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   dynamic_ddr_support),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   aux_uc_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   aux_uc_support),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   mcss_uc_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   mcss_uc_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -1459,6 +1495,42 @@ static const struct qmi_elem_info qmi_wlanfw_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01, dev_mem),
 		.ei_array	= qmi_wlanfw_dev_mem_info_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2B,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2B,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_support),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2C,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_bitmap_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2C,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_bitmap),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -1704,6 +1776,104 @@ static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_resp_msg_v01_ei[] = {
 	},
 };
 
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_mem_info_s_v01_ei[] = {
+	{
+		.data_type	= QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len	= 1,
+		.elem_size	= sizeof(enum qmi_wlanfw_ext_fw_bin_type_enum_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   type),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_8_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u64),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   addr),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   size),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   reserved1),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   reserved2),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_download_req_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01,
+					   ext_bin_mem_info_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01,
+					   ext_bin_mem_info),
+		.ei_array	= qmi_wlanfw_ext_fw_bin_mem_info_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_download_resp_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01,
+					   resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
 static const struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
@@ -2430,8 +2600,12 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		   "phy capability resp valid %u single_chip_mlo_support %u valid %u num_phy %u valid %u board_id %u dynamic_ddr_valid %u dynamic_ddr_support %u\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
 		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id, resp.dynamic_ddr_support_valid,
-		   resp.dynamic_ddr_support);
+		   resp.board_id_valid, resp.board_id,
+		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
+	ath12k_dbg(ab, ATH12K_DBG_QMI,
+		   "phy capability aux support valid %u aux_uc_support %u mcss support valid %u mcss_uc_support %u\n",
+		   resp.aux_uc_support_valid, resp.aux_uc_support,
+		   resp.mcss_uc_support_valid, resp.mcss_uc_support);
 
 	return;
 
@@ -3115,6 +3289,27 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 		}
 	}
 
+	if (resp.ext_fw_bin_download_support_valid &&
+	    resp.ext_fw_bin_download_bitmap_valid) {
+		ab->qmi.ext_fw_bin_download_bitmap =
+			resp.ext_fw_bin_download_bitmap;
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download bitmap 0x%x\n",
+			   resp.ext_fw_bin_download_bitmap);
+
+		if (ab->qmi.ext_fw_bin_download_bitmap &
+		    ~QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK) {
+			ath12k_warn(ab, "Invalid ext_fw_bin_download_bitmap 0x%x, host-unsupported bits set\n",
+				    ab->qmi.ext_fw_bin_download_bitmap);
+			ret = -EINVAL;
+			goto out;
+		}
+		ab->qmi.ext_fw_bin_download_support = !!resp.ext_fw_bin_download_support;
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download supported\n");
+	} else {
+		ab->qmi.ext_fw_bin_download_support = false;
+		ab->qmi.ext_fw_bin_download_bitmap = 0;
+	}
+
 	if (resp.eeprom_caldata_read_timeout_valid) {
 		ab->qmi.target.eeprom_caldata = resp.eeprom_caldata_read_timeout;
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi cal data supported from eeprom\n");
@@ -3425,6 +3620,129 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 				      ATH12K_M3_FILE);
 }
 
+static void ath12k_qmi_ext_fw_bin_free_all(struct ath12k_base *ab)
+{
+	int type;
+
+	for (type = 0; type < QMI_WLANFW_EXT_FW_MAX_BIN_TYPE; type++)
+		ath12k_qmi_free_mem_region(ab, &ab->qmi.ext_fw_bin_mem[type]);
+}
+
+static int ath12k_qmi_ext_fw_bin_load(struct ath12k_base *ab,
+				      enum qmi_wlanfw_ext_fw_bin_type_enum_v01 type)
+{
+	const u8 *embedded_data;
+	size_t embedded_len;
+	const char *filename;
+
+	switch (type) {
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01:
+		embedded_data = ab->fw.m3_data;
+		embedded_len = ab->fw.m3_len;
+		filename = ATH12K_M3_FILE;
+		break;
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01:
+		embedded_data = ab->fw.aux_uc_data;
+		embedded_len = ab->fw.aux_uc_len;
+		filename = ATH12K_AUX_UC_FILE;
+		break;
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01:
+		embedded_data = ab->fw.mcss_uc_data;
+		embedded_len = ab->fw.mcss_uc_len;
+		filename = ATH12K_MCSS_UC_FILE;
+		break;
+	default:
+		ath12k_err(ab, "firmware bin type %d not supported\n", type);
+		return -EINVAL;
+	}
+
+	return ath12k_qmi_fw_mem_load(ab, &ab->qmi.ext_fw_bin_mem[type],
+				      embedded_data, embedded_len, filename);
+}
+
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+int ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(struct ath12k_base *ab)
+{
+	struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01 resp = {};
+	struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01 *req;
+	struct ath12k_fw_mem_region *ext_fw_bin_mem;
+	int num_ext_fw_bin = 0;
+	struct qmi_txn txn;
+	int type = 0;
+	int ret = 0;
+
+	req = kzalloc_obj(*req);
+	if (!req)
+		return -ENOMEM;
+
+	for (type = 0; type < QMI_WLANFW_EXT_FW_MAX_BIN_TYPE; type++) {
+		if (!(ab->qmi.ext_fw_bin_download_bitmap & BIT(type)))
+			continue;
+
+		if (num_ext_fw_bin >= QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01) {
+			ath12k_warn(ab, "Too many firmware binaries to download, skipping types from %d\n",
+				    type);
+			break;
+		}
+
+		ret = ath12k_qmi_ext_fw_bin_load(ab, type);
+		if (ret) {
+			ath12k_err(ab, "failed to load extended firmware bin type %d ret %d\n",
+				   type, ret);
+			goto out;
+		}
+
+		ext_fw_bin_mem = &ab->qmi.ext_fw_bin_mem[type];
+		req->ext_bin_mem_info[num_ext_fw_bin].addr = ext_fw_bin_mem->paddr;
+		req->ext_bin_mem_info[num_ext_fw_bin].size = ext_fw_bin_mem->size;
+		req->ext_bin_mem_info[num_ext_fw_bin].type = type;
+		num_ext_fw_bin++;
+	}
+
+	if (!num_ext_fw_bin) {
+		ath12k_err(ab, "No extended firmware bins found for ext_fw_bin_download_bitmap 0x%x\n",
+			   ab->qmi.ext_fw_bin_download_bitmap);
+		ret = -EINVAL;
+		goto out;
+	}
+	req->ext_bin_mem_info_len = num_ext_fw_bin;
+
+	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+			   qmi_wlanfw_ext_fw_bin_download_resp_msg_v01_ei, &resp);
+	if (ret < 0)
+		goto out;
+
+	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+			       QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01,
+			       QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
+			       qmi_wlanfw_ext_fw_bin_download_req_msg_v01_ei, req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		ath12k_warn(ab, "qmi failed to download extended firmware bin request, err = %d\n",
+			    ret);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
+	if (ret < 0) {
+		ath12k_warn(ab, "qmi wait failed to download extended firmware bin %d\n",
+			    ret);
+		goto out;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		ath12k_warn(ab, "qmi extended firmware bin info request failed, result: %d, err: %d\n",
+			    resp.resp.result, resp.resp.error);
+		ret = -EINVAL;
+		goto out;
+	}
+
+out:
+	kfree(req);
+	return ret;
+}
+
 /* clang stack usage explodes if this is inlined */
 static noinline_for_stack
 int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
@@ -3990,13 +4308,23 @@ int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 			ath12k_warn(ab, "qmi failed to load calibrated data :%d\n", ret);
 	}
 
-	ret = ath12k_qmi_wlanfw_m3_info_send(ab);
-	if (ret < 0) {
-		ath12k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
-		return ret;
-	}
+	if (ab->qmi.ext_fw_bin_download_support) {
+		ret = ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(ab);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to send firmware bin info req:%d\n",
+				    ret);
+			return ret;
+		}
+	} else {
+		ret = ath12k_qmi_wlanfw_m3_info_send(ab);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
+			return ret;
+		}
+
+		if (!hw_params->fw.download_aux_ucode)
+			return ret;
 
-	if (hw_params->fw.download_aux_ucode) {
 		ret = ath12k_qmi_wlanfw_aux_uc_info_send(ab);
 		if (ret < 0) {
 			ath12k_warn(ab, "qmi failed to send aux_uc info req: %d\n", ret);
@@ -4269,6 +4597,16 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_qmi_free_fw_bin_mem(struct ath12k_base *ab)
+{
+	if (ab->qmi.ext_fw_bin_download_support) {
+		ath12k_qmi_ext_fw_bin_free_all(ab);
+	} else {
+		ath12k_qmi_aux_uc_free(ab);
+		ath12k_qmi_m3_free(ab);
+	}
+}
+
 void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 {
 	if (!ab->qmi.ab)
@@ -4277,8 +4615,7 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
-	ath12k_qmi_aux_uc_free(ab);
-	ath12k_qmi_m3_free(ab);
+	ath12k_qmi_free_fw_bin_mem(ab);
 	ath12k_qmi_free_target_mem_chunk(ab);
 	ab->qmi.ab = NULL;
 }
@@ -4286,6 +4623,5 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 void ath12k_qmi_free_resource(struct ath12k_base *ab)
 {
 	ath12k_qmi_free_target_mem_chunk(ab);
-	ath12k_qmi_aux_uc_free(ab);
-	ath12k_qmi_m3_free(ab);
+	ath12k_qmi_free_fw_bin_mem(ab);
 }
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7879f439a5ff..fc68ff649352 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -69,6 +69,20 @@ enum ath12k_qmi_event_type {
 	ATH12K_QMI_EVENT_MAX,
 };
 
+#define QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01 32
+enum qmi_wlanfw_ext_fw_bin_type_enum_v01 {
+	QMI_WLANFW_EXT_FW_BIN_TYPE_START,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_REGDB_V01 = QMI_WLANFW_EXT_FW_BIN_TYPE_START,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_GOLDEN_V01 = 1,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_RXGAIN_V01 = 2,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_CALDATA_V01 = 3,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01 = 4,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01 = 5,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01 = 6,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_QDSS_CFG_V01 = 7,
+	QMI_WLANFW_EXT_FW_MAX_BIN_TYPE,
+};
+
 struct ath12k_qmi_driver_event {
 	struct list_head list;
 	enum ath12k_qmi_event_type type;
@@ -153,11 +167,19 @@ struct ath12k_qmi {
 
 	u8 num_radios;
 	struct target_info target;
-	struct ath12k_fw_mem_region m3_mem;
-	struct ath12k_fw_mem_region aux_uc_mem;
+	union {
+		struct {
+			struct ath12k_fw_mem_region m3_mem;
+			struct ath12k_fw_mem_region aux_uc_mem;
+		};
+		struct ath12k_fw_mem_region
+			ext_fw_bin_mem[QMI_WLANFW_EXT_FW_MAX_BIN_TYPE];
+	};
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
 	u8 dynamic_ddr_support;
+	u8 ext_fw_bin_download_support;
+	u32 ext_fw_bin_download_bitmap;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		265
@@ -282,6 +304,10 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u8 single_chip_mlo_support;
 	u8 dynamic_ddr_support_valid;
 	u8 dynamic_ddr_support;
+	u8 aux_uc_support_valid;
+	u8 aux_uc_support;
+	u8 mcss_uc_support_valid;
+	u8 mcss_uc_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54
@@ -486,6 +512,10 @@ struct qmi_wlanfw_cap_resp_msg_v01 {
 	enum qmi_wlanfw_rd_card_chain_cap_v01 rd_card_chain_cap;
 	u8 dev_mem_info_valid;
 	struct qmi_wlanfw_dev_mem_info_s_v01 dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
+	u8 ext_fw_bin_download_support_valid;
+	u8 ext_fw_bin_download_support;
+	u8 ext_fw_bin_download_bitmap_valid;
+	u32 ext_fw_bin_download_bitmap;
 };
 
 struct qmi_wlanfw_cap_req_msg_v01 {
@@ -641,6 +671,32 @@ static inline bool ath12k_qmi_get_event_block(struct ath12k_qmi *qmi)
 	return qmi->block_event;
 }
 
+#define QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK \
+	(BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01) | \
+	 BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01) | \
+	 BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01))
+
+#define QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 772
+#define QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01 0x0065
+
+struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01 {
+	enum qmi_wlanfw_ext_fw_bin_type_enum_v01 type;
+	u64 addr;
+	u32 size;
+	u32 reserved1;
+	u32 reserved2;
+};
+
+struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01 {
+	u32 ext_bin_mem_info_len;
+	struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01
+		ext_bin_mem_info[QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01];
+};
+
+struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
 			      enum ath12k_qmi_firmware_mode mode);
 void ath12k_qmi_firmware_stop(struct ath12k_base *ab);

-- 
2.34.1

