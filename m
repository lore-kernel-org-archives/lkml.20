Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE387353A98
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113614; cv=none; b=VdWogo77I900ogw/txdsuBn6Twc6DH4ubeAhq++Z86SV4eEQfmTYkPybxF+8YDznT+hsVZezBEDfXFp/fzL9uweLWqGbhE5lfiP4eHHugfr8xKxdrP8HxBHsrpLKw9ItuEEWw4vKJK9DPJipf5HkImLhrpjKt7dt3mxMpy7SoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113614; c=relaxed/simple;
	bh=EwPXUXC2fxq0JNrsRaQREfqrrUxJtknUPG9TiMgkmXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ooqt17N2bHNPfF9yMZ6rLejfby3ybfi9l4F6NkupLGlUZAKS5TEetRDjijLpmNFY/w2LYNvQ7Klnyks+nw378GenUA71TVuhClvE6Oa4qSJ1uVPz1aKkCgmS5vnuX4KuMlZNTSL28DNEWnRBk05xzammk3T+gzfZALSeWHrZlkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxya2oAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B58b2dnT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxya2oAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B58b2dnT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kquu2311530
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wd7TRScq0brNDLdWzIpBoW
	yob9b2z27qxmbTlJFvVOM=; b=lxya2oAWAMwb9IGqhVCpGl5YotZ6dbj5JJWVQ9
	6C8uRwnOgK3EDUoVdfIA3U0LvcNJSZSQk9iUWMgzKPulRE459dhNiuP0ufcZM+wt
	xi9N29bgMiq8fx+cNvVqADbM80Sid/oEaC3CsWQi+W083232Jg+jWKERAxnBWaAI
	MxXi0U4BokpyqW98nAvU32AFw7HN8I40dllA+i/JLnuGaUdQDRMIm6xCM7XsBTvC
	Qze1Enfxc2F4q63MyVIojs8P+9iZVTKHtzXWia3mjIqeJqVvq18ciJ+KvHlaJ/6G
	T0TQVc/UXNfwR50lFeyy9D3fs88lP9RDJ6PUN+06EC1zum3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchcpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-394f8176688so152892a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113611; x=1789718411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wd7TRScq0brNDLdWzIpBoWyob9b2z27qxmbTlJFvVOM=;
        b=B58b2dnTf7Nk08tRQrlE51p892GdnuE7FA34y+h3O151jMJtzHJ8E11ItkOZyWg6xk
         0+p9JNDBgOriovc9yV2QA9Qifdj7f3/7o+51AY/+/umj0i7WN1ZnpXaUjjWz0ByDTtxa
         kYv6oI9uxTB9rHIDtElPYOVD1CWP11swAV/svOdkQEnzSWp0Rnnq+DZRd1bDfXelkeV1
         5zI01OMwqWQH1Lpj7cdyPXm5z5Peh0zVzMUtUyRx5OsMd17olWHfNyNaqlxHCm1Jspo9
         oG/0kLX/QpFqFhs5MZ8mpIf8pJKP2r6aFbaY8QFSj0UiaDnaJrM2gs/kXHJ7VT98mzCb
         cEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113611; x=1789718411;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wd7TRScq0brNDLdWzIpBoWyob9b2z27qxmbTlJFvVOM=;
        b=oB4axQN1N0NzHuAdQ6vjdZ9UPJpm9LlHfzMksaW/5gzhRmwHRKlIrRRC4BKEgUnyDD
         wu5KrQZKZ0c5Dh0/oCzOXvTo+uCdNMxejj6cxG3T1MH7oofgdC1LwmOzOErukRKiscci
         ZeRhegJchu58VqhoVF8/Ie6+5OojrAgqVTbQqYWUsZm9BQYfZQ65Ewy/hkZRZJumGVKd
         roSRFJGpmknMmfrH1zaNzAgjx3nEiJ2FUOLS1CQzg3CnHwHu5ow1/gEixq1cMmWUB/08
         mEaLeJ1QksE1epgk9H9aw0UbCPuDnOYqZ8/kLH4i18t31c2qN97oysHMswZLnKseUY3U
         ESRw==
X-Forwarded-Encrypted: i=1; AKwUvByPl9tuStXKdDI1lLR9Q/4IxyXO2OCdqWmQMIXAH4is2JHMgoDFyXNXmlMhMVrcfGicUqjq5dhe2kNQ63c=@vger.kernel.org
X-Gm-Message-State: AFuF++nWlFywvXLenyI2f9xDxRdAgvlpaWIDV7wB9CWfergsgmx/vgKA
	ZEeKtxTWNKW4mVr97coLmLxT47ZfBboiSBNUEsJiC5lrUPCFTLiw7i7FTL/QE1CStxMmMcXbban
	/TkCu/ERkV4BGQ7EoKfVDvPOfcaJpuo52q3hTDs6nXGK9jtCmRSNY17QqNqArVDKMsv4=
X-Gm-Gg: AYBFou0HkiAV/WFZw2SI9tslTzPRwHhLoZRFHYfqFeV3LA8alNyaqwM8HeEiXVvlFhi
	VFPHsfQyWcVb8n5dbbXh6XTxjQnbHemwt2DVZDNJpYKZGoZHKPdn2cF8kUDLWCn817G4bHNUJ7S
	7p28xdlon9Vqtuj2G9laHevDGiTFyjZd5wYJFgRbZhg2PvTS1wZmcGF7ih3NzEMeZ0BJ4N5w+8F
	/GSMThqvTZGQZoXF0YcgKUa3Rd112XXKoCHGKYGKI17o/lktbuoR3sGlV+Nj0lsEN10NVV9LvKZ
	fCZwXVljfvhDKk/eJQmaeo+tU+PXoU0oVDEs+RkvLcUfDrbQB49PBLObpErFka3RdCWA4gk4Vi6
	YMms6oQOw2CzUmpKdU2hWJt0DCO7p8VwIny/y+lMQYaLMddw=
X-Received: by 2002:a17:90b:3904:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-39d9c392a75mr3323418a91.4.1789113610997;
        Fri, 11 Sep 2026 01:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-39d9c392a75mr3323377a91.4.1789113610507;
        Fri, 11 Sep 2026 01:00:10 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4422328eec.1.2026.09.11.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:00:09 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem
 QCC2072
Date: Fri, 11 Sep 2026 01:00:00 -0700
Message-Id: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAC1o2oC/3WNyw6CMBREf4XctSW16UNd+R+GmLZcpEap9ALRE
 P7dgms3k5xk5swMhCkgwamYIeEUKMQug9oV4Fvb3ZCFOjMILjQ/7jlzw0ju2nsvuBHM2FprhVJ
 pbiFvXgmb8N58l+rHNLo7+mGVrI020BDTZzuc5Nr7554k4wzNoeHSGW0UniNR2Y/24ePzWeaAa
 lmWL1WahCbDAAAA
X-Change-ID: 20260910-btusb_qcc2072-7ad665e4560a
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3b50b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=JizU6EzbmIgXdcvBHewA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX+1cZy3DaKAfb
 oGCtOp9ViwJIWhOmYB8Sjpfre8ljIr6akvgYo5ENxOpFznmIYeu39J0LgX36zI/CjUiKU5Qg5Bm
 lgkHa9bAwHFg2qlziy3X/fdElToFYtzRBFKKFi4CyHYvo0eR5k0jRaeU4Ew7wWUL77MlLNp1GIH
 Q7I/GoRGKNl/LZuDy6uOlCy/ozmxnZXaE2ylbXIJLqaSBqNjlY8WZcF4f4i+X/svGwNtwy3OXRq
 onPU9IQe/0AMuon6naqhsk80RzreB+4wxGnXcq0bUFwMeAIk229ML8fHlIz2wwbpcAH7LiYHr2B
 yWwUcXaIKAqlojp8irQ9FKyoYztotiK1fe+dvSTdbujqKPNiGGC1bs+RPwkpnpB/0IKdVZ5sGRV
 LXb0PU2O4a3//wA35Mu2kzYJ7jJ2MW4Klczu5YRKWfi29lUne9pQn0whWai5YTsDp5JsJuJItmt
 LB1B3OynGRtrRSmyKWQ==
X-Proofpoint-GUID: bE1X7fsBcHbv9bZzBKAyK4Y9fs0UcdYZ
X-Proofpoint-ORIG-GUID: bE1X7fsBcHbv9bZzBKAyK4Y9fs0UcdYZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfXxRLZ3V6IBxiy
 sBSgLkDWnsmXpDvLyQbp+kuGN0g+WuXfYO4J08qeVbV8yzjfczm0nHcqVZU+75Oh1BYiWblyZym
 0WU+Dr8/XitkBby+zjANFWSXpe5/kps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110110

Hi Luiz,

Thanks for the several rounds of review.

This revision has one minor fix plus a few inline comments addressing
false positives from the latest Sashiko review [1].

[1] https://sashiko.dev/#/patchset/20260910-btusb_qcc2072-v4-0-e78f04b7675e%40oss.qualcomm.com

Could you take a look at this new revision when you get a chance, and
let me know if you have any further comments?

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v5:
- Fix status masking in qperi_get_subsys_build_info()
- Add inline comments addressing Sashiko false positives
- Link to v4: https://patch.msgid.link/20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com

Changes in v4:
- Fix memdump timeout blocking btusb_qcom_reset()
- Fix missing build information on driver rebind or resume
- Link to v3: https://patch.msgid.link/20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com

Changes in v3:
- Remove socket option BT_RECV_VENDOR_PKT
- Fix heap overflow in hci_send_vendor_frame()
- Fix a stray NUL byte in the memdump file header
- Fix PM reference leak in btusb_do_reset_work()
- Don't mix goto with scoped_guard() in __qperi_tx_sync_evt()
- Don't mix goto with scoped_guard() in qperi_handle_evt()
- Prepare btusb_qcom for bulk serialization mode support.
- Link to v2: https://patch.msgid.link/20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com

---
Zijun Hu (4):
      Bluetooth: btusb: Add recv_intr() hook to btusb_data
      Bluetooth: Add generic support for vendor packets
      Bluetooth: btusb: Build the driver from multiple source files
      Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072

 drivers/bluetooth/Kconfig                   |   14 +
 drivers/bluetooth/Makefile                  |    3 +
 drivers/bluetooth/{btusb.c => btusb_main.c} |  127 +-
 drivers/bluetooth/btusb_qcom.c              | 4556 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   99 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   45 +
 net/bluetooth/hci_sock.c                    |    8 +
 9 files changed, 4857 insertions(+), 2 deletions(-)
---
base-commit: e40edfa049b967f0b9379bf549c59431302ad181
change-id: 20260910-btusb_qcc2072-7ad665e4560a

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

