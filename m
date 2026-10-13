Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3503AF667
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879211; cv=pass; b=ize8EleShtmqATgM+acLhx/wQzHd1gFsiM3DMkRXs1ASE9yTLOEkaIthOwMwoHJmD22fcCWQijCT/C3GPfPNuUFbdzsDo3LGC0/mEytsqbYP8WDaiq+KawJVeQhaxdQIrN1hLMzw7z1hZ6aYDzb2jT1mkqlmiVs9oXhzxE5xKgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879211; c=relaxed/simple;
	bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7DP3xtlN9VpwTQZlnbNdknV0XjhULKGPv2GxxLrgrHgN0+GLAvlv35+ATI33TnAIs3KDvRlnzjSrSHm2Ji79RHHV7BtRj259peaF0RZK58Tq/Jm+k56SHu8YO4yvS1WjhTs/YzA05Ang6Xt/h8FgN1U/hNbTaYZjmEuM+NCmjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eakeK1RO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMuRhTGg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eakeK1RO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMuRhTGg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7wrZr3907983
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=; b=eakeK1ROZyb8KPLG
	3/jfbyy3Bp6xBcbhHboSF8Q8FGAnDq6q03VUlPb0Mu9M57aPARFDHNPncw/aNRl4
	ipDLCW1vAyRi3nHyziZ9A3hflTwYSHPLHFEQUIOYj7aj213wk9EYZQQ9spT7JkvZ
	xo+W0bIiPp5e0pE97AzTrZjOgJCgwhLMaBfRG+5i/Q2rnwg0jUXQ0aAwHFVvWZzL
	LYly6BBvnG0fTjdpmdk4uqGqfxDtW29dxR173HDhZgJIjPqqyUkMh1g9dZLQ6Y3k
	539vfPWP7YF0XFiVn7IhA0qLaFGdRkqRirDyX/LUJX8qvB4qR0m+acC/rrkE/8vM
	VBPFjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtf6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46b4b700so480682185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791879208; cv=none;
        d=google.com; s=arc-20260327;
        b=R0sB2eEr/rbRIiPohJTJ3TmW3zaLoTGpLF9LpcILZbo6ZCXYwfQDLmCPRLhj3UA2IT
         k8SysWTOeSyMB9wKEYrFKdisNHEpCCS0jYWNT7mqUVvTIfQhOMIiIE7J0b7kKWE4dn3N
         xrK4cT2bEMnmaK4dUXPs5jaoYqYpjb9xxrsKoSW2iJH0GVKhFKY6SF5R2+YNA3D66vyD
         YfMghRXbZgUtbFHF4zMWjCKB2vSezQqJUW0fEsJTSrbMqSPkmYcqpn9HRcfCOKaNPyPq
         cOzhRpyOHTtRB/lTl2jNGcvOq1Z46O8/JzP3hMdnlPnXoIB5iS8iEh8DXAGx2j4odLdj
         FqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        fh=e4Zsfxm2yKm69pox8Sy2029U/+vzMx+XlCrzyiSqXlA=;
        b=jSCYanVndWN1bzER+eWOimZzR1EWhge7us7nxxwH/EieUOpTWmbJ3oSzg0anifuZTI
         UnxyRhuXUpB2+ngEaBQ3YjXm8fmXVvxt/wbtXYz6xrwj+D7qs16OQCDc+sTZVS/ujPUz
         dmUK9fm271/J8d1+bsqn9WTz4z8p1MoMAZuQSWD3xXjo3o1apLCrmkBrsc4RFVSMB1jE
         kUKJ+9a9fI23FzniFvshWE3G+AW8jzEHHlkqRsEFG9poXfsn2A3YROMvmw1FwX9P6nPs
         OZSR7SBoERUz8U+SRPa58vfX10uJ5haUgvoXBi0bhaejwBqDD5LPn2PoROLjs5/o3jWV
         othw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879208; x=1792484008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        b=OMuRhTGgkvOVaH9NnHyxYbcToGntFkQb+CEerxns7UebVeN+1O+DSgjq6odsd4KyJh
         eDNtVvgMXfCSdZ3qex9S1f4MkgRJu5eqAd0yRbuPRkbX2UA6f7hvawI8yFUkCoaqxfck
         xrMvnog5fvq5ZDzzbWUF60B6yStYDGCgSI2G4GPfSYxVq7V+2Beh4BoIbmmruDAnHuEX
         3JLrpXd4a9gbtEb/lWiHzJUExby3YkaizmQGU5hKwxQ95W6xVdS1tcDP8gYwjLoftm5/
         mTomiUaaXiM7cF4Oi2gte63NnjBk+ME0LJ20HQSgAdb06FJIbKBgul95bWWCcHTLMg4B
         8CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879208; x=1792484008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        b=tr7TRlFdiXjwSfWHiDGsU93u5KwbTT3ZdU7QbDkWtgQuvO/kR42I9I/g3b9omzZCJo
         w4c9QymMTnwul0zCZzwfPzjptcGuU6GmqL7KFl5rHMW1a9ZRbM75OGBGLYOD+T/w7+lJ
         sWYj174M1tFbi4htuK7wN8DoxBlmYlGpVGf0iuR9BqZjIIaSLq6y25SLQ8/vuRGbvEq+
         j3E3WbVjHw8q/srnExXz2J8w3fjQp5RYwylkk5UpWCLhkoaAelYJOTqfv4lgWuPE/Vxu
         +6sAs512j0L+mgVeexFT0M6f39jN5eAJWgqIDp28lDZby0FBnW71ktgCw6ETWewSusUe
         H9TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxelOG92tv5vrQofV+NN+i055ScNzMQ0u9qVyIp7iCP3TY5PvXImYL86bVbAmvMIiNDRF3S2ML6n50jZW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz6s5rp+GDEgDHAkevoDEGFaF5KEVyjER2U4aJNrP2mnaTL38b
	WNiDBaTAjZWwntus+FqZk99ptASc8JfCqnaACJDV45Z+URFozWXoZwTA7PKAF2cS13si/wZm+Z8
	7UP4GzNvwwwywA45z94XifyPj7HDkl9fssCf6l/y/9YkAxb8GVdt7YcF6HOhnjIKSbXGRfsNO+5
	+rIYnECn0lJo3qYu1hjH2FDZ+q0tGDG5i4VGtfavcDPg==
X-Gm-Gg: AYBFou0F5mrmvQvgHh0FFx35i5VTLuWiMT9VZv+JA4fWcFNYSnBrCKphQV+lPe8LRc0
	GjatlqbmEMt0IEPlXgTIIlyy0ix1U+EfBKgGsIgIvIDBtB60KwDTMmQqYhFMJgfhorDKKpb9R87
	SQADqTcKehwHat/eVbn7ejOinljzbv8avXTwmnwdooheXyUQtG2ewzhMeZyyi/OUJ86ApkLijcw
	quY/7Fn+CSg2IcMO0bJw71Gof73uGYIHT17oB6b/IAKtq9P1TFF4pwldgW1UWntsTm1u69r1JkL
X-Received: by 2002:a05:620a:1981:b0:93c:b420:c2a1 with SMTP id af79cd13be357-93ebd26256emr2008880285a.65.1791879207650;
        Tue, 13 Oct 2026 01:13:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1981:b0:93c:b420:c2a1 with SMTP id
 af79cd13be357-93ebd26256emr2008876785a.65.1791879207179; Tue, 13 Oct 2026
 01:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com> <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
In-Reply-To: <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:13:15 +0200
X-Gm-Features: AclHuK8FF1WzYIEKdmFAQIHjYBcgky7I2UfsPLuRu1T02zadG_wSv2Q4BrBkFes
Message-ID: <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX7R3i+8bEBfIY
 0I4ayGNHQBllIAQlERv5LXyOaTY6ok7gmqRN5Q+ffbh2zoPP4KANbN/vvfxRXII9JFIj61bccgN
 e50m+qMJuzjn0vqU3pLHIkGc2ucnIYdsVN4rRELEBcFT7bqblNrBHqR+t0Vbe/ar22xPQ2n8sHo
 SCKB4ANMKNEjQPsXbKnOm6C3E3DGzp6UZGU95+SmUFy5sl9IuveqL8gw6R3k1fCyoNwP8y1x50y
 hMCI4xC2rUDrnv6G70mwab0Uhp0vrWuOjU/nCuyzmjdQvkBiANrSZmFlEohJJVPZSuLddoucNM9
 8FsVv8djG2sK1g4LyVUCHk7+ls2f9nckMw3jjhGi67ICQs0pkOkD4IVPXfKgA8SygdHl1bMjzuF
 Lp//W6YyGJRS4Ohs/OFDoTCq6jQVKIdL9jDQ1hvbyD1DdGyLfM5sQ7Y5ovKwaxRShlrMN6uv/Sy
 QZQwMHjTL1A0ZP9/vXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfXyM7Ze3KVd9qP
 7NW3a5jBrPeHE1jS5PdmJoF6sukurHIPmXPz6LS58eny9keFz5of4NMhCOZSJh/qmggl47B2m8C
 tD5bc4ZD4MhCHDFQmb2334yW9/z6f5M=
X-Proofpoint-ORIG-GUID: vVCsryQpDPOnZSemRNNrV79Qg9LUG81K
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acde828 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BlC6lpywZLIZl5_qNqMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vVCsryQpDPOnZSemRNNrV79Qg9LUG81K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

Hi Folks,

On Mon, Sep 21, 2026 at 2:38=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/2/26 3:48 PM, Manivannan Sadhasivam wrote:
> > On Tue, Aug 25, 2026 at 02:57:15PM +0530, Wei Deng wrote:
> >> Hi Konrad,
> >>
> >> On Wed, 19 Aug 2026 16:24:35 +0200, Konrad Dybcio wrote:
> >>> On 8/19/26 4:13 PM, Wei Deng wrote:
> >>>> On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
> >>>>> Fair point. I will move the port/endpoint anchors to monaco.dtsi in=
 v2.
> >>>>
> >>>> After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx =
has a
> >>>> soldered WCN6855 and no M.2 Key E connector, but the pending series =
[1]
> >>>> uses of_graph_is_present() to detect whether an M.2 connector is pre=
sent.
> >>>> Since of_graph_is_present() only checks for a 'port' child node, the=
 empty
> >>>> anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 p=
wrseq
> >>>> path on all monaco boards.
> >>>>
> >>>> v3 moves the port/endpoint nodes back to monaco-evk.dts. Please revi=
ew.
> >>>>
> >>>> [1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec674=
3543c@oss.qualcomm.com/
> >>>
> >>> The series should test of_graph_get_remote_endpoint() instead
> >>>
> >>> Konrad
> >>
> >> Hi Konrad,
> >>
> >> Tested: replacing of_graph_is_present() with of_graph_get_remote_endpo=
int()
> >> in hci_qca.c works correctly. The M.2 pwrseq path is only entered when=
 a
> >> remote-endpoint is actually populated, so boards like qcs8300-ride (so=
ldered
> >> WCN6855, no M.2 connector) are no longer affected.
> >>
> >> Hi Mani, Loic,
> >>
> >> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
> >> suggested moving the port/endpoint anchor nodes to the SoC DTSI
> >> (monaco.dtsi) for clean DTS layering, so that board files only need to
> >> fill in remote-endpoint for boards that actually have an M.2 connector=
.
> >>
> >
> > This means, the dummy port/endpoint node will always be present even wh=
en the
> > M.2 connector is not used. I don't see a compelling reason to do so.
>
> I don't really see a compelling reason to defer re-defining them to each
> device DT either..

Adding an empty port/endpoint at the SoC level is problematic for
uart, port is not always expected, this depends if the uart is exposed
through a connector or to an onboard device. So we may end with an
unconnected endpoint but still have a bluetooth subnode, which can be
a bit confusing... Also why adding a port/endpoint only for a specific
uart in the dts, and not for the others? This is a board/SoC level
choice to use a specific uart for M2 or not.

Regards,
Loic
