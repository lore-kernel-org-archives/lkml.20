Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649136194D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113616; cv=none; b=VnwMG7UyATHm2BMKk2UAWbEEn5W2qeUsLRtz6ZXD1NNeGr0D7gpXZGO41jkDNdQaWzaBogsvM4gJrseuLK0kQPy09uitj2v0rZtj50lnStmto+J7h9RwEVS/wNxlMnzPjS1ncskbhI2343guQ79pGCFDK+Kw4oxDzRpUh/nuEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113616; c=relaxed/simple;
	bh=FeX+5SSAOfbaQ58usKljVzvtDRwIa0YCMI07fyqDuvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taFs4sP+OBrLl6PtZc0KV7urPXbYdFqojtXFznhH8IQMSW2VdIIEtQMqqtJ/my0Z0kNymy9NeGTv8wF+s9C4xbkri4zc4Ey6O1aGTph0H3z5pKTsQ8x+iL8B5IdBNQwkNFZ1ihyElm2mxxCNefrxwktt0whT84RM7QvlfXPnsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqQ6ivH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVWYHXIV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqQ6ivH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVWYHXIV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kffh3844952
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=; b=AqQ6ivH44k+mMpQg
	thmXNXeQ/tO18Bz9GZ+d0c5SgWylE5GF2ZdEJQVQ802Q0BbujSezYT8OhthgEFsY
	xdPXusVYC4lAGttUVDIqWNTGjl9x3GQS/rEJUvzoIJQ+z0qPGZlbb6l3bpUVoygA
	8Iil3wNrMQiBjQMf0U/YTdxmxstFWoLeEDusxJXuDi3DJDRwP5c4PC7KeO6mp1yJ
	V7oV3xl5wL33gieB5XxR/i5duriP306aAm5Cz2lCzSiSKQMllOE9tQLAdoI1Gpvp
	jfeRUdicyLYaJ/z0ZIXf8m+K3oHwUwFgLhexaV2WFDTENFKMR4gAiT6ThoDs9DKK
	i2fIMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41ta4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-394f8176688so152896a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113612; x=1789718412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=;
        b=bVWYHXIVvsVm8Q64C9uptfJE7Y0LXaffafCzDBwHglXgq0I1yb+BskCUS0qyZznz9q
         Vl19iCUq0KmwMsEoBo0HhYuivuDHvP+/ntN0KnMAdvJB1jxAg+Molos1XTU8X7UJQ8wr
         SpittGSnMSf70z9jH+6u6Ger312qQyBgrk+ewlcxmcgvv7Mflb7PzGSlyJiFcfqe+/s9
         vjnpofL52l96R2wrPC1xDO0zDhW2jzbDungcw3N+7VeaN9wY6sgnWa9upFGa0j0focuh
         iHPtm2akEihAU5/rBjOt9KVIqxP8747Hd8hvz3RlZKTI1Bkr/s4azgpcYD0Hs69ko+wB
         mDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113612; x=1789718412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=;
        b=j5QdfybLIaITFM5tWg6XC8ZYav+KESnyCWtU8Ca/qlJR+qNxs9E+MvqEs1whAQpmIV
         VXcfCdiV+YYh2qVj9gyRoZGtORJLdxjmso4FjPYNLQjOJizXEsbTmS1LSLAys8PabgyS
         H7+DxP8KrB2WeMrTQFK5LurcV6ex6oEMfWvx5anXkGWb4yMInq3+DLqNzn08Qwqkbzv7
         41YcjNbTS7+S9PUsiTzy0inRQnpastrTSiDfPxRmVIkemslSCi8W9NTCIPFMAwWIfEHu
         /lBB0YPK6YCwr8cCGSbH6HnDbTRQWCD3s3AHBXDX43Qs3nQIYpM7qy9Ad5Q2ZnVBfAjV
         Q1AA==
X-Forwarded-Encrypted: i=1; AKwUvBzRs21bgk2DzM7+elYWL/RN6yLzEvuf+sliJmd7yLM0izpd9fn06Y4EHgOBJjf4TDhrX/M87vT9b0trtAc=@vger.kernel.org
X-Gm-Message-State: AFuF++lb2r8e6a0vP53sNrWtl1D7g87+DEyInMJx+XM2HKbj12qTUGA3
	lUCddG3UuRqlj6xL3E5rJ/rLe6AgEvJbHk4YoDoQPZQhWcn1O8vGQL07HGNAcDvlRrv10aT+Tgu
	ruk0vZa+jYU+PAOaeIkgzQ8RaPUAEt8kM6xMKWMawAYFWzXunX/YZzFIgALrM0POkzEE=
X-Gm-Gg: AYBFou3vQ2Ktb5FbOWeQWvU9lFHQ4AkFNWPW3n/oUDZyuBnifVDDBhbBtQzWmWxidBA
	iaZzAqVoBZN2TtgV9GUlmiPlTBxtF/tysnjhGaQkLXZMeIDsXFHcu6FJrMNlpMM+Fut3N28Zo9Z
	4+Z7mP2TIF/zzKJTdBldX+HkJjkO1dUS+2w/LywkkhGuFlqUGPvK1CzKMGXbiq4xWYHIno+ujTV
	RBlPrRgd3Rqo/qVbebphVCF93Vzd3FlAnOoW8tqY5mb7oEXjzQObel3QccWm8nzIx2uGUtAU0Ah
	m5p+ZeA4KFJJ1xoWDvhsakTvfEbFfZ8IYtnI6kad4IA2r1VqhYeDWeld4f4S4nxH3Xe8d5zthR7
	Qlt4bfIQkNZZiMFo4P+7baSSSW66BvIikk03teeteH6Bloyc=
X-Received: by 2002:a17:90b:52c6:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-39d9bbf2f0emr3518869a91.1.1789113612169;
        Fri, 11 Sep 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a17:90b:52c6:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-39d9bbf2f0emr3518823a91.1.1789113611521;
        Fri, 11 Sep 2026 01:00:11 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4422328eec.1.2026.09.11.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:00:10 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 01:00:01 -0700
Subject: [PATCH v5 1/4] Bluetooth: btusb: Add recv_intr() hook to
 btusb_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-btusb_qcc2072-v5-1-422754f4e938@oss.qualcomm.com>
References: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
In-Reply-To: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: If-WUIPevHCYBia5bjcdmb_pK1hRezed
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfXzsuB5vDhIfis
 KJPmapshP861rqeHUpG9lpH8iwYszc7a/1BoOsHKZ2LYC94Xwh1c/gaeLfFThAh6IpKrKPSbWr0
 zrlFpul9jpxnEKUS1YgjdazX7XLDXk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX2bKYpBsfE25x
 JH/waaFMo7eN6Y3On6Q/u5YTimG7x4KhAKU0/4cgUvzfBdMnIf2s3SAt28JJxb38YdNMLMhj4FS
 fh+IcihKDBGEo8Klw+pQZeRUNTb4XdeFuTvqZBhRQF6Ctd7H0RLgQFe91OABrFnTiV7ZToAvpcA
 l/ky2EUgVcmsnDUbZxc48vymMJvKGPbKdSqk38AhK28XesD87o/Cjw0k1HljbflY3gukLnVizW9
 aK7d0L1GQTB6LdKijpfNuvUtCBM3hMigznAKbDo4X1KecU47t46E6Jot14VF3MsM6/hXXa9fxjP
 JtvCq+dmm+U1uY2IOPrp4cFUF6moc1K2jmYf3lNCQMQiwO4n8boEmiKYD0+ES5v6kHq4A472Kbb
 CNpspZFcE+czhlcdOX9kEVv/OAobxbDPXlgRWHDxSK/iNysrlb7mcFLM7DP1OC09d/irYsc9OTt
 yuRA6yuUzLjd7YE/eYA==
X-Proofpoint-ORIG-GUID: If-WUIPevHCYBia5bjcdmb_pK1hRezed
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3b50d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I7BhAMs4-vxSTl9LnVYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110110

To allow a vendor driver to assemble and handle its non-BT frames
from the interrupt endpoint.

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 83d122de5d7d..5efcf31e432b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1067,16 +1067,17 @@ struct btusb_data {
 	unsigned int air_mode;
 	bool usb_alt6_packet_flow;
 	int isoc_altsetting;
 	int suspend_count;
 	const struct usb_device_id *match_id;
 
 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
 	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_intr)(struct btusb_data *data, void *buffer, int count);
 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
 
 	int (*setup_on_usb)(struct hci_dev *hdev);
 
 	int (*suspend)(struct hci_dev *hdev);
 	int (*resume)(struct hci_dev *hdev);
 	int (*disconnect)(struct hci_dev *hdev);
 
@@ -1577,17 +1578,17 @@ static void btusb_intr_complete(struct urb *urb)
 	       urb->actual_length);
 
 	if (!test_bit(HCI_RUNNING, &hdev->flags))
 		return;
 
 	if (urb->status == 0) {
 		hdev->stat.byte_rx += urb->actual_length;
 
-		if (btusb_recv_intr(data, urb->transfer_buffer,
+		if (data->recv_intr(data, urb->transfer_buffer,
 				    urb->actual_length) < 0) {
 			bt_dev_err(hdev, "corrupted event packet");
 			hdev->stat.err_rx++;
 		}
 	} else if (urb->status == -ENOENT) {
 		/* Avoid suspend failed when usb_kill_urb */
 		return;
 	}
@@ -2846,17 +2847,17 @@ static int btusb_recv_bulk_intel(struct btusb_data *data, void *buffer,
 	 * same way as the ones received from the interrupt endpoint.
 	 *
 	 * In H:4 mode there is no interrupt endpoint and every frame on the
 	 * bulk endpoint carries an H:4 header, including the ones sent by the
 	 * bootloader, so the regular decoding applies.
 	 */
 	if (data->proto == BTUSB_PROTO_LEGACY &&
 	    btintel_test_flag(hdev, INTEL_BOOTLOADER))
-		return btusb_recv_intr(data, buffer, count);
+		return data->recv_intr(data, buffer, count);
 
 	return btusb_recv_bulk(data, buffer, count);
 }
 
 static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct urb *urb;
 
@@ -4387,16 +4388,17 @@ static int btusb_probe(struct usb_interface *intf,
 	init_usb_anchor(&data->intr_anchor);
 	init_usb_anchor(&data->bulk_anchor);
 	init_usb_anchor(&data->isoc_anchor);
 	init_usb_anchor(&data->diag_anchor);
 	init_usb_anchor(&data->ctrl_anchor);
 	spin_lock_init(&data->rxlock);
 
 	data->recv_event = hci_recv_frame;
+	data->recv_intr = btusb_recv_intr;
 	data->recv_bulk = btusb_recv_bulk;
 
 	if (id->driver_info & BTUSB_INTEL_COMBINED) {
 		/* Allocate extra space for Intel device */
 		priv_size += sizeof(struct btintel_data);
 
 		/* Override the rx handlers */
 		data->recv_event = btintel_recv_event;

-- 
2.34.1

