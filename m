Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269441;
	b=DMgZTYDo/5aoGHSm7e3TfjyNk/dPNdGZeJz1rdv6W4xLYJPlrxXzgs8X2vIugn1L69I+
	 6BpMffM91U70t6qvQWadxviOzPkp8TBqNRcVP144yUqPzlK7AU8zSXj5AH5k/qARzfaLg
	 fFyvM89tsGGYINWZ018byErrb4TiFAZfURek3DupBdL/eoCwZmgt5jbUTdaeZTBMG7kO3
	 /T2fUXFYMOgduidmx4rGAmsFTpcP2u/UL+bER2IlKQpk2quxVzOpfhJkOLscoeug578et
	 0WYPrzNLyeZlxpCxDshj6eUR1lqT8N3obcC5aWatc3/1j/rIvdG4ZHvFZG63djHEeHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
	b=BqvoBfT/kjVz0m1Tnf9kI3KyW6Ob05jYYmDiWxQCmfNUnkh4ES0oDlla372/1R0K1t5o
	 e1G/lDP5Hm18vzUX59+TVxCs23HHc+QKf/Gauw7ScQz5NjJXZ+0uxQi4G8m0ZkqHawmcL
	 01E/FIFRB1zLs5SLO8o6BkQtZ6NZJoIGCzmMTJUtA76UufMWZwY+IklOJGhZlc+e3e50O
	 0ItC60DUT8l5bT9wF3vdKSImCvggfKoekLXzFI7wbfbdjAXhyL7tntc37X0insrSBZaPp
	 xh5u2wb/Sw+pf6tsnm6CLSTDQKdGqAtrDF+zQY8/FZtkLsxU3cUSg079qYGzHcDXz8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CR+jw9IK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsBvD7Ew;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF809606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF809606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CR+jw9IK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsBvD7Ew
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jpH3607046
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3jMmmstpkrevEgYUZTyeGz93
	R6TCogBufcXjsgslU68=; b=CR+jw9IKD8EvIIAOhBteoElscKIOWIfZ5np7FCjz
	ZwGrfTXKkp/KbFTepG/F/6pbw2dCYuUTenFxBavW/t0UqbI4DPzgpU08ITwpHE9I
	vtRCkDk77kqubMta6GOEN7sj0JIe1cAakJSzlv6JvvRf6LMToswOlJIJFPspJTF+
	i0X8O2OJvXKaqDwfOuPo+LSvqmZ+VLmiJOkDQ67bLLR+vs9ZpNVeGUJsk/5uxrpl
	bwRK/b50n1tObp7F2uba2Ce7P1K0aDQfw178cYRtmSLSVBHKjDd/wDZbPPYHHA4P
	aZzUeP9WcI/jal/eiFFP5VqvmegsiosLFlCf91WfczXnGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg2b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so400932185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269439; x=1793874239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=RsBvD7EwzM3faihsTviiqWjI2Am0g1HHWB020McugFXvfdwJ3fvR2MbhsGf15mx3KV
         uXe36StxuIK7o3wXsNWHfUM307id8oeradrAuYRDZueVZPbngTKotdEI/oHhwHy68heU
         qTwD/3ToOsaIk2JeVzL5WiD0iEerPrqti78GlBiDUSnYyGxoq7ecsb/z4Zj4j4LGlXhZ
         q+iA4JnsiP54W8jrJOiG76AbuS62ztgcfPiYBUHnHdLS/X5DDX5h1d710GySDy3bQzKV
         rMr9ocqgGantr6CODiksUKsZMOjPZxf9pYmr1p3C1Gm3jhdKwUVCv7dg8N8hMHLdOaWO
         7pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269439; x=1793874239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jMmmstpkrevEgYUZTyeGz93R6TCogBufcXjsgslU68=;
        b=OjX64YCWiHMTeo7P39Yar7Fn1oYRY9neScg0g/h3qwmJfZmpB2R9XRE4UuGy4cMSMQ
         UvVDrPKG00xtzZSfs6TNvNSKXyFkyEffXIF7livpcXYkxwdk9Se0hF2huNU59vRSRkd+
         rcO2LH7+RRkYh1+6PncJKwag/EUEZXwUGFrX/1GEkiqTj+RCH70yxB0IFYDLRZtDD94q
         0bwnK646yPPAAXDo2p7AGw27eS++Fd1vq6ag/xapjFAcMpF8YPjkecvBE9/hQmasncgz
         Zn56tzut2U+ZmKNI0xUqtP2tM4OGSDB6AdRKcjrcITRduppG2BBbfsNtDS2Rvlf2NZlU
         Ot7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdIQiBwAnMdypBJkTHeFrSPNItQvi5Z+6mHq7EcQVyUandNOuqKfmrR1prKJx9h7Eo0SpmPQQRJ+35yis=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtCtMyBOa1KycE0c9Rclq1kKa/cdWJpDOqvvLLZPW+i5YzjKZN
	oWfkMh/AfU/CGlP4hdeZ2FqH2v4D35s+yQLTR2gzQWqlL7oUBxYvBMPafzgP72qs+VHpRXUbwRx
	+IcvmsHb+pavDamsur9LqCGKsQKAQKcFTrg5W4IHFGaz6sC3vMs+9+Sx3//IWRX+4voU=
X-Gm-Gg: AYBFou2A+MZPR+fUN8IB7S7CH/PZdKIFpBDYcycpIrPygdCKOc4zDyjCxGGCOSW7RlR
	YHTMajdb2TBEp2peWuOfNAlpxDD1UxwuhN6pqRRlnQehjeyw/ILb9Z40KZb+Hp0A1dOjUiGSZZ2
	QhTS8UT2hnfu8h0pJHVRVgzuXlUtWVTGlD4bwisMMaP9X1AOZU+xCnA4LgHEt3DWIS4rDWxfj37
	5ILJQiqsnUMYxogNpnGOiFY3aH5qv6RETy6/jdbTswa8g7nnIuXyLYkmllYayibCUAEz+KnID2c
	7gQCPzN84mRDcS7XDFeb29nok8cR9SpFnZrpNFXAvCmA+6YQ6U8Ibdl+3TOBCy/At9xe+IuSIPC
	BEJNuJ0kaUl781SZeN0wD777jE/n3wpWsK1eU6H1VnoRnredsgljEXLdrKjakWRT6
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730113185a.25.1793269438965;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:93f:2b65:f47 with SMTP id af79cd13be357-94408cb5c69mr730109985a.25.1793269438371;
        Thu, 29 Oct 2026 03:23:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm12399755e9.12.2026.10.29.03.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Message-ID: <337wsyqgnma3l6xi3xarj3ed5wwxweuf45vq3k64igjgufszlj@gnb4zg3j27ml>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX/2ttPbei6SQv
 +k9ICqm6c/lGQM/EiFyo0FsVwDfucfxRC/HJGmZwyRu6ZNk8+E5A8XEnuRWlQZQXbxcmHDc2b3L
 GURbkiZ8RhX8S+KidUGBvSBR0n7DTB/O76EN1uhFXaw8wi28sDDLHpd22SPkBrtglyLEBpsatk5
 B1qavQ/5bWZe/sQVJUnt9/A8YDZkg5Y0qA4NOaoPeb+YzHjyZ4T67TP+hAa4yzbLS1MSJ6E4Vx9
 iXZPfcMnvBDXYPbFk0BjxfHqBNBlwQci2IV5xkvN5PFkmLhB1GuuGp2liW6aIxg4RXREmuKQv+5
 k5F2tqo8wOb8i0p+LaGE/Om1BFx82Mzv72uypVXS+Cw0LeEWj3nXxiO0/47g4cU5H0ntPSmqxQ+
 vs8c4GaKC1R7Mlxl3Y7NGp0NtRnxzo/n7uFImrmAmTp3JdVMr/CC7zSfd2OQXLoIIOT4392TN9i
 pVfvptseksbwdgYg+aA==
X-Proofpoint-GUID: WHKINYOfJUA1INMz3pdpw051zgWeQUck
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXzMikQNsYcGMS
 gLpNQ1JnRQZetQNRDqBpZAU4cFpbJhAWki0Nr3Bjh5Inm043kkfhm86nOjaLDHK557hsteS1kEJ
 Z+K409cY+Td0wUakpP7e6bUThSF7Nhs=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae31ebf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=shUxFSsEnBkLoNWfsCEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WHKINYOfJUA1INMz3pdpw051zgWeQUck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:02, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
