Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249543F4C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344568; cv=none; b=nlclRjfHgjcFCCDi0pPl1CMr8Ja9djb/nctaIAkNzlDstEYEUlDnmBevptmBKl/Ti1E2UXXPgyqAp5HXMIl2mTDmplPQoGUeeUY7Hywml/CdE/fEXFR0rO45pfbAJ2w3Bi4bvUHswHVDDKG5kWb/g3kSUVFLiEZp6Eu4gQ6fk4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344568; c=relaxed/simple;
	bh=BcNll7uqnShMrrAxevwiYVbuj6vM2xD3Lt/5hV5HQwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3y7DUOMyfks1VxzWa5tEB/5zKbcTF3uku+PtOm3j1l7GuIU5AfJo26ivdUYC9iSIczhM2MxD/pTbG0GxgDs4mEzOVm0+ad3B3nhlHvF89FszybVkuhqDuDYJEugx1IK56t5kh+LzoTVx5jQthmHsL2i9EXu7+SFJV/QvuL6v7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIPsfISF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRlad6dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIPsfISF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRlad6dj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NPeh1839256
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS9VagWr2gKFKf7C+3tEny1uFJ+D8/QGk5rTqi15QCY=; b=QIPsfISFvjulDOtF
	iCVu4TfH0n0mFBJENyPULNUNTlxbfi25SagGyhS7dWpVsm4obBMaKbLR7Mi2zmMn
	8GfIqLP2yPFLLOSmkMKrzNa+csXcxhsvqIgoDH+eEdp7euqdJH/CAQLiTU/spMJZ
	sm4ZvJILyA+s5UKvFHpbp2AHB8e0ZimUImdeAMFg3mS12Jv7SirzW/thZDmdRmSE
	gD98rzAjOV7svN9Tv+Bd9ajRgp7E/0vP3oY07m0OCtpW9huuqctJgXNP6NVAE76Z
	mVUZg30ZeBLjJEmogrrNC8APVRSSQ/cBSBBDu6Q6WLeeloDG/Xuxn/9xxQPkD+ec
	O0mFuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx1fxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:22:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so182085a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344559; x=1788949359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pS9VagWr2gKFKf7C+3tEny1uFJ+D8/QGk5rTqi15QCY=;
        b=hRlad6djonHetYmyN7tz4S75jMSSI2vjphTfRhBQ/8BI01M3HU8vbbOBWOCXhInk8p
         z2PHkfrgQyGFz9F4QZ7XjKPOJKNN87TjKuan3Gq9QRU+XmVfLGW40zK7inpiCM8MYvLR
         dq6G3Oi++kYPUyMv4szhX0dzoYPGZ6wLaZj1u4GYgJVqFoewLVm2RkaDbOekAOOLEtOY
         o9qr5hij+PHHq1Uo05Wfob7lo2Ik3QyfAh3iPJrYOX+tfc7y2aIkfi1KiefA1Naj1NSp
         wVfdY9uNg1fHchbCdAQg/xA2znhWtuvHaz0EBXNTXVZby1fW7XBf2Mf9j8JkyCRTdnux
         kpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344559; x=1788949359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pS9VagWr2gKFKf7C+3tEny1uFJ+D8/QGk5rTqi15QCY=;
        b=LmWBUjhBarrenYtmzzAzCzV/Gx1TRxSlmtoCwvlrJSVEah/luLpnxbPysOV1ZgYHvQ
         RnfmvYO/j1ip5cQPX4ZgKprt3aFD++eG0lEBS3qWIzyRG2oHcemvXMNf0s1DzlEmxopm
         IRxK1U/Lh0n8tcJkdwcsziC+dc5AneoAoVjygrlVZ1mKURcw3OkXwXlY14K/ZtfkTZdp
         X51+fMExgBXdPEf0VlvBpjJwUKeObFS6+qQpA0R27fn/td1NcnswxhiNWzlIgngvOkDQ
         gP3m2AkxpMEyKKBM/+6elqpH+C8etOBcvRKYtZjtYmeVclM2TmEs1HNIcOVEnXCNfdoV
         z4oA==
X-Forwarded-Encrypted: i=1; AKwUvBwFNUAHzimu1lKtL9Aoni1RDtqR7PY4Un+/pxHlEYlkRRCbiuv/upjym38mmKiRi4t2ff/PdSOC/bzJ/wo=@vger.kernel.org
X-Gm-Message-State: AFuF++lhvfc1yxl8BQ7NnkUIX1Yj7nQDc5NoRupglUh0FTUfgd+HDOs8
	BIJoU0+e8q+E6dRFYMgqWudCm7JkzthNF7OxydTQxwyXgZvbAq5HKc7zo1w9XAc3jwg0UDZCZUh
	m+/slcrOphiyIDcyGn4TFewNapkrKwJLxUriL4ZIpy3pkZw8qV0kVDN7VrhhqZgVaBzURGOJMS8
	g=
X-Gm-Gg: AYBFou0k9oA5NUFXNO1WVXt7SvIZAvTQxp6L4OWaz0OJxGnDfxDczSqzmymqwvb2/g1
	cchxaodMoUT8HNPxauimeIoRcfqIeVnLv8lXT0g5qmmo7gw8eL5et3NvSgnHmAa0EZ0/ax2T5hu
	txXaOX3aer5/oM5hWeaXIK6Q0ufrDNfdsGfw4mEmnvlSeOsbjeqjPx68lqCgOlcHjPdJuiw4DLW
	q478RQjnVs/FMCxd4RbdK4WtRJM50f36YjDYigWelwegED/k/BQDrDYKYFwc8NMpKS+fTN4KcPR
	/3SWhScaUM9FI80nOVI1xiSDXGwyrPUgsnvTRRw5Aem+THtCZ9krBpx9R7wzRoZ/+hBgcOOZa6D
	pAZwkEryZQSJ5DeUQNnTVD6X0m/PMhhDFVfXn7bR5rtofwfgEWqdfKTxjQc6nmyEi
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr3343088a91.6.1788344558517;
        Wed, 02 Sep 2026 03:22:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr3343057a91.6.1788344558059;
        Wed, 02 Sep 2026 03:22:38 -0700 (PDT)
Received: from [10.249.8.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccdecdsm1000056a91.2.2026.09.02.03.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:22:37 -0700 (PDT)
Message-ID: <0d642aed-f262-4d59-af18-25aefa29bb76@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:22:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] Bluetooth: Add generic support for vendor HCI
 packets
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
 <20260830-btusb_qcc2072-v2-2-5c0e0c9dd98b@oss.qualcomm.com>
 <CABBYNZLOBVHNvn1=56C-FHc64i5s7SAx3akL5Q3w4oUuekonUw@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CABBYNZLOBVHNvn1=56C-FHc64i5s7SAx3akL5Q3w4oUuekonUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sfQEMhO2RGGrXohgLBNS8Cdq9G3JtoRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX9jEz/NuqV5uU
 xDRP16VZW7oihbYafvh1M65LYBaO0kY2Lu7FCejQfGRwehE1YEFww4sqGWeGhtgnvu0kMLX9VMy
 PliqClJUpapcid4SkKs80iBMu7he0B7iZzYAjubK5sfVjp9m7LYcsCpv9WKJLP7eF596RnOmFLT
 89nYQUW0zblsXg2bzQN6bGmv+WRaCwfbNT61kuopj5/zoALF1L1hSY6nf16sq7VRBDPT4p5PxA7
 nEDlEN/LQ9m3zU+9UkCHsVG7kTSGAqUwXSEeDHDlc0oYYOoYY7UM/Mw5+SUPuG+AV/ckajyZa/H
 rN8/6AH+mfPXdX6tRuud/Rr6yBhmbstT1nn57UQbVIuxJbQhI3pkihVsGEmocmfy9xLHq3Imfr3
 9VWnqWlRZozdLSXFCTgvzApaY93f5wkb5HTn/aaezVnW66YoBuz0ivpaNMSo2IGxnOoneLrliPH
 Uz1iKHSaZcGub4ceK+g==
X-Proofpoint-GUID: sfQEMhO2RGGrXohgLBNS8Cdq9G3JtoRr
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97f8ef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qk3LVkjiMVY3ETDBRFIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX+5+RAM/LNpNy
 TIDF0r8EweLwBr/LNC9qUV7JTvdCst4tTi3WS4jNRHn1pgpYI6g7mNZAVF8RrmPYo9p2asbVEMO
 ZXOebw/iGd7UEAfbh+vgoJiT+UiM9pM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

On 8/31/2026 10:45 PM, Luiz Augusto von Dentz wrote:
>>     Packet type                 BT-HCI indicator   PERI-HCI indicator
>>     -----------------------------------------------------------------
>>     CMD (Host -> Controller)    0x01               0x31
>>     ACL Data (bidirectional)    0x02               0x32
>>     EVENT (Controller -> Host)  0x04               0x34
>>
>> Implement HCI_VENDOR_PKT to generically support vendor HCI packets:
>>
>> - Log them in btmon as they appear on the wire.
>> - Allow userspace to send/receive them over HCI_CHANNEL_USER, gate RX
>>   with the new socket option BT_RECV_VENDOR_PKT, off by default to
>>   avoid regressions for existing applications.
>> - Add hdev->recv_vendor_pkt() to handle them in hci_rx_work().
>> - Add hci_send_vendor_frame() to send an HCI_VENDOR_PKT frame.
> I don't find this one very useful, as btmon already supports handling
> vendor events:
> 
> { 0xff, "Vendor", vendor_evt, 0, false },
> 

This commit actually implements your guidance concluded at 2026-07-20
after discussion:

https://lore.kernel.org/all/CABBYNZL_H2iRAshF-RCX41jbt0jots5i5W=aUUJC_wEN6wzp=w@mail.gmail.com

"I'm fine adding code to the likes of btmon to decode vendor packets, we already have
something similar for Intel although that uses a vendor event not a
vendor packet (both use 0xff, causing the confusion). The user of the
user channel shall be able to read/write starting with 0xff then
decode/encode the next byte as the actual vendor opcode."

Sorry that this patchset comes too late due to refining the last
commit, so it may no longer be top of mind.

vendor_evt() handles HCI_EV_VENDOR, which is very different and
easily distinguished from HCI_VENDOR_PKT, as table below:

+----------------+------------------------+------------------------+
|                | HCI_VENDOR_PKT (0xff)  | HCI_EV_VENDOR (0xff)   |
+----------------+------------------------+------------------------+
| Defined by     | Vendor                 | BT SIG                 |
+----------------+------------------------+------------------------+
| Hierarchy      | Parallel to            | Nested inside          |
|                | HCI_EVENT_PKT(0x04)    | HCI_EVENT_PKT(0x04)    |
+----------------+------------------------+------------------------+
| Direction      | RX and TX              | RX only                |
+----------------+------------------------+------------------------+
| kernel <->     | HCI_VENDOR_PKT, ...    | 0x04, HCI_EV_VENDOR,   |
| userspace      |                        | ...                    |
+----------------+------------------------+------------------------+
| kernel <->     | TX: 22, its payload    | RX: 3, HCI_EV_VENDOR,  |
| monitor        | RX: 23, its payload    | ...                    |
+----------------+------------------------+------------------------+

> This will complicate things because some drivers might label packets
> as vendor while others might inline them as an HCI vendor event. From
> the spec's point of view there is no generic HCI vendor packet, so the
> PERI approach really stands out as a non-compliant solution because it
> uses reserved opcodes.

Vendors sometimes define various HCI_VENDOR_PKTs for their H/W
controller based on their own considerations or requirements, such as
Qualcomm's PERI frames, and BT ACL with vendor-reserved handles, as in
the table below:
+--------+----------+------------------------------------------+
| Vendor | Coredump | Other                                    |
+--------+----------+------------------------------------------+
| QCOM   | 0xEDD    | Enhanced Logging (0xEDC)                 |
+--------+----------+------------------------------------------+
| MTK    | 0xFC6F   | Firmware debug logging (0x05FF, 0x05FE)  |
+--------+----------+------------------------------------------+
| NXP    | 0xFFF    | -                                        |
+--------+----------+------------------------------------------+
These chips have been BT SIG certified and are commercially deployed.

This commit supports them, and also fixes issues similar to what the
commit below fixes for HCI_EV_VENDOR:

0bd606b31d40 ("Bluetooth: hci_event: Introduce handle_ev_vendor()
for HCI_EV_VENDOR")

It is also required infrastructure for supporting Qualcomm's
multi-subsystem chips.

May we address your concern by improving the naming and adding
comments to make each packet type's concept clearer?

May we address your concern by improving the naming and adding
comments to make each packet type's concept clearer in the BlueZ
patchset below:
https://lore.kernel.org/all/20260830-vendor_hci-v2-0-9903760957ab@oss.qualcomm.com

Please take a look when you get a chance, and let me know if you
have any further comments.


