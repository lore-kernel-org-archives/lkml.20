Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009893;
	b=LI9YOXoT+Pr54FfxssjU7qmVO0ZxKY3RKrE+pTFwhb+8YPH32CuIFKzoAq8Pyln+ZCa4
	 0qsm9WM6OhESklvaSicFzdDtzHjJro4I89Gc2vFWz2v071KZzTBF3waZTgyluwHRNTR/6
	 jPhnSpfbAbez1z/2DJVZEp9SBh2l5y4pmdzmw/SmM3gZ14YW8PlmS2LSxtiyEs7d+8zhU
	 L1cxg2bqQDTHjKwnpL7ZlN5LyTM7wP+ljqULs2T34U3+abPh7R1+24rNZwL5dZwnZ03K8
	 npYqFk04cVDFTuuYXgm1/I8DBDShNhEBXZ78j8QemMnKpyWxqc0spezKxYO4PZ2tZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
	b=h5Ca3nEsEgvjOfmfLUZS33v7ceRFoHa6YOlFmHIMD8UCOt4Y4Py7HjRsjHAOVPJVz3gP
	 300qb1y23EDh8Gqxlq016uCI6PQKFUiZvB3QUoUixo1Cjhbvt89wmv7LPmMNK9mKBbPsC
	 HR3X2uqvSstov66dSDxfjQ6yY5hbLzEvfwofoqEl/uZ0cCsj4EjPiP8r5+uU+Wb6dajgQ
	 mTsaEUqvt3oZ0MgqZR1Ju+mZmBhlptk6XCi7t48OCvMR/gELqmdjrxjl7aFR1Aiuy/SaA
	 hc6qKchDhkWr50CFMBqZtMlerz/mQM/Wif3Keadi3Leucvvv6sV6PwHtjjqjMOHsmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F2606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3rkK3521873
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=; b=VPPxRNatdmsu/dNH
	lTUkUvHVX4UCJo1YoQi27WjjVDcUbpcUXACUhnctZT6VunyYiEDbysCZCR8ARfM1
	WuC4DoKBg+91OZ8+E7fY5ymRTAwA9557UZlMc5fBfhTKDIRpfXilN/51A8jQhezN
	yX5M3GhnsaHxAe1gpCVLVpp2O9mHkC9FzK0fxL3fjJ18p9COjtiS1p+dSQU/C+ce
	/ZOZjxOqiBh4olOOOoQhqYLn8bEvDukKgLWUfO//77YZDoSkxvO+pZ51SUoi1hZF
	IZHy7MQe/3tJQa2huoe0gJdttb0R2dgm99+iwf49hoLeNrPGlv38hciKm5lmf6d0
	CGt+IQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf01qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso10652261cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009891; x=1793614691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=b5Nd5Ctt21m9HyPBR1rCiVnyy5PBDlG24z9Ft/UOFYGu4GjIBQeOrUtNC/UDTJD21P
         94dUzw7Y6X0ocv5YTds7mdMF51vqRuVJ7UtUemUxs02W1YeoCf/rviQKA/D4OreRPorW
         8+1fNnG+EyfphXOlFDrDD9GsytQpKEvBO9RrTi3hGUzRmQA23viIWlnzmu4GxoNuBIZd
         X0ck3qH+PRwP5+vLEsBS0JcPTt1QWtABW8xRsbo4P0u233J5aakdlOjb+4ltRwVBfyQy
         eJC7GeRtneaU9DBEXqPUhQKiPcB1VXVjqvhtQ/YRlkblL3JnW01xBHuI6W/urmmsV1lv
         ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009891; x=1793614691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=fS3D0JZsqqI072xbVSrQDcwVAvrEl5Tc6tU0LQ4o095IDJCARz+oOJYRtsvJvnpgwd
         9jqOV14n2HW8LMoWX3XJ1sbDsnb8DxQhf5r48lj8gLHpNqi/Ai/gZiOHcBft6f9FRpTA
         F+7piSjKQTpKMPrKO2gcWTCI5gT49baOIr2YdMTdYfS8vzed5HllfvLjJdIevcO8SIdC
         JZI1K+rqrJRIR6+ODBFajWa/qUWo9ncFBt5ssAXpu31OrNODjmtAZrwxbPL5qyOXdVmw
         KY40sn+f27pimOTrMKUVsXvh34cwj/GuJYesxBZ0sJwxldIqTfQNNeUJqtuLU2ah8fEp
         X/FA==
X-Forwarded-Encrypted: i=1; AKwUvBxlOJNyXoQJ4hTMImey2vGl0fPnwWzsQ7pBh4U7aPHR/2kpeKsxK3eNFv2S14Gb0CUlfrRgTzvn/IMx2Lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwJVJpTdacl+QtP5MISx6XFyKhqamPdNRmDXdfU018ZsvOD+1U
	kTQeSG3fkZpxgxtIU7m7C5Smj9blNKq3hFm4/L/hujz33y0RX80PmVUWP79T09pROdr+66No9Gk
	s+71DDjtAVn2635kocAktvuvPuczHm1+Bkovz2CDY8/y+XRrlsPaJU79dk5MmYakbGss=
X-Gm-Gg: AYBFou24VUrdOQiN3xLIqm1LxD1xn55pOREDxRWIlApZDmmuP7wK307rmKoqzx6JRSy
	uHnvZ3dizaAmob8PmBVnkDJAO+o+4FYW+bqBvkKXfMB8/qYHW8WG4Rw1I6ia5ojdt9SDZMdCeNg
	viLZt/3DwHDJlWVVrF4OVh59TwRK/a/kuCABcfOgzWgtwAYCsFKFXy9L4FEwM+gurXXPOBqNCiV
	QxfphlqYJzZV+1Rzen9+QAXj4CFQQea9Ns/NYw6uwJ7eaq2HmOrXaPbGF6o7BeWoITnb/B8yNcb
	k2BfS1/QdoqPT+PUC8kTkMgOflZNLKY7tl7squ52Y/xWyOmfkmYEa0zlAHsnzy0WK2MFehI94jJ
	Rz8LdHnbMJn4bIbZO/Iuf4A==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685922485a.5.1793009890668;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685919985a.5.1793009890199;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350a61sm301851866b.12.2026.10.26.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:09 -0700 (PDT)
Message-ID: <4e7c426b-f3c1-433c-9d9d-45fad28aa5e8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Correct cluster idle
 state parameters
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXxrJqMtvxa11d
 kKLtl9mUG9qWWafWPDwEE7L6NFtI/er8WcWLcKIIkdpfiYumZZWSeS4eMXgZ9VN0taxYiczt/lK
 YKtJI4IKXbGN7vP6z6mrjTdmYu+6YvA=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf28e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sim_hGIB01VkqWS-gC8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: V3B2qAKcAWuqLvrrudX01pTi6VUE5cZS
X-Proofpoint-ORIG-GUID: V3B2qAKcAWuqLvrrudX01pTi6VUE5cZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX3TJx/DpvztYr
 EBmY7IzhA4sZ8h5sSa575qgEN6VPCHnUXUsoGUqOrKawkZcBEXRGjbxJaugyayKwHqIxHj+mGj8
 W+gNRnMFNUuwWg8yk/XYJzVaGbdtqwdonr16sBpA3V7iAEi9pF1PpKWmVgyyqtSN1dj4PIl+CzP
 +06PE2nIu0tGwV8i9BhSM+NLw6BomUgIOfO+EL4kAphtUIipBLQWX+gvvXb8mZwvx7Kavea4fY9
 90/umYFlblO7MfolnJPiVeKssufTwgh2MhB/1lO3fduI7IaQMJSZjJB1/DJJgHhFowPcFF1NgWU
 9Pyb1Qz50pODyJG3BCZ114IvtCs4uQUeXvTT7StNeQB2W1cEVEbnqR4lJI/goufjrUJyVFa7Xjm
 NcaVR/eAvC7WiqJn5kqeEDDpHQrtsklMG9PoIaBfYldFREVm7e2t75L1ejmHhpgVpAtCFC4kO8F
 1gK6tgUsCl5GSTHykTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/24/26 1:10 PM, Michael McAllister wrote:
> The cluster state IDs encode unsupported CPU modes: the GDHS entries
> request CPU mode 2 and the power-collapse entries request CPU mode 4.
> The CPU power-collapse state is mode 3, as already used by the CPU
> idle-state nodes. The GDHS entries also omit the cluster affinity level,
> and cluster 1 requests cluster power collapse instead of GDHS.
> 
> The downstream Bengal power description [1] defines CPU power collapse
> as mode 3, cluster GDHS as mode 2 and cluster power collapse as mode 4,
> with cluster mode shifted by four bits. Its idle driver [2] combines
> these with bit 30 for CPU reset and bits 25:24 for the affinity level.
> For either cluster this yields 0x41000023 for GDHS and 0x41000043 for
> power collapse. The Motorola SM4250 tree uses the same power description,
> byte-for-byte, as the Xiaomi SM6115 release cited here.
> 
> Correct the shared states to match this interface. This replaces the
> board-specific overrides used by the Motorola Moto G10. Runtime testing
> is limited to that device; the downstream sources provide the common
> SM6115/SM4250 encoding evidence.

This paragraph needs to go. It's a conclusion of your LLM's local
work and doesn't make sense in the upstream git history

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
