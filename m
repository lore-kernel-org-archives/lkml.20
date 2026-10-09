Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA83546EE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519472; cv=none; b=sAjJ564HPWiDPIA8vrNzwNrDuOJSxY+LiUdZfhs0+jqMxUqmFEpEcOlQrK/PaVJnJQkrWm86qVMPW7fzslVjXt93gw4qVVlj/4y/lTs2OASLTFIItE0X7I3aGFW9dwcXuSXIEqa6beEzwrCaLuQx1ByvJ4sT8kaxm/k+PhNKUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519472; c=relaxed/simple;
	bh=ArEt6J4Pz8BVaQ9V7RnYbDwPTSPD+73G/AbZIcIZ0Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dnlWNglK9jOPwH4sGD0KsVrEP/gnenT8sbDdYVe4WuMAaGmfEJOCpD5feM20cQft/07+m5dTX5sUBSFT/eloL9uluhYHkbw2n/k4QwLZfY15gM6zvyPl4Xwt260DokYhB8BnMgPE7MshnqYdBSAmMmd3KyrXRLFHy+ZLqMsxorc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iI1ecwke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYWUlAcs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iI1ecwke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYWUlAcs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HFkS3768821
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f9f6qB3zTnDkNrHuwUp0Is
	PSkh9MuBPmByN8qEMV7MU=; b=iI1ecwkeD589xH4UrosQzwlg2VPuWufTAITGru
	lDtLglYp9tN4rP1Z5mG7NROf0kxRdtVNB5cLK4crawvcoc73pimeoNY5/3pG1d/6
	/GJwsj4J15Xr4xqh7nC8jz4i6DY7OMwluoJl/BUaPYxgtH8FEWfq6D3qrnR30b3m
	udzusKFKXD6vZtJngo4JBRahVA4WZXsVOh4WK4opYM3oXHGQ++31Gfu5B69UK7CC
	0cEI2MjOxkWgQ8igG+AV5no5JlOi3cRJrehtSv9IDzsgIzsWCn0NbCJ/55BSeZms
	7CT52ukKXwQFsZhC0aycDkK8BjDFouv2C06A8UjB9qi/tOXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu1taf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:17:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso3365152eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791519459; x=1792124259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9f6qB3zTnDkNrHuwUp0IsPSkh9MuBPmByN8qEMV7MU=;
        b=XYWUlAcsJFZ3TLuDFFj6QVlb8qYupLaER4sy5UNJoA07URYfN6+44ss9yesyezF7Yp
         euA4CcwMqQp3RS2YpEI64T/PXH0srHFuOFFH5oMy8Dk7MYV71yRyEaij+2sVOVarLNyY
         z1lA0EiRBK8zEM9abQIzXY0o9fCurf0ixYuYT6U3AQrtI/42Dq9gDbN/UFsuLZBvZEDn
         Sx+6HiDvyNKvAhpFPlnHwqAkyqUgvNjg34q/dVIMnc6Zlmf6l27vIcHxXxkQ+PVpdqnx
         ooTKLmeBXoeKDKw2Qr5UQka3MAG/V4VLr8MppLX7S3ZrZdrIwr+Ni7QknIXxmURRrIB9
         hUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519459; x=1792124259;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9f6qB3zTnDkNrHuwUp0IsPSkh9MuBPmByN8qEMV7MU=;
        b=AB7X7fZ31oxpwNODT+RMOlMX0jClvsbuOMK4S2ifU+eFdzLT5zO6y1ulUliWZBwWmY
         BlSZxwyVcbVqfdE4pNRilVeG3JFm9fjTEBF2XoG+KE0im6c+myOg2tjFMhDPrkO01T/3
         p7s5JaYVDvTEy0T4qp5Hc1KKnmbo9cko4yy2n4UbLuTkL0BqXjYuGjU3KUG8B/c9OCeK
         b7i5vjxc8WT6v8Qe/xyreLrieQN1auc2MpLEsrURgKEpJnVWlKyvNbhOsWW+XkNZZjxh
         y16qWJZy1S6/wQHDYOIemnVzIJFO5vVIkXWM/HthfMJ4wO4d+tnygAPv8/wimh5eQt8g
         XOHw==
X-Forwarded-Encrypted: i=1; AKwUvBwZCfxFdRNDQQ4jsC7+WFIX886tpwunlW6HeClbN47ud5GopxrKDviEQuIzxHFp+AClG5Q1GenCB+hcVKg=@vger.kernel.org
X-Gm-Message-State: AFuF++kal5zO9G/PZnmfavVMH/UKWp7IvcvpLThDovKVNZgHOxHyoVjq
	5KCAc9qTekiSjBkSOrBuIRrDWzsF8Hna9lAwL3F/0tmtgkyJdnidU1rQLsNFFaEDosqv3+GukbG
	YIRuZ8DId1P2U+a4GIDTY5yTPw2GgSThAUwFom9uLHLoTqqr1Ni7P196F1NchtpBnedxaoRqmmB
	isZA==
X-Gm-Gg: AYBFou1fFTFOVHoHfwyJk+q7RVSooPfY1oo1f+HslqaW1DG8tbrux9dMNhqzNvDlC2/
	TQdvHr86/4Vnzg5iXTXrLTd9AbH7L5qx8e0BxqHzHfdmc3oYvAQdnJl2I7I8qsabU3qWli3mBl5
	zy/kSXd11/bDllrNQUVS5BWMQMJxt9VG63y9C9KpZTbZSxvFL7gyuZZ4kc+pERBQ56Mm14LbE1p
	2VcULCL6RhxpEt3jtokdl5A6ikfw7hyA7J/7RYC/2EuFahi1zCKs4ZD1BB6YtFvol6t3l6Ec79S
	F/Fy4ZsCTGYHqk1wN+jYrqu/t4gCB0YKVURLlCRIK6edZTyZl3DCn2aXZl6YzQxpUmr+9JgCKVG
	sdDEGjnLF5X2IwbGKDlQGIbSCdlwy7DfHP7qrokBcOF9R67GslNxkekq4ow==
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr894835c88.23.1791519459439;
        Thu, 08 Oct 2026 21:17:39 -0700 (PDT)
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr894816c88.23.1791519458813;
        Thu, 08 Oct 2026 21:17:38 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm3530749eec.0.2026.10.08.21.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:17:38 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: mst@redhat.com, jasowangio@gmail.com, axboe@kernel.dk, ebiggers@kernel.org,
        stefanha@redhat.com
Cc: pbonzini@redhat.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] FBE virtualization: inline encryption for virtio-blk guests
Date: Thu,  8 Oct 2026 21:17:12 -0700
Message-ID: <20261009041727.3170811-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX3aUqmD99kJvg
 9kM6S1WAOyad0V6PATEjbxL2ky2+6+PVQLyf6rOOifdyFfHJ0xI2/GSMASwcWwzUdC65PY3L2PC
 xlhWh5oTeQTzRU3e84Nd2BWTRuvSScJCG9I+QyWZ6kS9aowykWgOEuIwgNn8+ehzGELlHG7Ehxv
 tv5pKpDjnWq+iBfuojbHAim1FwcniWhgA0LpWw8tkVFVHSsLE6XqAGi45EYeaj/q6CrVhjuMUkF
 AXmNocBeUbZdvRiugvtTfDT00N8FmdxlmOCcm3StN5PNy85WBcsaW7mpOwbV79opnApGnkId9Kz
 3looUFGSGAp9avENKXRCv6g05Vg7nRiOZhUpzn7XJ/BBei1yYPKiCI4QFRHD7YQh6fOAhWoQPL9
 6wOxmz8epuaaEzgR1NRVi3W83FM6q6fw8+ehxaPxzluk8cXLB7I7H9sS57OP8i2+2lVZISlTnA0
 iNhKPMHWR+mrbp4hknQ==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac86ae4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=82hO2hxRqmGPxkN32ysA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1vCd16KofnavwVJWsQIul6ux6cZeuDWG
X-Proofpoint-ORIG-GUID: 1vCd16KofnavwVJWsQIul6ux6cZeuDWG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX/F1IDKGSpjJl
 WOB2AhpD+qU7sZaPUt3Bm1z24tLaVKbRCRosWW4XjIRPdWS3DDPuEJr1nhehN6AY1laSpUMBImh
 B9jBU/3JBXJnTMHXgzY+M7FYxaDp37Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090016

The virtio-blk driver currently does not preserve blk-crypto metadata when
dispatching encrypted bios to the virtio queue. As a result, inline
encryption cannot be used for virtio block devices.

This series enables inline encryption for guest VMs on platforms where the
Inline Crypto Engine (ICE) is owned by the host or another virtual machine.
It extends virtio-blk with a crypto control virtqueue and carries the
required encryption metadata with data requests.

The series consists of:

  1. Add control virtqueue support.
     This allows the guest to exchange key management requests with the
     virtio-blk backend without mixing them with regular I/O requests.

  2. Add inline encryption support.
     The driver advertises the device encryption capabilities through a
     struct blk_crypto_profile and carries encryption metadata, including
     the virtual keyslot and data unit number (DUN), in virtio requests.

On the backend (blk-crypto-proxy, will be committed in another patch as
suggested.), the key table mapping virtual slot to the block crypto
key is maintained, so that the request metadata can be used to resolve
the guest keyslot to the corresponding block crypto key and to reconstruct
the blk-crypto context before submitting the bio to the underlying block
device. 

This keeps the guest integrated with the existing blk-crypto and filesystem
encryption frameworks while preserving inline-encryption semantics across
the virtualization boundary.

This is compatible for the virtio SPEC update which is under review:
https://lore.kernel.org/all/20260913161628.368484-1-linlin.zhang@oss.qualcomm.com/

Known limitations:
  - Virtio block inline encryption depends on the new control virtqueue
  - Inline encryption is mutually exclusive with VIRTIO_BLK_F_ZONED.

Testing:
Compilation pass on Linux-next.
End-to-end FBE virtualization with wrapped key enabled was validated
on top of gunyah hypervisor.  wrapped_key_test is a local utility to
get wrapped key and ephemeral wrapped key via storage ioctl interfaces.
  - /data/wrapped_key_test /dev/block/userdata generate
  - /data/wrapped_key_test /dev/block/userdata prepare /data/lt_key.bin
  - /data/fscryptctl insert_wrapped_key < /data/eph_key.bin
  - /data/fscryptctl set_policy --identifier=20f553802e64e36b43469211266a5f1c /data/testing
  - echo "data" > /data/testing/file.txt
  - sync and reboot
  - /data/wrapped_key_test /dev/block/userdata prepare /data/lt_key.bin
  - /data/fscryptctl insert_wrapped_key < /data/eph_key_2.bin
  - /data/fscryptctl set_policy --identifier=d8ca51d6d2094b73b2dae5ee7e3a10b6 /data/testing
  - cat /data/testing/file.txt

---
Changes v3 => v4:
  - Fix issues reported by sashiko-bot
    - Move struct completion and bool abandoned in the control-queue
      request into a pointer to avoid DMA cacheline sharing
    - Lock the control virtqueue when virtio block driver handles the
      response from the virtio device or forces stopping the control
      request due to timeout
    - Use kfree_sensitive() to free the creq buffer containing the
      plaintext or wrapped key descriptor， instead of kfree()
      defined by virtio SPEC
    - Replace GFP_KERNEL with GFP_NOIO when allocating the memory for
      control-queue request in the key derive_sw_secret/generate/
      import/prepare flow
v3: https://lore.kernel.org/all/20260920122444.2549493-1-linlin.zhang@oss.qualcomm.com/

Changes v2 => v3:
  - Fix issues reported by sashiko-bot
    - Change to the pointer of struct completion in the control-queue
      request to avoid DMA cacheline sharing
    - Submit a control-queue request with a timeout monitor
    - Freeze the data plane before marking the control queue as dead
    - Transmit the kernel blk-crypto-mod-num and key_type to those
      defined by virtio SPEC
    - Replace GFP_KERNEL with GFP_NOIO when allocating the memory for
      control-queue request in the key program/evict flow
    - Move the check of inline encryption support to a independent
      conditional branch.
v2: https://lore.kernel.org/all/20260914133733.15429-1-linlin.zhang@oss.qualcomm.com/

Changes v1 => v2:
  - Use control virtqueue to perform key management requests
  - Extend virtio_blk_crypto_msg::dun from a single __virtio64 to a
    four-element __virtio64 array to support larger DUN sizes.
  - Remove data_unit_size_bit in virtio_blk_crypto_msg struct
v1: https://lore.kernel.org/all/20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com/

Linlin Zhang (2):
  virtio_blk: Add control virtqueue support
  virtio_blk: add inline encryption support

 drivers/block/Kconfig           |  12 +
 drivers/block/virtio_blk.c      | 918 +++++++++++++++++++++++++++++++-
 include/linux/virtio_blk.h      |  87 +++
 include/uapi/linux/virtio_blk.h | 124 ++++-
 4 files changed, 1122 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/virtio_blk.h

-- 
2.34.1

