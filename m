Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573794;
	b=VrmQjTHaY22tnVV2cgtA6I6viBHSxfUSTPGvfLa9TacGrKDJ56zLMPpWA4+wAgSmCgaV
	 dqgLklbVfc4Ya7EruLI46hAwTWzWLQgSqFwGes/yneLivb7QC6UsepV4ClqKZBs4fNLwa
	 9ZoEdyQPUid4iC+JSBRrtJTTXMoFHvGZC/hi77yrTDBjTBc5OIGefFhCwFF0fyIR07ofg
	 j1AMv5iH/r7Z5un6iHB356Tuvf1KCA6qgCqS+d2dNKgHqapGOQ/uwtTcYTSBLOsq90L0C
	 w8ODT07cXeLxn1enYOGWxWzu9+LE06KRE9UsskaYN+FHRWfedNWdR0FqnCkt4daxHPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=;
	b=e5a3bPoQAasOT1Mzng+Yw2/resGcu9bmBmCSNxcnIfH//7raidDZ5eAcuGbeZKqHcTMo
	 IkTd5C3fld+Vu3SGfmtFjroqlmiIHI7YW+KqTAe6hvpBdcet6kVklU/2kZvItJWmkI+Ak
	 yz241/S8kybFFC+xXNahybcbQSg9hzpyl84p/I1Xn2UGiYPsFrL1J3Gq7792yZi4xTfCH
	 WDaqwnojFG0P+E2NCVKkvByCJeHH+9RasRoPUQ+aL3PQHTfDXzDcDqEujVpwypcYPqt8J
	 hEkmv87wFi/Oda8hCmwmsujkj1Y5jtsPuAXGSorLrAwPl3UlvvM/36AckXI97vEWA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jr5WDmIT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYKlv5TB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06746606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06746606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jr5WDmIT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYKlv5TB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1vv756378
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DedU1k6ASLyHSDk7lk7U07
	zZCarEr/9oVyaDy/PsXbY=; b=jr5WDmITz7eX75BcZm7ftA9DLDNW2i2yB1kxmA
	v8lSPdCXFKd0lxxwmdwj7oSMD0wd5fTwl4YDum3UgGKBEEtYoSFu0a7RAt6ko9Dq
	rqpdfYppK05jVSoAKqinCc7w45n7S4LvVNM80p7Ui80nqWlBAsiKeosNSNJCdpJT
	GpiZKzat2OlLkWthBNin9Rt3bmlysX1hVG6uCsB7YzDTj++y4qNJASxO22Cisoxv
	mrHe5OjqqMadDuRK7jyFJDWAtfWAeayHt8lWoedF2eWQpbzwC634VcrhTyCcyGD9
	WGNdxBqSn6oY1qMc424P+LM7qNR2oyfhkGthwQvH8U2Zh0xQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u5cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:53 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so803837b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573792; x=1793178592; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=;
        b=CYKlv5TBMQ0Xg9to7VNnCO1a1E1CxkCYcA1o9is7OO1B62Co1O70C8wQyFkYTFFPao
         j2qLeC/7UraEM4f2uiwEaNxmQ+esK0VvPLkMjsQjnwr8r1kS0I93qnOn1LJAz0U9CRgX
         W3rEaC9XoC17Q0pBBqagJvrdQ7RJ26v/SVTXUfiGHP2nij5YB6lIqy9zHFUFDOuKVONk
         gVQyaGNu4BDCvoYO8Omf0wloTccNJ+7YbG5+FTJbivluozLImVNXiBmqf/YgAdFHT39r
         RTyLGy9cjohvt8p/I/WKKBlTFlhygwyOEm1xONuBr/qAd7hnlZAC4U5QWnulM4CqjO+C
         ffXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573792; x=1793178592;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DedU1k6ASLyHSDk7lk7U07zZCarEr/9oVyaDy/PsXbY=;
        b=VGYbvT9pDjnsmbMeyboBWs58tlTMWy+eXKhe672eqgzdWoLQNRQZY6kQfpKgnGXnef
         8IOUirxB+LNa+DQyNG5nkwMgQNSGUHFHsvrhAnC1khTQMVpcIkFEQl5HDbanNl5F8IEX
         hmRbAVg6olGssJAsyRCNA193RSXh5D5vuutE7QQ9f2WPvsVatDpUV1lJXalWD9jkBqKa
         uPMFVE6vhjJK2g79Iu7la5hKtCTQeg8ryhHXBukYK8OC7r9zldPwqiCQuDn209fj+RyR
         8twIj9+mfNHXFP6FVkf/AhCqsRmgqOE7en5QNmTHt7IWk2CTfr5+WXOGtQi7x3ZYsFrk
         6Euw==
X-Forwarded-Encrypted: i=1; AKwUvByWh0bJtmckzB45OjCNJNpjFsia13DWd+mBKm53yX4UT5rBuDTQvzIa+W+bocHhbzoYKtt4iOxUiTqm0J8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYjLldruIsCiGfNssPuOKrgDloGKKa8NsyDfgl1S1Lw+wYFYeB
	tRCTfChR/wmIdLFGsVPyTObjGWkQci0c0ToO5EKP9aO8vM1oQm9fH6zmDVQzgKzYqlZAlQi2BZr
	sCNryqgWHNO0U7LHfaQVCvg5FKdHq2uBPdouFHAcS7gP/tKfKjY0LMwFMBABgdcR8qlo=
X-Gm-Gg: AYBFou191A+5fvHlvZ2hsgRW05HgynZQHlw6S6xZp19cP/1PaR6O0M+8o9dzTVz2EUD
	RwNrRVU4nbVgwiO4/2PSOqdGqfO3XY4b59htyXJX4Pkegx/qK41a5b+ubbPnomWkiE+GGihan+w
	1wDrNVZt2kNpsNdIkjXKN/NQ3Q0b6lt01nXy2SsR0blwLXB55YO9f85qdNTJYCqPDbvmAIOkF8N
	bl5rCX53izH7FXzvfOddFHCfPKbCgkQyqU8Jz3lRELzwSBuaKhojmFAWlyqrPt2++wa3FZtH/xv
	CyOwIZGxTb9xR9KwGcUZmSc98ySL2lYhJkYEHSEc39tnMmSzUkDPyHArT/4cXIF7drM7aLiJPva
	AJizjX80oJyBBiCHXCTKQ+Mer4IyloTKTTBJXtCn2+Xn71/SxxA==
X-Received: by 2002:a05:6808:4f51:b0:4d6:9222:99f7 with SMTP id 5614622812f47-553600880d2mr992235b6e.55.1792573792259;
        Wed, 21 Oct 2026 02:09:52 -0700 (PDT)
X-Received: by 2002:a05:6808:4f51:b0:4d6:9222:99f7 with SMTP id 5614622812f47-553600880d2mr992228b6e.55.1792573791906;
        Wed, 21 Oct 2026 02:09:51 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:51 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/8] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Wed, 21 Oct 2026 02:09:28 -0700
Message-Id: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEiB2GoC/yWM0QqDMAwAf0XyvEDNpuJ+Zewh1mjjoI6mG4L47
 +u2x+O428EkqRhcqx2SvNV0jQXoVIEPHGdBHQsDOWprRw5r90AbdUWf2ALyuePh0vcdNROU6Jl
 k0u03vAHngFG2DPe/sdewiM/fHxzHB6syeWd8AAAA
X-Change-ID: 20261020-10k-sdio-crash-a37ab499725f
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=2814;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=y3stYXDvP4O7TcU01G6DJq426Gkq4u9WW481UMbgOaw=;
 b=BaCSn0O1b365N5SOMHIn6Bh6B658hO4GH0DBkzlgj8SoAdnaxWhNmkUt3TzqMmXjnJYdbR0XQ
 NOXKIzJPC3rBD7LxN1AIQN6cqQ0sa300M1BhZrll2iguJJB/iXPLJbq
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: v0_MJtP1IvKs_K5wYmgp0_QYpIMlGKCz
X-Proofpoint-GUID: v0_MJtP1IvKs_K5wYmgp0_QYpIMlGKCz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX++Wa0nF/dt7g
 KyG6rOuKTFoAF3DjLotiDYDoMszyig7lCosMVXogLLos2op+zRH9Noek79yU86Kvc1vkpe6Cygx
 3oLvW5tqbzjDGLQWtqc5O7ImSUVjbwQ=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88161 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=I84dKf3nx1YZGivhVUEA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX+dvQ36nKpJG9
 H9a0VRBOaM0sbZ06KZrWDlZbZ4NkP7Y/kVGKAFp/tjuLtUXIes7asSZqtII+LG8fyylGFxvHmsQ
 ceioIJLY/L1B3ruO5RMK0BKq22IRQlfLB4YhsuQMq7tH1ozPkPDml9EVvUoKCWOQdE0w0kKgZjE
 5vqonW8o7zhXuVZwJ7e3r34LcaHObjFmLN/5oOtctUtPHWfWNCUmZ2bOpNbyg8U5k+OfM1mqOP4
 UlSrWhd8nQJobNv16BgR2XtXJEITSIHRW4KCVviI6tXmFagZrXHw0Gu3gBvnJK4rlxvUZphmXVA
 KA2pMyMr3sCznUqIASb2cVc2jN1aJ7GGdbuBOFX4pKM8gmqvcuWRsBIVbF0Wtzl8Y5U1fLeHQ07
 ZwBZP5jLycnU41So5EZHkQ1Ww8ETgXhEco+Vn1GUrJGnBzB9oHy0r7PY4qVznOWGy11eijryQ8v
 7elHa997BSggODCOKow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

To: Kang Yang <kang.yang@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
v2:
- patch 3: also wake wow.wakeup_completed, peer_stats_info_complete and
  wmi.radar_confirm on WEDGED; reinit peer_delete_done before each
  peer delete command.
- patch 5: remove the early-return time_after() branch from the monitor;
  in ath10k_reconfig_complete(), cancel the monitor with
  cancel_delayed_work_sync() before clearing fail_cont_count and
  pending_recovery.
- add SDIO Test-on tag.

---
Kang Yang (8):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: bound recovery time before entering WEDGED
      wifi: ath10k: check the recovery deadline on its own timeline
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures

 drivers/net/wireless/ath/ath10k/core.c | 129 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/core.h |  13 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |   9 ++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 5 files changed, 130 insertions(+), 56 deletions(-)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261020-10k-sdio-crash-a37ab499725f

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>

