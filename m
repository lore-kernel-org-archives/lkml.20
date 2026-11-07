Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013688;
	b=Abx7liTMuqFwZBTK9Z+6i+IzbPHL6NYLkzRbLNvTM1iBRWT4MB06axiw6MD9AQqEiTFN
	 ntdnNT7hyYaf4/+a3yVPj0b5ox3OkhGYfQ69z9RR/wMICLgYcQfCck0xeccpaWpXuBXl1
	 C5AWeSY9p4RlX4v2binegZ+IgyRprBLFAPOHwmokVlIwWIgG4PM6n1s96UYpdMP/WVSig
	 NjWuZOZ8z2P6yve/KM/QhFatudtKAeUxAr32SoLhzG8tpXnhSW1tL1KImZhclgr8xixo+
	 xuh/17d2yo0+pKOEoJC7omkjDnMCjb72Ppp3YEZ+e5lMcIqFphKw8JTSWnFm/Kvb7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
	b=XHWGavClLzMOrc66FBZ92s0lILixI3XzQwQMsbYNF2vxEMPoqLAcI+AmmMpmnTxxk/W0
	 5zodq9X2FscaJRXmh4k7iqYoD41UX4gpHJ6b6kPTXOkWNDgUu3d/mpk/1hmcVi3EkZPV4
	 /XUo4oeFy+bZLfjhA7Gy3OJrLRyCogA9GyDr9HglmxCtgINMxUKKwxWxTzuBJ5bkrMlIU
	 MQZHD6RAjGAxtWnxmX5YwP4ig56ON4tmzyBggK5Zt3cfeBjtYInnRjpt7GPNr1kGCef8r
	 bO5xih9v7IJ8E1IZ0tH1BXHLZ+Bq97T9kyWHsGvdUv2fhn3yXMZA4frinWd4wsA7AWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzvsnKf4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H69D9yvc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79138606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79138606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzvsnKf4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H69D9yvc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoQFV3696848
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqszqiOkBMd
	k1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=; b=nzvsnKf4vSqy5I3sIwru73tIh/C
	PkLvqXCjrNMuZRvybGPsDiFnaL+MLmf/w/+fqiny32jbJ0n+3ffI7He3VoZE1nIm
	29PLZ0FYkhyN17eFrL9/yCjtsSl1XGWQdS1FWC3kaG3uDbeRwk3oZgguz4rgdSkJ
	Qvfe8QRetKM0dosQXmVFkRuvs57K7L2i7k2bt1BwfJ4PGYOawDLko4IHgVa1HI6z
	Q3xLqlTIuzyFu6k6tJ9Br4f5AVKQ6qdLWdDzMN/dKJvGVOlzHO+GyUZYXBNIS0HA
	xls7WtflYKX4odjenNt74HqjWWYx1cT9wBrRzh/Ii2re4deua6tzZoFO8rg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqryht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:08:07 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994010b21so2190237d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013686; x=1794618486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=H69D9yvc7F435FJmPIi2NwpLKPr+qSEO8rDym/CA0uhzlay0uuYxDQhyay6F1nq+hc
         rEgl0DMDaV8IbmVgJe1GlqUBE1kIYML75u5f+n8q1x2qTByE8vNEY8LS1Lwurtee8L1n
         wZpnFnJB6QCJuKMPhuy6PIttocbM2EGZhvZ95r+xwgfc3efceDJrykgjO+QYxS79C/3o
         NYThuemJb4bU3PorRBZLvs53qtNXxjaaLYFe6kQYnTa3dtyskZ86nfbovA0vuGJEcWtG
         7TT47vD7C0hmOE6ZPipuRDZrDxsujvkHBHGQ9bYq+JyrRT4r7MjF9yxuodKMNtnVJQ7T
         ZEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013686; x=1794618486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=C/q4eRyI5qi36U1D7MXmNJ99JmxsBbnjimIJxuwGaBtu5/Ryw8CmMyhJ5AfN9bBJJV
         syff+OJkCn4TQf3++t1zxqaL0pMak2OC+K+pnVsymeH6vnqinvs01p3CYByBDjPloIWw
         FS26xte3KcUNmh6dcRcYfFkJdKVYq7uEQjBIorDsrEb1Mp5FZeMcdLKhaRygnofjeIHY
         x7e8XoensX1fKE7TR3sO/oyRFsYxG0jAcboaSMCRIHm57oMxR8TkBlebtRMRc74H+jrB
         IsXDDqEYVsUmhwQXfUVdj4uTTIakpxV6RcyfTXjapyF2P0eftDlR4svSnFMqmBeqa0IO
         1x9g==
X-Forwarded-Encrypted: i=1; AL+hErFPnecFXag4If0q9PglmAgKN5LJkg8p3yuwpDYVfQ0BjTBqf3XtgPammfrRsMLro3+ACbGdYTiZEB48bkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BJQac4ijsmC19Jqs5mXsSI5E6OEqd6NXU/WbDUe0fTElx6UsY
	Ll9+ligDyRkrVGFBtctpMXO4i1Gy0zZaZBImfC9M9ti50kgE7DiglHFoimNlSFKsxY1IYdYBE1p
	ErpWv8xLwXHC6Ur/lqu2C0upbuXxmxdHbEgqykKYTukY7YnrkFyOY1THsJPzzOae0cZA=
X-Gm-Gg: AYBFou3yqDVBECatksxnlTz/OUkXzP3qh2degJ2P5V0R39eocKlt4W4nN42+FJxh/Gv
	oFtyzzkvD8aFabJs+O8qCcW7MtGoURhPLmlCVrsb9wRepDg6rni0GLBr0EtKlMGtNuCotMtSvzR
	0ulx6UWo77ySv6vi30Qh16E3eAkBrc6vrbfXFyo8vWy84W19aEphcwpZnbyzrU/EptDhxrbdYvJ
	u8SnmhMsk3wHB1QyEvlRXfI+jyDRby6MZl5SvoJE4YtZfH5rxk9U+IH3YNbR9FlE1ds4eYidg4X
	fN8UUs5KZO7oz5QmirpRHu6sxOU8GXQXyd9DxbPI/q1sfRIr2J9iMlrjFqLwcRJv0J4NWFr0R36
	hOls2TUr03T9E4SIHOOpDLZT70WqtgF40luaPy2C3MbhL0LZj5CyO2lRE3uZrDG29gNbPeITJ1T
	bwDju3Qh+cowFKL+0/Q6M0qozbPhJUgxycDA==
X-Received: by 2002:a05:690e:4814:b0:674:d78:4bd with SMTP id 956f58d0204a3-67c1407f86emr1633718d50.5.1794013686515;
        Fri, 06 Nov 2026 17:08:06 -0800 (PST)
X-Received: by 2002:a05:690e:4814:b0:674:d78:4bd with SMTP id 956f58d0204a3-67c1407f86emr1633700d50.5.1794013685859;
        Fri, 06 Nov 2026 17:08:05 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:05 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fastrpc: fix probe-time races between rpmsg and userspace
Date: Fri,  6 Nov 2026 20:07:59 -0500
Message-ID: <20261107010801.3451213-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Yc9p_0Se0oNy0VcTwZK7w5AAGnmMC748
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee79f7 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fP8dIGKjERIvVM-sKqAA:9 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXyw8CKrFYCrXW
 l5tA+avOPitkSCfvqYrGn0fqhBdcxN1Cc57IGs5nW5qlnJsjpRw9MIxjIyKX8WXhSKMx0Yc23QC
 qjz9D9YIditjevbv3sK1MOnQTBsbWMo=
X-Proofpoint-GUID: Yc9p_0Se0oNy0VcTwZK7w5AAGnmMC748
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX9pgwqAEzUiyh
 hjtKHIPYMux0KQtHNHBn+RPZNC/UC2BE8OL3w4bbtJxQIQk2T4dZPY217ZVuLyGGoP4Fj8Z0kHJ
 fqKpa5KJdsVOseExYYeFGIXZd4EDHlnPefL/pCaxYO+at2tByV/AdjQoe50UkITFDON25pzzmJl
 +N0ggkZS275muWQGxT+GGfQ2k+9GBFo+6TDbrz9/akI/vGMpMQyBbxjGbFq/2cqOruZ9tM2xs00
 f/FYNammh+O9hm71R1AgPk3c13JMweE97elEsUeoxILmO4z8iBbuy6Yo3g1nUqzFNf8GyiGYH20
 2eIvkn96L6o+PQYkN0Pv948h4WYfm2aDHQ6oEaSrumwk7Lsb1W20O2zn40v6qTTKfzOHdaSTcQN
 LgFZ2FyQ7S1vO9kJYRzdHMhdjQxEpongVFu/ndlzlKg+G0P4e/j8saq4aKvhde1GQgaLmxzzuuZ
 oqF0x8r1A09UQ7q/3eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070004

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
