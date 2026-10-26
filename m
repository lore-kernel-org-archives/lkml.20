Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050489;
	b=idCFuXerVWp4L0Ah30DuS+LBiRxcb3BmVVoG9J3LidNiKqiMLG7I7jJK7LMPINXA0ccP
	 a5uSzr2GQ0nkKzoaHkKH4yb+3TBRUNOXpneRSwAmUG1iVFXZV58WHtfGp/Bg/PH3l9/tF
	 VTO7d5K+fDnBfA3b5ijPJJco0zvPay0ZgPLDGN/Q6bMefRjT/SVG25nf2Ks90mL1iAMeg
	 v8oyXVBGlGzYuNMFty8p2wOHAIygawpCIACMSoPwoKWAQpAnTj2RP9O/zKvwGmphS8rV6
	 5LJde3cd+cX1oIEyvqLwZnsCGzhvRJqlmJt5RkAIcIKkxw+YX0N8dAS2feUCvvkXdIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
	b=TQvKuA9V4BO2+I2VPQyTGWJ7olN3weEPlQEysPwO79LzuXJDXn+QesTYQORrJaIeZFOV
	 QF9krkJUmvQRMp32TBFHtanc8+jAK+imHMC0E1r87ztQWc5n4B6HV5mnWKMCUS3iW/EA9
	 kQF/hiDVqcyrWekFYeykXoTBgyEOZi1JYcPX/y0uQW+zAUDgRlN76Y1ZqiNBntdlRv+XU
	 Q69BA97E9BzHgJnClOVc3wLdVtr4XnpcBKA7atKXACjohSZ78NSmuAQP+NGm58V/KhLSo
	 IprpQi4njk3PByFGod6QpwqOV+En7dPUTtJsjMNffTh7GlU1qjNjaGcrQbpOn3jcMSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWj1g++T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jkn6mb7P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73EA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWj1g++T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jkn6mb7P
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QInv1O3584640
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=; b=SWj1g++TF+yDUQr8
	ywP/9IqD0m7ocatSpMQy8Q8jDT3oOj4l1AKnxfYt7NwDHVSn7oZo922VNeVKwesH
	SCmUvdRkVSjj5lrCE1gqiQ2SkzGRynJOJpV9CID3rXqh8xs6btFZmteeIYKeopa7
	9klJ900DpTVcKDxhNly9YlPjwrvCMjExoMwOJjr2q90Bj3DEP47t1k27rzS0aYLR
	BGUzBjh7atVnRzw6c04Budrs2hCTw7GbfskyWYrhrl3pkIfpn4ddnwlfrPfMq9qG
	vsa36kdcj5yhOhBRDY6Z5T2l3WXxX3ylySjHtiZvmAH5vSk/T4qCGEKeFnDC/wER
	7hBolQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmm8qwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5049699eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050487; x=1793655287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=Jkn6mb7PLfiXNftKzZLoZrh8nZjG/G6KYD8SBkYZB4Lyhnz6J5jLVWnE/OIdqFEgii
         l57H3SLBVyezx15LQRSJAvsecejHHnbu62wHXwc/0g7WBJcic0HcFn4iOCy97L6DMV7w
         GphViXWThKsXNU4nglk0BMT22kZLH9doo6dt1s6eGao2MdgmcXrN/TbzWD47TEOhYpOP
         F9xdXGcltXMtxN7VHu2FDBIorM0S184a0LBMDlIl5ZI+yjIidOk0yrHrb3ct0k2do4GS
         sbz24SnVChtpzJjcxLZI8v+kmSiaPCGfVXP83RdkgusSWAKvl2E8jTarSs7int50nxMy
         hwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050487; x=1793655287;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=Hb8v8c7RQnS4eqGFLiZ0UmyIvU94dDnJps0AAbOytvzJ7mAIzFHybQTcwSqFjAl7IY
         kYXvWNxYxhgZcpzevkDlILBApfcvAOJwdPnXdwavDzv00IjHbUxWM5jo8Ai+vESMsZgh
         1CM8yNw6vtOLCfXYcmqIfjYATrYeZHZod7SWF6dc2231wloAFLtWKNSlsFgrtw8ciSPd
         4blISXxJnx6r2PU2gP1lxi+91nPwr3vM7qjVAlXCJxUs8ojVntc8/y3Po28bCr5WTkQm
         SUSeXMPCaWmRkY0wXdYwvJVbMPDQUdKaxXumsXPygqIVvqwXT7GlADiEVLo+WgJ0f5KT
         yC7w==
X-Forwarded-Encrypted: i=1; AKwUvBzAyX3Kp/07sElKQQhlFPFSw0BDyZ/RqfdcRmT4XuKX/SegJaLTFVEPmKmYM2CvNwq7f+OsuyEYdqSucBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNkMfMLWeHF5tYswcimyHegI/jfTRxmZDsq5AZa5Zblk1/M+X6
	F4liVgdpPiPnChyj6K25IVtXmJk2WgzoBW5Wf84MmwhprZNrAB6wMhKFiIiApD305ZTJXpvMluU
	5ITDSW8N1XGNsFHDeP0fhlLDYjouWIaQ/onvM5iJHsVmzoM7tT14gH8KAlu+ZT0MzEdQ=
X-Gm-Gg: AYBFou3Yxp9QATK6Lw6cN69wbmbHxPpP7I+UZbxb9IgID5UU4nJI+19UfRYH4DgZqsW
	uCIA82Y5QQzl1m7SXiiT6W5SOJcLSFqbuHwvE7C8+XqmOCin3dSe70YEctwnWCko42eBA9GUeM5
	P6pfN3v1yL6z79it42LhLfCVEcXyga5uertU1mV/xE2PkNQ2NKKXeViKIO7vYkHULP/jiZdcFn3
	ubc9OXZKmrPTFX+iNOoIQjQM5Mdjeu9YNSyiAI7c+fH3B+nJtmydSN/P6rNSsr0yqiaUDpLd+f7
	jH/SZnRDfoXwu6fD61HOXaXc7si9+F7EOoadVaZzPY4F9Vi6n6LM+jDmbInQCVVqJd9B8H7/mhp
	TToxlWs5kqTeQgxe6XVvb5i1RfbkUJzS3EjdVBApF02LxKWmaguLrEEdAkA==
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787565eec.8.1793050487000;
        Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787520eec.8.1793050486424;
        Mon, 26 Oct 2026 14:34:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:45 -0700 (PDT)
Message-ID: <5f6a27c0-9e84-4314-b221-6bb9f82cb1ef@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:43 -0700
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
Subject: Re: [PATCH v4 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX2jcveoN08iEB
 hG2pTB1+fPT7g1SYs5sRiM7GjFiwMATwUup3Tx/+sjnT17DHdgDwzJ93C5r5WOoJ76fnKmGbsZz
 JQdTWzd/7ftPs/quqeE8VV84hXVNA3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX7Q1kDNp+AVG0
 C4I+jSbiJjGifutuofeCxn2x6SPGLY4wU56YMPU7RXwyiw8VZNT5LQ/9RTLR7lEn5B/2PUeYOTl
 oxsv1q0zuT7/vhynXrQRhtWLHe8tzsywkwkr2cPeyEZc+bbosMKxstE1tFzZ5qMhhZa/jmTBwc/
 l15hDjXH0NYVzo9SEBpw+MoIDwIXuf4isM5NKE7PFhaQkq7bjBm6Vi0vCMCXKF8g1wyJohLed1m
 n1W7Lu0cg+7Zsgzpwr2XFIf0unZgBcv/5/1lFaRH2ET8VwmYwIJa771X33rvKkKH10EYaSi7GKh
 TuYJE1rimloEN+aJ1ntAw/3T7jtQI/QfeylJW8Eismu3GnLa9b/2aYGt02kPF83vU2LqarNfIJ2
 HE49LPKRO2a3AcRQI+L7SWCoPYe7vmxcA694QliRG9s4HbfAj/zHDYg4EdMVLWaqT+nK29KBYmS
 n1LZmysfa+1HJpw1iew==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6adfc778 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kpOCkfKLFM9ZImtyOV0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: QcrPSJegEG8ItK_AX5072kocDaZosLtE
X-Proofpoint-GUID: QcrPSJegEG8ItK_AX5072kocDaZosLtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260085

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 7dc07339b957..6d86e552038c 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
>  	struct ath11k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

nit: note that networking code no longer uses this block comment style, so it
is preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath11k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

