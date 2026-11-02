Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611477;
	b=HTaoZ0F8waJ/8dN5ch8eUvILZCCGQ6/EE4uc1E8RQ/4AXuWpXhkyxRkAiDgMH0IT+Kll
	 VxsudYJF0NDktcnSK16zqYCPcZU9tHBRepsjAVNthnKxK8cGmQDWy4YkfxeRfq9s5Urp9
	 yhiGO3JwUeXnk4M4yLhmWEIoO2g/8cL3Qjb56sQih+2qVDKR07yrgkudzsOVQFtABVMa5
	 uCaWfZ6VuQ4DbooBtGDGlqnknfLx3zfANB35neUCWw0BWV+zgblXh6jmQAIR6Jhc291OO
	 kny+JjgSh/0rfVH6pPRgOK1D6nqsP02SORa1UX/MXKMI/cymi57AFgeXapDoqdV7Ing==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
	b=xzhLhP5a5gpFHzL48/uClnEO/CXdj4aCZ98JdypUW75BeRDmIcgS5tTuAheZJcuW0xoU
	 2e9mWrs3uPnpK2PBNGW47lVFp/oN2pJBS636NfEBiK3hqYrndSERYEcoJoaR8zfvFfmfY
	 DnBQ4u6x/1i7hI95xHZ/xFhA3/uqIyjEMEni3jIlAZMu7tZUdHQPSlBvR84D224K4SCDC
	 hWOLYu8YM/yuyh0pRGJZydDktYEoimW1UR/copGfIeBUPQp36yNauFDj7M3avUYgqDT0q
	 SaF+U1NeZK0aC2USIf9fs3xrns7hMEa59G4AIVWkv1+sbtxe5cfSFrFP/XCd0nzoDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aFh/5kLw";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0AE606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFh/5kLw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMuo1821122
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=; b=QwR+e+7pNnqvm16o
	xEiVCtCF7c1/iJDndPTeiQi4VFPw/s6aibuTC7Vx9FO1PE9BxwiNf5nnCnTZvjsl
	pyIZOZ7iGinxTSqlNirbD+G+Vg08qlK8cD5yjy9vRa/w8dz5QRfroOpP7LqCokib
	8YhQ7mJ0wNeMCUCCtN98RnCUEC4k8h4vZ0EGp4uFnevCr7aZ4iOeu8Q5acrOmdEv
	8jUOtedsRYDHuL7+AsAVPMPtkqukPc7oW971eYTzHn2gxcyjvjjY3jGA7bwzX4Rp
	gdHluJtV+8mFEqru3oSaRe17fZ9bm9RZ3N0t+sCHL/EmLO0uUqJTBBs+qJNf0pVL
	zvMdZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gy6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:24:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7fe5576bso19930786d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611476; x=1794216276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=aFh/5kLwNa4EtB72Qra1xHJWWv8hZw3J0SgrDnDqUbbsYw0F9ir8BJ/p2lISBKItY6
         lMKemnDnLhSCjA0twVfBVwX98B4Exv8EX2ns6zmSZarnVQQPWHXnZNuJBbB35kI2TruF
         zH2aYbCyiULwzmgXddVtU7zKiJdqXNNcqjLLpCrNjUS8Z2mNVwFSBCrkXVM/T920b3uk
         mcbiU9RE3UukrWzzUZIIrkz9nV1Yq7/JUyNOggxRHviOMxykrC6+syzflHDi3Egz2Mdx
         zZF2EUIVgD05bgpFrU+1ZkzZKKHuAuYkTLCox6JP084Fa1c8KzmxkTkHpIGEz976X2sl
         wGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611476; x=1794216276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=yt04/S9sd36azJtk9UqkOZcHW5rwudVm23fHDacL+mHBBrNUCbf6xE1sFUgcAsg8QA
         MtVBxBQu+a2IGvd+3iqRlhErJtBqjOacgXRyhOkfUC0jwhPuiaU48u+e+aHn/l0e6SzU
         lX5Hl041PZPp0Uqd8W7sf9B2hTq2l63o8tk1TbmHNBfUSnyYjBUBezJ0/BXy21BJQjiB
         S0m95I8yCuuJSJ8CPpOikGKMd4HwNQ2PoFCDRgt4FOwoVCIBOHQQv3J52cA8V1pgMw3G
         KbRBN4CXu5t2lc/t/vvlT3pvpspmxaBSGeaePfwKqvwKMF5JhYCRay6N/a8XBwKZ6TTW
         w/UA==
X-Forwarded-Encrypted: i=1; AKwUvBy9yYMtRDjPDBv//6XOjcB1MsuxFuyGrXsSUMQgIPENhT7a9IiQ1DPWEFqH9I+VHj9KhgVRI8NhqV/7t0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYISQj4UIiu0qD9+KflrYc6xqKhJxqMdhU864JLS5JFO2A/it7kR
	YKFdMJ5ioBvREJFAcqPxcPcor1A+WB26yI32t88Mn6S13QQS5c4b2iDkqfJL07Wfmdahjv5uw/o
	6yJdKOTuDwIGB35kx60CmFyV+7K8Zh+i1y6pyu/eYbZRDUwkYadWD/CVvbMHPGZEFZUg=
X-Gm-Gg: AYBFou37jogwqXbd91bwrnJ5jiP7eHPJysZxoEchwwVxALGOaxyPrfsmL5liPWTUvNg
	bxXS/C6Q+KXum6kg3ywaSASKaIAs16BxmjtQSBo+5i4hUGgw/uAO6wunzsvCzctEr+JpagsUAqB
	Qi2BnyE5VIPuF3OiGi9OmwoY9Mne8Q6a8pRjN5nJYzps3beccAJlRP/W6MvWnrrYnGqF8NNO6I3
	p3zChjZnvKICpl9qDA/Vw/nIdK+v7wNtrl5RAMLPK6HIoxVXaBq3PSiIGtC0CVzPKVnyQ974WlX
	81ZkmlcT9mc+X06hC0mZhEIMhZLGusEz+NQU60/Rl8VbAMpXOg3msT/qbVb1qaowl50ZD9l472V
	rISc3boNHtmG5KctTigHHHMOH5k6PHVf7ZlmU3fuIWukf5eX/LAMh/L34i10lbC4HNJ/Tkvo=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543681885a.2.1793611475410;
        Mon, 02 Nov 2026 01:24:35 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543676085a.2.1793611474893;
        Mon, 02 Nov 2026 01:24:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a91csm358465966b.61.2026.11.02.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:24:33 -0800 (PST)
Message-ID: <ab231636-67a3-4d00-84b5-1d7671d96120@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:24:29 +0100
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
Subject: Re: [PATCH v4 17/25] accel/qda: Add remote memory mapping to the DSP
 address space
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R7WXxazMIgwy-CBSfGmA-jjOA3CvTPi3
X-Proofpoint-GUID: R7WXxazMIgwy-CBSfGmA-jjOA3CvTPi3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX54BZGYi3EtAE
 9EkCrc/MKvet6qk5i1dgwUY11NbiHru1qTpf5OcgTiyyhiSKUbQuULbt5tj8/H7ImFEwH1UABWD
 o+cn0jLBknYaF4qz5DsoRXD6DCwVA8A=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae856d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2m-AKP9SCvF1DGFPBvkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX3YhYm3pHHL67
 IxddQuJpy8ZtbZIwR3fAWLjydyC3xpHHrbgwLHvKMcTqEifUOo+pPNAdGf9LKPxnLe7pb0JqiF8
 /oQmEHImFCK0dukZKBYc/lmVvgWIb1E0PCBs9X3wLuOemZj1LUOXSOoSaS6Jvr/v6zbD81bk9kV
 WP//edcuKQ1ySHAIHPvRIS7UPKj8pkeBTVxGyj6fTX428FmeC79zMjHytkKsgQXJPMqeqGvOcrB
 sYCja0Lsh8v+4ummq+00r+PUDIblTGiIAPoNRO4swWFN7NHcIsiJQdwAJTk1RBfQ6IP2Xe7VTQT
 AiTbBBQ6hnYcpTQm+QABTkCMpM1ZqDd1Kvqr/nkssKD0DDZsl8bQJ3dKWyPsNuSwQ4PvUZqAyme
 r87221RDYam329fMaBmQSBVH6Wdq8In2lnnpN/PKgd1WjXb4kEsuDYoaIMzeqQc7VMnBSo89Hfe
 +ooelfUhWN18T11TspQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On 11/1/26 11:21 PM, Ekansh Gupta wrote:
> From: Ekansh Gupta <ekangupt@qti.qualcomm.com>
> 
> The DSP can only touch memory it has been told about, so user space
> needs a way to make a buffer visible to it ahead of time rather than
> only per call.

[...]

> +struct qda_fastrpc_mem_map_req_msg {
> +	/** @remote_session_id: Session the mapping belongs to */
> +	s32 remote_session_id;
> +	/** @handle: Identifier the DSP tracks the buffer by */
> +	s32 handle;
> +	/** @offset: Offset within the buffer */
> +	s32 offset;

I think this should be 64b too.
> +	/** @flags: Mapping flags (cache attributes, permissions) */
> +	u32 flags;
> +	/** @vaddrin: Address the DSP should map the buffer at, if it can */
> +	u64 vaddrin;
> +	/** @num: Size of the physical page descriptor in bytes */
> +	s32 num;
> +	/** @data_len: Length of additional inline data */
> +	s32 data_len;

And same here (and in the corresponding uapi struct)

Konrad
