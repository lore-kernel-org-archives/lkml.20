Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC91A6806
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788661691; cv=none; b=Ce95qF9+v016t9G63j4CwSPybPpRQEfdg7handzoWDUIYYfIatw6sbQSFz0e/PkTpYmM21hENkuk4uKw35IdzZ7ntKswvOPMmJFCW6upIYJJLC09ZEJo8UmAEXe9YLt5j3HrijWE5cKN+aeoFN24BSYo1YsWYsv5A/aHLIZ58Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788661691; c=relaxed/simple;
	bh=KIX+FMSc4EqvFxwWqDIPCmwQTsKl7G0c2A+48ntvwkM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CFl87tGf3dBmEp2HEJ9ehrSFpRotR9ybh6Vl5MBzqLePa8HJF8ksytEz1sFxW+88FVB74H1FWP2udeH/sChAt2AMDrd4NxLuLfloMQ7wMIFMkyns21x56H1ssFQTtRY3qTY3I4tAxsLE5Cr8U+V6K8LCiC+s//9PRRuqHSg0u3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rag7Hfd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVwM6G89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rag7Hfd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVwM6G89"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6861W6BB3839093
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 02:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdGT+/Nqgl235u435n+YuE6aHP9Ali5eDPJS19M1ESo=; b=Rag7Hfd86A7S1P8m
	KotqfwR94B0OkU1JswONS6MajnFw1fiI+rFWdzB50a2AsHCmZtLDZ7rTnjbrYrhl
	fQTNlUmUE3+VopFnhE7YoLloXwqxNym66qA3DzgYcWlZrX/BeWz+nV9Qkto7Fmqj
	KvSouYC01qTJxqj1MbUHLdwS68NIn0021OiVvvx76d1t9qOrMApP3WiMWFQBomc3
	R5yIgbziVJJ2PbBCPohRXcSbyBOD10FZlkvV3nO2/BLSmtqdrcWmQX23WtimkAIs
	MrEfH2LU0MXxKurnpwd0pndHNRVaIjJ7hHkT79dGAVt+kTn48exuPQ6+FubRShk7
	7v/usg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhjnrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:28:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee162355fso373820a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 19:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788661688; x=1789266488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdGT+/Nqgl235u435n+YuE6aHP9Ali5eDPJS19M1ESo=;
        b=HVwM6G89eklwL7o3o+kRW9GHvT+rTMLYglclQPU/Hp+PIYY/YkNXVRghR4Z+OXJw2v
         2yM7Fikc1fsXIBdZM5iBUY9gKx5GOoMNYrX7j7YCfSx73Je8OQi0L1T76yE3K7PlOXUM
         HudxL9o+0sWzsl3m50CNLlt+9ytJQzOg76pLVgmmipNGKxmP5Mzzj0aBWz3Jbzvg1WV+
         oxvOX84xryIELLBFWytZw3mg1KWzWFIYCwOiNtucNqRKEJTBVtzIOOCfQbHMAufUkcmy
         mr4fjMlw2hGxf8DEQoauDfyY+hGpoAdssxMXR0xFA4qN1KGYST+UZU3o56GLePGvvDZ1
         0W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788661688; x=1789266488;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdGT+/Nqgl235u435n+YuE6aHP9Ali5eDPJS19M1ESo=;
        b=eCBtp6jvpavTyX+vl08w8ajjcMW8Vg/hwlCbiucCqOGfKPOEm/j6dezKeIf5o8m0fL
         iS5btRClXb8xHVRVR9JSzxUaFeBIw9gEfFCvbeWuMKV0sHA8SFwqOSOm0kfthX8DVKya
         V9t9rAQI9LeEVJk9OQ4nlCdLO8okjIkhILLORmZzT5EBK/cMK7SYur5+1IB6LOXA70c5
         CNFdL8HbPpi05Sl6rNKlqhTUmGATuCd86iVPlgj3mFmnVb6LGBuZZ9cC/KFwldWRgpT7
         qM3r92bFR5oojY3IMiFNzamZ39TWFYr41ljEudJqMxkANN4rG6Yy/wWqPRAXkZD+0AEV
         a6mw==
X-Forwarded-Encrypted: i=1; AKwUvBwIpOoLBBBB5aESzl0UsfpMsoEiRBweohlbkQsAPa98UP5wZsSeUhPvdIXa4jb1XYpqEIr48u1cT2oAGOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kbJb8izIz6eQSV0sKioJZKLbGD+2REeeVfGG3VKJW4PprfBjbi
	p3qO3zlh6hkJ97jHrIeMvJyUdra33qTbvnSIqgeGXVEUOedUev3Bu6QZmbI+khSFTONv3P+hPSg
	WPHRuleV1Anne6CFeoIPJG/8yZQ4OJUu1JBW21sQ1iWGNEOZbp27poMi+43tEfRhCRpo=
X-Gm-Gg: AYBFou0uFU+0FqyRKcPe3f9H9880Sk1bahn/oKea/drd0ZKiQyYaTh0Hm3HqnzCQsCl
	bcRLost8FLIezVIYWNY44h4Uf01/QkZXgWAHCl2ZSMQrDOn74QtKm1MAYXVTQvDY5trqwUg/1TQ
	XoIvdQL5zcAFi6Xj9LMpVUNnzTFdveshaPpXQmy4w4bbSH15h/cJK2phUQF9jO6KGT0kG5IOmfC
	ZQzSdF62ZEA2vHFyAkTwlkqiyvnEu0/yU4hWoifoZthr4ybwfrYT7P2OzYGOxmXUi2Fi2o1uD4b
	AUVUu5OQW3BU6syEGMpyRej8uRIAit4H962HNvH3KnwS/yZWWQKJ584K2MI9DFAoQAKU2w09VSE
	Yk70fCbhVL7Zk29Nx5iqzBxwMgKqDC6fdo997M7ENQNQYrzjdCWMrq6it0cqcsrVbySg=
X-Received: by 2002:a17:902:d4c9:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2db273b0f96mr75963245ad.0.1788661687634;
        Sat, 05 Sep 2026 19:28:07 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2db273b0f96mr75962955ad.0.1788661687153;
        Sat, 05 Sep 2026 19:28:07 -0700 (PDT)
Received: from [10.249.22.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db148451fbsm26773485ad.7.2026.09.05.19.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 19:28:06 -0700 (PDT)
Message-ID: <4df53cf8-b173-423b-bfba-4c5fc539e528@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 10:27:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH BlueZ v3 3/4] doc/hci-protocol: Add BT_RECV_VENDOR_PKT
 socket option for HCI_CHANNEL_USER
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
 <20260903-vendor_hci-v3-3-015d62a57c91@oss.qualcomm.com>
 <CABBYNZ+1PqFXSqAPNC3krSaTccv4VT7ERNRWkO-pCg3k+qCH9A@mail.gmail.com>
 <985c44eb-38a2-48f9-96e8-292b0a39e29a@oss.qualcomm.com>
 <CABBYNZLddwpM42-jpbGbi+wpiJgqwU6UB4TKc1KjC9pR=aM95Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CABBYNZLddwpM42-jpbGbi+wpiJgqwU6UB4TKc1KjC9pR=aM95Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M4622EPAEzic-3clormyvSlVW4jqUbBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDAyMyBTYWx0ZWRfX5ub1O7xqBPts
 DUAQ3/X8GRP2tcYOwUMdySYCwv144iQMDza7wdRYn0v9ufEQoqWwPDebH83V7HktbZMcFmOO4pK
 7eQUr+XFazmtlLgrqoE4xomxeU/0/WiBCJZa90G673wwhm/zuw3bGnocN/DbQPICuU/ICU1DUj4
 5x31DBri5h71Y2fmL0a7r7MaqWRCBaezCDLmTnckrRX05ZrBaDcNcukcCfjk1fF+yV1guO1BEMF
 gAQuaanyDZBxooqrH3V68p9FV5XzpycSIFY+GQfOJt0K7a9JMn4g/SBB+mnuGAd2fLgxFP1nvPX
 pER/IQn/coqyWXs0NgWAvh/rwMkr9pf/QOA4rHOMcttyzUgLc+LEcs/8PA8Br57iSxK1HS3AKKm
 e+Lc0gjD7pTEfIA9jA/G6WrAxV/BoPEnUna1Y6wtrrE8XaFVCGBtVJbcrJH7oAxd883+kuGBmVv
 J1gdMAC/Ht2TAYZ2nIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDAyMyBTYWx0ZWRfXwi9tsIadHFly
 zvSwbs/KdAA/qMTAXEq6rQbN2oTwDbv5A86Bxy1pg+w4B4PolVFKraKZ1h3PNOWypvvlyX/sUu1
 jATy7DFNX0VOq0Gy7ihfi67kIZKWTMg=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9ccfb8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XTxmbAkqevqQ1xLVaKQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: M4622EPAEzic-3clormyvSlVW4jqUbBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060023

On 9/4/2026 10:31 PM, Luiz Augusto von Dentz wrote:
>> Hi Luiz,
>>
>> Good catch — that socket option is introduced by the below kernel patch, which is still under review:
>> https://lore.kernel.org/all/20260830-btusb_qcc2072-v2-2-5c0e0c9dd98b@oss.qualcomm.com
>> I'll drop this userspace patch in v4 temporarily to avoid confusion.
>>
>>> e.g., HCI_CHANNEL_VENDOR which can then allow packet type rather than
>>> just the known ones.
>> For this new proposal:
>>
>> 1) Is my below understanding correct?
>> - H/W wire: BT and vendor packets are serialized together.
>> - Kernel: splits BT and vendor packets to their own channels.
>> - Userspace: merges both channels on RX, sends to the corresponding channel on TX.
> I guess that is up to us to define, HCI_CHANNEL_VENDOR could just
> serialize everything, so it supersed HCI_CHANNEL_USER which only took
> care of known packet types. That said I don't think it would be an API
> break if we decide HCI_CHANNEL_USER carry everything, but since you
> are trying to introduce BT_RECV_VENDOR_PKT there maybe a reason not to
> enable everything to be send over HCI_CHANNEL_USER.
> 
>> 2) How would a HCI_CHANNEL_USER user, e.g. Chromebook, send and receive vendor packets?
> Would have to switch to use HCI_CHANNEL_VENDOR, just as it would have
> to use BT_RECV_VENDOR_PKT, but then again Id rather do it on
> HCI_CHANNEL_USER if we don't consider it an API breakage.

Good point — I'll drop BT_RECV_VENDOR_PKT from both the kernel and userspace patches and let vendor packets flow over HCI_CHANNEL_USER
unconditionally.

Since HCI_CHANNEL_USER owns the controller exclusively, it should see every packet the controller sends.
There's also precedent for this: HCI_DRV_PKT was introduced over HCI_CHANNEL_USER with no equivalent opt-in gate.

The regression BT_RECV_VENDOR_PKT guarded against is mostly hypothetical anyway — it was added defensively in case some proprietary HCI_CHANNEL_USER
application doesn't handle unknown packet types robustly, not because of any regression we've actually observed. If such an application does break on
vendor packets, it should be fixed to tolerate them, rather than have the packet type gated on its behalf.
