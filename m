Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203676;
	b=v09OZTkWlWMm2+zwe5eGQt6uASSVyWK5ZJYw3lLtVz+QRN82JT3iAOD6tlKX6eOdQgym
	 UvYobWonjuYGJ7a9RslEaclO5ERs1LQ6FkXZP3oJH8wG7mEtlnHBwFexUbKByydrqofQ1
	 7W50QzbAB0hXK2hZnPMEIlnlGuPk7vox6LWEf3Cdj9ZIrVW3r67QYZoelmhFbWaLZtL7U
	 Oi5pTM5fTAdQZSYYJT2K0D4qkQFBdKMqJt4rdYcZELtuzHMgvYCwiBhVqiziLoo4uwZ05
	 asyFrOgnCSgKq8KlNIzpHzVsOzat8aqVqL+s9iFa9hwG8CnzjG6FPRisRtT9CLBx5Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
	b=n13Wp0MzL4meoJmsuxTP5fPlMJQy8HLOaB2LcCsO/6gEdxRDVOkmd95VYoeFI18AcKPO
	 0BqjVmknbORcotJyp47xs6iheipVrOwKj1wyqZpk5pwgSemBezWbopiz0J9XQvbLvs/aY
	 5Qy8nSwT/1M4WPCwHOfcY+5PfIXWoa/W8UV9+DFXkhwVqockh2SaaibU/e2MR9SRYZkdJ
	 7+hP2OItLR0E3QdBRcj1tIZdE+C4f9pawntHwG50Otwx7icwQFkwXcjpQxIObl/2gfyOC
	 VQHdD45ptLF0deOh8DJv3Rt/C11ZTkwEX4O1g8a4vH9MEzdQxd9rTjRO7FSoRKct4yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TptoXtOZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQL1zCXG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B5606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99B5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TptoXtOZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQL1zCXG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5sH1471890
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=; b=TptoXtOZfVkvyWO7
	wT945Yf7V6tV7xhvIzg9p6o9dvNMIU0Je43wh4tEWOslhJ01HL4PKn2SV1PkclKV
	xa8VvtWSnHlG2zNL+AB2ugXA10GJEc2jdtkkvvRMg+XmcGwQl1Phr9MXOXftv3Il
	IBGf/uGcS2Axo+XQaOfPX71j6XsdH4IU4ZXEJEFvC8ZSHfug3obAU8BH2yUmOba8
	cH7VktgX8Ir5dNGmSkZMxvhWciKRpE3Bffb0ME/J6Aa4HtKJLtRhFE++5RVRCONZ
	6n8lhZl5PT0rsQzebFjsaoHXCVmQRXkGgVq36d0Hp3wWo41tsfobHNzIQVugInTh
	WGXDDw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehhc94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:07:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso254765e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793203669; x=1793808469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
        b=fQL1zCXGs4C0dAhnT8Otxvs9L5cl1ehTZPdbZGYIwQgjkywMMWdNpKDgFVetl3oHgV
         u+EXUGL6wlFkmhjgc6IV9Vt29iX/5z5WzEF0ZBDvn2plaflrPezYkcA+DM4whUx23F8Q
         IH7Ppu+susjbFtLiraCc5MiZ64FSYaNgfQOwdWG4shUvzW0HKsza6+PU8hfPfZUU6PAD
         4fPnxzGb67Bmu0L8U1u+QSmfcsDzMwk4JJkDR5j4tXj5Fob606aIT21fTrbKkf+HRbvr
         LkRa7yKwigUdkkTIhxjbOeZyIEcI59s7fONIORCubsLm+sKoD7f6B6CWiRYc2u7cRx1W
         8NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203669; x=1793808469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
        b=YBmPdweD8g7y0JBCSlxlvwGdYAQ5GxNgGgf9P1bcvymTViH4amAWDUnlFmnEofWPQe
         MLcCI+AuGIDuJtmlHzf1nqYhUg+W5CjRak6/C0S0LuVp+M5vSVWz87W40Fg1LzXGhasM
         Jlg6VK1+ER8+8+rFzXT2DIZnrWJaKXPKQ9xKHUYBIyD3vzI7AFVMWaAE35Gnjci7wyxZ
         BWZAh/0tpRk67m+mCxtf5jjoeyl83ihCptNrMGDwcsAI3Ywb3Rg+YiqOzjsRCJiOgq6Q
         1F5e6FNeeL5CzzHpHPW6u/wXoDn45ih7b8q7xYr9FLADI52/c4IjjIWdbE7EOjB1x/rZ
         1l0A==
X-Forwarded-Encrypted: i=1; AKwUvByOFXzMbPBo3USo0icyMIzmO1vyRBz/7qYzKLEV5JefPolWOl7x0lxL/y348pOWgaOtreeI1FC4cyt1OEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIPUQFMYS8mirKyI4WoM7oxwvGtNoiBtMwUyuEYlA2fdohRHvg
	7c0xpvqLQk36Og8vpxWb+RlloaWxKHwFMjcu5nasc20fhUjO+2UKyTWzgroGou7w/I96u11dXR6
	8oeNLEBO7sAPbWTI42VAIpajUg0+VVtO101itmJPij7+YrqkF53tdZNwo0uB9etnAUr8=
X-Gm-Gg: AYBFou1dvZKKE6nwKz6n9UZl4jCMMaVKQFTzeTVkpbqNQ1RVXVeCwEYjB7fh7VH09v0
	/g7kiWs5Ab7NgnhZT/ODx02ViHqhstDKyZXqw59BP1ZyiOiRuWlv/KwELzEIFw35vGNpivNROQu
	AfKvs6gjShvOZxcwbtEzEY83QoDtA7wZsf9e/4VrXmERAoOB3Vbq8yUuSKMjIgcRNTtFGfRW+VI
	ES+bbMMYXkQ7FUgOj8sj7ftPOcJPHkxI1Jovry/8VxJ2tU5uCz9eYQnOKIC1Ro4/TmjWRLbSwkB
	nx0OCC8+bTf4qoKbrHDM0XiUXRt6uznjcZ6OmNXmRlN/TOLd30pDDYNCRc1e94pDUrXhgSiarzX
	AF2BnBdbfxkWRBUMYIhzH1Kl3WtlpL4QKc650gh4nvLy2+bgbkSoQs8mZL9w/wZk3s4m9dHkZbJ
	YbNVLyYaRbiWSghYZmaLBxKlkTBZ8KDnMD
X-Received: by 2002:a05:6122:1351:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ec4cad0b76mr1280451e0c.2.1793203669097;
        Wed, 28 Oct 2026 09:07:49 -0700 (PDT)
X-Received: by 2002:a05:6122:1351:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ec4cad0b76mr1280418e0c.2.1793203668624;
        Wed, 28 Oct 2026 09:07:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:53b:4cdc:b68f:256f? ([2a05:6e02:1041:c10:53b:4cdc:b68f:256f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm27689459f8f.56.2026.10.28.09.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:07:47 -0700 (PDT)
Message-ID: <f054a608-730f-4415-87ef-510523a50ac5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:07:46 +0100
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
Subject: Re: [PATCH] dt-bindings: thermal: Drop thermal zone node name length
 limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261026094956.2323036-1-daniel.lezcano@oss.qualcomm.com>
 <20261028-worthy-prudent-cuckoo-d5ed97@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261028-worthy-prudent-cuckoo-d5ed97@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfX4jWq9vzAPjdH
 Y5CCa8kOCkT5ix13QqJd4I8GGloTVvwnqWtEQDXh1tIaCOya5LEOuADL2Li5Z8O/eaLNCPIBnZe
 NJ0Rv0EDLfK+8oVc/iLcUyt/nqMqJlrDcuRvmEMp6qp9RfrSx3D03Sky0xV+Th4huRo/YC6dDXK
 JsWeEA/sI4sWxd0hqNlR7ANDmj1Fg9IY97zP29c2OHGbJu2TL5rZpJ7HhceKXhU0H7kovXwbg2o
 oP8zKFHZynEabhS3V6qEEO1KLkbqezT/twvbmP5JIB0F7dUkEICK2LrSuie7tJqMYEjzGvWbgUE
 q5pimFSRH/BwlSzUeTtJUiD93TNKTnqXhW3fwUoC3ctXH9COmKyHJMMWp+u62I++5eYd2NVfmqZ
 TkQlg3lSOfDn3Iq2mP2hD2UN9WXELZhTKnZNF/BtzSRIKmoznbLL6W4Vw/t6BfGZ8QU/VLM2F1k
 kw7bF1sIcXITCBXIGeA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae21dd5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=vV7VIxlxivoAVXJuJQcA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: dFSJCfGC81bLANRYU5OOf_UAKDc9c1us
X-Proofpoint-GUID: dFSJCfGC81bLANRYU5OOf_UAKDc9c1us
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfX8TUdqKBXfXQP
 7WREkzynZv/uxOUexdZxKqrnhLGB8AHf//7AbE/hIZPjOl0Gb3abNWO4m0Z3iUvz1YMwJTiJMKj
 bkttNCRWvSItwj5LHS4KrYOjQhdOO54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280064

On 10/28/26 14:00, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 10:49:56AM +0100, Daniel Lezcano wrote:
>> Device Tree bindings describe hardware and must remain OS-agnostic.
> 
> DTS describes hardware. Bindings describe the ABI between hardware and
> software, so if SW requires something regarding the DTS, should be
> placed in the binding as well, IMO.
That's odd, if the Linux kernel changes the thermal zone name length to 
something else, then that impacts the bindings, no ?

I don't see a good reason why the node name must be limited by Linux.
