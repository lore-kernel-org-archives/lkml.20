Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDDA370D79
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182918; cv=none; b=XNLoADTSy67eqdwknhXgfrJss8Zvh31dWmP3BO4gUL8Wuqn1axeybaL0qL5F58SyTRwdysbeTvvTQ0bbACQ70PGx4p+J4FttjjytN3di/6PWl2ae927pHIPSMmq0U/avuBQ79fNk4ppSyTuVjIX3qxt9AtsWqQ+4QnCy6FCD6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182918; c=relaxed/simple;
	bh=4/8ehls3yBatXQfQCImN2YqHIsFtxUEWPcEffpe2/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Um14cUz4qrDCMRwpE9H70D/wvpCmTKGiQVSPK+Ww5dXzKRM1FL/X3pAtc2kbuhyizx2F9vIcrxphmSy8rcAcwImEn81BtxiH9i9gPXDtSVcrRIu4l1Xc2Bp3cRaSfSE692OYEsvGU8fDiSPGPhHtNG8K2epu3VuMsfGYb+XhZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuuAhvQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEmfOI2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuuAhvQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEmfOI2b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510CDl470971
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNEvzPR/McwJcZtZylhbx7Iq
	i8eYESxtxZuv6CuoKqU=; b=ZuuAhvQai7HGVzwl7n/rYyZjg/azhcB1w7ZPJr1Z
	sI+mrpRSfjRxlfC9bU2UzM+2p3xtjFSpJCKf9yTTdg5AGPMes+1kFUp2DndYu+AO
	OE4JYVD7Y8RQW9G1GwXqV6cJ04Kp0hLJOsSWWqTDXJ2OguVs82BQlNKak+ghU6ID
	GDyzqWENx2Ln5zMzRfvvh13Vwowo55HdmULbCQow7k3HCfGWDbNBEsXiC6s11lu2
	jc12ssoH/ZoqfeS0s/ZXy01b5yKNfcQ9nHiy8DsUPTst3NcHPE5UJlhd/77x92nP
	vnkY7h6oh+4qpz/I9HNYIf65m+oQJyjjwWlU6QCGJwMoqw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucspw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:48:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988ce887bc2so1387905241.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182914; x=1791787714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNEvzPR/McwJcZtZylhbx7Iqi8eYESxtxZuv6CuoKqU=;
        b=FEmfOI2bWrVDCi750gZwSNWNanHgc5GVzhm8W5k8stXOZuUI4QmPBt+MnlEDeztkrY
         BcZj1fuS/6Qfe/uOTydjl+BQbpB90P3RLGY8PpVdU04JAOB1qJ4woim2oDOfY9Sj5j5J
         4XNNgsk/UfTNmD18wF7VWBaQJtGZzoxA7yrorQsbA95vXBxbSw0B+IH3Y0Epyo2FDxnr
         IvtI9QpjHTfPpHuunP5LE/Qsei0QYZvPrfJw1DwtXF1109sl7wC0Wea6K+VP5EUozTVG
         0qqfpH9hjI1HM3LA5AM8rBemYfSBNR32UMWPEXKdlhZMTZpaZzODJGxqlaOBcq6s1GaP
         J/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182914; x=1791787714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNEvzPR/McwJcZtZylhbx7Iqi8eYESxtxZuv6CuoKqU=;
        b=DFxvOTtqVNe3V++QMdzeTMlDmfQSdFNFKLIXKtJv7DDdP0QbaA0KVlbTEeftGb6ex+
         ASYHqZFimxue+2Ty6zl+nFu7WtO/yoKv8O9xw2fJWOiPuQkxlTKdJKkBygrRxnMyGt0Q
         apadcXjQkt6bh+JWnZDmWra389xuPOyLN5Kb8U7fMsY7N2my8uWKX7LxG+rjEnUsaiDB
         /SUwi+w0hHgVPPFD/WmfrECt4A9zfbg95r4A6Kzg9abz58vmKPaGfIrCx+R0EywhE8rs
         Nvt9EJKjS57bpfYE8NN81q/+OOfu4kjxE7bpMFMRns3Ti24j1sus3lFHlKz0pcxS2YMc
         5TCw==
X-Forwarded-Encrypted: i=1; AKwUvBxYMRefc3p97qzDqkjuwFTmZKNP8tjGp1UTr89u8CYVHbiZzdEqUz655cQZ4qkkbH4lWr67v7D03AidjRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxQFUMK19vC5fEuEwUfcNXlOieECxlzN+XZoYn+Wo3GdG9zewB
	/6BjBzTzKJQpED5hGlKhw8Og+oXdpb4EBQyXqNwfnxoPBzDpxOfVEefsc2cFboUMBRcRY8j05vv
	CHu+M6iJN6EXVoWfmUNLXHfEt3nyC2ikEQ6IC87tpWjwWaW6o/siq29+1htaqchoJZv0=
X-Gm-Gg: AYBFou0WP+jumSxQU2arYWuV+BJ1Zq2vKLT66UKzpj8euCWn2LMg/EN///KpEiKe6H3
	nB1NiQ6Dt+/4sdDIPp6oY/78YlSh6/K0Hoewo1foHtpYdY9iz3xAp9JX+yNqCB0skbIRfHZUY+T
	Q2ERhR+TUYiEmjeQQ5P4vQjpnh0swIZa3wvZM+JXtiXAq7E+RopZJ41bwCe3Rw9gukeXwlQ4Qgg
	rOkEmmz6QD5zjSzag4Xqzm1iRdg6evcdLKq3AB4PxhVvlClw2jzsfZktrVAt4y/saptlvQzeLDO
	WIXUpey8wPjan92RptPgcaYQMJI1CVv2H/WKEW8uz1W+wmqeo/ZMlHpTt/0Gj3UZDD8m5DTXa5e
	cpUvxjfwwKh3e0Ce7gKPCj0gDSEB1Nb0b5ueNP5RTYmekbGQJWeAFtJ+OBzHiXUomkFYQwVSbD4
	/LOvsK0vegtfDu
X-Received: by 2002:a05:6102:5813:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7c3c0b9a66emr906710137.24.1791182914133;
        Sun, 04 Oct 2026 23:48:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7c3c0b9a66emr906702137.24.1791182913641;
        Sun, 04 Oct 2026 23:48:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303450sm38747251fa.18.2026.10.04.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:48:32 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:48:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adriel Santos <adriel@adriel.eu>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on
 gpio12
Message-ID: <b2lo7f4sbda3pou2ha5l5sqxybr5g3hag6qrcr6cab3dc2poil@wzxjjzjxdslv>
References: <20261002160958.908424-1-adriel@adriel.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX8snd/7Kgi18I
 Wkdn7aY/k03JziIH8P1iVoquS6/nCJYXz2Yf4SWw9GUzaTfggpiw9ji4HW6IJI+EXr8iakch6R/
 OfUdlrpAvxdFeDvTkssUcLObcLQN58c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX1w4vNkPBSAIG
 3+FdObnKQ2ViDFNUwgb3YNo6HqA1IWikp6vrKfQxx265y4gUhGmb9tdJwBX1RyMfy1j9UVYAB9m
 STPni2OXX/TzTbXnF+qyjLxeBZbxR+WUHcPgCYCIuZVeRPGRvF5CCmQTS//pNbgQSK2780XIpZz
 Ap3K2PFYhjqZds7F3lEc3T4nyG+2l/EDdvakavMTP0k5CvnI2fP8KN/sHh40psOxCBi+pz0lzV2
 E/37JMnjQ7ED/FDUC1HCulzmYlEspwqPttUKZ/9TFj7z7xbrwkqeN39FYYOvw1uaVKiEQKriL4l
 k+h8WXPGivOsvDNnxJ8YdoVVfOmrP8LffxaB3WGgtMmXPzSo6H509Oqz/aNKt62wcitoYHd9azF
 HlmVzFxOZ7462T5pYL/1wwNtkq1lGNj+paaGeEfqcBvsoEAD1Cyu8wfcCGbG5m4G5bvrMM9Z8TG
 T5NIFNBbg3kN2jN6+Xw==
X-Proofpoint-GUID: xhjkwu-og6DRByxC67vbeX8-_ttep4Fx
X-Proofpoint-ORIG-GUID: xhjkwu-og6DRByxC67vbeX8-_ttep4Fx
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac34842 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HzX3oSUVnuQZ4ElMAVwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

On Fri, Oct 02, 2026 at 01:09:58PM -0300, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.
> 
> The vendor kernel shipped on that router (Linux 4.4, stock firmware
> 2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
> firmware image, lists these functions for gpio12:
> 
>   gpio, blsp0_spi, blsp0_i2c, blsp1_uart0, _, pwm2, qdss_tracedata_a,
>   _, _, _
> 
> and has pwm3 at function 4 of gpio13, matching commit c6c159fcdb4e
> ("pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13").
> 
> Measured on the board: with gpio12 set to each of the 16 function
> values in turn, and PWM2 held at 0% and then at 100% duty, the pad
> level read back from GPIO_IN follows PWM2 only at function 5. There it
> does not follow PWM channels 0, 1 or 3, and the LED switches with PWM2.
> Functions 4 and 7, which the table leaves empty, do not carry PWM2.
> 
> Put pwm2 in function 5 of gpio12 and list gpio12 in pwm2_groups. Drop
> gpio12 from gcc_plltest_groups: none of its functions is gcc_plltest
> any more, and selecting it would trigger the WARN_ON() in
> msm_pinmux_set_mux().
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
