Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793713588;
	b=OD5EekkhCEXdLanZO4c1XBpJ/zETHt4uMddK1FAcLgKaqNXj+BTWzGww76HgDGdOzZ8H
	 74c3BjGelcE0aKGUSu+lV9jnaR66wcvN9mq0OYbdz8pCnk2ge/b5QLEGZnIyzD1Y+fey7
	 7tZ/hfZDpJHNGTEaWh5HUWCc+mJaDQp1xcKC8Dg65OrRnRUYwzeCbMPLimVFvWRc9iqOF
	 o4Q3LZYT69FBrpW2NHCpaYqYNHZiyUviQgaNkTPVLpGDetiIh89hT3o700WGMQDthvcDJ
	 OsYHbhulUj7FJVJdUR4mvIhndLVUGCjILtSv0PYTOYHPHdaxzDmeQLERYuBaMx0VlHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
	b=xHv+XWLOdHy7iCJp54Xs9py2hl6ZaJcoc7iF/Tx6lt/iF4VzsTliUwHM86AWuk2aBi3c
	 1BEzeE5gHg1CqfoWhLR6/NjHU7XAc8cr6E5Wm9LKxYHW9aImxbJRVXwpQRjh3YzZ8Slda
	 DXkH9feXFX5SzPyR/TMiNUFVwFrhclQEMyb00whwk9LLeUDP26awNJYqZJfbue7q9mBR6
	 xDH7kao3pRl43plK36BXo9K8KdaL7ijv9kV2RitDIkN7vJNr8NrhTwXLelWLny0cUrGNJ
	 Q0HA2Y23Vhg+82WRuWx1dwoLcq1rUGQAtD6B3qRUz37V7elEwuiakvYd3zA1KEyZ5FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h1Jv4ui4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/u/u/9T";
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ED4606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8ED4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h1Jv4ui4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/u/u/9T
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ9rV2651032
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=; b=h1Jv4ui4Ibpunnlu
	Xa6MRwMo+OyxB0XfHc79Qh0SzewPZqao2xoNac9BAALDZ4ZxhQnUiFj76Y8qQuNd
	BAtwg6nYytGrU+MCWkd36KO9NW0tJ44cLM6HsDn5h596ZYycAPyRx7sE1ryywO4m
	YRLrKirI+MMxky6AQJnR8iwDSG5SZOEIJ9WOUCixuM6O2vWc4Y8y8CdCIT59LZam
	j33VeRFWPYxZnN5OpA74vSxtvEtKDRxkVeV84nK66AJIfoSKC3TmMkRZAJXGljbB
	L8J6HZETo3mMn0a7ZqnlZdCfn/W6WYOGlNNLKom/Yc+YUhOFrIl9fc/3SkbuHBSa
	6QOwow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r40ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:46:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so851430685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793713586; cv=none;
        d=google.com; s=arc-20260327;
        b=BY9av4qTyqFNz2zsU5GuXCjoLpqqSdcwUwLL+Jh5ccnzjUixsVH7hdpyizkTdXpCXt
         2WhWwlmygIZYEkwc1N/HIg/BY4xFwF5rmHzJvdXFZa8fgfMhTif4cLpPqucSnTto6/xo
         juTugKs91wW3G+xs1pOlPE4FDXxING5uJb1blPAukSDdSsbcO2mZy6eGZuC/7YZYI6Ty
         4X8jJUPTQSsKqIrm2oIrJa/TkN839iCGtdQiZooQjwMgo3MAHmET3AOx9ouf9yiR/Ky8
         m4x0MRI55o8DFUli0P6ykPV9t8Sd7gkbizJgAk530RiIEx8axKUncbT176NXAFROBxz9
         Y8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        fh=xm+vciwpv2VcA1ufXiOCCvfiWeu+rwyDns1O/m3qyw0=;
        b=QGAAGN4z0+SuVTdNGpDUY1Dv83vk4wkIRlwuGcHDjqiSWwux7M82BfS5J8+SA+KDjb
         RwrRvz4GwDmNxBzbpwkATFew15BgpBwnMfqdTpZISlsE3YymZsWpU4nCA/P3n9PNQAS1
         BViPOC0oWjHI3l3HdxFD/cEc1TLzyyPgjfAGIrZs3rLaoIYk+P/vkJsCJkRbA7v0Wx+Q
         6Hf3TEIZdI7Zb+qjZxK/+H/uaqV2Z6oDRDGfVVrekv/96QtuLL/nRGzhc9zWoOl1oxXb
         mDvdcKuyoDob/BtkGSQnErhJ6R3wQFbcO0NRcm8XBe/yeT0NnNOdOMlEC5Xr4eWmHwP5
         C0pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713586; x=1794318386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        b=K/u/u/9Th9MvkAEp6ZaDrPaJZnINaRpboRBOVFa4IT3Fc7yhEwNx5lSrdKZxM1shAb
         fciy0ho/Tbb7ZudlSueVysGOIx8DunnD8RmwEF9ueKpeCRt/BEJlhLKwtqhnmVNsS7sv
         8QIV5DcgbpF01PObyLpk9yIMvbc1FS1X45ulXo7vQYy3ghEcHuKeNPEyreo05NfdUx9r
         hwj1uo4Qj0Y2IYSAMluciOQKTMOGj5qehYvXm7ARbtPKVLWp6Wn3Tntb1p7zRbib54aK
         51fZUeAw18hnvMU7tmjyVFj0VH6nb7k5DKVFZN/M7cyLZ//taMwHqPV+cN+WLBmBPLC9
         VPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713586; x=1794318386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        b=Ch/V5FW3cLbqz2PcMogurV4+NiiE0MPY1Imw2t3YgGBmdK8XpoEOQh3w9LJrHMgxu2
         /VBtcc9VwSf2jPpEPKXnRgOErJPWVt1txZZkvDaZF1VXMpiiB99HalVU7X8YBWL4ueOj
         pu71yhNUNsVm3K39gQfjIirk7BTWLShaxzJlbntwVTZ+YlBunOunQEyfwP5LMk1vZIGz
         jScne+zW3wTa4WMOmNporu9ejTkztBZCEmmHBWvk8XI+BKmwRXUCMF6C4WaTtE06X1r8
         Nqig2fNrK44EY/ezXTN58CxemKMwzu4PInmpeNWa1YDT4XYyRVw1vyeJ4y4lKDaLDuks
         Xdmw==
X-Forwarded-Encrypted: i=1; AKwUvBwX4AVY+kMm4n8ZgUB3Jc4AZE9XvuwrF9fpElP7nbClQzo/+9dXQ4cdwhTynGk0ZYtKEnHPxPcl3c6rrHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rcKDKOu8vOSzPgirOfyUkLNROs1kOwrpNYWMRknIq7tS3/S4F
	UaLCih7KAZbr8ISuD7USy2BzxyvhPns1xzs+iNoyYv24di/2x6tBZEFfEOnTeZS4NPmeMbCcjSc
	6R3cm1/Wee73vJ//qcsG00E2Gkrg2SJ7+Oiquq7hF6P218DL3bnS2Kv/7b4kQGgrPNc12TRJEFq
	FZ6Qsm77eMHzaMI0b/pBZ3rYD1anSzhWDbh2H8xeQBreqW6051lniR
X-Gm-Gg: AYBFou0rWItkdYlt/JeLTE7diDAD6DiqAGl0M8VdNBPMkDedlnAVRaUfEXe6j10iVtV
	muLz6jIaopFYSe949AiW6Sw4lIlnQf+q8nGeiwvbT+csbUNfXXvvUTItffrR9qUl1rg1bIEwXrJ
	QwpIovkgXjwcg+kKv4hm53ha14SFCZcTtoxBHJrVyrkFh4wVOPI29b1kxPPghwd8RVUTD3Ok4E3
	+Ob5/VQK2d56+AGXJizv7T4dAp7ZHB03cd4FAy3KpnYXpAZI1ieMv9NhJOTlD6+JsQ9Bw7016Xg
	pYLJ2zs8qt2LynV2Lkx5F6cqPsUr
X-Received: by 2002:a05:620a:2603:b0:944:941:c060 with SMTP id af79cd13be357-9442171b0c0mr1946384085a.15.1793713585603;
        Tue, 03 Nov 2026 05:46:25 -0800 (PST)
X-Received: by 2002:a05:620a:2603:b0:944:941:c060 with SMTP id
 af79cd13be357-9442171b0c0mr1946378985a.15.1793713585046; Tue, 03 Nov 2026
 05:46:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
In-Reply-To: <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 14:46:12 +0100
X-Gm-Features: AclHuK_Qok4zfLvdDBhNRvQdZHg66IXQjOtvRHYqHIttkcHvB_4seu749GvrFIY
Message-ID: <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: pOtrySiaoC_3XRnshifHhYvcnKu7wkku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX0hb8nzKO8zcI
 3TugQaE2WItMN8WH2S/f/zOwnktPx0Boh1RfNNRE4UeLOD5HEf1OtKW8H79rNMp3/c2KMNwTA5/
 71n7kFOhFCV9QY7uzqpowvTmQQzf0t5ADlBVcfq0/EYbYeD/2KGtWM91Tz8gxxWZa+4WwECCgyS
 3hMjlwZen6Uc04/7q3t39VgiHul+pYDYLTKmbY4uovM6mmnHaADw+9SFNdEMRMMB68RZLf7FwGH
 iqkRgqUB08xllDPGJ/IT5K6s0CVbaiiyB6GcB1iaynKhaY6t5m6Z1MKhGbq60C46yEyzNa8GpUi
 krGW1LiWFd/sUmcTSHa/gYh1+fCNs7EkNqVLLanx0xlz8y6jc4v9xlQZBCErF98qV71/pWh6Ji6
 N4L0e5WlaG/o740D9zdoBUZK5OKxlWGUgH/OSjBgcuMi2asQg1z31ziULOSCc5Qrce+Z9YSfBv+
 Wgm1A152xnJkr4SdJzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX2YJPiN3ScxEC
 yDYJOFptj+6C1NJGV1yUfutfpq1ySAzDlUfKHYATC/7tIMivfSQMXmvbKxlClrw81U+gfmGtx5S
 GNpOeht4uAzMwgWsdx40CcuadEviHf8=
X-Proofpoint-GUID: pOtrySiaoC_3XRnshifHhYvcnKu7wkku
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e5b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=ogAJat6By1jEvbFUSnIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030054

Hi Shunsuke,

On Tue, Nov 3, 2026 at 12:08=E2=80=AFPM Nagashima, Shunsuke <shunsuke@nagas=
hi.ma> wrote:
>
> Hi Loic,
>
> On Tue, Nov 3, 2026 at 10:20 AM Loic Poulain wrote:
> > For change request I think the best for this is probably to follow
> > board like change:
> > https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boar=
dfiles.html
> >
> > Please, keep me in CC.
>
> Thanks. I'll send it to the ath10k list in that format, with you in CC.
>
> One question first, about which file to change. In linux-firmware, the
> shared WCN3990/hw1.0/firmware-5.bin goes with wlanmdsp.mbn
> WLAN.HL.2.0-01387 (sdm845 boards such as db845c and SHIFT axolotl).
> qcm2290 and shikra have their own firmware-5.bin, picked through the
> firmware-name DT property.
>
> My comma four runs WLAN.HL.2.0.c10-00459, which comma ships itself. It
> is not in linux-firmware, and the comma four device tree is not
> upstream, so a per-board file would not help anyone else. But I have
> only tested the bit with c10-00459, not with 01387, and I don't have a
> db845c.
>
> Is that enough to change the shared file, or should someone test 01387
> first?

If Linux-firmware ships 01387, someone will need to confirm that the
MFP capability addition works with that specific firmware version. For
QCM2290, I can probably test it myself and provide a Tested-by tag if
you can describe the expected testing procedure.

> Also, the page says Kalle adds the files. Should I address the mail to
> Jeff now?

Yes, to Jeff.
