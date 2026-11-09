Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238881;
	b=PJirEmS8fLUF1/AKjTuG01B87RDcQCX3p4AEfCcCeHEu7g8Wn78oerbId3Bnh3XAw6eQ
	 waBhvnbq7lJRiRsB2VG7hlVpm0lW1VWllDgOAZxNqEXBFyXtRWfc+1QGsf0BvqpGhRe+w
	 gMAaCDlwSfNVG7fi+zQnuG2kTX3KTTsw+7NLR0VLz4xmsIFnQA/qP0yedk1qpfcT6+W0C
	 DKzX8hP47fC7ofztwezp6R48IC2T2zOYvZfZWwO3UU9r9FcCS2ifvytGsbI/kXF6QISdP
	 qoNmp32rvwQ8SF+tSRwfYcY3u6hnxBi8rGz2NWn+PwgBYDaT8w2Gq7kFf4gURU4hUzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
	b=fCX+9JYVrmMe2OIDDhoeK3w/PkKSB+VJY8pQog7p6ms+ZMZkiRQ4A1/Dh9VVZ8GMHFBC
	 UoVOmSNBKbVUh0DFiDjc9jHtOUYGoavholgZNUfcmLNM3ryFVPPSKydnVhey1ifT0h8d7
	 U5n5W38TPZC9lrfgIvVUJTU+rvnFgHHqYomNzEF9hgnsLoH0JplargOtrJdy+VVHGFuR0
	 MGrAV8GrYhNxYYQC4SOwktq4otg2r+FN2m1RX9xKzA6zflcjFLkuhiA9GEU2Oijlm91G+
	 EIOBE6rU5KMeznFnAEyFHnwrIaEICQQ4PkmrKZ1uC+IFXnPb34ykNf4/OlTsdpvQjKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A3606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750A3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EPiBw1141731
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=; b=LIW+o5OMMmMHLBd0
	ZqN+Pt9cKAj5QI3KuNcKB/ZAXCK7Zja7T31Ro3zZBnx/olamMqxfRqZ+iDKxnOSg
	RZSN9SyLbYZJ6GQu4Yoj3IOn3c5Jbfhfa8JYWJZHBAW8OC8sLSnER0lHNGCEeCFc
	IWL6IqI+1nVCTaamsUVIfp1Nop0TdjBpT4cAyEomo9zGllM4iIF05QOxVrljU9e6
	EdG+b3+ZeDYeS8W7XsQLujBO3K9+WD+UMXjaOhmauB63ac1Shm5BY3D9mGHzb7xO
	g4LcooH0RjT5nmnXAZ/xOF7oohShEAjp89t8q6ZT+mXlqpMX6odtNKSDmz4Sy0MD
	Rdf4Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx808rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so28909385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794238879; x=1794843679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=B8ibVMl5tndTYPU4dQseBgIbignge38JEiekrVZYvYNLfj0ePjCEvcgkH8CRRO42RY
         qJ+9qMcbcYuAnzLDWr01f8H2gQNNW+OuYlEWZ8Q3GvFBfrLEj9Pdx0K31NbwXy53Ue2s
         JNUNdQMmRSw3nzB1knUCVvXF3iagZ25Y4BfVsuGu+dnaSU/wRa6ESr4gitoDuUzheSJD
         WQZUdkA8xzfswUt81T9pEQqmu0FUAC/Em4p4KXnQUV44DBywMCKv9Swr77pF0uxjsSlX
         xggmIpZYoJz/rZ4rGBbORjQPY16aDhSzShDJtbqEC1m7G5qeZwO20oKkruleqPBqJPHN
         vgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238879; x=1794843679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=ILB+O3GXokHoM37NHGndkJLzImV7Q7vuV642rWbe1Waeg/bwLhrT2k3AaveeWaHC7I
         3N34muUVWvElsoYyu3+o2xp4UOjhSmktoHAmJ4wWYEM20x/POwZd4qVW9RLH1fytfRm5
         msEiaiVNjA+rkBufaFGXSo2gLRR4hp/iE0x3YPHEeTJBC7QZc96l8n8yrvT8yP8Ld62h
         7zweAwprpxujrQj+dCw8SOB9f5Nq3BfxZ5oIFuWC8bkMzxsG8gfkt22IQZE3Ce+sfEQS
         JLP5mvxynf38xejEL8YFs5mUwiVItHo79Zg5fIE5TGkgAieSD7Rsa6bnS06q4iNhMTPt
         W3Fw==
X-Forwarded-Encrypted: i=1; AL+hErFF1cd5+jVP/AW9+yir9xkAHzbtfdBLpEMkA+nv00fbfSmPGYFJYjCmG/3Zcf1LLj5HPYbpS70YKGkNlC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TEK/dlKdTVOX9udbeeyJ+saW7Eib0k4jll53/eJg84B3Am8fR
	eP+Y+jglGAqK4QttHoG9zF6vt1YP8HMjmKI06hFyco8C7MxdyEQ9q/udNF4t14SfLJUcUP1evgs
	owInPVBcDvAD9jHypMU5FNf7PTXmrotjVdixMPEL+YRaROq6Ob5VUEy2nxPUksZs/FuY=
X-Gm-Gg: AYBFou070KtwLJoU7VTQF7Rh40xFsRhX0BBDMQZ58jyky8Udd7bz5NFFqFn6M71llKg
	kRlwwO0nDR2KD5GHiNAGNMs2EO0twxCu+ppemG/RsNKc3rlExr++u6ZdMN/ECMCtzuyokJdGw0O
	xjzcGpWMOkvlFhruc55KjujgMrX/NVgJuWk/jbMY9eUa7pEffgTJlEQmMvquO39rzyshQwvFpe/
	W1AC3uIIPaeasaLUjymOAWGdFde7287g50EoLHecQGzoCLL5dfyTpqxYLAGsJxBkZvEkRWfSysj
	18coOnxgpWHuH1ub+vtSdIvESg4AAGSEoluujPjvcb2Z6J44em1gJvrIE3xqdKQ8dQ0Nc7Csoqy
	TLHaSrCk6/QOj4psIfCebYLbOCiZDL7MrI68O1RkVcbesn9weCKQCWnzNdM0q/f/4UtgARg==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660951985a.0.1794238878576;
        Mon, 09 Nov 2026 07:41:18 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660948985a.0.1794238877975;
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b755543354sm33732a12.35.2026.11.09.07.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Message-ID: <427e15a6-cbb1-4c3d-9547-cfaa08fa90b3@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:41:14 +0100
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af1e99f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=WC968W-qZJN9GzRUQ40A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: wJJ5BYVn0Mayv_ChbswIXxPJb8TdHScj
X-Proofpoint-ORIG-GUID: wJJ5BYVn0Mayv_ChbswIXxPJb8TdHScj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXzg7R3a6NcuHy
 U+dwkhHk185dlMA9ET2BvPx2eLxn2L19c9nJ5V56A3gThHlJyyBoKIGWnqmoev6dfnL0W10hFwE
 Fq21rJAdw4B02jvCDi3pBf+k9YqQqVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX1u1din56VieB
 vOfQB3VUijZ99Y5wxYo3EyTNiYr43DGvDfdNu8oHah+4C9u2SEKAxKLgk+U4aamHVS4+EihiYRU
 RkO2uifQ52tM4Ccarv0jND5oJam/u3OxtZu2klbmgKVJGaaouab1d+0G1DUs7yddTzc6GHHBxvW
 +dS7nK63cHtGdNAwwawlqjgL/B9+D2jJrlcebl1G/1a+nWuMua31D9b67JBJKsXs2JWvzbh4Vr3
 0ce0k/AXumz84jlPQIzi2nLH3n3Swt6+9TI2dYyCa7/3L83L/EHxYRPwjc7jDgeI65+VUzQE8f6
 AebyARNZI+kxzYmZarrL5EHdHI+GsDtBm7wx+ZRHXxA9rL6WvfTw0lYNU2coKuGfpBfPrsJ+gT1
 ZiCcdUr7TF9FdCua8FXJSzKP8IiK4OXJ+AYyQgPHEJNq/OWzqss66D4Zn0ENRctU/GXi0kkNA+V
 f0kpIcR3YakWfZ5RbYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062

On 11/9/26 10:06 AM, Abel Vesa wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> This depends on the LDO voltage fix sent separately, as the combo PHY is
> powered from one of the rails it fixes:
> 
> https://patch.msgid.link/20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com
> 
> Tested on a ThinkPad T14s Gen 7 (LCD) with a 1920x1080 monitor: the DP
> link to the bridge trains at HBR2 x4 and the monitor shows the desktop.
> ---

[...]


>  
> +	hdmi_hpd_default: hdmi-hpd-default-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};

nit: order

otherwise whichever way we end up merging the dependency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
