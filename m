Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E28C3E5598
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912315; cv=none; b=omAV0f94sQV/3wgy/9Ot/aPdlNX6PjxSv/CIRnJFDJA0sYrS2kz7URD95k5grBZ0Q6DoagtkO8gSMPwLDXPfDlSLRR2WRCYskbvr+JHwP2r+OMi3rR1kr1ICKK8xZWT878VKrgJaTOt/YVv47b+TNjgZjWAgKdocSWtHk38k5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912315; c=relaxed/simple;
	bh=MT3t22IYmBT9HKa6VmXK/I9tbQqKW4TArirlfOLamqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=km7QjtsoJx7dHvU9N/48NnwF18Si4FzhiNHdNz3eiASDddBEmRuWCWtZL5qZ6+NaC55zxBK+gemKydM887AO7mbEWhU8qn7+cVLorzMp3Wd8cvHx0me6q7YxA9ff5kNkkOa0iMF7yopY1rGIgqTP6ggRcibcka7TY3gcKPmpEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZjdc2an; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dElalojF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZjdc2an";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dElalojF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7lGP1581393
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UPIh3zF+aXwmgzGnekusWTc3
	pCEF4q8uSRn9W8BT0Ro=; b=XZjdc2ancIMEi76d0AHtz7wR4uRNAZRJ1bNw9bwc
	CnirKdWZSqqWEFCDMHVQ+SjtRwN8FUHmzYPdPObAPrHJK1bEEWb/Je+VjEMGtp88
	1DmlZ13PJt6PeMKb7rjOpe5jwPG8H7Cocv+Oop/A69Zuu/VnmmKQl+a1r/E4Cyja
	kckruj2IfWay5sHN4dbun7+jxKRgXKnJPP1Wt8gAV0Y1ykvmuPGa5XthFsPZcXHh
	rk9T1mKAwAd394G9zKTZESIDQGrwHGK3k4qTiHrAjOcmirGbWouEVRAUlpeLnnzK
	48KI7lJ5pHCOCO683IYSVur1cdnIoDNBTRzmDWjeT+dhIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc3djh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:18:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso9596141cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912312; x=1788517112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPIh3zF+aXwmgzGnekusWTc3pCEF4q8uSRn9W8BT0Ro=;
        b=dElalojFOo2NBipUK7OPRgb27pEehDg5SYowkZtwTnWLNOIt2r+dwqp8Obp3Ydfqtx
         fOJzC2bkK9VXoLlgnWy2hgbYf4xFBDRwNxHODrBkQveG2kGJUno3kM3fpInTnL6yOg4x
         +1SOk7M1IOpkcx62nFelrXdmlYg3yAJZRNcgbf77bUKNRVBK6XNzDbU0/W39cAOoMS+d
         Ej9wP/QxtzZa7lxthg6bu1uqX48Cqrw+OpvSzePahkE4pF/Vtzc9OakEKz4cFvro5R6h
         W8Ckou6LVYy3/ggK9Ut/YMB4Orv60Ncv4vp3vKlrsSHvP4ZXirtUuRxEEa35TEVgg1FO
         4Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912312; x=1788517112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPIh3zF+aXwmgzGnekusWTc3pCEF4q8uSRn9W8BT0Ro=;
        b=VSBXq+Nl+gFLCtPi/hwn1odiG5VelBi7s2pQ9IvPNXyAcs7JaEei/5/4J5sUJtWzuN
         c/xKhJqd+vZ4xrBcaXVcvz2mn2ymwaILkARzXdQrqtdVMnpbn1fQtSdU5Dyi3slMVUR+
         eFnlOzlbCeO6eryzqOTomfOWQc9B4AVSRVRFu70PSKwY5yIINqIQf34OFC9Ap1twKyW9
         bVlZvHE/C76sIHnt7JzXC2Yp36+zRctKWxHCdldd8WzUhW4EH6bt9P3p55t3wf0P3RLs
         CD80nLK7RB0z7JlwxJCvU3/6gqD3I3wYlreugJH6k3tPcbuGygrxmRhlb0RamJ1iOJL6
         ANGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ojib2A3igVyt2wRkbwwLSEUYpfQTmCTtO9JLwckes1tj9hFPw0Ej+uUW/vhnIRp8eb76e70Ha3S0TZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++n1CurjnO3h2rBe8ZSwx1ZT0vQqq9SWfXLxOVJCIWbvNgArEUjq
	BNwQvJfedkYhVnH3bd4TecjCP+RUUzGtff9fyko1Om6nnFhCPAsPBcYnTYqivOpFgKClsU3UGng
	5cVQFIiXBX8K+uUjTH0HPn4nKenyF3QZzYUx74s9Y7MYu/N6QOJLKjDHR7MKWPHVV/2U=
X-Gm-Gg: AR+sD10YbSzcBLrfbgiGpdulqKUXA7IuoHTBhi4hKDBR1hOWrJ0sIPOz2Y/TFneOZok
	0dX6la5Nnnr4Y2LQN4TkwhCy060WFN26yYNFc18bhXuwyRFZ4E3SgV0ckOawjJHEFXsaCoGC1WQ
	KxgNCouGFHPdiIE6Hy00jSjqOhhHuVx2piBIQKkXotJCWA3549WZprpdPMkIpYNTi0JtPW+1oWp
	32yb0Cc5UA/SkP1APIzbfIZYdUVwSZHOwL/+bB88/OIv6IlleFPaMC5AMrFeCUc7J1U9bsnwbHB
	rDg8HLPE38wpaIxVifvJaJjRPf/rMNI3yWbI62ZtoTuV1jKTSMV+uY0wwGfQcEHHKjM8+NMzfJF
	2hRB+IDNVqfm/1Q==
X-Received: by 2002:a05:622a:4815:b0:52e:22f3:80cf with SMTP id d75a77b69052e-52fb96924d5mr72845681cf.32.1787912312247;
        Fri, 28 Aug 2026 03:18:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:52e:22f3:80cf with SMTP id d75a77b69052e-52fb96924d5mr72844771cf.32.1787912311572;
        Fri, 28 Aug 2026 03:18:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32ce2sm3219539f8f.33.2026.08.28.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:18:30 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:18:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] phy: qualcomm: qmp-combo: Update link rate
 specific DP PHY tables
Message-ID: <ivvj3e6af3nxiou4clkgygrt6wijffj3hmaci4o3a3q2d6csso@xacna7tlxdu7>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfXxPEs/uLQ7LPj
 ilbhwd/QBdRZ/c60+VuB/1z73lXLtepA2QEa0O47FmmPTStAMRVv3SNIjMPeNrEWK7yaKBraRSt
 haUS0CLzMT/SSNDUxbC3oZb+BiDF6MN8LU9DRkq1dQa2QxHKpVMx9rgf9pgtA64JhMKgF5AaR2r
 Aa6WncQZFOKKAKlOFOG8e2KkcWiP2mqrDMhKl67bK+DvwA178fW396nxBW839/7ddZUBFFASI7D
 tiYhdRLaUMuWnRwc9QMgoTsj3cQ/STYadCPl/dBdvdvEzVjcggZO+nFm7pOC/9sIpD2mbWm7+4J
 97J0eVKTPCJXVwpZjPfYwJHgs4u76azsFb2mR4WEryr2c+Hg32V8psdAcY4QJ218Z3NJ7rz7iaf
 6yKuacbzxvkvDL5r/C5SCFBpCySY3sS3P5yO2er2NCKCxbCUn9e2snfRRUtMKrcuH6OvzcJrbpb
 VTXI6lZTdvbqqEEKgGw==
X-Proofpoint-ORIG-GUID: 7e_YleKta8al6ghQUZIKbmY0NDtWhlZa
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a916079 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ICfJUWih502foIDt9eMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfXwJ58e4YAWl+I
 WhQ6SXtIcAdMzDfBDIUVKhpge7K4pKDkmLMO44fXejm4S/PhdvMb6I1Mv1GkW0q/RQjuHA21oox
 FbrtBU/tw3xLlZQoP8xNn7SYrNzzm3c=
X-Proofpoint-GUID: 7e_YleKta8al6ghQUZIKbmY0NDtWhlZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:15, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
