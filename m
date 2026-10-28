Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180730;
	b=lyTAdEn8eMtNeNePsq+NoZza94+8sWSvwzs1VYU3pr+J1md0/cPMtyHJXEMxkPoYnkXX
	 o5WtXWNDG5KHKKav0En66068zOE2iB4Qdo60EabZQoecPwal6ewqcDr+amN4bY+UzM0js
	 RDEJmB0u9Yj1Fgl66ZGJUl/VJtVqIZvbopJZ5ekyf/0bVtAIVDOOQZ2gG7g8J+9Eg2o7v
	 sEJnkTwJqiuJYIcwMZzpI5YDXYxMv+FUk/rHvbC3ngGhRACB2P0u+HbE41Q3wDuxeR0Wt
	 5Mq5ZO8Jyipyv/6vUyJ1gJWe7CKrPPpdHChLhSZrciOXGFf8U6KeCdQJIcPGsmPwkUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
	b=D9Dl7JgvSSgZQC+aUytbZg/qeuMf5UTrhlrsw2EWS+Oicr0wShib1yL7HB64rfiHOhkZ
	 t17ZbPA4Uu9lsI7NomEw5K3/jHx0uSNDky7xluOTt+KE3BxdtEAM7w5U6cFWTp881DlcV
	 ISHS2lu995oVw/+tHVNeq+QWgC2a8X027Q5x0jeR9Z9Ef+AyTlUnMJRmU76fSBJ07jOf7
	 ufCkGg9aIt/fTcHVmiann5PdzGPKdr9idwMg1F7KAFk3woiEU838rV+s7zPFxA9DnP37N
	 pwz45RZo5bJigPiBiCu/7AIbx0Uj7EZmdFYiJu3x33BH5hazOhPWrqJBCFfrErnDHLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OT2NoEHf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQIUI73f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A2606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OT2NoEHf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQIUI73f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8hBLc3768103
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=; b=OT2NoEHfUeGVmwyH
	U63Kk+O2Q8YOKu5iv1yrYdawHbzUNuj4ZlXWUVxQkf8UktylD6+tgmLkogYnVGkv
	SzmmcHdadMAEL8hy+6Sbv0cFrHntyULgGPzMVAYZQ3mlgiwkI+TT19x3At/wsZY9
	7a0kQeFLrYcTN9Bz58nLSHaTkB3HY7pCws/bKcEYaikejWNh6lfNYYR0iCWXUd5q
	m49ZmqtOTrmDCpPMZPCspXzJrRtE6ktQMBWTPRe+OVTI9JNXs+yM/jFUvl7/VpA8
	0SW9hnhLQNaJuQLlbhOYlt1TP+sxTbKUlofaLaDqSia9cmOE2pPFxfNZgB8AWF8l
	ucnsqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp079v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso157652285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180728; x=1793785528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
        b=ZQIUI73fPosffKzurOlfXPUeZJXdJiJCiiz1DLdhiC/zBeMvLRVTlk+eHJzJL//yon
         x1/YP1eAUBTCqu1GDNbQcv6Z4uBzZSpqY+P7gNaM+nkfF7pHv/ZzmOQSnLKM9s2Q5jxk
         R8aXA+VPZpOkUghSMJf9AkyRWkn86/ukDmc0XmB7Hd3nMnqIFtyJJLZhVinfHj3S5XwI
         MG42PHn1Vk1WYet2BT0tUJCeBEpVuNQ93zfYFupF+u5VJekXNR3LUGscEhMeAQvmaXq2
         KfzAlfIJKXem9za20A1Il7cqgHCGSac9zsu5fMtdNitrOGIFIcYi2v/GTlR8EJ7lu2ey
         PMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180728; x=1793785528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=frZTF27BrC8OiZme1Pa+xrXgh3Yf15FRXkfaOwaG0nE=;
        b=nFXmGP4625nJAQlpLaZn/Q+wmrrkpg0m9AH9Gg0zCO6AuaNUs8heygn+dmMhRtfcY5
         OyLTiItH5ohKH+UAs8hJevjlfMNKkrxD2GyjXuxtnI7AtvsjP/OSNjdvqvRYj7sG/foP
         h22UatX1xirOLFxE1+aBxjmIgZAmzi4DUek1e9Vh9XaLSS93g9GcREorCDhJnKayUF6N
         AhSjut+NIio+swNPOhkTJI3KAe85bqdTvH3uN7/MIDUXW5EwM4TJRGsXlxwe73aF8QJf
         GWTszLVzDOWwECZqI9LqaIkA35y2O6WV1mHLXTRADfCHBcdQ8A79L2lz6RQ7aANEWkiS
         Oejg==
X-Forwarded-Encrypted: i=1; AKwUvBzPzvlRIPmcRkOKKB9k7aN7dU7+vmI4fSJwBmkluC3Bt/gZlEjDRoEioAKzBJn026w7IcbOZ7cpTmh/W2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDeMLWhWuqFYbdBouwX/BREcVeU7FMyw4uHXGh0f+1SuduHRNA
	U4wqKZ7+bzCe3X93vgT5La6JHTDLcfnpziBtIrET+QBh5JAKofvw2RvXePTeF2M/0+OAQDJ3JAn
	nNS3K2+aBJH61zHARx5jh2WTJ/koDtzyKFrWq7590iyTXRteNTiMMSe0s3qWK3Svy3LU=
X-Gm-Gg: AYBFou3uuFhtbdkZiQEEV3k8Wj/I0FFtnn0YijYA0K/nP+cGi8GWDwMJsLNBLuPisxj
	QS3thBU2Ez6WBvtpwapGJXgEfHQJJh5P4T0pxfo0JlRzwcgHfMHMafiVQAc0ZtUuKVqSUUkiGns
	7rNTXMTInVvBUq1FEuxO8jMUd98UUSlaYAQ1iVblwu4xtNz40UUT3E59ztAaO0FRRRwuKePqTve
	oRJqJmb7kvEnnbJP1ZjcGHQ10y4iEtYCYVvleVc3jkQ9sxSeMwyV9sXaF9GlMf25NypmpiBq6JW
	nP601XO3UELLmOpHf+wU2/MT+tSWa4G5Cqf6nFzTWiTTNKoq4tyweVew0x/JSsb/u0KFrw01Qew
	odSH/Q5eGbVbSnoboCCWK+DxGS3w4+u8XhzT6CjSxIk5zNvhhxQx3abkAZHm07vO65g==
X-Received: by 2002:a05:620a:2724:b0:93e:c35b:2332 with SMTP id af79cd13be357-94408d39620mr210233685a.73.1793180727674;
        Wed, 28 Oct 2026 02:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2724:b0:93e:c35b:2332 with SMTP id af79cd13be357-94408d39620mr210230885a.73.1793180727022;
        Wed, 28 Oct 2026 02:45:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a979412e04sm37684805e9.14.2026.10.28.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:45:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:45:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <ujudp6c5upvgghpckgxdajjzvtyxffgk3advnkrqhencgglikg@6cva4nuxtvqs>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
 <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
 <76mvypefoe6l5c26xdycrxcyrtkpxmnybi6bm5xyudqqcbawg6@5dzvmwkhqk2e>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76mvypefoe6l5c26xdycrxcyrtkpxmnybi6bm5xyudqqcbawg6@5dzvmwkhqk2e>
X-Proofpoint-GUID: 3Y64R7JxIt53ezJSi9dGjHkpFgnyAPtN
X-Proofpoint-ORIG-GUID: 3Y64R7JxIt53ezJSi9dGjHkpFgnyAPtN
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1c438 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CaYS8H3vlbMVu9Z9StYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX16UQ4VgOo0Dw
 kW1C3dnNXx8n6ScWhxn+6hqiAXkbIwo03XR8IxR4ifS77Ht8L93eSAXKrUxmyhTvpk9zXOQoxDy
 hPOUEuDhrK+NH+3kg2/GWx2q8p9ukwJR/SVuTftOXHHYSLhYloEHI4xbFvQGgGtH1qq89CCgHkh
 ArD0MhEZ6QPZ41uqrOzATeB8v/poMbryWm5XFq8DiPhF611P/bKHgjSc3hQPRyXgHr8S3fgI1O/
 mbL1aKHz5EH6HEkEPkXTEIHaPWJ9QP2H+t8s4Jw6Zi9UJaLARWfFek0PHDnZZh2SAnLOm/JDYCR
 fedEudeok7JfU/SVUMfr7wDLQgwzzbodqp2S/fVEvg+zPHZ3cIpJaSGNyJe9w6MlVu6ZKg21hu+
 m+oTrmEQ/0pZTsfEvLFQGY6rZO9IGJmgXFUwJl9Kga241JRsP3yBuw9xS+q952GnMbfVQFBfK2k
 cPRiUTLjAZKajZSwNYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX0ght+dERWqR9
 6JBza8vxm9SHL8DK4wnPzkan3vOScOvo6L80JUR1yL0dLoGiubrsQqx+KW+pxEvLH2CQPTqthWU
 81YCL7D/zjcb/A4hxZkUSxXCAY0344w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280038

On 26-10-28 04:29:31, Manivannan Sadhasivam wrote:
> On Tue, Oct 20, 2026 at 03:41:54PM +0300, Abel Vesa wrote:
> > On 26-10-14 14:09:04, Loic Poulain wrote:
> > > On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > > >
> > > > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > > > >
> > > > >
> > > > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > > > gets stuck off when powering back on, preventing the system from resuming.
> > > > > >
> > > > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > > > state across suspend and allow the system to resume.
> > > > > >
> > > > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > > > Assisted-by: LLM
> > > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > >
> > > > >
> > > > >
> > > > > Hi Abel,
> > > > >
> > > > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > > > collapses.
> > > > >
> > > > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > > > >
> > > > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > > > >
> > > > > Can you please try if above changes are helping on Eliza also?
> > > >
> > > > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > > > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> > > >
> > > > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> > > 
> > > So should the retention configuration above be conditional on
> > > CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> > > CONFIG_HOTPLUG_PCI_PCIE?
> > 
> > None. I think QCOM_PCIE should select it.
> 
> Nope. It should be selected by defconfig [1].
> 
> Just to clarify on how the hotplug support is fixing this issue. Once we enable
> the hotplug driver, the Root Port will be allowed to enter D3Hot during suspend,
> which is a pre-requisite for powering off the PCIe devices and the controller.
> So once all the conditions are satisfied, the controller and devices will be
> powered off. So even if the PCIe GDSC gets powered off at the end of suspend, it
> won't affect PCIe devices as they already lost their power. So we don't need
> GDSC retention.
> 
> But that being said, if any of the PCIe devices support wakeup like WOL from
> D3Hot, then we do not power off the controller and devices. In that case, GDSC
> retention would be required to keep the controller/device state intact. You can
> reproduce this issue by enabling wakeup for the PCIe device from sysfs and
> attempt suspend.

Thanks for explaining it.

> 
> So to cleanly fix this issue, we need the PCIe controller driver to signal
> retention state to the GDSC driver or the GDSC driver has to figure this on its

So until we have a solution for controling the GDSC retention from PCIe
all the way through provider, what do you think should be the stop gap
solution?

