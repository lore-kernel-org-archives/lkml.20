Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994665;
	b=flpU+W13aSRbR6j635u55NobDqDUUi1fqv9rYlbyHcaW5r2Ls2PONB4z8waoVwn9roPx
	 sKHSkYCdkfOAmq7YApOr1+Q8uxuISobw9QzAUnaAEfIkOyIRtflM359V0uXE7MXLdVt5A
	 tBpNYgp9W58AlbfbLSVWBSFIqkkfANQHu9g1icEQQBZn41BHpzqkPmSw/14O8P7d0otPp
	 I4BV1R0dfbrhIO+hOTmO5FmRzor27gZXomc7Nr/rajRTUlcJdVkKVdsOxNtgDBJ1qcQIM
	 umiAOkMukEyjEMvIUt/FwAi0CpaEB8e9xr08wbmF+MJYcqYVHEGAZgMISpi2yDyUzAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=;
	b=ongt1TjGENvL9Xt68WMXApaG8V09ka+tFjv4sZMbE4kiAXXLZIwxvt3zf1zE5BRGcRxb
	 QA/vC8aEddoP9VwfAGP/kHdA3h8bWDNCVGeyuInN3SVxyw5/ShNpP6ZhoyhotfxGSaykL
	 bBQCuAGFno+Kwc6Ey4uwpfWywfu/ZCNXTyar/TipDMX1cHYRgRaroFc64G7Ua+PTHHKxx
	 rvIHurlTz6ScMsDYeM/aq5HHKDyoSA58lOtfsa6839C32IWACls9BxKKusqsrUStGeSU7
	 HLwEjHXEVesX0wMubfPRJuDZq6tBhz2EXDBMMFIpoSQBLynaKpi5FD5++4Yqe0S7UJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgOAUXCI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FjfV+lE5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32662606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32662606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgOAUXCI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FjfV+lE5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9CA2728036
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=; b=ZgOAUXCI/uogjmGf
	vE6Z+6CTlJFkyQqKh39VbkGSrr3a/Py/RL4/zXanDlb3ntpzWraW98/w6xkP1gOt
	h5UxUJGz3xyq282OrCyHzWS0Q5if35XmO/r4vJ6fJNBFJK082TNzyggokOpTL7It
	DKwWnGHIUjc0ORZlejGWlEQX2QVcmVDe27BDZJuogN9DHww9KEbIkNGQBLfLWeov
	lY3RlBANGmEFjZ92KmV3qDSVMRbdyTzw41q1mBbo0mdPAM+a6kuyTLUNAonxrnyd
	HZ1rPsFNWU5+XuXTPyrXhkQ4SawE/9rIhtx+PAIbtPx1B4eRrEN1CF0OfLpqy/HB
	ONkEKQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n40x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:04:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8146827eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792994662; x=1793599462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=;
        b=FjfV+lE5NHJhgUQZxwmVRCxbNDVBUL9ZVQ5p7SR8SjaHygby+aUbHroX4racWgZhVP
         qhTZn11zz8uj1H643Gzc6bxcxK9hdXxeS7GguAJi1ZQBQluNYPPtP1lISFP0qo+jctwl
         hvI3/s9hbTgwrRlNUvf1Xahfy3QWMpplO93s6Gda+6pfJRISOsL94e2uPVilw4UQTaVN
         5hSDE7TMWBD2+EdYBunzHzuYlNe3dzZnwf0WQcwZbREji0AVU17kom6WX0r1h5IeZlbf
         moeRR7oMk0Nrhi+aZ1Mnx+ErNZ6yItNbvmai5WZ0En0Y6IHqs36zVt2Rc+8DKJqd/ZGR
         W1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994662; x=1793599462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=;
        b=rYxmhXsmoGIYQsjFUl26MzWG3hFs8kPNOZX1n2KrXg74h2AjJ6SPcCtc/FqhhMyBkn
         QoALtko4d0AgJIxnsfdao2BM1I6SOSrClvzFSdpm30G3p2XW/NvI6benAMfGxEe8u+cc
         UuIGeAi6FpZ4gT/Oqi0gUPH4/BUzARDR/FuV1EbVBrC328o9hgg0R5Hmca6oxxqovtJv
         bV/BhfaeqynxSeDqVkO1rZYBu4BrYAGHva9JUVkizyd2/Che4OwLGCFSOIbguw1fQwGT
         wqGlN0peGrzXTHkNhYA2F5RZRVaelWRVUN+jA5ooXeUo4oKZQORXDyjhqINag2S5UM6k
         5ciQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtPnujfseinn924uBlefvXO+m/hDwOxzDNW/r6aRFOg4fCFY9fy9dK18HWkANY0uNMuc13DQRE+OgG62I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3psfapuCh9IoX6ZRP9VyyOKVqNRVkT0CmHk6rtTxFBoMfDiiK
	SJwBj8pJZlQAP0FlSsLMdyYkpZvfPXvlUPWxHw3kuezkSifPcwioe170gTF2s+YKy4f9TXhb+b5
	QZ8zouRI5SdFrIjMi9ODwfl2H1gqaLarhlBrt626nO1PPquIYz/hcQtUpt8eOb5+Dl2QgNK6bTb
	o=
X-Gm-Gg: AYBFou1HjZvky4f8/IZNJe6h8VOHnGZPwhca9Pgp9ErScp8B8Eh3TUdrxeQ9mcGACdc
	Fuiq4J4DkIBhKt8FKlo1LIuEwMkR8owUNPJnHGRgpxtCTuxxvV2vQsq8ahdDmms+U5jSvQkUONf
	WIGsVYeiAZDQpkZu/1MH29U3XfssHfjeXjAHKe4JvohUdyo6pDvLmToiGN/xQlXNm5s2DLwatLk
	5fucVUMj6caPm+HByO3kZ8sfndXXXqCV/Zm9lf8OVB1XsJxMxPzW62m/xiJgiADhSytdX5GC2Cp
	PRlsLqa0QTzl3qidI2yWK3jsac8uuSFr2K5qpKan/Yn9M4kg+fi8e5y2WOw4hzCGYHHxAdEwz3k
	s9vEFZ/uoANFrqAcV2PmtYUsFqYrBfyu8mWoipzpyreTAXcM=
X-Received: by 2002:a05:7300:84:b0:369:2f25:339b with SMTP id 5a478bee46e88-369e849503emr10171397eec.8.1792994661907;
        Sun, 25 Oct 2026 23:04:21 -0700 (PDT)
X-Received: by 2002:a05:7300:84:b0:369:2f25:339b with SMTP id 5a478bee46e88-369e849503emr10171347eec.8.1792994660976;
        Sun, 25 Oct 2026 23:04:20 -0700 (PDT)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm21955696eec.12.2026.10.25.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:04:20 -0700 (PDT)
Message-ID: <63e5ab21-cd8b-463b-890f-4c3c93bdab68@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:34:15 +0530
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
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bTArUOqGuWSQ66wM-Q6aQKDQnTfp-kPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX6JNP7cWsSfry
 +Hp0usT9X9O2kVcNj9H7d3562T9N1ExuI5uf7E4FLczX8irZl1+3CpKh7IZpFwMz9HpjoWO+5fL
 lX7qL90mQsLiU3Qzzltx/ejTTd7t0eY=
X-Proofpoint-GUID: bTArUOqGuWSQ66wM-Q6aQKDQnTfp-kPJ
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adeed67 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX6wBx57jGcYk6
 QYAZfHOu0mEWqwJ1oCtXLodmKhRWycfWtwJ336ugjMQHJJgnWWcMu+++m5hXK3oWvg2U59H3aFj
 oRORL3lc4Vx7C7lb38Ir/mm2FmWnGHXObd6jo9GMt2mGSnQUQIUmafg0c7abNpSQU1AWBS7PkOf
 ui40GfNPkdH8YJjlEDbzNjAwdW3m6nlg5X3ZGjNWnYV9CaNWBeRey/okPoNx3Dt7mWphf36Qf+6
 dLkYmC2zqUJW9g/fZyl3Ey6VMz0jdKtB9AXzHBK8/qhTkswDXagGwtKBxsNogAEI+P2TrXKov0p
 sKxnpocj3/cxAQofmPf5YDwleZ0wfTu+gNUAEmBec06zieFd/ScCdosgDzv1PVNgaEheVa37u/i
 F1HWDk9C7gqX8pWJxfQiuyAotHGL2YHh5eoJMh1A46PU8278xdrsQeCsETbPhffrcaKWcUOPQJn
 or3NfNEKCH28rmauZVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260023



On 20-10-2026 13:22, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> Pass the current MSDU instead so each MSDU is processed exactly once.
> 
> Also rename the helper parameter from head_msdu to msdu since the helper
> operates on any MSDU in the chain.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
