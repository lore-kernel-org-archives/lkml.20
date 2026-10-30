Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395042;
	b=o1aMvNeVkPKT8z9Yg23bdzycTIhptDeej/qkXXDsoRU7bpY2NR8MTkOlxipkuANZK8/2
	 wFiXpFhMufhzvpvdnlg26AR0as7TXJXGm+XyK2zyKhXYluZ2HxXuY5guOsygqBIgjqXov
	 BQGaUGvUHFpRFwf7N1edHmiaeWXcVb1AubuOsMQO55uWACMSHuK1i6LALFwBwN9bdsRod
	 125a3QvXtBLrwaFyqiTKIMJy9gTArEx06+qpsuzC/lrljAhj1kOAqjHNJXVNeRX35awVV
	 z+xtrzNAx9roJsRJab8A1GcF2oqvMEkBbaFGPDPAYaYBDMqfTltXmeXkxcnLrkLrQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fRWmd33IApW1k+d/oOksSuFh5i5/RIsJsgeiYg6URG4=;
	b=LFE8vDRN+aeW8Mp5wXIj17MmeIr65/kwbCRzJJ1RQcQ0CTwyO4yWA+/dvnkHxatlBWWp
	 a0bYc5ZdSzHFZVCerqdtiYZqFIsBrWSYuoO7Up6ockGPZ+0aGPwR/QE6XkMTzPpOeAXz0
	 B++ir0++xVjnGZz6AJEMrS1NwOxV9t/EeFzhJKuxjx7AuOzappa5f05dMa+yWaGw55EYZ
	 6BNeK9XdTy6m6o0L0SQZPSdQSTHQ2Fwl7HK8ttnxmTh0PwW0EUuQprpxBpcXaLhNEcQCc
	 pIEhIi5mQB61OXG7jG3EO427ba58ZWPWCYu+yZJcDMt7AwEU7N9AvIT57D/1jt8CFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Wex5J+IG;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=y5wDmt2Y;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF308606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF308606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Wex5J+IG;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=y5wDmt2Y
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAdNc2764828
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fRWm
	d33IApW1k+d/oOksSuFh5i5/RIsJsgeiYg6URG4=; b=Wex5J+IGavi3xM77v4st
	urUui2rt1HL0QfmD9SviL0UY6IuHUpYTjKLd1izClGVAuBD89z2nAtYIU2RGszT0
	sxZjpOZI0ZoHH8VUdj1XpHSxBN9lJcj/be/+eq94Ct/tBDV0+MolLPlX7FeXa8id
	b2PXLmY92feDlZVKhyTDP/WDw5/h56jcpb74WKcpgBIBefMsre92qSus3e/nnj28
	YrX69GdxW/udNNtPBmbeObpRyzKWePNtmI2HExTK+uvRh410YbT+SdYEy+sMfvLI
	ji0ej+JKb7NmmYHqSLQZ34pSVElEmuU/f9apgPiwyw1bWi7qm1QF/6zyjVR578HM
	Sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2x301fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:17:14 -0400 (EDT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc23a549a9so822370137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793395034; x=1793999834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRWmd33IApW1k+d/oOksSuFh5i5/RIsJsgeiYg6URG4=;
        b=y5wDmt2YBH+Az/FidyHAgsnMtGg17OqzQVkl6pbgxLwY8qCKSdJgFfRmwU4kPC10wI
         pnkMjQpkg1aRl+TaLWZy0oSLJEm+fUktnDxXPDDVcB2yyXtEZn9v5kxZPQSbeRfIdPtO
         HckhscArcEH10M43ekTr0QADKOlW4CODizo/AdNP0b0+1saob7PUx41BWKCyb+6aPGDf
         MWoOIFJZhWI/c2YB4kUga4SxcJBwjjcPgGu79ng8ViVCM7i79DPoIoh9IoaLg4WJF09D
         k19vdwpJ8RXndOKYS+l1Twr5NHVWTAtS1vUEUTEQ8wFAsB/PzzhWaGUrkPEQKvQZK8PR
         b8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395034; x=1793999834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRWmd33IApW1k+d/oOksSuFh5i5/RIsJsgeiYg6URG4=;
        b=tx0FyRM+jygvooqhObv+7xngCONj4yjK9+h4FeIZ4QytRZ5LyVq9UsmbG4br4us8Hu
         EWYzEuX3MtQP0egWTNkjRFE8Nijx59NccaVj3iSWkULCE8eqzozdCtyD0X0nZatrvOIx
         c4541qipPXQMfL79gHiWSj73jBKUYKzvwowNRoepa0hvUwfYtB9RaI+qsbE7lBYHkuzb
         Y5sLeXM0929nS6L/SpFPw3lnjO7/1G10k1jnxbROufQcICsb6MUVWYiOqyOsqMjisB6A
         Bykawb+egqO+5Ex9SJYXsvn+o0yNwhxGgtzOLe0sPApM8ucvvmbNgzfR6SJb7LF74V4+
         VAqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFIo10h+MLX65VIn7hk5r4yOAb1Eud3oeQ7EynXVAtipMxEG3+bjN8vWk83clYOhX7BUC4X+0YNeqMXPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKndDLmP0zBbQ0qF0AkOzjFwWEMyxY1GaO3BKTBMMbnIek2IwVU
	TmsdDoUC+pBez1vE5rH/wH6Yb8/wYp8pe0HPWxQzYhdDoDcZIel9Uct6OENlxfWUOy8xHFpBavw
	eQx9GniQVvmcbl0BuRZrwqecnbZHilwkQKiwbP09hVY2gnYVPAvHzmpSvgZ4ojw==
X-Gm-Gg: AYBFou2EzdPtszeGkEO+LI9XhP/3t03JvK3pIFe0rfuaILnQ/tX5cLmynJpKaMSIa6K
	0DaWVJHRVWEyhtKGDMnpwQDGK+rKwYhGEJ648yv6Z02lhnsRA7J7xXeS0kmlXhiV89wZVB4j3B3
	bIRJlTk43mkbIBMf3g7zLpv0F0ZQUoal+uRxnG/GQAKdVOXD1ERgxPaXlLPw0tJSz56xP12AUpt
	fqJe61T3sLKBNoMNg03zg9Q5N+r0W/G7RS/JXk7/bztxfXQglRMn1oVpVzG0Ba8sp2WEZM70pJo
	J4OhV1H4r3/XwWrfn6+XGKVYNoY5vCUjOu0Os6UXQc5sWuVk15GMyCTPrsP5mJUwyCA/8bkBaoT
	sR3Fr6/n37m5S13WJTrw1OoUSBw9/sUmFPL4JpXCWtYo6mOpnE38E1NJUMxwbGzf2cROVaStV/i
	wJ7mPO+tEbEUEVqaqUbmF4asTkwZBAycjgcA==
X-Received: by 2002:a05:6102:5494:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d072bb3829mr1865964137.11.1793395034071;
        Fri, 30 Oct 2026 14:17:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d072bb3829mr1865951137.11.1793395033663;
        Fri, 30 Oct 2026 14:17:13 -0700 (PDT)
Received: from ?IPV6:2a00:a040:199:85d9:d6b:b848:9578:6d4e? ([2a00:a040:199:85d9:d6b:b848:9578:6d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm5274449f8f.11.2026.10.30.14.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:17:11 -0700 (PDT)
Message-ID: <1b2cd93a-37c0-4ca1-a8db-8ffaeec565da@columbia.edu>
Date: Fri, 30 Oct 2026 23:17:09 +0200
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
Subject: Re: [PATCH] mm/memory-failure: fix folio refcount leak and
 min_order_for_split() locking
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        lance.yang@linux.dev, usama.arif@linux.dev, linmiaohe@huawei.com,
        nao.horiguchi@gmail.com, richard.weiyang@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mcgrof@kernel.org, liyouhong@kylinos.cn
References: <20260806-try_to_split_thp_page-v1-1-a259e3387e38@kernel.org>
 <20261030105022.903008-1-tz2294@columbia.edu>
 <40eadc1b-5057-4286-9be2-021cb16bc020@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <40eadc1b-5057-4286-9be2-021cb16bc020@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CUbKp7Zngz_GAd105swbDsFdc9dq93io
X-Proofpoint-ORIG-GUID: CUbKp7Zngz_GAd105swbDsFdc9dq93io
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae5095a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=QACC7Yd5LT3gdyx-e0gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX5jWkmTGvdyI5
 tFAb0PX0Rf9t1J640LaZ4Fmke3AEuZ/C7/4BeIkSumq7PmcZHUSKtpK/ajup92w/Mhve70nFAXY
 sZmbhbvq5cWujJsDTiJonXZazuL3GV1wF67/ZFg+X7Ngj0wJaZTlKCXwsm5hFkWa2YQbGGXI11x
 MeE1ehk3LsDCWqoIUraHjcMYNkfurqWdmQxNocP7wXh8pG59x0/VOo20JrJOVOVQH3xYzz0Ns3Q
 np7lDB+WideSUQAJhNrxAnNUYNIpp8VexVRV7JQeFq5gY+WrTC2xZSb/xQ9lROiXJteRR2Iv/H8
 Pw+6H3dwyJTVxA4s/TxURSg6Tyc4m96p/+FlK8F5noTBl1wjoc0fJK2Kyup2vevpWPeVqPYocLx
 7mEnkAIHZk+QIkPzjiKQp+hK5oXjS3IRLnf7G2oTpylgK4L+HRHHbLsqsNi18c8rkgDkW41fekj
 Ez1+5nVofnnMk9r7Dyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX+TohKtFKRiO8
 6nv3ltnHEwvBXBkdLkEbX5p3u2Gf0bHT7JxnWbEK4+yNHZGA1mY4AjAY3OZx7zCUpRYOqIZHvcJ
 ekOZ57pCDSZdmnIc7oBqnl14r5sfQ824hZA97RKU1K3upzRBeCUv
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11951
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=10 malwarescore=0 suspectscore=0
 impostorscore=10 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300084

On 10/30/26 10:42 AM, David Hildenbrand (Arm) wrote:
> On 10/30/26 11:50, Tal Zussman wrote:
>> On Thu, Aug 06, 2026 at 01:14:38PM +0200, David Hildenbrand (Arm) wrote:
>>> hwpoison code can end up calling min_order_for_split() without holding
>>> the folio lock. There isn't really something that would prevent
>>> concurrent folio split. Consequently folio->mapping can get set to
>>> NULL after checking for "!folio->mapping", and if the compiler
>>> reloads folio->mapping, mapping_min_folio_order() would try to
>>> dereference NULL.
>> 
>> Hi David,
>> 
>> Did this patch ever make it in?
> 
> If you ask this way ... I guess not? :D
> 

:)

> I can see if it still applies and resend + apply.

That would be great, thanks!
