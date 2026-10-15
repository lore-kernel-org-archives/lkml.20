Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CE3F0744
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085758; cv=none; b=efm9stJhG96G7ezprJPNUdW9lNsxUAq6GnkJr5o3qUYJEbanu8K9vWycoBh6ZirKlqQPIV/3G3OvdoEQVJL6UsCC19zCIKBPywQFknlX0b08InyzAQTdgvZuRub3VIsLtgN937tbxHecCI4DFs3Pv7AzPCM4KUQxEaf8tspHCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085758; c=relaxed/simple;
	bh=H/etT2HlYpIE0hVXJjfbsEK/thEkSTMryAvWwOvIJfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpz+RjiDxZChnMAKBS1cPlP4z0iqhu80mTZD41kPnAJANodvtQ3T6d5Z/KTMotR9nV12oyU+A3BLPmHFCRXSrYBp1GXjdYWbdNLC1SjyinWfTg43LjKS/nTUTSpTU+Z+OBteklJ/kMhVHL0Hapskl8b/QTK+P3fUzFgYXzAkl5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YS+z7bgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJ5ZwDFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YS+z7bgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJ5ZwDFr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYNl03462711
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=; b=YS+z7bgFMjTyG9nQ
	sMB8HkKmUeszHnO0RSCITsF+yizNww+MxTaNmsNG4I7VCFwgjm3Eo+tLZM9LBDT4
	0bTxx78hW36RrVel2tb4yNQhIA/B0753ohJLUGWlicaFRCVa7P6RE17MORzzFbdX
	IrFjg5Hw2fzWMQWBYwFDYZ8OlQPnJOwE1BXRF58SW8ce2TCRAszlX0pdc8ma0IdU
	TRWf6O3ZUjjbpVhz9ckSixYf9DUK2w/nmus4wrlb8z4zcU7r+gfbC3GFFw1GFYYj
	R+df2NJRkDUJYzJXe/GLPAWaEsKsEu/lu0pa1WqIfb+83Q4lU0tmaAWgURrM95OM
	g+Jpsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu691f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:35:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11175248eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792085740; x=1792690540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=;
        b=fJ5ZwDFrv7WXC8ShmFQ5fGA3hOkUev9/OxQhOZdUz1eB6VRS3scDMzPJ4s3HTiETbW
         SfIgYLb+ROw5mO1ThA8cjIzfI3x+/x4zB4j1vk85u/USm/jAHQ48HfZh0SlGSBjN9Cgg
         BB01d58y0usfFUg7e9tMuBpoxwMtcxrpcc2rV6Ouq7N1bxYJ37SCQEkfhEHLaTmvAj2m
         u/M1TmxEw3ELfsfLOK1/RQtlqj38nAN8i7oKVCfo78HGyaVJYb+BJ0+xe68Xi18AHI0R
         joeBHDxKEAno9xWo6ANKKymOGyF8KGP4WVeD/JVE0edxCGYBCMDtWQ1pi5B1LBZ17Iwo
         o6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085740; x=1792690540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=;
        b=X2qTOz2mUm5UibsjcIjN+gRRKP+IFtUMLGtNMTDKe8pSRIRoa+CI0+5zWEoBECXYEE
         iAGU+5WJUAPAH1JhIV1+30Hy/s3JtCEgo8QaqkJbfXE5jwT9UdavNeAuc88yPbeQ5gLF
         ZhgphYD3lDqEH/SGzINz2dAUZ8Mk8JFSaiYyDvF1O8JGksEWTmkCyhvUVLVr8dYdoF/y
         hOLivAVhui8HpJQSOpR6mQ0zdZT5nOonWREXFZTr+lviZWKAxLc9PypQ5aXsmgrrlaDl
         IhTSCWCkLrTN89o/HNJv6t3J5XQ6OCiHNbZug9GXkkxsqiPfoBn6E7w9mu20vIlA4A5J
         SX1w==
X-Forwarded-Encrypted: i=1; AKwUvBxckxZTDGb7wFpTXDwGC8U66YrfN4tuuBHEGDO7zL5RglIckxAVf0IWCnkLttMWEOKHP9wzFJDe3LfoE0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzxWxs1K9skCR36wgGwxhfIa9cnB2eyJwLLIveEGpFdrmRYTGv
	+jHhUolQOrzxeC0RcM77lsQ8SPabEwpwv/c9UAirU5Rvjlu424x2COnr7PnNi7Q4USoWB8eIceJ
	2FK/8FokuZhHR91jeK6vpWVToMRXLRpFVMdC840qEy45HU+19IiZu5aD3OLMe5xRuwhA=
X-Gm-Gg: AYBFou0kxREauzSbW1Q5LC2rAz7zXOFKQc0ADPWqe+XWKp7COTinX1uPuKRsi+lRea3
	j26C/qioWVze+MyhV0TLDVrtKDx+R0dJbkac23cCqa3pn7cXXLOySuGYUpv0+Dr4UGACjsIevSl
	SuaHp6X6wqqgCEiJid5vy0g1AJmmQ7dAEl3cHvMCB96f0lQ8TrNzfmwJc0A5Z0YfARKdwzJ1ZJs
	xqqVpjLv5nUmW1TIago/fKI84h6aJdYrGWRxRJ2wrMp/B/XQ8KLwtgjI3vlBtWAgFCIhqAnW9Ac
	oE7U7cmlee3sjcjY/K3nGLdp+kexAfPWMq0QFQbmeUGo+HDkHOO3WntloX25YYnjSeY3UAeAtwW
	aa0gdcQey6cYf5r4GOZ3ZlhktVvZwFEB74mSJaN2BDnI=
X-Received: by 2002:a05:693c:41d1:10b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-35d74f71451mr9525043eec.33.1792085740278;
        Thu, 15 Oct 2026 10:35:40 -0700 (PDT)
X-Received: by 2002:a05:693c:41d1:10b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-35d74f71451mr9525002eec.33.1792085739523;
        Thu, 15 Oct 2026 10:35:39 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36058a8de1fsm381704eec.25.2026.10.15.10.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 10:35:39 -0700 (PDT)
Message-ID: <f4c53076-eb99-4306-b595-7349aeba95f0@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 23:05:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IHW_YGZqdb5fWubNJB1Fjrw0kUaW-zS_
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad10eed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FeBjiSnNOcrKIJN5QMIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: IHW_YGZqdb5fWubNJB1Fjrw0kUaW-zS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3MCBTYWx0ZWRfX2w/gMst9xPnZ
 S6bgcTJ65z4pdGiJzQKqQoqmeyDmEosyrgRkJa5yYMsvE3uBFh52xKV+BNRKuhvLC+WnustLfJZ
 u2c1lO81HjMnk2dH0Znl39pV54Wzfk7JWp1iD+5rsiEi6pK5E+ngm5oi7zE7YsA7nBO3ph+NLDE
 EHsaVYybIfptwa3mjFwdZpyAXJ1dLhJ9SitSdPodkQ/CY/lVMaaEZj5s/Sxxzy3ZFEjTosdYJae
 MDKJNX/cCHK1SLb69CUEVQxcDFcJunY2ruu+hic4PtScyksBzaFugiNVY3iGIWU4cc8UBOjeebm
 tNBgHhDM85Z7q0mfPIGczhvMUJ657c8pDCJv495D1/UpRKgsfCcyud3mcWlxPj/2iQbrQ4zTuzl
 I8e4AdAnZbemDbOhIeW7iQwucmNVP+AVVm+L/+arNwxdAN9MXJan9S+ivwoa89miaAkTkaPXaut
 IHCqF1vkgOt5vQ2f68Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3MCBTYWx0ZWRfXz5Bdb4y7lyk1
 zEdel07BYgPF1fLwRi1Om3wWDKl8sYMHF3UqqaqdRzthyM/fKd8fIhVs/7SeaEtsZazmf9FzVBq
 VAu1qfmYndkTQepZmP8pOAevfDVaccY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150070

On 9/15/2026 1:30 PM, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
> 
> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
> 
> Also, there is another error path in ath12k_mac_op_sta_state() that
> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
> undoing the assignment through ath12k_mac_free_unassign_link_sta().
> As a result, the link RCU pointer remains assigned and a stale bit is
> left in ahsta->links_map, which can trigger the same -EEXIST failure
> on subsequent reconnect attempts. Fix this by redirecting that error
> path to free_unassign_link instead.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
