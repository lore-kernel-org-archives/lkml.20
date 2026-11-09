Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228420;
	b=S6RjZydEQtjpQGSCWq1k0xAnvZNTp5z5d9CZhA6Wvode4Sqkc5PIzL+CvuVDmpex1oJG
	 TE09LBbSraTllnaB3LSG+G4AnU/5UO8qmYbHl7zRMglFsXqcT68MdTw6ufA/DWjo5RJ5S
	 OYPpTK3U8FrgK0+mYTUhyn0loQxpj8NizrYLTQiJgPOo6VNibS/M9hRZ5o+r31x5rCmVi
	 1/yvGm3lhhtwilEBYStHlzU9MMLTKVUgZ0OfW2M20bIfO0xRGchIM6S1ID+BXAFsXab4b
	 PU1SUE1LLmQnmhvEvKd+XR0rWsYOu9qMh4bS83B3nd+RHyketXi2lGnKyl6XcCvrmZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
	b=j5Vj0z6Vmx1esecXZkRhOF7pACYfWNnsRXdLQY2216tqOZ1xwSd53v0nsxcXQnIfvtIk
	 uv+URxi8BpECt1IKcSZlHtWERU7rdlmI9k+3vkUReFmoB1vwQJFGcfq5okBQgEgXfoWz2
	 QE+44yJqwOtp0fVzDcGJCK792w/vfDe4TbnAXCIg++D9BJ+YLA21xeGy3emvLWOUj5EI3
	 kL06W6W9gpw9MTpGu3K24pYWXHixOLYKjTaHIKl/JrVRa5MnQlHF/jLlFc8qeuPjpe/xI
	 T6AY9J/krODc4nUA0fw95xX0eqYzWXkZS/HalLApBLU9Y9UgouLJbaPdudwskp47UCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A9606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5lD561914
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mEue+rSQb3nzOUHKOMWWZHCV
	p8uvI1D8kOmCoL2tqFA=; b=Qz1Ad6FidVrJ8nbK9hpcuyv9fQlFmF3jlggJ2kOM
	AOms8H7tNY313Zy9y4qWstid0cyX7p31yTGEIpZ6PIhiKe0cu0flg3Me5XqHOx7I
	B3odHkHaDOMOnOnoq66TcOnzMUGHwmcp7ABZvBiRy15iU/+agzdsAK/DNMzGXks9
	UYFqRcpQPXkfpxpghInvlSCLWbi0D/xKbB54fk0+cs+7HAJPQew0SzhHYdK6YCO0
	JRF+vk/Vg3hphgYcEEM0nmbw6uwY07GON3WE9jKzrVlCqOCR49tdkqffbWjFAkzF
	cdbXhGgENAk6uYDIMnH3NkQxcFH2VVFHQHuCD/D6M93EBw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxedga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:46:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83124d530so1019126e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228418; x=1794833218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=gXb3p+EMOx0yPrhe0iwTxJC4dCdRLQKh2RIMhQyQbQHx8YhC9VeZpRCknJMJX/UIs7
         UHbXWUhAT0RHNha+J7cbLILcx0ORU6U1ta7SF553ooISXMgWNyc84/fmfPuffiLolVhY
         1ljUC8q49SSAEi2eZeRdsrWQe8Avmhr+7etXb9o4PRjZSVVt0sygoDnqggQC9N84kuJc
         nzstmcN34oD++PdvzeULqm+XV+V+tM5ABjPl9sOMegdfzFSspMvFsfxtWoiiommqynAz
         lrlAckVgFpTMe0Q2fwhZ3REaDMYRcJXLRkr+0BKNbwUpwD75zMlonLEhFWCQCiVCTw8O
         O6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228418; x=1794833218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=UfhnWz1dJQrb3p6wI8XzH6nC49YHhedtD5T1xlxX+LanlHlShmDPwruFdgDknOSYZq
         8W8aF5wkhpMxozXiG4oGhWE1cc7fO5tGfoMJZWcWxsvRRDpwIjQyC5QXlx2+EH7G3eT4
         Ttx4n3nIhu8rwSk76grewwbGqnyOqWJM7ma7LE4VEMGyzePzVAAyGMD/u3MJScleDnCh
         WZqcjBByUJ2+VnQVXbfGkKwMpBwBjcQadOe5C5+4f3j0ZC+lIDPU7iI+Yp6AnMVt0Owz
         9w3e2JbELM6qQV4J1qHX9boRHMZ4ddKt1vJ7ozN6iBTJk07OwLnHs14CYD7tKjoUiSUL
         FUfQ==
X-Forwarded-Encrypted: i=1; AL+hErEISgrYRK5ubhAOlB1s8ZdrE8x13Sjy3UbLOC4pSJEdBXITeodPAzwP80caQAi+SJhzxJTmkkK5f/mUS90=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A4P3gPpD82e92BNodX54N1Uhr87eJ1/yjS3TyKyq0++S9tNB/
	/UXO/k2QZ+uvwNcgaJ2Z+RXZXmkOae21sh27Zi8GZqOuIy7L9id6cqBsKzmGeQzhJHfFoAGwU18
	xwmAzBReu/yPYenke0HDFVLNgPqOzgQ5ooUcQMqD11dl1zVF4NoUJhZI/34wfMemMKuQ=
X-Gm-Gg: AYBFou3glurdENBH32NK1wAWiWYvjiy4zQCasL7GFsmGVnftnC5jYnO+5BV2hgK0BH2
	LclXBSdv7aUkGP14fqwmokJeVVnDC2zgGCQed5xkdM8Sa61YDQLyBHOjPGxxU2QJp7xDJChZuHD
	bW6yAYCNKVnmEcXbYrSxvi0mueeoItWVLnCTMfyf6TquT9NL730IuIBE6F0n7whRg1xdXYfLWU4
	SHpRc3dWTRqy318VpZKmTKdusPiBL/nbaKy0RI+4g+cVaQXEs0xgdOM4IKwTD6moN8QdOgdeQgw
	5Ae5cizJ7jIFEzAQ+U630y6/V5+a1UNNyqci3lfFYApxLTkCL/QMTecMweywecgzbIqTwb74RHn
	KJ+i+4HfLWFojStuFWWxHw9j1u6X8ubpVIMlPth3KtGAxlV38tz1AFG2wFiEz5FA=
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094395137.28.1794228418046;
        Mon, 09 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094372137.28.1794228417406;
        Mon, 09 Nov 2026 04:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm539537045e9.3.2026.11.09.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: sdm845-google: Move panel
 pins into common
Message-ID: <6hk3vbvxybzrsb3nli6ysdabeb3npcu3ejozhz4aerxaytjjqu@dfqjpnufsa3t>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-GUID: u0ArP5b8L3nAOV_D_Elg1_kn09cwT477
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9+UiXw4hGJOI
 fiMbPjz3e2sNImNN8fW6QI5ULhAT8xKitgNC248Xq6WMeWSONl4A6AW8lt9XrnbtbiGzQozswZy
 8rrcV+tnWTAbzaOfsaZv2upKf+zTfTES+MgcL8eXKepO1jMNNb2/Ah0jpZFg8jiJi4zxD+t4ZL+
 i6j40GbwZHtitw5maD1JlFXgYNK2asdHKn+HlhpCjWG86fzR4ZfT6Qeo0kumEYdKOxBUm3VPGqf
 X+iDZJjrQFXINC+nqeZXmHhH4HU8CCKSaWwyqRW0GQkUBWRyHHcqiCD2NXQN6lPKArMjy3TfeYX
 1IU927gpC+wF2vtKoum9mT8Mr/LoNccp9kiujNtP6IFG44ILicrJMQ2WAljLWwd46h9cs3xOTPn
 SW5+5njXymWEn8ocTqabWZgTH+96vEEfTtYe/EbdAFgASW2dwDlLlY1m0ZcXZXx0ysDaeDE7X6l
 WTFWxYv83WqkQoq4G3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXyn3tWErvYAU1
 QJ+jE0kJJ6UAUAP6dHRLccgfdui7CnlRluvguOTeuEn1GcSXOc0UJUfwuUkVFX2j4Gr2ZdgCK8c
 5Jtio8zM8h1BP3l/iC0/+g1WS0K+di8=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c0c2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jgMgYrHaTVL-YdunLg4A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: u0ArP5b8L3nAOV_D_Elg1_kn09cwT477
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:30, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
