Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302553;
	b=s5GZcvWX9DM+tuseGs8Cvko0wX7qzJfC2cXSMA2p/AbIwdP0BLU2pSXc5TJtQZIXXQ4A
	 61623LJW4M0RibxNsDGcEBMx7+YyncflfqogtMlIyvhkrF+iTVZ+lcajVvOx1lD4IQcsK
	 dFz2L429y8yv4JzpM/O+Dj3NcKTpzZf1V9o6xZoFzRSPRsONONITEYE+aYS8A1TAvWM5a
	 +OJFVAMBJMZjhQS5/IZ9IsdyTeGuKgDkdux5gC7puQKNxOmcPiJ4FI9jNLQ5T8r1B0iDd
	 yASX8PZLXGOfdMdpjH5p67ZH5DamGl8Ul5kYBX70Hj6f3mFMEU0gCEleGKYecaWNh4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dyJLGnAN0Zs8RZGOGLmLqiW3HvWV8l2pKhgf9B011Ec=;
	b=XACK8Ki5WWS29tJLDCzGLXjjzbqA4l9rOQkSy5MixCctIlD4Ffb54k4WIdXNyFJLQsqr
	 +M88qGq8/5lXnZMc1Jp/+3Ds4P3VfoxXd3KT2pSr9DOBlFxeqGN4EEEPCFKCk1+eW2IxR
	 PjRmhodxnmZ6af3kOiLDa0DPam2FAEtKiN42uSQDX/TWMgDFFnF9kFEgV8Zmy9sYMVt/K
	 uvL5KLNKUEUZQRTUBBb2qufjEcbMH3f5kNEvRpSB+pwJeUSf1olqsxYsOmdlv7CrXhhyk
	 F517eqpxIEvd/vDr8VJJSp8QFxoWciCPDhqza1Hd11KyMP6RiV7qjs9eTiRLS6afH0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TEH/lf6z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icz1UF0o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217E606EEC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0217E606EEC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEH/lf6z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icz1UF0o
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZcF81916840
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dyJLGnAN0Zs8RZGOGLmLqiW3HvWV8l2pKhgf9B011Ec=; b=TEH/lf6ziK/UgIYd
	uc0AeWExH4ap+dhJha48zpFanrmUVquEziATbcTJvfSUXNvCTmGNORHwNU6BQEZR
	gq7Mw0UyQgIVlK3VIKAR9mCt5g7ay5aeJydPgyieZ3o2KzvXKDYbU/cwGfXtw2lc
	tODvs+qdhJ7XxoXfKAgBJcZCwZrlv8phRtO1/n5lSbvRDL06sUKUIPYKcavx1J9E
	mL41DhnIjwpXgrSTvkdHj3r1vWeXIW1jLgbY8s/cfE3H7dou+yb+k2rHLpwFEQ3q
	f263ZN8J3UJ4OZK3MSqsyYa5TOcLlFnYqwAwzumqX1v1r7GAcTp/LTdLflbndjsP
	YfAHiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw485vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e83f5b4b6so28393496d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302549; x=1794907349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dyJLGnAN0Zs8RZGOGLmLqiW3HvWV8l2pKhgf9B011Ec=;
        b=Icz1UF0oRH3yKlXDYLA4Jjllfgq8a4kz+nRwPkVVcQVE+rnFYEFPDPOkBXaOkoWd1m
         GfdtjYbVJjGlzytbPG793LOVIdw9HLoHAXQBeExxR9hJWMuGc8fnO7b9wbJO8HNtxqMN
         XQ3S6RsqWq+TeWwly8paPEzfPn8GcSniBUmbxTQFvnqI+P4SmqNebUonfE33CmThTSCT
         mUk9E4gYbhmkRRRhGB8uLtGZuG/wjWObJD9/JptvYC9Wy2fV4Nkjy/4DFEwDzEUz3E7B
         AGJZNPh2rsTnWwpGQ2ULqvF5cvwxJraMeQ5OWBGkaF9U/vVZP9lDwIdmjlFvGkA3sgIi
         mj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302549; x=1794907349;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyJLGnAN0Zs8RZGOGLmLqiW3HvWV8l2pKhgf9B011Ec=;
        b=Mo2QBKtKxNhq5HMVocwEeuxG6j/WeCFIKry2NcG6NHLUu2wHDBBnHxAqKCJX0eDoMT
         8ey90zAXi7o4whOGXoEm0hZZVsizTcSP01niXbbS6Z0N42yYO3gD1MGwQb1hv2+rgX3a
         qOSt/xyUmUpmTfbBo4QSwvozK2SNAnks7ySfuw2nzXXC3mRPuw6jRk/rxdk9zc3BGxxV
         gRDxancyyycN1T80bbwOv2B8JF+x/HfxXldHoHlAPVKGmOrVJYfSIVfTupgBIiJ3NZJE
         Jc97K5U0R2SacKT0BD1Fb+8U+qOjPRnKrRLwS+y20bHOPO20C37UdoJew0HGgQB9xRnO
         dk+Q==
X-Forwarded-Encrypted: i=1; AL+hErFuCW1owpoFGQdvvHE2WEQdWQ00eOnFhvIoYyzkRrToi6J+REjiN0tXDniIjEof8PzIgtKm7ldxaRhrc3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7u74koiaBqyZcW8IOfzO7X19zxzgToJLvSZGQ+1LOsdhF6uF9
	ydZtiopy3q9m+l5iBqrfQOWD8SI4vJh6vw0KVgvNr53Kn1UdkgYaEQDCyDXC5pZRtMBivJGCNmx
	r5+rYhWrTkzmtTarKcl+BVD3H5w8z8dBBjHJHwOTtgqvBjAjPfwd3how1EHpApj9eZdE=
X-Gm-Gg: AYBFou3AOhEoIr+kmkg8YaDmYkST9cctCPsUVi7OL2+qkLOJ1Olmr6379vrA71/m8Ej
	roBAekIBhl2x+0Hifwyg+ATgtqpIahK5yN0aeYJzs4GFJobUDztFd/652m1ECCUFhCb+/l248nM
	90kBCYi4Z+P5dxVKp3TJHnSNGrswKHdqfGk1n/qJCfIN0E8wilUwHP6kHVGpwr9V+OYRZ5xwh/t
	6pZwxYGViSugHQ/bl2T0zD55ZEGLACwopgSBK8mTOYVrtHOr58EhYlOy3fuXFvzH5z89VJURlBS
	Rd/9cbIysKIbvl9X7mtBny5nKN1DjrYbSSGyRrhvSXWKfhZ2ie8Y8mJ2GZCTT51Rn67BRD7pY3P
	varzy1UNrRcaAgPTfD7TvLSKE51CK2XUBpAhppCzeCBan0vNKsyj0xlO++MvFAkpjnmGASGSDap
	NyzyjVe+rK/lRctn3KF/GJwRVfbHDBNncwr7qPlgNNj48BVmTU6SuxFnek54Ws0g==
X-Received: by 2002:a05:620a:4514:b0:947:1d0a:c89c with SMTP id af79cd13be357-9479f326c22mr318964285a.56.1794302549330;
        Tue, 10 Nov 2026 01:22:29 -0800 (PST)
X-Received: by 2002:a05:620a:4514:b0:947:1d0a:c89c with SMTP id af79cd13be357-9479f326c22mr318962485a.56.1794302548873;
        Tue, 10 Nov 2026 01:22:28 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm60703515e9.15.2026.11.10.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] power: sequencing: fix use-after-free in pwrseq-pcie-m2
Date: Tue, 10 Nov 2026 10:22:25 +0100
Message-ID: <179430254421.7208.10083406967609133170.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
References: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX6v2PoMBLFcIh
 bqUbTuhGTeX++zDb7+JGec0b7x7HCMy3ydhGgJ54hFAH8wc1RsswnKONJvoVtsSFpNbGsJsBwUu
 qoBHRkN27+acfxPwbn0BPnLigksWEjyUqzOweGB05Dw2UpWvA8JEac9/Z4CN310Di+wzsdf9HUj
 t7o8vFAdBbV9ySo1BZKbrgQ/Tkr+WAsYEbwBIjmf2xYgZblo357MPrGXvkSM1i3VHjh00fHSEsw
 m0w5AoT8ZzmOBfyeOoig3sWJxhSlAWfoM2xPq2fGNpePuc2gi2V/zw6eWcSauyy3Ir9W6X9QX0x
 gjSy0v3Vy3Qz//z5qjARW3NaALM8xoMHl658g0da5wgbC0DhiC8gKP+Cx4itmoehZABImuedpDd
 ZNW2xyrpQlbc31bI5PJFqtmui44sDNp6iXcgeWqGWz8U5KQKpcXlNdgAsBTRcbTpHcDI2WCq+e/
 IOJ06TD+C3+6XQhD87g==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2e258 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mVFbF14yMUIBM6kXvQ4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX+OjLBOzgfOsq
 KzTV9SF3eGBPnHTmYWHRK6HjqL3zCR5TzrrSAWrAKLYOkbnu2ZaKo1pQzb8HPgta5pALb/IpZI6
 WtT3t4gYGGIuNdVIvwuf3BFVOXVvYAE=
X-Proofpoint-GUID: hg3dREy6vUB90HsA47_jd-m7q7oHvFm2
X-Proofpoint-ORIG-GUID: hg3dREy6vUB90HsA47_jd-m7q7oHvFm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037


On Thu, 05 Nov 2026 09:28:34 +0100, Bartosz Golaszewski wrote:
> This fixes a use-after-free bug reported by sashiko and then cleans up
> the error path in probe() by switching to using devm_mutex_init() and
> dropping the remaining goto labels.
> 
> 

Applied, thanks!

[1/2] power: sequencing: pcie-m2: fix use-after-free in pwrseq_pcie_m2_vregs_enable()
      https://git.kernel.org/brgl/c/cd5f26ed96604b18e4235052525abe6b4ba505d6
[2/2] power: sequencing: pcie-m2: use devm_mutex_init()
      https://git.kernel.org/brgl/c/e551848a3a80aa2e2aab5bcd8f022c594b14eac9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
