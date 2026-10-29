Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256009;
	b=I+K7QxNrjt2lpvA0IG/wwwQ3LGEKwuJReTVIeOL64oojVFhGte0hiPDs3bMNmvy8AMav
	 giMOG3iSPNNqTwRy3NIx6bW76KV/Qtnwct58siH+mOGHm22dCyo4SSiEf6E2psKyVrYrG
	 ItYHUut839+9tiK6u4JExlhaRc2vj3A87roFaJ1OOlgqScvGqoRiNzxY8SXM4Ry3AOQl0
	 /wxSxrAUNs3leEN5J3lESrWBH0MLCv+ltQP7UGSdlDZWRvon5+STP85Q4tTNf5OY+/oZf
	 5BkNCIO1TA5JVqKTxFLQ/eXRI+enfj9QmIjpQC/cLnTuTU3mVil9NGtNWRhh8zJNd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=;
	b=b01dpW+v4JLtL/KNXIYLO5lVJUBLvye0ngHsPVRUJv/3kyhyK1ShUxuEGzHlPflWZFDw
	 snZlsf0pbPat5V1jUGjU7fVPAOusu8OFoTdzO8dLgu270Fo3UMJoIv7g6VIbuVOLoFQdM
	 6koQh714p3OQmwyZb/nbHrQ6IScM3zJQCtIB6ZuaXs3xvnI09M+QBXiFZXto8mzqC9jEn
	 iaScHogybf08D6kMQ9hWOgl/2EC/YiT6C1ucElf9TbhTA2Y8d9t+1JWcHJA5jTFj2wA4A
	 NkGNbWecAj5p58SvIPjFANehVqda3+X7zPiewjxeMD+MmCZl1DxKMJjBwnuVCLyPmXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLOjDDAO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DL9WSOuf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C64606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLOjDDAO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DL9WSOuf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gvfi2243722
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=; b=pLOjDDAORyjr8kQV
	alcBDL2ofgW33nUMpNZhqwMSo625Jpr17pjhUxbBvsLEOS9rNCZGQ6Sw0Xb24aLW
	v688y4IvEGV0mhd8Tetn0WSSCEf3oQhOo65U2yXPrIjGMXmHj/VSJPtregj6sp8Z
	MnyfkbCUqXSIk986u2Ye2vkMpNuSG4Z8jYiW8PwctclBXKjokYz2EqYdKYmk4UyQ
	QOymclUA4ghsPfx+lNXPtnrMGOEmYN1fReRNxbYMiMVGcbOlgw2p48OsqAL7Zuab
	p+livXOEb9xPK8hgSCl+x/AfeDsROe9SRfbwb2qTm+wInHnefVuHN8K8iZWTlDo+
	PeEJ0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8d27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:40:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3342029eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793256007; x=1793860807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=;
        b=DL9WSOufmDaOQS0xwLVdGk8TLtmpzlvF3pS6SLheb7XmJim9YQvC5r+ylWoZw+Ikf1
         QX1vAUB3ZUPPMdS/ymKUg8rlvjyJayEgGwpCgiYUn2nfgru53BqxLiVZH5i6dfWZpaUo
         03OE8r1BUCFj9tMH/Sl2La7KO1ifYf7iyDhgSg3WhTIPvEChT2TIFnjd8MbNb/MWNVvJ
         bJ3YtLUF0SJ9il917xHDz4JaaOfcfVvB4jyZQZflCs1EL4BRvf6LN4OtyYyIbDMAWVot
         rb7jS29LD1PUYI/kq2esuOjrInCxZzhMGQGLL4l9ytqaIrXrGZ2W19hYcYhXvac6QM94
         CqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256007; x=1793860807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=;
        b=qcSE5o3ViqV+CnuGxaw+fQh9qEbI5KDXikiWOl5AJSIaLhh52/XIRRSLX4l+NOug9P
         cQ6mfHloJ6ZToxsOXANXwy2V2J3/wNyv+dQrQwxm5oqo7m5YcqT/rDtGLZn5FcYjMeCV
         915afB7Z8bcfPkQtZBTrZa86ceaUUPgqrNtnqnwTrDDZM1h9bwfWXFE1oRwPlmFll0aP
         kDpY6Nxw1VLjJHR4tavAOI05hgrZLFLHSh3ZYyKF2C03Rxqc+94BKHZzkSgXyzPJeLwg
         rxmTcGbduYf1x+TJxXOdq3IMhKyhCwIKdGyiTUfY8tAlHmmUQuI1akn+CiFGkqJNLU+z
         fSkw==
X-Forwarded-Encrypted: i=1; AKwUvBz2SNYgrtJv6qxxgbcemli09xIYodQ0LUnF41Nyd3X5J87CRF/SpjdA3iNQGd/ggmdhMHq8dlksEsQ/pCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvbJZYq7+kCw248dRtglzXEJFro+Op2GvSzHLEO5+ghh7UDKsT
	BbH5Gvqfmh9iYdq9yN0o5FjAp8a4R2vxklO+NnVGhhuF9IP45kVLBo7mHuWuAf+VJaDJ3lzMt6W
	WlTAs5O44P9v5K+83Tn5M92P/sjXtJ8qheqql+fwLLho5cXxjYp32GErjGXSXvJ8lU1c=
X-Gm-Gg: AYBFou0OE0YJ79T6qxY6nyCEMp8YNMqLNbNYBYMPuCjf5QSLj48rpvz+Xkm8ELNe7AE
	Ipyyd7B1TiawtDgoCfc+FUnLs0LxsmBulroRJE+feDotFafQG8PbvdRqo4J+V+5jf82+kbSartu
	yprUjB1cAeWEtfanAJ1+fBQzux2DIuHtYBv/rGcmVHmfclTha2b3Xh7UyiPONX9j69VDZKIKRdf
	HOjZIyE0rRNz6Eg4NoK2RLzSwT94ARlQrjcwwCp/Rusgznx039wSD7zICvwci+gJ1nrFs/p7c1S
	e4PiTEgSQWZqkIye4Of+wUi9MEyao2mVB0277fH7G8sycMVX5ws8zczdO5O26wLboA1uFSy81eS
	vj5cj2UI67E0WlwI2gg/KFl6TXFr4pZ562Mh85B4q6wJ9rwE/lVcNXWpW39rExkd9DwvvQujKSd
	4PeNMyycO2t1d+GNGbxg9KaQ==
X-Received: by 2002:a05:7301:e10f:b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a201fb427mr6379462eec.41.1793256006484;
        Wed, 28 Oct 2026 23:40:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e10f:b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a201fb427mr6379421eec.41.1793256005900;
        Wed, 28 Oct 2026 23:40:05 -0700 (PDT)
Received: from [10.152.202.164] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16676903eec.24.2026.10.28.23.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:40:05 -0700 (PDT)
Message-ID: <e1f00156-fa37-44e7-9d30-177d5fe63240@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 12:10:00 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNSBTYWx0ZWRfX492McEJDTQqH
 ImV7hB3AlV8AGy9dZP2Obn/RSPbWG5FHmxxxV92uyWY2Zel1G3sTtHCtTq/eTZzOmRtcjjkns2w
 4vXxGHSooIR4s3njFcIjMeGpZxtnj45Rnt25G8Q7t1kyatkrPatltBhiGrCjnWA0nGdfRnznm7S
 RWb+VzFtU83IKgoukrosysARU1BSkxDPB9J71ExEQy0J89A0coh4BHxLkh1jYWPy7jx9XX9jutk
 aZBURT6iVzJilpE5hC6JqzaT3JDyV/5Z9zdVoam1XOiCZrqkvV+J6snsdkh8CLHvUVXKMMlf4s+
 UYnDbzQVsJhm8PNKQATggxiTb2radPEIZK1DSWe1wm33Yn0Otn5oSyc3ZfiAd+TgB2zKPwtmAv/
 qzaElWFv/aPPQA3E+z4KNIKOcEQcxRwR6Hu7kDfMolqL8usliC+66FYWLIWTlHtmHpERgqgWgK8
 VDLYDPEzl+8Ah+X4v3A==
X-Proofpoint-ORIG-GUID: C9GYMnNZfIQMsqigV3i5QCLtfUE4X8xc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNSBTYWx0ZWRfX2X/8FSH9Atpx
 nxmW0EM4yHlmw4Vdf5+fvJgmdBeTfuqUfewWU/WdvrLp+/nK4tC4IOQ6qaXTYL5D4AUc4I4Jm4U
 IV3ma/VCuomXTUFlvVsrS9x0Mj+7ACY=
X-Proofpoint-GUID: C9GYMnNZfIQMsqigV3i5QCLtfUE4X8xc
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae2ea47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=9NHMLYiaqCzydb3n8i0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290025



On 26-09-2026 17:10, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> Reject frames shorter than a three-address IEEE 802.11 header before
> adjusting the skb to expose the frame.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index bbca275a8289..02cd9764b6fc 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5995,7 +5995,8 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
>   	hdr->tsf_delta =  ev->tsf_delta;
>   	memcpy(hdr->rssi_ctl, ev->rssi_ctl, sizeof(hdr->rssi_ctl));
>   
> -	if (skb->len < (frame - skb->data) + hdr->buf_len) {
> +	if (hdr->buf_len < sizeof(struct ieee80211_hdr_3addr) ||
> +	    skb->len < (frame - skb->data) + hdr->buf_len) {
>   		ath11k_warn(ab, "invalid length in mgmt rx hdr ev");
>   		return -EPROTO;
>   	}

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
