Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827930;
	b=UO9Mz2gUSo/qzWMq6CvH/tTTi+i7fa5IX3CJqRiIjx4rJaGAqij/Iwp+IAqLesv4oEFw
	 0x6ycscCMOQ3+MBxWYC2QS6b62B+wTnw9AqJ7YZlLEhCSPzOgZBKWoc0ZXvY/7AjUdQYc
	 2Aq8KxqH9LL4tJ49bfkV/tG2lDOfHwLl0cCUyfK+p17AVDOsTrogOlXWsPy5otlu17XhA
	 F2dkk1wqQx6vi7Wcf8hKrvfOWF4G4fvZzzeXoIw9eDpz8qVQgvmZxhmDk6mVN80LS83yT
	 DV+PHxfww3YpfxOApiluRuqOtPXyF6LKXVYGtfnO4Od5gRpcM73jLrK19nEkt797dow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
	b=XGsb895eGN2yRZrqkcONL5Mq3rKtvgOTHJmMYCXb8tm7SL2CgaNix0t4MNZTpAIDT0gG
	 tiMHTr/OOBn0TdIoUcPqP0MgYQP9IFeJ0m/LNmvRM0pW8M5x+BGLVfP1GGljMByztKA5i
	 Ukju668nsihDkVSm9D2GHArMFEpneoQCuvL/7/LVKWlRp3wTRbVNjmiF+WcGKVhqG33Tw
	 MrDyp9U2ypk8hZJvzyNZS1kjD7BDAlqBT7RxU7ytAWEfMVi15yP8/eoSfcguN4GOnGDlY
	 3bGiouXAB7N5zM4q6XrEOfbciFozeO5ad2iMRqTw45N2y/lpo5AQq8QujMKQMUcw8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRKWkWRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5ZT3O5H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCB606FE99
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDCB606FE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRKWkWRT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5ZT3O5H
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGB5eJH2093839
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=; b=CRKWkWRThQ1xx1vb
	/MHR1AViHIRZO3yTTwbdNqLlnRMJVZ3itnLmZGL6FlFBs0NMm7UlHHOC+5hJVRvL
	sl+3/t15KWWPGEr620bIezcZxfp1dVS48a8WYtrfdwrh5QJG4t6ScFO1JrP5C+DI
	oBzj/5IJPh5ecBPhiic87dvnpqbO9yuazvjOngJ/0bg+zshSLVBa4+KlA+4XGwvB
	aKXxxjUXjj6VKqiwYQ4DH6/WGjdcJov/Xb4fPgMCtk8v+50PcDVrg7TLTYtVlAnL
	029iSr/lHPxgAWCf+0+FJFg2dvLLZASUM12YLw1YUhRfkmWmiqXg+ptBeE8qZD+S
	tNQhQQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg1ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc37ee6562so200874137.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827928; x=1795432728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
        b=F5ZT3O5HZgXCnfdoXCx0SQIoMcaDMURznKMLPJ9RL49nE1xzWmP15MKesPk6jhSU65
         Ird7VUndRuX3AUBfZvoFwZ5IV6VBEn3pacuWfQahJF3R9fuA71DNcDo2ZANAmAIghjjH
         iDnPiI6zfHgFcszT6IYZO9h8302AujmDIF9IMt7RAiC3DDxz433dT986/eC9pq+hb8s6
         vHjCiAIX52GdFgDpxMyfQgXmLmr1U/MAzbMhqwHQp5y+NhHUF5JLGe37xrZFCt7mNQkH
         JGQxHryIIq4gkbPnsgYJGBtPD4z4p2LaJkUgojj4w/BN4mW6o5uiLxiZQ84FHHqpJfdd
         QxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827928; x=1795432728;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
        b=ixqfv3zpOkrdL4ozEy8XFC2RMpPcD8HPinFd8svAI41p1LusH6BgRpsDBR/l2tKabC
         09cfO8aLc4XokbcAO8jsYdrVkJOXvkJoEfNOBoDHdxJTplVIM6lf4aFlrNsCzKU4/fvN
         /XVZm7tcgbUDWJfrrRs8w8XPW4Db5pasIOp3ih2KaGS1tvEjA5a2U+Mbmxb7bUjZCV2h
         AyeTOybwXY9WgnWoibnMlA0Bh2xqzdzfIoEf4SkiColSRyV+82U07boF3Ess+tRSVQ1G
         boAXbqp2w4MQXfnW5jP5O88NNx+2HqZJjLIZTJBeI3sRewfBcoLmD/URJNrmBUGKvrT3
         gInQ==
X-Forwarded-Encrypted: i=1; AL+hErFXVXx0S2xbb/YDSy3SZyLEWph7V1Sej5ANLKJXrPtItYfyXwmlnmQEmg966qxp+r/W96/R/tXvFswIUTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBBnk4FPpDjb1l0WtDngF7z0mVu4IW3KAW0i2VHepsrObA+ly
	RMxWZxrDSoue9ik2eSMbfhVd2IwJncvpj4g/+Z514zOv6ZUrlpL0DAfZuAL7RPpkrSEv5FwIHwv
	CR/lwy57WLDLraTUYCLy/GquWEaRE2hCGUawR0EMYTakHu7sqKVBFmoxR6QQMTZIEJkE=
X-Gm-Gg: AYBFou3JE9FgYLdsJ0FL6XqHa4f0bYHTrvQ8yAM6fJrgH541+w8TbnOR1ju1qdDRJCo
	w5YahwNnykrcg6RYB+w7o8vgX5rqICB1G7K1dDlpXvj3OuEIWtoDRXpIQVJp9SYyswUuA9yKNof
	V9QjcVEaX2vJTyE0OrhdAhRW40canewYZgwttbU9N6dIWAqvF3mxsmJyHxO1uyrmqK7wgkNREnB
	6liHWAI4forucJhQRmDW/ppRVy1XRtxWjNXxjPA4MqXg3s0zi0xHoPB2rgfgzFL8FZH7khxiYNe
	kADyD4jNlYiq1nKTa0pMJgzwMnYj9fV8Ky+SwCL+bPdWnw5jYEp6NHRjrvkuRF/Sv6llpzBeZLP
	xxIcOkfJDvbxHgfI8D3+zRyG4iphqvUtxM5RoBQIqguia8NDH81eHpnvgHOl0m7xjcjemU6NELt
	q5PzLYCLH85xy2hg==
X-Received: by 2002:a67:e109:0:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7d64d134b30mr2130442137.0.1794827927795;
        Mon, 16 Nov 2026 03:18:47 -0800 (PST)
X-Received: by 2002:a67:e109:0:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7d64d134b30mr2130439137.0.1794827927334;
        Mon, 16 Nov 2026 03:18:47 -0800 (PST)
Received: from brgl-qcom.nice.aeroport.fr ([193.57.185.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm299378445e9.11.2026.11.16.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:18:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Jinseob Kim <kimjinseob88@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: kunit: test mixed-polarity multi-line hogs
Date: Mon, 16 Nov 2026 12:18:44 +0100
Message-ID: <179482792143.32181.18418835714550547021.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104120055.256-1-kimjinseob88@gmail.com>
References: <20261104120055.256-1-kimjinseob88@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afae698 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=g6/0voG6I3K7UbaExJZWvQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R1EDEDDpMdenlzZh-PgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX16B4hd4sbT/F
 7N46VfBhbvlHU9mcDfuJ4BT8CSgKklgckiqne34Q7SYZBby2WemEQziLrQvTtcigswZ2duYJjGE
 vGX3qDpjGm03OdrwMP6o0NNRFIgumOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX0HgXtNljkEvN
 iCfJhCobn8UUIA5iALR4wI6o9UVgrHAnpzRkzsGDwD/1C2hSQDQYn44H4W2GMAUtfvDomYF4BDQ
 mx1BmVOyGi/iF6DcCiHVtSawWzwX3Sl1eJQlduW65NMJp4o+Su9I7KZVwBnDkfNpOu6aFhzsFY0
 69ArWYgOleDtlGeGIz548uL5OPEGMA93vTRM4rif7dQyuEbK7bA1lWzbVKzcm6qy/6lY6vP5DJr
 S+18Yi7y7EIW9M4l3+Zq/iYkphiVRRlAbrfx8L7oS5E6WGO2ezRxJNkeDTd2uUZZnx2nOlA3rTC
 auGFheFqAOppWQ+cuRpuXIpG5FUvwav9yibJtODL9Wg+pkCnx6j1QImIit1m6Q4ekhNtcp8UsSF
 Dynd2laGa3+ZukWsUGdqa/DYWdJ79t5/l4IYWO3r5S3Ops1D++ifwb96XvsxCNWjGy8bvvdUiuO
 bp/3ZnS9xcFpiEGHasA==
X-Proofpoint-ORIG-GUID: FVIqZj1NDA3vBVH0kApV2ZPKCd-JITbP
X-Proofpoint-GUID: FVIqZj1NDA3vBVH0kApV2ZPKCd-JITbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043


On Wed, 04 Nov 2026 21:00:55 +0900, Jinseob Kim wrote:
> A single software-node GPIO hog can describe several lines with different
> polarities. Add a case with alternating active-low and active-high lines
> to verify that lookup flags do not carry over between GPIO specifiers.
> Check both descriptor polarity and the raw output level for a logical
> output-high value.
> 
> Register the additional provider and hog nodes in the existing hog node
> group and add the case to gpio_swnode_hog_tests. Reuse the existing suite
> lifecycle and test-managed GPIO device reference cleanup.
> 
> [...]

Applied, thanks!

[1/1] gpio: kunit: test mixed-polarity multi-line hogs
      https://git.kernel.org/brgl/c/e60a08613402e1fcf6e3d4df0bc80969140f7fa1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
