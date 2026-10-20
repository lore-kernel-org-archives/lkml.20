Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499654;
	b=p+qjc/qLKaVAqc463lgSH+thx8BJl+Q76loc/Esf1geeQ0ym14mD3CBFwqL2nxrsxnMF
	 VLLnwH4iVd9szkcAkKRarbU/4c9MM3KDJSgPfFLlp9x+Ug1VzCjtPdQU4e4lzOBx8MAdI
	 p8L3m33stg8/4qc4xANwoNnFun+KChWuOHBmQry2k0i3EPJAV06aUNqd3YWmeFaW2seoy
	 Wb/NxAHJgUGmXlZDsm/eBKZ0cRswJnYh6Fn11b9fchtszd27PwUpFgqQ6OWPbN+xUL5u2
	 MCAUv4ULcgExjSPhvHsGqbwGDMzjKTRyKsQSa+i2IWPpkMy7oXFxV+LFB4MpjZeCLng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
	b=RWL2qQjEfIpVZEUhH7JPJktg3ICZlKfsCUQz0VoywlzKtIUtz1bVYhyFprcAlv3yPb4y
	 +KWpbwgNfpJ6Yc3OUTw+/zA4xcjxfsUh1kfB72pyA3e+1LHZ0AFS63hJ7pKMqSKKfNAUk
	 thgV+mYPrAbHsDsZ/Rno1q0uJIKv+4ugLgefMIq6vWy5xnbUWi+Cx7w+y8WlnYGOulA5D
	 amF6g9DzC+LkYtpSUd8f0ZPwq8QLzAgITvWptYMM9sVwY3qG4RK4CwQ2so2aRj5TvrwJj
	 2aSgrA32QomDqVkt2SnqGJkE8ARP6sJk4QhpC3x1h9RBaiUhmD8b9bC9U5n6yJm+PRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtOh8PWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX4art37;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E8A606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E8A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtOh8PWK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX4art37
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBews71537741
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=; b=NtOh8PWK8ZD+7sp5
	UzdHnH/G9WosHzeVSNwa6YWl5KXxMM9YTZtw4pP2aWyYR75vZtec9NraXPALg3It
	XrulDDEef9CMk1k+bKLtu1gEBoHilU43pf5Xsb8arqo3ugTIPCZ1xZRxP4aU9uDV
	/WfEczARVIDCgdFvox6EmUq8/3lFuT4KbA4CK9OvK3aWtnA2W6iR0TGOPaDS17n7
	LVxGl+fH2TA314K4hloCpfuK4QdzIZhNXeeFhAA/8Mrs+kw+B28gh213Db5mZhG2
	XvlvOtWW601LBG8lEI0LjPMOcXSaOXxVsUHK1dRWrItl4ZXSJHv4ToiJ6SSteKkn
	5Hju2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2f1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:34:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso832641785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499652; x=1793104452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
        b=PX4art37mJVhp9Fkh6kaBFmMQ5pQrDjGXMmZGPsMgQwsQoaJS+hKZ56hxMHI3fRMxX
         vawe9IaOcDFgYYPDfz8y5Nxk2+VoopU/jG2HATRwr8iAnP0LwklJSsrGC3vjwDRmEVPv
         duUEucelW1hf7VFzvWp0bapZnSDNdp7zz0qSy4rhxertfqQjpHpD0c1ObPHz3Nd+7xth
         eIdcS5t52/yId0THFsfO3YZk7O5sTx6OV79MAIWe9k25UYvmP/d8yZOwGEdQJusc+Zm4
         J6IVmKiZJLC9tNDtO19tJfGgRQOUONNP9LoonVmuP+VoCwtZTPs0qndjIfD2zjjmK8nt
         QIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499652; x=1793104452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
        b=IxNvbVW3kscdr9QM1Nzb9rQXbEojI6CDI5FruSIUOXoUejKcIwqdV2ByfA2aOzRqHa
         LIVmYWnKrsrzGoUlRsIdYpYnyus8qfjiEW+3KSvhmie0Yl5s56WPeXqY5CK1X/+H82yr
         rd4cgABjxDtAtImKnSAXbMY9gjdIxMpLx0Q6NVx6GwhcFHW8KtmkYL0cYxUPmji0K7Yo
         tieRErCF/Yd96JRj0vKkKJspJrer2YYr/lAtKBSprW15Q8fYfmqnIAjWW2+q/UsH9xgZ
         es93ORE9jV39HLdO+MvnUjRU54S4coL/C2x+4ZkqY1max837R1ZtpiE1z7ibq4G11OPJ
         /rQA==
X-Forwarded-Encrypted: i=1; AKwUvBxPVCR1hm6EJ5+RLkTxPKdGbKMMz8EcEygA6CPV9u7/x0D1levl+5DFWVcTsk6VzP+1NM+iuO87a6X6mog=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbPL0w12MyOCIB+vWS4nDcKCIW3XBc8KrgBCEGrJg64jMPfF+S
	P+6meSl4KKUieWFXAszqpi/xeShr2lv1PCL6O4gfU3yQeUTeZ24bH0m7KIIMk1V5pnrkMObkMDK
	7/c9c9E6dSCkC1t01mZRmAX6Pd2IxL8VxHf/etyTU05FcHmMtdoI0utvm5PFCJgOvpxM=
X-Gm-Gg: AYBFou0SkrDtsFruubPB5fcp/oBttNgU2l22OXb17iSqGOvZASa719jl8QdZKZY1QQL
	U8giaQ28Fk5vVGjHb5S5qiaKl1NDFteR7Hd/ctfAveGwS2sZ42204F/uAhx1mcwYGiWPEQmH/Fk
	KVrHq7TzoRPzE/Igpx5E7y6MD+tKShpRZY+GNUafWbcYBUlSOeWyuHs7ZN+E7rOsd+66mjWqjkm
	boqSXTL9FRdXg06JQDuN87bxKdt/EArW4KVLD/qqmqH1K/jJaeGWa0AOZza1xM03iTcCx7RayNp
	XzCDMIX5yWRMWxJlxtqZEi7iAmY5924zmICFvhXd8zld44uTLLF9Sz0aBBh3MfA1NBm2wh64EzG
	lsRgbYgFPvSdFN+zbidbJZFCERYE=
X-Received: by 2002:a05:620a:608a:b0:93f:3978:481a with SMTP id af79cd13be357-93f39784a18mr1165544185a.51.1792499652225;
        Tue, 20 Oct 2026 05:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93f:3978:481a with SMTP id af79cd13be357-93f39784a18mr1165539385a.51.1792499651678;
        Tue, 20 Oct 2026 05:34:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820822sm6401311f8f.34.2026.10.20.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:34:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: access sysfs attributes as const
Date: Tue, 20 Oct 2026 14:34:09 +0200
Message-ID: <179249964697.23160.1848529852960880968.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
References: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mLfW6NTVgJJwNnYdz5g1X5Fqu-49XON1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX+0QjCIC3rvqo
 vmAk4f5J25UevFS35RzkNZuDHjMnjufqcKJKvTi/VDSiqgyo/qC8NPIWWgxY/iCCJjv47WyLm4w
 ZW9/55J+Qbn9OyuWiF1KB4BrHGemyec=
X-Proofpoint-ORIG-GUID: mLfW6NTVgJJwNnYdz5g1X5Fqu-49XON1
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad75fc4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5lPpzTouJ3OUUglbYbAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX8LY0ffyvIHti
 uiIKDPy4ZEWVZWRODm5EGGkYh58ohpeBzqJo/5yypNV9HU9YpZxnBMZL17/q4cyObo/qjwtDCDq
 HKvCRT99zTsUWz18idnbnwrDugRhCwsQCZJtPkWutaIhsp+D59c5V/woOQUsU2cAANOl3zmi0hI
 LOggGEC4L1IPiUhD/M4ukR+FXSC7btBw3F6EVR2AMNhn3i/dntatvtBhCOpZwZYST8aLYxf0z0z
 3FVG91HTTajUqww7UoNbWIlzfnxdk/YFKRAsCNpzZAumsZRnsRF/YaPrYlcZOx8vSquq5MdVPjc
 qm+cgv+0+r0o5Z3sLGCc8fvjBgiFfcYLV6RzzpznJ2VERfWtnAzrUIvDRma/L+RjwFUIMzXGa06
 2I23P/MTsokyEYDKHOXlJf4tx0Z1U5oH7PBWI4pViMDW9rpQGhEck2mUzTi+2rXD5wj52M1ZlMP
 0ZECeIIb1f/u6A9cU8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200049


On Mon, 19 Oct 2026 12:45:48 +0200, Bartosz Golaszewski wrote:
> Use the const variant of constainer_of() to access struct
> gpio_sim_attribute which wraps the dynamically allocated sysfs
> attributes for value and pull of simulated GPIO lines in line with the
> currently preferred approach.
> 
> 

Applied, thanks!

[1/1] gpio: sim: access sysfs attributes as const
      https://git.kernel.org/brgl/c/8dffd86d0221e87ff8374ca5b8bb1352b6d94468

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
