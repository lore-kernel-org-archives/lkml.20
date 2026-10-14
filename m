Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A604A2049
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979171; cv=none; b=FrvI2+EPGR0JKuMx1RKN/c1FqQiHmtIYDZJMoC2xYzlQVdZ/SJbQ1ypmIaS6zx3PSYHShbah7K0Wi9lOgOZwchbKoZdcBQoflQ7EGIBMCJQKrLNKSGD8xWep4LFITx9rqsJi2RdxQUJIRwHYONTPqdEV65HDDDmbWWE5v+DXzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979171; c=relaxed/simple;
	bh=4yOusH5q1NIC2nd1oSTIsHSlVu1J3DzSXZ1Kg6T47co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meQU2VuhNDDyG8fb/1c7xXagoIqughtHr1cktNQlXRMXKpQln64oWb5Z6IZyx98QuaZiBiyAwrf83XE+fmfD728L8TgG4yPGpB5gQIgGha2dFJhMFXnSw/BF9ImPtiJhX1mvAVEeyyuWFY5ROOovv4yI4VCqFaVMtqRyD2httH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPxdFCpr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c36Pzscv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPxdFCpr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c36Pzscv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBbATb2685707
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/uCRlVMAqy7eCFuaj3wXxfur
	qUD1vtPw5DJJFNPzZNQ=; b=ZPxdFCprxjrbe+0gJiTbbQYm8m4KelF3UKil1fTa
	zVD/qs9Y9uDpNHoq43qJUGDF7ye+VGTxb9+TcY+0rlj1Gds3R9i2qmFpDHv56JXP
	IHS926sjbQxiccn+xZXTSwdUkN2AUdwpWQjUME6Lkquyx1zdlCQmOTSYVnA/X83W
	0OcLm7TdT0he3d7IY6EWRRK+A4WG5YLV07nQBs4BZ+SxKxYqY/DId/8kl3RZdcCb
	kH4H2epvDKN9adqcQ+TnMmjNu/A0oIq60fBu6x9Fvdisu90c72caNARBJHUfBwkv
	L9vhW3YwXOG4nFZ65iQ9ZeTAyojF+2eloPGF3poXRxvpvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1d61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:59:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso34011485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979167; x=1792583967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uCRlVMAqy7eCFuaj3wXxfurqUD1vtPw5DJJFNPzZNQ=;
        b=c36PzscvGASzA02pXJ0cx6vYMqZRhq9x960FWrclS1yAqIOEMqDA3g9+jMuc1lFUar
         yAlTyWhE7lVtJIieyn79aUX8PGfBpKf8+Rg82AjSQ8ddKXeMLeGOg9w/QD4RXfvZKz0I
         p3KRUDGctGM+ffQah4QCQ8LVEmVm5LEFkdRshSs7B4VJKu2nBCpBkxiwodQI/8Qlx7tg
         +tGQMGh/gzZX5YdBjIda6Rf14TFOX1rs18l/t6tQ7IlW9nUL+jtaffyPDjn8cxc8ZRg1
         LEicFE3Bna4GA3fQp24cbeqxsn0WYh15T2zTza5upylS8BbUjg450eA2y8Vpl6ne3bxl
         IdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979167; x=1792583967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uCRlVMAqy7eCFuaj3wXxfurqUD1vtPw5DJJFNPzZNQ=;
        b=GEMV6iJGpJYmS764kREo72wRnSdd8NQhplFlgVmkIeMQZwGsIZ96WNGrMhUyB1nwZS
         BCMzAzKsVYkFuxfujOLrGDynVsOJXoA+JYri1eElZ4PIfXG9R/8lSn4IT3PdM+xpiwk1
         eUVi1ZzEYCRlnxGv3O0FNNaEt/2wf09xfPOHF0nEWoOK9WCIPj5qgN+I1r5KJlrBkcLB
         FQ+mTmKz/R7Rf9uY0LudoH2GPqDFArDt6fpysey6idacIr5HirCYSs6kJpEBCoB3JxYe
         C2x0/z1Aa2e7GipiQKMnhFMLwFlMpbPnZSqOX5kUPttMElnTfvQghEoOM1EcbnnT6Ilh
         aUXw==
X-Forwarded-Encrypted: i=1; AKwUvBxrTMYT4V0AR6DnO2tIYsv4nCvlbaeBIx6XihMAPysGBWfQzmvP+WwW3cJo20jX3tvqspZ5lzMU9sXG4rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3mdbKA6+tCsj7FqmttIpDgXH9ox0yCXid2rYxyhFKf7wy6234
	fmLrr7bzlZwaue2ULUrupnS+KIFX00WbZ+ziDjb7k86p3LI3vhH+85/nAG0KnvIrAp+bUsZcvEg
	+z3cBPZYKpC+RbpgD4GY55SuWFTXc6qZrDX23ODthsN4sxr2w5aZHiK7QD4AHwuv6OlI=
X-Gm-Gg: AYBFou3f8/OX2vuTNMj0KMfux81CwGhR1EZTltZK/gXt8+Mm55f9RJwWTHslcKO0vlV
	4Gx9hF2hO6ltPzqxz/1XI8EaYWQDW9RkkiwSbdBnyGT4Ui1am5QySKRhoUV3pBIzDee2716HpUe
	zwwrcz9dvVi0XFgzJoXdrJ/LFQqBzHPfr+9q+qxzTeA3f3l0L9nZWQleDoWPzs0cDkrDfasGXuV
	wWrwSnRb0NldyhcPNJQts8TWUqIwt4Otfp3Q6O3JASHJaT/LKDuVXK2jq86LawxZBdxG/+/z1bk
	YkEU9wxnzXKaBKKXDrUgzCVhulGiumBZiRY7nFa9Vj1piGnSbXvgeZ11LX4XxjHUDXRQJxkVR6j
	xQRJiS7WmatelFG9J
X-Received: by 2002:a05:620a:17aa:b0:93c:c162:1260 with SMTP id af79cd13be357-93ebd24a4camr2496251085a.38.1791979167397;
        Wed, 14 Oct 2026 04:59:27 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93c:c162:1260 with SMTP id af79cd13be357-93ebd24a4camr2496246685a.38.1791979166650;
        Wed, 14 Oct 2026 04:59:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm348705555e9.2.2026.10.14.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:59:25 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:59:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX2kBJq3SiVfzy
 SeMYXZIf62sAfQKKIAdGPRIWwidyzj15ZAHNmKgy75Xew0KNh3o8w4NESIKPiHjJdnX/SJa8xQm
 aSohhj0tVt+XLFFGT3XhHvZRMvcO/7s=
X-Proofpoint-GUID: lbUjnxciNzqFuf7B0sddEei_sJFhewgh
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf6ea0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gJZM9B_m1BTaeA-VxdEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX0B0L4LUqpYnF
 ZTexK6t9BSrtzPfmZlj7GzeFRvWaojX5x43Nq/ToJ1mGVk8j1IzFenCovPc1PBajmVM/Rvd1iQl
 vGAzZSM3j7sy4uyR8X/BYpjBHL6rwswH/DAOH6ABvFK/K9XLrUC/UiyOguVx+q8w25MwbJchC1r
 QAu2tVapPoZH6LHNi/tP6STRXZOU9uEMT02QN8r5c0O3tPxmLnSLKsOY2IZFlndt2WA3eV+eWA5
 Z/w3Aciy5ruJw3JK3EH0OjGeL7J0XU3Gj0y1MIjE7u3DxnDOCCIcjuf/szMBn9E9jrzoslqQ0vg
 nC7pVFnR5dAtKYfEnVMeXLb3XaFrKXQ+06lErhnx82mFAU1BK6pYFNh1dJ6aDFmB0QR4eJcxOLz
 +yJLABUxMHzoa6DFNMMZpP+b1Dcw67Po5IL6PeH1sHj6OW9/y4me1M97ZhoB0ktJ9IoFYCftvkW
 HaV0vkQYhmxJ+wyzWUw==
X-Proofpoint-ORIG-GUID: lbUjnxciNzqFuf7B0sddEei_sJFhewgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140047

On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> 
> 
> On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > gets stuck off when powering back on, preventing the system from resuming.
> > 
> > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > state across suspend and allow the system to resume.
> > 
> > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > Assisted-by: LLM
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> 
> Hi Abel,
> 
> Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> collapses.
> 
> For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> 
> https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> Can you please try if above changes are helping on Eliza also?

Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
CONFIG_HOTPLUG_PCI_PCIE did the trick. 

Suspend/resume works fine now on Eliza, so this patch can be ignored then.

Thanks,
Abel
