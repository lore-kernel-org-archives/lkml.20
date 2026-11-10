Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320431;
	b=W7/jxhLT8fuhUdEFB0e9pAcjZ6HKwDn1iB0wqsxU4zTY3JMhyJ/10xu9dIqGEhw5Vufp
	 z10mHQfnBssC3G+tWrcT7Qg43Q74tBXEB9EpMvxSTEVuDL4HEY8ctb1ZOmeXkuoF8UAAi
	 l/0Jiksnqmcj0pq0l2vJuxoW+YnmBFA2mLvTErqCekZy71csdEw8PKLLdK95/cB2F6LJP
	 gwxaCVmnZG/eMwurVqZxxC9SvrqgbmK2P1UDPK9puTbCOBxsU7JsRHeOmkuhiOH3GvCxD
	 nNYgYFQbKpX9yqiXx8i9ds8vbCOgbnY4S8JmN8gpYbWaYKWNCU2w7yz1eeOy3i+YupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
	b=XxUYgrZPAi01b29FMI3KeKOS4Og33K8BpDEIga0HGjj0EpQwOhCXKpq/IJw5/AmCI35k
	 +1CbE8HM63TsjnG8/wTN7TBakcdgoeCy2VOzJT3b25BSDmxlG0VA2xDgSTn0gV/+/wzwc
	 jmwALL6YoyyNBmZZ2WJL84bMgnf0pGwpPrAIBthX536Hguu1hKaiCdeTH/W7Y1XcReeQz
	 GWS0MpE+ss+TnKA3kbPanO8FBlMspKPkBkGPA7u5H1513r5aBsFlWDZoRwoMwmeskA4Xj
	 +fmrfFzSt6c3iKd69fIUNRAxJyWL7bg2+SIDF02KlATCcJUt3od/rU+808yh06LvNdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SQufQ1k/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720A60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9720A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQufQ1k/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAG3N2881256
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=l7XBpB57foeSGerC
	m5xXsz9xfKW3IDra2zZuwsxdvJkaQ+sMPB3p8LCrhBZTcHvBCSCwRuaGMNY4MCEh
	NyeVGcW1zNS2v/CIMe1i+iuwtlC6KRZgc1a9+WDr+CeB7Aw6+xBkdi6tB8YN3Uhz
	8UsZStqrHjrDSMX3kSDwEVqZSQ2pjvPynMWFSW/vpRtXRMldcfC/wwVEtMjQ0VBR
	WpGANWEThWa5E1yEJguRtPxpNoRUuCUNeVDiUOFyFnsyNWXZoiIn3MO+tjXoB9vQ
	8Vt+wOJxBnrVmVJtiCDnzJRDahla2Dy92Lt95CkpEBRgpKEtZgRO2CfRizsfEdSv
	yTxC0w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux849m8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:20:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso1691674137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320429; x=1794925229; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=SQufQ1k/vqtFYIYhBBNozDJ16NuqRj4sTU+pN1B1GogsNWWHoHd+u8YlVJlQu7q/KA
         5FwWlxjGkk3dwuRTI3pMT/FyOGFRZbAGVPtzLc+cNvnDU/NAdDdyacxx+H68apFaZXo8
         c61FqIxrknJf8LYMzeQg8ZViJVaxjrR7uusIzoiOUauZYOljIuMK/VnmAWG+dWJKQ8RZ
         VNFXU+zkrhcwheHv6rD9OpWlhhcqNW8gMtUI9XRaqYiHvSxlmwrDyJH2iHDIropfywqi
         d9zjiI9zJy4sjuKcNSGRTCLfzNenEmxXmemMmDaYgfNUNVlHXKyMwBxq2vZf23GbioRH
         3HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320429; x=1794925229;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=pYXG2SQcYbMstIBz3BARbLzWugh2o8maSplHpohs6NHPtq9tyIgTuZjDRHK/rz2pZz
         o1hjI+FgrteJdkAxTeFXhQeK+XiYs0MNhQOBsBYT7+z9Bl+HDoAxywOs1GbnM0mEOWI5
         EqpQPld3bfauwnJW/GdYFgOqQLLBX5UgBbaVVG6o7KJw7qh8z19SmkD7MHE/pnWXgpbc
         SctDU8pXQt93kum8ah+G8rFD2Uh8kdhCtTdtPjrm9SiE839z2wMHv8nbao4mfVE4Cg45
         gHhb8g/uN87al8IUJx0t9hqp0w/s+yFfogLLpYV4naCDlCoel7rJcAmD5vNHVGzk5IHf
         qvJA==
X-Forwarded-Encrypted: i=1; AL+hErEEFjeyCrzh8XPWODNSrQXPyRNgLTMBt1AhZXo4LQp25Pjoqzt6jdsl1vQQsusVhzS8sXiBG6iuMpb3R8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WI4K8B6EGWlA1T544MjLlRjwHuDZRl5fNTrO5EOkT5Y8hd93a
	zgo5rGVbye2ejOgwHDiMmh9avYkhND8m2jICr0s/uAfDOUNwf9KvWezNpisJQfyit+a0CfuZF9D
	BSBvJbBUzP9acc/wrPdKI/2yIXsC4LvdngSKjNhkfC2dcGDskGuzqdasDPdIvl85LEpE=
X-Gm-Gg: AYBFou3sG7QeyxQUwD1cO58vv5klxifji/Nv1iATLK9Ptcp5QhhN/cKh4+eVgM0J1W3
	6Vu/qEXGHf1ovMvWLwenq+iKAqGy1sdrRMmvajK5QantKD5GlMjdzP3DReNX+NWLKjT+d4/zTna
	zPpSy39jXwmk2HO1N7Thf841X03F+1gJxEJ/RN0siUx4qIKraYHELqepNTYqGxXpsVjMPZyZLYB
	M2+iIO5KnvQgDHaeAwhEhYJH3F42NTViaMF7g4NctBBdaRaysgKZXNxSh+yaOfiJ2cWnWQq4dV7
	mVpLO+2lucoem2t5sOC81KTstOBfH1NA2vnHsLuOeQPdI0qRsP8h+xLnqZAvqPIyjqjJ9CY1zkc
	XDXekA7xrqRviD88eYlxr4U+0U4fRyDcPu6yteBOfvFt2KFMYX1da40/ebXIQeXZTCra2ncmSgy
	TcxNMkIG5/A6U7Hw==
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015856137.12.1794320428873;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015820137.12.1794320428242;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5242319f8f.44.2026.11.10.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:26 -0800 (PST)
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
Subject: Re: [PATCH net-next v5 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
References: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
 <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:20:23 +0100
Message-Id: <179432042357.601816.13272349217674070278.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794320425; l=1427;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=pmxqB3moG63ZiXPlatXfrHmi22c4brr8zAmv5UPA8I8=;
 b=3VK4IzgRzDq5+i8kNkOpzL1wcBaSJdMg4/naLLQ7vN/3KPtJH+B1yfG8lIp5w3xiAoLLoYDt3
 ZVuSV7r+yx/CX6B9QgIG7xJ7bIfu+nOZyq4a/C/87nhN4u704Cmn9aw
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfXyiV1P3kSjjXk
 iee4VliJ4UWOIXYzQR52xzS4IxLZJjUmHd1OCXS2t2grpPpSgjIJm+QgSF3RJ3tJcRWVHOj5DJ0
 h8sA16C+XK6rhKCOzP3q5ZCNGP7s9qyRX+nri4pNdsIjw3y2E0TEpn8DtwvoEBlKJpivBGVJz56
 1pLhpzCWdy7nOBZDeWup2p5u/w8+jiiPQOtn4nT7qldIvgZRhI4wqS3vHh4iZvWXs5ykrnQX7mg
 1AGvD8F74qYSoVeH6eA27SaiEf18yBQEoyCBeJyxcLLCjtzwmZ7heyW07ntkGkl8kAg12ehCi6e
 ySFqvi1gTOq2SLGxxSWNh4ATuyc8mKhqaWHCXiv3fG/3Eco4Sw7OKBUG6/cIUl13w/rGbRHkrIN
 GywprhEGWCeowhldeh6zTgaxDNmnmSc3JrFch2fZsIPs1aBRUpQwumKnE6SOQ/pcq6qk4COaecq
 hatC2bxCi5KveCB4kkQ==
X-Proofpoint-GUID: U_Bl3ISeoD0mUv80a1v5p76rPbPpX0Nk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX4leBZZJ1fv4l
 cwBVajbbCtiI1KkhDxIGW5lcY9G6/D5P3/psgUQndV1FSX9lYq6IV1VDbTP5XwnEs2LEPrQPSKv
 PwE4bVIYX3zq4FXPOsRVah4dC+qTvZw=
X-Proofpoint-ORIG-GUID: U_Bl3ISeoD0mUv80a1v5p76rPbPpX0Nk
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3282d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=51d02FP0LlRxlB9DzpEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100057

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index efa70b95f8a7..7a59ccf15490 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -11,6 +11,7 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +#include <net/qrtr.h>
>  #include <net/sock.h>
>  
>  #include "qrtr.h"
> @@ -590,6 +591,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  	    cb->type != QRTR_TYPE_RESUME_TX)
>  		goto err;
>  
> +	/* Host assigned node ids are not supposed to overlap with
> +	 * remote node ids
> +	 */
> +	if (cb->src_node >= QRTR_NODE_HOST_BASE)
> +		goto err;
> +
This breaks the functionality for QAIC devices, and any V1 packet with
nid >= 0x10000, for two reasons:
 - V1 uses 32-bit node IDs
 - QAIC devices use hw_sernum as the node ID. I am yet to see a device
   with node ID < 0x10000
This causes "invalid ipcrouter packet" error logs to be printed when the
device is advertising its services to the host.
>  	skb_put_data(skb, data + hdrlen, size);
>  
>  	nid = cb->src_node;
> @@ -615,6 +622,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
>  
>  		nid = le32_to_cpu(pkt->server.node);
> +		if (nid >= QRTR_NODE_HOST_BASE)
> +			goto err;
Same concern as above.

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
