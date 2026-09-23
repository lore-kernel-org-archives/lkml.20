Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CB33B3BEC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152814; cv=none; b=XR8yTN7RsaVdoTQxkDmDzhaIGJRSYrfE3N/F7JbIolxoH5hJpQsOGPiLOVYkoNZT/QsNbi2jTBNNxEaNX12WT9P8TzhGk82QQAIQyLRwEINcvICgpa+lg4rrh4aRWyU1jln4+lYvAgnSPZ4Fkv7oENJAt/68tccqNpo6wOzMZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152814; c=relaxed/simple;
	bh=DegeByME95Q9SDYw+KAnIugvQBMRM2x0wwMhFx9DWu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SM80dcdkCzpZy1jrYxnSdk6LVCd4FdwUWWHVcQ9D0cKfRcbm5gTY7+I54rVG0pUE64Sf1WC/NPGQULeuuR73fMzkG2C9JdTf0qv7BQD5FNc1NescrWRpFK1bo4JGWBnVFvMGGTA2nWGTtOhUJhPBfZYbcPE54QGJ3biTQRQd7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0gkjM0M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpAZtl/9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0gkjM0M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpAZtl/9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JfQD3332812
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u3kBMP/UdR2dUdp9OUzO+e
	ymmQDIWWDtq95FmLDd2RI=; b=M0gkjM0M2OqJfpe/gSzvZvSoFiUsKqw5D4C8t2
	cuzhs4isFDV7ylHzJi7cFash3Em0hT0Px9CU5WSkc3P7+prBTRJ34KL/Eu0+Boxl
	KqmhuV4Q0qPBCIzXrjR8PEbXJvxKo2gQVNmYuPoFI6HKKgrHe6jM+u7o4soib5Ri
	aMdUd9FJalZ1aoDePF6JyPondDXwpf238yTuzbbqv52uBdi1pRvu6DPwmox/W7ym
	eBYYrOV8sKmy535OBLRxF5NRjmQLljClVnDqLxUHk6pwzwkXqO6bbN6Z9w3fA5k/
	TNS/p5uWn03SO0dbRVt0CO7zm18/CB3DPUvFr/M+a64mliPQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xudn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:39:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-144f706e063so484767c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152798; x=1790757598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3kBMP/UdR2dUdp9OUzO+eymmQDIWWDtq95FmLDd2RI=;
        b=HpAZtl/9oda1iUipuR2T2+6qeAIQDfWNs1dhxL/3G2Usnlyl27cawPgRhhrT9tGmII
         0gnnNp+Rqs6jX20IcmPREKN+HcQ9//scN0pBhyCViExDJyNQ1k00Se2ZG9/Z4r3osq0d
         NboNdE6sowIdtNAlXywzEdf4JBWETXtE4OtisDLLAKm6OTNe0Yf0s5jqfW3T/ruc9gsv
         M7f5dmXVtgBhzgUECzGpGChB1s9Vsreke7dAZQvUfxLlM1yPrSLCk6p1xZfYl/AuxG+3
         tNkGxNVuXlyklr+OrDk4jMJUuHcbOY51Hdg8yTqRVKnqEgiQcCWsz6XbmfKOL1r8yNri
         Nirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152798; x=1790757598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u3kBMP/UdR2dUdp9OUzO+eymmQDIWWDtq95FmLDd2RI=;
        b=0hUSVlIS8AaugGnXZIrQ/KhmlRUf8kvJpYhxqDxKaDlYaYAWSGkKutpYbVT9dmUECS
         0/1Xvq5KA+fYvuWTn7DD/mHVqR1UTtVipRpX2scJyPQa0gt9PGcQ4hNavUEApocUf/2S
         W5d/xK05noksdH+gChgS6NIrPT2okAF/HZ9WORWvleqZTs1/9afvf1/Z/OV/YvZRvAqZ
         QtjUbQTWWCLY3nAdN/+llpZi/AvagLD0CR0uCk5GNUKvidkV+ozGeVurTPV8zW6m60S8
         DPS8KdbKxsIAyJdFyWunMFSrd7R9jwdUlS17yBRkQZ0dtAWkonOrG+DoWtLCa00LLFIG
         Fwug==
X-Forwarded-Encrypted: i=1; AKwUvBwU3vG4+5m093G+aM/D3ZkHfxLAL4HqxYfXrmWtpU5Oi9gzMEcZmSnbLsAdpCOPxdbfKATQSEDDbJMMFfM=@vger.kernel.org
X-Gm-Message-State: AFuF++nochZlnkd1ebOrISvAij6XAuuJ831Z1l4BiN0uxWLWs69tDSqX
	YAIepAsGs4bmLQV58yzUWogIMqz5rT+2Wp0USwisXMHbVgbtOX6ieM0d5dg7SQK5ZoUBtVmQXp/
	EtQSuknoOgDaZqPbWdv3Ov+GGB27LhvJyZX88kSVcJR1O0AlSUER4qhtna43H3lS4W/r47R7gB2
	E=
X-Gm-Gg: AYBFou3PMgW0bO1nDeAR8lir0AZZjXci5wT0rUq5aQ3WBZIC1eLpmMQLrkla+BtDhvI
	o8ccAHyp3fxoNocuke4y3KGymBCwOCxSZcDfqCCmZA7KRINt8J97/7VK7WVila2LhTmVcueJduz
	PZSxVCUfCHiAqMu+FvsygMpqUj8+GLIgFu8CO5nKkjoaiFxCREvLOb/+3zzVqTt+BhF5MIgYcSc
	nGocJfYFu6pTYQ7lo1WeNzkZHKMZ4S6NBWavF2+MOaP0dm2tZmeQvSGMQBzDZz8GKMseb+qXIAu
	i3oTbaXhuQc7fXLXjYmrZkoJSns9qorfXIo+a4+yHnyc0FyHBxQfElJ8YSSfL4XnHJUs6vx4VKD
	Gn/NjjXh67p2QmwEVAz6XT9sG2HNJ52uA
X-Received: by 2002:a05:7022:319:b0:143:1bb1:3300 with SMTP id a92af1059eb24-144ef1b350dmr3164900c88.17.1790152797528;
        Wed, 23 Sep 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:7022:319:b0:143:1bb1:3300 with SMTP id a92af1059eb24-144ef1b350dmr3164879c88.17.1790152796975;
        Wed, 23 Sep 2026 01:39:56 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:39:56 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v5 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Wed, 23 Sep 2026 14:09:32 +0530
Message-Id: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAESQs2oC/3XMwW7CMAwG4FdBOS8ocUzXcOI90A5O4oxIg0IN1
 SbUd1/KBVRRHyz9v+zvroT7wqK2q7vqeShSulMNm4+Vigc6fbMuqWYFBhrTGK/T7ayFZboTzQQ
 UiaL1HlV9Ofecy++D23/VfChy7fq/hz7YqV2ABquthsY7pBB8JrfrRNaXG/3E7nhc16Umb4Cn8
 WnamQHa6ERoso++JQgLhnsaLeDMcNXAYKxPnJHNkoGvRjMzsBpuUydByJzwjTGO4z+wDVHLewE
 AAA==
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=2562;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=DegeByME95Q9SDYw+KAnIugvQBMRM2x0wwMhFx9DWu4=;
 b=P4zKL5Rl5YRdolktnRnJyAC4IEz/ZyF7zxqLrbnn88Xi2IbGk5Xw1xPWnltQY0eanTNkLqd8F
 ZN0S9WaFfjQBXWAe2mBGiT6jNDy6lHTOCL2JpxSgLhZlyPuhCvGnj/a
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: TxCAFVay7I0DBMvYao2eeTnL-6UmZomE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXxe4LvncW/lGS
 iQwHR63oXudkut8mezakGAAmdGWDDxRg6iTPMa+s5Rx1DxB+yaYaBTs5X4P/WC8UWrOnodCksOn
 Bz35dMedeYAtqkhSNlwAFI3rPSPPp7Wn9KcbDyKiOa4BJn9iVecj2OzY2/SkqEFTcq13+sLReH7
 bL0ecGlwWSXm4Wbcqxsfz9+bsPoS2KJq5H6vOlyf1dYmFrhGPWEZcWgYk2a9wPaVuhET9fpXp70
 HDx6HBOID/xP9pQuyvx3+5KpaoEpVLBi5b7LPlYNq91rW0Li3495iCCowfoCA5LAvlZb+lM/4yA
 J53B2sH6rfdRI5qgi74mG5N8jiiugWX2D0HyjZcheCn+2e1lDaNksGxyHuLvPobpiypvYg6hFLr
 8T4Vg12fh43r1xk0+hCFvLsF/lwCW26CTGxbWUv1IgjpN759mhDrtqPJm8kF3VcgdPTk/Km1oRt
 08DXseVOz3+k6LOVKhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX3rxmk6cmy+uB
 cZh6S/hRYPdrALMyNrmCRH0YDm+5+oNmu7EJZtnmGInJqrKfFaX9AEXoP58aO7aSU8iDaVcx8qC
 qPpjhTUI6YPh2peDxgHVBAXgwlD3beo=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3905e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YTpWxnxjnte_hGW78hkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: TxCAFVay7I0DBMvYao2eeTnL-6UmZomE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some DT set:
  qcom,nsessions = <5>;
which duplicated sessions inline during context bank initialisation.
Upstream feedback indicated that this policy does not belong in DT and
should be handled at the driver level instead.

This series iterates over CB child nodes directly and synchronously,
replacing of_platform_populate() and of_platform_depopulate(), and moves
the ADSP session duplication to the driver. The qcom,nsessions binding
is deprecated in the same series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v5:
- Introduce fastrpc_cb_devices_create() and fastrpc_cb_devices_destroy()
  for symmetric CB device lifecycle management in probe and remove.
- Replace module_init/exit pair with module_rpmsg_driver().
- Link to v4: https://lore.kernel.org/r/20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com

Changes in v4:
- Rebased on latest linux-next (a8406e6c0b79, 2026-08-25)
- Link to v3: https://lore.kernel.org/r/20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com

Changes in v3:
- Add patch to fix async probe race with of_platform_populate().
- Rename fastrpc_cb_probe() to fastrpc_cb_init().
- Reorder series: sync fix, nsessions, binding.
- Collect Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com

Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.
- Link to v1: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

---
Vinayak Katoch (3):
      misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      misc: fastrpc: move ADSP duplicate session creation to the driver
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +
 drivers/misc/fastrpc.c                             | 133 +++++++++++----------
 2 files changed, 71 insertions(+), 64 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

