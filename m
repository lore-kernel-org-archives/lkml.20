Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980875;
	b=GYE6DHLCfDfBhtskFL8A873H0dJnCawCI6ISGmAUT6cb3irBX4PNc6vswawnzzrfdJ+e
	 dvUin3rf7kEb6Mpk5uOPopjrIVolApC4exVO98+VHAiSqzA3zuqmGcCPNjKEHYdymgj1D
	 mRatZsuLo8xor9tk7Tche4wQ+/K60mcWy8Fz4PiTaum6FXgptRJX1Nf8X6YvxBUEwHrve
	 /VTqii6kT8ZVZKLiDdRnn3ULofzppU5ZYaC4PF4VzYGJo+7xijVP1fAVFUebrxjnuBtWj
	 99VWAQUaP14yg57Ih120PyXLoMQlVbEpRrJla5JoCWooPohvSaZH39q5ESDL5CN+pYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
	b=scdwCfC/xuFII9Canow+c6fggHEJuzTtuYgKO8CrbNr+mP3t6L+yzOzAcRe3/dFk274h
	 i8x4YZmo3IScOuziI8XYO0flbdbEhexT6WACIkTd9X++rH1KcxpuezbdAvANdJIikE5jZ
	 ZPCbAAE00F/x2VpI+RYyXj7pCnHDmZf2aOz7ZrKyicezyMyzCN7PBPyfsq/Ti32WQ08U6
	 rVqdkia3lOQFMLdKW29+fyuUah6GEMJ5HU8sCP29EvzUwAwPyG3nOCRUCrSOfYgdiMN4B
	 7Hxg51bm2G+qNCbr2moug0NdRSofA9mPfuy12CIzqYd2wFw88Hh1w9avj3opNKTzpOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEC5Cqof;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaSCeof6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31423606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31423606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEC5Cqof;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaSCeof6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExtTr044155
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=; b=QEC5CqofczzFYdiT
	Klabmuw7jmHLhhS1rjVfZkdrtbWxQJvK3fnfwSPg7n/giJ9UKzM7wGsDBHRKZ5gE
	XBy2QquSBjF2VRj8XvV2un1l/wzJyAQmCDSWa+yAS0fAe5YuiMCX83gCdELjcpjk
	a8yOQFU/octofu+Gm68hmhp90WpOMgooB3GksyrzoVGYb/943kKeyvX+Ine9uy6o
	8UxVrXGfpS3SViaa3haFBu2FJW5kIyMCUZcrov1MZkMC1PoIQ4nWj0m7PHLZEukI
	YFSmkPPN9s6OU4mOxLeOh15oYAaweWtpEgPP3vX566fVko9MtWapGqdUR3nSXw4J
	/kwLqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3g2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:01:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso1614231eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793980874; x=1794585674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
        b=LaSCeof662CO8j77dcpAjNnnmYOROwSt4LFOaOazzJoS4zlE9HdSXXjdaqdmeYLxIE
         JxSqrkIXXZdkhKDh+7Pm6k04hoibVCWiRpdEAUpFLjm2HIEX0crlTU8xTNxAifV+9tfy
         Z0VNYl7WjwPZOVRmX1V4P9o1/uTAO0FiJRVGjYmxzXZMEsR2gg2/HuAA9bJsWZgBLt3K
         GgzRLV2Z6hiTesPBB+1ESh1YxOX2O10MkcRdjA4Vmc6aGyzwRB0EyBGUeuKbUDJY8Gzn
         8TaIt7EEaLccGnMGCuDqGSTL6WQsZZ3aK+KND7onltK5vj4LknXNMhV9sopGel21EHsR
         /zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980874; x=1794585674;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4shQ3DR/ZJ0GAB6tttMcp+Ec4N2k1PGmXpuQWgxxLTc=;
        b=cHKVIup9vRKN3bVwrfQMbQ71HN6x5qgIT4EIcI1lsjv/+w9vgw+Wk1ZTBUe0shcrDG
         qwGL4aHe5dXPB8BZUehGP/hKgZs/QqLdFU5Lhxketthm1gQTqzPK/A0JojXfUN2yciJY
         coidyI4qiVCjSAuMa6KWu2s2vT0d5ibA3Ez5RJqTGiNzRQceMS3x3MlZkKpJDtul2OXs
         SLiMfmXKtSsmT0IxNGug5rPNMu0T4f5cpQG18pitRgVGr06RXGhL9JJBqq+fSkk9mUtl
         XmaSwtiJqMWdRhuEr7zeZMCxaw4/dbsvvSFPCeT2DYoIrCA68YKQ73kI3i43IJ07319E
         CwbA==
X-Forwarded-Encrypted: i=1; AKwUvBznw8w8YJjDBptRIzpl0pESRM0k17EEktoxTc1qULlNHVcQscxInDS3kfa+BYA4WakNtD3EDFLkaShkoQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h0afTAirLwTodj34OQXaXLBvt4zs/ruOrr9GYktbUW1wJYGjE
	QTLE7ftYtVBCFA1kXAmZJv9Ob1x7/qdcI1HeXkNZ6brdDTkoM6b0PjPke7D7b4sYnLPGiBILhA4
	ZoYK5P0Z4ejrjgpg58A0qJ23N2uis9d9PGFKWO4yNU1brW1UhscqkbbLDECiuqdYn42fFrSKY5S
	8=
X-Gm-Gg: AYBFou3BDjouaNALF1KX92PR8G92q0xSFi7fbnzK1jfXrZi3EPK0uJBIAVZjGQVq8lG
	ND62GLtrLnmVpG9ZNaymLqBo1gc+07hSy8ULHmEI6qNT2LFHTCTH0YIblqmwZY0il+nI/48jW1I
	vypqApXsrA/UoHxJ3mT2pLoqaJL21L0WwOz4f+Y8Uhr959j2cg0M0zFECufs+zb7Z9iirSFvnJx
	ITx1X7aCs+GC3yTO9pSYCobwGhnEO1zphPM3+PQocDX4v1TtsNTG17ryJhxLeHQ928We9h90Omg
	U3isxbftymuvOel1/jRn5IzNufh2357u8SCwh8tvNUDH9Yid2couJPnVuR6pEcgYbOTO4dbnha7
	kmtGtt5UQHAigghTSvAj5COKTj+kYCxTrf2h31DsvlfK0Kb3XeUBI5R7Tl/QIgOeq/tmo82IDj3
	wjOe9kznhcW36Vtvjym4phdff9tx0=
X-Received: by 2002:a05:7022:1002:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b25d31e8c9mr4253034c88.33.1793980873301;
        Fri, 06 Nov 2026 08:01:13 -0800 (PST)
X-Received: by 2002:a05:7022:1002:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b25d31e8c9mr4252947c88.33.1793980872194;
        Fri, 06 Nov 2026 08:01:12 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm7010229c88.1.2026.11.06.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, Mehmet Fide <mehmet.fide@gmail.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020152412.95560-1-mike.michalo@gmail.com>
References: <20261020152412.95560-1-mike.michalo@gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath9k: fix WMI command response handling
Message-Id: <179398087095.1316624.10795269671758112947.b4-ty@b4>
Date: Fri, 06 Nov 2026 08:01:10 -0800
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
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedf9ca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3COdopjRG8TIgARh_PMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfX2pZskMstxrAm
 qEuMecXSsHuVmY2A7Sfo+uoFgxbqjKH4RT+h4PsiqsNFMqw6Le1YnPmFzPijiRznv1gQoytaRmE
 HSy+ptJzk+lgnj5G0osTdujy2/x7Wwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfX1Y2zUJHtCraE
 WYCLWT0y9jYR7lJiEP0AinPpWhT+z4XDwMBapJs4Mc2XBXY7IkQMt0jtgP4TQepctqm5dMDIPi/
 BfnrHExDrdhQulXylv+RtnpGfaJMbpNxHcQeCakCpBgHdLVPpaaDQdDZzTASrj0JdeJdfFHGadL
 XThqzVt4p8Ng0PiV11e75qSD0dcWCpqtELB1wwhoPODlDw56AI+PJzKzrzKh4d7ogRsBq/U8LsW
 ZVVvfyRzmPaxh0BTnv/JHyQJt8q1q+Uy8TyUP2j0hzhC0L2d8SqaWlXGp+SUX3bB4rIy462OXdi
 NG9XrBZ0fNGLc6r4UTIio67jSWLBpnjYTaDIr8MHD/1EaE6vXjsGDIH6tYyAPhQaBq3++UJgCqS
 iY7d0eIXR2pI/T+MEllpYz4Ymm0sBY+9HDImV6cKl9H3fWJV5dgjWfZUQ3WZK+F3M4Ke18SsaGe
 JkqMo1NyTncQ1fB4txA==
X-Proofpoint-GUID: MoVSHODS9jH8XJugQ1wh16cJUjQ-mCdU
X-Proofpoint-ORIG-GUID: MoVSHODS9jH8XJugQ1wh16cJUjQ-mCdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060063


On Tue, 20 Oct 2026 17:24:10 +0200, Michail Andreas Michalopoulos wrote:
> Both patches fix the ath9k_htc WMI command response path.
> 
> Patch 1 stops ath9k_wmi_rsp_callback() from copying bytes the device
> did not send. It replaces the -EMSGSIZE approach that was reverted in
> commit 90201351a862: short and empty responses still complete, and the
> rest of the caller's buffer is zeroed.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath9k: don't read past short WMI command responses
      commit: cb1c171e3210d99d0fd5dceff24360e2bd04029e
[2/2] wifi: ath9k: drop WMI command responses when no command is pending
      commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

