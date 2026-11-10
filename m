Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303498;
	b=L7/dVhvJW4Qd6l4wRoj/d7mqJ8lClFlBcFWLkqSIaKMjZId9PEJwHQhkEbdDd7w36EUj
	 QxZcJ2McyNm1tq9M0ThMmUxTgUMTImVxca5i6UjQn/N+H49VNMh/TlsglUb9tFlSuKdY8
	 LSMGciaxofZuyIJGZJSv2eaRmhUpimf8C2Y+wuLWzENadHCW1V+KM54unIOPfaC0+bwaB
	 uu8G09PHopY0ZxD4rXtvK56zlyTp4K2gQuZs8japXijs7OUfbnfpmw2uY7bTjj2xvokfK
	 9YAlMbriiKPJY18hGRXQiiyKMApVPb1MQp1iowfrhfHAR9ExtTpTsxbpezAh0wY42DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
	b=Rc+HIhIMXwUj/JI+6JgO6zC5tyI76/scunxvM8AguzRofg0xHq/io2TTznWNYCDSikTf
	 6/a8Iirw6E65w5N5RmqZ4xDVqyKmq1COXd+qQnPXyLHobCS1iHyNaeiJTVoiXqzGVgdV2
	 HT+VBzaYUxo6fWKJ1mCdT1oqHj2Z/1PuWfP3CN0soFvZ5jz9ZG99zhNem13Q3oWVqZ9al
	 fGAuXtIFHrkhh0DhSkg0PUHxEGGPDwaYO4zdh2IXnemEmrYSOcDjNdbLTqC4LbsABI3LN
	 oFoYGfA+8Oe79gWrLzcOopQXPiggj5VNjOdCU1UbppmQc0MocNjSaxsROQmBd43+ABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPRTJKQK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+oBaOUE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4746606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4746606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPRTJKQK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+oBaOUE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8n7rF2888856
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=; b=aPRTJKQKR6HnNm3p
	Gn15g8HiARayyGrzaj5nAYiRG0y7dT8nL+GHvjo4p0HoMMCw8DmC8U7ANF4BQcNt
	ltqASJN9ErdsKbznmMz7xAPyhW1I/ipXWhY2j9iFLNQuNYqC6y9iYMa3hZ4iL3vq
	POk3f53z2MUVV23UG09gEsewNU7Du/ZtYfYtaayfa0VPrgTETc6cNeOVuDho9wZo
	o+5VdL/vphdenyjg99KhEKaLdMvAB0Xv7rNiRakhV1A1QxCso/R0yseejdX6N8RO
	r4Mw51kwJjikBlGp/zUOMfas2Tffl6AS9lD0lIlTB1xBqwAimXMdeqbYU2qh8nfO
	d1Y6Jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cr6kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso375584185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303496; x=1794908296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
        b=A+oBaOUEayRVAO2q7aC5BPNpGEj/oPc1TFNI/Pl/fRTkPoa+9eG/8MXnVWmqYI3sRS
         Tgc3BdOAvUoaPj9QQa8qGcb9cd0UlE/Z9VjyneGK16ZHR4P6i0OiWjnJEXcsTt7/S/BK
         30hlHXPTEwtytZPt7e8CZj3zW+L86yOWNVysTXY8i5JfJyYRzLcVaPcMb+UWUjx5sdW1
         z4T5d1QkSYe3iUtTTb8UE9Hd6J01WK/BfVXYcjXPc2aNyCy78APeDQjaPaeClh+okbeX
         t3aeu7x2XYPTnC3rbfcTgmLUVH0uBs7Nns7jSqhnv9gPDvBXxbpJeAg3HRcIzzva3V7Z
         CzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303496; x=1794908296;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
        b=uRvY+EWuda/4PLkiAPenDuLGPIcVSPgwSAQvaVtm5uVew3hsg4UocazhhnFjo3xpE/
         YIMlHzAJ74VL4XtUynYSStfEU1fNuagO0nL2GVHhj2yRGAWEQKv0m6kyUuW/6cA+qMsi
         HflgZDLSvuagnTlKnn8fekOnZp58sJ7wOonBprFlt5bELGObfzWYEyxBtuppYnN8by7L
         oLRc5WvA4DrsEn1c25rc0tmzNmcaxHIXozjGaRTkj0kVc0wfM+3e3oyrCHVXoOMM6klG
         wDD95jLu6mM6awDONgZgqZUbb+nlxn5QQlA/Lzs56te6u//VH06/T9eu/h+zfh1hNVa/
         pDkg==
X-Forwarded-Encrypted: i=1; AL+hErGNHy9Au25ewk/5z+khfuWDEPn7iL5Z0tA69smFalq+3+Pgpb3nhhHB0SRut2k5/6WEwbWfCVOSuIII6pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wIKOKBSI7spIqS2oLlxWCkvIES4qL/OBORyJhFwRjrIbmFw32
	1KyHrBg7XmoamiF9Yn1Z3sykCT4RSmMW2IHnmQLev4pgUltBQTUSp7wjy0dKilT2J0OgMdmqMXu
	1OqtZDQVOp7HvqFueRSL6hc6QqGiyzKB7t3k71l4Y1IXC7bioKmC00UxA0AuoFaOaEDg=
X-Gm-Gg: AYBFou1LtATWxY+gfEJ9TEQ7OhnPeWflbQKlgDLIFvOYaYCmUOD33b0WwSnSshSDGnn
	L65YI/2WqBVPKSBjdkBUTsmXUJ+wEatz8lJXfNGEDDF73SJVvImgcTU9mrbEUstVeF/Xeilq9FH
	NnavGrSAwt9erjs6SOAcKb0WdkMflQPkCxw+lwXYqvNmUKW12MaGH+Rldn4QxuZDSZ42wTAlh7k
	HAD8DVehGntlJ1tcGVe4UrcnaqaCe8IRqMDp1+Jat9crSYbUe8pKW9mfbio2YUp1XmRpJzCkR7b
	UiCt8y73jtPyoAexDgz9PBzxgXXWdOEmh8ay1m0HaV6t0/RejNyJh4cPxzDUcPB5FSsCz/cscyM
	t0wYED8d+5i409D9nWOFSbuLbATuq8uiOR8WQT8XMfoxP/4nsEiwjoXwMx2p0BDyxdmJUvtxNeY
	DK3tu6Xy8adkZK3cj0OWY/61s2AF2kdGbYQoTzi5HKDwQaif0vE+jNhSFOwfjXRQ==
X-Received: by 2002:a05:620a:46a7:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-9479f3c5fc2mr320944485a.64.1794303496118;
        Tue, 10 Nov 2026 01:38:16 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-9479f3c5fc2mr320942885a.64.1794303495699;
        Tue, 10 Nov 2026 01:38:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm53126545e9.2.2026.11.10.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:38:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sodaville: fix use-after-free bug when registering the irqchip
Date: Tue, 10 Nov 2026 10:38:12 +0100
Message-ID: <179430349031.42519.17560346076327838160.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
References: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: NHgdAbVk3pgEhAlLS69ZQjzlP2-4Bxs6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX/2u9tzASB/dz
 73HgWK2KY9qYBDtzKKbGkS/hepyeGPSKIpSv4JIl9gpxc/tf0UQfMZgX9a3t4DTM3Cpdmo9tEk3
 HCfheDzi8+FDCJ6s3khxDDZajrnKm5w=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af2e608 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Le8wEPVksgxnqJZgdr4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NHgdAbVk3pgEhAlLS69ZQjzlP2-4Bxs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX3OL5m3T/0g2J
 R5G9Jk8LVa14Kpq4dkFWGLGgoT2YfWJCR5amBDaDWcpoyNB+s84sLdrucbvdybIBh/moNObr+H4
 MaAWygJTMuTvw1POxLX32O7UHFHHPrOszTMLK650yPP/U3Xgr9YRpu8kR9aeRU1YuCQuuYwAisN
 L2NWWjnRcQf+Tqgj/HSteiQ3OxALM0wKul7nnQWjx2EtgkKHcvIS0dAEzoYOmuG7OYTIk8m2JrR
 WfYhL5smvTGwJlL0nFJlc+Qg6t/ziLjjj17TW73s81l5t5e1hlOnxTlQMQolyiaANWZMl8FypyM
 lVQnCLSHs5zXzOVInaEQWhAkoDtDWqw7LltQWS+Wr/WCgnO0dTiXNHlx6QQ0an5F6EnFTWKWqCa
 6LsqXERPpRu4u5pbx1OEjM98cQP/JPYkfKQ15IdcOuSfLu3a16WzPhRKj4EBmAVknnAwhvhYCDK
 P3yXt6DyDYBt5ppYVbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100038


On Thu, 05 Nov 2026 14:14:27 +0100, Bartosz Golaszewski wrote:
> In sdv_register_irqsupport(), if irq_domain_create_legacy() fails during
> device probing, a generic IRQ chip is left registered in the global gc_list
> while its underlying memory is freed, leading to a use-after-free. Use
> the managed variant of irq_setup_generic_chip() to ensure that the chip
> gets unregistered before the memory it uses is freed.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: sodaville: fix use-after-free bug when registering the irqchip
      https://git.kernel.org/brgl/c/ab9102375b7c77e0c4d33c7594e514454dc9f2b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
