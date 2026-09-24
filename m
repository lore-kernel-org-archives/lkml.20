Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F14414DFA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273136; cv=none; b=cgtIR22yB55Gn+NXpk6L6rBkAlCIcBX79LNx25KqdHiYtTBOLik8xOFbYNFmW8nHlFlFjWML6H3k726cIv+Qf/WF3bLqWCJiBjizWgoY4zfgG/Rky7Z4LDVQzVnVtpS1KlsxTIZGZjylzc5ki12lEVV3qO1eLUzlDkJsSP3m7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273136; c=relaxed/simple;
	bh=H3GUP4AsmnVxdT6iK8IoriAcq5smbK5+E2uv60sJTZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3r2PtzNQGCnq8yztQT6YemqVt68y6Tjkkp0rwhupi1fS3g4+ZAhEGsoQqh79014DiGkWx16ZUBtV7fgkrNSYnK5JLkvmUgBKHvmujC2AmOPu2SljhCW4prGTv3iP2/riS/Sz2sFU5FmeyKOVclo2Zvl+xKY5g+MaaNSgqzM5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8vUAKyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axju3AXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8vUAKyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axju3AXE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFegLW1907521
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=; b=p8vUAKyx/Dr2AED4
	M49MPPH4p/uKaFqoxY0WjxjMfkAY/1JnIpU9u2rBroiDigGYhrc7ccOIxtygX/p8
	DMz9mO/bwIFCMqlTOpOcW0BAY7iklMWR/eifAE/3YtHEcgAtbrbaAK9tdGyS+CC9
	WQTD/8QbiKs2zftQRPGrnfWrEONhxWT018roCs4lMjjZ7fYz3TokF4Mr2Ry6Yuxf
	oqk57zgd6hDUi/zmRL5kqU0dcZhhHevR7BdUebbsFRRexbmiJOUQJtPCD/FHkkF9
	e2Ay7DseEnTsG5TcJqliJmgQfkXzWMHq5Heo/aJwyANrc2UBIKHIVNM8vBw/YzWU
	ib9WsA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7t02n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:05:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34111ac07c3so135542eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790273133; x=1790877933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=;
        b=axju3AXEGB9EZtgT5tkJJ8Xkqm7dKrT4EGKAcUzuN8GVrWlwUZQ40rzkj509Vo4tyy
         +1rCVP3dcuEvOETCa9Oxp12X5vQk+tYqsf+9a3slxLlOUbrU1P3mfrxExpwLlmWxJX+T
         /vYQ5kD5I+YBZZRFyaFYJj9sSVm7iE+0Y0qJGix8wotEa8AT720/72PdIPqHZB3zBn6b
         bhfep3ckbiavkLWAxkZpy75su2QBQw+aMsArx+Cb/4VnmjhQtOiXOQ6xfW8xwv/M8N4R
         t+EmbpGcUjMtb0cqC43DzvQx0e3upQS8BE71S2HtPtmnhGt8hskhfC19zL/NmGZl00ih
         DDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273133; x=1790877933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=;
        b=zaXg/hn//hCLF8SFBwd6jOz68zjfirOWBjl+QTlZZg3u6OJM7dvr1juHy5JRjDlWYT
         hDca2ehhoKcmB5dpwrIeDARXgW5OZhl9up3HqxhjrRdFw4rOweHi3JlvMPGUOKiJbgZK
         b50HaKG0tZjWro5RGFjVtd6RC9JKuJsUwNv9M1umrEhuXfqh/M2vRnPrrJL793OP2yGD
         zIzHOmrR+GVTDiuxPjHJow48cxyCiGwWZEOtjhvoFTqDR5nqwo7jpLIUE37nLFPKmoI5
         3kBl1R9TEQ+qyHFL4BZ1CrxEob11kX8hnH0uFXh26YsFTYhUWt1Fyd48Kqy3OCRsEtqm
         o+hA==
X-Forwarded-Encrypted: i=1; AKwUvBy3hupdSDGx1poboT347NZDg+UNvn9vQIDH/ZnjVjx+kwxBQQWblZpX2Itxupzthy1sJ9RDLeHG9tjKsoE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVuMy3betY5vKU+pwzMT/28kjwyQ4bay+w1n3fhU4HoyjwKwnF
	DdHmzoSo9aSgR/w/s31GEvjr4/s1oMx+PT3UKeXNm6DWa1JjODao65aaD76qLLljiRMAHD7Urfq
	wEpt8i5lzqu2TNINQZdvJ9/2CFg7dpEfxMnSA31qJ1/OzgW9R9s2Num3kvUodKOxTyyo=
X-Gm-Gg: AYBFou1tMzKowH3vxuzmBsdwyq7/53VpVXeMKWTD0EahiekP8EE5cZpJliAMqp5uje8
	+l744MeESsXRwJWRibyQ0aZjNQsjHFXTsX3smjKyp3hDlrF7/4FEyqbaupip8PmAMqykWm5pioM
	H9wttm+WRyLMKdbwfIBGy+a5jHubAECrXEOLKZMbwam4nijO6gNLZHXENg7VF21dOmXYdMH+Eo/
	t5NolwAfbfbQCDWqe68v0y5o5/Gnlbh3qOQKIZ5P66og9jD7p3WVfphDD3sS2tp1G7MX1wYhmeJ
	Dsf8UrvQdxYug+aplU3RoqKGvvscBmhBrsM/nTIJcc9LGavgv86MkUmUXpfD6jsrXSyZjeqw2aw
	81AQ2BpOFlb6zURThAVrCbcBz/607XfGwcsa55NoPl9PjBWWTJfxpw3jYwA==
X-Received: by 2002:a05:7301:f02:b0:33e:5f5a:4b55 with SMTP id 5a478bee46e88-34005f64032mr2401547eec.19.1790273132219;
        Thu, 24 Sep 2026 11:05:32 -0700 (PDT)
X-Received: by 2002:a05:7301:f02:b0:33e:5f5a:4b55 with SMTP id 5a478bee46e88-34005f64032mr2401510eec.19.1790273131229;
        Thu, 24 Sep 2026 11:05:31 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm277409eec.15.2026.09.24.11.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 11:05:30 -0700 (PDT)
Message-ID: <c6611810-07fa-41c6-af3d-486891444dff@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:05:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on
 QCC2072
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JYHm0jKczGvQ057gvL4KxjI9d1PAqEAM
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5666d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6nRZ0pPnUwzynh11DroA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3NCBTYWx0ZWRfXzX8f98xXhTR+
 eV+uc268kJmBpX8T/9MPDnxicLnyebxASRhK216bbicet6fJ/F0CRCIrDHanMtmrDWn9MxCwu2Y
 XSSqieXBAfSRC9BqXaAeysFDjm1Y184GnMMPITKPDXjx/kVXiRf63ZqAzOg0PR/5KBX1J2remSk
 cCBe8gU6NYUMgYlYfSeB+pHYfm20sMrEGUgpeCo/ymXIq99fW3jNZzGlwijhqnXsLzgTPa8CMMY
 299Nvfdpg+PZh5huEG/AAT2ZTCXmG7HkNyQh1uNoXz5/jf3PNbR7i9ZNEXnFSH/pEp1DJ/oeLDN
 KXmVQGr2mmF1yZVkPSCREWG4AN1CQ4a+K0GK6QBG9wNX3icEubxOxeeUB0Aw8aIoZfaMdbjMG/k
 zHYdmk90fpHlKO5si+sjOsUpz9EnuenlBvYb/KO/f+RjuvM51SOZqMRQWMcEoAlksMbtqe2uJ41
 NZJxlTsk4qemK4oP3YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3NCBTYWx0ZWRfX8wzo2TTvLodO
 DMOf0EKCtLr7tgEI+506+gF+FPgiMUM/Rfbwost7M7pC5qfcgMfcnMgJ27mrP3nw2MJ6qY+gSJ7
 97IQlneanOIuap7YAGj8tJykX2UpSto=
X-Proofpoint-ORIG-GUID: JYHm0jKczGvQ057gvL4KxjI9d1PAqEAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240074

On 8/14/2026 6:43 PM, Miaoqing Pan wrote:
> In MLO connections, ath12k_wifi7_dp_rx_set_link_id_wcn7850() attempts
> to resolve the IEEE 802.11 link ID for received frames by matching
> rxcb->peer_id against the link_peer->peer_id entries in
> dp_peer->link_peers[].
> 
> This fails for EAPOL frames because the firmware delivers them via
> the MLD peer path. In this case, rxcb->peer_id contains an MLD peer
> ID while link_peer->peer_id contains a link peer ID. The mismatch
> prevents status->link_valid from being set.
> 
> When mac80211 receives a data frame with link_valid=0 for an MLO
> station, it calls link_sta_info_get_bss() with hdr->addr2 to resolve
> the link ID. If hdr->addr2 contains the AP MLD address rather than a
> link address, the lookup fails because link_sta_info_get_bss()
> indexes by link address, and the frame is dropped in
> __ieee80211_rx_handle_packet(). This is observed on QCC2072 where
> EAPOL M3 uses the MLD address,
> 
>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
> 
> Fix this by resolving the link peer using the current operating
> frequency associated with each link peer.
> 
> For 6 GHz links, the received frequency corresponds to the operating
> center frequency, while for other bands it corresponds to the primary
> channel frequency. Match the received frame against associated links
> using the appropriate frequency for each band.
> 
> The frequency-based lookup is used only when exactly one associated
> link matches the received frequency. If multiple links share the same
> frequency, the match becomes ambiguous and no link ID is assigned. In
> that case, leave status->link_valid unset and let mac80211 fall back
> to its own link resolution logic.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---

FYI this no longer applies to ath/main, can you please rebase?

Applying: wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c


