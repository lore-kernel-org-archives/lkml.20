Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE551119D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951241; cv=none; b=HvYXLYSx8RZD2BERwf5SN2h5yAFQsMdZAVBER4y8RYBo5T7lSKLFxstMSUml8s0hS6PC1X6GuLWQK7n1YFSwC9TmGF9jeMp3SYaydzd68ZyGUK96OS0JA5+ed57Cvysjfx7e9Gjyxx0ZSSm3WslrRDsbkb4IV6S/5dLfpwUDVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951241; c=relaxed/simple;
	bh=sTYzyAIDtgmXo2D7GCEW0eRrv4kFNmqIcx6jjkjaACg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxfWaDnV9wqM/iObtyV+QBFGr4hL3NV9fSE0fD78GMDoXYdU49U6FAaWFx/QmWbyjC/6sEO17nv/NYgWri1RxhP/BsPA0PGyX+NUtwESHUDqME6FXj1DkrppCk7veMl16cNT86MBinWDjEAVEzVRM2Wec4wEjYBg9KPUjjqFMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e33GuiGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV/7xaWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e33GuiGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV/7xaWJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AqqbX1937617
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 10:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=; b=e33GuiGffVPuUgLp
	WSlanOyHspbYfh+r4I3dY+0va3xghkGCO6ddcQ5XHv813ymwvWtVCzNJfjGYcqo2
	ZrRWPGRrl6xIecuuGGX3Q2QQT8Vkcbbww1BKBqR4aeox4LfjHvpJbNxYseBRPJUI
	0ZMUyXWG+MSYB7Ok8+iHkBSHCeyaKQbbigkV4TSd2tDjzad7Tkj3L8dvcLJceMr8
	y4+QMXfVStrhak2yA0sgqhVz8wfkWN4c8/utg1juULW8l+F92r+87kvNFu6zdYSm
	dQxj5v4g+NKD0ctJLbHEvgYm1r/BszvIATGVQLgJlel95JrFUdV3JdiM0Eg3CmN5
	Y0aEmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x809x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:53:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso72081585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951233; x=1789556033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=;
        b=LV/7xaWJXfubcvX665zTbE7wn3epchiKGihfjlJamIX34jgchgwfjd3lod/ygUp9vU
         1f2+/8t7D9T2ev1AL7mJznGhxY1mcqPXPtpJA3kXU7Dn1w5kstgE/nyfeBgcNKDwpXGX
         QJ1eFWx9YS7Pjy07oEmOsNwoQIyz05n9qYWfrbB8pwU2eQGv+jUajJQL5W9BR27UrZjE
         QCAyDeaX9IkUx/YSf6nTyXcqM7mnrOdb52jun65yIfFwEWfv9oLgknAoY2JVpOt8sbN1
         ashXaaErz8dqerzA2P+BRqrjNzRCbiw6gxpkDpW2+D+8xwgOeLtIvXo4BKfx6adTSFzb
         Wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951233; x=1789556033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=;
        b=W8FwKaa5UT9SZjymPz/hCD40MTLSehS1J/YsGG2qKiTCg+kh1p/DLEOkiSGTSA0AZQ
         e6Kzv0sdN1fGHG1qlFePaVXYsi9NP1wNFPYgBPL9quRx2o/juFT7d7KLGTrJt0hp7p2g
         widi+T5ljIsDOtrHc3czYG4lfyzNSHtf09WSwXKgn5bWdhPr/xu4KXliGbEHUD+pvxAa
         FgBb9edf2QkFSZ3mJfh1ZXbdHJjXkeDPhZwlCuWEH8tMpsilR7S7z59dF4Tu/1PKVCuu
         B+zt094B91y6Ec8jagVAjxB1R2VL9LZWafUUS/PFnqooJctWBbtnydi6Y0EYUuj684cH
         wbNw==
X-Forwarded-Encrypted: i=1; AKwUvBxf6zoQp8J3IxKgmVbAhNQNs31sUz72xnFYnN+3z5nESCriys+G/nZD6PwD01Fsi0bafJLg1ffOIFFxQhE=@vger.kernel.org
X-Gm-Message-State: AFuF++kWlsLpPhpnU+mUrxaUImTJegUk08kzeZA9E/kgucW8eIzyGy05
	jvaEh9JYRjxAvctkiwYXreLM53ltimvKOVbplq7hRyY5dyn0NNibWIje3uWr88EHvWMKrXigIak
	XE6DkyqaPA0nqWxo8jTTLZuAFctId12q63GPTuVMP/UZ0lSJH+XVUnq1PepKbmgXf18Q=
X-Gm-Gg: AYBFou2RTNk9gjzzhLP4LN7ElsNbs8xrVmHhTFo7mC7w+fCwX3uiS6M0ug5OUlEjak7
	J2ipuNu5FpLBg/yPTJt/q4bxIlPdM13tCqBoiNtk6PDuiCHtozMA8/U5HUNYLlkS0NmPMX9/Eop
	V4eveA73Xi2EUhYt82oi+t29oVE6jutPpKtTyt8WhxzZesthKVSLiaNWPkuDVnhOXvzCWtp5NHL
	fGHHwukYZLiobJI12IoxW0+ACyvi48TNe/4SPtIc5O2AlUpgQNzESbByKylZQQwTI/egD4Rxac/
	RLGhCSXlTMNA07f7wNiyXG9n+wC90aF4dVIqkDwWJodkm13YRZr7eVBQ+VMu43DRZ4N52ofHF2G
	thm9odc85Ub0xrD19HK8QXg==
X-Received: by 2002:a05:620a:2844:b0:92e:6485:f640 with SMTP id af79cd13be357-93991865bbbmr2289483585a.4.1788951232781;
        Wed, 09 Sep 2026 03:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:92e:6485:f640 with SMTP id af79cd13be357-93991865bbbmr2289480785a.4.1788951232253;
        Wed, 09 Sep 2026 03:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm753213166b.34.2026.09.09.03.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:53:51 -0700 (PDT)
Message-ID: <cbe90e91-96de-4d05-bb15-9b9a9774cfc1@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX2Br3Ap0Pplyb
 1wpYKmz6jcA4RFthacaMRv5o2k7S2rULPpGuPCnte4t5D9Bz073Qi6vFYmIVlOfzV2P6nMMLhfn
 c/SVyYzwgs3z9QPK474foimwWWn5uKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX55oX0WclVWuW
 Zsw8wkkni5iRP8Mm987OwtdHTOqnJ12FnXqLDbTkJrJuQt33g/0DLBNGkOwOlAtw7UcM9OlgpHx
 8vCHGy9CDPRI1TeXb1lw7O+R9zZoNhU7ZjSW1YIdtKhtdVZrlJ6Qewz6Qc9uAAC6xOVSC9SByo+
 PgmRVIRpFMc26BbUsoEl00/wr+4w7tLQMUa+lRNhsj0SMu0EbwQlsqxVIK4ndcmtZX7Z2jjdJCB
 nfxVEiznO9Fe36o/51nqPCPhntipUqSltiRlIJUUYWg2bvjJIKtOZQ0RqVrCbGo+K3TfEGXJAcY
 01W5LuUPFFvDA1rV1bDAOkRnisDP7LvrHsJdORFecMNtB/D02eX5z8M5fyBvIQf8HIcHbtuNzvz
 8nY4Ig2TELXnB4SwBDrBaIpNFKLvT+X/DALMrcasQOjlbZbK9eH7sFPiFXap5MLK+zRQDLfRU9j
 10nW4O4N7kSzQIW7Z+w==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa13ac1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iI2QsGKwy_EL_xBlssYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p967EEkjSKXNRpVQo_JeZARCE5Z1KfnS
X-Proofpoint-GUID: p967EEkjSKXNRpVQo_JeZARCE5Z1KfnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/5/26 2:48 AM, Krishna Chaitanya Chundru wrote:
> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
> to check whether every downstream endpoint can be put into D3cold before
> bothering to move the link to L2. If no endpoint supports it, the
> function returns early and leaves the link up.
> 
> Querying D3cold support during shutdown is actively harmful, not just
> slow: pci_host_common_d3cold_possible() requires every active endpoint
> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
> is still in D0 -- which is common, since endpoint drivers aren't
> guaranteed to have suspended by the time the host's shutdown path runs
> the check fails and dw_pcie_suspend_noirq() returns early without ever
> moving the link to L2, leaving it up right up to the point where the
> system cuts power/clocks to the controller.
> 
> Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
> explicitly to force this behavior, rather than having
> dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
> system_state. Still call pci_host_common_d3cold_possible()
> unconditionally, since it's also how "pme_capable" gets set, but ignore
> its return value when force_d3cold is set and force L2 entry regardless.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index f5a38e6fd8d7..a8a3861c2956 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	bool pme_capable = false;
> +	bool d3cold, pme_capable = false;

"d3cold_possible" or "_allowed" (although "_possible" follows the
helper name so perhaps it's better) would be more descriptive here

Konrad

>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
> +	if (!d3cold && !pci->pp.force_d3cold)
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index a53ac27cd244..8becf4e62703 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -471,6 +471,7 @@ struct dw_pcie_rp {
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
>  	bool			skip_pwrctrl_off;
> +	bool			force_d3cold;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
