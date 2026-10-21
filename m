Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599221;
	b=j5+vpsRhJrvTj94uCQ5Qwmslzlpr5SMRZBQ1G9PH/cmhFTQjsaHG4Wh4/Rj83GlCoKzq
	 V7yBwlNNkWGHFD4QE+mDbWD4IeT0t48cGdNeXlbhewkKPlvbQeCv83FmopCZeTiIyLIsE
	 n7aUuBW1LMBjymX0orMpmyAhkex/WsdyOHk0oaapzHac2wvZKcCwpkhdNfmv5vrzqHGiS
	 LE5H88HvcGd76DQv8SLMS6wSDoyejGxsM8es+9rJnQHWPPwkSPYKlBNAD23mkkqkOrOdy
	 QG9cFZudoMB1shE2DvM+A27dHtsWZrHBhk6xBFiPxK0L46d8N+8SsBlvKLvYpQsNn5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
	b=pYJuJ6EvM27Issv+dMlqzP5za17UYhKwNaRNthB0SXWBq5PE1oYXE/5Nfy8Wn8xQe/mg
	 m6EFkn1s/Vcki0R47XbS35Q2wNU96l73TQefJ+Xd4bSi5/I4H7/T3tTf62fUxBVwEMdH0
	 oPoKP8JFdgV6/l1IwrWi8pfBn6758JrFgBjwzWZo8yv6fuEc9JCS2r8MKhh7e64X5K2RQ
	 jQ5fECoKdnIgPmaQODWu0hYsUMnT7YBkqxCGoSkJb7LGmQuJ8HcQeRutnbr5S1eQrt5gw
	 LDQZOlxJqYEAz7waSq9fDkaMfmUW/piiuh/HPNUmlraUxVz1VwjilQy1QJGW6ozjm4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dr1KX5/r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5236071DB6
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5236071DB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr1KX5/r
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3PxJ900377
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=; b=X49dvhdm1Xdk9Meg
	9iHEBDxw43T+t+syX6G+w9CK0ke9rlD2iuQJ7VKforUmMpp+3PKkuPZDHmRAdyxh
	G9YlvJy7Y8ouNQNSCYgJoBhc+QGKs4AaNZxMky2BvaZkfN5lh6UAc716uTroUOc6
	G6jnrHZlJMo0AeAJt1AVsgoC8jZvOTc7AYYfD0gAG/V8fCxEray2rbWCZvYlhBmv
	QgbM3ymx1r1yW43oNKf5TY6tiUQYzQiGEgvbeJO+GG4UOMfP9gRHPeCXJ/G9KCxe
	DTUAhyjp2tvAoqYDps53mEraBd17e7MTDhkNVbbECCwqOIeAYEsXLQO5+A/5S06A
	0RFFCg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2g1s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so470469a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599219; x=1793204019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=dr1KX5/rRpnzD0AiYJyQtFsFn40szGv3RgP12tlvt+6y/gRTKkjavOiOsKf8l7QlKw
         Wea+NFd9zdOGVrtWxXqAv+MBlA1u9yxYTAqEnKfADg0OtUl49xDsviOnU4/LlGrm4jnG
         RUKNONj5SOBqVdb9CJn2VHbzrtbpLPR9806cXZLjTm3FrelNfMlwp1VkIy6wQYSoRFT1
         d6Vpg+nJ7Tlg/bwsv8wb5SyN1KCczGKV9Ta50TicPxkw/UdR+ltCkYRdelEqtqYGCamN
         frYpty3ezp8aZBM9I6j7wIXYGqvfvDZzg3Lt7EvKMxtp+gAYNX0htyKeGw74um9qmk54
         +58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599219; x=1793204019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=zlo4tONZV1rkg1BzZQbh0Kp9x+TeyidOd8AbzsvNg+VSFQ6ZSpEy+DUlN7MPmhgc+1
         muEpVlGpsEwmw+8s63DjfJrGpQnunqc7EfPA5gjR/W094U6Jvpn3MOrj4T/xzGfLhqbm
         U94nBGiJbuPLZPzQu/tOoi+fRBfnRVre3UDkdxTnDQTNN1nqibqW3w14tFtLdK4KW1dz
         Fe+V4GxIwB3Ca4FiUt3wP5FXeeBg1HkIYg5ItexaVNAl3A5tfT2/3SIfA9pXqYFErVjL
         oi/jhzeeAeS8EfopBPzjJaYVLWyfU8dA8v+2HBjn4GoT34f/V2t4dF0qgy8PsqAU9+zX
         92Tw==
X-Forwarded-Encrypted: i=1; AKwUvByv4JjOLSJKCDzW4hIUPOEM6uvr+zlvS22J+/bUY7yzvMkJykW2zLbnJyQ55P4XT0Ub7R1jJ++IgvPtUFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJezPCZLNnURO+EddShfAgGua0dKBioSUGKEPyWz8Majf/bf7CU
	/OJJym2QTvjPrATK5vh9zhm70kQVYuM9qhS0y9zEQexD8AX7AaIk7k631gSS7cUJvSnBO2fWlPb
	I/ldnqc8HaOCMSSfk5pwnc4uv5Kb/ZwIvTAT7RcqdCNOzuOuEt8GADv+RFhKGtawv3a4=
X-Gm-Gg: AYBFou1IEVJudEBxWPrAntff7QN2dUqX/RcmExdGzrzgbBCdpCI0tT+v2b9W+vPORpB
	VJZP9I1325aqHXFWSWveSubmbPb/fKpuB/GDW2xSz5bKE6lFe7VSLkbzkXN0X3LmGHThAoc8kGG
	BLAok/r6TD7yVDzO0TzVqVV9N/z6DsaouWRZESXe0u19mJKWMpN49irYb4P2fUAjGxLSVkCDL7L
	Aa0HfphGWBKhrIJ3aGjj+zdIIF/0g41M/WeN8G/ej3TTpKcwwYOZiq8bGBBbH9f8zI+41jvU1iT
	31k/4o+CZKxAqR+GLnDDhMfBUCmZ9vD5sFbNcyle7Y4AsgNt89feyGKY4viZ1e9OYrDsIwXMKfK
	LTJlUgTr9xEbkK+ufG1YRGZq5+xGbL+B2pI+ijdN9187n
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249879637.40.1792599219092;
        Wed, 21 Oct 2026 09:13:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249869637.40.1792599218635;
        Wed, 21 Oct 2026 09:13:38 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm1131642b3a.41.2026.10.21.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:13:37 -0700 (PDT)
Message-ID: <4dff1a97-8c44-449c-86a5-5eac047ab909@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:43:30 +0530
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
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
 <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX5p7IICfMlOHl
 7aoDJMDxDjzOdlc1kSKYoSxQVgZnNj6Fb5GD9V65jblNtmxpL1MXLk67xOB6yFh5eI2x/UGz+Ls
 uqfwzidE4jeUcfWsXqqU1uaZ5cfOPVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX18zvEx0gc8bs
 HIgH1vBYDPZch+07fVGs3LHN9bHte/WHWeT1FijtdIf6rKUqyRLgHDRtMbt0LPaiJgN3rML/pG+
 lWydsBBebciOlFCBHOKHECGMNC4wNXISXhBj8lQ76JkovgwTNJC8GYUSlkR/jgstG8ZmiBBe6g2
 S7JjeaRJp8O5rjk3BWuewIlC8fLXUTVUeE1va6y03bRT71LiWTQnbVSrc1dh4jifADEnLfo/7Oz
 mK9z5ruTwGyBmLhds9r5Pp0pg/5gkvjk8bir2ewbSbDnEkreU6UXmBwiaDc3E61ydTlZT0ZqlTm
 tif4ODbotEus24hl9HarsNZAyE4ktXBo19u02USAMS8eO3M1LK5E5vt6RoyqkwThudgWDKiFVai
 pbWo+v5NBobjlANZUM4GgS4wGJjKROUJaJLdWxAI+v0lLJqHwSXZeC7mmyRsYlzG52FaJPK+Cis
 qJGsnsoF88g3VOTVIvQ==
X-Proofpoint-ORIG-GUID: Yexhv1FjVLbtPFEghC8N37ILlnrg_DCd
X-Proofpoint-GUID: Yexhv1FjVLbtPFEghC8N37ILlnrg_DCd
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8e4b4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=L14mbm2-ywthVrTR10cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210063


On 10/16/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> icc_clk_register() assumes each icc_clk_data entry describes a unique
>> master/slave pair and creates both nodes for every entry. When several
>> masters share the same slave_id, the shared slave node is created and
>> added again on each later entry. icc_node_create() returns the existing
>> node, so icc_node_add() hits WARN_ON(node->provider):
> [...]
>
>> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
>> +	/*
>> +	 * Multiple master nodes can share the same underlying clock (N:1
>> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
>> +	 * Aggregate the peak bandwidth across all of them before setting
>> +	 * the rate, otherwise the last caller wins and can undervote what
>> +	 * another master already asked for.
>> +	 */
>> +	list_for_each_entry(node, &provider->nodes, node_list) {
>> +		struct icc_clk_node *n = node->data;
>> +
>> +		if (n && clk_is_match(n->clk, qn->clk))
>> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
>> +	}
> GPT has the following concern:
>
> [P2] Recompute the shared clock rate when a master drops its vote
> drivers/interconnect/icc-clk.c:36-42
>
> The zero-bandwidth path returns before the new shared-clock aggregation.
> If one master had set the shared clock to a high rate and then drops its
> vote while another master still votes, the clock remains at the old,
> higher rate: the remaining master’s icc_clk_set() is not necessarily
> called. Recompute the maximum vote from all nodes sharing the clock on
> this path, and apply that rate when other masters still have votes.

Let me review this and get back.

>
> Konrad
