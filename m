Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584420;
	b=tXIq6jiQioZghkLNsmq9GCMuC1F3Ljz3hZRImu5uvJu9w/kd9wMxMZPIhmDT19JSaJUw
	 xH1Q1J8icRrzZMnksgOzVSDETUhKCCmXJY//RFJgAHVAnN14mDZcoEGW6HojCtNaPgtlB
	 EY0dB4lJC85kpEl1L2DFR/y3NReCd5v6/l9EbLwabcSQWcmpA63YYfcf03OZX5iiizvVw
	 jJSlTI0143e4ZCaRtdagT9kSWsCX4XsyPx3N9NcuWbGGo7vOs5lf28kpjIZE4GjkDL08d
	 P78SvE8/14oWTM9XYq4zG1pHwJmo641mGd+fKL/6mgMPbS0njQ1yHQiDRV2cGWQzmIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
	b=ng7tcrxNbyNsyXTyUKUM2nmN8vyXg4bODNdPZzjjVHMJR+OXP22EdQgekMQfYzKjjUyw
	 CWjSLi0P+wc+KHMbQ3XyTEycRVbYilp4aLjNh88bRKLIkNVfarAGN6iupxbpR3wYgItUm
	 njiRnmU5/PQoYesMPyLupjSZR04dqTGmyYnDaRtMocKxNngjJU5wk0l/NDlHQ4iBQ1pcX
	 tBO2xmM+Rtmw0l/9bw2AFcqVcI75qbpL8nOCw5n/4Tn40O8aNJKn0yaiGpyF4k/ujlECr
	 XrCUy6lf/DTN9h+k9S4Q4GQk9Ccdh3H1HIC3NQwaFjroYi9eY1inAA8vRSEMeMuekNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MD23HlaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+SavxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36D606A332
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE36D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MD23HlaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+SavxI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgA5i977441
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGOHFGwXEplUcb5J2jf7Cstz
	oMTcJdUqxlOWwgjcfJE=; b=MD23HlaDSVQb49QWUaSge6Fsr+jj2y8+s4uZ5ofs
	wdbea/3wkM2RVtLU8ZARM953neSDhgXReXlI6ZjvbERyRs+Y6Ev1vsDp8sLEenJx
	ViDx0iH1+PEOdk0erc9LMdsZBkW4nRUqGJpi3qqGiYyiY1LjAjV2rNYFs+jR/QsN
	E+9isTxvVKTWb3gHbaVlWclR40BB7VdWVFeM0502wlV2ZKQduqDsHppGENmYXRKd
	WgUBl99H0Bqm6WsiC57D4KcEu29Lx3xEP8lZiS7a7H2QSnibQTpTDeo1bxqcN12e
	LqPZCMAt9rSRfLyVM/7DHosezOfsGsCWeL90xCXAEtnTaQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs030kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:06:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc694cb4adso56741137.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584418; x=1793189218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
        b=ib+SavxIsSkR6+u2Y6xJGg0Prs6vWOnTRf47oqznSK9ZYcrVSiWN3MCEblUxh3fqaL
         7viLgBrUkG8r0HVlWMQ30Etlvl30X6EaTvuIN9FferRQxAADErN5IUH2qoAy4D3SKgFq
         R3d91/QIXHFJM8Sy/NF/r3/rvbDWWlLVrVWNyYhB/j/VnmVv3VtdX/d4eyf/RFWD8gNh
         HnjGnIkN5GYFcMnF49+viDkDbiNAdS9cXDTUK5yuDp8idvjkBQaymALZzV7i6OmjYg6Z
         eVDtSBUnnyOHGY1onTRU0TFCVWl0iyGiEoiqzFchkSzfCwNT++CMihteQUSXni3OSlOk
         nZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584418; x=1793189218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGOHFGwXEplUcb5J2jf7CstzoMTcJdUqxlOWwgjcfJE=;
        b=CDYkmI40az8A9b6kadlHJ3nu2rhrCQr4BxIQOsTMj0M9jBdnA2faoOqkD4jyHDB2mJ
         2n5oY7m30gqTwWJpYJqoN84/CwZmqB8Yl2j7i6gb/l887SZ7UIGhxA0aFKTWiEDepJzD
         ciAQz8Eo9GgbuZOBQF5QYkaHMZEx9QiHl0jAn1YgBg8YeqLrr155dK8fPpMHQJL8qHJ2
         zAR0u6TeHKSiSIdBtXPDRANTEqyo+wBTskRjI7+zQunN2zHRWx41BcclUqBo4FUHlIDz
         cdGx0OxWyo5Q8KvP/Zqc2B1Yh24hJlnsTJyvjZbk2wXJpPYWDNjAMIKKarU1dkCl0qBk
         +Khg==
X-Forwarded-Encrypted: i=1; AKwUvByLwytdLdvzCtchmhyulH0uhUNizhmnOFhBuW5WUgOn3ZewcFQ0HtXBNgzND18TbFxsBL5SDA6NNSBL1XM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJILZYLkVgvwiTuiiBGYrRHlX4CKPkfHmkFMSsmBDbz6AcVfUyP
	bFjB41TNDTJkElT8cKHv4282x15w3zoddTrO2Htmb47nXZRlt0Bo5fXYhYt47dAiJe4jssyJ9+w
	ODzUHZmbckJhxCSZCX+LNiy669ynxjzrpaNClFXNfLRLdIgJxow/d9exxE4kTXLCBghI=
X-Gm-Gg: AYBFou1nKmc6IL4c6zlpqyKOP5/Th0KL/0IVYrCpRv61YeMsHviBs4ztvpDPi/KfVOu
	IHDYvXfRNOXmgsFnnIBd8pYT/6coURuE5y2SDym4+sVMe/Fu/YZkDUNBNIVYOPAYiWApxDHILYk
	qlGOFQdMHV239034UTzPY9DrR+d9dESoLPQHjbVR3IeSoKZl6AGpVEp/n3Dm525JBJxVZy9TQ07
	W0oshji55v+FHl/ZimUQbTHq7Kscx8qrly808TxohuPSTgYrHYOp/2yXw2vInUJqAcsqljb4FRg
	aq/eJtKhebBIGABn8yKNrX7W1io6LUL8lqH2+O6P5iI/MPxKaFZWmv79m+eBTNcchQAlM1z2qcY
	Hu3JcRdMraPm91V6n
X-Received: by 2002:a05:6102:2b85:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7cc92682ea5mr523964137.19.1792584417377;
        Wed, 21 Oct 2026 05:06:57 -0700 (PDT)
X-Received: by 2002:a05:6102:2b85:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7cc92682ea5mr523951137.19.1792584416773;
        Wed, 21 Oct 2026 05:06:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb80e859sm76955785e9.4.2026.10.21.05.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:06:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:06:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <crcwoq7atn7pkwt7cryixquqydyxtqezphq4cpq3cokxuxmkcu@axzmbxzf2mwg>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
 <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
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
In-Reply-To: <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8aae2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NRCdo2LqAGfow365lYEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX0Ht8Avu5q19a
 NzeKIurHj6vxm/Y4D9k6nrNtPVRmkIsqAFQ0T7WNvbch0RyvXO+s4c4zEKp0KONM0VX8A0OfMC8
 ltBEcRwgk3wVYxdr5tf1yYWE69K2uruXijdbt+Fit3+V8HIperR4zrStOPxr0SoV1jEp/tqeek5
 vpuaslWI2RbLcH0xaUANZA/8NgJ0mlI/iVggq6W3WiiEzFE022fFJS7X0xYPd2j7DpfMNNE+tbq
 2MZbAZg8jiMtqoa63/Sb7TKqGotklmRbVro4doaZjJE1K6J5SlB9YyiU6PjoXGHurOG/L+uA37p
 GzDHL9vfsdBFknRgZscoTvma+ASXz/m8cJ6+bXL3NERnBIz7TcqpL3z/wlQiwbrfa85N+daSoZt
 CeG5S+kb1SCsRNSEQ+ao8Si7O82RVz09jcBMaXikRl2DzWXzWWEY0LymHaUoREPb3iISJk32+mJ
 1M6gSNUxcDjVe23/EAw==
X-Proofpoint-ORIG-GUID: rPE6-T49OiE9mlu9O1Gh6xGaYOh7ppS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX913rB3JTTqm2
 wGa/Gf+5rYXzipDKQpz0d+rmdjEQ4wdCaFhfS2RK7YIMLYvwIZAMXKPzTE8Ox35pLxzj1ARKkdv
 wHJRtFcps8aPsQ4NAuS2AMUzGcmSzDU=
X-Proofpoint-GUID: rPE6-T49OiE9mlu9O1Gh6xGaYOh7ppS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 26-10-21 17:12:11, Gaurav Kohli wrote:
> 
> 
> On 10/20/2026 6:26 PM, Abel Vesa wrote:
> > On 26-10-19 20:03:47, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
> > > > On 9/25/26 12:24 PM, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 9/25/2026 3:13 PM, Abel Vesa wrote:
> > > > > > On 26-09-24 19:52:32, Gaurav Kohli wrote:
> > > > > > > Shikra firmware handles CPU thermal mitigation up to 117 C, while
> > > > > > > Linux CPU critical trips trigger at 115 C. This can shut the system
> > > > > > > down before firmware reaches the end of its mitigation range.
> > > > > > > 
> > > > > > > Drop the critical trips from the CPU thermal zones and leave the hot
> > > > > > > trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> > > > > > 
> > > > > > I thought that was the whole point of having the critical trips set to
> > > > > > 115 C, so that the kernel can gracefully shut down before firmware cuts
> > > > > > it off.
> > > > > > 
> > > > > > What happens if CPU gets to 117 C and the critical trips are removed?
> > > > > > How will firmware thermal mitigation handle it?
> > > > > 
> > > > > Thanks Abel for review.
> > > > > 
> > > > > For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
> > > > 
> > > > Does the hardware mitigation just pull the plug, or does it signal
> > > > to the OS that it's about to? We absolutely need the OS to be aware,
> > > > so that e.g. the filesystem will be synced.
> > > 
> > > Thanks Konrad for the review.
> > > 
> > > The OS is not notified before the final HW shutdown at 120 C. There is also
> > > no useful margin for a Linux critical trip here, firmware/HW mitigation
> > > starts at 115/117 C and hw shutdown is at 120.
> > > 
> > > So 115 C overlaps with firmware mitigation, while placing it higher is
> > > too close to HW shutdown to be useful.
> > 
> > But having the 115 C one will allow the kernel to take all the necessary
> > steps to bring the system down gracefully, while relying solely on the
> > firmware will just kill the system before kernel can do anything.
> 
> Thanks Abel for the review.
> 
> On this target, 115/117 C firmware mitigation is throttling/prevention, not
> shutdown. The final HW shutdown threshold is 120 C.
> 
> The 115 C Linux critical trip therefore starts shutdown exactly when
> firmware mitigation begins. Moving it higher also leaves too little margin
> before 120 C.
> 
> So this patch drops only the CPU critical trips. Would you prefer keeping a
> Linux critical trip at 118 C ?

Yes. Again, we don't want the firmware to crash the system before kernel
has a chance to bring it down gracefully.

But how does the firmware mitigation (throttling/prevention) is done?
Shouldn't kernel be aware of such thing ?
