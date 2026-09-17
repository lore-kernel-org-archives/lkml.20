Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4F4B2CAD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638728; cv=none; b=PVSGNWO6GbEupcGq5BpmzgKypcEF4PLk/WhaXlxU6cN7v/2q2+o3DLSoUNyGjh3EYMjKGpuMu1puT6SMkKQNnq/R+hIQwjZShH0q2ul7ojsH18uiCKrLuZDTbLAwAABFASLmvAGKea1eatRVmXoB3XCU3NP8xuW0WgX/tmUQX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638728; c=relaxed/simple;
	bh=9dI6DB1nFlmSg6xfpztBajLroSCF+JLr20XiIWhZRvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLqHRYXW21OKoN/hKAa4kVxpQciuBQT1cKRw4D9AG+zX6xRs+q6i1zFBAKUJNvFfsvrp2HtosAK0sFe/JZWXF4QH8cGDq+RKl09abpLyakrL8FEMdA9isc8rJA0u5LAN6wfdAVL2YGTt3ye7Icdc4sDQAQSpeyMJNUidWn393/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVipXOq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEeMTOGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVipXOq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEeMTOGy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9a1AE1699260
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=; b=TVipXOq/3nlgGJmA
	fm+jqyhdgRMwNQ8iJT41ZyVQGZVHT4i9FleLLaC6Tr+uAYfkuY+i6sKbBQ94fS+l
	zTA+K6WbcWI3RIA6Z0paB/5Q208ma1qUJyqehGKPn9JSw1GGLSK0PKzyW+k3CCHs
	iCoBIhufAQtUN9XL1HgCd8Zvv05KQckArAecQ54aTZJP3nA2Y0fbzh3moPp1uRWO
	HJXDPOgTPBVsUK6Cmfjul8dJyNtOsF0xAHWZYQLKgKHNLnc2RKPAF+D9V27+8Tss
	JW96W4/tJMVX/Fadw43EpWCxLHkhIaUZLG1IBhdI10viHCCU/UGkulOicM4y2EE4
	88q8Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxaybvsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:51:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so113475485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638704; x=1790243504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=;
        b=FEeMTOGyeFP3wMcBhQ6O03N6uiMUMOP+bl8SWLAJ22sv1RFz04s3j11ZZk+LebSqlr
         vDHwZC7KNPPx/N5AhSZd+pYPmRS+HRyII54o3kI/HDvxQfOnmiGTUlv1To2Yd7ElRPnZ
         D5ANbOKjZBxQMlydKl6gsoxEYqJjotqU/w20yXpuZZ4zFcPWjn3JRn4o7kgzvWmmDvdm
         IMwdnGVa9ZnVQHbZrYL+3/l1A2pekcdkGl87sybB9zzMFO72vXdUFP8jDHZJ7OCtZXzj
         zSKc5vSfzxkfS7GUC9nARbQ4fTf5Eidp2JDFW6iSVzdzQMV3Tv9YQmkpiyKa63Ja/T33
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638704; x=1790243504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=;
        b=Y8rS/c+HYJB4/z7CJm1RaHHz3r5SqPezB2ElbvZ9OfUMphdU8dluduZooaAVsfasmB
         0liOSSIbOmOFRoVErLnNmmlxVazKlYr3AIxGHzimnAMbMlQCW//UzO7AWBUdQLC3U7Gj
         XUx8ZnhXM9SP1D0GtbbXyRyLAK+uWJvkLSlfOOBmRSAXC4ySIA1wYNon3wjWxQ1Kfqda
         gmtO0GnVbN34CWxSXWy8wEW/VIhbzaXU2faamsIhOOKtlJxQ83lKB7KMJCDGuCyupKFC
         fHSrgtMPUcdcxP1jAQM/I/TmcVGYXUjfs1qsBatcRheCW4GN1ulE46Fce9qjMVUXv5ey
         HzAg==
X-Forwarded-Encrypted: i=1; AKwUvBwX5LUf0cjcvEjO9CsUHY6rJ/PeAlUhE3bWTZYxLKERi8sWncmjM7OXXAiD4Cu7t4GJTIcmoTQggGiuMe4=@vger.kernel.org
X-Gm-Message-State: AFuF++ll8myqTJrJCdeHrjtXy/T3tFZUlx8P/qVcC4jbGd4fC2AZen38
	5H16n4wHUIi8O4St20RO8r++aDIg4mq6J8pEc3L5c6dYo85ZanJFicjWPs3Q4ObAn+WGahprXli
	Nyimf/M+MUqjOR44z8EvCrtumV5OSemMkU0ntimi8AaN7hMf7fcwS3bCcKExR2CK/m/Z1xdobcA
	w=
X-Gm-Gg: AYBFou1w6YM52o2kC797ESwp3gdieh+uVA3SHxW4mrBeH5XCDlWGrbLpPS54lZvaEv9
	6SlJKKbRoLxMnDx7KeFe/aq/c3WaCn7AlhaM0zvopOkd9OwjOaffLq1llq/HjrvTLCnApdVEIVP
	KXXFYhZhd5Idw0YiUqIs25zBLUxZRfS6/Gxr4gjHEht5JObMMC9oE2prfQRRPAqScl19gPg4N3w
	9Or/KgLvABpdkT50zqV53j1QjSlbC0ggt78499PV4xehDozKTB7XxbZ8nWsPEzsZLEtBgCDv1Uo
	ULNVN+Q5b7mi38SmRhaXEAiYu5GpfgkgS+n5VLnC8Lhx0cmmMpiW4djXv5vsCCS/B+cwxAXLtxx
	uC+V8iJ0VEWVd7aGCmA7brM3jvvA=
X-Received: by 2002:a05:620a:40d4:b0:939:d762:e2d8 with SMTP id af79cd13be357-93bb789cc9cmr802500985a.31.1789638704473;
        Thu, 17 Sep 2026 02:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:40d4:b0:939:d762:e2d8 with SMTP id af79cd13be357-93bb789cc9cmr802498485a.31.1789638704099;
        Thu, 17 Sep 2026 02:51:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm27089605e9.0.2026.09.17.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:51:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ckeepax@opensource.wolfsonmicro.com, linusw@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
Date: Thu, 17 Sep 2026 11:51:40 +0200
Message-ID: <178963869732.7792.14538092386135912538.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916094701.2007509-1-vulab@iscas.ac.cn>
References: <20260916094701.2007509-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX0bdhxHODuRY1
 yNS+wpXRV1ZqGVXn9U8Ft2UMXSMaG+k2JfKqhBgOFkHdpRvdtpOUhvE26oeP6iRdL2wM/Zpd7es
 ZPuEeRMgClAMxPQ4f/tBO9GuMZZdm2Q8TMYy15Zp4dDC2+qlHp1zM7xTxixc6Lssq9rdrTD1FzC
 +TfUFcbPlcaQ1f0El5BzTfqFEno0Q6jA2A+nuordtUd07QsT7QanBRxxLRKAHc9HVcrKLuQ80Qa
 gPCgS5t5UmySS5+3MjkeBB/mFihb8cBdQsvp5QHFght3cUmvpmBmCWoJ2KDmH/THZFADNxo5RIi
 YIzb6m4mn9CdOyTPRtkntOUV0g/JlYG9w879sWf8tJfyLO7GTftZ4JysmfedNLI4MwUPJ/sbsQF
 45tiExi//WSuzFhhUxKWf4IE/asmbuMuZIaBsBLPFVQFxf9GAuc5iIOBxY1ZwktTlnrTUvQm6F3
 AOeBZhUNw5LzJ9B+m/w==
X-Proofpoint-GUID: LOEeqkggtwlGggozTS4SfoE5cPKfrOPK
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aabb831 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7NPxJkk6BdN3bhC987UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LOEeqkggtwlGggozTS4SfoE5cPKfrOPK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXxFfo75fnL6/Z
 29pmR7KoGZDm6/Kt0QomdZDnIlaClT9wj2y3UxnpxCw5SVJ9CywU+t4qOzImL8v051FXWhDweLZ
 IiaWS2J9K2ZiZ+sXdXFnrnt67A1uKQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170135


On Wed, 16 Sep 2026 09:47:01 +0000, Wentao Liang wrote:
> Switching a persistent GPIO line from input to output acquires a
> runtime PM reference on the parent device, but if the subsequent
> regmap_update_bits() fails the reference is never dropped and no later
> direction_in() can balance it since the direction was never changed.
> Drop the reference on the update failure path.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
      https://git.kernel.org/brgl/c/e9d810279f84b30738f7790c0ed15f8dd5b9024a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
