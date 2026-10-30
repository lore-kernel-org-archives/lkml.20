Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394571;
	b=AxXTbyzCXWY+pnNmnkleiYeS7tMmlBnQPOA6yYZ8mOVJxR2GHR4G44Ec6lS7wjB6z3se
	 ZpQnbxTXPvE2nCwYYat40bc3Pr+2O2EzcJAqAj8Hyx+PpDHn3YJ7XhuCwQ8mIEoox6TX2
	 5w6ov6AzdU21I3eYRMcn6Yh8aZU3Cz8Fo1pvy8baZt4v2CXh+9KWiiKuWTfgWkgRlZ98T
	 piYK81uD1r2AlWhLZHllDqGBMzkvRWyuGDlbCyq5XyPJDqxCkfIH0LcVVMjJGSVI88sFF
	 UkAzu6OydraqEz1XjAh0KkXkEBjL0+nip7gkrnTxaq61AlhcmRREeKz22o6oMwU8vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=;
	b=ZlZWKmPIcRJnhxouhgZlkz+DndVilTqy9H+hUta7EvAo9Wxij8NQmmeIrU844mmt6t/M
	 N5e91Tz9vxzT8bxlZeEd9O0tm56I5SEwUzDSI9JKF5pa60Z1fpV3CZ/NV8ZSfhhFIGqHR
	 LQqqQl3jsUfg76oz/TXaM+lrC0hJmJDI6z5RCT+Ir9+8gHAUMcuPtdZs0GeuSjKwGMwYh
	 W78Fkpw6lChFYvMxgKbmHvmpAlppigx2otyS+6UeY8joz6aZAsZ9Me1AC7hED3O3+cqrO
	 RAiDUXBr3rX6G/3ES6wxqP6XrZL0inlvL6JhcZhPeTHTo6VNvb17K0HwGFia72aEkpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CypdlOSS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGvI4Dbi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D139606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D139606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CypdlOSS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGvI4Dbi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhikB487188
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=; b=CypdlOSSajFHnoDj
	0/CsXLC4vGq2TCnPC1nXPvvQHSQL7VAg4TfLDpcT1JVA+2ZlBOj5dSs3+AyD/HpU
	ffuAalABjBiIwk9Vt2sxEsGuyD9363kEKlweElchT6MulJwLn44vyNKxYCuroV6F
	GC9aJx2/zSUjUI+1RL9bkNfej/6NITLxVXvrNTPt3vKAhLhs5OQ7V622HcRN/r9w
	KvilI34xeHRJ5V9OXq7X7AA3RsKYp5L9tGlGZZCqj+UbkfJS/OWsGkgOck1leZIj
	YDlE716cQUB6AwWMnldKmq3AbDMxk0KjhdIaXqQOYQo1jzoLqbRf1SJM3y+JxUpc
	V8kgHg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s70dvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:09:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so1678597eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793394567; x=1793999367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=;
        b=NGvI4Dbi9B2EBfWE8wxN/w0KFPVv7KLJky7V38TOL3EzDaowLFiMK8v/alvQwJWH8u
         f7HoQYgonxZYuUA6C1IP+rls2rghom4mGiqRGl0oimOpfryE3qmmu4LRLNNzXgiuaUrM
         zoIgCDGNv2068wA75Q943mzRT1xKv/OmtFXUkGNtMdbpV50KXaG4aIxSoP9xe/0rxM85
         Tume3gDMAzLetjIK/GxKo/dbwYEim8RhK9k0a6/GuWhWHtekGEzgv1RX8tTIELZwHJZ9
         tO8VpTYsNgLswkX3Ef42Fss1bBJE91W1aEq28UFZ9HalsngB6NAZ+1KP6W30p+/0iHqN
         vgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394567; x=1793999367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=;
        b=D43+ME0r5k5NgSuZFXdNCqAjk2nZwozvvTE+sBVJLV/5fPdxqwUNjSLqkGD+aVy7CU
         tZQTdVAPOF6z4RZHW0weZrf22s4BQ705WBTCaered5UKWLEZgWdB72Vr9Hhmuu3wMqbr
         CebUzRI5KeuY0aE0C2gV7ENYQ6mqLheec/WG+c4JlLnVE7hLNQedzTnlY7Ly9+XrFSsd
         ObkXyydnC2ssJ47I68BgjeluefOYz3QY3tQ3Ulph+G5q+x6DW1SsDAvo+FT+jIQNvrWm
         mgJBZbXMaS+maOJCPeHoPnSa8PNgZEh+Qn33Zm3gvqEPrHdouyXpXWGzVAduCJOKTjlx
         imjg==
X-Gm-Message-State: AFq9FYLHs98TJMuW79n0vthQiCaGxpcORkHRmNZCjMyQSXO+LUwHmk5Y
	yE2m44omHowjLwOGJujCRMphY4dU7jWCCnsU8WBaZSJuCQRaxn2VhTFwOEQ8JN4VH6P8EFh6xT7
	rG5ABqBsQA0SPZX44Q68ue3axAOmjPHatJfNECp+jDATLtlGYfMx2F4GtI3BMWJPIDgY=
X-Gm-Gg: AYBFou0F5XkxJlatx+Ln8Fu+0EvsEVhq01QiZkRBUy7Rrw4nfzX4vHnD2MJl33su5UD
	JYkq/HuxDdo5mzOpdewLBVQDWMBzWx+uw94xrIRcI5AOTSMYwIzficW9n3X0hpf08l+xRoypcQ+
	WbIXhB93foKuVerNLKNUKkVzTpl2XpWuwmN+ols18vzq6UqZlYP/xUWNvpKkuFn0n+GXfYUoYH7
	tBYuvMHN7TydLm0aPChLFtJtNzsVT97KVZRX0kSZdYRhb2u6GJkJ4lnh7IOrlYU47vaCKtrdx0c
	WuxTW2Eym/NMa6WB4FTFXC+2INbsq9hd/jydRG/VAx5VKiJhLx728033KyDAOZUSeTtu6NXoxs5
	xF/Uds7rUbz1Hd94HRDbFHDF8SpEr8NHGM/B/ItbsVoSWRr3jABgARL33OnO00vswtmFpGcaF8j
	LIu4bePCdPG6SCyzd+SVFbk8p0m/U+qTU=
X-Received: by 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr1043566eec.7.1793394566732;
        Fri, 30 Oct 2026 14:09:26 -0700 (PDT)
X-Received: by 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr1043508eec.7.1793394565946;
        Fri, 30 Oct 2026 14:09:25 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm8561611eec.10.2026.10.30.14.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:09:25 -0700 (PDT)
Message-ID: <44bc6f1b-6f04-46ee-8578-caff30ab25e8@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:09:23 -0700
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
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
 <179337193753.3936464.10436179036151297295.robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179337193753.3936464.10436179036151297295.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cooOAF4i c=1 sm=1 tr=0 ts=6ae50787 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8 a=3poil_INJ9H8gjXqE2EA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: Ue7WW5Ub_wOfvJ0_0XayyJtr0xslqfnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX61WJrdCc7Y2s
 3XNK5UWQ9eN8ejYQCkPwC16nixt2hd0qYpdwZwgAYaLGzlVOmmzVVVmnj+H/wTLPwxLYQoXdeyx
 B3Z28kOYBGXFqNJR6IFJlOhBDvMGqZHJYd2BGppKMbYquNzfnn5mWZAXB82rWr+bQQBkepKR52b
 hc0PYpEa6SEmmGtfGzwI+yx3FS2UbwSCunxMHM0m3fuW35rOKJ44BF58onBRMI0C9TquSyQ4GzE
 /UGeHNWyEAopWASvbGK5qlW+Pn9Crhb6eSicOizTctHYn/UBaTJmHxTRimdizsvcEwlE2fDtxd+
 aeYXntcrEfV8jhrFeLGBE82A6C4gRo1iUHwoRb5iSdi+VtR8oWMYXrCbsj0/IcdDUD2I58crdya
 kQPsojc4CIMfwV8j2E6XP5nkFLIop0SKGSInVS4zN1652o1h1vFcDJ2JTQHyHMzrTUtJqaWWPlR
 3/IZzqsGpGcg3iOdIiA==
X-Proofpoint-GUID: Ue7WW5Ub_wOfvJ0_0XayyJtr0xslqfnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX0K+fKx6f8lYt
 E+OeKqdxB3Z5DHyr+qWR0mal9I+d8vGkQnm+GtMAGF+QaQmrygVXLK24W6HYZmsiexRi2ag38MY
 cuugYX/LwC1Ur24oXtz1zX01oKXtMtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300084

On 10/30/2026 7:53 AM, Rob Herring (Arm) wrote:
> 
> On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
>> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>
>> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
>> selecting board-specific calibration data when the device identity alone
>> is ambiguous.
>>
>> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
>> device tree") implemented support for this property in the ath12k
>> driver.
>>
>> WCN7850 can be used in systems where the PCI device ID and machine
>> compatible are identical across product variants, or across regions with
>> different regulations. For regulatory changes, the hardware description
>> does not change, but the vendor-provided calibration data can differ. In
>> that case neither the PCI identity nor the machine compatible can
>> identify the required data, so DT needs an explicit calibration variant.
>>
>> The ath10k, ath11k and ath12k WSI bindings already allow this generic
>> property for the same class of board-data selection. Allow it for
>> WCN7850 PCIe devices as well.
>>
>> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>> ---
>> Changes in v2:
>> - Rebased
>> - Updated commit message
>> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Sorry, not sure why this wasn't showing up for me. You may want to 
> resend it in case it is not in wireless queue.
> 
> Rob

It's in my queue, will pick it up now.

/jeff
