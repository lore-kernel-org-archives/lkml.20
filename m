Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E43D667D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885295; cv=none; b=iBLF5M7ucyTL5FvM/ZxzkqF/NhkW945iOoCkNj8aXHZhKu+rCkwEAyntcknUHlf9aVER/M6F+s7fSTczn2RCDEnj2DDsSCynGCSM7dgUtDpBWOyX1JRX1tM3C/9fGArQMOJItq8ph8GlFKa64a5bz4Y0jsUmtBQcPlDdT4H/EJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885295; c=relaxed/simple;
	bh=+OLiagMgWVwiaEgdpANht7956xLnbOvQ6Sd9gYJe3vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8C6frHkYJS/oSbWmeHEbkPBKaefDF4ZywfCzNTwjKoFpynbGq98SO5ktgyF2gBehn4ZP0EDM3TfjnSDOkXr7mZQje0zT9LM1yP063Co8vbQL6bejPDkmKzD1YxBsBGm6Z8/W9gZeQxtLXvupjE1qeEChLPPAoEXtGbCcfvPDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ2RPWf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBtGjlFs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ2RPWf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBtGjlFs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xC6p3475956
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWB+OXH5LYblsMnILwMBUNHd
	OB45czwc5OzV0SWkFR4=; b=CZ2RPWf6teD/B7cJ3lAr2j8q85J4fOrTFUJWQWYc
	NyNhjHzHjJ3XI2FsyJlKhhr2hsCJqj7/qoeYhlPQwLPIUZ62SVfJ157waQLIh2FQ
	+e7X/B7SIfxeanwjKw27B/R/zOMHcbkaKrQTuD0wBOy+UP/LZwxrk8MLugQOn8yE
	yeqJNUTc7MzLfR/YYFLjFlelmlRdMUasdMCIgZ2iWKX/mt0fjgUjOslOHRqzxajr
	CxTtfHpZ9/7tyZp60RqYBi2aDLBTl6tLEoHY2Bdfhg6US6J99A8/b9Z/iYv+oFl5
	dYpJGEnla3HHJzHULl6AwHSsx2acF0vdyqpqZaQo2GETbg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9cr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso2721832c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885292; x=1792490092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWB+OXH5LYblsMnILwMBUNHdOB45czwc5OzV0SWkFR4=;
        b=OBtGjlFshnEopo45KOogtqkOIXcwvAKW7RehcS9o/eZuQ2fEwsttkPHliH0qo4pxTb
         nrp7D7L8NXZrKWQVV0++KPGP6uFEB54QvRQanFviBx7QLKdE0BQVCniEcWYaDY43vGcS
         wiGxbiS9Jz2/ItDDAjQaVCf3hIoHKjGFaQr+OQA7gkPm6BVdEVVrunsYUtDet5C/wSq1
         nDOC226BD3vvf7lOs7OGsyqITezyIhDOVJIPCxYSHOuO+tvCIo3vS34slFQlDK41G7cZ
         uVIC2PJbGYn/1q7wKj7xdJ/UaMWT8HYb9Fsz/bwbZfMAVRvnUZkqZ5R0/zau3dXVQO6U
         jOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885292; x=1792490092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWB+OXH5LYblsMnILwMBUNHdOB45czwc5OzV0SWkFR4=;
        b=EMWI7+TCrPhw2DqtdQho2I0ep4sf7ZnXizOii0ychASUYgQZMOT3jd9DS4sawzXXUc
         rps9oOkqvoJP6NqJ0gLnVu9OdQfp16VVFYQB+XHR/g0l8+/8ZbyBRyLr7E1MHtMEX/Bj
         X2w8pXOIRl5SnbQKLPYlH5N08vQwwHCoWuaEIE2A2R0qj6JcupDuzGlONNiy8FZ2rakh
         0FygFj+KfvR5NJXjIEnHN4JdfvLLbvDXMuShrdfbt303mIq4eRA1Qbp/qYDSyFtK19SA
         BDIDM+lcinyqSPDgz5bXwGilUoRpTQxjdOrIZydZbhaATaXd3MK8D68yJfsgbM1nA/5w
         HWLA==
X-Forwarded-Encrypted: i=1; AKwUvBwJkXIlEOUf87KOigLmrKX9ZrECgxbc75r/XtudyiUpP2AiFciHKpxGJNm32Aq9gv231bIvj+eAritnR/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVFiwmMMNlL1yNJZnLcozkWfiAr/MlNmQfp2SIT/dcCOTUJns/
	Y9VRuuBMMgpTe/RB6Q+tFvJ5Pkf3NbxtKGadCigE8r/q1/t6sHEDyBf0q5opc3Z4HU1VO0quQKD
	QetB7Vvv3NMpia+LjcmvmF2tJKwxDCTszGgleIYcpqCdWyYdLLP4+i4wC3OriEWDdp/E=
X-Gm-Gg: AYBFou2BPp5QqPr5Zk9XMuQH8/sJkl2tg0yIT1punIkC7SC7bydX0FvkhF6vF8eguhc
	ALclLBckQejaZcTOYSdjTdwbccO+WdON8S0w9sbtkBhwvY44vQHZKBFongSBxOzdirPMgb2aarM
	PIj5G+ZdYQ2/eM0nKKxy09vUwnJN/8csdJx2x1aDi3H+r/vjkTs2LgNCghM80f6dhgl/I9V0SUd
	zu77fP6g3xkb8k7Y70AvO2+cew7X1wK5RKhf3psZgcdIS8q2eNm5iKyoX4zXLi1qZqfvCfIcJGA
	DgMjJVNAFzdRQ/DiahLz28Xn3DP11xu/f0VDn10yExWqzwPqQ4fX13sDkHN+adl7rZ3nrqgS+5/
	QOY74BCNLHsXVsYZKiLawofNWvVt1nC7XdNFJXKutZg==
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr13383710c88.17.1791885292342;
        Tue, 13 Oct 2026 02:54:52 -0700 (PDT)
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr13383688c88.17.1791885291785;
        Tue, 13 Oct 2026 02:54:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm49088474c88.9.2026.10.13.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:54:51 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:54:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
X-Proofpoint-GUID: eAkMhWV5xxWWl0S1eLdAXuoAlGPfw9aT
X-Proofpoint-ORIG-GUID: eAkMhWV5xxWWl0S1eLdAXuoAlGPfw9aT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX7WrVFNHVSUk7
 HLsOyO22Ff0smfBfyOci0rt6qn12DB5dFWZYFdqPw2smnCVHS23HpEtZ6Z59jiRqqHbUqRfRb9s
 CQfJh3DMYeIT3Uc1yPYtzklU6IC+17E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1xW2+pAaBrrC
 ye01fFkoGrLJlltWisR2R6/77n/u4XLm/7PA/SR87/8apYKb0EhIErQvtuAfknT76omgqkAsGGc
 /gO/d8t4s0N2m+P+MOSIbZ8VHTFH5r7YRfdpgRRi/3Wt6ue2vI+qRloxVVDSlX/gDNmoaMIWcr2
 0iJqwEUGIggKRN6GL2KhVADsdHlH7mrPyICMO0AqHl4e0TIYNX9vyNj/Ii4XEARUMRSyZzvUF2V
 mMWiDyJk8SML7Frh+SydsNSR2pTN6225A34zwxDvDg7dIT3XKafEZc+su5KCrLdpmvn/ftXgGzh
 rnF02G5JesyS9P/97GgeCQ1jKO0NbBdfWZA+WstPVQfCul+qAEkIHn1I2+jVS1KDfpshYpknsKi
 oJjc/VVOM3/Mnaj8rfmSxFz6iI8459jFweGfBV3j9N1iQB6t1rBDNOGU1Z/CChXqnYzSjJJpXVa
 vId8iORJ1OmD8qPnt0g==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdffed cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jzFoA3KV1EJShhAgrA4A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
> On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> > The GPU2 CFG clock must remain enabled for correct operation and
> > should not be exposed as a controllable clk_branch.
> 
> Hi Taniya,
> 
> Could you share a bit more information why this is the case? I do not
> seem to get any problem when testing without this change.

Never mind! I can see the issue it fixes now.

Shawn
