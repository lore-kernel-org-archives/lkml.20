Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721036;
	b=i5rVbm9YjJq7O1UXLeEWYw20OYNZj9ud9WdGgmG1uJCRqCgQ5g/XUkNkHWtO1J8bP5VL
	 dPKHu4ycsFAhvrYyGzCMTc3ykt1fZsoCWC6+Zxf49PP5WnWJBviJAtKVRm3Q1/KIPA0Cn
	 xGoBmhYyNi1hAukQsZkndLlVSJwu5OJ3nBgIT5IjKdma3atFaqiIy6ZXZc0ztKT+CYbHK
	 h3nSdzrhz3Rv2hgHp6cctrDXRF1+NvD2HTNbUDUTqOWMBhi3Xte/pFd+/gcRneSbTai/Z
	 YHBABeyAphTFD+dE+hplP7LhfRJ0ivJzTPHrHjihNMdpsSVqHPlpQ0XoH8Vmt5Dia0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
	b=w1J5AJGVooF2/FlShoO/Uq73lhAkWu85tZAUO0L5j8JmH1ESkWMTHTH9UP4q/O03wQne
	 sh5LGR2CZwInyMX4eTV9rnU7ixq6h/DOlCghY5lQlpYDgmzWJJSxSKRZeAdRC1sKPA4aq
	 C1QScSrTULiU06jOnT0XOZveu/1kN6yzf4KJIzLBo0hLD2VUbg5XnLW4rRjA/2o2w1qXv
	 NqrUE5SzOL5T8B/GpxKv7KcE6/TZUxg9JuqnNwZ++WoQz91MlzXDPNW7cQMFNB9zl/R/C
	 gSIXrTATF7FO3foTYXqqxfjnUvB2pb7fWqSu9mVA/HEmlVcyAOy2p4SBvdOiX38TLTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k+YAS6d7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiCy209G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D6606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k+YAS6d7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiCy209G
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9wDh2001346
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fl4DtEUu9O1GzMwREKRhMpXv
	c2dSIaJhC5dKJ95EYE8=; b=k+YAS6d768yRcuomp1LdPeGGGdr2F0bK6YiGmVfw
	gphONTdleQglPh979nT6DJvvZc5Jqo17MkVD/cJulQeo+YruddWMOEr2ssfJBVKj
	xGN6PBYhZbXsqEzXh+bygQt4/xzPLv765XXqxii0hXAVbByMBNiq40rNiWEX13Ix
	ydAft4kFNs7tFKARSj9gycOEho79fkEvdh8w0RFSy5ScYxiV15KKzoMC3GqqdNUk
	Ca0dysJeWqQ1RfQzww1eafgn3vDe02hXXJoV5fGjJrY+IDXeXsc8hJAw0aXaUkIC
	qG1M5XQaCfEf7txbNpmDzNWpmxURKN0PRLQauHdhqVQH1A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jjn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:50:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso816224137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793721034; x=1794325834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
        b=UiCy209GdnddhnZZsqx+GaART/XlKXMQd9SaeXP0NLna6diixNLFWznpusU/gi/4dF
         zFAVazfMId8lN3isNc5pYOPYfUhc/G3BfoebgGDNJ8lSm+dnY0SgZQk4vbKPmYtRDzfm
         9vnNLE11Kld/VvjhKdye3GJdJ/jpVtWNzK14NxbIUqJxaT6MXFQfqFk0gr58fC5W5vlm
         x5Jj9AC6nnSPFHJFmSufFLAVWKP+9D1yDUz73Km0OZJKsuOhG5J1xPNx5THuG0I+q7qI
         GGMvt1YxE0QMqmFbOBglz3YsSM99Fx9PbOl2udZxcyKxxz9U/w8VMQzXvyLjV+Tj+vMW
         CNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721034; x=1794325834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
        b=SizX/RmjBNZDUutKKmK8Wjan+SY066nDMz2YNF2HLKCa3M9121h0TngOJ2JkocdXmn
         RHjxt5nLs8Pl9SSX26ybJklYtsSUCvYg+fCWHFhFQF1YkGR8m6KoKrwjE6USj5R92C5j
         3YivkLT0hyVP+MZTOQw9IeOMNKH6+FXOepPYLF4dWdxrtPPRGOK8KZ5wxlLhGUULT2Ci
         5L+v6tM5XaSUiJIfJpD3bFdYmNGwldb2is9KoQoDw41u/Y5hvbB2j0ij94PgnC8Fn33Q
         fC8geAWjzhew6Hx/wJhUYFukrU4o9kbi1Fa1g18khX6YXFudJj/zSAkURCfzYaUE+lO/
         1saw==
X-Forwarded-Encrypted: i=1; AKwUvBx5sqKsJS6QF85WufO7VqRwfn99Sapr5eJ0GM7pCMeleEA+Wgsa6wjO+M5t/AdS2MNCvhVmbbQm4VDg++s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c0zQOXCYaAOITBuQGk3Ere9TtPG4uUxeD/cFslzKfDl84qZnr
	2f9YIWzgnBkdikrbAVD2QswOt0xAW1QT7q4AjAAB1DuVgR9h6JjLGf9XHmN0Gt37MIRrMCZCZIA
	SzPtBGjh3Tvm8Z1gEg8LekooOJnRPDSSb8tS/GA7FxjnZf9azcvgT/T8C/2dvj1LxMtA=
X-Gm-Gg: AYBFou2+EcQak9mvebX9eFMmk4fzskIAGUr2IX2YEHktrLdCH2AMIgA4GXvvUTr+jeo
	ekqS3m9XDiMCHFdsU7+Sn8VY8736nwMLFqIngJnscR3rCqgexwPVrGce7MQ/rz/rDfezPVy739b
	WGV+uMXyF+V2R0xlP9M7aYZfvXW6JPZ++LpIBXyUbfi7TyQxDPLMzU84YzMRKrY3cirODBTdNJ8
	KARqRT3HZYVZdMkZcfZFmeBNw2NubMwghyWS1znORwk+rgj/Db/2qhNruBhWFiFe31JHTh1TwA3
	xHtMkzPK7JU2xITrlCYf6OX41T+dI6eZIVHijjZrjG512QjRyDx5QE8ms9IJY/eBzXnU3vxREJf
	SYjZL+c7i82IJn8t05kDZMTK3Y+sNWRlcJ6r7X8miz0q7ukclmhoFNLJXCX79K1Y=
X-Received: by 2002:a05:6102:3f8b:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7d07267f972mr4897869137.26.1793721033595;
        Tue, 03 Nov 2026 07:50:33 -0800 (PST)
X-Received: by 2002:a05:6102:3f8b:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7d07267f972mr4897853137.26.1793721032823;
        Tue, 03 Nov 2026 07:50:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27597349f8f.26.2026.11.03.07.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:50:31 -0800 (PST)
Date: Tue, 3 Nov 2026 17:50:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
Message-ID: <ggv4lyozt7j37bjtpfxkjch4bicjcj2zk7ltuo46gsabtnqt4b@f2a5vo3gwaqb>
References: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
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
In-Reply-To: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
X-Proofpoint-GUID: cSiky1tvwoK2AOte6KynEeiC93d2-cKO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MyBTYWx0ZWRfX50NuOyJORXiv
 BNKt7mihnVHVDPY93cONAiuORlNog0UKjtbsaVxevFCsxxahDIHhWZVZH7erPr1cclo2+6ygYGH
 Lur/+p5w8zHStEWO3sqKFqp2CLsDIFU=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea02ca cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=k2Pqr3KV6h0dgAyEibsA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: cSiky1tvwoK2AOte6KynEeiC93d2-cKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MyBTYWx0ZWRfXxJH65931NPnv
 x+OTDYYb6wiGXMg0YQ1EdeYWHDbFx4Gn5m0q6KRWF6bhiC2HtqIGW2JKR5BBdnjbWTljt+zm0Ve
 /+gTMetD9q1pwJKX1CqiyBoWngsRF8leJ8VBvuaOA0DiLtkhNPebfV6t6MATbSHik0En7CvC0sX
 iwcGXA/EGnDZa5Irpdm3tcFqP8hOqNOa9sOXwXicuER/M/G9SlRRzK/XPwxchq6bcyRHH/fH5k4
 W3RjvxVbdNPCrlK5sg8mIg6P4fHiqZ4WVT4NEddxNMxOagSoCCCY4kmiJJwLWvuEGyG/i1HVtuO
 /GSDwhGSrsaLTLOTu86QsdAo+bIc5046DZlzCatVJBLlkx49WvZu1q4+bPwjNd4P5Xb5ktup5Uh
 EKeWj2O4ycqwdSKa1aee/xbuinvu5ji/lH1T3+eLsvKf8Tbxexuj/D9VOVUh2mZr9Bh8xj1H2fo
 zHRHUKHCAKC3tdlvr+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030063

On 26-11-03 15:35:16, Jishnu Prakash wrote:
> periph_interrupt() derives id from ffs(status) - 1, giving the compiler
> no source-level guarantee that id stays within the 3-bit range of
> HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
> FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
> instruction and is expanded in software (e.g. MIPS), the expansion's
> internal handling of the "no bit set" case lets some compilers prove id
> is a literal that overflows the field along that path, even though the
> enclosing while (status) loop guarantees it is never taken. This trips
> FIELD_PREP()'s compile-time "value too large for the field" check.
> 
> Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
> computing it, so the "no bit set" literal is bounded to the field's max
> value instead of overflowing it.
> 
> Root cause and fix were diagnosed and verified with AI assistance.
> Reviewed and tested by the author.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
> Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
