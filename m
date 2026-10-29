Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314577;
	b=rh+3BKgKD/2izp7SkPw7Zv68ZWIk7tZRAjW3+sTikw5eFuc+TbAzjGOCEhA+14JxpmYF
	 abId+2oKPjPA8JiOcLr7tql7o6Nh4vFMFcxpsiQ7CVM0LOBlaGSwywqf+dFubt3QRSdZ/
	 Xzw333H5wb6D1b4NWPphmGe49ol+FHPLzIR8U2O3al98ApWMvf5TsH9qD3YS6O4hgZ27Z
	 eT7wKHcI90JR+3cWkQKIr02fltnIaS0oiV/nkoc+tsUzC7P0pSfjQYQNr1Pun8dUGOzBf
	 mET5Op/6JJ4f5ne6fAqe83Adc8uLh3/IdKP8blf9+NSByprVWO7RvcjzLhlAcNKR8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=;
	b=PBID4VXu2Zpnt/DI3LORiIGbq0fj2wJ5MiXMLYKlKOxQih8cZ+YMU9bYFZeXKOB8CaHr
	 Wfh07KzK5wtpMocYaeRHBCAuwERy5iyEos+Caq4nigIAOFOlHVxitur2c6Y8MaxKu78NO
	 kUQ2PdLL1JGAgkLo5RE0uMWcg5+bY7yucilqlRT8uRiGsvU8m4S2rsIpjgzWOJ7p1ZslF
	 b85Lgqq6aR/wpoqteCWLRrmZdMbde0k13FfZySCo19p/TDAJ/LUHK1BsWeqm7HIysoiux
	 9I6r5LgmF92skG17qmgUb1dKrVAoai9mwlFtStDRSBeDTA/DP7LLym1v3ho8Zb0ae7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7t0Iq0M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8JZK2eR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52891606A337
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52891606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7t0Iq0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8JZK2eR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLbNth293554
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=; b=a7t0Iq0M0KPuZETp
	zeEi42ULnFdlMa2NRLNh2m6TDVKKxqYyp+MRNHEH9k+q0YU9XHv42iuTSsKXiaPu
	ptTjJRGK4hJwmCC2X3ks/keBOMclPrurC1UlHhVfl/epenH39L+zYhRHyFEOat0S
	SXLcKVhqJ8mVaAO9VxQgyXHFDYJam60YSahhG//nIKksNOW7M7ckKzijb0AlXOoX
	TxvcZkYjYwc0MhwiYT8Vi08c2s8x2B5rwHiVB8IrBWwajeTx2cIEcvfyNFX1BsZE
	nrjjC7/tHHEnRqbjdJWlu2wY8rVgekgdUnunPblzHtF7J+66x2eo5xvYmrpy9+RU
	PwfGsQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p08np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so306691eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793314570; x=1793919370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=;
        b=R8JZK2eR7i4D9BsXVF18eO2cv9TDmnZFXw2NnfLaddxKlS46G/Q2yIZ1SlwQXWchM4
         sf7joMGN1nkNZIyHH9UxE+rQw9hkrK46w/FEBfMDv0BzQfZMNpFgzilbmw2ZNN/e2qCi
         tWEcQSjl6+GBEjMlF1IaPevrpJPWTPX0KXit0ptC+UTvOwkCrgVdO7Ep8/YYdzDWp/+u
         uxwbYbms86XMvruTRkbZthxDRUkJ4y4nOYLjQTkSDLEDMn4JsRfpuIGyzo60zcyyr71B
         AxVM65O3abPWXGRGOl60VjxJsOrnh1i9AOLEUQZAKQMswi8MYGFq0C2Jrhsv9R+5cjyW
         hzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314570; x=1793919370;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=;
        b=iv67kxoFwpNGLJ7GBCCqPa+dyhWzfI63YgtLKJRhNE3sNdAYnt9dVDUsDvODkWHKcT
         7fx9WK9R+YL3nYzznR+pv/73C711ExMPF9XmKiC4jRRTAGblq1q3NeDR/DXW9cPwWKkR
         mxuyIUCOqSm6Rytv9jehzD2m/EwjzD3gLW8jjpxAeSrONAWlHWZN7hV6F7GeUysoDjAV
         DMhlCFz3TMiX1fzGCoHyhAwiYj+wh8WCU5ea9lBK4jbgvOOPFjOAIkZmJrHX5oxOlQUK
         433LewrAYUPi2moaIaA0DIta2lt3MWQU8u5FkB736JFbFI5MWqw+FNH4Rucg7tkCuLHK
         zX3w==
X-Forwarded-Encrypted: i=1; AKwUvBwmq0UjOpcrkGp6WDIL3a2XqovUqe3G26kCG2krVfDBlxZkJsHaC4qV2OThQ/18eG5CKSMZaOmP49uBEqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRTbdYqASgfRcWRjEVZX8N1Ue73H1DBjPG0abqNb0rtn1YDutk
	wA0h0yw6e/vlPW8lR6mdFjU6HX03UZENLWmm+NSGnMLl3tZgZSUqw8WXAonq1jZDFciW5cR4y3i
	17PyDqz4oonD1tGP8Uj/k+XU5KdN8nFXZMQa/9VMTHrPWsNcyr4IJQI0vwvQqUQX3rYU=
X-Gm-Gg: AYBFou0tnvIBxYSq3hgFDYz/8gSquZZPPdEqxHMPdleU2BU/F5XdyXnYWOIFu+EtOin
	YcaQBLzbnroVABhzP75YaPPFCHHTgC60D9U0prgLv4LdFBvFw73hFXSM2iLJMczaD5NB+mpDOIA
	HghmuFFhtlv/ACs6qS+7+J5+hUsAV9DKOWELQ//hBXDt8pUnrkWtNkPZfQjw5V84yTbjuHG+/o9
	QUc+iBCoJ4dAeppRZPwLi7lH7eBG5K0eq0pPXqQyuxdH4YrqTcXDqV9wRemncoFZPETMKXfydwA
	FEmFaBukHU8L2WU6FTFsJJpkC8jn6WNQq5vIrPuuhB5U0937s3RQNTuf+yGDN6IMmCwDHmeYapM
	jEmPCy0hFjGAkQopNEpJiaiWeMaX+/F+rTxFtJEED+g5uX8WjKhBpYJuKHr5WkvI84ZuCBKLweX
	tR/Mw3Ss9rF6TnlrkQirT7b1nK1PXx
X-Received: by 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr1088605eec.32.1793314569958;
        Thu, 29 Oct 2026 15:56:09 -0700 (PDT)
X-Received: by 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr1088563eec.32.1793314569298;
        Thu, 29 Oct 2026 15:56:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm1644278eec.8.2026.10.29.15.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
Message-Id: <179331456735.1083805.6096170574741429484.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:56:07 -0700
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfXwY7MIP9ikIRn
 AObOWvZXy40fa7rdtqG6CaAv87XzgXFS9fjdRLd9TYRon0J5WVwUtvdPh2CLxUARdIjA4/aBMvX
 RuHlMBgneWb3QgN4jYIL+PkAxll3GaJMdwD1Sb5siQYuXrIQUJE1a+ilMnvUmlLMmdIfvMALrCM
 ZgMxo9HUJL86Kwx5CDqt+R2IDK7voMVZ3Yt5+BggZLFAB3C5qSWq0EnnsI8pcO+UCsTMF0WqeTr
 AjS4UJVDJ80FJXkGIFcowkEx5pAQrIzzbj7bGygkD4Xrg0mqYYWw+5pLDJwujMRnnDvfeXKEyWw
 GPTC5dnIC8qQiIFvg6tn1rvEOBuBF1d+6u4JXUd6eZR/9yakid8e+3TqR9UMxoxaQAdb7ITo7Az
 Xi8aRE2uANsrirsMc2UthGy4j3lC99R04BXNcsaMZkWjrgF6jQFJXhnuNxBGULvsBqkPD6qICfM
 7Vz4GtgIZ+uJDInvd4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfXxHw+dRzWyKJI
 YJDf8AYz8bi729HVi83gg4eLNv+2/lPsTDgcrXTzadGjEiW117CiIWxCjxT+8rgiPt8EBXjog33
 lhuTtG69nEeB6PwpcWtmNLZb8gnsR78=
X-Proofpoint-ORIG-GUID: wmeKJVmcYOsPJK6zoikZvuQB1bQJufVe
X-Proofpoint-GUID: wmeKJVmcYOsPJK6zoikZvuQB1bQJufVe
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae3cf0b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290090


On Tue, 20 Oct 2026 00:52:50 -0700, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: set MSDU payload correctly
      commit: fe74d991f3387febfd57b65c7383d2d49e14e19a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

