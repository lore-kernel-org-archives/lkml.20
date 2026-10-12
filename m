Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC749B5B5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818625; cv=none; b=U1U4gD830kNWza6v+jWaAKSMVnjwagR8mLsYb9ifCEMkUHGRauEHRG0bW9Fh2BH6XMFdP7dz+9PzecLJb9KvDa8bg8shgLLwJFdfkDUJL/xhNKyIQ8IsqQl12GFPg+dYFdNSN/9T6fk5IMY1rTVybIpCr4/J/V/Npoq94nRoDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818625; c=relaxed/simple;
	bh=wFGnrgMxwXXzDsy//oXKrAKdhwnr6sL+OU/iMZYbOXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhObkssMkAzFavYQ9e3qB8WLodCeDv9ROaH54gaGd/BH5wFvas6HeCBt3Nn7mT4bAiKPtfTlj9t15JD3bCFOwL0vleT6PgXsP///EB7grfvtQKXMqF7Ap/dLYD2BaIKeNG1aO5mPk3JQaSYhcQHFusWy+bqpF11PQghnoYIqFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ+ApL/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3J9mdgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ+ApL/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3J9mdgk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Is51236667
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=; b=DZ+ApL/p4rBoUsIL
	uj6PyeeMAGaV38C/zlrSkMjRp9Bvi3dxaZpQy2dI+PwGfiikwNYQa0dacIlahiDb
	Mn+GeIEdHejIJbyGUdb/8nR8QNP/1lPI973OpIS775k5c1UC3gLuD65AAbDBxZUm
	bIBC4Prm7tUAW20LM6cMHZG3HopynMgJVJEuUF00ncZyh01dHMF/9HEmA+52yCvB
	avS0ApT1fgFXGC8ltxeY8WhvGbpxpnsSpfVkdgKRiSNmR8G5K9L0c1yHWS3zBQC7
	0xVg/M0gDNJTJGfnmKXYhc7cnqwEkWCGd5Ky/MFZ+2fty+UbHM9oDXSJMswfeYTR
	94YdLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkpbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso13585785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818622; x=1792423422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=;
        b=J3J9mdgkqlRlnu664r9TCLXu7p1i4TrR00dVOwOVT1/Us3CTjxg0MJEmYxglUt9zHx
         cbiKwC0yqV1zRp8SWeNFFF9gbfqZ5tPkmOPvGK0N38nOMbMOJxmBN4PpyZds/kr7Evr0
         Znnpg0iylccaYzPdiZXoNxNERqgpTITNYb5aWtIhLfN0w4ctBXdXjIIniqaJ8I/tbS7T
         4CAkQHzOfJykW2Fn9HRJX6wx7q0i/9Uma6Fhl1ii/G2PntP7tbl56CJwMw8BY298tWBw
         F9bsm/M4tvw1EN/WC6VTqeiBvhAwE5kt50KW+iY2YrCPAK9+3dUtMlMD+OMnaBQyWPE3
         0nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818622; x=1792423422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w2ECDVEZY7dWIZB+t4QsN90MTNAeJUXrKgTeEQYkeM=;
        b=eofeAIt7VW/5GwMWazWN2sLsZb+QLiDewaD37dYyD7sv5hF1kIhr3KAyw3Y0erNy7T
         MN4BJpsb1xh6mZ3rl1OqGN5jHrKhjg+YH7Wp+YGOSBh+f7XrWRrlCIqRP/Fr2Rzd4Z5p
         r7aM6xj07t8bcn4c8J3mctcRYaPKSGSNWhldswzW1CYvPbE72ZtWI19pcXWZeJ+xYDZW
         b3BNCl5vPGG3M7G4LA7Hj9gMXvuBeJGguqZeTV+7U3YntVOhrFmO5XE38jP9ZnliOksX
         fzuu9adHmsLqQEMfaTbggiklsHZ5VvKTqdq3igU99H565MHLFTmHWXrGzF0QxOY/cRaf
         zKxA==
X-Forwarded-Encrypted: i=1; AKwUvByjJNdj6vjaBo34lnrIv76SHuOu1jaMcI4UpZNYsZEJ92y5nQ1rHtEP+QMBkwY6+OGSwNP1Lcy9tUDUmsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB8A+GgkOoyTyWwVlL1U5J1JG0okwgWH9SMatKs52+f+EczdFW
	SeQiySLzRYF/QUQf8UNVilnr63X5r9qxCCOJ6pphpqVwn/h1w1FNj2keboBoH7quzoq8V+JNwMm
	ZwJVvlAjNrRKOQXJmXgqBdJdcMR8q3B/XFfchKh0z9DnJgW81xsfb/Q0zEd70NKtm8T8=
X-Gm-Gg: AYBFou0BHngt0SkKTv5uVMJYFqR6UrDPEvF3un3Sy8sGm/pN8+BPvbQC8ht+K/Fj9s4
	7gan2LNo770DmCdY1T4NcKHyCSs57atleqHEGA9kaAbzkftCdjl0z2Wp3mtAF3cUx5SciIQiSYY
	bEswcXJaTHeEY4AuktzmyPKzyLtRtfs02TInE5z3GJLnQ3AEqCjz+JTwdJOM0FlXFCj5ZL8g9Rv
	0bsPQEyrpAikf7SUUdiCCMVBY4UPQ64xlGON0sntZZ3aXzRsBeotzcNQo9hvLhfigFIAOYobjIf
	NbZPZAhzzG+rEBcqJKe3wAC/DcCY4CUJFL8KtB/gfPuVDGr40A75226JT6bvF2S565z6ZkYtGfK
	aN0VG4kH6V17cuV/HDmojtg==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1886094485a.5.1791818622213;
        Mon, 12 Oct 2026 08:23:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1886087385a.5.1791818621624;
        Mon, 12 Oct 2026 08:23:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3527f0295asm115247166b.72.2026.10.12.08.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:40 -0700 (PDT)
Message-ID: <08bb76dd-6516-41b7-be5e-a67513997ad1@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/38] arm: dts: qcom: apq8064: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1jpN8OWGef0H
 Qz0LZdfvnd9YsDN6MWk8zYw/ujFaaDBu0OfdLM5N7yP2JFVHz19x1qsXk228CIepXESp/BTzpU8
 s4R3yQDgOkNGNhpioHx2rSQRxQIrA0K1GU+fa7jAoQkqCjZpr8veTBiBgqWqHjbG7PVMU7i6UaV
 ZoBBBi4Wox5T97JUm+rKQOPejRe2T06d2+WS0DUBsH4Zgxu8dVyAIuWMOZhLIITI07mRtJnSV2A
 iKX2EUKq0n4KSAOg3q9zWhvNnH9Yqrl+Ug9INQ0puMBsbUldVUhzlLBY/ip1g1iYBYQF4v9Duj5
 oG9ImLdEFtrET/Np0ccWzPruJY0pVHJz7C6LmJ7lUycWCMEVHEjyeQNgFeOqbCCbUWSKSAK6j8o
 +3xgbfxTNpfgkVTobs1zlenH5USpdWB41g6WPDjKEj+mMZfWA4irOJJ9vw9qOMD7t1HTv7eqPvN
 Sf+tpodYh2TrzKGx+3w==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfb7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=BSc1TauVmqxuE-eLDIIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: FQtxZCHd7y8INTAsJBWZ2oPn2N768ug1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzHLRUwxDkKvM
 3DQ3Imy2qmr/f9tEYtzvGtHyT8jyUHeB9/NDwn70OUlq84hWq5+KuBJL0JryDLuxHBLBNaa29ti
 Le5CMcAGi8cz5mBasSeS5m+Iu80Kj38=
X-Proofpoint-ORIG-GUID: FQtxZCHd7y8INTAsJBWZ2oPn2N768ug1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline (and only one) between subnodes. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

There's some 'remove newlines' in there but the granularity on these
patches is already more than enough, so I don't mind!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
