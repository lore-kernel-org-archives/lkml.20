Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644714399C4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907128; cv=none; b=NMDh52URkZq58VIQAVacjTJMbCKnCmpIKYrvrrLpXWL2zbYWzzAnLnAajkMfzcFcZWTQBvQpPqi1LTu0ZoBS+vSwPvMKZy2huN9otEsKveCNDBBXf/f2o93prhOh6eWPJrURdqn5CoMlq9Tvp6rGZnRKacxdFujp42IRMY66OKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907128; c=relaxed/simple;
	bh=9ys3681p32APqj6Z88pRcCV7fPw5mjcOa7rsGo8U5ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVbntG+OT2I+9oISSfQ6A6cmcaVOysWT5OpMTz6elNSybClPXNkHywk/6c8SYOABC/vQPV7b5CkK3kOzRWlO/beXogq73yBiZdwq7caVr5cai4tkATsoeLkUWZYgqXaA0OSAGNtY/nmX8+jhlcU0synKIkzwuLl3l/aMZRnO58M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INB501Xm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnrgkcUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INB501Xm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnrgkcUP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBpiuG3275290
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nHGqvNi0X1PSleAmas4B81l/3KNqRkeiVL8
	aUDF2Tt4=; b=INB501XmUi1cS4dB9XVFh2i0kPwkEouV/hwHE1MOXGc7wyjC95j
	MlhrxBIekXsN3RGomAUacgzRgFqLHgMWFpBgoae6l4KSCuL+cfK+QsqcbAV683xf
	isFz4g/1wDqKYPvSP75ao5SfDWePyU97jFoUR6bjBDX0WkRkOAY9nUBGoOErxPy0
	007nSfu88b5d1qA+J8IDBKt/buA0yEJd/w/8boLWO6m13RBDsaUAWuwAlTUclCps
	3nJWvQgJs2kpfpDWOPHudNbgwYcr1m/AeULUzL37FEvrATEGLxgx0wCsEZCxitaS
	HSzT8bb0XssSEhK1TwsQtzhgzdea1gZhoSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsb3m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so42239955ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789907097; x=1790511897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHGqvNi0X1PSleAmas4B81l/3KNqRkeiVL8aUDF2Tt4=;
        b=KnrgkcUPe5B+TFpWhXEL3PFgIMbpJhlEDFWFz3ANGhmZh74RS2WPumEhvgdOZsyYKc
         QLalKv8NYERFKyM7L96fF+MjB/qsFomYfIHLoEtf9WhuHTFMkJIInclXwdEFb9MRjzdZ
         pvBBUzxipjDNowvuU6mtwBUc4W6LMu7VqAMBxgiqsV52pEwKoqps/qJUH3wQthTDAcps
         Rb7LJEgVpWUmIHo+nUl2v+uWX4DRjydHtX8+1d7WhgA+zFIze+asXcHvVDuLGmGrtF+6
         r7TYXGMnT/IjQSIZxdZzmVn6K5G8WwIOKSskrajF2NgnfqsE1gPmsp8jO56pD+/TEMa1
         Ehag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907097; x=1790511897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHGqvNi0X1PSleAmas4B81l/3KNqRkeiVL8aUDF2Tt4=;
        b=QjpaVOd/ztCqQrZWvP+3fSPZp9wYlroujlMGrhufWO1w9rXc9hmtnaneaFXfoULNRr
         jeopKU9dbUK2Uxiu1gsxmbRZhdju78xOkh3jeJ2+Z4u1mfuQhVyffhS9t6ImDL+sD4wM
         YtIxJLnWcmuKAln7FliWfrobn3SNRsshuI3r6pF6x0OQ0ZwzAAIBBuxPBuIsmuk8Z2zC
         eXH4KQNJlUSwrGzwyvcolXYnZaO9Yg2iphOFcvKdwQ3BUlGU3G8MAQOK9vo0QJtzTv7S
         ZCtmHTXq2kBkJ9K2wl+9xvfCjvYFF0MwScLSf7vHJtt4bCCLaYXgafjP0V1DGfaHUA7+
         mzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXuOG9nEJCX7i7rQJcCh6lgZemxJSv3J2vfS2LBz4JKxf7gqc0P7O42uh6acL9+tWKKaf+YM6Uqcvc/+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mkUCASX1U79lvgHmFRl76wOKbKUCjKunQMzSsTQLKsRhgc77Z7
	mpk7e3jiIfXrY1X0wurQZ0kWnNKqf+kvuPd87vkREImngzC+DH6zlbh0ViC9FVoCihpaRYVpVc0
	1+GVCE6p8HrzRmODFgnOf+JGgItv3I+STr9vjuZdXX8SpAlP1ODfvAN9uqTEb4ZZalB6bgEX4MZ
	UQTA==
X-Gm-Gg: AYBFou0XzQL4EWVW0Tq4Hi7i9ev7YXAwTfGNFd8dtVndiOVgE9XCTbMf7cMkrW4AGr/
	mPY6kSXcJEseMYSUHebuG5ZzqC9KeP8JC4RUfQC6/5jWgE9oOwDI39abKaqbm9FceTbgLkpgr+9
	4xePJjkYIJ3uHt2CrvBXMW7iyAScr12uLvv1fDpRTH/qLXUGrrdYnOCIf17BclZ5QIFwdtJGbFc
	q1cQSvwr7SAkdHcFfxg6khSphxjmEeHR7P+iJBQGel0T7iodG2LLAvrZepiF+S0Zuw3vrnir7uK
	zm271VEwfzBpDHPww0oLJhHrO9z1nlWBdsCD6wztEiBUqyhHQbwOvPrMftrvkgndER+SVCePH+I
	TmtMIoKkKwMubKkYiHAruYddWUu3rGjYIBoekSh2tODH97UbxHpCVwenPqw==
X-Received: by 2002:a17:903:46c6:b0:2dd:ad73:5b67 with SMTP id d9443c01a7336-2ddb1c196d2mr119168845ad.23.1789907096570;
        Sun, 20 Sep 2026 05:24:56 -0700 (PDT)
X-Received: by 2002:a17:903:46c6:b0:2dd:ad73:5b67 with SMTP id d9443c01a7336-2ddb1c196d2mr119168665ad.23.1789907096095;
        Sun, 20 Sep 2026 05:24:56 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aef9bsm12007386eec.25.2026.09.20.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:55 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: mst@redhat.com, jasowangio@gmail.com, axboe@kernel.dk, ebiggers@kernel.org,
        stefanha@redhat.com
Cc: pbonzini@redhat.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] FBE virtualization: inline encryption for virtio-blk guests
Date: Sun, 20 Sep 2026 05:24:30 -0700
Message-ID: <20260920122444.2549493-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0z95lSfG3fdMKHI6rc4mAnMweMFyFuGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE4MCBTYWx0ZWRfXzOyPFILhgRxC
 zUdnds50W3DjcNIP3dwdNWHyOIdnsErJrXpUxv4+WlD/Sm8TRgmT1htc/0RuXFN6Ddi1ad+HktW
 gHDAhs36X/L1Tq9BUiTc8/4KazUL0RGijX7M4nZgY0deDfh4pTt4pog9zp5rpi0Rcj3gdaiVlZs
 Rip9o9maSAO0UF0Q6qrh2ys7s6wy/hw9oMzf+pOCbHkgip3GV8m2pYSwVB8bd9g+QNv7yANLdH4
 RaOKU3WK1zJX9L43kFMgzOzWKMCyVYm2+Co5aVJACk7ml3uhUKxXeKmSuuvqB0TULnNZe7ot3nW
 ytPOJELuZkiBmmOzizBFzKeadQi9o2FfM8czc5NyVPOCkG3X/Y2LPWA5/Xb3vi02jANKg86GuVa
 uLO2RufrStmnqXpscXS3VIMT3AnVeG/zjistrasv4vLao9xCl3nhE57NL2O17f7MkQCFjvzcJSn
 7f37ZINPenUqZiRFleg==
X-Proofpoint-ORIG-GUID: 0z95lSfG3fdMKHI6rc4mAnMweMFyFuGI
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aafd099 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=82hO2hxRqmGPxkN32ysA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE4MCBTYWx0ZWRfX9yfFRp++WrGv
 X7C91/FhCRqb6DRuNOdf6GTb5YlsqUJ8mtBPalOlHomd9uXNX0vKBT3XaTlKjon2QXA9G0BDESR
 ypTj89L+hqlD+z3muOuJ32EEqdhDx3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200180

From: linlzhan <linlin.zhang@oss.qualcomm.com>

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
Changes Changes v2 => v3:
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

linlzhan (2):
  virtio_blk: Add control virtqueue support
  virtio_blk: add inline encryption support

 drivers/block/Kconfig           |  12 +
 drivers/block/virtio_blk.c      | 907 +++++++++++++++++++++++++++++++-
 include/linux/virtio_blk.h      |  87 +++
 include/uapi/linux/virtio_blk.h | 124 ++++-
 4 files changed, 1111 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/virtio_blk.h

-- 
2.34.1

