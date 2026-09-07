Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F838239A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758461; cv=none; b=YMs5ezqF5BK14gE3s0pKFXyEvTXgzPHXugdk1fNWUNj510Z1tuMwOcx6K5QKjFWS9tvAq0riTJIrXskAfn6bR05U/B6Vqm3pH/grJ8BCRO3L8TWmUuLdywbk1t8vPTszvxhSariJ4qxU5SR8hweYDSrkZwYJSoG6HYi1WvaY/YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758461; c=relaxed/simple;
	bh=9BNICUCjnYuSs2tIQEnmzXWtbxa30Ttn26Pcsn6RMNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF/XlZYJ60Zs6mLt2smA+2pgcy4sybUfWXFWCnSQ/uRBjpAMKk9grDhdX0JCkxavPyeltYKOWIxeipOAgX7TLRIVILaSdzSaecWQKFN5Eulck8b3yoK+E5dIDaxUemokeQhIxofJGhYroZAOVaISfsX+Rdb/uPv7tbFDUMqHzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqZ7lyQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs0bdPzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqZ7lyQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs0bdPzA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l54D2276617
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 05:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=; b=GqZ7lyQEHkFMRo4O
	TkDdpR++EibuNdfmpDeaiHQIwrStHnX8y0zG/yR5L/bS9Y5Enawz6Ru6Gs9c2EtE
	hGRBNGv/0Rzr68woDMjuS93uhWa9kwG7Q1kHoOtu12ZIVJfZPL2KqcSrDyAXDlym
	KGEhMXF4YaQ6o++Z7QRwjrubgwJDRHGwbaAAdrhiZ3QrKh38GlwtUvViDfxFo38c
	eDf56HNSUDkhlEfpNon1FBGu6n44VODXg7Cd0XPPZxy/wN1wIywl7Stlzx4MH4Yy
	hSPLcqKVo/fLnubbjWTEjfBUkc6GVTb4rcuDVvhdcfcV2vjzg1wFANXxR5vaLanG
	8BC5YA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkrw1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:20:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85602449126so6246412b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788758457; x=1789363257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=;
        b=hs0bdPzAEt9jSj4n0ty7RTCcyMB2LWWNB2HMRiHlCGyvlTGR7gGkDBWvBPYlV6O+Kq
         TrRjhyCrg17NFExyPsmqc/Y3+DMuTsNPqfu9nSxNWB9OFfcOSeygtdevfqYquUt8KLG6
         HWJKylYkZXL9S7Q/2iiA/CCOORH9C3YrzYkBw08aOTTFwEl+AkXdSdXoUYX2sqoex8K5
         JXOmgYFoCRcEOhGbn+SRQof/FBpaiCo6phDehGc35xRJ7ZaXKF+5+XsBWBHaA5C3G1GE
         nan6OoGwWbNcBm0hh8mS/aYS2dKKFW38bLcAKKDx5E6jmCFg33BFkELqKh+S25RIN3tP
         fzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788758457; x=1789363257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=;
        b=E9iUq6ZAATZDhD0g0JG2YNPxMPpKtYR7Np+UCyoUsV2kCatHvTNNnzaAN+00F4ldkp
         WiTG/PhMQtj/kuECBV76FGKaW7bRt1M9qZXlKi1C2zll3QHedi7Edc7dDJern+ABB3A4
         irQFm1xeiGZdrOCSc3gFTKun1V3D/ejQ6ZRDL9sGyiVYi1vuFLLbOB+kj2P0dImGTJhA
         X6+mjOuokJQdRzfM2FB46xCGaNLs3aQABgtiba/jeGfQvWqehIRjYLVfOfbZFr/9PyDd
         TTMSpSisKeNvp2Fmr3/7rFX9JUIiN7D2I3FtXvPe3jULVv+LmlBTVlptxT197H1u9LhT
         I2Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxkViMLzMLJGCEQsjIKRmBcetLAffwNivbMwgBAyZaXcEzzFOp2dwkca/zw+UpGIqRit2DA+uNMaCM6Xe0=@vger.kernel.org
X-Gm-Message-State: AFuF++napxoGmhUkNjByST1RXpJNHigj73uNSKbAuQLcPbJzdvkt56X9
	DJgG/55quL1S0bYcS0Bd+T2mCQEwBdEM8dcpARvxfqX4UuNWFkxmV9yaObPvhzF6NqZHgMCXKFx
	hVhs8Hok/cnKFN4+0Ncu3YKqU0cvAg4DD4zYmW8e3hLWfq+lhT5mInpdcn0Cswo4TXt8=
X-Gm-Gg: AYBFou1pks9e4bOIpkCyy66k4TCKcWasoiBVa0UboC9N6w0ItZCrdtfr+Szuiio98OL
	4LCLMMl9E4hjWjA18zJkUMxXFlRuV3rS1i5qin4KTHT095jB6CKK7YglNBwYcL5CF3nJp5bGBM0
	dtWAgpXtZrNLW2ePE6vSxwzMUewPozio10h3aaX/KxaosxebguVevNM1UpzfDSeMwvr3Gm8sDMi
	wZUov+Bb60rc7+wNgE7ijyEUM3I109KnAXihj4ACrIMCVZSufRaP+7dmEEvkyfLtWa3AlHqVo4c
	0PYNPrdu8zbbDemm41ObB6fd9D0CS1dw9F5FU4KdGYuMxWJ8TxmJ0crOXrqnpxIYXKoOHR5pSrj
	S95TQRUTKUkimpuO4v0EvTT9J9xrsza0O0H9eN/eOLjrFZKNEv5246/ia2khVK7JX
X-Received: by 2002:a05:6a00:9a9:b0:857:726d:270e with SMTP id d2e1a72fcca58-8616dd533a7mr29855203b3a.26.1788758457577;
        Sun, 06 Sep 2026 22:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a9:b0:857:726d:270e with SMTP id d2e1a72fcca58-8616dd533a7mr29855135b3a.26.1788758457058;
        Sun, 06 Sep 2026 22:20:57 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86278118b7dsm2821348b3a.28.2026.09.06.22.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:20:56 -0700 (PDT)
Message-ID: <8df9e586-d504-434c-a14a-a4553adf535c@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 13:20:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
To: Aamir Ahmed <elb12345@hotmail.co.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
        linux-hardening@vger.kernel.org, stable@vger.kernel.org
References: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1NCBTYWx0ZWRfXwbG9dfCT1cQe
 rl3l96rbsm821EWzS5CT3bIKhY05ssuD71mbDYqGG7eHSscgPsDaNtzEd4ZKwcW2T4GAe0O2cGm
 C8704zhcip5VGMmW+gs6dgMVx9PtGaZIFqVHLfgBnWeUEOBrSiR4RBRpyBoYRY1QtWxXV73WA8H
 OxFYwco0q8eKri5YUzldsr7xL6ubaohQM6xiuphBZgAOKpgcGBvQ8o5yHh3xeZMLlZnX74bnbq0
 VIpGnIwIU7/mPronWIfI68NNF14E3wKxoIQgSZpdn/VFPOxVpoSsE3uHNkPF2Phw73h5eZUbVJr
 YOyqVWHVe3XlpHPJKXmu32nDmQen7HgdbQV1bbnyD2r70b72mi4FdtF+s5NM7NfdLPvhP9qe7+Z
 L5tihXJut9iX7fRmoIF799C+iUx+HKTqgt5LQNNCUBJRcvSAzy1pMTL/asHed+x4MPnULWzQaf4
 VQFinvAvDisZpxEvLTg==
X-Proofpoint-GUID: h2Ne8E3iVTDjaBJ4Nqdjk8sKnMQz9F4e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1NCBTYWx0ZWRfX+r93BJy7COll
 TTuSCHxfyScV5DNaXgve0DPZboELuJXID5HtYhp3OSDsfQkLg/hnoTzvqTUTDhxHI85nI7qvdsN
 aS6gWH+KL9JiZH0xLUikgv51LeC5hCQ=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e49ba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hpht91bhI_x_d6pdDbkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: h2Ne8E3iVTDjaBJ4Nqdjk8sKnMQz9F4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070054



On 9/6/2026 4:48 AM, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ipq_cmn_pll_register_clks() due to .num being assigned
> only after the fixed rate output clocks and the CMN PLL clock have been
> stored in .hws[]. If registering one of the fixed rate clocks fails, the
> unwind loop under unregister_fixed_clk reads .hws[] while .num is still
> zero as well. With CONFIG_UBSAN_BOUNDS and a compiler that implements
> __counted_by (GCC 15.1+ or Clang 20.1+), this triggers an
> array-index-out-of-bounds report during probe, and with
> CONFIG_UBSAN_TRAP the first store traps so the CMN PLL clocks are never
> provided.
> 
> Move the .num initialization to right after the allocation.

Thanks for the change.

Reviewed-by: Luo Jie <jie.luo@oss.qualcomm.com>
