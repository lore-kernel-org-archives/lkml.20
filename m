Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C713E49C0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177793; cv=none; b=XAelkujQQMMR8Qc/nd0P1KeTN4yQPbd4sgfyQUgeMpZxt2R/wEo6qL7/YWfHnU0zk5foKBOoFJZu8S6lUS9VcC42tdzd1LBgAQOgSiMu/eeQ7xTyH8Hjsu3da4Inrjo+0pA1eUZY39QNr/LTIaydaVHWkruqEjvfIo5agfh9xFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177793; c=relaxed/simple;
	bh=BLdIX4JmDDmCb/nESqUPLgpc5EXO7M0X8FYZInOGzg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoExB3GVMqfDtaPekX673qqQ/pwBIFSomwXyU5cGwJ3FBiVzFfY7FwaxZ0Ch6dG5om8MqGPoNIvwBldWFh2h1vY1DM99SqJtcHLSi817uohcuHvhYqM8LQqYYfPhg6Akx0yRFpUQbGI+uTdbFLrYxnN66fFZC8kcjDW5D39CaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JY0HZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3r7YiXf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JY0HZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3r7YiXf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA1to320715
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=; b=b/JY0HZc7fjI2rEe
	xT3mbk9004ZfT32oo+urk6xdI7RATR9xcI0wgQLl82QLpzA8zl7cpVtqQ5f799C9
	pxJ2hQEG1vSTmAZ9SQa5u3DXe3+FzIJcYNPDxeIgydSaKuWiBhOQTCwtxRrj9Vmf
	WgmJxdo5AHnhCSabGjqeNI0o2znqkVYhNMA3ywSmpY/S2jRULCyBqO09h7iSDHhP
	a76RBS12vGNad3+zoDCPXXuJAbCiqUFcHHMHrCfrAidLlDeoba9YDvULFKTRX939
	TlhDfjn6Jn8iHNjknuFDNApafSGuRf4PdQMZB1tE0TiDiWvq4Gva/sjnJF5gmRfr
	uxtmUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvr6kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:03:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53002215979so4810971cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788177790; x=1788782590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=c3r7YiXfOKevrDU0klJO+0I5mnuVbJZot9ojdU56PxXeO2yIS6kPL8YU8oxQPJt6rR
         fVypCb+FLGTNMuLA1VaXP7FCRZdi3kvc9cLZpkmJ7w7TnBIiqmXKSukjKOo9u0hOmVud
         7Y24cZ8PE3JapXapJ0h7Ir2WFzB2Bw0kIWOobn8RKF+AKXPymyWUI92gNk5qtW3NZBuR
         /G299Hr0wUcrOM1rHVb1ewHoswHXcK+aczEotzLJiKVi+Kj+RdDscKiEsE1/l6QBN05+
         RCB4dDmxLbX4DhUhXkO/nBLnMyMSE4qhY+R+XpZmkifIKIR1aFaNhsfLhfgQzesty4Ar
         WhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177790; x=1788782590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=fFm75NU/e4nYRx7lJfLWlYlB6sqI0XJwNYs41U9NNrCs/pjVQvSOHORp7GJvID5UwN
         2E4Q07X8aCAqYeXRUXFhqcK0P+MoKU9pwSostxtjunmzPrmgzDjwoJ/XloCIc91KL/Ne
         TNnGiRFWrf8y13JTmZVUBqUMDFFcwhlokfOKrKOE/2iA3uLgpXZOTqK5pdPyRAt7Y4Vu
         fDWPniNmBZYsNz5QdsHy9X3EHsnIGsFtRxGeZ8Muaxh0EJTLMXLr3zetcOLj7CQq4tHh
         c1Kbi8lGcdQyFOoYk/XN+T75srrjaaghwnZ9zhRyALJevKDao69cmgfLT6F63+5VkrUQ
         m1Vg==
X-Forwarded-Encrypted: i=1; AHgh+RpQFFtIVzZq7gLnrRgLLP8onaD5Xtn2wwtTlYOw512HK4L+lHkshCQ2yetuiTkYz0/krO0iOroKAE6T9ps=@vger.kernel.org
X-Gm-Message-State: AFuF++nhYPYSU09z3G87xXKq/3tIMJ5eBERzHYvNtfbeRbyerkIIVylu
	qK6mNCQmRT4dS/i7io0A2xs3Yg4+x3pzZqfcZJlrguKdate2PBKxXRnwrIjeD8OTUHCKpZa10Eu
	nk8XEsVWQR8vjxx2zT5HPCDoQ6/NK342+wBT8l8pTYyM2uvBxQGquAnoAFTFdCz+7IjU=
X-Gm-Gg: AR+sD12qrt6b/rXyua2LOwVa84/OLzCpqANfFrnfC3hZzQD+2LDBDiiBv1Rducdl9N0
	/Pa3IYAd3YUDKKpPjk4XbXE9E+7UgER8RL+0PtOTYdETkQtWxUd6xb5Lp8Raf4UZlQFEnvShrZw
	ZXyOtE79/XGq5JPVYKeeLI3B0nau3cvIjOEnD3b081TV/2lbpfxrc0TSVF9o7vS78UyG2UZEtW0
	XDjVimyaDvKwCr0pFfO/NB8ct5rhjQFhEfSm8YBoEnLBq32KGc5hqWtVfscVqJab/c83Mb1iHvh
	5BB5UCCW/KpgGVkNpI5FXNXpFlDZQ3zEXWGFoaHOZaAQTJXssjz4EslQEYPPMDMUGEk787eYfFm
	JEEmRYpEFumtMetl0aZekTA==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202144231cf.3.1788177789972;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202143721cf.3.1788177789522;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c567sm3300432a12.1.2026.08.31.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:03:07 -0700 (PDT)
Message-ID: <adbdb2eb-0173-4500-af16-de0b7c251e10@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfX8jGKmuCVSvlN
 932kqJiN+/9Sj146Rs3HurEN1JSWTlNR6R0kiBvRZ01Q9Qtq05tb3onm5Y4vIn6UggtvfDW40mC
 pxc/2UmNUw84Cmj86Pb3kzClSgCM0pE=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a956d7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=ROVUC7vSL5sbk-NUvPwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfXyZLHo85AlpbK
 WBh3tAYx3MUtQVYX3yal9sxtwP3YMafAUtroOqz9xdEeMYUMvyKQvKb3z01SUtOZivIuyQq2Fp2
 5mlUYrckhtqawjVxJ7aOaFsxM3j9+R2CYq6T1yFVREQ7DAZBHR9it3EiG7dHiptlHu5PMSjTQtk
 7rejotM6/JNfbbphX9of0HVKEwUtFeihn8zLbGhZenA7pM6MvHxBV1hFbNg+04bUjN0PbsCsEsf
 3T2xCyLusDGTRN5ztLfBzrmkMA2VX2q4dSfs7a8xpAPUlJWdq7ifo9Q9gz2ykNsspfdb7MPVXNT
 U6I6CdnG5I23lTB/6HVIV776d5iBzAhnhkC35TXijFu52OLFDr10kiQrQZubVNEmsAapU59gyVz
 hb4ZxxG3vqT9DQoe446upN2B2Oc/YraVGHT40yEBWk+DBmSWUG1zzlr7/+9mtunmcM/yd0RKSk6
 xqcvLIFR9Fs3BVJ2Dhw==
X-Proofpoint-GUID: mFKsfqT7_MHMhFWTVAamFOQE_WiMMYW0
X-Proofpoint-ORIG-GUID: mFKsfqT7_MHMhFWTVAamFOQE_WiMMYW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310104

On 8/31/26 12:19 PM, Xilin Wu wrote:
> The SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD, X13s

Konrad
