Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB11A6814
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247771; cv=none; b=eaL5P4ehbxrVCMJeLvxy3H2MBVVJk+D6IlaG7gkVhT34cAnUobLLwTzjta34L78S+IHcj6YsxoOhZqjlpKLbMhuud5RxoubMePnp0eKGvXkrChk2I+93dnIRKIE/m5Bcw0NEoONRYRRFeTYptDLsOEUe5A66P07ApoRUAlZAUT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247771; c=relaxed/simple;
	bh=ANQiLA0cFainq8jfOKsACEaOMEDBVErZTyykjdy0pYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgbixU3NeTNj62LoCdDRITQBG/Ud532c/Lapi7+gTC9RLQZvey2lGMR9m0kOSXGrq463d2FTl0rnZCdsVnYLCGWTBtnx2iumwBj+szw8svZ4iHPJ2R9VLxHn0XVQoy6Kw8Zo7Z+PmF6UJ9gbqTV+IBmBLE3OFGKsK1ScbivR4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8hUJ9kC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f12hOv5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8hUJ9kC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f12hOv5+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PlLv1644168
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NxQt8R5fYtvLOJ6TuXO3p4HB
	ZiwczhLbMk5Ai5mG+hM=; b=f8hUJ9kCcxS+3fgL5dpyhNwRTw1ciYi0rqvhB5IM
	pQ6OiOxjtVEv/K55pGo9NUHX9kUcR09lKvFzAmrf4Y60UQ4SdUMXeEA/BGgj+ysj
	GHUWJbrnJ0ve432ikiPgaFN7VURoZ6s41KkkDbIPls8aJoHl3QvdsGuBgDKzQUqH
	spN9OFvl+DVvI+0ySAfSWM5XsJtJgjyyvD1c7pdLP/GpSPS8DYNV6nterbL5UFCe
	EvZuXWiiWvD6p6ra4hocJxQWiEJqRVLpj+OLrbcW1pnPhqkWti2cERRlRc7BC2sa
	CO05J+o+2K0FW6WoLYGEpKR0ICKWZsRFkURKT+hldVBryQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb6qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:02:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a9378b844dso583955137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790247767; x=1790852567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxQt8R5fYtvLOJ6TuXO3p4HBZiwczhLbMk5Ai5mG+hM=;
        b=f12hOv5+bQnNmKGGeA00Z9TPUEQWIUtQvleQN5R6UKZlyUYSsnkJ2SF4Fn7mRbDmkX
         e7flk76HdgZrBu6RRbgZZLUKq1U47t3UH+sIEFczJtYUr9SYc+QM/trjNapZP++LuqYj
         38XTh6fwp5DyVebeCYTxURvtlT2UquLfk4gc8jAcdqYm+TIs47YWZDVMFTbgeLazxeC+
         Hg9+zBkJe07Cw6kRqQLDOHbC171kor27unU7VN9DTv9JsiLiZEVAwcOJhs1zq1DuHkCo
         zJpxvPmSQ6be5DCjQPQ6C/8qy+FitmnuKRDa9BgmAmpS0TG2j5DUv7Lamna7YdWgKyzW
         /z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247767; x=1790852567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxQt8R5fYtvLOJ6TuXO3p4HBZiwczhLbMk5Ai5mG+hM=;
        b=LCt77fmU58zUhk5ay0+qe4ynnZIGExBSljw6mu+hWQDjNtR3kTGfJVlp2KQc5OlFFu
         ecAMIPtFOckJj2PPYyjL2jX9dOVYo/sRSVjKBoayORgC+ht09kEmR1Gb/e/TptX/9fjj
         zqUy8ZmQzlsY3U0/vyQdtJk0JUTIN8lUUi4iCr+3mpBmyRDuUQpEsUZ+qQjCK8Pb6I10
         nkqq+q4JCrBpiJVav2F3ZZFjdAuyB976HqZ6jiKj/qrjTAtFBDTU0WRlhVYIVzXqNyls
         /xO5QO8dK1DY2HcnWrRQmc2xtl4Py0ttejh+/X5aFxvUaLWPPH91Sx2GuB4wfHEtJ2Bq
         WKjw==
X-Forwarded-Encrypted: i=1; AKwUvBwTyjcp6Conb7ik0MfvvnlfTl8Ostnp7u7CXphfVRsMTG7YU82mAKfu2tAE2jYu2uo/AFI6GCRQTqzJGQY=@vger.kernel.org
X-Gm-Message-State: AFuF++kTvbI7FYG+eDVJH09GcouR720MPsgsyBFouHn+gds3IouI63g2
	gh+t27cd8MtgNdLZpwn42jktvdBi0vBP+Az8ALC8v2JRaw8kwXrspG4pdwKmV5WRA6HK0HxTZWC
	1XCinPkH72cFzJJw79QEUDwcATrVykSO79CfAmHnkt2AHeTpfj0bdHSLNIzU4w+jtHyCDOaNvYp
	8=
X-Gm-Gg: AYBFou2SPzuJj3E4IY0LDh7rQmMG5F1tYpUdq5GgJWt7Q0Ug/D9+CiHIK6dlE/vdvEs
	/THotNJzKQ/ibyamyYnWeWlSjpPjgc5eeEU6FbyVlT9oima5u4mkCzTTLl/LOrBuzERH6It90jh
	8T3uxQ9fTRI8GJutBBPwue6hJgazU9uAWAo5n8YqoH92I6HFDJiEVOTB3orSNTDLULMcKC/V7GV
	Mp8i+8KnA2NNhvYFOwoBh1QdC0moNxJ4US6SyNEI9KANxYGa2AZnZOglUArKcAKQWMWRdj4GdDR
	hro5H/0/WpWDY1i8DXpDlMR/OqbzmeAjwGK9UmvF1U5ceUi3OnD/1D4zprQfSMA0jfaI5Yu7u7f
	6LmkioPrpc38bw0k=
X-Received: by 2002:a05:6102:3ed1:b0:7a2:2f60:b9d1 with SMTP id ada2fe7eead31-7af1c58fa95mr940260137.6.1790247767163;
        Thu, 24 Sep 2026 04:02:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a2:2f60:b9d1 with SMTP id ada2fe7eead31-7af1c58fa95mr940250137.6.1790247766457;
        Thu, 24 Sep 2026 04:02:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889409sm11420229f8f.35.2026.09.24.04.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:02:44 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:02:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
Message-ID: <w5nbjeo2wlwrxm75f5je5435lamku7yy2vpyedl3sf6xcyh6ew@rw3seuigunel>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
 <6f07518b-1917-4560-9b62-ca21e8eb56f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f07518b-1917-4560-9b62-ca21e8eb56f1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX0m6yDF0yXZ6W
 GEsop7V8Zjo+JFhqhiYhCg8ZURyfo6v25/oUxIqKflu94k7Q4lTq62svEhPPdAEq49m8WLv/t/7
 1uh42PKsNbtfr24X7gxWMb8dEGaOLsXpc9oDYhmqb7EJJG4KFOnI5VSxFyY6GbTLwJ2d4zQ3LIc
 o+yqpabAAsNevRlsdDUb4ebuPnvm6owSPnaKDJhJzf3ipjKfmUryWTGIv6dG8NSqCOlsGhzCiVB
 u9fawUmD2Ztm/XJom3fshNd5bg7tC+o//FIVIHESvcMijK0SvlmlbsBKIMSm0pG+ZH8TKZA5dg8
 /Hvo/EuaeAdXt6HzotpQkAVSnyN/4eLXzMlAsMGr/zKHFF3Vj36TLX8QvNrt0tfNPgMrOxRBKiD
 2bh8tlQJ1RK8syb26dgFr+pzCkE/fMD6AjRpzF6BpoCPUY9NJvlgYgxnvfqmzpVF64lCPaCpxbt
 AplFR/RipKaXRzj3hrg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab50358 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Hz9O3dUgf4PX4P9uInoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX+xZAukNBixtB
 jZr4Yns0WoIt71tgFiOKJS4LxSLl398f0wtWjsyE0KKdP6p2iHvEYGlZFTPwmNlbMZjgM8xWZvA
 nYVcdTHuwTRwtDWU6icO+WYBqgn6eu8=
X-Proofpoint-GUID: EWMPm3iEZLbxMW08moABVnbpOaFmBzTT
X-Proofpoint-ORIG-GUID: EWMPm3iEZLbxMW08moABVnbpOaFmBzTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240045

On 26-09-23 14:52:54, Konrad Dybcio wrote:
> On 9/15/26 2:03 PM, Abel Vesa wrote:
> > The sound card support is the same across all variants of the Eliza
> > EVK. That means we can reuse it even for Eliza CQM EVK later.
> > 
> > So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
> > implementation.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> the soundcard model part could be moved to the board dt if
> necessary

That would add even more duplication, wouldn't it?

Keeping it in CQS EVK allows everything to be reused. 
Am I missing something here?

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks
