Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8D37E5DE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770257; cv=none; b=neVRTWsazPc71n92iCYB8YGMmP4q4MKxCvxS+2XXogUCXeccu349/7WV+HWKDNdi2mQb2lnWaK4N34vLFn0sPY8tGxB/uNYT/io7busnYVF2FwED9OqiM3518ljZSgrJtk3q+M0SEc8056A0imzLN0DrZ6c4AbPNTEBBb8NAVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770257; c=relaxed/simple;
	bh=ZWsVLMOWL+WMhMuvkSvFuddvT8uc9TE1ajRBypOQoGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EaAfO7rltL0xGbAc1/j4CBrjhaxSUIxu3/E67GmrtciFQn/DWonNgVbrAYcW5jsV/X1H98t629nt07LhPSP/buPATAm5yFpiMBCCjIhV3yEc62iUEOmqN0djtCgL11mFNt8+5+JmaqFhxtadGzG84rJlZEjanLN/ePdUzmDyzck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq1Gv75z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPtqB5oW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq1Gv75z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPtqB5oW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878ZNj52877836
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=; b=Iq1Gv75zAfYJXjvf
	s10KvPqc5wMDWgSeEOGuoTBphKfozoXvnKHJrHEu2BHnXgpU8txGhX3TbbPr6X4O
	GTm2oHpb6waz6pi7Oe1vdxU21Zp7kM6kIHYS1av3s3d+ODRkGloxIMRmsbb0dsqf
	HV9Np66DBMwScpaZ9orpYhnKOZ33nT232ursRdCUPDhRKlLC30qKOK9PIWENkqbO
	t3tUK1F16aLcMXGr4JoNSKktwgsgMc+9b0xeKNFXxJLTq+EakG8d0iwXobALBE5P
	kmGxDUyeZ03Lpx9hOK+3AC8JYIQ4bG2I5795WckePFGtB1XGzqp/ejRAmmxpgKmo
	SVbI0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw200as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:37:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fa5c5a4a6so78436841cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770253; x=1789375053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=jPtqB5oWvHEQ/HLc61r7cHpB7NwOIAUhYDBkxg+aPOIdbb/9qbmmy4Z9Hb+rNFuC1l
         2vNU9+l+NqzlSlRGMozrd256IzkdVJi6+GLlSkbqPc4chMch4jQTOFDqJ8VKtz2Pon/y
         b5m0M5kbvsS6iVa+cciCvbqkRYelnU+mOivfvwmSyMscmnNgKdgzWJqxUF8pNe01G4k0
         mRK6C5QXcwY8YP8HiCHbp/1Zuddh+RuCHyV5xaQRM29yT5r+Zw8wnbKoSMldrkevXRu+
         8Sv8lpU3kreC4fC0qH8ZdiMz+ROxoGlU5REy54RXAG9MN2lRAVWzC/si/7CE5yw69aQz
         TC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770253; x=1789375053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=S02fVQ3LVva+PJ+JIwBd9H+Ush9FclgyViKMkHWeYmYp22pzcjJk/lsAW91qbNAtPR
         CbFVpbzXNjw9iMJnGfw72ZJPKkQnnNaQqf2wB4ayNDdOPZxjT8FzKLEj19xRSkf4l0x0
         rx+Ci5ajy8/7M79kIqbieuVOMUzfIyE/YuaqZOEovVCLUiHwWDm/K5CzRhANOxaeBrmt
         7qViCmw5Fvn15fGrqujVNYD2eAuTtzqR08uE1I4AzHIq2rZrozU6Vr+soXwqaosiZU4W
         0i5yDL6A/hYrYLNtY/2faclvU5AocEgm0uRRLTWY8O29lat3ctE7YPAhVjaZ8Rc9DZT+
         rIeA==
X-Forwarded-Encrypted: i=1; AKwUvBzjzASopjSeV765nx3Zpz/ftnAieI70RtjymF+f4jsygDRVu3SWcIawWPRdj3e0A9Qv0UNr10LSLe5L31M=@vger.kernel.org
X-Gm-Message-State: AFuF++mbl7toYoYg/ojjdAyL5sQblZJCXwgLGtsc3Zpxego+N13dINTz
	3r+tQ83hhe3GMi0V6PrKLUY8jQHfZIfGHu2BT+CapFdyeXIzVhAXdgLcgbrqLUIY3eC+W0upDlN
	2xIG6laKUeffpTv7J103IHP9cwZJoyFVfBZ8Eo5FdQGfDiBnXmFLHshsZTaoOGujCbPY=
X-Gm-Gg: AYBFou0+xatWu+6Hnvae+epcVpGEysmtQ8l0KJHIMHIHHZSBIa+RvaWk1X6QdxGJCuk
	WOvPtYV+rI5sDmodNZCfZCCkeCh45sfPNerQkTHCbK5GPGuVLPXnte7Ns2LMLrNb7MX4SG8KZIv
	DXJfXn6b4s0u4IXHXEyLbBA/Aa7ks4T9v9Np7NxADaI7xFBcxWak+FZGoacIUPxrPphluj4nvre
	NURswln5cfa0tY2VMYmIrp/bQKN9PVizs2qheM6toHXCkq2fGuAM2hnLnLvCrbH1/Me4ydXPaZd
	4k2XhdlI4ColjZ1QmZuU7lGv4ElV+wYKQW9uMA20SDdoyeCMZMBb1CXPxV2i1tk7cneYm3wkH/7
	5VcIloj/Fei4tO/nZyWhjOg6FrA==
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168431cf.17.1788770252709;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168121cf.17.1788770252317;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm292239345e9.0.2026.09.07.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:37:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Fix bracket
Date: Mon,  7 Sep 2026 10:37:29 +0200
Message-ID: <178877024677.8391.10693598419369758510.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903155345.733244-2-manuelebnerli@mailbox.org>
References: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AlMLqP9NnGru7xyRdo1_X3OHBRH6n2Uo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfX68FY/dElqAXX
 KivHvPDVWLHUHEOZ52KuZY4VlIchoilUtn6IpoO1ryYN217SJktM2JiVvzsCe99uXZmH9Rr8wHc
 +hgEKwGxMyqrnmFtnt6yd37LGvNxUsA=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e77cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dcql3xp4XYDMActl_T0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfXwpm64HUV/WSl
 VWJg7sN6fOve/aCyW4PzLOHIIqhW3EQxEMT/Tj/DxtuhSETqfHWIRVjk3BMipLSL0j/P81mWEne
 SmW2ovF2h6ngsYG1NPnkUV6Vdvl+3RmB1CnS1tdVrk4ufaFES9SiipJFvgyyMK1oKvu05gPWXwS
 2ZuQcx35eBkO6wVSZOiMdsKRSjh56vSQgY2dERu5cnPrbRUvEp0xhY01IzK4iTBwOFUirzBQaUC
 NKs3fZpj9P1Fc5UgvocjRyopcx0dx5ONkYNpGUCgqaF3yZO1oNibId6VWtoUQyibGFTWXUOUpEu
 kPRhckWtHY27jfMAUK8n7ke2pKa0qDTCnjuenKXAIMAa/KW0KEC0HqtyvUds8YOXQ4yGZL3XUtE
 R8e7Qil5x3mjTI3q7KR7BmtZ8NctnnVxK83/MCqoDsIaabEcDI/2GkWGn840EPVJZSM4wORq1oI
 686Nrt/OxgbHiy8CsNQ==
X-Proofpoint-GUID: AlMLqP9NnGru7xyRdo1_X3OHBRH6n2Uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070092


On Thu, 03 Sep 2026 17:53:44 +0200, Manuel Ebner wrote:
> Balance parentheses.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: Fix bracket
      https://git.kernel.org/brgl/c/31e7eb7e38978f6edb6523e43f3d8738e1837d3f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
