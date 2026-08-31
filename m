Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264F3D9672
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165346; cv=none; b=QkuezAD8Stnkd8IriWEtuF0XNPqG9poezD/tSu20CljpJ8c+K7E17k6SKIXZnpkwR07Z00p6TAlwnnerw/S0Twpwnn0WKmW7W4VXbm7BEzSwh5z8t04yqmJwDN5QwVd9+3YDtI1jPxduL2r2KaEPiAlXPOO8t9CuUSrgW8idP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165346; c=relaxed/simple;
	bh=SjZ4EK/3zT1ba/gtDzHBJmT830R1l6042MseZmhzl48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZeSfkeGXNBBJXxq5fRVQYyRsnKqlC8IoI/WHZOjOxRUjNN1Yv08jkFhH+0OSn4v+NUCHm8Sj2U+A9qoW7fKbh0r1N0KZBJjWtXSfg35VvcLgzsSPbylqbrQ1R8f6CjnTKkc2Xeb2iTE77AkRtmQpZjztz/9c6xUhrnf9ONW2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjY+A5cw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0pdT9Vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjY+A5cw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0pdT9Vn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xFus2332428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tr5LOcwcw4n0UOYNCfknwwxf
	xAS2b6tJnboga2qZv6I=; b=KjY+A5cwr/KsLQODf0A23aG6XA7MLt9pe/5qaiQk
	RTPEajtlDCFe7wRc39uxbOUQggXBYn9IWsGyj4rXykoeE1d6Nb6w+pYHP9+kxlu/
	osOtOkcJNO7xSbQLjq53PKmXgZQ/XKPWAuOU4Nv3zx+aMm4MC74ftBguC125l76D
	IY6SYPY1QixUKCMGttWWYBO4iWbOCn7TjoFxJ5FUsjLEbf8oztawlUanTg1IALai
	YtGnRqf7dDuN6FA4mkFdonSwzhw++Bxq05p93VhmcaBTFrinmPH91x0vvjHMtgFT
	PE4pGhGWJ20QEepUNH+sNHzW3m2oKW3jTu2lGv56aRKQjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq859vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so641804685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165338; x=1788770138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=Q0pdT9VnArJ5LvwGaO/WZNCVneadHS0V3Q/MHuFua5Ba8XI+xs6tMfNGj45SdzTPLi
         7kN7VR08dbBTDXvH6fzozuqiPvmOo3S+1V1ApZm6kdF7j2TWORhuYb2Z+42t6AL1o16O
         Q09XKIyWfq1kwwmRxRr9cSpRX6Gs37GM4sUL+f1UxVEU2pjSKezLbVfuGA5zi14Lbwph
         uaPbOWn2POQ9LKZj4TQjGvQEaMUukEMpG6UaooZwM0agDkx3L5bc0z4y8giwWZqh6+ie
         l1+k4AWcZYy2mqCU3n35Tb9k7z7JNm/bO78BugJOaTVR5mgi8q8NEG1JHHyOMjwSVmpb
         gBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165338; x=1788770138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=FKT+LVEDUmsEfZQI14ppGWFCmMeCNOIc1sCiSlc4RfWzIM2YZ905Z2aGihF97jczH7
         QHA7eQgTZDcL3z6T/r+uLA7LNB1qmH8ubyIweh92GVPqi9yaBpJsPvb3snHTomijaBIQ
         edufivVDqkI8wX9UMAlV9gvbXM+jHJvqVmcCFo//aQ9n8CYjO9Oaj3ateAg7ANsT+pcn
         miiv/R018ajpZb52mKl+stctktcpwGlzHkdTHEKj11NNNG2gech3Sqz447lYhadBC2cB
         p+6EhIBfxjuzxCRzyuS4dqbHoBW90yxof5j1l3i8cOk1/w7hT1+w6epENSnmFrhurt8m
         5QZA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa7OrmnyOW1gabv8SU0J0PhuZc2upLOeTug4gQeFv+1owQnY1fnJTVMyHr7jRempozGWTPmrE5k+j3Zfc=@vger.kernel.org
X-Gm-Message-State: AFuF++n0nJrsFthfExMZrQzCdLgBg4ctUKLgI+fbamJQum+4Y6f4Cnjh
	c/arqSNgg7NvTDR/1V9iymWRk2A8g7XmsQq79yWP2QUJJW5aBdZzRj+S01jXaNKJvuf0velzVgH
	E7z+WNU8BmsjTk8xfiQPS8EOfFT8MMar73qNU+yHplZNnYFWDEnZBuc4hffF9q0YlGB8=
X-Gm-Gg: AR+sD13wAjkNc7TwRDn7p+L28dlkpCQKFovTIK7QbuoxHvkPSb1DFnVtTBpXEVFHKtu
	QuiW2gvKBVwqxQT5yH3WjojKThF7E5TvEc7gC/H4Lx6vxclSOeILFtRIp8wJiiVeBzoDZH+i6+m
	RrFBuGMNzsJgGP8WR9UiQjkmPaSO9qJMumF1pG+AdIhxB02ac3l35yEwx3ubDLp6Ns5M1SD1Hn2
	WKwt3Nv3CWi490IHFp483GN7Euj/xRIn+0oxvOD1wFqddIRm/yxhlOM/Ylw/y20ADYpYfdnM5JX
	0VAVMg6Rj98ABDQBe/0gl0alWFWEN6jNiQTHo5YzRvgP/VidJmSoj7aJMj7iYKehi0JSQvQxpst
	H/fqE4ebDfY+EcA==
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200877685a.14.1788165338464;
        Mon, 31 Aug 2026 01:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200875585a.14.1788165337942;
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2005esm21269065f8f.24.2026.08.31.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:35:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
Message-ID: <ys5ikvuohab53qiir22ivycaoxg2crlwf4ujm3w6ghz6auggt7@wdibjny3bevi>
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
X-Proofpoint-GUID: 4El9XMWCXkIcKEzrISCzq_V0-eB_nqCo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX6+Kf4rAlasFC
 r8NDU8eQeRnYNp0Ws8AOzYl7Pzfv0aFRoguDbR2Citxhjn30IYxE1Tls3h3kfZumJ2pX3MB3CZv
 c/CwC2H827sMytrGdltk8+iPaT+KF80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX7EAQKLd2T0wu
 pyrHGjdKWpHObqNlRwoNEXUf6BE9s2x1Lz9Hc55b29vZDeq4mxiqKGgsTSuWdOY8oEocZoBXaBp
 rNYNfgr2VdN+zXDQpJ0O9RuOTaZnS3KHk05OSKoZeWYljwcqKcfgTZbT0P7an3yw9zAJDIxVd9t
 g49YXfdlrDk++ka4SKyBo77Y499WhoYkWwMO1K3AFdT228TDv9BVo0Fgx2y4JYjPd2HdovniD+X
 4ps9gCB2rBYpvmAnq4c4yWGMMVY0TUuNhNGwrtUuKz3Bqz4VMH1kICuix0GSgM7NVODLSKMrdtK
 +h1WIHdfy7OpQ3FMoopfXR+P88nfzbHyp9nXt5WpqpslczmWdORabAXO/cuHxVczT6/WgPZAP2K
 wWZz/3lYrZUiXH27mQ0KsQv9NFbkW9aTeXVeRYFADXwDOM0LsIqtGB2TSHstwYOYXiccj4Kufox
 EMVTW7EAsyJKHvM1xVA==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953cdb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1xpzCHDPxV4s1b1w7qUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4El9XMWCXkIcKEzrISCzq_V0-eB_nqCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-30 18:40:07, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
>    bit 0 = 1 --> DMIC0 enabled
> bits 3:1 = 2 --> DMIC clock divider = /4
> 
> The current dmic-sample-rate of 4800000 corresponds to the default DMIC
> clock divider of /2.
> 
> Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
> the working Windows configuration and resulting in perfect audio.
> 
> While we're at it, remove the reference to dmic23_default, as we only
> have two microphones and don't need to configure the pins for a 3rd/4th
> microphone.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
