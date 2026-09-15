Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609181EFFB7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465273; cv=none; b=SId01q2cwNVioti5PoNDtnLKr+qWqrjzjhgmgHkmBP0tB+xwhNePgWru0wqqReuIHK1/fi7jqT5aRDDFQJRQ4Qp40qTtJLJKjoLAf99ZofNQZsVv+IxZizlkNEWZyduBB3/Eo6NP33IRlG8aV9Wku6kXKN/+Fq+gCs1MN+uafSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465273; c=relaxed/simple;
	bh=q3zQSp8R5ThK+kuHcvCcKCWpGwONhQglnuUhseaqY3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiakn+DWMsgfGwOEkAuUsBvSCqgyBmeRMpMwNFD7c1YVhmSccpPc8bWfplXtx4DVupgTumd5EGgKKdhNNFmMTPpbNCyAn8FmWdoavCj8P5N6RZ8DwzOMjD3mmsMrGMsgJ1OETlbhzEyGFXxCQjBDt02pwHl2U0fKnWnltCWzp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhDqY1vY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC2V0Xng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhDqY1vY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC2V0Xng"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZTxZ3316442
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AKPLf5lF4h3WJ97ZL0JL3uGK
	N0ClGEh5Ox38KSn5et8=; b=WhDqY1vYS97v04zv2GsHbPxjzeUMoJ4CAofPD/ra
	FGDTnn3/mThnJgHVy1jP4oDm+TyxE4gwH+tpiwt32sg+0sM4wTQ92e4MwrlZ8rta
	7FSBacv2UGwZBkgL8JdlmEMHRAJVxbgs0KBH/3pRNLRdW5PApsE5HYtl9WxLJvfR
	n+YxFof9hq7YsmL2xP5Y3w8JUGvECcILK7NKxO2nH+Y6fTyIt8JiVb5jnb0Zi+wN
	tMMdDJasxqkVkwLY3mfvv56oflucAVUe78S285hQc98qQWG/9UtKuDlX8+Xoq5s2
	bZjwyCXEXb7rNtLLel/aZpQQksygXCi8unNJVyOy1d9aqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux11hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:41:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so515934285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465270; x=1790070070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=gC2V0XngCo5BhWkNaEnB4QANdQtRK3bPLlp5Sjr5+odSy7omUg+tjA0CHtett6gzcH
         PWtre21QGR4gX4RO2y1mJThbkCdGjagv6EPhvWjW6YO3b7cYh1EUK13As+GhvxljXXGW
         qiM2y/oIqFwODDsh4EHcEzhqfVzBFw8V1C7FooiWHdIDJVKCvWLOy6yg2Mst8E8fGPqn
         KPoEp6Qb5yjP4v41YJGH/9PU7XldJN0NuW6XSFQp+Py3mw1RXW1oO931Qqk3cLkoLEn+
         AUw6+XZ5OjHjXv9m0BoJgy5XI7BB0AFBWUlpzJPr4V/Etq7Fkp2nbA7+qm6gwt2rqOJN
         gugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465270; x=1790070070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=HUaV8CmXWUGID/0VN219lCRfxC7ZvP/eSMsPVvO2MfMAoQ6/ZETJQ7shCPlChI+ko2
         eJ4nVzvuOoxOrwE8f8yMlR5KS68iAj7xg/P/kdX2GjOZKP5M/ZvHv8L+YLVk3wH4F40x
         looKKRcm7MrhGT8C6/ShHCYAFDGBjB3c4QgEkfVTnBtV3JCQ1FUUNr4U0nIBa3Xkw9O/
         TmlFBiY43gstGgUCxa96EnR0262AIvqZVmmhufmS4Pu+OSYu6fk4p1JPYs8V36y2lLAh
         ktbgfVxbzAnJQgol+l5qP+F602zumgftu89wNKqE/fh55MKTHVQHUv+bJURcbrFGBwtv
         EVCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhUQtxEoO6XkvoA16Hy7S+/8dPXUMDnvJ3Oyxvd6RSo9voZwbZnmB4kZXK1wg8jViXVB6q52OSCcCDW7I=@vger.kernel.org
X-Gm-Message-State: AFuF++nmLC+t/KHQ1GPa4U4SR6z/q1M9qmznlf8C63KYu5g4MR2snqH5
	8csFWuZmI2l5hIfgiNny+VKqgtsIaYxwWaq0VzeZP3o2gVTDYhfgzHW8+Bd9t6cNvpVvKOao7O3
	1e/wmjQiv3Yy7b3HhcY+tlgfvTYfJpcdVPbba7gMM3jlkPLS8EUpej6ct4TnyxMPwq3k=
X-Gm-Gg: AYBFou3NuX7s+SqWi1aDZeQQaMYcw58Rllnwve8gTw5viaCEg75lbL/KCQGRUxgwmW8
	tbT6rQ+hlDqvU/nuTIc0rWHmqMeKaELO/+b6j0QSThIGz1pKOiLm5yU4HRVleLVsThR6oizuWvg
	SxrPnoK0oHyEPxSYVxv+S4COqqj00H9OwqYNmpcw+d9LLH1OzfwwQiHs4DqVl2aLRs0VeC3ix5d
	QLUiZbPByhKyeGQQfV0+h9pJcCgU0XcYZU65yTxq5FkplZo2EAEJjhA/UMwXmCK2rmQ4LXoxyP8
	GxjaupVphnYr3dRQixEWY4yJ1LQfgfpzqgRttKqX5k9dzVl4hNGYcjat4naaZbuP67fToXoWZ0V
	nsn0J5vnjs63WUVA=
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891549285a.2.1789465269921;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891544885a.2.1789465269342;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm30667278f8f.36.2026.09.15.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:41:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:41:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
Message-ID: <tal2rc67ojk6bcc2rz3shogvhg6c2j2fngsjsgpow3okidkbaz@mesni6h4gggj>
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX57gEMZiP66Ap
 d1+W7jQ4ummIScBl7WWTuz9H7bEahmO1+CRoVuWI0iDv6iWFwzxu3EV0fFdm0tz8TiugzrPJXAr
 /+su86///OxreCmY2mJjbc6an4TdCaBrlPj1rWqlx/+0CLLomfntArAZWdA8kWbjgVPeeTZ69Ok
 tygk1VDNuwp6E0bSnXDTcji9y6hUc13MhMI6TCPRSxDGy1GLYMzPIPHW3E6GMx5Bs4bTtm+UCTe
 8v1SEz0k/rcu/xt0FQXSmVZQgeiHt2wcFIlkqXnZ0rqbyw0sL1EglPJJihuaVc1aX0MAR1YZ3AX
 JeLSMcoQ47k6f6JL8IfniVSsluS7wHqqKrkTTO9X8CIaq+dfgnpDr2cW5FbNCggmI/GMTkA4oIW
 5RdCEle1vQZb+EBlCDfEUWsSdeeRuvS6eedpWLTOU8P23Acjt8+vDvzhQ4zOCEmTfgwILzEdiCb
 XkOZLjhB5kHH6b7WEjg==
X-Proofpoint-ORIG-GUID: R2E5rBvzeSb-Eiyk-QRst_DhWXqt8kK9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXwym1X9NX2ck8
 YqtobgKT6+U0uNFqifOkIIasvhRDHga6w4Xl9DT8ZBBxiTehQPRxQQQ6MBpJAZkCom6kSVimbC9
 yvWIQ4hgk49JJpYauJHRJbB6urtxhQE=
X-Proofpoint-GUID: R2E5rBvzeSb-Eiyk-QRst_DhWXqt8kK9
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa912b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y1tYvCCEkdZ76wmRb80A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150137

On 26-09-15 12:28:22, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
