Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6B43F085
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382729; cv=none; b=j+5SnuSF7SJls9S5N1rxBCwd7sYZ3loJAG1U4H92PT9qehbiDNQCw0jJH6Bw63eTk/jC9rmVu0Bs5N8b5Z+6Quotfxkk6PKjOaQzmWKU2a8wCRWpt/j2tLYokYRJ4JDk9ROLkENxpLgugMPU6L/imaGngx2jgPS90PNJwV+LZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382729; c=relaxed/simple;
	bh=eyaOqajrrwEoNmASdlj24V+fmIkqbU1OG/65Abo8pj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuROm6kKMCjMCLk3fXPdqgYSkW67Opzn8sF6x7fe+fgH/DYt0yFV/lBfKSi1imNDwm5hco7rA++yQKdyVtwlZGvS/3DDmtkuOBqwOS9USEING+JhBdDqEP9pKGOUCPZvhwMydZql9kYXZvyfnGgxwmlxzgxjq1qWigrgnPLDjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLhDkpKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wf4wDVf7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLhDkpKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wf4wDVf7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9neJ0401796
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=; b=kLhDkpKknrnvHjkv
	9tjdBeiJ14iXmL4hZWnaIlGbn817I7U3ZqFh4xo2Zh7anZu2UUcAnz8Ti+iVBycC
	kEuu9YkY0IzuxNrmOIJFDsTW5OkGxYiN7LqGgkrCuulQ4SP5YYDwKQTrQjrofocR
	xpw0Y7xVZNCuMUh+lAqDfXHLEf1XD2AMMb4YzrqNz0uMQzdqMg9bEvbJA6jD1TCD
	tdMd/Y/lXs+qrmf3O2+nyOLqOi+cgcqO+5zo/0Wy+7agu7Wys9uwfN0VEwtK9+uW
	6pg9lgAs9AEspXTAJtcHOIo7LgxJX6qWAp28PufNxHvjLC6oq0BedRYuewPwOqk7
	nPQNbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst0c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a18b457bcso42258685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382719; x=1789987519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=;
        b=Wf4wDVf7jK/4RNjLyTe3sjmsQz0+rAb0OOcBadKSwOP3nWVF6xq85Dq12vR2Iia/T/
         GRy98AiqYzn63S+HSk+JCyQK2+wiivpjzBhVVLvwgMl+2UXUlcLzJnh00eoqQaBb5yIS
         lIgayr6FgzRPt1CZEHtRBbjy4Z3q8eGdYx8TTkrE+15BjZzjklDALWFz3HLFoS0st+D9
         qnpzPWYzg1h+2tZAWTIGQdfyKwk2b8Lm/xsdxuO0rv06fu2WrvQJmzKVws4N96HgXqkl
         zPDHTN7X6y+0LgBz+gK/m208mtlvjgiiiaUBWVatzl0aagou6juRkk5tSTZ6YoqmzoU7
         Y3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382719; x=1789987519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oln3IkACQoy8k2yOA9M9clhi5W3pr4OikQviEiaDc5U=;
        b=h0/WKvHCUAtWa8/rnodaTW0sBqgnROqasCAwr6AycF1sfsTjyfYYJYsSX929vFPsql
         B15kDmHdSwegDlTj/Sa2Cqyh3ehAWD4yA7eEKMhMT1D8w42jvq6Pu1WOIJ8dRNXItaCZ
         kd+JAdhk4ThICWUmPK6UTuZCzU14ApNhILyctYpuUoXk8Qqxx/9W5wJ7wrGgjJiEEI37
         NfD+eGYit72Hf9nq8Mln1FQcH3OWOQwm1hspBrNGKAhfoHV42Anq7Cxg+t88cu4vRtEH
         Zf+gdU4DB+oTXrmC84NH6eE28vawYgsy5fLAFxo5sidhv+m0PxhKDc2ZNt5J7UZoF0Sk
         5dFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPiLD124EtSmRg66UNKP3mFro7a1zC9cMo6em3xXWcSOx1GbpMjPISyiAYeER8oFHJb8VTwsuwC8YDm5c=@vger.kernel.org
X-Gm-Message-State: AFuF++noAa99TkVUwpLmq5Php072HYYXwOM7oT0bxQn7gFDwIa5vuhsN
	8DbsFAm8BB6PWS1w/ICPTevmJX3omAdyKGst5ZbSXCO7NRL7vPXcaauLsBiQ3J1xLIUTbARojnx
	KU5PmadEa8CQS6Nv6PTVryrumKFBK+szNyOhtsy8aGN6/TBgyqh45YgGek+G7VOBCRH4=
X-Gm-Gg: AYBFou1NQi9fgSU0++9gG357NXyA4/QjX7T0DJ2PO0dtYXxQzVqHWWfpBR2EImZ6fbi
	vc5kmCAuhWGAgFlntmfPXdTYuvHiIdalIALHduaii0GkjRvtCQc6x/WHZJMJp3A91Dzzx3qaaSM
	6ArpyoRg8I9mY+6Zw+AXmw2lJHFwql7L27gNFOiNm7qzFrccKVkw547IpJmKBcOpgTvapoYK7nY
	r2aoZcwlsqIFwWOU1Xa0gf6T6L0TOLrIE3kqTZDGXNS3PMQmd/HdOn1fIr42blPBGKSKwA7zIDK
	HytWVe8qaxxlDBPrXzncgb3T3G0aMLtcfa9fnGmpHanpb8+8eMEFW0rO9w2M/7rjPnEPZWt7RPm
	ZSxbzSkQoO4MuC5gXfemLeg==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr207718285a.4.1789382714416;
        Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr207713785a.4.1789382713879;
        Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8528sm4027243a12.5.2026.09.14.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
Message-ID: <67557983-fb7b-456a-828b-d9c73ce1eada@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:45:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850
 WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX1UXnSqKRHzL6
 OjzdsR7KkejwwDolWLzTTfEkMF5aZkRbM7xGEfeqAIt6TCA5VIMvtH6TCnH9b85vmSWOwYxjV4s
 RwpJsLq8ACcPi1xtDAlW1wcvBeh7Pr94xrdF46Ny9y6krntecFcifwWc2F6jIP2Ir+zL+p7K/S5
 /d0qlu36Ju3E3fJgFaaLDj7c2F+j4Oap4gpipc5CWoWjeppBkl8Q4oeIbRyqJCAgI71idU6/DEz
 pf6EbXZQ+VJ6rqirHlVjHUsM5QHa0sHUsY/P7DFsgpWwzJz5lycajuSCuPO6w55rncqvSoruPM5
 xz/i3c/I1YLiPuscdLMugzgpoxUR3LYZP9ekNQ/CwkOPm/NVMJ6nGbJqRWzYFYxMN7yL6O/0nwi
 rjayMopF/b243AxZUTyPH41mTW3dIsxtJADmuRYiqR2sZonPUQY+hqE0yyudq6A7Lulwdjuq+ca
 4nunxElCVW2rEbSVWrA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d03f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QryoO0P2UFxYqXaw9vcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 89gMcHRJtHHXC7lqIhTv5B13zppJkVv1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXz8v6hMRY8nMZ
 vKgD1eZZnB2zHiJxyn1F+ne+qKNQREmmw1pT5jT4YyqUgB6LGl/DitFmjcrcb6P8yTag39JwIWv
 Ylf46q5cFlVvorMcWGoHCdwUHqG2SGk=
X-Proofpoint-ORIG-GUID: 89gMcHRJtHHXC7lqIhTv5B13zppJkVv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
> a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
> PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
