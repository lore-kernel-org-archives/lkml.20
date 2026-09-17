Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4584D4892
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658046; cv=none; b=nZcO7gHtFeRVQmndnQ+97Pnt4YfH+8+cTET82kQsnsEkt1gKxKsQ9wHzQgaD5oRh0XkzevjwzVDKl8/0DwTRygsYIUQPoF6s8fpW/z/8yUTrYcjGAJVsO4CHcTbPv9aOjTXho8M0dNO05NtE7hvX16hem5TuSCiuNhcPnNjGFXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658046; c=relaxed/simple;
	bh=qFqitZAPT7YhE+SzfbmQSBcXIJW7TK5WRemWM3eNHHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcDGNTKcWRBCpoa0OgKsNK2uZbrKC2omexwOWdBdzxhBfHgWcw6MIz/EpnZQqOsUD2ZVcdv17+5r64ssSoErwPfNGWe+tQ0+CLxFNXC7xiXqPr3VFUzcSCeTvl/rzE53dk9TItukXXhjf4nzctsZSeKMfGnJPrqEEUZeZpEXWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPCEIVq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVvG/8It; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPCEIVq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVvG/8It"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiLem2086387
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pKE3Tw6s1Tx+aDoJccQ1dDP7
	DWWwIncglgNtIuBy5L4=; b=nPCEIVq06zDTvtEKw9oYcaisOM0brMAxXQGhHsT6
	v6+sy2xobFHx+eRP2UdOcBOJMj+HIOQkFeu37YEKyOJ7i4LrVSiAAkgQVLQENfMQ
	prEwpKnC05XK6QLnFwsd+Ms6SuMAa23CJvuasCV36J+SN6s74nKqQccW52bC+Afu
	QcbyqpL4moXsFjWYUll4ni0f5ePwmn7E0Zn2ykZJTNrArtCSo1JX2fY2NrgVUUlB
	vbgP9YgZdmer27gmQpcwKAlokf8viwLn0Q5Z6hLFtlLQaLIXe7q6UrXVJK5kH5Bo
	BCePkI0NAd8vyfKqCIrdMARJy+6AFKkGg8kP0P2xiP/NDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu40xpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso233656285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658027; x=1790262827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKE3Tw6s1Tx+aDoJccQ1dDP7DWWwIncglgNtIuBy5L4=;
        b=gVvG/8ItO+DiGyZsWjhCGjapsiHm2eipVX+HKYCa6XGRnj3BE8lb8PCmBYoLj2imGb
         8qQLoD+Of4aku8mrTqg1qwKJItQbzIq3c7BHs08h/Dg4FslBIyN2B42bhW5N5eebztem
         Uuwq742r6vqKVz353xmjOBoWKPxi3CYTHKBmkGCCplXxjIhwqxzT8HGByjH98FOIrMhk
         R1yf/POT9uq22sarw0ZGB6LSvOiiQjR6uRRyVxjY7UCscOVvQA0HjGkGp3ZpgW1ylW39
         LTWdRNeeFYClWgEzW5uUZypI66AGNTBL0f/eEnqGNcjlMAogVIYMnX0ay1hWBe3tZ2Yh
         gNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658027; x=1790262827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKE3Tw6s1Tx+aDoJccQ1dDP7DWWwIncglgNtIuBy5L4=;
        b=m5Mhvnl8O+wCWCFEXO9RzH2pcNAOoOtCmRuQgSK1d2auSowrK0O9VSVQrNspP+Fdm3
         IjENYEV3CZfXTEnjOHQz30o6iXT5aRgMP1Ke4cNNH6V6A9ajFMjeL6pGaoxrWwmNS6Jq
         852VMUNDzqRUBxtgVTuI/bgh94QSYoN++WZkoi+YjTRkm0ovHBAVbsaENThX23PQOGjq
         DBmLnOCjoYWtJZ7JRLD0xEAiDJwjdoYgpO4DF65XywTdP2CNDF9jQPVs1LWg/pZ3nShc
         yGm4Mtd6veO7FGj1UtyU6+EEIm6AU8/tbAVbJ94UyGeL45gOGP8v7VlaTKZ2Fdhr/6bC
         jJ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBziTprJrbqHvZ+f2wJ0RFX4oWJxBb6M7zdBzqDuzxUc3mAIXDNkVgfvdGj+thqCWXyWl97/cg6nm2XEnjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lve+atrH3bI4d1wHZMHXFmEbrq6RCiz6TgFZ9uE82i9Z9ug0y3
	fmvwaxjU8FhbHe3Oxar6CIOa7aChC4cjAis9qu0PknQmKEsauhw8nyTUvF3RLoLMltvWW4OJ9JH
	KcaAPQxwYN30gO4J/jQE63e0URfG1aywMWNd1/nky8ThQaTu4U4JoZAFJuGjqgnWWKyQ=
X-Gm-Gg: AYBFou36wADAFGWPA6Za2ZM87NAigJB+z88s+pkUWlnVO0JXJ97ycTmGIs8r8madfAu
	IRIhdZPocZpBvESz7EkuGG6LFRTmSzmi2m3fW1vZEdkFOSp95nHixMaEdhaiJicXC9Y99pWeT5p
	6bkzKwNfawliJzaC7ScNi2iovWibxgB6nLnqtFtlPhoJl5KTH3Ln0CADBVYJr7VMq0DKG1zL97n
	sCD3L9JNpKhc68xGX3e2SWhFBZaBvzbjPimBDKsOvLIn00cKhXfb3YBP+SvsYL2rjhIrcwJl18t
	JG5gnpsIy6csOyjCs8EXjXryQeGyeuFXRdg8Ge+Nqnzexph8AkWPqotwXO4aRs9JekURJSiShvk
	fJMElvbKgZSYyuzg=
X-Received: by 2002:a05:620a:890d:b0:937:50b6:4a5b with SMTP id af79cd13be357-93bb7764653mr1099323085a.23.1789658021976;
        Thu, 17 Sep 2026 08:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:937:50b6:4a5b with SMTP id af79cd13be357-93bb7764653mr1099282985a.23.1789658016703;
        Thu, 17 Sep 2026 08:13:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847e994dsm113837995e9.2.2026.09.17.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:35 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and
 GPIOs to root port node
Message-ID: <7nh6b2w2clecaqfjm4zcyqng77dfx3cavv3xfeqyoziukrktcf@xnldmtruq5da>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: vDCLzlQXFn6R4xi-rAiwq7UXqkMk8ZNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX1buhhNo2+s6d
 AKN6pG0FggPy4nCLin/zbx2g485Nh62jcJIY260vWz+y8hGRDZ/Bliu50sso1aL7t/yxHcImh/a
 ai1jtX3dlqhUD6FvBznsbc6TfeuXM2s=
X-Proofpoint-ORIG-GUID: vDCLzlQXFn6R4xi-rAiwq7UXqkMk8ZNi
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac03ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX3+7AE7W3BqX6
 UdgPhmCi73IBU22MgAe8fGO3/tmsNkq8nx030+5oWt7O/wjnhWnNQxDtrjHxzHawpHhsvxZ/2Bx
 681PUBSGruyWajuBd33wQxeewInwSPJzbEzRtY6Z1ccLfgXIyx0sHWKUQ6UHsiYxShUEStoWziv
 mpMmDGZfe0NXwhVjsxGSoGqJUZjcOdkpvpgP6cKR/mD0dy53ZyaNKPju2KNZxfhdXW+O9ELgHYS
 7UKVNNwPoAEMX1wvjMZsZQnvk8JxPIOGZrFr3ZoXFN02rgMRd+f0BiVvYSLjzupedPTQQFx663S
 Q0OmIKK1LaYuYomRwR9FC1EU8yoyhWCfn27YTqXG5Yni/ngE9o78+gSCQu97cPW6VKAWyobqokh
 mxcNYIJSgsmPawpdoF15X5DGVYUlDukP+U0EEEdYeAIUTEwt74kjAmrSfZneOgAWeDAInUsxVDE
 IoB6XdJRi/TowndYMeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:20, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
