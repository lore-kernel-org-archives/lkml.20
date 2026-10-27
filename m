Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102664;
	b=NuZUjbTz3eUqaJ2VYDtpLvZ2+yPOArhwACIzpkwtqcuTO9R7+dQEWUAA14cS2JhM0F4A
	 TuxhwQBAF8ofSrRhYhlW6MIvuJJeIkkOWObrAveXEWmOEgmDsVG/9CQLEdc0JF8m/jDDf
	 M/wXnwaq0G4U3j85VRe7gV81hYdlcnu9SU+teQI+4Z+x/qlVixRPCYPHhpKqdB1lDt5qd
	 +GkMNku27JfKVSIcOm+yKcU1oB9o2F1w1fehAQCCXOJHZ1S690gwdwbbJldAAgg3Bka7R
	 F+g70R5KZ0HfOb9oDPfC7n3xuys3Bs/3/nYap/jZUZIP53ki9ukkBIqrYTHawup79ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+jrgeKDImJ7j+nOsBVkoOY+PsdsAXSqAz66qQoQ3Uss=;
	b=nv5B703Q8dwrWETl1WKIiQ4JxDeB2nMwPYnh9oxPGDpQ7uwKVsj9UXEXxekafG95xQ31
	 gfbamDzP2zGoepIHmfXMj+LLMuy8djLGl0aRdTKW6GtvnvNwj3A6cY+c/Xv4bqnHOdOdF
	 H8nZu/aeeSWRLU+yJhy3Eqamc0zQdvAaxDP541gsCSgdjQjXjytTRIWze0VxNLC6ACPxw
	 KwGZbeC4nEBGOoCGO4mqTVeIAuetug95infkpsFF5dCiLnsiaUmhipz7OIMxCin4Mqb3u
	 9M9P6DeCXF47Ce0imdBOLN6wuO6H6NkcGj+nxqZ4AW9HOzJHAb7ldyLF6EvcgH4uB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0zJoXJg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3x8Euo0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAEE60A260F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAEE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0zJoXJg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3x8Euo0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdw1V2458115
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+jrgeKDImJ7j+nOsBVkoOY
	+PsdsAXSqAz66qQoQ3Uss=; b=J0zJoXJgzDw/0QChgGxZOcWj4WHGHhts6ZBLxz
	zwNDS3xEUUbBf/SlHCMNjdJGAkz8WHQ7SLz3gXpoqBsvv2Js9iG0bp77FKSp7beH
	kGimfT2wfejbCRjcP4dEnchuP43OIwx/0rGXCMiN4DO4/mT0SlTJ/Op9J3mFXD2z
	Zz4MrVWjF5mYHVVZMdXhZ7qqz8GgsCUyjK1EgqT0W8S6s4MKlYguFhfiLEV6APJB
	Mc5olMV5ROLpjtjh8cNb5YHgIxu7ML03s6WgVZj6pOkvZUfQwmlZPNxD6k/75DTI
	DFJa01BMjaxnxi8PYlattvetLX9mcG3GFHMfOTchsNIl1Zrw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta5an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:23 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82328040dcdso1363112a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102662; x=1793707462; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+jrgeKDImJ7j+nOsBVkoOY+PsdsAXSqAz66qQoQ3Uss=;
        b=V3x8Euo05Qcd/szqaNaAdkQus4vFc/1tb4Zw5OVQpEhSV/I1NXaoNAt/KdBTguAyLa
         XQr8a2/NQKOjsfcFpOCW3E5iBl/CN0hiK9odbQFCFpUKW34oqxDMwinitRIDM2HBWIJH
         BV+x+vM3fJbU19z6Cqf6jyuDE/jjNlVKOkKHGI+VluHWhXr1CYswSohrOa5PzEuc21Jf
         mBWZ6paenRB+F10OCqFbgUiPI2wodkyUBOwkrOu6Zc9uURrla9qYMnRhRD9UVEMp9Hxu
         Ih5GUAV4+02EGJ9Zi2t8cNOJc+fPPYGCU+S2nGpTUoE/TR9ljArjtNENks19aGrQyHky
         DRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102662; x=1793707462;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+jrgeKDImJ7j+nOsBVkoOY+PsdsAXSqAz66qQoQ3Uss=;
        b=qWtg2RvgT//a4LJNonOWEUInP2p2NXO7/El2x/jnDVSKOeMWkP9Ud8HS0ICSbq0LYJ
         3ZBxx9VQZb8P3VXqnYx5N80FmLp12UT5WTM+3aHdCpcI5tLebammkaXzD1Ca5UkVJBuZ
         RdiqpYVDzZ84niAXFAd2YhlfU+yLoqIf+H6iMmKIq3evDcjeP9jzi6sKUP5wYQqxFZ9p
         dD1CVKxYVSpKtK98TAa2DECePYZnTlpcBG1FiDdVocfWaTdJPNPE0kxQRUYiybHrOvHc
         79oeOHKBqpTgn4tVjwO1/tiYiZnxVONrY5Z7gOTmGLwzdQRMYqgT9Cl5R3O9IU8GGY9m
         awzg==
X-Forwarded-Encrypted: i=1; AKwUvByXsPzUL4XRU8QaqKkDOpn74ATIUQQXlOVZC1XWAvUU0c53+nUsEjs3X1buqCVDAjbUQQMLFxQeBm5yjQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTpwhtRQaXwoEjYMmMttujy1Zo1mfmSX4gzbzvNEJFY1H3YcET
	3sbS83VjOZFjXvgsoDGIMp9JCOjJQWO/lMRLdWe+Eo51PxkYckIIv+h9+KDlUXUMSueYTwsodkl
	gCAwsB2p+u4lY5G+bLYcYhOiOpRrJKhymmg1mpErQMInLBHqEEVARYQ10RhYl0IDYvW8=
X-Gm-Gg: AYBFou3Ffw9LCfEQgR3DeFWL5CnSuCzMhu/4J6BA8vcJkpI+qWlc7ZHc88Ix6uAcJ90
	lZLzHXMSEt2RTmso9exk0koxm20+46yEYFttzWhsX9U8HCBFOCWCthcBbsDuW031tUBfzDQp99z
	tYIQehwDhvz+vddurPupyoYjrJAGmx6gLM2Vm6ib78JXo01xxN80z7m39yjBz7Fg1TbZTIBByS/
	o9JTq1eoMmjz1Ixu4GOPfXqqY1bW4A1M70O1ArwiuLO/G9GHMxZPgMdH7XiGuwbMP+26h1CGQcw
	sAQn5EhJf7QGTD4X+WhsnyuMQxPMsLXPyxkbSia1gdJKGAWJfJkELg1HAK5VT8OAEliYNZ4VmAV
	ThDsCrfc6iMHPkF8kEliyAUcc/dj+t8xF0zfctK515N8yTQ==
X-Received: by 2002:a05:6820:a285:10b0:6d4:d6ba:c744 with SMTP id 006d021491bc7-70ba084fa09mr6481090eaf.0.1793102662307;
        Tue, 27 Oct 2026 05:04:22 -0700 (PDT)
X-Received: by 2002:a05:6820:a285:10b0:6d4:d6ba:c744 with SMTP id 006d021491bc7-70ba084fa09mr6481048eaf.0.1793102661829;
        Tue, 27 Oct 2026 05:04:21 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e2cd81bsm9088535eaf.14.2026.10.27.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:04:20 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 05:03:54 -0700
Subject: [PATCH bluez v2] monitor: Fix stack-buffer-overflow in
 packet_hci_scodata()
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
Message-Id: <20261027-fix_sco-v2-1-e3835bda5453@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACmT4GoC/2WNyw6CMBBFf4XM2pI+EKwr/8MQA2WUGqDaAaKS/
 rsFl24mufeenFmA0FskOCYLeJwtWTfEIHcJmLYabshsEzNILnOuZcau9nUh4xjf6yLXolCIHCL
 98BinzXSGupvwA+Wvpqm+oxlXywq2lkbn39vHWWz4n3wWTLCmMZU4KKW0yE6OKH1OVWdc36fxQ
 BlC+AIMmmUGvgAAAA==
X-Change-ID: 20260924-fix_sco-059769173ee0
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6FqkQyWsH5Sa
 nLMMD3c490vZeXgto/LcDoVyd/OfS11GEMjKgrZrtuxLWUE8l5RAT/t6MWXr1bXC6vC7wHQKKRg
 /1G97dpQTkuzQJys12cW+9lzezMZUfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX339z0JZbImn2
 sM8pydj7gD1nqm2bFzfJk8ZqjjcVQIZ8dBZYzdAl1dUzeWAWtYXs/W/Na2fPw1NN7QDMU+b9w4p
 x4RyLsSHhsVBO5aWmovKsFazNbvpGJ+J+B9mHqeGVyFXlscRJbaAZ+MZCs1TZTcOafqnkI6iL50
 I4MteVWxx9n5j+SBK/Uf3Xj+o/MRsWAnvkLNQlb/Oln3iK7JpNH9AaTJeSoiHU/5nAXguA2xD5C
 wLi6fUzKVjUMop7i9Jb+UOpaaHWa71gFIB2FG+tfvQ4qqn4br43KItQTMTKbOXuHl6nzeaGBYEb
 tJYcS2UL2GfK5fY5N7a1ESrDWFcbBVm4AvdTTKBbO5NrS2aIUG4EbAaHEK+MT56mYP0QktuuYU2
 BMeEKB0r21ntS19NElsLO8lL+zhyjThRf4xk/y79kGe/dAXYAsceT1WcBftn56lMLJ8caNAKcmj
 crv+oyLXD1RIgY4fvDQ==
X-Proofpoint-ORIG-GUID: aZnYUvMOaVdgoBZdB7pt3q0oYsniPz0c
X-Proofpoint-GUID: aZnYUvMOaVdgoBZdB7pt3q0oYsniPz0c
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae09347 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F965P7fitBUlXVAuXaAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

packet_hci_scodata() defines 'char handle_str[42]', but the combined
format strings require 61 bytes in the worst case, including the
terminating NUL:

"Handle %d [%u/%u]" " [%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X (%.16s)]"
Handle 4095 [255/255] [11:22:33:44:55:66 (0123456789abcdef)]

It calls handle_str_append_addr() to append the string to the array
without validating the remaining size, causing the stack-buffer-overflow
shown by the AddressSanitizer trace below.

Fix by:
- Increase the buffer size to 64.
- Use snprintf() instead of sprintf().

Also validate the SCO header before accessing its fields.

AddressSanitizer: WRITE of size 40 at 0x7bd1443dedba thread T0
    #0 0x7bd1474ced68 in vsprintf
    #1 0x7bd1474d0643 in __sprintf_chk
    #2 0x5f5c39d02ea7 in sprintf
    #3 0x5f5c39d02ea7 in handle_str_append_addr
       ../monitor/packet.c:14995
    #4 0x5f5c39d58f19 in packet_hci_scodata
       ../monitor/packet.c:15125
    #5 0x5f5c39d5eaf9 in packet_monitor
       ../monitor/packet.c:4841
    #6 0x5f5c39cc4094 in data_callback
       ../monitor/control.c:991
    #7 0x5f5c39e7fa7d in mainloop_run
       ../src/shared/mainloop.c:104

Fixes: 611f84a0ff0e ("monitor: Annotate ACL/SCO/ISO data with device address")
Assisted-by: Codex:gpt-5.6-terra
---
Changes in v2:
- Wrap long lines to fit within 80 columns.
- Improve commit message and add Assisted-by tag.
- Link to v1: https://patch.msgid.link/20260924-fix_sco-v1-1-ddca18333914@oss.qualcomm.com
---
 monitor/packet.c | 48 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/monitor/packet.c b/monitor/packet.c
index a301e1ae7326..e2f0073e5a49 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -14968,62 +14968,68 @@ static void packet_enqueue_tx(struct timeval *tv, uint16_t handle,
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
 	const struct bt_hci_acl_hdr *hdr = data;
 	uint16_t handle = le16_to_cpu(hdr->handle);
 	uint16_t dlen = le16_to_cpu(hdr->dlen);
 	uint8_t flags = acl_flags(handle);
 	char label[8];
-	char handle_str[58], extra_str[32];
+	char handle_str[64], extra_str[32];
 	struct packet_conn_data *conn;
 	struct index_buf_pool *pool = &index_list[index].acl;
 
 	if (index >= MAX_INDEX) {
 		print_field("Invalid index (%d).", index);
 		return;
 	}
 
@@ -15043,22 +15049,24 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	data += HCI_ACL_HDR_SIZE;
 	size -= HCI_ACL_HDR_SIZE;
 
 	conn = packet_get_conn_data(handle);
 	if (conn && conn->type == 0x01 && index_list[index].le.total)
 		pool = &index_list[index].le;
 
 	if (!in && pool && pool->total)
-		sprintf(handle_str, "Handle %d [%u/%u]", acl_handle(handle),
+		snprintf(handle_str, sizeof(handle_str),
+				"Handle %d [%u/%u]", acl_handle(handle),
 				++pool->tx, pool->total);
 	else
-		sprintf(handle_str, "Handle %d", acl_handle(handle));
+		snprintf(handle_str, sizeof(handle_str), "Handle %d",
+				acl_handle(handle));
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, dlen);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "ACL");
 
@@ -15085,20 +15093,20 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 
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
@@ -15109,27 +15117,32 @@ void packet_hci_scodata(struct timeval *tv, struct ucred *cred, uint16_t index,
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
+		snprintf(handle_str, sizeof(handle_str),
+				"Handle %d [%u/%u]", acl_handle(handle),
 			index_list[index].sco.total, index_list[index].sco.tx);
 	else
-		sprintf(handle_str, "Handle %d", acl_handle(handle));
+		snprintf(handle_str, sizeof(handle_str), "Handle %d",
+				acl_handle(handle));
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, hdr->dlen);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "SCO");
 
@@ -15224,22 +15237,23 @@ void packet_hci_isodata(struct timeval *tv, struct ucred *cred, uint16_t index,
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
+		snprintf(handle_str, sizeof(handle_str), "Handle %u%s",
+				acl_handle(handle), sn_str);
 
-	handle_str_append_addr(handle_str, conn);
+	handle_str_append_addr(handle_str, sizeof(handle_str), conn);
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %u%s%s", flags, dlen, slen_str,
 									ts_str);
 
 	if (conn)
 		sprintf(label, "%s", conn_type_str(conn->type));
 	else
 		sprintf(label, "ISO");

---
base-commit: b0bf49270d445da0852851f393cd67a0a1e5f05e
change-id: 20260924-fix_sco-059769173ee0

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

