Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117889;
	b=DGLzkn1IkYtwfvkhIoS5jS/k9x3s3pDWToe91SodpBSP7CXE6tMX6MkXYTSmi4RV6nR8
	 vBBtfl3kPj+kLryH+hx8m9KHqW2gPJly45dSpWpXzJVrKgzXUzB8vtaTjZeYX2o/2KHn6
	 PYMYXtrYdKDCe7d0VeSX+MvzW5YFf+9PbyXRdxBlCl2ZAzeiqG540HMKgqx09Dz5c6sxY
	 5hijUk+1w5/xaB4v/+3zFQhTRJdpQzu9HhXTpvg7oxYehlj65flxV/Bi4Pb6+El+rrQlH
	 9Y2j8pzXvhCIjIYfmK18TqLcKrP+RUJEzEm7Jr4krLiyh/NtSeGngbHG9QIVnzgEGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
	b=vFUHI3wMTV3ShnppFtS0mfM+lBPiyl7FksRNosax6figE2G+pJYnfUFeO1NYOEWR2e6L
	 7P3s/yzOdQ5/f8lCKZchSsjZ7v8k3BTb09Pgwpad8aCqQCz4bAqsntKjMzRukBBs9hIGI
	 yZDA1VZOTmVH/JLsjAIPLzA9Ca9aiTMUNml1SQuU10/tTAPWcVjfTBXIpZLVX+XrV5+pF
	 oaCoUKZFVrZPlYwvigD2D724SqYkQHB4GSvbw9spMrLX5nw3ZKDtTCjL+RBcqDDKSxnuC
	 UaOOhwNFbRJ/AM7gLopLQv6WHFuxWbSNm8QVO99pgSwNO1t7Ebd2r8t3tepgOUz53+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkLDoAVu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlLzR2In;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27A4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkLDoAVu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlLzR2In
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL5E02549198
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=; b=mkLDoAVufykMfXU9
	b0wNwshi/OOFS1fGs2PUhkkdJTgKHecVqhmTkGvP5r4qVsM+99YVbuqYp42UzZBm
	2TI4maBCJKRfRPZLpK4EHZrA4GQCiz0sUK0TDussji1lhYQpdcZ+ik3hIJgvxnM0
	hZWRaYnTqGItcNiX0Kw7f9A/6jtt8D68cwLTH4CWc1agJ6uhZHLwqnGJA7wS3xzb
	vyELDZ4MGuWT4alpDXCC/oZm6s0T+j2wvi/ooq5od9IlQ9oV1WXkYa8UMu1FHjnR
	88tcaYIVwMLXmirQuw4xV27zS3jA/EgftwetVNFFnLWWu1MMo7IZQzPRqk+ELF69
	G8yO2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69vm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:18:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso776610185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793117887; x=1793722687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=IlLzR2InH2CS98YhZBCaotjhyEygpybW1CmPXgAkPnGDOyPDXOV3gh0D+loR79QpFg
         k0RNJHqPL35aU+JSC13lBbScU3nKaSVlIiq4h0WxDuJT0bAiQztzlTVd/Z+l32W5Em3O
         dxtqhznm4Ydsf8oLJitYAVWC7eeS9HGuU+WGJtGL4XuHvlgKMaNxuPPKvJ5f5Q8Zbjh5
         E21UoR/9IoYX8du5rXjH7b1bSrDqDYpTZLA6Gl6kUvNtYrd4CIr1taUCGxvCLbb9fVu/
         fS1Ue5Nw9IbMR/0vQS9LHKoEwf++0jm4PA8qlntLZV1rm0n9iClTMG5lGWeIuLi0poLT
         0+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117887; x=1793722687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=ndqmEL8gqBfslxkXps7vjxvGP+ohXqXWVd7MQMqxip2zz2VmsOmBdBq0vD+IKGGOVm
         XMIjktkoTCgyDcRdMn9x51s5BLIgcFAM5P+JbyKTC3mWvqkBAJaAAt09xjk5FrIM28L5
         kxTdJNFHbrKZCiU//zWTuNxxmBk0DX2CihxwfD/eaSxSIrhHTluZ7+hDw2YQ4UXG5Rd3
         33Cpf0yjeEiTNRRUe3FHjKp67o0s3XipBFhWLrnVjMBs0OleS1QB12jmEc3mvQK/xmC7
         PcwiRrXSSGtU8XO1nvImT9nYkTI2gKi6xow9j3Tm4uN0gXHeV3xW4rkBleUcHK6puj+A
         L90g==
X-Forwarded-Encrypted: i=1; AKwUvByWPp0wEnfsFN2zyf2Tq9ojKY4T8dRJC682WhonpUzC4lkiOv7taFcpG31di0MXtteeiHbqw5tF6Uo/nmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9MEfiSkc/NDUiGEzDMWjeRT9ttRCIbCW+c8fzgjpzZdLou3Rn
	lHfOBjztNz/oYO6J3Q1wA2cFcKScQ112HmZzb6RrzBxcQf+II0JpS051zTL9B1fUGbuQvOwMRG+
	y4BQIDrOSJz8++11MtAyw+ei32ttopEDrvIgcdQXVsnPO/rByPrRE8nIRoH/sleWcrFY=
X-Gm-Gg: AYBFou18q3wNFo66DF/0LZS5ck6a+6lgel8hqZBOOqjjw8PtR2eAgLV4p/5i7K7XGLb
	bEaY3vgZopnB9W/31mqdPVn9k5kfJlvlxWWT4cVsWYPqhZX/er+DTmCdc3u2H/N79VzyUhQcm7z
	XSztgbISHBgdhiuiSbRbvZVLM2KQSheEojVTJuUlFs99ZNwK13CAy1Xh0RhIIyoW/OYN9Ar4FDe
	fjZBKWxp1/KTIruWTOPlPOukIYX/ZyGoIkCFyG0x6gFl0OHJgIAHaJL3dHiyjNwxEQY6UCUihHW
	Qqi3td5a3N+BXGfyVXEVmeAAnZJ7IV6pfzRR0gdaCKVICG+m4NaoeQ/7zUKEcy2k5iGYUypv9Pv
	RxJ87rliHzc4FigZVj4NJGSzWzVzAjGQzy5wbdq95kbKpU/iJWX80EWVrU6Pufg==
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634333185a.48.1793117886904;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634328585a.48.1793117886452;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm25927477f8f.48.2026.10.27.09.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:18:05 -0700 (PDT)
Message-ID: <8e53d1a3-fc96-4d07-8be7-74f383ed3618@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:18:04 +0100
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
Subject: Re: [PATCH v3 2/6] selftests/powercap: Add powercap hierarchy
 creation API tests
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org,
        Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <83799bf79e85e9e2ab77140e632f11d96b17a04f.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0cebf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=82gYmaJqspjqQrwE4UoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: N_VACt8vCdu6yuySUH7YE2NjVR7CviZJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfX3XFzW4O4cYA7
 czHYE1fUy7U+KoWiXNKDOz5/VDxLRyqlmum/DbVIXYkiC6ohRvL1TKEA6GSC5vj+05SVXEJXxTf
 NY7mXNn9GlD4a32OxPCubLlwCQ6Wg5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfX1VfXWvXdy5Pl
 8puPWwI6EdL8TAHEsKx3E+GA4GlroDYHYuwJMvJj+WxSYJiQnkk8bzUM9HNFK5v2IaPLufw+wzj
 XLsZDL43bVnmK3Vwu2tM62tIuHCvMbgc3zpvpRFWM85wxRX05UEPpoQCnnJjts6kTNnAmu+Pes8
 nQjAR/c+u6JdvB2YWdMGdIGi2yDZrjDagsd6A3BPDsjiyu+DGQvz3p2wmy/Vvwe3TkZo6gIikjw
 tH2xB4RbaGAKJl4vuV/O13dzEosDV0av068+gbAngxCzc6P3ZNnhIXXQz5Zzwxfqzz/9y0meg2O
 DvkpdjJcqFlBrznGyaiWKTEhLp4H5jYguhX6xTjpPBGjjppk7i7xZsxYURulwRiQM6yk1jXnzxF
 /v6QKJQybHRc934UWnN3l2lGYxnFvArB0TTHZ9b6HPo2rtD/zBxcj4ifpSQMoHuHyIghRBGe3jz
 +kfc9NKI0fDZhNbkRXg==
X-Proofpoint-ORIG-GUID: N_VACt8vCdu6yuySUH7YE2NjVR7CviZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270064

On 10/27/26 17:10, Rafael J. Wysocki (Intel) wrote:
> On Tue, Oct 20, 2026 at 4:18 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> The powercap hierarchy API introduces generic helpers to duplicate,
>> instantiate and destroy a complete powercap hierarchy from a static
>> description.
>>
>> Add a kselftest exercising this API. The test builds a synthetic
>> powercap hierarchy composed of a package, three CPU clusters and twelve
>> CPUs, registers it as a powercap control type and checks the zone count
>> and selected sysfs attribute values. It also checks that the controller
>> directory disappears when the module is unloaded.
>>
>> Exercise direct static creation, duplication, skipped clusters and their
>> descendants, reuse after partial destruction, and repeated creation
>> returning -EBUSY without replacing existing zone pointers. Callback
>> checks verify the controller, name and backend-private data supplied by
>> the helpers.
>>
>> The test consists of:
>>
>> * a kernel module implementing a synthetic powercap hierarchy and
>>    dummy callbacks;
>> * a userspace kselftest script that loads the module, checks 16 zones
>>    and their power and constraint attributes, unloads the module with an
>>    attribute descriptor open, and checks controller removal.
>>
>> Use powercap-owned zone allocations so registration failures are cleaned
>> up by the core. Build generated module files in the selftest output
>> directory and extend the common clean target with Kbuild module cleanup.
>>
>> This provides a regression test for the powercap hierarchy helpers and
>> their integration with the powercap core.
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
>> Assisted-by: LLM
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Sashiko is complaining about this one now:
> 
> https://sashiko.dev/#/patchset/cover.1792504834.git.daniel.lezcano%40oss.qualcomm.com

Thanks, I'll have a look

