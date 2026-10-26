Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032422;
	b=y9RFE1S6E8JTnB3vEdr9yDs8fPVScQze7+D3iIZWpGj98yeYU4mmNbGVYoY2Suw34acJ
	 5hy+W+0kwQAqUf1c8LWwX1ZvLUMZ/a6xIkJF3A308XkSZ2B1d+u9rK4DWGLxtsHzs8oGE
	 Xu2rNepNXn3tOMRoTP8GTgko/UBbXrUZl58JFNyiIApkqKLjwGCu6bnXYyztPAVxEfu3B
	 8V6TTAc+Q9NQzxP8nD8JDP74ZD9EI5G8RA9sxXfR3GpDnw9tR3wTIfcfaHP6uMUSkffEf
	 yMpY9407TK0hiP4Of6J7hYXuuPadaxAuagWG801s9UsGxEU5ltfyVVp1j5FVw17xyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
	b=cCRdjhAlzqBmmc8G9IGLI1Sc0zziueh1xQbknojhRNKwR6BK7BH9zmQT4E9X6X4O1xfl
	 Lu7WhkmTnaOSeHmOef8JV7X7WiLr5GBxCgrgL6dsasgxQWjfeSlQlmb4UrUQYkpBHgVcU
	 1XO/VEoqzfuzELajnBpAKmKiuWsh+cmiB4EmJeJeoNrCsR+HNNjb8YUCx4dKkNzAIky7I
	 CZNsWKlBlH1Blcneuon10QOayB5VWFqe7dcmqEFm82X+2Hc7u2uXYUkpbZLsoCf098h0W
	 sma0SHqfcdJO5QM25sq36LHJ8sS9WmRGjWE2kGNfHdVxhJeXZyHodj6751vShcv5ncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF00C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF00C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvf9g4167994
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fQGdln8uuwOHJNK5c2o0V+8
	2oadJJd56FQOhqoEA48=; b=fwCZMlVJrnzG8kbFf7KqHYafY0dAThM4IbWaFOBy
	QT3KsXlQuzRCEyQ/BP4gVJDJ4nk0L12B4ZfSaxJc9OIyfY5Vp4NrnzaA4FVfQ28v
	oWHEo5s3n7CQx9cLAq/W7oa1ZRygQwA1BRA1xNw7oOvW/dBVldrhTUzMIe0sLA4r
	yJsGXU/+WWM4Zgf4/AW8NVOUWz00bFWn57d8lA0rXGqBl6KUeEZ11CBqMWrXjswP
	M2gLip2s8RgnqzpgtOqbdQdoeglxgbNz0CL+L3vgUhMIo21tyO3i7w6g6EiIvq+p
	X6cgeXs/IvrE8D0TvIOT3JcxnUFxp0Kb5kZvXuaApycd9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf1gkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso13887185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032420; x=1793637220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=dQnzDEFvpC53zCvxW6VsoFGqcKg028XbXBqFCVsawPd1x6315G7Uy2J2ZssBOvlmfv
         +oxSAXmA6WE9XnBjXSf7DfMCz80KheRDaufSqgMqwZ+LWOlQh0CyZeTgCWnEOUXrd0ew
         +m/hp+HhRKY4mysaWLP3c687OZCOCik9VkuBaNt7IkW3abkPcfyu4ZluZghVSux192S5
         op+p9MUT4P0GoPRoN2xn/Ed12ajdRcR/8voRdNbnkTRYwhAePaf7tv26W/f+bIE5fe+V
         TsDeZiyexe3IeeXQLrlYk+lHKNU5vHITTSt04fCnEKokveVyIEQD3maVRbJExoQHbHvC
         mnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032420; x=1793637220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=Kw/EUopf8/oikzK/VZO5hfxsPBoVcbvaP4PY/JvhCu9FLhELWzvYXEbTwi7En1bUMd
         i2bI6H5afw4Gi/caOpj2qTyBxjD6xfxLp+utjn+pvW3j1eGO/dGPn4oavK9MjYnwGVt/
         Eh/R/0q9d9m6u58loDSGkXgZ57NRZXTA6NlM1tFOURU3/fn9N3PALxh3wXHse43nMWQ8
         XMWoGJVgTJ8QtrIjW5H5PrG6MO4bReSPF1ca8zqb7IkvnBbdtw4MaBWacT4h0CXJwV0u
         ceYQ9LOARdeC421Vp0Q9wbrdGzplfGNadGeyl804EZTdMqIF/o7gSaFoDr9Yu1w5ziOr
         khFA==
X-Forwarded-Encrypted: i=1; AKwUvBwiqGyRhA2EbfKWCopwMW1JhqDOp9+8EXuXRObOgllKX3xtSDIEA1XB5xIHSicbQDqkShVNqmLV6ref/Ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzLL5DmXr+YP9iBhC/r7o/HclNt53Br9JPbOMJ7m49w2pQyOII
	2hPLEPt+UzKEviJzawZWw9SVDAiBkZpjlbUpRVOIU7ADbl4XyR/6MQI55I6JWkgviNtLicqYI8H
	AdfU1rA9QLN+8v2d6VEuBAMg42cjKMaXPAzFjT0ODxCLpALhq7GEWhriFI25iGsPWjVQ=
X-Gm-Gg: AYBFou0s+BwBv78PK2CGlZgFwfiVEYVn+yUtpzVHzXq19oNCTYv5EY8EM0fVc1vDBfu
	3WnNId7GOx/0WEfH89q/vBMLaKBka/hyl2V8lCnndaxVRL5YtlRYIWkkOyPbtcP16Fve48CF0tH
	BHISI0p3radjzwFS2f5J0jxoN1w2BaNdHgzjBBKXavv+J+0lNfN5zHdfmCM6mAjSekfbm/RJF8u
	Sqpn8lwIoc+ReEme2wbseXDM+lL4AgnaqnqH48VJxY9Y83EnBVo6JjpAypTrsJFlkzA+fiZAE5x
	9qL6lvX+x/NfnOlM/vrSc9rBg+xv015Pi+9dpeFnkxKeob57yoxn5QLXfs+MZpeMY/K9HgVN/Re
	bzUXP7Zrw1VRGVLcT
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31283785a.26.1793032420069;
        Mon, 26 Oct 2026 09:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31278185a.26.1793032419429;
        Mon, 26 Oct 2026 09:33:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm16862342f8f.6.2026.10.26.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:33:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:33:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
Message-ID: <cx7qdacerxz2zi23ti522dtjssowumkbvtn7jmb7m4lhxfc4sd@p4yzdvzqrp4y>
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
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
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX6bGH9gb7pCXe
 VXa5d37fVWGT5MLWLzrTuvjwAb9PIGKwPTqL3AJOm4bFR9bkxjUfBbon3F1BdCwkq2u/YZOD0r9
 hll3bH22WGBZIdMjz7XzmyLxCxLJ7lk=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf80e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2hiNXssHTY28xlfzKCsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aGVx6yOzE_50kBcl2Ru-NxH68ak08dNd
X-Proofpoint-ORIG-GUID: aGVx6yOzE_50kBcl2Ru-NxH68ak08dNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX3NEyuK3Fk1hh
 6ySA12xku2j46iWINr8ofVdAuXoy0SPo3FJ3Ow+eEAdgYT8qXXvLRvPyDlhBr8r1EiF/+LW2Zw3
 L0n7phegX40NMt83zPFbvw1BmSqcqXtJ0OWMXJeVFOQeKzsfloiRTXckFQmwjCyFHrnLWfW9ECc
 IkFdSJTArsMadsay+cfQg0UQeBdfrFnv6uUunzgcsMi9ywGaTllh+I9JtJPxpShdX0U/dkbcJLM
 Lej4siLeu2lqE0C360OIWXvzM0sSbKpzwCLAoXo6ZGqwkHOMvK8C3YdKE+fs5MmSo//s1LoW5FG
 Ad61k0frd+PEE/r9V9hAXumTnMKH2ojJcCff5qz7YLcyiySIxXJ2UzZrG11hM8Jqk7BBigyl4Wk
 brMsy34UccVIyFnrpyi3QLh3R4FcPwj981ktgKF3qVUhTFv8dtr0xnsiTIgS7hfNajHJIZtJzmG
 YbcIqmIkktfqcPrvXAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260065

On 26-10-24 21:09:44, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
