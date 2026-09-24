Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4045D92F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247391; cv=none; b=nAw2Xbf4eDJc/W1HgNx35UBeJyePzcxa1vbaBzYSffhvW7tlGf9NYwVfB925o1DYRMtH/ELANXtIgm0krfPUOO+La6tKmZfCGjVClPLn2pnRHeWQU+nUi/NDWhjJRdxO8JAUxFVrbGkagRpsMmcSREkuRb9En4mcb/yo34ZGBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247391; c=relaxed/simple;
	bh=+oA26JXMk4gqC8b3mcw2uusliRgk5QmM7QxZ7HQlIbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a78u6N0M9IWw9n3MJa+o1m6Vdddb1RpfY8zECtHUfAVMN6yEOmMk5mNE7Tca5uM+bvVj/11Mypi+EY49EcZD7NtEuaSJrjaU3bIkMUDr7ercolBV36+azpR2y6InyWb5udxQEwuAevKE5ILCdEHtqePYdHsh6PjRre863yh8nbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2NXgd87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I72CHSwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2NXgd87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I72CHSwV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1P1w2857989
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=usl+maHzBGMufFm8oUJx8F
	tzy9ukQ3DdNMRf4RF2gf4=; b=G2NXgd87vJ4Fvo/mjUs0rDdgsK05Kpmd2Jofr7
	AanqsaXtJB7BoUgxU04t6UZ2Y8lVWAwXBgIS8HbIisQpPUgi/7GyiM/FZxGOiBZ/
	+uDCOv57hqu0Xr8btXecjD31tvMMJsYHPlBETKITcn9W9kQecjqbBM6xBIuAcYCV
	5wf7uP87sKUDPqZH32two4iqwpiQsPUWMo2SgqBnMvUUrCSlbJzko+DZjuDDaLA5
	JD5XRgOAdmL0mqWPit9QFOfS25KOtS4tOJObqJc+3FU2M75YiXzVjSMiN+5zl7rb
	IduyaZqhNeT/g6NcBZ48XcBp4X2fwUKyhvfusfLca0dPzkRA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag7d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:56:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313c7315becso360497eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790247383; x=1790852183; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=usl+maHzBGMufFm8oUJx8Ftzy9ukQ3DdNMRf4RF2gf4=;
        b=I72CHSwVMhSw5F0sBEMJoHWh5S2R8+ie/B4XaW/iJsdlh3W0egQZl4QHHeXXBga2K9
         pBTqFlWON+jKd9VRblMd3n3wwbxh65yZqjd4MoBxYxopRASIheOxDmiX+k+b2SY/Jf+t
         RUluO7mlwCdmddOSwIlZkmA4hoa1e8fjQyLuS07kUGvnaCfNsKzPZey3TvHg7Pl8FLjk
         wPC5RDCCmglHXqrEA2VGiXrVrixQyH3N4+x6MAz2NCbWvO9QI9Ek0NOcJJvSX54POHJZ
         7Kt8bTGRyhvKMfhXn6oNELmQ7z64x5ryAHvui8rgk4NBpRgpfP0s2Fan5jzgMlil4WgO
         XLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247383; x=1790852183;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=usl+maHzBGMufFm8oUJx8Ftzy9ukQ3DdNMRf4RF2gf4=;
        b=tqv3wX2gTHLfhAx5xvnwxHMa6iToI+2uvcVGnEWbx8AuEafwiDQtndfBc6nlDFcGsu
         8hWup8G+4ZoTbuDOJaNW9yfn/NkughfTyb3br3rO+4X/vrDm0vWIPr2j5lNuEHWMV4N2
         CP5KNk3NLQeDw1pL2HEFT/R8FUgNgQ75XZkfh6f8rL1E2kewJLxRTpvn5zNISgOjDBOF
         qNoef3xdHp6Fc3bMTghujSuTSLNmiOfwKTualfFNTMIfSs190c25oS+L3UoakswryWQ7
         P8s7vHIpmgfMoBY1AGEG2+0IAtfGuO3HGdzmQh2F4ARHy4q3aGH5yVrcUyXwtzZCqmlv
         8qNA==
X-Forwarded-Encrypted: i=1; AKwUvBxPc4KHi6DnxW34+ROrg05d6rs0WsCtS/3UYiERmQy7PYBF0BIxPqbxc2LsN+E4jCjlsg+7C9saLivxNxc=@vger.kernel.org
X-Gm-Message-State: AFuF++lC11u6VYCv94yU7PGaXNsc0FZaxoRidiMZMbFpwwDOSseWsljQ
	ZUI7FBbPBUdVtxziFGwcTcN8wuAIAbvWbsK0vWOjAS/I3eknN7vDCHsP5IQMdwR2SydVVoHCbKH
	VYnhahkv+y6r1QDNegOYcvb/8MxmV2IfHfEPmwNm+5kLTkBB4hPiEnm5Ir+rTcv7B9i5jgGTfLX
	A=
X-Gm-Gg: AYBFou02xoKCwsm17bLoDjzjrn6QaAWWPjIQHpcZ+O2KSJ177uQE+tGRnpxqLblFLHx
	jbun7Nymr5cu9aKh17ve0a8qRLcw3MFlfJ7dtUxHec8N5sQJuY5VmEIeENgZAjOcTa5lcHeYNS9
	B0RbL5A3tQdnegjktubmYz4IF2Gj4ojW+eaDA3n+lT/X0xalb2RnC8O3KotrDJKI6JGvNdAcrm+
	Uzwgg+p+D9Vteut3sUGbH1h1A6Rmh4Y9q3KOpOtFRJkrnG0yUaXGn7cdhZMZ+KKg4MvtjzbuQaB
	rzCZJPzFrz7R4y+WqxMMlNecP2ZOgBt9QpKpEp98mKWJrbFDY+MwM3oCynwySFnpGV+12GvfZvc
	3dXWFyMml/voyIO5fXoWegPtbO+jMx0Of+IRWfEx4wWGImg==
X-Received: by 2002:a05:693c:8214:b0:33e:8552:6e06 with SMTP id 5a478bee46e88-33ffc2773e4mr2784726eec.0.1790247382667;
        Thu, 24 Sep 2026 03:56:22 -0700 (PDT)
X-Received: by 2002:a05:693c:8214:b0:33e:8552:6e06 with SMTP id 5a478bee46e88-33ffc2773e4mr2784686eec.0.1790247381983;
        Thu, 24 Sep 2026 03:56:21 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm27129218eec.18.2026.09.24.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:56:21 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 03:55:59 -0700
Subject: [PATCH bluez] monitor: Fix stack-buffer-overflow in
 packet_hci_scodata()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fix_sco-v1-1-ddca18333914@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL4BtWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3bTMivji5HxdA1NLczNLQ3Pj1FQDJaDqgqJUoBTYpGilpJzS1Cq
 lWIhwcWlSVmpyCcgUpdpaAC/L0e1yAAAA
X-Change-ID: 20260924-fix_sco-059769173ee0
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX2lLxXGTQnI4B
 vuQVt1YWtd47ADKvs82ubYC4JDalmifcDbI8UC1tDczIx4OQNmjLsZCzKnk+/+O4qeGVsdNOaaU
 QKAPpeR/tIf2O2gxsrY5QofNcTMQ6m9zBTy3Jfq36Qj1hU+/xO08zim0BvqiP6RIQa1Hzkgkeh8
 Bl6vIhJMy3Ym3Sipzg+Jzdl/UcmVvcSqb57UKbPXLLxuW1Gn2ZL2SNEhCeWhwEYFwhBB/JwY8jc
 +vQjmx6foJZ803kFseIQNdxQ10MhU0zPd/BMss4+jz+PNNWSR+ae2yM3YDjzH+XMSgxTPDhi91L
 Yu0dOXu8TQ9ebtpSGmbaUjnbbVmlWU0PwJ9pj3mlrn1UCxJHF8nD9rpFo06EHKG6Uh0LdzHg5jw
 jIQEKUioZyMF0fX178q3a+bDrZ6i6lcPJmw7pSAUudme1A9V/RRZ53qdBhtcW9kNDTxpletUmAe
 bJpO+jPjY3Pw6bOe+BQ==
X-Proofpoint-ORIG-GUID: 7cWwOanElO0kpvCmy1t2VhCxb_7NV0Od
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfXxqMT4FilGJmG
 Z3nHF3H8Ds5vRGRaAu/TsEoP25kQ1mCqypH3JEir0B9bFmiJNdNfsLD4lQgEJcoFXD5Uf53kLAs
 NxMBdY8s6nsBNEeX8ZTAWd3uzaYxnpk=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab501d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iXdXf-gDfzWPRTu7-74A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 7cWwOanElO0kpvCmy1t2VhCxb_7NV0Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240045

Fix below handle_str[] OOB by:
- Increase buffer size.
- Use snprintf() instead of sprintf().
Also access SCO header fields after validating header size.

AddressSanitizer: stack-buffer-overflow on address 0x7bd1443dedba at pc 0x7bd1474ced69 bp 0x7ffdb0324880 sp 0x7ffdb0324010
WRITE of size 40 at 0x7bd1443dedba thread T0
    #0 0x7bd1474ced68 in vsprintf ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:1671
    #1 0x7bd1474d0643 in __sprintf_chk ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:1719
    #2 0x5f5c39d02ea7 in sprintf /usr/include/x86_64-linux-gnu/bits/stdio2.h:30
    #3 0x5f5c39d02ea7 in handle_str_append_addr ../monitor/packet.c:14995
    #4 0x5f5c39d58f19 in packet_hci_scodata ../monitor/packet.c:15125
    #5 0x5f5c39d5eaf9 in packet_monitor ../monitor/packet.c:4841
    #6 0x5f5c39cc4094 in data_callback ../monitor/control.c:991
    #7 0x5f5c39e7fa7d in mainloop_run ../src/shared/mainloop.c:104
    #8 0x7bd1474e81d86 in mainloop_run_with_signal ../src/shared/mainloop-notify.c:196
    #9 0x5f5c39cbbb4c in main ../monitor/main.c:315
    #10 0x7bd14662a1c9 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
    #11 0x7bd14662a28a in __libc_start_main_impl ../sysdeps/nptl/libc-start.c:360
    #12 0x5f5c39cbc664 in _start (/usr/bin/btmon+0x2b2664) (BuildId: 370a6386c9fceae18f9a456c0c029ac378b0b070)

Fixes: 611f84a0ff0e ("monitor: Annotate ACL/SCO/ISO data with device address")
---
 monitor/packet.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/monitor/packet.c b/monitor/packet.c
index fc280fef8c57..776d4bb833f8 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -14966,48 +14966,54 @@ static void packet_enqueue_tx(struct timeval *tv, uint16_t handle,
 	frame = new0(struct packet_frame, 1);
 	if (tv)
 		memcpy(&frame->tv, tv, sizeof(*tv));
 	frame->num = num;
 	frame->len = len;
 	queue_push_tail(conn->tx_q, frame);
 }
 
-static void handle_str_append_addr(char *handle_str,
+static void handle_str_append_addr(char *handle_str, size_t handle_str_size,
 					struct packet_conn_data *conn)
 {
+	size_t len;
+
 	if (!conn)
 		return;
 
+	len = strlen(handle_str);
+	if (len >= handle_str_size)
+		return;
+
 	switch (conn->dst_type) {
 	case 0x00:
 	case 0x02:
 		if (conn->dst_oui) {
-			sprintf(handle_str + strlen(handle_str),
+			snprintf(handle_str + len, handle_str_size - len,
 				" [%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X (%.16s)]",
 				conn->dst[5], conn->dst[4], conn->dst[3],
 				conn->dst[2], conn->dst[1], conn->dst[0],
 				conn->dst_oui);
 			return;
 		}
 		break;
 	case 0x01:
 	case 0x03:
 		if (conn->dst_rtype) {
-			sprintf(handle_str + strlen(handle_str),
+			snprintf(handle_str + len, handle_str_size - len,
 				" [%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X (%.16s)]",
 				conn->dst[5], conn->dst[4], conn->dst[3],
 				conn->dst[2], conn->dst[1], conn->dst[0],
 				conn->dst_rtype);
 			return;
 		}
 		break;
 	}
 
-	sprintf(handle_str + strlen(handle_str),
+	snprintf(handle_str + len, handle_str_size - len,
 			" [%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X]",
 			conn->dst[5], conn->dst[4], conn->dst[3],
 			conn->dst[2], conn->dst[1], conn->dst[0]);
 }
 
 void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 				bool in, const void *data, uint16_t size)
 {
@@ -15041,22 +15047,22 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	data += HCI_ACL_HDR_SIZE;
 	size -= HCI_ACL_HDR_SIZE;
 
 	conn = packet_get_conn_data(handle);
 	if (conn && conn->type == 0x01 && index_list[index].le.total)
 		pool = &index_list[index].le;
 
 	if (!in && pool && pool->total)
-		sprintf(handle_str, "Handle %d [%u/%u]", acl_handle(handle),
+		snprintf(handle_str, sizeof(handle_str), "Handle %d [%u/%u]", acl_handle(handle),
 				++pool->tx, pool->total);
 	else
-		sprintf(handle_str, "Handle %d", acl_handle(handle));
+		snprintf(handle_str, sizeof(handle_str), "Handle %d", acl_handle(handle));
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, dlen);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "ACL");
 
@@ -15083,20 +15089,20 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 
 	packet_set_context(NULL, 0);
 }
 
 void packet_hci_scodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 				bool in, const void *data, uint16_t size)
 {
 	const hci_sco_hdr *hdr = data;
-	uint16_t handle = le16_to_cpu(hdr->handle);
-	uint8_t flags = acl_flags(handle);
+	uint16_t handle;
+	uint8_t flags;
 	char label[8];
-	char handle_str[42], extra_str[32];
+	char handle_str[64], extra_str[32];
 	struct packet_conn_data *conn;
 
 	if (index >= MAX_INDEX) {
 		print_field("Invalid index (%d).", index);
 		return;
 	}
 
 	index_list[index].frame++;
@@ -15107,27 +15113,30 @@ void packet_hci_scodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 				"Malformed SCO Data RX packet", NULL, NULL);
 		else
 			print_packet(tv, cred, '*', index, NULL, COLOR_ERROR,
 				"Malformed SCO Data TX packet", NULL, NULL);
 		packet_hexdump(data, size);
 		return;
 	}
 
+	handle = le16_to_cpu(hdr->handle);
+	flags = acl_flags(handle);
+
 	data += HCI_SCO_HDR_SIZE;
 	size -= HCI_SCO_HDR_SIZE;
 	conn = packet_get_conn_data(handle);
 
 	if (index_list[index].sco.total && !in)
-		sprintf(handle_str, "Handle %d [%u/%u]", acl_handle(handle),
+		snprintf(handle_str, sizeof(handle_str), "Handle %d [%u/%u]", acl_handle(handle),
 			index_list[index].sco.total, index_list[index].sco.tx);
 	else
-		sprintf(handle_str, "Handle %d", acl_handle(handle));
+		snprintf(handle_str, sizeof(handle_str), "Handle %d", acl_handle(handle));
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, hdr->dlen);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "SCO");
 
@@ -15222,22 +15231,22 @@ void packet_hci_isodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	}
 
 	conn = packet_get_conn_data(handle);
 
 	if (in && have_hdr && conn)
 		packet_loss_add(&conn->rx_loss, sn, sflags);
 
 	if (!in && pool->total)
-		sprintf(handle_str, "Handle %d [%u/%u]%s",
+		snprintf(handle_str, sizeof(handle_str), "Handle %d [%u/%u]%s",
 			acl_handle(handle), ++pool->tx, pool->total, sn_str);
 	else
-		sprintf(handle_str, "Handle %u%s", acl_handle(handle), sn_str);
+		snprintf(handle_str, sizeof(handle_str), "Handle %u%s", acl_handle(handle), sn_str);
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %u%s%s", flags, dlen, slen_str,
 									ts_str);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "ISO");

---
base-commit: 8b4a4176063831476bc9244d20f43b552e4b5554
change-id: 20260924-fix_sco-059769173ee0

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

