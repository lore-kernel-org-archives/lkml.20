Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E70E3F1ABF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912279; cv=none; b=LPpKDQ+Pofx5QoVpX4+Xxcwg+E40kNl3BIbZzoYOxmswPP6NStMbOrMm0CaiVQfWhDkBo8ltTo+RNlp4FknC95ysIOWNcM+9AlGUL/BBO+l3zQ+MCQMQVw1AYyBT2BqpwthJHM913d777NQXdKRVc4OseSh7wszs6bjhaT5tDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912279; c=relaxed/simple;
	bh=qonRrWabTY2Twu6xyostniAUyFpKLy2UsRhWt4rvXKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHbFGk67T2YKAkTPs7NVxg5WZZM0p1vcrndN28xh+tzde54CZlgzNveIZy/uk/Yj0BXHKpLoPsY9nkQ9yB3+d0V9AyQEe5ma7nu5JpOEWxlOogxpY1HNgB5HLj9KqpThvL8oyhva33a99uVz5wYB+NfPl/6nJFep39oXKx9DaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJRQnfrr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dm6Zbt/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJRQnfrr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dm6Zbt/Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7piH2152648
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zXRfRBSvmOBEWYCw0NcTobyt
	JHxb0TUjVtAqtsGGYto=; b=JJRQnfrrSqn+7SxPsN+KkI26FGtHGKpjExCWkLUE
	Ny/NxOoX6GaXiOS7hQXDo219MS1h16VXQM+GR4rmCx2D1iTFWLjQsrzeOc3vka7a
	+fthdmHpXKCBBlV6xDeNhENihWW8WnFzg//8wMYnWViAUUCPRq6sJN1PeNH8ZDP2
	EVJRvRIgnlQOsb7l1DG+wOOy8A8ZdksGXkrV8VbEHUMcF/Mk4ov5a19XB2S/lSxr
	qrBReBZPm38Z8YGmjQ2Tu5KSwEBIquhzJqUmQ7zKN/bdeKAvquXNVxujbHFz1Wol
	HsSuwoJsoII5MGkzh2fzTD73xLgrR4Og6pQRWx8EyP4F2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r95yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso8280641cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912275; x=1788517075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXRfRBSvmOBEWYCw0NcTobytJHxb0TUjVtAqtsGGYto=;
        b=Dm6Zbt/ZD1Eh95C+0+E6RvLNh7Kwer4hr3/YagKnzulTcO1XZK/5zScffkraSkQcbl
         a/E8jyurxylBeCD6gz/Q7D9PoRQ6QPox0QdLYxfa/FljDOSCAu2C+HKjTVvmysPhBe0y
         mnMTsiSZJ7UdqIjCVDvIz54jR0TtkXGjDA1ksVW8EHKB2ydK0i3jlixMP08DLvMMrE71
         F4fFRfXD68A6XzzVUIaWEcV9evVZUSbOG3OnQZP4QDRNzjj9ZZmidJlJ+j+bW97YD17p
         JG8PlyNMUS40vHenI5Xvdk9Z5JPbQRMUnuK/zTeV2Lx1NbsGxwuh/88Yb/McYHzTxIuZ
         +ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912275; x=1788517075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXRfRBSvmOBEWYCw0NcTobytJHxb0TUjVtAqtsGGYto=;
        b=svu1O9C1HwlSLIQi+CYkLbgWSdmwsFBN1bXytHPp4DSliq4lKEVm55nfMDyqrtLnIe
         BvMD+Fs8UEwdAAcgS6XusBhoxs2pGvBJfYuv5UuLB3gCBSu5JrRB4Pkfd+RnUWtNL677
         m+0iSznR5ukmLAb4P3vnQl4o3TkVOks9awPZH9XWW2XxQnXKxkBFFYYIMalSmbjKY58h
         FDMRNBlQtTvK7WdpKWkpWQ7Y16w2wAM5R3Wa66yRdeRwNb2OgTuzIaeakCF+Rge+YxUE
         8VUK2x/jfDSAHqF2sDMy4IhUzvRGRZ9UYtpkWH8yaAFMiL4pSyW9Gk18yHLDJ6iYJ+wH
         3E2w==
X-Forwarded-Encrypted: i=1; AHgh+RoRPvlzLkO6hmsIUwQykNfXQ9IvkxsN7n9cFCuuS0CAiI3sDKnJj+NQhnhKXK7IOX2k9mP5kocfvvuQN9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lHv20li60iW78MGhQ2DG2+BzIFzM7C0zAscYfNSnWa/q8g/Rfz
	2nEjWnshWgl29U7rET37MMvKa1x3u8qJhNTLGaW0UPc3o1FdjX+tY27VUbUCVstxd27WNtdqYgB
	I8jU64VLHS0CLeD75qk2/ezCEInXVB0dalzWDGqLuRF3RqbeXyQOyobRCf5us4/a8cig=
X-Gm-Gg: AR+sD13dfd1LBOam6RIzLiYS5pCEGbLljcmDS/BfVsw9IWblDAXuYJQbz9Mu5WnbEgw
	p8aeb1QchoVxMDVeeRSpZ3mkyzf2x/5YmYVfrD9Ow6TidW7E8g5Xt2KDI9kibMXZkpq6yl36MUk
	NZO2KnQOWj+YlGX27uSWrpZXM+RHw0uCZ2kUbsS/AZLommJ8BoaZ4eLGs2aWM8wNcFj2P9A2bWb
	fvoFx56Cf4dVgeIXxHD+roA8W2ue2Nz0peWnCTLAUE8ZfnnWO2X2EcFjA7bTFLeRTzgNtffBts2
	du5W7PHJE0J7wURu04hw0Dktjj31DkRH3mYpmHyNsdfjGg3VcZ6pmIKxcD8Fn5G6ExgRq6GeF3Z
	QAOtEEoeVlJ0r
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr74562531cf.36.1787912275117;
        Fri, 28 Aug 2026 03:17:55 -0700 (PDT)
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr74561971cf.36.1787912274497;
        Fri, 28 Aug 2026 03:17:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm118166165e9.1.2026.08.28.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:17:52 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:17:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
Message-ID: <5dlmduld25xbmfqm4as55pdxunts33wrpy2piybiuqpkw3t4ua@inu36526ekkw>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-GUID: udvIGjTMFsh2WDm9PMXL4KgjNM_y6JjX
X-Proofpoint-ORIG-GUID: udvIGjTMFsh2WDm9PMXL4KgjNM_y6JjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX6kgodqciwo16
 7ZkZn3eNMcd2q1X5ed+OWPj+IhGEfL4SZEEQK0I7gA7BGdvQMb3ImlAHQmioHNrGE8f1f9tOn3H
 xII7j4KXoM85WFab2drQGhf+NuU4avl6nEXDqdCUrl203mCjSObQTLTmIc2d/73IMO2O9Ozd1tM
 UPDia7+Sn3slE+m0GNP9THO0SrcKaX5kMWqfFsX2tlD3zhUstO73jfswZmBYEGahb/Y4xzVyFGM
 AZNPz4+EQh4pf6kU9Z0z9yA+ON9/KY2emwpepdmTh67+7VXCYExmOt1BQEvbhB0L+WuP3Jrke1A
 +a99PN+tAuyMmTnOQ9FvBkHkKDDeLgn3B31tV+62zp9DopbTlMpXvGEMxRHZxvsBPasjro7OeCo
 4FL4jhGiyLeK6rsMag+atSo3cJmRuL0VdAUxdK6t1iijt/6rhYOZtC8IV0cSVRohzBeFHyFByxR
 z/jpYl1Wer7cKhAsLVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfXx/7r+KSmfivw
 23Q/1YU2QgtLq3E+IRXUIvFoNWlUSLiRLZ5Es58SrZFOM84NslEk2ycsvw3mZpygBLjejwnXQsS
 CJg7nYEiLJdIMbxQ+aH1/BKxgCoCTpk=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a916053 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lS0QMqM3BESs-n2QcPcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:16, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Rework the DP PHY runtime configuration by:
> - Extracting common DP PHY initialization sequence into
>   qmp_combo_configure_dp_phy_common() function that is shared
>   between qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy()
> - Adding dp_aux_cfg2 field to qmp_phy_cfg structure to store the
>   hardware-specific AUX_CFG2 register value
> - Defining named constants (QSERDES_DP_PHY_AUX_CFG2_V456 and
>   QSERDES_DP_PHY_AUX_CFG2_V8) for better code readability
>   and maintainability
> - Adding validation check to ensure dp_aux_cfg2 is properly
>   configured for all hardware variants
> - Updating qmp_v8_dp_aux_init() with corrected power-down control and
>   bias enable settings
> - Modifying qmp_v8_configure_dp_clocks() to add VCO divider programming
>   and update auxless/LFPS timing parameters
> - Refining qmp_v8_configure_dp_phy() with updated driver enable values,
>   TSYNC override sequence, and additional status checks for proper
>   PHY lock verification
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
