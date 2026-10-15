Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DA4E36C6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057504; cv=none; b=Q9/g9XqZbK1g8ajPt9vjITMBYUsQv4CeWa4kzWiofZlgFpOeh25+Wi9YpYFewVrTmnm9rZ5aDVWRsX0yAHer55LJOLKZaTFCFiBwOZaJJY6flRrh/KUb3AjwHtW2PNKlysi0y9JxSc5irEjg3LXg7nw9aBHIOHrDebZvOKrA6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057504; c=relaxed/simple;
	bh=qtRguwZ4mlDCaVkmB0miTkMjt/Pa0fU+Vx0oFLYuu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYydznIsmO9CwVC99KU7MP5YoCn21WmmaoUPUnLrhRu6MO3bxFE4x+RUViyb/cn14aGxRslbJuD7Nu0IL90V6A1gb/ACD/HYOnJHprRbjjN0xNg1sV2k9cRt6/tGz/LSTRoQ/lUfELfnuCYuXd9R6IRTA3PLmy6zQJTOAUANiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMpA6lx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3wIuons; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMpA6lx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3wIuons"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9RlGS1889490
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h+FgW93lIZWkl4JuJ0zk+Xr8
	VIgEcu5OQYc43p0CbhE=; b=gMpA6lx+13WJeyGV6JAdEeHHZRlhyfCnTSgbygGy
	E7mWXkhSxHSeaC5OS6wjiSmN2WJcUNy0Whi9dRNs92KmXQyuvpNFFlnBaK74ToLu
	6mZfMZ1scobI7uOLGI0hOkrJKxUGFUyMyGlbZk3B5lSwPr537MDbPxJAZjZah18y
	xYv8QJWXuIUZZaAnaDid8GGVoVERbXGF2e2iD2lukpEmJwleqBS6Sp0Vm1kEgS+G
	BSdxXIzlM6NWRLuJKfmTDCA2nAYCBXuMeALqVw2bMVcrbP30drh8WYqOoiLW37k8
	3eueEP/a0HH4PW1Ohmekrd4Wm3+4k9RRgQiX8BjeYGHY5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1c8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso444787685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057502; x=1792662302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=g3wIuons43/mOx3zkGQCkk14fnal0GJGMrgf1CixZhqNOP9fMkTlY/6oOypRauRZmq
         sbO94vXOH5ZPHzwXcSk2brUVuyUgvf+7vt+x7YBdibLWaR9UeGIC0L9oTzOZfwt6GwSd
         826FcHR1Mvtf9emhRGgj1CNh8yzFueSbE+kn8HcHGeRSuQEaLKmcI6CWrFSl15HCzPPn
         53RnSXAHsxLs9q4WgHrYaGKGEHbDGSJCN9rILBQK4C3enZeXlQx6/UTd0dDC2B5y59nP
         XR8N8QOWr4oOXw26NjK5QTLZXUGnht00hf+7AgrqvYdz7AxkxFkhcF8nYAGG3zLVl1Oc
         b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057502; x=1792662302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=nG+RYpdssyQzRAcL2cg4Vvyo9QxMid3BofE0mkdU7CeMQ87CaKJKIooBNrlgYNZKF/
         +BVkDvRK+70Y1J9mjrvOmWpNF14+RrbxnuNokPqLGnc0BNbeOhRr+Pr9EMyb/FRIzqUM
         2zFpyND4KzmQ0pxDwAFkBdOrQRw+C7ZIelrYILLwbOFVa9zAlt/6/0Y2YdzWgjp2fkrw
         kX3DNjRd7ZywkcE3eZEZLlteznvpOMefqSomPPrxSlKGgrlWc/44YQublZf1Y2XlHcOh
         C52V1cCXbz1Hqz6wXmDKA9rJLN0yFms78ifjBxxFsb8uXX1A7ROfDoJn9VTccGn1FuYm
         paxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsh08OYaTTaYB7x0tFNLJSw1MbF0URV1RodwOaG9WOWuH8LxxjBGf970CvJvlP5GBbAgOpvwYOvCpwYS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdXh406218e0H+3Bu5RDXULOlSMsqzynCklxt1q8mqa4njqfvY
	h7Gh19uZVwVPYKq7ARzhV5wQb1hFyk5jzSGvsSvZcHQhT64jjSqdO0Nq4wjY/Cg9I53fJOs7DPh
	hzPXbQuwSF7hjM/HoYhkWeCXSBoh1acNkNU9KhxIKavYSpiFE5w4AqVSPgx4W2mBbg7g=
X-Gm-Gg: AYBFou0dYOy4wOREXqqtgdCavWXlZ65tivjO+YN8yJiw2DLu+i2H36a6nYUIVu4Izme
	SGBAPIUt6Z393DbA6iz2aUeY+Kw1TmCBvABPNeb8U8YSWu7+Zy28pC+LcbHpC+Lk0hGl7gUggnn
	K2CXvXQy7lsrUsBzRvHQsWbQ4yT/jb53dcuX+PfRZJ1Tx7kU5N8j57xnmKkGj8KAkK5dxJlrJFX
	PD88od3TBIyx6jkNfR6TWQrjtp4z9AwRdwgAJJScTuyZgEgsTA5leuEagywBL5aJfS3mzl9VTcJ
	ciiGrRT3FJnCdHCh/z6Sp21CfGR/vCKP2QNF7haPDLfJsbTRodMXhQNi6gTyCj4LG1CLIerqIUW
	fgPgrDGAkaI0V6qFejvgMZLaUTYPh9vD+swGWHj8a4tBXet/Bv68fMTPtKBFmHKpAvlkb/SvXmL
	aH/a5f8ZJSsgy+
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851437285a.7.1792057501661;
        Thu, 15 Oct 2026 02:45:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851429185a.7.1792057499630;
        Thu, 15 Oct 2026 02:44:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab1169d43fsm796131fa.23.2026.10.15.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:44:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:44:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
Message-ID: <6x7y43ldn6kjxowm562icamjaajnxlgarzbelqg4wkgvf5vbbo@x4t3mu6f44wr>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
 <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX8g8Ea28lnLIV
 OsfyDcmfL6U/bHxL/JFsdhgfOqVnnn9AAxZwxC9abyNW1NtdpnONHxQ+2JhktqLwCwkM9Zg+ZPw
 VokUX+4uyzVrI99TDWwYNR2mYURZcHo=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a09e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DzZZqAc8IDjE5QScHtAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Xt5PlTOJRF1rvqCX-PmTciHscJWhMYyN
X-Proofpoint-ORIG-GUID: Xt5PlTOJRF1rvqCX-PmTciHscJWhMYyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfXxPz72enCBmTc
 g+Q7uveH7Ek5MR/9WXoc9JS+ABrlVbuhdskpdNkp3xl1Rr2LyEOE50c7f4+SWejG/mVjH7jV5sY
 dX0CjESkYCL5pLlHbGgL0iQAljtm7Dbdkh2ca85QG93NN8/cqqvYg5oMHrbdZYS2oYgI/icP646
 C9dA57jONH3z70mh1ZnPEFIUrD/kG0IAicqN2Dx3bvrs1FW2GOyFqEtY2rf3q45bfPwqKdUMlbT
 +PMcGt6T04TqKwB5ZeJNac5HhoyScIRvkxeLWaGYlhyNAQMRVIqQECex7v+cn1uJN55qbTTgq7p
 BEJmz3igNg9lWjffbATPfktNMmA8+0ZMbEmG9b6EOnSoSLoNLvsy4QRMeweMQxYfN25adZWMZdl
 3O3gbCS66JEZK6oyWusHB+cDPFVsFtOXP8dqLuzzAa7XNBuZB7F6/AAfBoLN8ia6mlCLsIc3y77
 WL1xkOv/agaNf0YGcLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On Thu, Oct 15, 2026 at 11:11:58AM +0200, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> > If the bootloader leaves the WLED module enabled, the OVP interrupt is
> > left enabled at probe time. The first brightness update then schedules
> > wled_ovp_work(), which enables the interrupt for a second time and
> > triggers the "Unbalanced enable for IRQ" warning.
> > 
> > Track whether the driver has disabled the interrupt and only enable it
> > back in that case.
> > 
> > Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This was merged yesterday:
> 
> https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Nice!

-- 
With best wishes
Dmitry
