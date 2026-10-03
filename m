Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605F1F91F6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988444; cv=none; b=FF7qmmBKwBAL0+sjQxLb9Oe1uB3v3lt27V5VlSc4TZSCtwMx4c9fUBTeanbAWjTb9zkiF6s0BxLH4EjZu0h2Vg/7Saui4ASYF4rSIS8fvX9dUDOpuBWBTB1Ep8mO0G4PhVg6ibj703QZueis7Wgtdj2OGZna7i/j7S/LWSlI2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988444; c=relaxed/simple;
	bh=C26BeGFu/zSKb6Hmjy5a7QFJNXyiI8Hp3QSh5M2tmN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyNo9weLyxYYaqlHKn+X1ET9ZPfKPsY0Q1D5w4PHvkpxNby4w2/PPkL0zwGyaZMsg0WIZ6FVosZVNEA9I2AtJZhcPYlpBZiL7wzptXPR1VaivFik28hjGf5Bboy9qWxPndwttGyIPBjK0BX1MG5VUDOgy40Fu6LZvskOuRt7Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr1roGXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGUa2GvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr1roGXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGUa2GvD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2to1503811
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=; b=Hr1roGXGGuK/2Ys3
	PgGl76KQG1zOxNLlVCnQ2ynxWrck/9kbFwDuLrXbMEb2JZ3P+GkDVCVtD6GPC9NV
	vRDCRvrluqIPbORvCQxCvHC9ZIONz2Oqfer6oJkeA1wqpf6y0jhSoqCNv0v8VyOh
	T2nkJSA2gffkn2OOJgRLO+bWvv+mFCZ0A7f0AuuIXi0hEisowMdToreBElclx/mC
	sm2+HM55xwM4X5FpHniNXskbax88saef40RNKwGDLuCb66h7ISmvIh2ZGyjLkAcJ
	wiOf3SqvhKfw2zihY3tHz0NLdY4OsuFdKaEx4vmYm3hiHvk17GiJRffhwbapdLEE
	WdorOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rre4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:47:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so14041185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988431; x=1791593231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=;
        b=LGUa2GvD72FKvgsKvqchBf0wsO1+3gElYK/o2NhtcSyo0eKd8D42y/6xmSvVJTfDH4
         XTNZj2PaU3EbdBPcZopHsvPAJ7SQ54hY4n+tFxEbdjmo2pF38m39QEu5UpRF06Ix+sSR
         XmWI6s//SCU72w+V8aN+mn6H90KieRMggBve62G3VDJX5l+gKYlWKoCAX776aKZxZF1C
         CF5yIJw0Y1lEIYYbXCXgWNarIY2A2u/Plb0FDTwk9MIhFsKNkOA5EkeY0qdnDNjjvxF5
         ekWOE+tXYrgRS/bN12fEDTeL2FeT+7cnAZ3+NfTMQYvxHfVCdTowpKnYoZVnJKKT/zTF
         skKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988431; x=1791593231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ylCuDOkn6CBYsIUnQC9b4yfcmzAwShqIqn5wRMueEQ=;
        b=h1Cc2fahzBVnzvlW1H70uZiF3irWTkUUZ5BtTAnMc5EXuLNsTUCm2YbYUFtLXo1e97
         ClMIRugUo45tXVv+tJ5MYcyK6ht/1ygU6srQexkYTYtLlsbT0dfDW2NnoI3KQ9VYa3hL
         raCTwX7xZhevL+F0LZJhS+gfNCEuxRhrJFBP5XdviJcZxtusSSFKmduHdvVfMJlgVnsZ
         lcdiowL0V5D/OTd3lE+zakOmq9gqnFArtWL5WplT3ol4fRgzkV4pl4/s9cp53QjXTmkP
         yiCcuXd5/leB8k1S5fJlZn1vVbp/CLNHhRHcjXzgD2JJ4c0iQD9chDLpmEvSFxRJMMpG
         EPHw==
X-Forwarded-Encrypted: i=1; AKwUvBzogfGWq47Psr/9s6o2Da9ArFVtw9fkmKvASwdkjjZhxy6duxBfSoUNqNocIv6OF5LeYcktpxHXhMDeNVs=@vger.kernel.org
X-Gm-Message-State: AFuF++mKTaFNJtPYGje4e/5es/z5GDjagEo0bPDYqsYj5rLR73Eylc4j
	ROkMlauLIhcm/KBfEy+I8PeMKQw6rS+pDHRxIdQCOfCGujCnIDXhvZ32zm+5ch0RymxsLXVRQdw
	zVC/N5stuvYKKKy/RJCNwx07lrDOMpR5Z6ctpDWlPsTxyYqUYlLoQWV0LRtmdrsSH7Jk=
X-Gm-Gg: AYBFou0z8ftO8IaE4Oj7SNahW04P049IIdEdop1Sf5NoPIwEm5ylv8/HVqWUEqdLSGS
	3LZlC2UkwkC4HC/+Y82UHYCEu2iCPnjzv9Gh9qydp36yFx75YY5Ke2b7p5lFaCHnapxheJYLDMW
	HhlAcQRBhh7CtvWrKZNDUrwBL1KCJq/1OGSpsz7HJgdDj2m/pVesaWhD+2GAxh/DLuVPsQdTNwQ
	CECcV8HS/iaWGZo2njmGGEyjSvY6CiYsdhBdEoch5TLDpaLjBsbc5INWUumvxio70u76oJ4RFUS
	txyZMSFn2WAbThMxF/hDse8EMIC4xbonprPIk2RM0TKsAILQM+FMls8E6hin49hTentW7HggjWU
	l/2+OSTM9Lm6F7U7kep2m/ZIMnCoOSUYVAs9egLiNAgWkKOLPSQZpVsUatZIoADM5bGKe3kApG1
	6B2/8swLlaLw4d
X-Received: by 2002:a05:620a:8804:b0:93c:612e:9b51 with SMTP id af79cd13be357-93cf18a7807mr872505385a.55.1790988430622;
        Fri, 02 Oct 2026 17:47:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8804:b0:93c:612e:9b51 with SMTP id af79cd13be357-93cf18a7807mr872501985a.55.1790988430151;
        Fri, 02 Oct 2026 17:47:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
Date: Sat,  3 Oct 2026 03:46:56 +0300
Message-ID: <179098834065.3641559.5174851000778073981.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac0508f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=NtFGmenAaefONujONKUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 6w-XhQSKmTy48Z3xL64q8qvun4lE8Orj
X-Proofpoint-GUID: 6w-XhQSKmTy48Z3xL64q8qvun4lE8Orj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX4OrHYEKNpiTX
 UDTZVTRzjBY7f9bgwKSAK/tFpZ1ziDGpZ1uvMQuHzNeiPZZ+MzhoHtmEyR2+lIXIF9hduwt5pVg
 pot1aRU89V+CYiyWjaHB7gw4slDuiQA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX6lHlhw9nzBWz
 TRkOazCBNOfsXHTaVPhbNxYcFPE9oiG0XL5iZZHT3CvTphOYDEQPa1m7PI4TghA5GIDZjv/3lOm
 WelG5OaW70VAlsvWehaMJRVYXkw0nZ4GNOxmFALgYAL1rEV4mIrjV8nxuV60+wzyM4CQafrRUP6
 YPC5pxD5K5Oup176taugwQTRc16wqZLv1KX2NidGcExj/QolxoKSJsqa6IZK1ry6GCpHflJYxZH
 xDJUsp04uP0dcp30MKwKibGAGRfTGD4hXiuKWxbOlDvymefW7ljiDWkHANM71nLNC3Md5RKYL2a
 aCXLiNTEyJvdJhpyFDk93Y3m/Y5fy8/UgWMS+gOjaBYklJ+l2LB8llr6nf99RDnFqr1AnMKAz32
 9DcADxkye+X9WKJrgWrto/RLYUBnP2oTNqm8JmkvnBhY2SLV33Cian/XORtCVPcKQ1TKRVLsqUW
 DYdDJjQECybVFs/fSbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030002

On Tue, 29 Sep 2026 12:25:24 +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> [...]

Applied to ttt, thanks!

[01/35] drm/msm/dp: move link-level teardown from display_disable to display_unprepare
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1bda647ce61b
[02/35] drm/msm/dp: Pass panel to msm_dp_ctrl_config_msa()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/642a8c954d4c
[03/35] drm/msm/dp: drop redundant config_ctrl_link() from msm_dp_ctrl_on_stream()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9582ac3ad673
[04/35] drm/msm/dp: introduce stream_id for each DP panel
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac12c30bc556
[05/35] drm/msm/dp: add support for programming p1/p2/p3 register blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/90bc95ebb04d
[06/35] drm/msm/dp: add MST stream register definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cb821ad0df17
[07/35] drm/msm/dp: add stream-aware link register accessors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5e4a3f7b2620

Best regards,
-- 
With best wishes
Dmitry


