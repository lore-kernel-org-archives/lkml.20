Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FA3CF032
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462166; cv=none; b=FjAPJNLVMoUZsDU6nYglumya4vV9huyvGFa3vAjYf6DW3nZmtm4oy8H1UhjfgzqRDmZIVtEPkJ7Q67nRq5Q5WJbwAFyx3jpEPXiQubZ6q8vt93Cm+1UOo9tAG28FIT3Ig6tas67uiAyIObgPLGL33vB9hvpLuFS5LjzobK4cN3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462166; c=relaxed/simple;
	bh=KsSzZJoUo3eRJL+QMF1QT1S6rvVdOYkCPLndC+Wx3Rc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rVbjf95KnwRI0quaRK2Zg7SFcQqMkhSbZtMDniSWBuoDcpoFQbblBmjajCtuu9hyqcF2nZ+kw0O63WXIq46EMfV9ri9E9DiX0Mdc9tP6TVljP07f9s6EjYKIo1tJcRqNCNk65+2jTTz7MYGJEDq4nt6/WGUW9IgJlCwNwdfeA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+fKCQI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FM+ZdzUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+fKCQI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FM+ZdzUo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683IJXcj2002766
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 19:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=; b=U+fKCQI5Xh6sbJFD
	gbSHXz77ap6DOuqUB+TaB0HOzyYAV7+yhQubQ9TYeA/0ZRBu2Si0btef3haw/8rg
	hcJ5rJ5GgCBPthIozH4o73NZ1I9DNKMoLjeDQNprilll8Qm3dNkKi2AS5DorK11n
	oxOtDSUHzRTig1RVJVlDun5iY+RRI7Yo/kLHEVYhORBuwHWZI9QrjPDDBOzDZZD9
	K7zW+rdesCxuwqdR9lKUvpZ3bMeKMwMUSxLtEpw5r3FnL4yFR7OI6VnpgpQAsOM2
	YA2js7ztzzsB2Ms/6feJQbM63S/R7Wa1NxkBDB5PorDsg9hCCtvSO+NcVbTzPV7q
	4iyBhg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvgyxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7151120d6so2254945ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462157; x=1789066957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=;
        b=FM+ZdzUo020PfcFbnqmxfPfIMtB/80dHFhdjlmiRSDt0N7xxBUzBQp47k08r2IqjuT
         Pnj7QdS2Y10sUdQXp6y5c3p0aF+IgSCzjdWsy2gDsz404mgmGqcrh+tNGS3HYpEjqqzL
         aCeaH90puSv/qAUrTc/A0c7PUa/GciD7x5rX8BM3a5HY88h/Nz/B+Yl9VlDrBjCcQElH
         xPoQPlxaZs89ARjuKesjH8Hu3NYpWl3G5VG86YHTU/fJRx/P4fWNBYNhV5SrBhBT1cSc
         vyLkSM2FQ2vKypP7H5Gb/Jwa0DplClwn/QPUOqEjVcz+3wGD4YcVEKEeGhn+13ZXPUCP
         7V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462157; x=1789066957;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWafkb7CS909dTCbVmWblMfgmqDyzgj5Ms8qb4F3WRk=;
        b=pK2d6iZl72Wp7JoUTm1HIz7ICAZQuU/vawkrqL4yIcHRtx5zuSHGenqwPY+Llr8hCK
         poBuLFZZvXSMQu3bmXygFZBnT8t7Y5BOfefIOOGCUBGd8RVPP44Ygzb4DVQQIxV2pXHo
         /l7R8a+9l4SrdSJCiBb5NDCDdp4jQiMPF96T9alw2HQxptzlYT7OJ2YGpd30YTOvqIpw
         yiEMABqHwXoSj6kq5KsCi5BmzJBkHGBahkLN/0R3Fp29roZ2agmL9Gqh/2JC4M8JGZTX
         YaQ60cPSLP4p/+sffRCCCDCUDy3BCJJWZ7bV/soJM4+0nfRMMltDGWAS351Ws8gPUdQq
         Nddg==
X-Forwarded-Encrypted: i=1; AKwUvBzKWT1w7Se6XgVhFiAZ62TIaE4+GK/3S08xLDiLtBQaZKEQ8lIRzVwYv1i7xaWtgAZK4d75jfJ5eVOfiNg=@vger.kernel.org
X-Gm-Message-State: AFuF++kwmttBw0na8uF3vKNYIRW3JbemRAzE82YhXynpjXISV8ut6AX5
	Rvz3UTq0tk43WmOwM1meyWz6fn7LM8L5VLcXhvookSmOppDRp5mObRQJ3u3jb+9oW+iFwFwpr+0
	gr09GXgx0xt4BnB/eVj2rgx8lPCQpUXqoIiD6C79iiqo6JCWBNpRaD+E1Mop6+FH6uRI=
X-Gm-Gg: AYBFou2h8kHqFQk3JF24sIkYj32MEBwJKkTR7lwzcUj4W026JFAlZ6V7LV/QRNzGFr1
	fyeMaYjzJ0/HXhr4r4gBUCmRitjzTDNl+5Q220IEyVBcmngIKphvx0QAivUPYZWuQzQN3HnWKdU
	MUofPE0dAR0gdhwu7Liv3yyrQG+Fg8iB7n6XVA92b1DIEYIZUoDo2w5hht5wMWPIkAaPQ5KC07j
	Kr6OukfWkiZGYo4sYlZCnDYfq1DJNfelcIXXhsscniWg/Kf3iBlRbGREsizOPGGtjL/gd/ymurd
	9pWvv2JW1P/QFyq/mb4+qSJgiHhoErhfUH5IWgDi4Nbl31UNxD9IoEkejLHFbicAfJg4HuG3p15
	kFMBn3DtfH9p2f5sMHNtsxQrBvCNkrT+TYc04gNqgPFs2fMQ94xyBFGE=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr658752a91.18.1788462156452;
        Thu, 03 Sep 2026 12:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr658662a91.18.1788462155797;
        Thu, 03 Sep 2026 12:02:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
References: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove skb->data check in
 ath12k_wmi_process_tpc_stats()
Message-Id: <178846215507.824911.1946775956361257237.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qIim6K0GPFvctFm_mK85PyrWL4Nmxq0n
X-Proofpoint-GUID: qIim6K0GPFvctFm_mK85PyrWL4Nmxq0n
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99c44d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tcO1i5LuZZfHbVICEYIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX+TLyOmFnAq4e
 uQKMAZYAEP2D9f7Mmi2cxniCqQQa0T/b8cnXTuf/RT+eWGT0CIp2WtxICQQWa9ppHNz05fch4Xy
 wuGuMphBO24ZPz3q1qKCQEVWz9eOA7r+FKu/kxqeJ38rU6DDv7WW8H1M87vmvE3VfA5zIVU85su
 8aMhTt/7fRCi7XV4Cm8Sb8KXkk0PWG+iGsGhdSEwkG49udqMj4B4Q0UFzieN7VtRr2Sbfh0qbHD
 KaX7PfC0hjTtaZXh4G384oq/XvUVOqLXNBk5YSq7F61lfBJazwdF57oW6QHdOZ060p51JRdBqCJ
 9WBCV1GMQNoI/zu0uq7GFiu2QnG88Vz7GmuH/TauMiDyY2md+AAxVqQt7bAXGTigtAciQiOaVMV
 ll2CGUZM9pz1GEh1cYUu2rcVl9G8PmKni5Xrk1FcUw3N/FHs1F4zB5nQlFe653VGzwe7jdwmzLm
 0uttcLoA77LRaj173Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXxQ0K6YIwPafk
 N0c0WEjQSngWmzPzvkqrT4j8mAzs0z5hUarpL616qDFxPbYK9MSvYXvZR0yZwcX8r4cbBmM93AQ
 g3nSht+BZobgIHzmOhnjdBX944rrlsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166


On Tue, 28 Jul 2026 18:15:24 -0700, Jeff Johnson wrote:
> Currently, ath12k_wmi_process_tpc_stats() has a !skb->data check.  This
> check is pointless since skb->data is accessed by ath12k_wmi_op_rx() in
> order to dispatch the message to this function, therefore it is always
> non-NULL.
> 
> Remove the pointless check and its associated warning message.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove skb->data check in ath12k_wmi_process_tpc_stats()
      commit: bd3e260f496adb0123076a237e5e72598dee0404

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

