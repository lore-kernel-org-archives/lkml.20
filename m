Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797412;
	b=QGipDNfBkvSaMazSpN5uiUyfgE2ot1D/ExRTMq6QwJx0J5YSDxz1lg3oaLeGarQpNlnw
	 IoHGLnQJ5YArQa4yVlXcV8wePmhmvFx4Q7++spKiPiatEUHh0BWkVrltfYN/aCkEgRkvv
	 a0owv6F8U4xxJHKl8nn1F0wlw6J13sLtIDpQ1lKLGBlG962rL+B0X+KJj3PlvE9boonT0
	 y3gqKyEGZlXznkiVsubcjK9CYG6F0AkSXHAeCJpkanu2CCEiAN3u1uqFrGNUu0bCIt4U+
	 1OITrjrGYYrbltExR2qqrYXUQH0A4tTDcnaDkfQrvosFtilTOjFOn/LoRsJCkUYlyPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
	b=RB0qBqj1F5Pjgq9XrNTD8zqhvukvTnEjusZkZqnvW1xegSNzduu6mR5HCSWIIGTensb+
	 dKtpQMLTF+fAP5rbA58HsiBwx03o6FUNvJ5zEM9eAqM58E1iS3lA8mFkwB4sUFJIMXHby
	 27JeP2Rk3Jn79e3+mLsaHyY0PtwT8MvXU4+9+H1ZI2VYfxjfKaeOdVr4rZhRrazL4g2mu
	 NNJxePdBRBoWwwDpeLiB4IIFu9mubmw67eKKf04bp2JdVm5fI5J3b9nb/cZtEigrQECm+
	 a7wRYmdrGaYFvaiQqiC+Efu4e44seGsTByVFo9YgIgAb/LGkdC3HWJYymCrmOHCz0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjqKlVSn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNj7W+X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEE0606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjqKlVSn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNj7W+X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv0qh3115959
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uf/HLf+gvCGbaUy1xNBEudLW
	qzzIfdykWFA/o6PVAmI=; b=SjqKlVSnNWlW0GeO05ZZwUu5Gn64FEJ/PwAiY9yj
	/Uj932ookfMP0o82G/ocYnwE9TORuDtPZl9rEP2LsXaVA3pL3ctdny2fqtCW7H6x
	mB3N3cIwLZYVK+lPJMGyzo29avK8B5FBzJ5AUVQ2L9cjA6c0Oa/qc0gAJEXv529a
	5++WWU+Rf3WgOnlP1KavgKZ5vAEMhUGDaxnVWutbdGRqrHRj2Jd8V0rJ4txQvS4K
	Fh19n+dfrwy/QH1R5GTayplUsueHNY7D1n254xzAdw6ihq/32OlkBbvPiKAIiCyB
	LNq3+e2DStPLjpoc7N5UAGjEhfK7bnGF3cu6eaoQk5vN9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt8uhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:16:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so263067385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797410; x=1793402210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
        b=BXNj7W+X8YoP4Ot9Y/kKHsLsZgkqoZ9el6UAb2t7MsLGEQLtJ/I1x+3OEnAAa1zdEt
         brcqNrVz9UKhFwBkQBWwcRBJVlpC+l6slHh7ap/asFyfvSzyGY9M6gLr+XHxTc5tw+ix
         tUL+ObsfkItj5K6G63PgBJ9TaL6YcIIK1q7Ccoh80AmxJ+q/R1sbGnSgswKVkbPl9M4f
         b+DEDD+LGhy5j4o/pioLh/a2q5MC3EzRq0YPhAK1orvUQYrS8IvS0Nb02j5d/jNX08ek
         8A8J3deJegcTnBYniDP74bOBn/x4O1H1mFABXVZK6o91J9bd7Dj0LoCIN3mQCZ6gXdZc
         Ub3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797410; x=1793402210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf/HLf+gvCGbaUy1xNBEudLWqzzIfdykWFA/o6PVAmI=;
        b=Mi6N92BDCfmxctep7WxrEzFdSdnE8As6iooVli46X34XqFk3JILelxum0zM8/9vy48
         6wkhYfAJJ+ffctFXK+vtXlIjcUJCevq8FfnwIDCdi1loWU33ES9WAlC4Stv1otCAOm8u
         w3CP4UpfvSdKtrMHZj9x5I/I9YGSeLTgpGhwCG06asF7YdOVG8If2DE3rRXY64uX5fKE
         QOQLLDfghxZFLLHchvvUKZYhPIiB324V7I1PLg8gaMhqjHeYQk2rvZ1cTrV6CNvn8361
         IfdS+vvq8D2uQwxfKO7nVf2kXUFLbYnbY9sslDUcwV4b/pojPns8Xa8UkerD3YqJFqKJ
         /C2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvCfxpSAQGqWiZs3qEoFs6aTaLC00LRTBw1VoMK1Ks1XkLAjLEyr2EGrWJ4lXMx7gpDV7EvjKyj2QbUjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2J5jC4rPSP3m0J4Wmdb56UuYIy70r4jVdFk6bPnJU7VvhvvWX
	Yj484HkcL7n/E5jhEDRRl/Y0WyCxNlr+uNqha0JoR6dXRp5fBYQxsiD9TigdAkVFlkM2Uo0th8H
	VqDgaDsK1ch5aBG4c+pP0sojTdQYFlCsvjBJNfYHBFEQOySd/XENgruDIyH6s+m8gKUM=
X-Gm-Gg: AYBFou1jIacMpXWiadRb4EyxF8HEDVhsa85YoCxi2OxEjW0d7b2HL+JZoGLpmh0Nfiw
	j0PkpiOFov0xsVSXCGDd3Gt8yYD+scRauQ9Qd47NMTLZAgxsnVnc5RJFmpYE5MLXasMXvfiqdnJ
	fIO4yB8Ze+yOj6o5Z18fX+gxkKOVZFU+51B3jvY6hH5Kh9mLcDPxsJCEyiPwBlFM1VzLE8L6np8
	9lCjgOOFkTn4+yqglFxP/573w6dOtN4TMUAzDKkgZWMHmvdY0IZA60RuDsYfE1Kk5jrbIvA3RPv
	25GMAIttFbpiKbjlU9fSfWOFpwCAjCeND87tJrf47BgrF4mwHcef2NHrXaxDU/HnwkoRnWYCCqG
	SoRyBRiAyBHY0pmMVvexoXZR6jUIP7fBqNVS1sg/h0+Wvoxiw05I6ptOZx6EOO/ixVYSf+/WVEp
	FDh1125TTtEf64
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id af79cd13be357-940ef931614mr82906485a.39.1792797409787;
        Fri, 23 Oct 2026 16:16:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id af79cd13be357-940ef931614mr82904085a.39.1792797409401;
        Fri, 23 Oct 2026 16:16:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a493b6sm955911fa.37.2026.10.23.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:16:47 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:16:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: linux-bluetooth@vger.kernel.org, brgl@kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, lumag@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH bluetooth] Bluetooth: qca: Fix the WCN3950 NVM baud rate
 offset
Message-ID: <phkghjerfiho5a2tqzuckaraacy5mnsgnfwfqfqonogcl7ctkk@pekseqogr6eb>
References: <20261021195112.41138-1-me@michaelmcallister.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021195112.41138-1-me@michaelmcallister.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfXxpCydrkWTiQc
 EhVHTBKyk25aBSb8YXKk3ZORBtc6tiEi/QD+KKlgFXxetsE3iNrAF6xgybpuPBWuJySsZFDE121
 CgYlQ18dewkM+t5iv4Ku8+QL+hXj55k=
X-Proofpoint-ORIG-GUID: BxBzk70W04v8qjKjitXaBNZpeUe4VQm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MSBTYWx0ZWRfX+H0hvk6v7KBY
 W2tOHvOH2hkRh3Mdz+bk2DG3XkIG/8D7/rTsn5i0NvYf8QHyHG0y65yupfaWYPxqYPKXCdTwUZG
 TQagcdJkqFHVNHnf7gWc0byVbazcuKJhNjKEvS2OVbl9Z1ib0pq13qhigzx0Rim07TsqWzwTZZD
 e8k2GvDIbGPZRSw1BtLv0shA+rwvLe3S5sJliY4D61rlUNbfVXl1LAUw9rKA7qsa/5+IToQuy4R
 wEWfEF1N0RzVqixZnWEZftF0YkR492vfQSTf0NygaWqFPju5LiGtS9yXqIDvZQJyw0dDQ7JitE8
 ar58+JSosBEPHFc03CpPvu99gg2KiURXwJ2fvXRnQlMYPeogXGyh16Bz6lIT88KNjfn6eO6CuGM
 yuSozpR8BlDjtSEBDHo0sIU2Q9tJcRgUq19s2wuTr3oatgrPkgeyaHWPJy63GRE46Y0CXZgCUMS
 4yn+YTwRz3aSzvjoikQ==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbeae2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=RX1V4Qf_SthgjYcjEs8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-GUID: BxBzk70W04v8qjKjitXaBNZpeUe4VQm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230091

On Wed, Oct 21, 2026 at 08:51:12PM +0100, Michael McAllister wrote:
> WCN3950 uses the HCI transport tag layout that stores the UART baud rate
> at byte 1, like WCN3991. However, QCA_WCN3950 precedes QCA_WCN3991 in
> qca_btsoc_type, so qca_tlv_check_data() writes the baud rate to byte 2
> instead.
> 
> On a Motorola Moto G10 with WCN3950 and cmnv12.bin, configuring a 3 Mbps
> UART therefore leaves the NVM baud rate at its default 3.2 Mbps and
> overwrites the following byte. Firmware download completes, but the
> subsequent HCI_RESET times out and Bluetooth initialization fails.
> 
> Include WCN3950 in the byte-1 case so the NVM baud rate matches the host
> UART without altering the following transport parameter.
> 
> Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
