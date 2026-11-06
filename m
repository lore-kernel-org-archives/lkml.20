Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929666;
	b=upvOHtWswoiWEpnnZDK0Cs1zOL7Eixk4332kuYgyD0FXBqRqBQkiZFiHKZm0P54+6NT/
	 R2q3+f7P+BVgML6K+yKWLjv85NEzkesrTOk4Y/tS215bY2EqgBRNW3sp/91ydQEFT9iPC
	 rBiKf1xVsOxDyR1TkWHUMOlLuINIdKZomvIPjnW775olBox3bmbG0YlTYig2xBvWCp40H
	 yO5R/ZoMltYhtM5GRc94ychpbtb5wVMzT2WM2EEGmVENwx+QNUFiTKgVDDuk4LDMwDRsH
	 tM07+/IqPLvvEf8p0rVxUIS896rE+li6laD8Y54qBhQqznANXCBKRRY7aRPbA9Q8WEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=;
	b=5GrHU4VAYblSdbapEXFRSuZThsVbc6Xe3rKqqIFk3PLiRxiYPLMWygP+Wz2vsjAPY+VU
	 jugDbnm7x+0t4dlew59c1SjT8qSS+zINOqjlIwGOUQLuSM517Pt0sSxLqwMYz1gkrLoux
	 eRHGImqiFV8hyVOTnyK9y5bu91qX25nDjLBIVZaqfh4s6qm6ckDZoFRIBx0VM0dssS7Af
	 +fLFsw/rjQ5XqnRaGzSMlvicnt5EL68kum11Nqsj0OlfOa4n5GgB5Zsmn+fsi2bnNyRJ5
	 MsRONlQfNRcjiabuhWjmHbYD7kXTERZlttVnUHlq+ZLJlG8BWUt7La8NCMwp+Dv+7iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3JN+smT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtabV7yD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3JN+smT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtabV7yD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeThp2223214
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 01:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=; b=O3JN+smT1WJQqKw+
	h0JvABzW7yFbgbjE4Oev94p0x0/YgPCN3CGpxBpX0re/J2mBHqgP5B9TjFEjjX+O
	3AXjLTTY9U2AjMgdehKIwfA6yl6nT7ffjqTPKqkevgtofg8IdmK9Eqy3mMZdXaRP
	qCVInGDNXNYvI+ps8UOxcrFiixvy+hlAkvLOaFxBUA6jntJOK/EFJTX+Jv1Uqj0O
	vb+wEBY4X6Ikj8W/swoHnMWKPp48cayAKtSqVqbqOFp6nXPFNnCKdk1O3spvWQEM
	nxddD7S8+VtUM80H/4XF/QstMC4SDI0tJ2eJ3DfnIeou6/cES3n2PWhzf//s+DiB
	VYoncQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0bgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:47:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso212127eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793929664; x=1794534464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=;
        b=CtabV7yD/MAxy8K57l+4lEejKEIbBH/zz0K2HVL2JZ1quHBtifSFyY6if9xAQ1c6Eu
         ngsiBk2B4czZ8N4EPr/D360cBr70yxPglv5SLAuOIDfxnolSPY2WG1IpvF2PjXNgxWH2
         edJ9q/ttnGGtspz8tm1vBmOJ/N3SKuAfC99nvucmCkY8LYSKWyBbXgEAQAt8vCOF1/Le
         FXoRdGtWXH+6p8FJ8flOYAktgBH2U3XiJ61rb5GmEDAxGMwMiZVlnK2CZIiSd5tdciLw
         CA4bqdeVM6ZRuqNfkiWloOqajXb22miNoqwNnZASnj6EGG8ZdCpwdefQ22ggUWocAlYM
         lJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929664; x=1794534464;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=;
        b=YCe4DUlS7FeWAkks8/7eAOLzmNH5cMkswf4dbLZL2k4QmiK15BIbKXzDEONaZ0wMgd
         Vakmnj5FmsmT/tXYbFT2IqDUopSBLy2oo9S4HsKVu76ZXWD48oBnrkhAbjIVMgzaTI7o
         upMS/LOyV6+g8krPe5SO1KfrX4dC7BtrkBMUSn4I/3LGfL3U01AnHN9dNwe4ksq4dsuv
         3Q69FIu5OI39OF5BhgbNxweniiOlEzqz/TN4k/2fFe+et7ZrY3odifduxKpbmOSKpJCb
         beFXK7IHkWmFwfEI+D234BM0UJ/vVw4Dlfd4m9au8B5I9z/0VyMljogYMIEv8C0NC+vV
         FiYg==
X-Forwarded-Encrypted: i=1; AKwUvByrmWYWCSBW3EQPD3loM2znzN3vQo18czXnLROocqY0JbGZHSjSR69PNUr07RLGnTqqM95Bud6C5A3H7dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6zTwsqyZ9lXBEnDqYHxIgCmMxFbVFE8bYBH4Tw3u+ck1y/0Q
	uM0t4T3dmHH39di3IwH290so0DNHJcb16povOemkwA1tMQg7jeUv8oXYbjQY5kofKGa1G3DMwfq
	Wlg6FwRWhQv/7xq1JIAWcjIBrGqyaFvmJUs/0rqQFeY2x4uRP8XW0xOR+IYcOYlcEWvg=
X-Gm-Gg: AYBFou2+eJZkJWmvkDbzmPYrRL+cBJxHyOx59eEliXtwX9mIiuSU/R4DRN4Tq5yAHch
	VBeUd8pfDFzuc428wQA3Heryga/Ic0r5lZxFxPDrKQdEFJJQf4AbZb+ial+WqITIMR3ND4wTFUg
	kfgxc5P0hdgygBdiAlWlanibduT17dciTHWalBgkp5BSqIIwX3vjCo22jIb3dQEnPWEbC9MBGku
	lGNmyuYE8OZzUuVYV7y7Hs6eEJgzkYG3USBruYfFUigQ/1+ZOzBcr53Vj1qDfwGn//qg1LwP3em
	uZuUCCp6RWNd/oirQlaQSngoBy3douojt0EKfIe/wecg8DTNfxQMV5QAxRR7W9lD+sH6TBoj4Uy
	UURP7bOs03KHXI9Yg9RjXWZVNaACcF4yNDb5tDPpnuUwzAOkdKSCdTgz63MAG8XH/LyO+KQ/rVw
	J6vjPT7vrLT0B3Jr4jp9oDOvwv2w68Ig==
X-Received: by 2002:a05:693c:8945:10b0:358:c5c9:2661 with SMTP id 5a478bee46e88-36f77edb6b5mr1197456eec.10.1793929663148;
        Thu, 05 Nov 2026 17:47:43 -0800 (PST)
X-Received: by 2002:a05:693c:8945:10b0:358:c5c9:2661 with SMTP id 5a478bee46e88-36f77edb6b5mr1197415eec.10.1793929662450;
        Thu, 05 Nov 2026 17:47:42 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm1488703eec.19.2026.11.05.17.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:47:41 -0800 (PST)
Message-ID: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:47:40 -0800
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
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Christopher Griffin <christophergriffin05@gmail.com>,
        loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org, kvalo@kernel.org, quic_haric@quicinc.com,
        quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com,
        quic_akolli@quicinc.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        quic_mkenna@quicinc.com, john@phrozen.org, quic_gsamin@quicinc.com,
        ath10k@lists.infradead.org, quic_wgong@quicinc.com
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed31c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vn0ihEsipxsDDuCNlwwA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX5vm4R4XK6fM3
 g/JjmMww3dSYpTKeqTQ8C57qxCPn9CgI9BgcaWC9n37H0mMj7b4uMPFYB/ZXh4JS05McsdMKGwS
 zsk53C/7hz+R5Le7jA6WSOOyUx8p6N4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX4fel5dojkr5/
 6b6rPW6IpUofLL5qUxzfPOvwtGI9kloNJjM58rHVh+sh4QzcBdNGwBVfUlfkWktXMonujAtjdMk
 XrKsr9rYQAT3Cco/VPmjQiznzQy0lQNYMNUUpupsiBAXjLX0zqtl8YoGC7w5ofQs9k4LnHgXKd/
 EWgQL9Xb+NDF7N0EILjdsA4KFJRsJWQv2CC6Jy6rPjYsfKBl1CeSpT7J02n3U61yD8bG02MSIFv
 6UbhSW+o9xl2AbdpBbW8lGZhFYQpevCg4Y1LJsn30k7rY0GyGl8XbCoNF/o94F2AAlzzld4xSkX
 b74Rb46Et3Pc2gu1TaxU0l4lMmNhJCchEr/ZzeM5530ETkB2ToRq2lASdoZVmoCOP2PyIO4xyOE
 KeUekipRUNgCyJ5Z8UZ5TioP/IqvzCR1h1TLCk5THHC5GLurTs1mwUsrA6QqM4Bd7yfZe1JcpRY
 S5hPuHCgdI+KRmYkUZw==
X-Proofpoint-GUID: R2845pU0mVVA6P-57osjcp5ksaeW0Ru2
X-Proofpoint-ORIG-GUID: R2845pU0mVVA6P-57osjcp5ksaeW0Ru2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060006

On 11/5/2026 5:09 PM, Christopher Griffin wrote:
> On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain <loic.poulain@oss.qualcomm.com
> <mailto:loic.poulain@oss.qualcomm.com>> wrote:
>> It looks more like a theoretical issue than something that is likely
>> to occur in practice, but the fix looks good to me.
>>
>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com
> <mailto:loic.poulain@oss.qualcomm.com>>
> 
> Thanks for the review, Loic.
> 
> We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
> crash failed a scan start with -110, the timeout was armed anyway, and
> it fired after the dead radio had been unbound, ending in "cannot queue
> ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
> (that is patch 2/3).
> 
> Whether ath10k ever hits it I don't know, but the code is the same, so
> the fix can't hurt.
> 
> Christopher Griffin

Please don't send HTML e-mail.

Note your reply was not archived or sent to the mailing list because it was
HTML. I only received it since I was directly addressed.

You can see it is not captured in the thread:
https://lore.kernel.org/all/20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com/

/jeff
