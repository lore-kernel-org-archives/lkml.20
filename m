Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D763B4432
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880681; cv=none; b=aTrdvANcjEdM5GU6Sj/GSfkK8uTgPIEFHWZ6PpvNa4ABILm3Yi3wizp+3gBvDfvNz0fi6fJaD9g5BWrEJZ27w45b05bjabkR6Xv9OUe09IgV0Sg+h/0CjvIraJYRYeH8HIZdRkfSlzB2MukA5qnfI4kgHlVRpZqJ5aX3/05vOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880681; c=relaxed/simple;
	bh=rF5sv84ctLmqd5y4HVpRAS+FDWqavUBsodpRj+ujkhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIstaL2jnpgI+3v8YnIpgV4mbs3Gzp+xFEvqH8XzSYPo/xMRhylQJy10j7B6jnP3MbLW/ye060Y+w9bI5XcLcCrLycDvpO0eiDznJx+28CP+GpnEmr0AbwUhO3VJIOkCqVw+ukGe9UU50L4Um2MBzAHn/0emTDC5f45Bcoc4lnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aILVzsuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRUvOHof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aILVzsuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRUvOHof"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8MFWW924262
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/WeEwiHeFEl6PiN55KbmIGGA
	3/MPUVvtbXAitA+s6jk=; b=aILVzsuLPhVbKd+y1q9fECGgcSvy0GGsIMWj/Wjp
	IM0WtnNS0DwKDic7LJTZDnVDuypa0nV4zOtAeCji3gJalubR0AiujF0BpcnH4Isx
	heIZ8KiC9VDYooERWv78FcFP7W6GFogtoE6arvUUEAqBRUSpW/WOExfrJK7T/mBa
	sK4/KwCCJDZab6zAaeuIkubiRq4dVxpu6QuJoPXd8RSqbmVeL1C2EoHxA1fsohuc
	ch6z8NWt4Tz3w0/C0DDe4nJ9luekqm5L8LgHOvLUbkMCCnDLJgysqDJ/akLW3CGj
	hjLlkoN2khzaLnNw73bOg/aP2RYXJgQ7FhznRmdPx/ytbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1syr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so533999585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880677; x=1792485477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WeEwiHeFEl6PiN55KbmIGGA3/MPUVvtbXAitA+s6jk=;
        b=cRUvOHof3cHK5+tbagrgUxiATXSc+tLveRNjEpZoD3YrFNCH1fxB+r/UNj3iEa+gt+
         znGNUjsEjv5HSd14NgkNtQpGyTazOTI6VCtRKXkpL9CNHjFTCM9ysPqq/5iQtbhbTsxo
         X/o9pmNASagvx5P5Kz1z4Z8HdTXZ46ffvdyj7KFBZkch380dKcptKr+olt/SoyamHGVm
         BIJ8hIYEaRLdQ45Us/AwRWh6fdkyToHpHFWdkxQRXkf1UA0cY/56f+BojgJzLPD4zHNd
         ZRh89ZJo2pehrjyL5/+2CN7m2ApBBxj7z6Umbxz9ihtiYwpU5lvzqEzpW7Y6cj/opG7i
         1TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880677; x=1792485477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WeEwiHeFEl6PiN55KbmIGGA3/MPUVvtbXAitA+s6jk=;
        b=eyNiNdwjUv6UHAS+jMYbjiUbftZEcgvMCJMC5CNHmS6r1zDZIdj6/aBXTa+X+OQQJM
         jE8xpax8kEKXzoYZOPN2Hoi6Hj9lVqYBOBB9KXlUtR2039Xj1Ys5nYgnQP+ZBC1sYrnC
         j1VQWtH+HKe0tIsN5pbqzYxWJ5J5YfS5UA9hJIR7bs1Z8unv2Weonn7D8+GNxfAdF5cp
         /Y3IfYE/u7eCDaRncg/xXJNDFUXbH5BaJz5/ey2UnAw0Wvn4TaJAl+0TowwYbhkAOr+H
         +MrtpeQdAULLA4x+DzZPiF3zncxXe2HufavelX4Ggn0i7WaguUS4T/uxEABjAzX970Oa
         Mf1w==
X-Forwarded-Encrypted: i=1; AKwUvBymSy666TRpggP7xh3sDMvykpmuaE0r6gC9ckprqjH5bOY+EM+g7gjthI7yUyiJP+LcMk4INvP6dcO0WVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcHPBheyHFazW2Dn5cbuZKMiEgwYjMt36cQZs03KlOsjoNNpgE
	PmIzVXE2NWG13fbrdENmH3anLtKNEpjxnrSTDHZnNkCV7vc3E7M4pc90m/aE+1fBJdStm+46Mvk
	XcDjMsdU5qct9ZXC0z5wBgq18fAbPe0EB66YKybMc75GHhJKeTK0TGCfxgnWwOS7BWyiPZNkm1Z
	Q=
X-Gm-Gg: AYBFou0FkIhRIBpSJqmOzfFLdgX4kh+xQJFFUMKEPvQJjzCG+IUY3UYs1dSP04j7JlI
	tHB+nW4plCStkPK7D0Md5l4qWzQSivZT6TtlwbWPgQWlgsit8lgmvG8PV3+wolNCsPQVafKk9i+
	hn7upx7LigQ1qHjB+wvZQBmuqbjWIp12qgX1utjyou33vsa4hcvSpT/qTzFufO4GJdPQN2SyxRR
	fw2Wyv2/fLV6dLSWg7MgzruZSdQJ0xMg800rKVgfjw2Rcp6CiqVT2riVFq6Ja1RCGCruYicONdM
	1gf35wdrmYaTIiKoNUaZ8hNFMBc5mZVQgCeU/k4+LGzWnD7lEvzCgci26DJmqDoGgVq7Ukwbhum
	FXZLvqG39212OcGI=
X-Received: by 2002:a05:620a:19a5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93ebd1eca74mr1859679085a.26.1791880676649;
        Tue, 13 Oct 2026 01:37:56 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93ebd1eca74mr1859676685a.26.1791880676040;
        Tue, 13 Oct 2026 01:37:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm3675578f8f.23.2026.10.13.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:37:55 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:37:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <n5g5pjgso5jdsr4hk22ezoui55325oxkytnxzq3h6wsk7kvgd5@qeogbpuo3qx7>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdede6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LP7z94PLUN5IiuC4UgYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rxHSX-zy4oePFgKZWUD2ufCkRB5Fkvum
X-Proofpoint-ORIG-GUID: rxHSX-zy4oePFgKZWUD2ufCkRB5Fkvum
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9n7/mfg3OTlj
 GjzHESEXHV9zp6yD8UylvdYNFklo8PRUuVPLH5cMAKkuzaJMelt1FaUPeNyC8FKzuu3RTHHX/bc
 mDU0Hoi6wGivTV3Hlrwc1CSGzCy41jg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX/WDg4/mHX7GM
 Z9wh0f/Qe/agw5xgriJrDdHF/Bq6ZbcElOBa65zaHiEVROfgVfZ/6xGcINYYmIwOEDiR3HVnalO
 bWKbxpbHB499K3xsQ6GIoE/8tQIswW+pR9/taGCjadK+Gx+4nvuSxWLYqz9oPd2p2bqCBayHuSs
 Bcq30ADqd7vR1GyOoiRu7InlNhoLrTT+gFNAoOyM2kBlt1GVO+ZRAtF3RXgUnjeLUwr0Md2Hz9K
 Z7q3BuutQQFl/qmfZklpQ69Bi04fbk8dEjKaSoF+Nhx/wc+QlL0/7QlxIvWtepbbgK6+zlHpP6w
 ExT1BPVOwZ1M+UBFUSwkMDtnASej9gUiAQdS9nXe71bcSCxKfkxeYl1OaTqjmvOmlfgBjRy2pSE
 uyO4PLNbXaefk9rYlFMljCkqrH+G1wxtKcUW3am+9jpFeAZZx2Xedfbd8e4NPc3y3bJ+vMZBBnY
 ZcNlfbql7kudQmYXY0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-07 15:35:49, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
