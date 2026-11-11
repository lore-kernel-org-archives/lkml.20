Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386217;
	b=vWI7ZHC/wOEBkt9LiB2Y0TTwTb+MEhq84UgXjjaT10heGfucshz5fEqpXve35pViyXsi
	 aFrvbYbbtwhsOj+XnbMOJ5SEYPxDXTtJ3rcfZhmIZYHw5OH6sdmDVAvCiG/GDeQ28eUFV
	 ALCUF4NNZWDgCF2DYiz2d4kgCKnrt7ZRFq8ZH0bRWFqQPvEX54WvBdogxzaR7Hiiip6mx
	 t4t8yRMggmyWYRz5g9gWOlfGIf/ziVEP0VrJfTY8xbqdgUPtFaHjHQgOANqFrJ1mnqmW7
	 I0q4tN2LtbrDz4YrL9Xc6TElccQhQyhB7FBb+npgmMpCtT7bMkXN0sLMcdhqCV9S5Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
	b=0t0lMouFDyd4KcUrfnjBK/FwAMSR4UdtiqmvXLQKthOhrVZk4SnypO8W0Xlpb9uqkDgE
	 IYL6FazVnWU1OMzn+tkynGvtOB+Dy5C3bedYM+xZ/wLc6YJpDVRfuJWhE/3PFeKBWVBCz
	 BynxyBtazhzkVnoFifj4VTMwUYVmNS1UQX8Qz8MV5uZriQ6xU33va7tn3/+6IFLEedoaz
	 UArkXP5xcqwhqWF857MOnM80NaahFxooBkMWHtr/dt0dBm5LWhnDGwKeUGzQIj9jsvGR4
	 2nMuGwwRNHuy4QIp/6lAAn/gYZClCLAVyHHL6CEzCkWfPXjmpYR8gnvU7ZH0Xnr/h7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5490606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5490606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KD55863476
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=; b=I+e347Nr8kQrrMhv
	CdfUv6n7OT4zzKr7jAN3iOK26iVfN75BV9KR1z7u7uGfVenCJO59oapm173a/luI
	FfEj0V+4oofjcwJOFv9O7cqlijPcNIkwJwuwLq41hPyBL8b3URmI9aHmW1hXxow1
	pES6YA8Bj6K6bnMsGxxnzWUVtBLt2hZ+vwfQu+Q3cO4CxgCDUzJu4yrKusReoKMF
	yZP4jfl6e2S+RG/P/JE0R2xfKRBLskX4iRc4GywP3a1zaD3S8VYrnr/YiBk923yU
	Snk0zTGuv2dVU1nUwUV89T6DtqnY58TXLkiGrWDgW+od5O3uvJHpxRqAOt9KQJDP
	CW4f9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh9kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:36:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so5132132eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386215; x=1794991015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=bZKIdUQrK+UAyPNLzL5I4Iw7Q0TZ31Q+0VsEmK65H9eI16NLb3JCf3yBrTqEnC+gKF
         PC5YW4nr2xtx42rUIvruqduNL9LgNkTfKDLdbGy7mAOl6OgyEZdTJ99Dj8pgMEOIgUDx
         /cevxc2L5+eTBPN6VieVKWXPc5Qh0K0HEYVETchtSzo7GzcZUtwWz9BvkV4EonJsgVfl
         A3l+WNIqckiEnuFIJING5ngg1MirhgEwhkAqYUhtYvdUUtPjxPnKorlQYM/mWQQy2tjG
         ZFUD8348s6xzC8+GLRZ5pmDQ2Iz79dDxJClNTfUSSuBgPlvnHQc0lfRfp22rz7VHnggw
         Qz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386215; x=1794991015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=IYUXY7f/OZCTyiI44Q1VYu8hUuMdGEoroN+uMPlcpe7cFc/FDuXbmQivGItXvXfQb+
         nGKMLSPORRQlR1xTZyyTh5BIDpGcwH6fOwF7KxKXkYWZfFmNp4hvU3bV2UTpFNHLXjkQ
         Bpo+eBhdosmP29BHqRDF8SLCWqfMm+QKBghgW5SWR8ont+S9hhP/opB40M6QGK0wxp5e
         T3qcUqAUO+4lpPjhcRrpSZNCjO7nXZedrj6eGwhmLdzN/xcn47JeGq/QDUqUXsdF13xA
         p7pUh0Sse2wemfDa7yQww6QtQfvIVGcelD+wxB7WvPOY47ITOh52EBOHRjj/39VwOYYL
         9rzA==
X-Forwarded-Encrypted: i=1; AL+hErGKZldt9UI8vCdsPMtZFD6HZn5b131UcoDRWg9HmXetSyHCRUBvMKaNI/d3aR9IwL2T4V2XImwxXDWVCp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wqlz/Jy83Xu8X8hB9JePmZKCRidCQJkz0Q30B7aadAaUNd3Hq
	26I5d7XJDVRDiELcu3/mscKsk2+vrpZcGusz19+qpxFRSdgc6WFMfHq5j+SvqjiMHJ6Qzs1+adf
	WT+YzMVHH3HPMWyuAASHOiGxMN097nlPZ1ce4t+xFhcPjwXtoAW2YogFDJabSG5Y+yF4=
X-Gm-Gg: AYBFou0jDL87S99D/lquSVZQwQr9TyVUlJjlvOECzKasNF4rWFoCf15He33rNZCQXeW
	1yhNx3o6KFj3NlxnJaqvQIbrVuDrNUMsc8AhNfrAUQcokyaMWmMutAPewVE9Mo8jiPhiGzkcNAG
	F3aRbfxodfQOG+F9ZUbz6xA9EufnNyAOCyPeSG3q/5ku21tFUoiTQ9JpvKYVvAMCQvR4e4TrRcE
	fTUqYL3ZmDh7IP8Td+kZoIyNYoXnrVW+4IeFRhuF9f1NSs/la4TQptrTK3FwHkFhuJjF8cJSvSB
	pQENzE03JjaANNp7BzCM2hXeqMd5VhDTNPkk5PVjwzAx8ug8YAdlK7FMMPnVbujm1HUzfoBFfRu
	jWjLZyrlHIlMcEb3TKpLgZtscFu6UwxQmxjcj7miMb+2gdhqeNqOdn8q4FytV7vzMGcKFc5CypA
	R+c6A=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370142eec.5.1794386215157;
        Wed, 11 Nov 2026 00:36:55 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370118eec.5.1794386214630;
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14498936eec.7.2026.11.11.00.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Message-ID: <a723688d-5a23-4ab5-8cee-bd4b6dfd8aa8@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:06:51 +0530
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
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
 <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXypqBTgVbToV4
 I7rhesSHZ70ujvukM3vkClIaypLMiDz4M4JG8QZ4Gml4mGCYR5kdRbjxTHa5+5X1AUwBKc6lhiu
 xY3eZpIxXadu6751B3tw7WrMmdPMz7k=
X-Proofpoint-ORIG-GUID: iG8V5mDuBd5NYkX95HS-a4tbgtuL5tv8
X-Proofpoint-GUID: iG8V5mDuBd5NYkX95HS-a4tbgtuL5tv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX3UXy5Molq+71
 gEYh6r2rnSAsCwV3ForNuLm3mlbV7IgIzoaPC3iMljel0YMcYf5QHRdwqhFK267P7CixCUhu4tJ
 fhjsFIU6OTJ1UM4D+aaOWYyQL/MGDoN8QB/WjjPqjf8lF+O2YdJ5Wbq4ib65ZaaBLTNfFxI0bXn
 fwju/QKt7Gjnj5Fmfin/xINlgNWZl8nrWLC3dXK0YJ55smJe2cduE3GkkOoUNYaDSZtpNpMIjop
 8kqxqL5h//+mbQ7okZWVYxncbIWS7mAuqlmLtXkXCvgj9X0yslNqxJCNdfYzmfEmN4rYxtZSYrU
 TK9oBX+j1NDUpFVKjyJnO3CnYk9JXz6CGqEQ8wZsReFNsbqhYNTrBrDErNnk3ZAAvZY7FBLwJoX
 brY3sapEw6sCRHPdDk7ynapM9lPICF/DBKY08sNp03LWtVFLkC5pXJ+eUgiGEXGKSSuJdZvu18i
 M1JkIymJI7c/1zVi9ow==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af42927 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qPl2DjZev0XnbMKBJ24A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 03-11-2026 19:49, Daniel Pereira wrote:
> On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
> Hi Ekansh,
> 
> The document reads well. I only have a few wording and consistency nits:
> 
>> +The driver binds to the device-tree nodes described by
> 
> The kernel documentation spells it "devicetree" (no hyphen). The same
> applies to the other "device-tree" occurrences in the file.
> 
>> +4. **Context banks** (``qda_cb``): creates a platform device for each
>> ...
>> + They are created before the accel device is registered
> 
> "They" is ambiguous here (the platform devices or the context banks).
> Consider naming the subject.
Thanks, will fix these.

> 
> Thanks,
> Daniel

