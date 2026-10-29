Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266757;
	b=UeY35JaBeVFfHVph/I32ZoiPT2XESLNxHyvM80+kS9OAWh8yPuVGwU+OgZo+YuLyC7lp
	 JlZhnuCvVFy4JLtfWAplmbQulOmM6jqD0mCqH4kqtsbk5kvRva0EzNqTOEFd21uKCEpVh
	 bEaHBzodCNHxf7a9bM7lfEq8L9IkRNPHfZWm4cM96jaK57cB6++USug4XqmUACN0YkXUA
	 0uOWr0o0MhCBkGeSvcP6NzePsNWNvwsuDKRNpopNXmc4oS3+wOTMQeomd79rpechhHyVw
	 mOfQfEi5BFfYPJdW7TsUiusCL9jva48EseifzFomHSd1H0PGlGKvnXcb3GcSOeSflsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
	b=5Ycy0QlMq+8hpl6I6SyyR8t2Bkrc0MInZVmZnrTB5Cf9sYR5L0O+hnrqShDYT6ImxmgE
	 fggdJzvxq+3CILAcP/GtMuRKxPkMLzyGp0LZZYhfEjv62dSAUffyEg+5KizJRQRR6FF10
	 jR2IXK/oGpPX2TQhZ0DUdsp5CFYqCZ6AJPT6mFP9rhpjmyzmL+N42OnsYy0x/KvLdVPDM
	 ccRtAY94EXKJBuYQtqHLqJ50SWPW1T8lE4wXzksDCz157gMxWAW8oL9Wk6Zuf4AY+K76L
	 uIwucYIbVdN7x60hudhjCyJFovRDiGbG38tM9z25V6c3c/qRtzrj5Gj1q58FkEDT/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC67606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vAhr2273168
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjSyk8ABwu6
	/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=; b=lwbdQ80kSkREwFe1vR5ZX+w2oyM
	6lSga4mcLTHgPt84OXBskO33v4cAcbYVpf9OlMS7yDBQ0OEB3FGRIQ9Y0CNO62d8
	E92V+i12o480B6HZJqreNcaWQ2ulnc0P4BhZa979Havdsu8CHCpaXl6OTvJGz6FY
	VyRwrZWa/cs69gzjYuunoqRI33SSi0YXlxHaAZKoqmK1AqY9kSigOuePBwiW1r7H
	2eHsGnRC4f+HXE5hxQ6nz2ox17OgubFgR+yfy3XrcAfls2kHHB2PIa8G1iI/MRKd
	rW7qdSRRHyewioClQdgnoO7qRP2Sm7cAIawjrK0nfUmkog35/7kjIh6vpyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b067b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:39:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so30387695ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266755; x=1793871555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=FrAxNDPjfESlF/MjW0eUwuxt4NXu+OBME4mwhBetE7UcNIzQtzrNFItPgk36u8WmFD
         hFVTufa9oJQbFkl7wIMhfBL49ysidE9AN1Zv+2THQ6tFPF+g5OpnmaKEeZ2BZm2Tp7qd
         UO9Mio5x5vhtnXOwZgP73g5LVdGyU61xptjd18BkOBymZcW6j/u2//OPKzYv+oCobbtp
         f3B2QOsjRJChOPwQh3Vr6o7UzZkFtSyzq4/fiR8SiXEvxDoiQTjCl026OJeEJW+MKbWA
         uUzx7paFpTP2kqDe38z3t6JnVcSi4of6Q0w5NTgfvBWDaFOdPb2HoZ5bxQNEglK4eIOy
         N9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266755; x=1793871555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=QQPQ1ihEmSHdS1D728vZoHm+fOf/rCop1ehFxuUcHkBMvF+mCDl1DAM/6PMwwuGbeq
         OtgdX46k/p3sbn+ywkSLTa0neoEMvWl50DSfe93hCn4NgVOt7ByCpAT/JaIpDRqlA17Z
         8E3xc+ZyZeD6A/BCgh5TfIJi1FrKHP9/riAWRLYUvpmORM2R2SAVaDSPVrxkFh9tlI76
         04P3uuZA49L9bbO7m4yACNvCh+Jm+fITxR4+64bJYgflDqvc1SStIykx5dLSp3MBGdV1
         3gJM88joLUBe+lCXn54NptuqBvidIILHlI0SXEnBqhSj3U3a19T+ohmEi2WibMR+v44H
         F0hA==
X-Forwarded-Encrypted: i=1; AKwUvBzgAjQF7bJmqptrfgjyhb6MXnLco1QW4QEjoaA7oozP/LdzBOFRwGV73U03zpH7r4cwnl2yOOaZeud3m/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEROfCN2A7tKIY9/AN//x4rAY6hLtiTKIvlLFmoTPM+GCWCpSt
	9o6hmHse8gDgSdLLmsz3BrMrJoHjJ/Xygemau8BrAvPrXq2bEg3Xm8JPpKHs81SI+RXBcOwT0Xy
	vQKhRvrL/MFDC7WRAK90qcfZnWNjvZf6WVomaj1iVNWbSb1mZJcedxHIl6S7N2UC6CQ8=
X-Gm-Gg: AYBFou1k9FM0IyHtbyLHMZyKy1CpRddoOaku6Ph2CbuQSc67o33vxWdmT00gTNk1fnA
	frAmajx29Sk6uABsghTYUM8CGpMJKGPMnaWuvUnXBEaGJAKxLTRPUuuAsJ+KA2yVeHY+UxCN5fT
	mU5L09HEK8JKVUTxyyeBH9XEwqO6dnwQDWopGo0zzzWOwR9Z3tqlsL3cgb1g75w06rMt4yaU09t
	rxCCyBf5W2Sh7TF+mORwkmPR1bY8RPA6k1o6rm1WvPFZijj8N+4sSgT5EX+C6VSeWNt97ihTBA5
	KLXtEy/eqRslWQfOWGc0m6kj5RfWdK4feSknVlbhRHp8yLK3k0zGRrfflO7FKN0UmvXnmHwTCkK
	sq/g9YAjeZ2say4ASrpUjlCi0T9bZnyEM2wmXMYH8YeQls/eAKKYJXRLFK6ONwenH+dIrBl+P0Z
	xYsk9+TgpT5bkdQ24rqpiaDdk8AGn34moJWDLLFzCF6Jq2RHGtcqx4FaektB/cpbuc194Kmw==
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433285ad.10.1793266755009;
        Thu, 29 Oct 2026 02:39:15 -0700 (PDT)
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433115ad.10.1793266754588;
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm31434715ad.65.2026.10.29.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: konradybcio@kernel.org
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gopikrishna.garmidi@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 0/3] Commonize Glymur regulator settings for fixed rails
Date: Thu, 29 Oct 2026 15:09:08 +0530
Message-ID: <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfXyJHsCHUmzjS3
 7+E1qsHY2bwPAD+JFiq5s0+oYB7PA6rP5OFUn8FRMZ0HBM1AueOJsDKZAicOlOnt56TMAAgfQNS
 JHcOVWGeFssLwevDy8t2jycTJIKbHVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfX/TgqoTTf0ZIY
 4aisp25NDoKHjutKaJmNjToNRiIygLkBPTawwXIsYPUF88Qmjlb0U+FljZhb/chMz99r2/2xn0v
 WCj1RDMj1punmSrNa/qKoETjLwbbZWPY3Hb/Euniw9tacmi5d6JpoluY3aLm9L8KyQ2C54jRVLa
 0c7O15/WwpX3UHGKukIq/dEyVu9lpYvWpckOgVlMy5qEPK21viUBZk0tDObCFFHI9nwDE75li6+
 qvBXRXWLY3oOb9fLKjAWRrMTqxneGY2+VfmEZ3YwhlMPMMW6HZYBPAhRMLHslTcJLezNdAMK49T
 MqpwqyJlaZRmqM6aSDUgRoV1ziXds9jvKH/Z1IOanK/w5c11JWFqFHuui7g7nHfqzZGFipDE5Jd
 3lmsY7c801GDe1RBD5shvL4j4cdY5XXia+fPvwFmgHnBj1d+0GN7gwViQbeL4CRjm2EtYNkKf4Z
 C0scr1VDmZec5N1Kb3A==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae31443 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E6juKWS7BAkPFlJObQUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ZCQEZBqxPAzxx3rO5jj9TSshUgwD3y7f
X-Proofpoint-ORIG-GUID: ZCQEZBqxPAzxx3rO5jj9TSshUgwD3y7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290037

Hey Konrad,
> Certain rails are predefined and will ALWAYS have to be the same for a
> given PMIC configuration (due to electrical and other requirements).
> Factor these out to remove a layer of pain when creating DTs and let
> one have a better way to reason about the settings across the platform.
> 
> Glymur-SiP will be the next target after/if this is accepted

This series conflicts with mine.
I attempted to rebase your series on top of mine, but it didnt apply
cleanly, hence wasnt able to boot test it.

Link: https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/
