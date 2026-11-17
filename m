Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895743;
	b=Nu/LhOEgr26OGO44mNPC/+CUi1XklJb4Pw2nuYK1SKBVYlvW8beb/gnmNyx8zUXyJVhu
	 2m8zadIyzWtnlv13REcx/mRZ/Z08CsgPgVlPzqys+wmvoBh3oZVOPDs/+ZIBXlcp23YfP
	 4ygdyQ7FeDxEbfpjEtR8gL8U5RXVZuSjsGiQrJFmn5Wuc0yd+NXsfsI+NM04xLHErnt6w
	 mTY/6zNSNL5cvJfTeMEdom22DIYxXrXt8zxXexBx4FVR5MCaD3k8HCNOcxZhkw95tOJNj
	 e5Um6eQIbqpGVm+rQvBS+hXRb31U/TqRaZS9GU5iwjM5IilLCV4dJemKtiMlCedoa1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cNMue6xbGy23ilqKQ60Te5EubCbd3QawU0G2pNpp+7A=;
	b=SidChsE2N4Yek41/xDho86FJpYa6UOgeRrxn3fvl4jyBevebPBQVTJBpr2zobW0O1R9D
	 FfEukOyqiSBv9ndBm41Rx5gjyyfq68kmCKwbQUR6kjk+tocA5PEQJb6YGG9+W6qUBaQdP
	 1ld4PGJxbpCx4dpJsyr9OQQFGhzUdc7NbZJ77PqtBMpEkfVkDLq+EPleoe37/hUHspdXZ
	 Zk6cPDimQJL3+5KFVf2cnqlvUsBOiVNH2N+RVoxzwaoVQUiYxZRuaqarh+w2wcuPKcRZN
	 yHvNAZfueYFbc10bOSqTkjJKDP+bGFttQ7EbvbZEIwRo13ZNDDCNilSC7zLsrlQ7LvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJTAEwNi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA23606A323;
	Tue, 17 Nov 2026 06:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJTAEwNi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aHUL1800725;
	Tue, 17 Nov 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cNMue6xbGy23ilqKQ60Te5EubCbd3QawU0G
	2pNpp+7A=; b=VJTAEwNiChkmHG2nTXNDWNadiWNFa9w+TZRIzZyBqZm7T1LKMkE
	H7bynggTw/bLrmVOmzB+qD+/yHeEiD/nfQOMVwgvfD6nRJbBdmCtf2ampfzlv26d
	qcCqZeZc5hiPJv7JQXkfqyRsotSEabb9EmA5BsdsL0HccjSHXkVQR0SCOe8fh9VQ
	hiI0YPHGr1dppm8Uia8RTBaRbve6f/v2X8ID4yglFZMPMRS2JnI2vRYqQBvtrQHW
	m3sJqRMD+6J5ry54MVDdr+o5oYNOXPmf3O6+8HDxD2QSE3qRfEe5Tx/T/2+AZaCV
	XYHsBS9SA5Ah08gq3+lObJ2FXiWYnpiT+ag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3c10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH68phu4110080;
	Tue, 17 Nov 2026 06:08:51 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-subashab-lv.qualcomm.com [10.81.24.15])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AH68o5l4110074
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:08:50 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 212624)
	id 32BBEAC6; Mon, 16 Nov 2026 22:08:50 -0800 (PST)
From: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
To: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Subject: [PATCH net v5 0/5] net: qualcomm: rmnet: Update MTU handling during format changes
Date: Mon, 16 Nov 2026 22:07:33 -0800
Message-Id: <20261117060737.2764327-1-subash.a.kasiviswanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6pyTMBKXrJUGIhTz1KfEwTYRodJakIEN
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbef73 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sI8cD-XPKVeWbmYhKXAA:9
X-Proofpoint-ORIG-GUID: 6pyTMBKXrJUGIhTz1KfEwTYRodJakIEN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfXyCRiqtQidTGi
 +6qlbfthgVw1mDDDJYDB34Q0nYAA74eEPSN4hy1hO34ten5DuHyukvoSvywpBdHMpTuK9CS2UTT
 Unp2Xo/6w6/cBumHY6ZgOffh2Di2Bas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNCBTYWx0ZWRfX7sN7Q7F/8NLQ
 Yo1b3K+I07qu59rf7pMwT8b3bDoG0k6t89YTZAsxb1qn/RJYF5RDo7aIOOLnWsVf3J9O51F4bJZ
 nkgyDqQFcmHMlaHbs08XzLRX33cXiY1z10h1SkhIM+r5mqpLYpgHetzIbXAGORV2kOqs/PKR1WT
 qywRyIjZQAP3EdchWlhxnbjd1beSRRc+S3CMQISRhaxwgviMpHkLWwSSpeoXH1LNnNbyyKhgBCy
 tck7IMFst5sUhjpCsXo0Rs6YBea6mFskQO1+FABtQJnJVgWN9VRPI1Yuqu0nT/49bvb00M97Buo
 uy+9QrJfELkKcnWN2dWUTWDwmqZI3S91PAcqPOGBy0hBqw/aHHZgWorqt3LvIIdPAkOwKasxxo4
 dypF3Ub6TI9NskjMNVIAMKF4bIEd8zhJtQt1lBdSgMypF8nZy2luC2kqJU4Zl0m5rE6oCQH62Xz
 h/C7h6e3H019tz5zeoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170024

This patch series addresses the code review comments raised by Sashiko
as part of the rmnet coalescing series. Changes were tested on QEMU only
and not on real hardware.

rmnet derives the MTU of its devices from the real device MTU minus the
headroom needed by the egress data format. Several problems exist in how
this is handled when the data format is set or changed, which can leave
a rmnet device with an MTU larger than the real device can carry, fail
creation of the first device, or leave a failed request half applied.

Patch 1 accounts for the V5 egress checksum header in the headroom, so
devices using V5 checksum offload no longer get an MTU that is too
large.
Patch 2 applies IFLA_RMNET_FLAGS before sizing the first device in
rmnet newlink, so the MTU matches the data format which is actually
used.
Patch 3 fixes the unsigned underflow when the real device MTU is below
the headroom and clamps the computed MTU to RMNET_MAX_PACKET_SIZE so
that a jumbo real device no longer makes the creation of the first
device fail.
Patch 4 computes the new data format locally and publishes the format
and any mux id change only after the MTUs have been updated, so the
data path never sees a format whose headers do not fit the MTUs. rmnet
newlink now also resizes existing devices and the real error is returned
instead of -1.
Patch 5 resizes endpoints with dev_set_mtu() so that MTU notifiers and
link notifications run, and restores the endpoints already resized when
a later one fails.

v5: v4 fixed all of these in a single patch. It was too large to review
comfortably, so this version splits it into a five patch series. The
resulting code is identical to v4 and there are no functional changes.
v4: https://lore.kernel.org/all/20261108075727.2031331-1-subash.a.kasiviswanathan@oss.qualcomm.com/
v3: https://lore.kernel.org/all/20261009084351.317632-2-subash.a.kasiviswanathan@oss.qualcomm.com/
v2: https://lore.kernel.org/all/20261008005543.2630828-2-subash.a.kasiviswanathan@oss.qualcomm.com/

Assisted-by: LLM

Subash Abhinov Kasiviswanathan (5):
  net: qualcomm: rmnet: Account for V5 checksum header in headroom
  net: qualcomm: rmnet: Size the first device from the requested data
    format
  net: qualcomm: rmnet: Fix MTU underflow and clamp to the maximum
    packet size
  net: qualcomm: rmnet: Publish data format and mux_id only after the
    MTU update
  net: qualcomm: rmnet: Resize endpoints with dev_set_mtu() and restore
    on failure

 .../ethernet/qualcomm/rmnet/rmnet_config.c    |  77 +++++++-----
 .../ethernet/qualcomm/rmnet/rmnet_config.h    |   1 +
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 110 +++++++++++++-----
 .../net/ethernet/qualcomm/rmnet/rmnet_vnd.h   |   4 +-
 4 files changed, 133 insertions(+), 59 deletions(-)

-- 
2.34.1

