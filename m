Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78143F09F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423240; cv=none; b=F2THMbgwsEpliccmdoyZpwp7HNvEfq4q1CCOQe0I+6qjuAPaVGEGovLcOAoXkuc1oDE1B7GPD1yNmx3QH8gN1yHoPTGKZ0s9msweNdhrm1CP8SJU6XFs2Tv7rVYsINoSs3CoGdj7JscmLTEpC9uCqYe+QlVPYbsXfVt4E+8S8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423240; c=relaxed/simple;
	bh=Kwn99ugm/ZvxvKfUKhfw1o4cwgC1yC46F1kq9setXGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxR2mKm+U6Dqoq+xxJURhpwy4aYFyegH7b22TESbojr7kcbFLZ3WuRbgSyNFwXXennfm5mK78IoAopMyhvxas9hoLSyTeLCWvOIl/f2CUwwvkWWADJB4bQ1xJDnaHFie5/N+LLQnMDfvaXFsm34dSssl4JU7ZfdZVi3ZEbbtvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBbBHpes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlIFwY7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBbBHpes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlIFwY7X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lKKd721313
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7zOe1SfWnthxqKbUkw/fj7Kc
	vjW4M5oA+dkrQIHsBZw=; b=JBbBHpesIU/34nVVC6lQScSYYl+mucJz5mFZacK5
	typCHmRX9IucPxWTAcCOtTE0lAVn5izPOLdSH2uqMgPBh7zlEaXMQ4lPNtzrYQ/g
	FZtOTstJDpNFrKIx/NAndcr7vHzohv99Ljrfh+hSNQ+z/k4A2db42qPAl/kv+lKo
	HYrSHx/Orxemub8KmVRv6tOGKra6fVTna5l0Hz5wVPQQ5nuoNiYaW4G6x4SceHLZ
	Xc+3nszClvy2XyQEymofMJzpA/308Ld/ItTRAeqpjNSGHJvnpPpXdnusJmPABMQC
	NQ6/9U/NJzBQbGi+9GLmjAtJPCxHvjanyoXfzSd7PzhNsw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnm11s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:13:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so5054503a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423237; x=1789028037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zOe1SfWnthxqKbUkw/fj7KcvjW4M5oA+dkrQIHsBZw=;
        b=KlIFwY7XODXpjLmkkCyqe4IV+DqJkmFt59nFjOPbKaMd4qQivczo6YtZQv9nAWVMwO
         u1ZxzDbzlpVaYAdzOf25v1czJW3tC2dsnBT/vDj1TeRHQ2mx3rFYc+F/0a0nCg8+8PhW
         96D/JyrcesvKIVDKRazpZJZkAalJ/M3ob8DfMZcMVApG1aOf7NZp73FbHs/iFesWNP+v
         ajKzm7JFtQPaMKKXjfms2dJv+QbmEIRbPCBpyOIL3tDWMNmP/IPkk280LSi8cFXL/QU2
         La8LY4HmuSH6XyXx9FqFxGR3R4sDZHXzuMdJONaTXkAr1QpQ56Q3I7SJ1HJzSSWSlYCK
         ZM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423237; x=1789028037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zOe1SfWnthxqKbUkw/fj7KcvjW4M5oA+dkrQIHsBZw=;
        b=a3oyYtB34tMAkyH0HKRM9uZk8UgJCpfFLYCERKXTk5sLyWSXot04Mo0DrFN4fefSnZ
         W7KLfmMmLEzz6/iwfPRaVewpsisV3Hots/0vu4fU0xY+Anr1g5tb5Cv5AVAn3OmjSPhQ
         CUgRc3wd3GRsqwFZZjTVmRG9r2SEhWDwsRqemQtsMsmzJoArLpDCvsmUtEbPg1LWD/P8
         5vT3tJTveaz8ACAH/s/P6b68lN3p+jTKu0kSP9sjVIOX+16tQmydz/UeKc8ODpwwpZ4Y
         iaTWwHbVaJZkdw5W/ScTmnvJK81aQ7qODU+hein8hf/juygPgLaRNDbEnYzPZp3aMWNM
         u0zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlFfG/Dr+9xADPm7gyIH/jRz1MvMqET1wykZ6Haigm14D9pfj9JW4fXjmXRoW/JwLYdd13GcrqXWryHz0=@vger.kernel.org
X-Gm-Message-State: AFuF++kUOH3XzydG4NfIFdxy83BJri88Z9keuw3i1tfEuqwTHHoYBFSL
	+2N7tVbu+UUv9IrgeJp2JH7SMxNPyDiFcQeFJxJk4+Vqi0bI1F/+CWc3Zsx87oOepHCzRgC4OtN
	7x8qSjjGhih6sbCAc6+8j22TRX36PfKC/ijyAX2zXth6wPSxHYO820sJIZdGr524fkSM=
X-Gm-Gg: AYBFou32vHYRljlsvyFHZzcSSbfE+oUAJoFX+zTJYWNR6B9YA2BZDfD7b9Td/UDxkj1
	3sD3CSWqo0fO0G1VW3tYeTLBIy3TSphbtisZufzTzDYXEw8no4Ja0vbV9ZN6RokdMIyXtCCxq8/
	lrZfbJtzn+dLwPhAAPcPNQU2ylLzYUHPiiz9kDTpsN5hzCbRI5PWMR6ADqU880CUb3NTwClq5/e
	/ff695pKuwwCGrzyTgLrlPuonV0qLQTeKjQLcDuxzjh3VxoQC+etjtPgM9sOeIuawRZcZJLQhve
	bGp7SACHxE58dBwOGJc6AHLGFsbRYFTq0QTw2fnC14ozgWqFd36za9JqJEMMYI6iLxNhTC2z611
	qzhWq4vYZTsuzKj37KtXLryKsDtsz0uYeOeoUjSbXjMA=
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr18545158a91.8.1788423237293;
        Thu, 03 Sep 2026 01:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr18545072a91.8.1788423236820;
        Thu, 03 Sep 2026 01:13:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431990a65bsm4027898c88.5.2026.09.03.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:13:56 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:13:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <apksPqKhUdb6bnt8@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
 <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
 <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
X-Proofpoint-GUID: Oi2PCXUf6YFEBqOVO3SAJ03BLYF7XM5k
X-Proofpoint-ORIG-GUID: Oi2PCXUf6YFEBqOVO3SAJ03BLYF7XM5k
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a992c45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_CkSUWfd9DtlKJbLfMwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX+KKIFKDmkYOC
 D/JhyH6cS4EpLx4SccII13AffFbymnDqm7twdjgDWEqRYta/RKnwwBY3Mx5dltoa3AQphqsbyr0
 /5GeHXlJTARu8Gs8U8dIXCtjau0l7fbgT5AZRDkHxK78RBIrmXJC+3wAKhPLVSEhiJmxaYL0u93
 FGdCzljGkD/7BikEPsNdS8jjSKp/2u5GJiUybmg4uww7FeubkKKSmFTmTfo/ENcbVnbRcmijlPQ
 DQ1LyyDocjLjjnX4PXm17H3KSAC0A6iCm0YR8pFR+dOSy7GlcLVXrF01mKfe4zapH2bj8l6M9xY
 ScF5SJM1Hna3RmIy++JfmJ+63pzktjwKfa3nClRdFXrSCGM6OyXYNLyHdEkwZ5DDdHJOFjnEo0z
 xEnvkoAKT9CX/lXmFzGfJ/DMXVtNYIjQ4+2fdU9+XEhnWygsyK7P99fiuqK32l2fNFdPXp5H1bH
 3uYQEUyLs01OrOJQe0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfXyiGySpdEhk6E
 KeS00TET1UZFjDyNt8LA0WmkTtpDIo3UaEb1Elnu1EpoBTg83TL1XG3J/w+Mt8f1dSckzfPDq1x
 1XLZcoUZdsC6BMShC/aZkI7waVlhY78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030072

On Thu, Sep 03, 2026 at 09:56:16AM +0200, Konrad Dybcio wrote:
> On 9/3/26 9:40 AM, Shawn Guo wrote:
> > On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
> >> On 8/31/26 5:21 AM, Shawn Guo wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>>
> >>> Add the initial device tree for the Nord Ride Embedded board, the
> >>> non-SCMI variant of the SA8797P automotive Ride board.
> 
> [...]
> 
> > Since we agreed that a bit comment is useful [1], I guess you are saying
> > the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
> > comment aligned with nord-rrd.dts.
> 
> Ah I forgot I said that :)
> 
> [...]
> 
> >>> +		vreg_s7i_mm: smps7 {
> >>> +			regulator-name = "vreg_s7i_mm";
> >>> +			regulator-min-microvolt = <300000>;
> >>> +			regulator-max-microvolt = <1200000>;
> >>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +			regulator-allow-set-load;
> >>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> >>> +						   RPMH_REGULATOR_MODE_HPM>;
> >>
> >> Are these actually exposed as regulators and not RPMHPDs?
> > 
> > Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
> > here. I will drop them.
> 
> Don't you get a huge log of errors with these in place?

Nope. If we do, we must have already fixed the problem :)

Shawn
