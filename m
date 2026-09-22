Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676553ECF5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079476; cv=none; b=RU+jxdt7q8nUXcUznzHCIR9JVtpGISH4BJa3NLOTglD8GlTkNn9Vj29n2S8RxWHRBbkpn8dzO4KqI91hS+6ohdt0T+c/LJhFHJpKKu3XL5ED3AZlQA9us7WbUIRsLRoO0hNsLWPzm+FOJevaLexuNpZroImOn5sUYTsLhHOFicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079476; c=relaxed/simple;
	bh=Z8vK1PMOHpIAza5Cd6gxs7LpTHqfr/WP2xIKptv00YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/nK4Io6jFC6cLwUZHqiW3wcRMrjN6oqSR1KEnk3N6vGJYsPvD1x76D+lZdvLx7MPpMQlwIUAoix+pWkDNFm8LRXsVgLTABWVnONrhbILakcz8+MXOYZdyTOk4jisxKtlxTJv+W7owvR4fQ0SP1vXVWKyEq5kQ5X3N9XCcrR2xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1N5OLOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmY0oOqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1N5OLOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmY0oOqF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYm83671747
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=; b=F1N5OLODQ7a6MzPQ
	w8FA6pfTc8OtFkobuzc0lUkSRDbRWSrallSYFHLCQnFWQJAYYpbFjVJsgqmHs2KB
	p0g5u9dgOlkp9Z6A/jphYI/s7bVrrnf379ghYqK0lOBaUppFadnIOlxMNhlaKt8u
	LylTyXyJBgIFHRMyhKVyBD8bElwWLftDLMIDRXCjAahB48k7Rg7aCmeBCxDwWExK
	+rff+1Vmy24zq1JI36DeXlUWI/yOQCI+l8MVVQZ2xN4feTCZjiAsM2AMktWPQpqS
	MuCyiNjpLN/+4pLJYzcA0qVby7ioWfAzkfal1kTG4VKRb+TF7ieL6HEcaYGLTtDD
	ZwQ2pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt86vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:17:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-868db1b2c64so6819842b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079473; x=1790684273; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=;
        b=cmY0oOqFMLCmSwS5lljktyVbPTmH0SaZoUpe/pL9RE534uQvlSF1HB/ZB9yJ4QPk7f
         T/fOPQ9l3lx+/yamhaE6bn72MrFYBV7hhASsAOGQMjwQNMzdk4dFquGNIByMBR4gU51b
         IiHGlTwi15XczWKSc2u1ncEekyDvzkqPIETP/DvFOznBNxWwHf+1A5utK4tRgN1O23Wa
         2jdvpGgW4BLhQ6Dh2iNFSJouma6DDobtgfH39ICQ7IjgFaXggk03SIRYTf6dsfc6Qwbo
         kHV7/ELVue2Fv95IVZ/RYphXwWl4yztWeYwrX6HKESjdR6ZsRTnrKlJkuN0nQEI4guEF
         pwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079473; x=1790684273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=;
        b=dYfZZg1Lesc52nqRxmIIixH7/zRDK+Z1lsnpLuI0mxLieb6iDzUSLLWTk9TiQLn/pA
         Z0R55VkyLjRrKoRqgubBkCQcoXGW6JbTHrccBTKQAB0PEBIO2SwYr98VYESKcP5jIam3
         VKj2QGpYYzKhp6Xr4eS6XevceQsjWX3lGxMISPe7Z7jSE7KNdcG0DXSo07MyuvOdcFDV
         mt18Iy/quUlHATg4jAdTOWe8MxzqLCBBgYVAR1S4Jsb6Rk87Vfg+G9WS8/t2bsYqElpm
         SpueQ33rrg5/v/j6JrxlcfaUU0RJ3PRkYc0dsUTQapoYQEJDWB47VoMAnllaP3V70Jt9
         18lA==
X-Forwarded-Encrypted: i=1; AKwUvBzFt+WpWQeGY35E7MI88BPLL5XefAuAOxZFbSU+panRk4NEIL9AaINIcxhK2207PmljVU5vPYhceZ/7CYM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Ag53ZmiLaOi4LKDYi46xnL3Zmtflb/F7vf2UST4vB/taeMn7
	3nhwO4ty7RJeeKuNcpf3XFJkukSjE9rmSK0cRFpcXX5vL/ZmPl/ZGXO5B3FAMl1M1ZZ+fsMUIQX
	S4Z5N9o8YdCI/+YiAs4CadYahYSAWjzak0HH2uJoS+75aMn9SXgJqu1bhn6kCM2Q/ByLMO83rkp
	3xYg==
X-Gm-Gg: AYBFou3hG/VAdHli4KpkiGJPPDTcWk/EdeVblqAMGLQvYE2t9vxJvbsyxoqQQbxoJCD
	RBPNXDlJVvR6njNjQlRgTj+XkAMwVZtp6Z3RkLCdL+1lBcbRJCJpiKwncX0pK3PTxN8DIVs10E0
	gUKX/UE6RhtxK1Yr7bqbEImCKwmV6ZDWgnNjWSmVq85TYDUy35nndzbWlHWPqz1incnXCb0tGeK
	wE26rF/gCiwuAotDWpxXF//wiLjTH7R+vA8IoTtzpPeAt5W1T9ZMr07OxvVJIA6NxuUy46RCQrw
	OfS6fExOUUrgO8SWOzLZyJsqb4cRS3s5jyMNMf3azlpzL0bahaXKf8FLnX88rvpSojbo8c366t2
	/SB+8dLfsJ2E3zrZ+ZB+dYrmqZGbkwHL4cmbjcz5eQQ==
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a006:7b37 with SMTP id adf61e73a8af0-3ddec8023b5mr1308453637.54.1790079473134;
        Tue, 22 Sep 2026 05:17:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a006:7b37 with SMTP id adf61e73a8af0-3ddec8023b5mr1308406637.54.1790079472530;
        Tue, 22 Sep 2026 05:17:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6127001dsm5963161eec.5.2026.09.22.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:17:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:17:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: add nord
 cpu-bwmon compatible
Message-ID: <arJx6nAvt-gtDd6V@QCOM-aGQu4IUr3Y>
References: <20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hth1ds5j9jbe3vjjpCYkbTVSeTiVsQvzy30YCyFUH83ZQ@mail.gmail.com>
 <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
X-Proofpoint-ORIG-GUID: Cf7dltpYNTsTtnnmAlViqnHhvsHL05Qh
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab271f1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tDlUhY5aTNnqvAx6hSIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX4PoNZo9jSruK
 uS3c/xK8RLXNPK7aJIVyVKNWze7QFHoCRNDfSXOAd7TgzbvM1PJDwRiFG8hExbe10quQfmvvx1A
 V0nhC/ygBx2qaktu2E4Kh1AhVt/MWmla9NCm95IZAYdPAeJL11EpjaNvgomZIcWkV0HeiQnP6K1
 B6kdLUcPLCQmBz0Tcm76/FuLx7W52kWJkTLPBXJ6iylQzVD8kP84tjR0dZ+jM/KyT8DBa+hgIPi
 V3LdZUREh5N5YJ94tws5CnqSq+NQZ7oQUnH9+dl/PD7WyTDCTBVEP9LDw+zg/Nsv9hRtUx5BY5w
 4tsXt9twWHXvDtvReU8it7Yr+lNBbAhA4f/3YNstw2orUZ3OSs+6qmU56ufFdEr1PuNLLPTsu2X
 l3nfXgyJ81+ada2wZoA5FLPFpk7PAlYS5FCu2fZqdVuKlgSMdooiAi7+s+kEjSxuRipTCfLC4/T
 M/ULHqYUNL8ueeHEJsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX/b/iqc1JPgNe
 CsBmQD/jU/kMDbaJZqz6tnN9fM/5bGD1dLgqeuceuBauZx/Kttel/WO5RCm8xhzpQfoo/96MZAf
 JcGhbyna/cV9EDgJGxDQ25F5kaOnkTY=
X-Proofpoint-GUID: Cf7dltpYNTsTtnnmAlViqnHhvsHL05Qh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220177

On Tue, Sep 22, 2026 at 01:38:35PM +0200, Krzysztof Kozlowski wrote:
> On 22/09/2026 13:21, Zhangfei Gao wrote:
> > On Mon, Aug 31, 2026 at 5:01 PM Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > wrote:
> > 
> >> Document the qcom,nord-cpu-bwmon fallback compatible used by the
> >> CPU bandwidth monitors on Nord.
> >>
> >> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >> ---
> >>
> >> This compatible will be consumed by the Nord bwmon device tree nodes,
> >> sent separately by Shawn Guo.
> >>
> >>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> index 21b4e04727de..8c82103fb86b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> +++
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> @@ -30,6 +30,7 @@ properties:
> >>                - qcom,hawi-cpu-bwmon
> >>                - qcom,kaanapali-cpu-bwmon
> >>                - qcom,maili-cpu-bwmon
> >> +              - qcom,nord-cpu-bwmon
> >>                - qcom,qcm2290-cpu-bwmon
> >>                - qcom,qcs615-cpu-bwmon
> >>                - qcom,qcs8300-cpu-bwmon
> >>
> > 
> > Hi,
> > 
> > Gentle ping on this patch.
> > 
> > Shawn has posted the corresponding Nord DTS change [1],
> > which depends on adding the qcom,nord-cpu-bwmon compatible in this patch:
> > 
> 
> Based on acks here, this should go via qcom soc, so part of DTS patchset.

Ah, OK! I will resend the binding and DTS as one series. Thanks for the
hint, Krzysztof!

Shawn
