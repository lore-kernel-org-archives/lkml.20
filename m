Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BC3C6A5C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286442; cv=none; b=YMNQtsYU/35R+GUYO7EH2EU6bc5lL5W8Sd7xwNn29VixD0tSBj0MZOpPfV3p6q/20icf1aAQAKEfy7o+skLjZgEKYJi3fKyTkNt7mvPMeelPg/7OFN8DyxBxchAgVNSSAIojiwrk4KDpUI2TeCbIrQ7/q8XAuMiL8vb7kPOs9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286442; c=relaxed/simple;
	bh=QAtghu7R22LAhNOHP8a2/ZQ44ccfDu5h/pKPEgDwi1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SGv+VgSN+J8NH8/MymTe1qzRJa5pLUvl9sXT1A1cxW0MWxWg9P2B7/EF6KxgI6p9DG2qc4rLL5uhyzocTCZvBVZoyMIr9W1G6sRIt7EUz1f5FcR9FAen7+HBwq1/w6tSTN/7DnLsZPHS7/MDKCo5zBqJ4D+KKmyEANYjdggQH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYXfxdLl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgTBPN8y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYXfxdLl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgTBPN8y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BQCnH537069
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j9g6/VTZ4DBNCpef5DHals
	L6MkC4zrpO+tCFXsR/OPc=; b=KYXfxdLl9qvm0N9gfljpSmaFTo/ei8xQkKqc5u
	rPuGpXBHK2hry6HOBIXuNLI0MFTp2PV2qfkmIK8l2/Df6C2FTsYiTDiYqSRsnS88
	DbdILgqeWd4oW4f6j2H7/xi85D4eACrNRTf80I3Pf2Wv9+FuussbSkDqZNtUCSKi
	xJL1TUEOt2zIN2cjhPXURVDLyujZwNCg7GVng5arOjbZ/w56x+rFQVYMjN4IxM+x
	8AqY2IQ64beMMMfshmUPC3sQ1+2CSQHvTkIMZ8RrsYcdskSU/MZAR7z4hhs1DYGz
	cyq8843h/qwDRVBil5kFtcg0FsXun9/wA09PLhDny7L1gNHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0bbbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:33:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2391492a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286438; x=1791891238; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j9g6/VTZ4DBNCpef5DHalsL6MkC4zrpO+tCFXsR/OPc=;
        b=SgTBPN8yc2UPNHLh52DSuONJflj9MMv3z8QzCOg9BsZl7xpNY6qCGMbqycakoyHl0X
         eTdGH+Ri7E7pvm7v2BHRAsoVr5rasIzFCecjce4mBkmQ3Zgua/g52IiXwz5aPiVS/JJ/
         PmGc/gPeoXiUFtVMCtXfeR35xPeGiwEmg+dYXD++md03WWHtbeC1B6/H9l8sn8qSuJPo
         Eha7OraVi5BTGqTpO3dFk7LHrr0zcxeS3VofryjKS1TFyEEiSbHMGlROGI94x4suP9Vy
         aEPvVFjHJq7686DnCmACJIEuXUhFA5iUq3iBmN1Xw+krdrRegEtXdr0Bacz6OM1ev82U
         u2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286438; x=1791891238;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j9g6/VTZ4DBNCpef5DHalsL6MkC4zrpO+tCFXsR/OPc=;
        b=rTK/8CjMqZTaP6ETqr7LgknHoF4u8LjCzV6FW2GsmgVhIWDPVriwi2INmn8gtB1qfd
         j5idrW4tV9lNWXKWvBREfOc8tXbD3QJS3tNYuye3E3Abdbcb9o+UeKihBoSvDXGABltv
         Zn9rQzgYuAWvsyyRJ2m77Y52RkOnC48XokiUkX++H21xkEjv5KPgFqKYxjSGblu1cz83
         stzKWS1fByBeGMf75QcEJDSumclQoLuhnXNwod2ndNKwH+SfU9dtWatzDZJABjZ+5YpM
         YHPcNjoUurmzHoK0W+DIB14PTbbubC1+WTpOU/4JY9tGik87mAHtUlYp6sHStSxdVMVX
         /ftw==
X-Forwarded-Encrypted: i=1; AKwUvBwHY3uwU4ugiUxnylChgM3k4IGuvf6zGadXRzmJjq7m6IF07uVGg6SR3yeczGQrIzIbHvNAqGe/+vVPQ/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJQ1T/gJvQwXofi/zbFcMOUgrQzr3PxkNdClrSHesq6I6NB3yb
	LUkaYV7e50YUQzo+iSPRBJlpRkQMOUHkNqnzv8kK+uBzuHuvaM6oxkBsA9Naov/MQeRXpNhvYgO
	0DEPdNBqCVQd36rPJKd3Q8X4ucwWY3iTUIT9PpZETrXD46k3OdJAQRYft/JKPIyRuC9I=
X-Gm-Gg: AYBFou0bI5OIwe0Em2ZEKfXkOFV3VeL9VuviSLtCYDeNyu37fwkDMPtkdiJkczzM606
	jpQwemPchS+7j3XKXhdmyM6YgeeoKJsEg/L5awNCv4pPR8f/33EgqIPR+1u8jmiiqoazYHWFfY2
	ome7oPFSE+qAPwciiotDJZoe39yqXvT4FciqpgFAOlI8WedbFNHz3bCisHFFaZwrXxxqK1mvOWq
	xlOy3jSY/DXdI2i59p20uxJ0XRpiHCzNxDLX1woPtd9+1J8Jvz9A8chvYg+7aTeRiETXWYrmP/w
	pIeOwXAz5dbeLWVjoyLflDm9HL89W3y4VKYlciy168Oe0EyKW4hYa3wnIhVeoGtMLjmKfT9xr5H
	qQQYYOi12lZExKf9Ej9daM3Nr
X-Received: by 2002:a17:90b:1d02:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a8730ec4b5mr461289a91.9.1791286438098;
        Tue, 06 Oct 2026 04:33:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1d02:b0:3a0:c85a:e602 with SMTP id 98e67ed59e1d1-3a8730ec4b5mr461279a91.9.1791286437570;
        Tue, 06 Oct 2026 04:33:57 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:33:55 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add TEE based client driver for UEFI Secure
 Application
Date: Tue, 06 Oct 2026 17:03:21 +0530
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILcxGoC/4XNQWrDMBAF0KsEraswM5Idp6veoxQjS+NEUMeO5
 JiW4LtnnEDpIsGbgT983r+qzClyVu+bq0o8xRz7kwT7tlH+6E4H1jFIVgRUgoVKn33f1RduY2b
 vhqHu4iG5kevlPzJrNFW5D7ZgQKtEGZJ0f+4Ln1+SjzGPffq9D064fB/2Dnar9oQadFsWe9+EI
 oD1H33O2/PFfUuh28pRy8RE/1iidZaEbSpXtb5hS4gvWPPHIgCus0ZYNKEtPIEnNk/YeZ5vY1U
 Ix4MBAAA=
X-Change-ID: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=8127;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QAtghu7R22LAhNOHP8a2/ZQ44ccfDu5h/pKPEgDwi1s=;
 b=pa/q9Q1vi9QslZnW2QTdImuOlN6BD4aT23nk1Wu15uRVKpvvCxtrsoc0g/71+E0PX8k899bc1
 +LzuTBJmnmECfGkypJwAomdppNy6Ah83v9guvj7VgUIcxxKGf0HeSyM
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX2lTO2FCXkikM
 K9mmzdRC8eAf3NmPphWAK/wzqsmYKGuOHtg3fwokUplIu6t9g6d4THbYm09n39wiJvbjK7Qm8PO
 c1Zvix9lvJ6Jk3x/hZA/P0vNVcLclF6LYaDXeHMZhghkfMUS1PRjhxxYQfHpiQWaXf6IkA64/Aw
 gEPB1E+SbaI5tWRvrzDZh87BH4M3ZEeBuJN75UrWGLpknqvmmMd+R4ttIKOd0ZiTeg7nWBg7SLR
 jF+e0OsyW61t8Ps03xBwZ77n1Lhuz0+9KZ8PBgbZlqov6QFHtb8IInciaQ7A1O2NRpbB3k+FXXx
 9DtM4bU+RtlOfA8XMTK7QTE/DosxlUUtFFDs3QhVkyBloU4vWyQu6TH3eKE02+6g6WyRaOqxGky
 4Y6nXm8N/7HpZ8icuygo3lzPZefTuI/lphp1c4eH0C56W7IH8A1bGFnM/jGA22ZJJzETIZ8dqcv
 bx2BSNcScN0ndG+43mA==
X-Proofpoint-GUID: Fc5KLIs216TVpEVyrMjx7Uqa4afWddGN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX9h7b2OZ+nsI2
 DSF19nQuHNHqLJqx1hCbmsB6OW+HUnl6OO1JjbBuBv0qxX86C5e+rNvVLiNtUo+p+EdbiZsF51r
 +H31QjE+6qp7SHgR+tsUEZIgOfw1qlA=
X-Proofpoint-ORIG-GUID: Fc5KLIs216TVpEVyrMjx7Uqa4afWddGN
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4dca7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=FEm0RaP5oR6l8Mw6-ywA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) located within either the UFS,
eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
the storage controller to allow authentication of the RPMB frames is
generated by and only available to the Qualcomm Trusted Execution
Environment (QTEE). Thus, only QTEE can prepare the RPMB frames which
will be accepted by the storage controller.

The legacy QSEECOM protocol used for communicating with the QTEE is
deprecated and replaced with the use-case agnostic SMCInvoke protocol
starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
protocol still works (the QSEECOM driver probes) the driver does not
support a listener interface with QTEE to enable writing of non-volatile
EFI variables (via listener requests to Linux from QTEE) to the RPMB
for UFS and eMMC storage. (Qualcomm Compute platforms with SPI-NOR storage
are an exception to this and work with QSEECOM, see the NOTE below)

Therefore on such platforms, a TEE client driver (which communicates with
QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver
registered with the TEE subsystem) must be used to update such EFI variables
through the RPMB service hosted in the QTEE supplicant user-space daemon
[1] which forwards RPMB packets to the RPMB device.

This series introduces such a uefisecapp TEE client driver for the
aforementioned Qualcomm platforms which installs efi-var operations _if_
the QCOMTEE driver registers support for an object-IPC based uefisecapp
service on the TEE bus during its probe. Only new QTEE firmware versions
available at [2] provide access to the uefisecapp service via the SMCInvoke
protocol.

Thus, QCOMTEE now maintains a static list of always-available object-IPC
based secure services exposed by QTEE. These services are implemented either
within the QTEE kernel or within a pre-loaded Trusted Application (TA)
usually loaded by the bootloader. The uefisecapp TA is an example of a
preloaded TA loaded by UEFI. A static list is required since QTEE does not
yet expose any way to dynamically query and enumerate the services exposed
by it.

To facilitate object-IPC interactions from the kernel-space, this
series also introduces a tee_client_object_invoke_func() to allow
invocation of TEE objects similar to the existing tee_client_invoke_func()
API exported by the TEE subsystem which allows invocation of TEE functions.
Some suporting changes are also introduced to track and handle operations
for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
driver.

Finally and as previously mentioned, access to the object-IPC based uefisecapp
service is restricted on older QTEE firmware versions. A new QTEE firmware
release must be picked up from QArtifactory [2] for all upstream supported
Qualcomm SoCs to enable access to uefisecapp service via the TEE client
driver.

This patch series has been validated on Kodiak RB3Gen2 platform with UFS
storage by attempting to read/write EFI variables via the efivar tool [3]
after mounting the efivarfs filesystem. See [4] for an example.

NOTE: Since Compute platforms do not have a firmware running on their SPI-NOR
storage controller which must be programmed with a RPMB key, QTEE has a
SPI-NOR driver which holds the key, and so the QSEECOM driver can be used
for updating EFI variables on these platforms because QTEE never makes a
listener request to Linux (QTEE doesn't need the Linux SPI-NOR driver).
Such platforms are outlined in the following static list [5].

Merge Strategy:

This patch series could either be taken from the OP-TEE tree or the
QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
all except the uefisecapp TEE client driver patch in this series make
changes relevant to the TEE subsystem. It would be great if the QCOM soc
tree maintainers can Ack the uefisecapp driver patch.

[1] https://github.com/qualcomm/minkipc
[2] https://shorturl.at/zQU07
[3] https://github.com/rhboot/efivar
[4] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html
[5] https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_scm.c#L2302

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v4:
- Fixed kernel test robot warnings with gcc v16.1.0 [-Wvla-larger-than].
- Update parameter docs for qcomtee_object_invoke() and param_to/from_args().
- Split the defconfig change enabling the UefiSecApp TEE driver into a separate
  commit.
- Use pr_debug() instead of pr_err() when QTEE says it does not implement a
  service being enumerated.
- Re-name qtee_enumerate_service*() functions to qtee_register_service*().
- Collected Reviewed/Acked-by tags from Sumit.
- Link to v3: https://lore.kernel.org/r/20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com

Changes in v3:
- Updated the cover letter and commit messages to highlight the following:
  1. Only QTEE has the ability to prepare RPMB frames since it generates and
     holds the RPMB key.
  2. The QSEECOM protocol is deprecated on new platforms and so this series
     migrates the uefisecapp to SMCInvoke which is a use-case agnostic, transport
     focused and easier to maintain protocol.
- Use single if statement to update both flags and addr/uaddr.
- Remove redundant use of new error variable in qcomtee_get_qtee_feature_list().
- Minor fixes such as concise error prints and use of better error codes.
- Fix a double free in qtee_enumerate_service().
- Re-org the qcomtee_enumerate_services() function to re-use the same oic and
  client_env object.
- Remove depends on !QCOM_QSEECOM_UEFISECAPP from Kconfig since both drivers
  can co-exist even on platforms that support both QSEECOM and SMCInvoke protocols.
- Update the Kconfig description to better help the user understand when to enable
  the TEE based uefisecapp driver.
- Removed qcom_tee_uefisecapp.h file and inline the header in qcom_tee_uefisecapp.c
- Rebased patch series onto the latest linux next tag: next-20260930.
- Link to v2: https://lore.kernel.org/r/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com

Changes in v2:
- Drop using MSB of the object_id to distingush kernel and user object invoke contexts.
- Introduce enum tee_object_invoke_origin to check the context of object invocation.
- Link to v1: https://lore.kernel.org/r/20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com

---
Amirreza Zarrabi (2):
      tee: Add kernel client object invoke helper
      tee: qcomtee: Allow object invokes from kernel clients

Harshal Dev (5):
      tee: qcomtee: Track the object invocation context
      tee: Export uuidv5 generation for TEE backends
      tee: qcomtee: Add support for registering QTEE services on TEE bus
      firmware: qcom: Add support for TEE based EFI-var client driver
      arm64: defconfig: Enable UefiSecApp TEE client driver for Qualcomm SoCs

 MAINTAINERS                                 |   6 +
 arch/arm64/configs/defconfig                |   1 +
 drivers/firmware/qcom/Kconfig               |  31 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 648 ++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c                  | 211 ++++++++-
 drivers/tee/qcomtee/core.c                  |   9 +-
 drivers/tee/qcomtee/qcomtee.h               |  12 +
 drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
 drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
 drivers/tee/tee_core.c                      |  24 +-
 include/linux/tee_core.h                    |  23 +-
 include/linux/tee_drv.h                     |  18 +-
 13 files changed, 967 insertions(+), 34 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

