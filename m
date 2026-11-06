Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979619;
	b=gdTJVuD/l9N/jzrMVDXlr/QhX8OIpxJ9RdVMFNRUVzSjAaf3LQXkGcLLhHSjUqE6dIvi
	 9DMbgi8NK9aVigokCyuHmK8+lE/pU9tjVJDR/Eyf/7rw/HZ+pZhQwAevpBHd4joOagFxI
	 SL8n9+dKRIlsRri5q0I1XXBGI9zcY2AcR6p824HsLvG4m4kn5yEg588BfGTWL+IyXoDqS
	 Bg0fS/rhlf2/JGMKIud9RyE9OZTT3Y9gtI0YqVcL6nD3GWI0ILJ9+CnqvIX4V3ALJR29o
	 DeSCHewW5GNnFJMpxIKfa68SIzX0arTTnt9LxFQxHidrC95sjiUu5ugmEMiIje13fKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=;
	b=xlr0vnK2sdOrNlrwQmlMV8s4hjQut2/bTzN20mZXpsZP3w3Irj3lt1rR/MAVvnKXoXLr
	 Q/zcCsI3NLiH7RP6EIieN1//pzFTXD3UGaLAxzGQD5LqyuCNW6A6FO3zlv6aOs4xH/fRf
	 5A4aOFeKMYUodQd03nePkP5Y5IqnFIlrfIV+M1CmnPUb9+BpLKk5TQS+ldCVHq4JO8CZn
	 S9ON3QEGsJFvnuAtyI7zEg/NTsKhUQq0e6bfiVqTgy4hMMxFoCiEYiO6uaki59RLWHKNl
	 HTdjLp3Uveer6Vky/TPH54SyGrB7hsQisDxUt7zNrlI6s138DQ414MY/5QS/X6zNYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ETlvFZcx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+R94mQk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A2606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665A2606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ETlvFZcx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+R94mQk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxTM3722899
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=; b=ETlvFZcxJaJbViQg
	s1Clz3k1BfRQ4S4/4cRR1kIAadFr0qPEgoNsYlsygLNDjsEoeM77wm/Hcp88th/r
	8wI2M8bAUQ1EorbRlwe99asSu2nCoRL97F+Taa7Tjmfu3d+9XXF07rWI61euufRO
	ViW6LkGvLeF1ZI/Pawk4gFyM7nBvaM7TCiG1/h686QO4ILjPl2pcbmcZ7u8grVAj
	iWnzzM3xA/QqNpq+JpcTHyekjVg7spprisImQQYmWUrMcgXsboenr0HkGa0CSf2B
	FZ7Puxmd+N93Mj6PD4Yp+Wh98ZdumTXu1qnyS2UTzcwAzPBsZbazi9srBNPoAbm/
	N6B0qA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9kcq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:40:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso219104eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979613; x=1794584413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=;
        b=N+R94mQkTfp9rDrrcQVCx90uwDppsz+XFcGipvLBqDTDJRVJcwpBrPgeICafu5qf/3
         8IqtAEpvthPKCCXW09PF8yc4REV+fG403kWvIN5Rtjk0tiRnxc889Adl0pTMQJheQi2M
         7WMcn/yNNirLUYjPiQUFGBum6X8dESAb8n2jKK5N+Vb/LUTLMs1gC4IaUKum34uL+bLG
         jUsy6VxcZDF7RxWhgvZk/ZuMfhOhFAuK3IFAijYOWuW7G205m+gFlpPJUZoGmM11hiUX
         1jbtSBJ3X3xwn/vYtDqZ3LnY9RyxNstGKG2zAprKA42XF3xL+fvOoC5k/YhmmqCKZULq
         AkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979613; x=1794584413;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=;
        b=Pe/Y6f97FCMc2v10Q8BXnXG/L8lPOcNhkoOEnbyIzQUTK8ABXcAETQ16I+BQ/n/dtL
         L97r+7EjCn/TpgJpYu51U4ENjr3zCSc0o+SSDS8etVusHX6HfA+aBP7d1tW9ipSt6prm
         QWaqQXsPEXcEArovwB1C3ttte1adHelo0A1QyUorvPSTIlvnFNpvH+uFiLpv6Ionjsob
         CU6YscgLY2Sg1NQ0e++Ey8lHrOMr2RwJmQDAlbMKPt7xirBQXWnLX2gWPaQHTP7QgKro
         fwqP5iZtmqkaCjh7zZ0HhNo0kwYMTmyHj21CSvZj/a9/U1IuNLb5WM44+eTIOstEOkbX
         BTGw==
X-Forwarded-Encrypted: i=1; AL+hErFyt3aKCkALkaDUTqT1cL+K5Ly2gUAu0+Lxm+lY3/v5bQZrpHbF2fAYviqSgxGUqAWlhPrgOxPOzSZvtxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ix5YoPSUhxPuEjrmwVszz/nNKs3c6p+aboULb2Fs50ZNfO0Kk
	18HKSL6U1BXUt/5e1REiS0I9UPBHxI/20BNWUxvSgbZo8z5QUQ9xssPWVtoDIEqh12Aq5ZLQib5
	9d0x3PSktau9NWBK5+FV4Jvgy9sv5dYTS5yDJjnRpMgINfR+Mc9bUAQ6GOJ2joQdgM/8=
X-Gm-Gg: AYBFou1YSoZkVK/6HAq/ZPDlagzB1Sq/Tpqpn+s8PfV0eC1PTRKCqzwaXCsoHSy3JgG
	yjuPhmvF7Rlr7ooZcwN5CV215ZGE+k81W7uSd5cEdH37yYpVYehTqQYrmqOLy4EFTE4r0MxJsSZ
	PEWdsmj2I9qtYj2Xj6JhjD0gxTGFx2gDZeZRbYkK9WwOY25y2YSfR/uKT3UUL7CDwTSBMRVd1Oo
	ncp6zk0kYCnqY14FVihMWXp8PdOl40i0CE8k15X6oIIwbCOam86UEQJTZdS3HCxL4/57KGCXbjT
	qbY+DCE6AWJ/IGk+zlW9nsd6qw6lZ9+BkjUdlIrauhnjkTaflfhM7w6lE24ctNgWaSuUHEpVg2v
	oCZWu6lHoSUcl7e3VH9ahEvkJBWQzJH24o7pppSP6A4haJdwz1ZF25KdPUoMKKbB9w0Nq3NaM3m
	70BTu87h5FlK41lp5KimD1sS1niNg=
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36f75b1ffd2mr3243553eec.18.1793979612733;
        Fri, 06 Nov 2026 07:40:12 -0800 (PST)
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36f75b1ffd2mr3243509eec.18.1793979611960;
        Fri, 06 Nov 2026 07:40:11 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm9851246eec.13.2026.11.06.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:40:10 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
References: <20260926114037.3231795-1-yaojiale02@163.com>
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
Message-Id: <179397961055.1195422.13808864180410221932.b4-ty@b4>
Date: Fri, 06 Nov 2026 07:40:10 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: -PfCxzk4Ubk-uAQHTM2x1OP9EGHG8a-3
X-Proofpoint-GUID: -PfCxzk4Ubk-uAQHTM2x1OP9EGHG8a-3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX/V8t9GZUDEsX
 /hsBkyl3fRD+ChVtQ/3Nn2TGlsyFw07OsklCqAj5TIhVy5xKhB+9RG1osYb31QGf9uwlkUGSFvL
 Yn27s3BcxSiVRDGNyxbdpFEnW7thWUA=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedf4dd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mSvAxenApeD-3uNJg0EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX+0MIVNa/BhaT
 N4n6YovtqWiklqycCYxwKLBDMTOx7p7OhFV8+kEQeOq9KAPH7Jxdc85lvz8kVPKbERJT/nMycwW
 WLr6W2xEKaQ7PU91s749II/67zutUIDvEXGSMTztnLciaIY3xL5CKk4ShN7NImK2hu03WdoN0Rn
 QNglnieTbCRqAKyM0mv7Wr7UOZEYJBsHE9UR3bXVtx9qnwUJ2dTCjAWDgcRai6slRCHLWrV3VZi
 EtvEQSCrW6fHpd6qqyt5WNzJkrvabDAyXMWGzSvOwYATKmL/Az3E+BbKwRhNJ4k4Qv+xpDWApkR
 oCM0n9l1ek9vQ8oo2xsWiXtLX2FaV8ie+sOMZ97c5do9cTvP0efgdU81yitYKjUDohurkeS1tNZ
 sCSDMENfiqG99tGZhF9FoETlKsqVddJ9FQLzseeOqIcH3kV6lUrDhocSISo9eKAy7wZq6HWmO/t
 nUGBGG7HZ6P/diMQbkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062


On Sat, 26 Sep 2026 19:40:37 +0800, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Reject short management RX frames
      commit: 9e15ccad0877c4a748bf2b817811a23f2d71bd92

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

