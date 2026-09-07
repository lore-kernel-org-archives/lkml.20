Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C148A2CE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782707; cv=none; b=q6pZ812I8WpNS4AbWZWTx+lUyhO6qPAPeTwJDcppOWaGg2PH8JSttSLp+PR2veqKGn8ms+chAbEfT98u1lJv4Y9TtNoFN42pAJO6/B2nHpRA0RDFiN8QfdW+ga6Kjgdlo72RhQ/A3Q88OS8kJXgO6rsld/kDKWPNM2C1TFRnhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782707; c=relaxed/simple;
	bh=gMWErXSYRc5v7JBT6ywk6kOtY9nHKNpPH1IBdR78J4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAvrdT3X9n/yb9EOBvBqn+yMs/cQf13vQWziYXJ4S9ktiHJLHgXdiuo4WFc9X+U+99GRyIuFZjtILT5FQVs2vIZhjMesF44YWsc+4aGDWHnnywGzt2vyGkb/JQnaETxKyEp+W6F25j/600q1Rboda9os/alIM9NC+dzJ0luYkPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op7VPV6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYIHepnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op7VPV6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYIHepnp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmnCD2652020
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=; b=op7VPV6NmM8jKMcZ
	wMx7pL7Q+WP58EWAJ3qDyW5Feedf4y9JHQJjKBu/oeHqpggNUWwOBaBeSPnU9wR3
	fv0vg0FxhsJ2MOH4cAAayVvl62c/w00YLsQG01m55J2fGKIz0r/7A7SG9OdGVI8h
	5IslqqkrXnAP+ntKPoJxl4UG8RmBLnxS4EPrGlWAtZFFc0XZ5a7naGBzCurBhW3T
	LJQHe/SA9VaPFWtyA3zgSArjJd2eb3E01UJvOrf7aWGo0U7lUBdjlfWzsNeM2znu
	9yr//FvaKM4yjKhfCYp1zBQqr0yJMKGivF7uajcqkYPWFdeleBNWPCTj+Aosvnj2
	njGDIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0hj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:05:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffd22d2b1so7801471cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782703; x=1789387503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=QYIHepnpsqujDRnsb2puiA+MvM812tzmVuTI0ztuSL/ocmELtKsrMt+tlAESBgOgVQ
         RLgykWXqD1mtWIeZkpq2nDOKwEjZf4oqxnzGV9SEAOIMIsavp91M0FnuzSPDniDC3BXX
         oqnKaaxGOHGiSZLNYbcRvYlGWLYvUs6PFgPzbVedkd8cmgnBwCu2YGfg/o6NLRpJl4hD
         XKRq9b0mVjPwP7IR4XTaTaLFo/6rNAZ3wxQ1RwCe8yHTHp9SUBnI9g8LHE+f/fhrGFdG
         anU/DAXO4dYFRG2d2gc4xJv0u3EFsdqpY6GIc2boFYGSDZsiDRIftKXFd7qUx3BG+aVm
         E/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782703; x=1789387503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=CfIZ5+OsKTy+F9jUYpCiuWKAM76OrdVJR17kovqhn7CCXevtipms1Q8zKruNPEJMRO
         WYAa7H0tYolewg771CQrHyEm2JnaOUfwLzZEVzCWZLA8dgtqZTkPRjedIQMMh0n5ATV5
         KWpFVmrIw81Zu6Dtm3YH8HrrNNUmZWsJZZKEfz4YtOqPihY+4WLq7ZX+lZxqO5kfqPcw
         VUwz46AUDcyEBmpUCMnXpiXQXSopRPz3mE94K+m/0q4nUJv6xeP2Zxonx3K3RyyAd7aJ
         Urv5uNVMTEQXYzckkQUtvmy1A5eTBDgzPPjID5rXIKF2sinF2pCdgntgmmUHC2/3p/yG
         8VWA==
X-Forwarded-Encrypted: i=1; AKwUvBw/mEldJ9kaqWi2Ygbc2MESba9yldB/HYUqfd8LQTksZ3m8QalBdKPJ3JkEoeP7A4wqFbb5YvTUHU9ZV38=@vger.kernel.org
X-Gm-Message-State: AFuF++nTHJQxmxNn2MlJCXrpmes+EsteAptxP115j6mgqTDHL2VpeUYV
	JUKOOwG2H6vNNxm4aw4wVls8i5fE0G5nblJdosQBe9EFwnMCpuyGBeRhZOP4txO6rI9CgdS+xQ0
	N/xRfZpgU8NtI6xQsHYEc+vfXgSKq5E/xNaara7/j9War0UoMlo+VevSZLFKs7Czb70o=
X-Gm-Gg: AYBFou3QUSGIl9YLI2er4v1xbOXKX/uHXHTy374bUi+cSplwc1zpqbkSwHaf2XBb4pg
	AHB1MSEUPoiyznh6aP/sA6kBzCL5vax3bKmQSN+L33Bn2CffATJg4Q1sIOZkYrWtwguqkBkL2kS
	+1EQVzJqBYJQ3la1zIJazVi7LvSMNuHDS/Tuq76NB/F+7IIaBxiA47HdaqRRuMzpYPJc+WB0JSs
	nMzBUlEXbonzRqRWqaGoTdzVinF7HSBmje6HeS8UijcumseA427rjuC5aw0hFzAcGYLyqWEP7OB
	qGPKeKkN1sCtoY+1ESwt6GcKMvL5iY6/HwyaSERmHLC5VTiDDTlGeJf0StXbFUsq2lPcDw1pjEY
	JeLjeW5PMaN8JqywYmT1u2iYDy6zyBKkNSA==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130309921cf.2.1788782702920;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130309241cf.2.1788782702399;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm205136585e9.0.2026.09.07.05.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:05:01 -0700 (PDT)
Message-ID: <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea86f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OuZLqq7tAAAA:8 a=7cKmDxSfVGQto59j-ZYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: K_yzDji5qYZvXg_jrp1_LXC7zdNNNe9E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX9EdI+DxC2I3U
 RjloETZxtoOMqMuz61adT0rL6wjcddBHSG+jntvzGPx2Uo/1hOqsOiEXY3hFvEHBig9nqquOueJ
 4hV2SeK94D28s1LtzNcHePAnnyxWTF8=
X-Proofpoint-GUID: K_yzDji5qYZvXg_jrp1_LXC7zdNNNe9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX6HJMvFiYDDdu
 M0UmjYA2hL54PRsqQCGdrUYqH06B8U9fGwx2n/czuyCordjDFclWjijhBiTx2WXwHdL6av+xR7I
 UHjMZHUtwRIITjH80doTcbYgzG01EPphz4i3AqaRAubpFObiksmQ1KZOdT5jGuWzWhYEYX7j4Z7
 585R1fGZEk6ciDaXTfKO4LcCUxmIDlFO+CAqj1Tx/PSWWiBTMDjiZMS8jjFZOo6TkdxAJtZG8GO
 VKovLgCZdjjB5PSBhDGHJOsed67Q7vlEducuGgZRWi4rSYlp25JxaZKQH5hvqNqsr2VgHnDC0VJ
 Hs/SpuXhbt2CEcyu23SFtzjXnu6Bcud27L0FQ5ErPPyjjKgbYGipOCikW5xBTy1JoQkOvbDWi55
 v7Cy+lII/jUxAw2ZKG9tF5d30tyYeNnUiutWTf8dx2bJTjt0D7TOrDB2Gw1DnP51WTbI2mnwt0Q
 ++LHSxPhpScmzojhacg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133



On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

I told the robot to take a look again (and again and again
a couple more times until it stopped complaining)..

The following feedback is meaningful:

Hi Muzaffer,

  `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
  the function. Please populate the corresponding PINGROUP slots:

    GPIO8:  mux 11
    GPIO9:  mux 12
    GPIO12: mux 12
    GPIO13: mux 12

  Minor nit: use MODULE_LICENSE("GPL") to match the nearby Qualcomm
  pinctrl drivers. // and checkpatch will ask you to do the same

Konrad
