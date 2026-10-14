Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22717497B77
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966625; cv=none; b=NObQohDWBAreaFEj/AEMkT3lBz1VjI/rHkImQuL9VOOPdJw9jNHZx4OpLLLsn4N+kc1okkAq0T0pMwzyryNVClKtfrm6WpPbeOEIzNXTx6bk/gN4FEWG2zc1W/rdKH/yqIHLWZ+i2s+H2CnSdo7dB7j0a12B4zIsy2WXtg4HvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966625; c=relaxed/simple;
	bh=ZT6FOcLx5hbreOIsDX43bZgWp7zpTZEdhRy0JiuWAik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPIpDtgDfZnMuYRquFmU7ITuTMURc+Nhux8/3dl+nk//kz81KuWKbUdK5g2S5igPWOM2uaHszSGuWMXRUNNHWA+uGU+OOzEC0QlKaxoq+I5ARcYJcJNJrcMiKPGaUiQrAeqwh02aG7tnNh/KQXeFQgmBuDwAVBpW4DT+VYns8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUgXgUME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vd4GiHr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUgXgUME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vd4GiHr4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3tqfQ2222086
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dobmJMNsUw57587c4QcKw09
	gC0COHOcPZrtPPfuPUw=; b=CUgXgUMER0ZTIewiEPvYRLEEcjMbTE0PMldELdDc
	vH7FraZ2aaPVdtqMCxPV5AvdUS+OHUI0Gk+oH1eIK/vqlzOnxxYxATJLC3s5Q4tD
	uNeg3gPCCo4OOZn/Zki5eEIEoDCqsZbcx0V/h0HoDhGKJGCEdgpp7qKLB+ICYqfY
	Zwzt6JvJObl3gPQEc/KgX3xEMkYRsfTbVULnCoqwVx7ZwnhzHcLQrb46uob0oB7e
	SGBPibWIu3ibf/yy4TI6cFVYMF4uP9V/k+YCGQk0+SWHx4IqPfIgMDzArZFPLwxM
	XXeAsIU9GJawVc9stPbAEN/33aQafbS4zA23K9c03Z/+YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsamfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:30:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so749248285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966622; x=1792571422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=Vd4GiHr4fhvmoTI5VnG92DoG16M/ci8pLPq4dV2VNmDwbTvL8C6NXSqeeniNhjaJ1m
         uPRgVVuRvG6CdOjp6bt4PJIW60lnGZNyfPr7C1ktaFo3Wu3PPQ7dZi4EmVqYYlvzRPyn
         QfFAOJqDIo0cWsWpwGDxZFxMXfJnHePsBaMhuICrVnV57b3dHJdVmvWRmpiL+2ysDSJ0
         +1s01Wvms8u2BbuZJHWLg/O0boMdzOqGGgcbPADMxCM1xfLzgzgOSo5XUxdpUOpJQq8l
         KwCb6pvXuZ9eeDzkxMsTWOVlVbnEbi1Zsg+m5e2wmoN0K38YjrOFHhDg9LFxwwNBjKxt
         b8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966622; x=1792571422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=0vgJbcJ4fPrag16SdevEPLZXPEIltN15uxD7J1Kd6GWHT0kllEZtzLeMhOaFkVfq+d
         DKgchoho3/uoHh/i7bq5QQJr5GZs8qIeRuMBZihDu0dtVaR3QHagPhgULrYMefKXGoHO
         PguYijfn2C4opEDp/rKMrQX6vhA+i52O7u6UGPW/zNUiehSe+YQRGHY3zQIRYkNH//IB
         lEKjWdf26eIyD1Stu98k41kmTUzBHKNolZXbMs7IcjGtj0QJwkSg5MMCAXLNo+Yt9SLZ
         2SueTQTudnUWrQRDqeuqtTtERd2wivf2ZN/LsUA/Y1FYvJyeWo6Aq8ZfRYhI5xNd6X9e
         LSHQ==
X-Forwarded-Encrypted: i=1; AKwUvByv54FVa4PDTsH+Hp+UriQEFaJL6OSISg2a6vFzGpSXzfdsK6jGY4h2BYw+cQ0DgTXlgyO0PJg9zq+7IRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKKGoUruEqmWnLs1HOhC1xQ2GK7PBF8jX/6pwkefsY/EvtgpfI
	4+llUE9kN/1YoP6VGUMPF1lfpNq3ENYx0dD0Jo3UUWeBTl/itf7QSuwlUtALIDxRl2a8NWZDg18
	/MBhTPAyrcHjx//TGL/L25tSuPAqlwLrOWzpJYfG51Iu0kx/wSh52G1WNBzBZLA1udMk=
X-Gm-Gg: AYBFou1PkQLTx+8MAUeOuWDHFSVCclyQoz7cjUIyCfoGw9678VupuEhWfW/rwryTFRL
	emaaYHxjQQMjVZbBcZSGkA2DGLkJT73CiLzB5XM4CEQAVZQrn5/8Em/JFMSNg3ob/2Zi9T4m5oD
	eepR2tkPC4HwjjTMC/kVUs1SpVZEIEIwUtTQC7glvgpFoPFuC7W9FEDVl8zvwosztWdb60+j7cO
	NQAnA10YA1qLonjLzNXRVKEpxWbk9n7BmGrEJTr2QNekZaQIzDWEQRkcqmTtZRjb3LEfmeKKqOW
	qyENKkeTJT90QTMkO49T5Bjn6/Z+W31ihRDJBoL2/insJoC0dT9NpQT1guOoM1r/Bk1pmoMZzdM
	WjR1lrcWhfz3zUjMq
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524662185a.23.1791966621622;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524658685a.23.1791966621064;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b8cc7dsm23559775e9.4.2026.10.14.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:30:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Message-ID: <2cfacl7qglbbognw6g37qnhslrc5fhstluiol4eqanqn2qg33y@4a5nevgajbgn>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXx2d+hSfHrB2v
 44NAilSuqHAgHmRB984yOKqsdCUewWvIO9PihcJlZO4oTiXdG0Lq7y1IbcJ1smkXiPUeCePjgJU
 tIziBPWsMqLXAGNvKn5kg3/QMXO6hLw14bsX+IuGHkm7iRlAjHgHZGHkJjd4yvw/CIVXbvkCKBw
 KylFIDB0cjZRBENU1EvSZuGl9QiterITeBo893GGTfW7DRbFRs67+HknXdkQ3AfYd5zCDBUdaz4
 SWTY7JEc1aOxOn+ilv9S2Vdj9E2KYjQ0eIowcPjna8jJdWaoBBJnRnMBC7LPX0oluDHDa2VEyGc
 sb+XtaHbyeYcKKkWjD7HLPr8IYa1txPpl46lVZPF9NwihRMofNCG/gNWKMf4J7vJNol+i9wADPK
 BQp2NHNQH3QhIDAwJIV1jNZeN3X8azLuq6qdGZUBcvb0f57Zx/R1bSkPzeeq0c5NfChE3Rz/ZNU
 //9nhHjRIbzWmQlneJw==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf3d9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mf7eSssg9PIvhwxWQfMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXy03wWxhoHuwv
 qVgG+IGWUQ43+SYUsPDCJemp1i4UmxY6sT0fsael8mz5awwRIr+Y+c8bcPSDQmYI7d+AuYFCvLO
 P/RL5//gPl6nsmI7dTZxnLDv9gsLMj4=
X-Proofpoint-ORIG-GUID: Vn6YJVpqDESZ2TWPp98aFHbmTvOAzxy5
X-Proofpoint-GUID: Vn6YJVpqDESZ2TWPp98aFHbmTvOAzxy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033

On 26-10-13 11:57:41, Bartosz Golaszewski wrote:
> Add the core driver for the Qualcomm crypto engine. Its task is to bind
> to the qce DT node, set up runtime PM for interconnect down-scaling and
> register the auxiliary device using the crypto offloader driver.
> 
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
