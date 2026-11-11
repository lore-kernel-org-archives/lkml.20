Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386155;
	b=gOrdzA40SknNrdFZ8LSz3KzEDBsEeGF1nEp9PX0yUB+y9EPBbm1j2gLL++98E9fKLmov
	 fuj6h2ieFk04OmlOlgduY6kC1K6ZPntHyGzgLK/inT3LUIL1WFZuwuUh4iD6NhKUJHYVN
	 a3xYT/7QcEy/R+ObANtP7iBgJcZpYj07+vIGs/A8CWnQomqTJG+w6ArHISfSRQcvhnwPg
	 x4mxdDw0uijFG9691Rfr51tYI+XL6nULkSPzouatk+IHlna/ktio4YvLiiHD9xm5QHQrS
	 gL0XqnMz/0VV5G8j/Qb668GWn72+KdtEJSe3d7VwJahQMVOaxZYw/MIm1cxghNpKYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
	b=Ztmv2p7CNlM5rHlAbZNXk5wQpMaIaPrQ5H0ycWHbmb/XZkF4f9rDT8cDjJLm2xO86Anj
	 8xMyOkdXk8WRor7wYAbpmObBfaxb/xNnH4QouiTKB/u6kV7mEafm0S/jiw8dLl5W5syf6
	 nshoGKY4xKurVeOZ+3e12xpfrlZGayz6Ao2fpAN6qyin3l7BAtdneiV0NWPLCXIDse2Xx
	 mcqIQ/Kvep6qBEyQyXXZTf6MA9eNW2pID4M//AVuoDlcsmg4AhEtOu8PG8VUVXS316awv
	 RCtF5QFFvFg3qnYvcLAIeI+ugNMVVHDW1sb4vUmrrzEgiZHWFfCMBEPcAbneP1kNiUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29681606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29681606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KNW02017401
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=; b=Yptddehu+01hnYqt
	+7LCcjvPhkQb4W7x2CNWLKvcWykCpCP8/a7RKhS7aaCTE6xUA/WON5THudMuuZHg
	rtZ4uJvXK/d37KEcK83bvyPbwSgUIUUFwyZUxRT8m15LhUrEUsOMuRCdl0CSPPML
	VWxej5404/r2tbH8hLw0Oj08yFSU/RcZ5T5HmRjmWQzW908IocRrCj2qP9/F7IkK
	CZRWN7czKmL1lH5S6d8f6F+mY3rXzjX5ITO0onSFKt/1Cpoaw2dnIOgruRw6V0tN
	fa6QNBgDj8WVfXX5PLgcBiGATsdm6ZOHxRFq+UFR/fAR0LYgJsOlMgrrHoNX7Ein
	+5tMkQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97casa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5033533eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386153; x=1794990953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=NeHNMP91UZxngsSaU1f2nN/RajwhvMOo05q4IXRIBn7uzIbWpcPW9VNaLdijUVAIw7
         Fmj0abDtAnQZtLjtSoQvCp68MYn/TqcoWlV/FF3ojKmFjIwWdu7wEmxjv9qhCy0TOPAT
         YtIsnHY0hqNR0JO7XyUeKf+GbnwOYn4aOUedWso73z/t7RwBtXYmPht9CgvFxRJgVO2L
         sPOao33nblneWtAJ6WX2zU6GbM1RAilyuJZpdf8oK1B77f9FoAKl8hGzQKguB/3ahE1P
         4pvaOLZQz8kyVBCQWUuEKWtFWOtllih+fTj+/aI4ctHUIxYb6Av/FET3Zn5us/PdjV36
         QQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386153; x=1794990953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=un2I1eOkuxtKMNjy9tPnaArIZBNNsEUNQtQJ9HZXr9krJBv3ke5SlC2YZl9VNNU7vu
         O3jEiMOQWi0CukzX/8Mi7x0B32JCzc6cmrKX0Ljv4866BrUXFRdCbA2mC7tP6a9rf330
         QpeCfFkV+26Tlw+escIX6auyO+RuGCfk97uyUIf4qgUxFjFcJBTCZWGQq+AoA4y56SEw
         4O80lpCP9dUfuGezh43Ca4QYaMSga9cW/24fswdvd/tZjKtTfJFh7cSzSLioadqgw34A
         zSxD0QJwMmvmcrWnCnmTAEzxC51hi87LT2hPOu0XjRe1fW2FPYIkkSJtgT9cMdguGTZA
         fMIw==
X-Forwarded-Encrypted: i=1; AL+hErFvapZMAhoAVWZwmOnPutSyVibYBMi7rKLu0EIpoNHATGqdSWG5ZVhJrTt0q0z6H8VxFvmQw7mYSCOI3f4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dhtnh/ND1sqLFSs/ab84W+LC7xpSRQAuHf/lu4JIVKejfWrY8
	taQBlDVzrz8HbpDW5muBBR8vt8uC7hCH9Aub52DrQyVxv2w1ztgjE6oMlUv2RVnWJ5+SA+xmjCu
	2uCvvgfyyTE0e1ey2MrTmnRHl7KxSvlkGiY1UMfzJh+s++utNNJTXoy29xT5oojfAJW4=
X-Gm-Gg: AYBFou2ATbZc92+b1tlgVmf4EUqCMZsMNKbgUvBP1+nEaaokrUjpHcelsVxYGhNq7QH
	//p5Wf4BCnZ2wc0/KW94Q4DajU58gbEpVUqaETHli5PR4oGn95stI5Gkce6ad1B3PkX8JD39cez
	9zXaP3UGGVu72f4+D3qDOgH4y47RhHWObhFu9q5+4jtTerxMrCjhozdUTPLcuhMUc9d7j1hrah9
	T+YgHT346HPywI+REWX0TQROcToWiQio5Ex/TgdFeKE1oxm8nRH3Ij5fLP7OmSr5zQ0o8trP4mt
	uV1s88SM4L/MjQwkJbuDugXaKBLrJ7tlJ/0W7BNffeZuhZkLfba+SFTp3/H2/WRqA4giv7pDXSk
	BHG6+QzvoqOUjWkzE5KsedhG4Sbf13o6ZrVi0mrEe0zs+bdijFmO5TvsTWSOBVAkHEGEPvm3B8D
	+Vobo=
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436957eec.23.1794386152962;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436935eec.23.1794386152463;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm25690687eec.18.2026.11.11.00.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:51 -0800 (PST)
Message-ID: <baf7c1fc-5eb6-4b39-a396-3df0d367e3fc@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:05:41 +0530
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
Subject: Re: [PATCH v4 04/25] accel/qda: Assign a context bank to each session
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
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
 <20261102-v4-v4-4-88f2f24a5f0b@qti.qualcomm.com>
 <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX/nnpCuVHAyGT
 27oEnbCkCyhhE21oPh0TOWMd3Rp27Ljiyi6PVQ5+F8rbkX5o0fsFYTYhu0/jXgBAlozB/Iful7L
 DvQgMkanylt6uxdrqjI3QkYGTH6YMU4XAcss2/A5p3ivo53E2baDIo9EfRwGPjHuYbBZKYpjjVa
 ikPWXjV8INSGjaE/wvncOMQcIYqz8kW+NU0feo9kp6GUziO3tk81nIO1x/QUaUYX6yDzcbggt6r
 NSW5OmcGtzQf18D2vhsfGGd89X93M7k32WaOMsX8A5swO/q8sHd/4dQElE72v7fH6RwqoNH8Ux8
 MCgNf0hB2TWAp3i4ioQclSWKlW83RxI1FSxqGOF4U8QkKYSCCojPd/d6qjuRjeccsp20GYN7vM1
 ZJ5v4xjU1NyyGh6nkBWvXtj5Jg7vue6vv2Odusa8tYl0Y/sUVQZ68dnZvYauZ5KsiZBMuVR9Ufl
 vu+1BSthfwjzmGwGC1g==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af428ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=AF3zZIX-EdkCpG9-7AIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: SfmJOAd55Hcx1buaMrs34_DjeCsp449z
X-Proofpoint-ORIG-GUID: SfmJOAd55Hcx1buaMrs34_DjeCsp449z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX0PBP4TGYSbQm
 aVkBZp8dXf9K8eAVcUU3u0nS9xr/PMswg0zm7zx8RMyDzwLn7vKRVh3aVL5ER6G2wNWgM5bqRq9
 ehSifZN7jUu1oyc2zY3U3bmVpzlX9Ko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:15, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +static int qda_count_cb_nodes(struct device_node *parent_node)
>> +{
>> +	int count = 0;
>> +
>> +	for_each_available_child_of_node_scoped(parent_node, child)
> 
> I don't see a need for scoped loop.
will switch to for_each_available_child_of_node()

> 
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
>> +			count++;
>> +
>> +	return count;
>>  }
> 
> 
> 
> Best regards,
> Krzysztof

