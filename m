Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDD33A9E9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924849; cv=none; b=KFHwZPO4YChUAkvbILLRUe9FHfmdoSl8H1D9r3Co+z82tC97VA8YuZVMHPV/rgo61ODu/dWfgEYIpE+Je6gJyRmQ2XWtRl9epG8tjlG/1IaeJunjL/gFUB/FyEZciC1UCz5YW1rcIrr3x74U4FVRwdngHwsm6GuP8FDud20njxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924849; c=relaxed/simple;
	bh=p86aoLipPnmeBSCQWRntvEIsHN7hwNunducQ3JxHt+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8TRyisPmmpGqATOzChA68EuAwELjfot990fm6TcJn/5bF9UJl6nP6TbausA3iffOQSwgygEd9nr3ABdHaElwNoTS2Y/d5KLfLqnk/gum6l9h1zl1e8SmXxMPDSY3GtNNZ8FflFEvj84nTQYvlU0FiDHu2nmeev4hgI7qr32PQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpO/XKKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Riy4XrLi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpO/XKKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Riy4XrLi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925itk94019610
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 07:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=; b=BpO/XKKZUeyr+8US
	UjRKKSbDUo5AyXUeAqtVBZWAez2jKfY098dA/oY8kM0mG1v2uYNLcqj2/oYm8j7Z
	cabMaUqTC35a/WYTOrIizr+j1qoN/8fNKF4Vp4x0FKv7jQ2cskH2eB5u6Ru9yoHJ
	+ZEXyfjHGy7/6iLmZG1kQl+Vb0quGzMgoaZIH0EXOsopGaGEOm9THHHRNVz7PJSe
	MVX1kbW7AhQrFt4m1qAouwkQ0lUHO1JSl0LaoOGpTr2tqZgYnxdxZkCFdGAckJiD
	My3gOcv8g7RnApdNoD903atljeoz47BrKIxQDJH4tykr/xw2I6JxsuOclkBUlKDx
	LrYstA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqbh69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:07:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so1950078985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790924846; x=1791529646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=;
        b=Riy4XrLiisj1xthrch5BtKkeoXbw2GzYnjMj4HKZQraBDraGZzKF/C/qE1GRbjw5cf
         CSPfr0DUKHjvWBS1kx58yLzkd3+pCkQ8fizQqajEvsTJ+C5rHlcJeGEcUA3B1bLqMUPi
         oq0BzIeehuwfuGbfYe4kf+/h3xZzd+PlhrpwW2iP2gPtsG+h0YfS5lctB828ILP3weXu
         SonfuDtpesfmvPRXLJpaCWziuteQTHxotuPG5+I52sJfMk2n4jkB5V/XFYHP4rgtRiUO
         xkOmwebjYVtXqu71+sUzo0G6fmeULQO+MA0W1n9Q3fgEEMaASrF8+BVPuLlALjlyRNxM
         zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924846; x=1791529646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I+i3UIX4gVXyxWiJ+Cg4JTVO0MXqaK0GV0dmAfVfSk=;
        b=OinkyUYWrziCds4X0EsJKtnVV8JRMKmn7Ut7iaYH5SKVd+Cd+zBlo39rNtEeabpTtX
         0BOCGtEIp9e73HlvMzeX9ri6wpsmY5Q7XJBET61Lrjk3ywRVY5ZSLBAoGPHwqao1iUOo
         XHTONprXdNlE0adD1VAEHG1+ky9yL4aFbxxNBakZuGnHNA6Sl9/UiZnelR0txJxiPwA6
         EvrIuJJgyr04GeEfARI7HC4vahVX6+oenjiouaaGskicG6mDQtJAjTUzqQP9c+30Soh7
         fmUln1ejeQ+zLxSxJRqjQWJwQVwern8j4SRyAAbAyQiR6Sfp9VWTJGXqVWumA6SqxasW
         S5zw==
X-Forwarded-Encrypted: i=1; AKwUvBxNfkdJZaIjdCBeaAedHlhOAEwrNjMZIIMNJ70tiNFgMSt2VZe/cSmRjMuLaGLJHeq80YeS/9NBmsU3T/c=@vger.kernel.org
X-Gm-Message-State: AFuF++mkzxlAbr+PAyOymKVOhvTnfW0YNZ4zqOhD6nV5J5N2Zq8F+j63
	X9SHXJAJannI6MfzVPBII+GKBWRRwd6zvHLKN6EwAE3rLlsMqodo4xJHDXKQacszsyzG0jAvfM2
	ntUl+ksqyNpqwXRlBNx1D8UYfQDBiJSlTXS0tRXne/pmnRvoX9+8hRIItY0a7/PzhXWqqS5+2wH
	s=
X-Gm-Gg: AYBFou0OSHK/RpB1QuqXeLxu3l5bv7NF02EGgtdfMzK9vS3S8sfy+0kq+uaUvQTzBEU
	EuTvE7ZbHhDX9Il1IvZkAhM3HE0Yk1N5QdbfYf04SuhF0kvqvuztNOZ/vUnI/IBKLl/Z2ODTsZu
	nu7+k+GXDVX4gGIlz1S4yS6+Vp1JoV5oN0y5Clb3czhJglHbGOp+56okJw8edvNVoEyNJNY00OH
	9PJD7f+MB7bP6CvQ8/kYBHlFJdkMEGV+4BVFo4nmn7DSjDnMm2/R+JEp8kc+F4GfMzMMUhNnp5b
	p6TlS7k1UqNwt0414f4bMB+IipJAO76rcPtEYZWF4xHpY4bwGfF2y5cQx7Wg/a30pA0NtNWgj/6
	XsjZcyP/R8JEaWVRozvMhWcO6Xs488jEXiVl6iSqsMxuPtdsM14Zbd4hpgZyCyg==
X-Received: by 2002:a05:620a:1992:b0:937:1097:feb8 with SMTP id af79cd13be357-93cf16d9c55mr286861385a.24.1790924845390;
        Fri, 02 Oct 2026 00:07:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:937:1097:feb8 with SMTP id af79cd13be357-93cf16d9c55mr286856885a.24.1790924844881;
        Fri, 02 Oct 2026 00:07:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm61000175e9.6.2026.10.02.00.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:07:23 -0700 (PDT)
Message-ID: <415c5fa8-d5b2-4030-9618-07cf828c8d01@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:07:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/6] power: Extend power_on_reason.h for upcoming
 PSCRR framework
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyOCBTYWx0ZWRfX1kKvatXB9mQN
 ADDGkQ9fTOcwwf1vau7j7oBKtq/LGvdXl97BJSlK2PKKxdtK24t6L/Bra4/vuzMYMjXy+kNge0i
 R/4r2QzYHkDNjEKEJLGsgt/LVNioiJCgjl7qdHNLiEEdmVxFTHagpinOcvnF8ZOGgxsTp88vwY6
 D2igv74v19xTR3U3mhdwf5+nfdjZMNI0p4o8hnFAPH8zaphIYppHeS/Dsn4Yg/oCORCbXXzCsbu
 a6rqz92KTy4XKjVWHAkKbDz9DB4OJ9IxkjloVpZeHsHM9hcUN4XwwV7pLeRu4A967agNCFJbSAN
 NaEivjOSDbcZOJonjfTztdhaJ2E4Pdfu1yZMgYJLdcCadNVUBrdrq6XYZUsJesugNROm7YcI6zE
 eNPG+w3e1WZCtkn7FdNtpfj2v6c7izyRBTBj10eExo6TxInN/FOcQ19tZFsPJ61FDUYauqgm0BV
 +OzVDoCoaP1TK5GK3DQ==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf582e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=FITrd37hvkKM1ztSptAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Ou01CTN4dP2ioP4VhJmZhLXoMS4_jvNN
X-Proofpoint-ORIG-GUID: Ou01CTN4dP2ioP4VhJmZhLXoMS4_jvNN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAyOCBTYWx0ZWRfX8ciWBuxJ+rWq
 RXSkfEBLZ/TQAFbF7CG1Ylt822AmldkQzn0fCEouIEZ9rTGgjoh8eGPrtGrX3+DJfIsLFz6SLl9
 Z7iOb6TsR0EJTB/T6KKEdP2ro4g+VEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020028

On 9/24/26 09:08, Faruque Ansari wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR) framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics.
> - POWER_ON_REASON_EXTERNAL for an external reset source.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
