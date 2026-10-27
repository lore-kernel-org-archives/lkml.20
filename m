Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125146;
	b=JwXSasdIgg1mBbe/FCrcddqF/qPmAHNhL+gEHtcSolgjbgYKKTWchpV3rotSfHITQbRR
	 PX4zVi2MJQBX0QklzOcK6m3ICahsZ4ntwpJDElvU8Fpt+PqVOiSBtcVWvFeViDqI29jwn
	 +JJTInnraXu+63TYfs2dyahbknA/5MZIRnMSHyz0aaBudJ8q0qX+5sHHd+nVGOKW2OhCe
	 rSSQ+SUjsWko3EfShzqCevR7fmZsHJcp28+NrRBBqPR2KQlz4kNeZPDnqzy63hKMMoyhD
	 lq/KiyhuAOIXQ1skEsjLOFE4tnTq/AyNs3NFFn3rVCFbX+/irMvp8aVk9QjQkY3ddrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
	b=MD5l8ICN2XdoEtIjD4R75F0JJ8Iu8AvBuwVDd/R1o1vuEgfQ6Bqm7Ifu0Fm3AbQI/+n3
	 4ySawgUeZfD6LM0UWc0U4n0W2LhuSMaM3Ncj9D4XuKVZPTdwdGmFyA+cOdZ3kFgn0u9yT
	 +8Qj4+gw0uz1shmvZfQNjXNzKmWkFaXUxtGuE6KYtbSGieFFTBrYkck+XJ1gSBNKVpAPl
	 WnOgMQCenw/e+5maWMa0FCvDfRCPUUqpIbFedHoaMhQQlUkwQ95ISiCgFbM3Eqw/AyVjK
	 JZNqHByEHeDE6F8AciiEEDmU3oQC16Vq6DyqIt31Dr1NVQ/KjtaB4FynJgHhfKyLJxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W96HaUKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aLl3YfD1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F949606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F949606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W96HaUKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aLl3YfD1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHuw91459848
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XsKGOF3Zo4sw+rWuIBG727C6
	syOZ0rhbz1KXJVsitTc=; b=W96HaUKEm0F27a5C26UjNGDOmV3odkiMiDYrNfzf
	TXCTb7oJsqrFdnfdOhoy6Ljer7CUhOYItnrgEGdArYuXE+219qhaU9pRRZmMSbVl
	1kpKpOzMMAYGyvUJrELyvcu+Uj1A2a11cvvkrxHwMiGxuubu/t/SA+2ltWC3XePD
	DI4dV2jtSh5g2xZVPC/MZKl1Av03Cpyd4UjDmpgUu/vVoqw3Pa3ErFPkt3kZ3AQI
	8w2TeDB31bX3L8JMcZHdzhHp8jjgxN7Rzew9MRKukwuAD2iVOcVCNOEdZGW8aCc4
	GF/YfDS4nsSbV5waQGuKAameYQiBEqR0o3JRE6eDcpcZFQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy710ku6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:18:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-339628f2bbaso12718eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125138; x=1793729938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
        b=aLl3YfD1eEVQiizvJpatBtDue1K+bAY4nC45iKDjY6xgwHnP/FBYF0SwbH727VKuwZ
         6NlVIARdxDSqaFq3jLdTQ7dnJolUKb80asaRCyp7M1BotQBdF6oQr0z/QGbcUIIHi4eU
         YDVnkZlhKic2sGWIpkj9N9RCojPR9nYRuByORmbMQ57+z6PrTibMfWfhUPY/q78hOqjS
         cOFCG6kZHh6OCvluSo4Q6c9N6U/9Uk+JZWmCIAWQm5zuA6du0FdXE5FaxUljUVX37PHi
         EEJ0Szzti6S6zcnUkr/lqFxm2oIum1CtmZNlq7cWKLMALLBzkTU3fdrutKKns1a2u45V
         ncnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125138; x=1793729938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
        b=hZuEGG3VC8hLYGJ0zm9GbCRv096xBVI/NinLK2PsHpvXbZKGG9AuNN0Tnmf41oQ3g4
         wV2hax0i3HXONeaYu9XHAUhNJtUZvfFXUU3Whhsie0Fb5nRzLnV4JAszs39GTF3J11e1
         lDovPM72giGq34Ss0SsI3NNMxUfdz7SWjFh1GRKjLjbndbmfcRdcp+fpn5B3zgWh5FoS
         YxU5YA54Hs5Va2BbZirEPslPD+WMvbxNqKlKtsHvO02kU70kNL6eSc/gpmb+t8P906vs
         pHy8V5XqtDR9yRRKcpavLGaxGOLDJxJqPlPW1/+kHjbnzAUHeDLgq9r1+aCwWvQp4reG
         dVQg==
X-Forwarded-Encrypted: i=1; AKwUvBxgrjNAQlkTnhtMxHDtt6riL+nRptr/Mp73e6/WYz+VSZsI9wd5+YX91aVVZHPd7CwCDNAHsTaxGQkBtMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH+1cqnSrYzcVZAKnbsGw18q+MdslvgxDpD5kh/tbxMpxTxS5D
	NVuAxWzBDn9gF0z5urgdt6HbUmUZpMgWGEpMTaBI2sv1TP8Hqgk0a2mGSB40d05zaSqQugB1fx5
	fav9BdSv/ETlvZ/+AqJabbIsiHx1tMOowZCRuFTeKCb9xrQnQpy0N/Epgak1/mq93bOE=
X-Gm-Gg: AYBFou1Hq1CnMB7ssk1jwvb01uqyCOnHhHc/mVXYshvRLWQfFwFMIrytqzwmupNt6eR
	SMQHevoWLqclT7OSlF8qk4P9qFEy2pya9azX/CT8DGqVVPv4dFOSbsGTTR55pU2tdejxQ84KJJv
	m5RWh/DTX0eqUwtkOcoEVFIqIW9NIs7q5+TVDxa8nWR8yX3v0p1YDe2PsR5qk8qva/WQMtdgFUD
	IV7Pd7LzX04KtNxpxaQpNoy3lJUtJag9oQ+OsrHPfGAuypYW7bfoeZVDXKuBIPWrLvAOUgrX5Zm
	cr+OI3Ktc2Kx722siA36Cm2xf5K31hyNGRH5cA8SiI1wi/u0K0m5xiVMuiyWc3EbRKWdDi5nXX3
	TK90UbRuQPzzfv4t3NXqFHd7HiV2JQJHAnTGUhtaJVeURuBZppzf8AZAnWo5vZnJqGhMRh1R4Sv
	21PdGKiLOm35kYN2rOs8hSRCivZyk/vdCQaIoZGpb8FqO5Uhbn6PW7
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a1ffffc09mr654502eec.2.1793125137799;
        Tue, 27 Oct 2026 11:18:57 -0700 (PDT)
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a1ffffc09mr654425eec.2.1793125137119;
        Tue, 27 Oct 2026 11:18:57 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm29475546eec.7.2026.10.27.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:18:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:48:49 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auDrCTMk3oCLa91X@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
 <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
 <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXz5r3WJ77zyi9
 KBAERyVC4vTgoW1/ukxZwMKRMyfh5+fNk750VWt45wu5MsNXa+sVbY72rIzXhhKfzWrm+Ep/wsL
 VAw7Ewo/5WBYW7FiYQhj5cqH81rTBu1jg+iP9n4dpSXHph6l1+1HylfbljLkJBG7Ay8RS95Nrsg
 3mYu3g2BF16g9sR2NttOoZD7HKbrJ9LSGtFjufxmaOA4BF1nmBkXw6GVEn1K6eI+j+rFY2Bqjr3
 N2RS6IhtWAEUs+AwS4SHiWUoRVO+Po9EHOpRQyBH8lk8p2oJc4OsZ2PnzJL86Z6m69QgJ3b9pmW
 IShf0P7BsQ2SOPMAaEGO/VM2PWSa6ykExQIAohVqEltUuLseOoYHgbGS9R67iZwn3QFch25MD4F
 IIDzjwplrPqSvsZf1VZi2tqjb3SnfI/5oXd3GjDixnYjjHkR9ANlYqHdEi7b+aCGXjtVs3LgZp6
 quyV/MtZnK+uWj7Xm7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX9Sf+BurU7hUB
 iGibKgjwsviuzEypGEq2Ic2Vf4Z45m9/UlyOqtiZ+pyhT4mhYePy8nuOL6x6MPN3pbM25B2+LD9
 Qn7B2/zazAF/wYintqpefhLBHoizafU=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae0eb12 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7rEk3nLCdkWhF05BNvEA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: dZ3dQEf9pSr9m_2YY-nSCdpSywWfgs5e
X-Proofpoint-ORIG-GUID: dZ3dQEf9pSr9m_2YY-nSCdpSywWfgs5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

On Tue, Oct 27, 2026 at 03:34:19PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 11:57, Vishnu Saini wrote:
> > On Tue, Oct 27, 2026 at 09:12:27AM +0100, Krzysztof Kozlowski wrote:
> >> On Sun, Oct 25, 2026 at 12:18:17PM +0530, Vishnu Saini wrote:
> >>> The DLC0697 panel is lit by a separate backlight device, which is
> >>> referenced from the panel node through the common 'backlight'
> >>> property.
> >>>
> >>> Declare 'backlight: true' so the property is explicitly allowed by the
> >>> schema.
> >>
> >> Why do you need to explicitly allow it? Since when?
> >>
> >> I see no benefit of this patch and commit msg does not explain me what
> >> that benefit would be.
> > It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
> 
> How is it required? You did not really answer, so again:
> 
> Why do you need to explicitly allow it?
> 
> Answer starts "because ... " and you provide technical arguments, not
> wishes.
Because the DLC panel node references an external gpio-backlight device through the
backlight property, but the current DLC binding does not allow this property.
As a result, adding the backlight phandle to the panel node causes a dtbs_check validation error.

Adding backlight: true to the binding allows the common panel backlight property used by this DT. 
I will improve the commit message.

> 
> Best regards,
> Krzysztof
