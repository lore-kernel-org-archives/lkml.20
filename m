Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399179;
	b=gHbWv5yr4o05npMJVNKcNxStnWHQeEoJZaNAf4t1q0+BtNKe/eWV57qet5HdnbFEPHxH
	 qCwIB1tiZrjQIN7H3aYqeEWWx0rZxHnE6wDnJRi5NfmiWoA0Hd+Gg5sJvrdEsnOCWwHZo
	 1HrSR9CIuCalSZOg449D/i5/IS/0iDXrP4xIiVCblTURE2FLKZWqoFGJjjcmrVBxSj/s9
	 pwdClzs6tmJpqtQsCsV8ggKHXMx6LB6mdJqPHb7D2g0U9DzIAo42/rSPu2/aOz5qFKMk4
	 MlDOd7ahmpoe7c3zXTFDDJOWOVJ/jklAj87NjYeyiaIWDuOvEpbSXNVLuPWwRhoyLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
	b=xRIAlo2EAZIk5NF77w2hh+F1aerHG7VqxdfbYCNM73RlSPL+NaqJasoL9tIVlU8VR/O7
	 ea36l3ZkAcMUh04qYTFGwE5qP8eO/cSMxnFqBQIS9A+A8D17ErtsN4xt75XK2dZFYVRGX
	 8W+jBadTtLAMSCDc0H3Ie+QVExmTWNk/o6oVbFBwnrzy2S/0QbanzEMj4NfBESEJ/ySl/
	 gNKFGx6NRefyT8h+hwUIMPSWAmYT2O3oGI+2yXMcPwJrVbR/w1WQ4soonb31wWdiqXcDx
	 KjN+gwg1hNhA+Jfqc7PzE4G7QcMFU1ZB9BxvpMOxtXDVLDHYY8uv8F7uROZsJOqkgTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSli6rNd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWTZbPGZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32813606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32813606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSli6rNd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWTZbPGZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAXOau2017398
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvghIzBw0O5GdRnMjzzOWphS
	3vZYatvIGIcTOmd8Jr8=; b=LSli6rNdgYS+dfKIOBHsyxhzbGY+sRAh53KFkuk0
	JVfWLVwQqupLGo0cDdvm2AeZ6eM/ktyhvJn2t5YuwxqKomWVaRskgqGFrN85U9+9
	mkqmejtkPkXQ+3adl4I/wtu5G3/t3qzOiHC3uRmi2GsumY3PJZ3sgYVGh7pk+GJm
	1svk4JL1JEWCJ+V7e0tKPZ3+k9YeQhhZlBrYbXTn6Q2F5XthaNBxgT46ZnYmBxV5
	6mNAdvHb1o2jdmpZmhPr/5SPaWPnYc+G5lmDi9r5lko2Seg6V7Oq+LNbSKMN55dC
	hnGdEcBGSQzbIVeYkTO8qHkVNZaX1qKXLKObZV6kDgMkOA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbpre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:12:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2526630c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399177; x=1795003977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
        b=hWTZbPGZZ+4cS+WNdjW4+w5jbh0aWJ9ezjl8tGxOBKmgvFcPfxsAnX+/3rth8R2gVg
         Q4VZq3vKerMoYYABZaZWN4xfmHUz27FPK7iL2EO06Av7bgODTbbdfdpnmXp9j/Fytc3F
         dAtoV8ckUNqR1+6wmDXxS+ByBA7ww4ALizktKaZ/cT5OWfvEkmzLkqUMCcQre1txBael
         RLyTgTlN/NDZjDVRXmJvi/KWGqSR4l+N5/MWRTd+GkS2n1Q79XYdcAM4OgzQJuZ3xzxK
         D9gsh73p+hJo/rBMWwSafxtjTos+7ovxjHzlLgzM1y+bhix91TbJ5IoRpUMczh8kfrg3
         HfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399177; x=1795003977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
        b=lZ5KeqEfsnKq7m2qGzT3gfmcz2BwPmdiiwGBnxTuM25b1ynBTaZi6N0wsmlfBOOA84
         QZu/nvSj6Nn6bhlJq896YKSnvj4CGs+RMYEgnSd9gTCOQ8B/V9UQuRTQpBM66pMooyBW
         L+421o29b2ZaCRAU6V1ODLdkzxs5PeIFgpr4l324TI3qVbUpxG9RfHy8hbBv+wyGn5Xj
         WimQhGXqo0sJHKnKGkZy2B2CiSkKz1rXT/LnXYKnvU6c2qkoowUBK+fgRDfnOBo/ZZ1z
         P1gkpHfe/0IxcLQq0XVlOVh4m717wC2TTdH1K7OoRd4WLAWhqOIV7yG0r8von/ktFuNX
         YlUQ==
X-Forwarded-Encrypted: i=1; AL+hErECsRvLSpY8YyLp2cVuefgaXpC/8VaiX3oTzLdNX8KWPwRzY/jVriAtW1TyBFn+AfxUnexUe32Ky5RZ3NI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k9hL/a4CiZV7KE1dqabuBTnEIpfWEYg23KcVb6YHl8w8v7v1M
	JuD3E3P0Tr3blaTRnkRz2V9wkUdZHxUEdgy8Xof31cSUOQTf/zDI6U+MIWRvl0TevStsAyHePlv
	96Wp94rfwM4I1CWVUsoFrYxv3bC2RZV5i+5JLY+WGHXVpjA4gHiTGyHKPXtye+nuP9xQ=
X-Gm-Gg: AYBFou2ucq43Lh3Ua8EqITv2a93lfzTbGMUZhMa/ndv1R1Mrzo5XR/lAQORsw7vS15s
	v4j+tzJgXJzCReWsJv3fqNABQhRAekBgfZEBf8i7I3agMYifVzqv2ZYYEmFCuVlJ1OrwTjlqzrt
	Y5L6e53NHdsmwB6hz9IoG6Ej+UVvS0VEQY0yBfHNa35IXo2ZGyYFbhAwHc8uIG+K97cwZrbpnug
	+xsGV1+HiWjMkLIOWCriA9l+NXGLl7PKOIwo47UR0al4Kik1WYFxwneunIGvbBgdJq2+w9UIl4f
	KIT1Wyuc6MtkeC+wKc9uDoqQGGvovbERKjB6gOdZ2ZI3Th7Fzt2Y5ho/Ul+WStrX3gtqQslAvxT
	8w3BdfpwEj+H3ngPg+sIEjDYJ3zYHNAwmX2V6DNfsVcPnG39byKQe2zPfu7nZxm1Fd1Nm4tYYt6
	Azm8cMcUztnMQbdXIPw0fv+8I7lSb/dEoCTQp5AIqf6xb3mQzlZecJqL2UebZJedND
X-Received: by 2002:a05:7022:1706:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b3c03117e3mr1632718c88.24.1794399176870;
        Wed, 11 Nov 2026 04:12:56 -0800 (PST)
X-Received: by 2002:a05:7022:1706:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b3c03117e3mr1632703c88.24.1794399176111;
        Wed, 11 Nov 2026 04:12:56 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm15887599c88.9.2026.11.11.04.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:12:55 -0800 (PST)
Date: Wed, 11 Nov 2026 17:42:49 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with
 highest available frequency
Message-ID: <avRbwew20G2fd0Eo@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
 <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
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
In-Reply-To: <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX2noSbhueUug5
 OcnmBD0NRVF7rrORKpd9NSiTUfGJq6SbwqAaVVfw6Yd0pFNRUvkaP8XUcbKk4iOpYf55iUd9PF4
 FuHkkbw8ctENDALIbAvmOQQv2cFyj7mBLwixWENfHqvauD2y+hejQBEyaSz076RoHdBHgZJxzIr
 o3gBcIU9st2M4V9KzQGgrMt3BM3ovvsnXvXw6ZcBXp32iGk2Bp3DCJaQSyXJ3qCQuIks3Zd+rBc
 AIMxCXaPEzYW9rz8pA7fJ5I92bUpObZuFOwBLU6mmDk8V5TBEKyzaZaujoIug1xV5TaHa9q5TI/
 pHeDPSQIIP1U+uHMCRRBwfIpLspxPJ1MjH6Fd7NqZRUYORRy3Hh+VLc6kli2EPdldRO4ep4xdOu
 ZzT4mBXOmY9gthmqMojjC2yJH4Dsk8SkiWdSEnbbai/BgXNa3ZBSQ6JKBVNPH3DNvhtCEEzBeCb
 FMICVnDk0BdQ2S5+4Cw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af45bca cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VdZ5ZUKuIB4TndN85GoA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: RKNAMP5SHRaGoiZguaKImqfqp0Es8B7N
X-Proofpoint-ORIG-GUID: RKNAMP5SHRaGoiZguaKImqfqp0Es8B7N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX4GkXUF5i0j1o
 PaLyj4ATVjEa072VPRbDGWhOmDnX61rHKMnJ653tUx6utXv7bF71apwSivFmLI36fE354X6qlL1
 yVms+4NcA7ArOG4shqpj82wgevkJo+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110048

Hi Zhongqiu,

On Sun, Oct 11, 2026 at 10:16:37PM +0800, Zhongqiu Han wrote:
> The current implementation looks correct and works well. That said, we
> might be able to optimize it with a simpler implementation as shown
> below:
> 
> +/**
> + * cpufreq_frequency_table_max - Get the highest frequency in a policy's
> table
> + * @policy: the &struct cpufreq_policy to inspect
> + *
> + * Boost entries (%CPUFREQ_BOOST_FREQ) are taken into account regardless of
> + * whether or not boost is currently enabled.
> + *
> + * Return: the highest valid frequency in @policy->freq_table, or 0 if
> there
> + * is no frequency table.
> + */
> +static inline unsigned int
> +cpufreq_frequency_table_max(const struct cpufreq_policy *policy)
> +{
> +	struct cpufreq_frequency_table *pos;
> +	unsigned int max_freq = 0;
> +
> +	if (!policy->freq_table)
> +		return 0;
> +
> +	cpufreq_for_each_valid_entry(pos, policy->freq_table)
> +		max_freq = max(max_freq, pos->frequency);
> +
> +	return max_freq;
> +}
> +
> 
> 
> >   static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
> >   {
> >   	struct cpufreq_frequency_table *pos;

ack, I will try to further simply this with taking in your suggestions, thanks.

> Thx and BRs,
> Zhongqiu Han


Best,
Ananthu
