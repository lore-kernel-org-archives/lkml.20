Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49962EA754
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075385; cv=none; b=NxDIVvjSlwrEbIyxEmSQQ4JUbEus8OFZEvosSKMPdpOIMRGgCoLnsl+IWHPAz/vVQm9YeWHZFJu8SeSbUk0/bHWyFr6kEnSzcnXyx8fiA7eKYXAuJnv7gdQWlPVuLToZXjSOxsPcpX3LFHt46jU7re37JiiFK0ji8j8wg4sYRYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075385; c=relaxed/simple;
	bh=tLbfeLUBRz9kckFa/m+pJGTBBECpJriJUZabU7HaqE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2A/vggaLWcKzFCOWa5TI9ilK1YrJ4xSglvVaDyg0vnOxoXicAU5pb3G6gtyhF6/6ZzDoNRdRjMi/jElgmJ7CLWFwiwBvfUfv2PnfKxYli0RcXeaWE+PqGq8BNpQfVUoER0PmzrTWpa2yQ8pccONgWHrGBXRSpn4KPl5AzFYFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9lFjmry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcjR+uWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9lFjmry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcjR+uWI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgGA1955865
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=; b=V9lFjmryGDIEEMKP
	vvEjKem2E+mBiIQd6HfqM2z+NkWa8HGtwJXTXUwtdMXaS/FOSEfqTL0UFBueok4P
	DQFAd2uATooAw1dujFnWWtanKvRy6h8utBlCmCVR7u/V+rjimWTFZo0gASV1T2m/
	44wfIoehgwOv5feAWEp3X21obQdoCUDGZL/mhi5cjeavCGfDxSlG/I7/Bj71KQuN
	n4d1My6BRqlBxOWNgv59keu/hKBVWGaLOb1W7jQxSpSkmItpgx8HTap+5LjOv6Li
	udkS+BkPof84ppA1LIhO31yCAkgVwddsW6djJyChwCoC5n10s9xA4Uo/ND0U97hn
	xqV6tQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeueb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so12632996d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075383; x=1792680183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=CcjR+uWI6PxgvkXAqNRKa/M2S9ZB7Z0zgZ2mYLmhvaAtRPN1jhussYdkkHRC5NlmJh
         aGEchQvmXM0qkEdA1AsNgtSWQvwPuHH/GQ52eVoOREzKIuuixDnyQrbqRxGHyYeCvsrG
         9YYnpaHsI9n2ZcPhIxRGHND6SXKj/okErf6Dk8sQpciCbWVLsy3hu5EKwVcLJBuEVZIk
         Ya98ilEVRH43YDGqcnNUr4ajwPugT5jFOTmRLQkBs8PsWTN/stDSm8QR5FYvSaG55Zsb
         lnrfwbQypPPFWrikktkktXSOkxDI6Qo3FPAMmsFgZ4ZrFDRNBr0DIG6lxVrqHRwHJ4pc
         gCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075383; x=1792680183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=UywAZLYozxArdPvEgNGUAlHQvexDeK0TDOs2qxzhjk1li9r8iL6xxTZIRy7rqjzWfR
         nunj/5qv9ML1oi7GP7ptd635EM651X3TbqcHEmcEkuEtVq59hMz9JvW26npPBcjESsLW
         4ZmZ4sANG9CtcuEN3hlljIej9E7r9QaoqBDRTOrSZIqAcayeaHxe/eBg9kpp7d5pAVQr
         9xRcaNpb9l9hoDcjS63veYrsLqoz2ub3xfifurAAe8kKV1PegyOQQ6S5xFO2HHOa+oFO
         WB1DJzc8y2XnHmNMfC+ORWZyWRT9MxOlhsJyxnO5xysWr2S8KigfjJ+RndUYmB65FbB3
         vtyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx6CjTaHm87kE/cpWWcMbda+yO/eO8Kf88068od4aMpqQ4fV+z0FZ4gSMzZfvldAIbZTlm6q8mZ0s3DOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/XHIyFdnVwVeKaYB713u6bQmR7pouPryiFkf7d2H5kN8yQDI+
	D5ikwzZIdl2dUSc9NDIymeQ6dniCRaVqUExevzQlBlcz2ImAO45Yg6viHwbRGkqxKOgDg5VCeBl
	0vK1qKyjh3H1oQttfDW32+NQCeFGSJEp+MPmMYsue3gygDQ8bZmtlIWfBwywTgErdb4E=
X-Gm-Gg: AYBFou2qBF3YpkS2rK7+WUmT01FDDTOnVaxvHzj2YudyauoOQT1P/eR7hL/1M52qhnN
	do4jDKMy/So1aTY2Dwqv+w+mxcXOFVWOgko0LUxL4J8VhGamVttxr0OE+YY1Gt63A1NKb3jX3WN
	+c/ocHHE882IAhQPxRw6FWDnw4KDoPHAJl+VBkpJh0oPbl42hEYLmabWAA4F42CBm/wu+McAdhc
	Unmm20IT4JHaEIH4o/2Qw5HLBsD/wlUmFZjOUi6ntg1lkOFL7xPya+TVH6OWATZ9qRErJ31yURA
	ofAnMm0zLoahT7TXAmH/hXWLNHZZeKnYmnJR37Ats24CpXsmmz8U1QMDvxFhdZz8QIIjgtD1XvF
	UZ2/JSch/XhXagOmJOlfVag==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533923085a.4.1792075382631;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533917985a.4.1792075382099;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9f3deb1sm134751566b.45.2026.10.15.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:01 -0700 (PDT)
Message-ID: <aa0aa4e3-6541-4cfb-b947-388c62fd4b72@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0e677 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: hk8sH75NxBKwVhpI_iBbDroZO9b2SeoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX8XZU/uSgqVlx
 EM//0Nmqn/8X/xOvd6C7DRfzJge8zGPNABAm1jtlaJZWzwH4Yb3ZOonUUiL402vQPSAihzRXpEl
 M7or7Z8XCDQ9uaKCHlee3pKwd/npv/mrzGkBnlR511Gsy6AcAuYKDNFlxAOMMqRvvl9d0bSQfV1
 YSjca2NmjnkmvLm2kN3Gi3i2wNKgOe99OgA/a8DuV8+vgmszMvLv+I1Dal+yUvYUiGGfapYWVwI
 5Hv7Rfcd9k133dKychITRcvj5IcyFdyOriQpaDKSIqOP6EzEepn77xG0KINBRqSzzsksBE82uif
 NQ7MUcoAuwP6/wWiglFbao8XOO9BwuCQUrzNnPQWcJ7F2SeAzg+9icBAJykH9PGUOyuGm06yThN
 QoRFjdJ22HJT8M4et1zpXXFr8YWhr64ufvUv3956bgIXaEGFTnDza6J1vy7kmpF+sS21gCTXw4K
 byo7t5UmB1BrxueogGA==
X-Proofpoint-GUID: hk8sH75NxBKwVhpI_iBbDroZO9b2SeoV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXwqk0vK5jFcOj
 345jDmH1rwgF8RuCQL1G/st0Qy+wjhuJX8u5UIuAb2ULvnGkUAH9YRk5DNHhchDzQned2hVC1mE
 N3s4X8Agq7Ba+pCpGdjeH0C09rw9cKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	path->np = of_node_get(np);

This changed because the binding now supports both bindings with
eud-path@ children and without them. In the latter case, this np
ends up being the `ports` node

Konrad
