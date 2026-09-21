Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD1439F77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979812; cv=none; b=Hsa05YqygkNeiEe/5f8goPWUSJ6oDZNjUoRfuG//3tYmaTz6fvKbXQcAtWWXPuSflSpkwQDrKTnyFx1w8J38Xr5ADee8xZn7mkOShThEhZ2ORgk2bj2Eb0ale4ryycNQYgjraTu29ZssDm1PxRojXvKCh4LkSu+Tnb94TvcsZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979812; c=relaxed/simple;
	bh=ZCwmZO84Gw6iM0nAODwcNKlVIlSJtLdUDQfhkkemjho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn0lofk7VPN4o8a2esMBkdEPglK9hFqbp5rjqguQFeh4J2ZQGK4hD3eXjqDpqA01TEqe+q4PVYuM93zNk2pMz/eDF0BCvgIrptYNUXH3IciDKiqFlKFPT8Hmw2Ijh3DgM38BYSIgMgGU7cmHuZxt9tkjkeNvY1STAFlMyX8tV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3SlBmMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeCv6j8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3SlBmMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeCv6j8Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79tuY467164
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPtxmrYU8ZrfXfOjYF4vl1wiQZgzuzOfDh5H7b3Y+5s=; b=D3SlBmMUdBjMKj91
	YpyGZ9eAsB9w24gK8bmeYcytRs4qvBuRHT/NJk+RqIa4tng0epLHf8B3zUKe5Rp3
	zP92/H2hfYMQpD38qKx9ztIzgXW4sbUMsSAEYqGJFq8DcPCl6RlFy0i0BTXgrJ4C
	zKnMXhxoJqbmUpwFlYlt1ko6cyxji/h7xca2OeNhe3/REHptY5XkQtLRrrx7Mvdk
	ScW8Namr9rsqVFYw2SFHSR5OVKA9r3xu83aZVW7ThCp3WxxZBZrNR44u1Eb60F0i
	Y4J0pGCUzM236lTVO/XsK9k35pJq1i+pD+NiJUF6Fe3cr1K36uP1hK9gD0KC+075
	WhSndg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9pwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db87f759c5so55252565ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789979809; x=1790584609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPtxmrYU8ZrfXfOjYF4vl1wiQZgzuzOfDh5H7b3Y+5s=;
        b=BeCv6j8QZCNJ1YYmNoDTRNEAPElE9f9PXGrsHzfrdlNOgcCHCB6ZboF27a5Pb1LQOM
         arZWF0crabLmFYmSu8JfvXezPDzaz/DYyepUwkRpnW89wQPGEH0LCAuP1l+A2NdoSrGj
         wJjpMWpn7+zBU/ZxRWF559fOwmA5Jg8u3iaNgx1HcQfuwrGnOVFswk5eEjgPT+QLfkDE
         9i7IhwfR4D4xyAy7Om/z6BGK0l3MUEhWG6DaTV/wUx1jtz3AMMp7Sc1SnIOYh2e8oKng
         Iq81nG+uTHBuI3UmHVu4eQPnv8EO6tQauEhtabjfuBWzD4LUbaD2aQwJOPhirL9CC4Bg
         Z1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979809; x=1790584609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPtxmrYU8ZrfXfOjYF4vl1wiQZgzuzOfDh5H7b3Y+5s=;
        b=SuPR0+rTR+Flju1O5hmgW2dLSCwtgPkuhP0ErPW+xHTt6nxl6zImy6F81q+oTFqvzN
         prQiimYu3KltpcsutWlNy0JUVw0f+XoCS79nluHXSeZ+Zea+i6qbULO8ChhA54K8ibvW
         +qmisfv0WxeF9nFmWDBAVSNREm26JIxNrpMgWOoDldX9j9d67TdzCkWNwZgE3WCbJM2N
         LYRG9iGiR2Ca/WFtXNakHHoDJfFjEl/3DwvEg2yhcfGbWR2py13bARYbgwVLa85MRPii
         HONRifBotWsLz8qJ5D66cD3CYTb9YLMG/DRbiSGvbUgYBGahlmYMydYjf9U+7JlCAAmi
         UtRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKwjkxaDbbU2gm5gvhFuzhMHMH0oJM54zbw+uE5936WML/9AL0B221VC1xjPANXjY5QbAgRWqYak/Dq8U=@vger.kernel.org
X-Gm-Message-State: AFuF++mtmMLeQH1IIZ9aQ9X3DEemQvRDpAhC2uFsda0yWI0Ea2CiYSB/
	HoLqF+VJt3wxMKmhQ5wMIWuXCf+DsbbSm3wFj07tk+xLyl33arMGEoYVvHqNUwMFafw3xznGUnw
	8caTEyfd5R+ZvHt/u8AVWVYtTVoqVYmGdbY/2Evf6+JaO0o1J0F5abdprmOGJ/BMLxd4=
X-Gm-Gg: AYBFou31GtjHJ/MfJy5kKcn8IKliQJhO444JDITG9p5KbrWsE2R+lczxHQXYoiv/ESL
	z2ayXJZPX8ruYXVfUhCsM5HXd8+pBLzgM7eM/1UsrZo6TdVaNS0r3GxhZdOGA36GZFQ6zUK+TmV
	CMGENBfmY7s7XwUuWvC1iw2VpRCc7RPlBtLTtjtUXC63GvvYePPhExYH9x7CyTBfURI1c7D6qWI
	Q1QmpDTnjOYmnq9jUDEh0m9HR4+yT0WrczpRKDfruQa0sTsx6UHFEr0vuBnSh9dfmkDlve4W/Cw
	z6q63EfAiVs9J7qEuogLMq6lsUsHCTibkvc7XEj0EKvne/wH5NZ545mFdgVqA4ghnbjfVXIi/Jr
	cjTwTuph3zCiVy1aqV6r54qrPp0zgEw==
X-Received: by 2002:a17:903:9ce:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2ddb1b1133cmr154922905ad.13.1789979808864;
        Mon, 21 Sep 2026 01:36:48 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2ddb1b1133cmr154922645ad.13.1789979808455;
        Mon, 21 Sep 2026 01:36:48 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm22056781eec.30.2026.09.21.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:36:48 -0700 (PDT)
Message-ID: <d555ee76-3999-4ed0-be6a-ca07354af6d4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:06:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <aqyZtHynb2nuQT-P@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <aqyZtHynb2nuQT-P@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyMiBTYWx0ZWRfXzaThDhvLinQm
 9jGmewSmEpnZoWpD0+nGhev6fzSKoyOKtsvdpePgFO03oHUzrKIFbVHfo80HBPV5l/S6kH0JosR
 kPZu2JlqXELZfnaWKuv5zVnqHeD2q0rVm6c4Pm7I7nnQ1YeupWCJLxqQfZo4USSVvn/GHjWEyi6
 BbvFk9qQiDKzYDWzVn0rVF6W6OgpsKnKzAqcNZcZ3oy5HR9xXR9ot/CuYCBOn6WAR7xFPxez8sF
 Fs1JctBN+z+Mbeu5PZ2Gj0oheB+HY2fW6ZsXL9hmhISDmhcc2IB9NmMJBbdH8NHYL0n9rNsA05e
 a1XGwBSLyES+k7IV6Ol3dHeIGiqajUpF4H8kjL1WNkn/MRHwtNnziYskuS6CLHy6X6P/Pp7dDv9
 qO6iiqq3lF7eotCA4Eu9a9E3hifwaLTP7V8c5SDdfes+8GoWQZ8DZY56Nn9h1fNtH/+ljzQByF/
 pcE3e6BPCpc3vKFk1Og==
X-Proofpoint-GUID: te_68f2ciBgtaexFdZksS4CnFGQj1Hhu
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0eca1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ltvzBnS6LVNGfPjtTy4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: te_68f2ciBgtaexFdZksS4CnFGQj1Hhu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyMiBTYWx0ZWRfXz4KtZDpdEXmC
 FRkKx+mZUQCZm/rQRq8GJ4iTJzcGNkMRNxq3usG7kBMIBqSaKyVvRjbjMMAE4K5BTKDcOrGEGiw
 oByWHKi9xo7tOp0YpbhyGSLmI99613s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210122

> Causes merge conflicts with my tree when applied with git am (actually
> b4 shazam).

Jarkko, this series was sent based on tag next-20260828 after applying
prerequisite series[1]. Some minor Makefile/MAINTAINERS conflict was
observed IIRC.

Kindly note for merge strategy, prerequisite series[1] will be merged
via TEE tree and current series need patch 1-5(not patch6) only as
prerequisite.

To merge TPM series, it's better to pick from your tree and TEE
maintainer can ACK patch 1/2 for seamless integration?

[1]
https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/

-- 
Regards
Kuldeep

