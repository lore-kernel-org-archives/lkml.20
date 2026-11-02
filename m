Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615277;
	b=RpjMAN5yz917agcOU0O5h0PYhyJdNVPtAz9fe3DWaEYh/cuBkfkUL26YbQ7sLdM5BdvR
	 1/iN/I+KnZutiDFMJGJUTlq+t3Mz8abNktF6mGr0cocYxnwA7mo6Amr9uYiRttTUIbarX
	 QgEZ/yQUbtrJ9vsJ0T5ztMiDZJZH44NvOyDsUcbG7B/9gEJJJhWLPEs8WVwLISE9z1uln
	 u83GdFINEEdQOdawWd5nittsuDypKr+QTCD1hXTFcHuCvIoZw4jx+YoIT8XDVWIGv0G3v
	 om0BiNYlcJSZQvEFcHTNuHLW5y3oKxmAY8qS1IhL61itbgEY8+MJY+/0bk5nkaKlQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
	b=2xbUdG5Ywt2RaUmyu8AUHUT+Orv0ztV/luJj0ujf1iLAPglNijLS0uANw8Am+ggvovuU
	 5HBNy4+Hn4Hz8NhzAqtAUC4btu9wRkPCmhXsjkcC04htoT+aOlobBxb589Do2F9tZ4HPK
	 bgz2um35cjzhGCSh7ApEra8QxauJnQ7K2svY5N1YDPSVelxGZ2iVQ+/962AHJKIoC4VTT
	 0LNDlyaL1JyTT1VGJ5Ui5n7uvREhKRIqQVHLsdvA6hPI75UAWh/R8AVybia44WbzFjKSy
	 WL/1TaICOXgMKwA9KFmpfgo1tL6CE1Ib7J+GKQn8UfD/kS073HVDsyLnjaaQgIM69hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQS9CR5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KPk/dbDh";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D3D606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D3D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQS9CR5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPk/dbDh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AM991821122
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFnKrPahxdZItDKPsTLjlGEt
	tL3SSieVGxwpz1WB970=; b=IQS9CR5MACBtEgzZAUwsfGRBNBndxkNx3KxtN6wm
	nzzvUcIrtUWoZvfcz3lxaYoP5z5E4WOVGKw0KnNu5YhODMOCSigK2z5aMtyHE0hw
	jqrLaWGw2rDer9HWBxd2jxzGDhVKIroDzLBFKC7zqFirq8Yb3olkEKcnDVGceYF9
	KvYb9X39CWKCSSzJvDR0P89H8z7B1u6VcSr79w5h4saFPpqcsn7KbWkNTquDE1pg
	tSWKlwBZIbXAis3zBL4sSsFRdZutqQX9A0ZhyS2sI4H7/jPqDtjlp6L5cceWD+Ct
	vHiAnUr9ZXL48/gen198v/P7GlTJySX85vXo03VDCyWR8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h77n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:27:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so309994385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615275; x=1794220075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
        b=KPk/dbDhmfWanqAALUZFNN4fQErsCs+aPCeVdOoNuZ1MTiqCDj/1fYf7cjjFpte8MQ
         ffugETvwiiGUur3slFhefH2Zr0wBzoZByLpvzB3KxLReKzYMn9Z8dHkra79tXTI+ZBEp
         yIMX4ezAemvbFFNQs6J/ub/Yr4+9jfLdKrRv99Spil4Haxr6mk8YIk0TVcAlKv+VHBUc
         vFTdSLeFiQf3rRFkhJjtkOeP7D9bEY9Fml5MNtxyKkVPRlFPuDXhzU6jnOcg5K8ije32
         kbV9Aep+w/n1VW3Ik7tCt4Brd16RDNLqKYXOmruwZRzHtqU+rR5/T0bR2wLHeJsm/ctv
         zByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615275; x=1794220075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
        b=Me8IbnV/tLLAmbWxk+wGOZBNbGPtaXmGuKTqm9OR25oaGzSmW1yCpU26GKDogo8Kuu
         BQ669pCfV9twuZkbVAyQ+M1sHztg894TWt6+yHl30rHednuFL8rVAGCCqvspSiNMPN09
         vBCwz+TyacuSocgJd1st/FurdSr+SdeMJj/Su6kwAdNLSw0Ea9FL1IxRHNYLrjW1RDIT
         DRdI8CGYJYYi2QX2eXwQZ2MBBPx2EtvgeCLgqFZ2svgkyhSerPnV5Ek/Pmat8MOIWfTD
         t28ZXclFjWpyU2SenXnLX3KFTcbGDyHwmdKf8Z8PWRHCtmKn+Sw/ftUIE9da3GWixP6i
         iCdg==
X-Forwarded-Encrypted: i=1; AKwUvBznpVlBv+KziCjUTOJch0jpjzvHpnOA7fH/tTn4SX8RL42FaQdEtgaUOeVnDyF3tIwovFRQqvj4C32CqD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIvToZItY/8NckrPhifibVR/fXUz1Lv0ZP7kgQri/17vxK64MP
	ssf6e9OWP0Mthhasr8N0u2Bn64ukz+b5kNykNRNme2sfKghX0jyNkInIVKkXoP2xu+7pJLYrbBz
	o/yIMUTBa0umKcJt/c6pSqt47VqKq85X1XuRsxuxugOphrNmyohpvqO+K2++geeRxqVc=
X-Gm-Gg: AYBFou3lnjftMNFAQD//xBunIF3zXZwZj0Fh2cO5jhE/KciPIe2uB0rv5RLZJkHBmKO
	YudvgJpwnFbxNtri8zA0CRqh9dc8zH8ftDrYFa+uzfZJHYdoFBJzCaRwHbLhtrmswwNjjd1M425
	RCIF925TnRYm12XEl5EmNjLobSV7wqS5gqfd3WRdbwKem1FeGxK4JxX0rvKDtqLFv1XXBdvIWgz
	EQ+bf0bCI5oah8f9Ow5/eLLO/E1Feiju2CMxBu1AEvAAXlp5eg9V9ndciF2jstIksYPL+QN3N+e
	zmOZMI1N1n3ZUXgx3BK72P4ChKcl9KwLFnxosiaJm+/ZPglQ6o3oqjE4x8hQf+gIbnKzMsGc/bJ
	lh5w9ux+oK38vngqF35Z8iTaOY0TreL+5uFcD9ddSKGvxDVKfjPOrXXI+G1WnjrY92HsYkj3oEM
	ZVS5IzxmyYlymGLvjsQQHVX/S0PPqiQcdjNwB9bSkNY+QTmARDI0lYYLWkOymq
X-Received: by 2002:a05:620a:458c:b0:93f:102:566 with SMTP id af79cd13be357-9442178cd46mr1656686185a.67.1793615274527;
        Mon, 02 Nov 2026 02:27:54 -0800 (PST)
X-Received: by 2002:a05:620a:458c:b0:93f:102:566 with SMTP id af79cd13be357-9442178cd46mr1656684185a.67.1793615274078;
        Mon, 02 Nov 2026 02:27:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0721784sm1677022e87.22.2026.11.02.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:27:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Message-ID: <425xxjrsglh7hzenjwogtxto3xyn46zdm7mzfrrvonyichqv6m@72f4nygmedgy>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BJODUBUDAL4Je1Pd5FlUwwX7s9D1UhvY
X-Proofpoint-GUID: BJODUBUDAL4Je1Pd5FlUwwX7s9D1UhvY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7JVTLk03qg6B
 U531TlOb38aNJDUOoX1nvvv7+PM2cO+gP83R7KGJSMAa3v21q4tCFRmmabwt8FLF0IxrcHSlvLP
 BR57EAQm8JveKnyxwr11pD/TsO3VmwY=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae865ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=chFjt-TYfWtG2qqLwSIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX/SGtiyzQGwDz
 Cp4cuJrRe6UwFsBgEcs9VKOCnepJ8QXV4s5jTCVC5ilWo5gfS92R9pc5r3AAwwoDwdmGG4S19qU
 m3nV4R4KYA9CPoaQNNsqe29cwAQP6GS4hU9mqWPSItp/UIrJ0CaPNIpI/Oy2NAHG8C8Wl4GMBjP
 jalg4ZrmA04UP1XX+LLlg4W76aoceNgWfwPrQG2mXXOxm88e0Vvnh00sujMiQKb8LC9XccVnOWF
 h/BF5J1VSAivP7Yi0pr9OFTb9+ogwM0stLNTj8IZk4Ws8az7mByA+TCLWz4uiwBELnhNr+yXLU/
 7TEVcj1OS2CHegWuEKHROEIQGoVKwxnO4udyetY+m5lqwp5OUA59YAaUjhmh641NSfjRESokaGM
 tXgAZN3vmkZtW8TK5KnjzGjGDmioMXWZwiSxqyc8bqmMv+9PyvrinN5Z+ZPmrRVKWbQ9sn7/lK0
 gLzFe9JlBKfWjXV5BVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Sun, Nov 01, 2026 at 09:49:09AM -0800, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
