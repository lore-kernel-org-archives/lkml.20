Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CC521205
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030110; cv=none; b=GOrnbxw4Y68ntF1k4AsbbGlKD+7Gp0Y2mDK0Qezre+7rZ1/2ekQHc4t6As8jnCIVYNMIbLAyxcI5KDvmMY58NdzvV9g/rEHv6PYF9TKHxioy4LPYwpC/4c33gidvXViKag0acxAFFG2j2TypGlhsINi9ol4n/jWqIk9uY6S5qWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030110; c=relaxed/simple;
	bh=Ib+b6tSQi15Dp/Pl538pLpfZBOpDvIo124gdzFdbfYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAV5yCrfq3TaP4fn1tMq8zyC6Iz5tNTjx3uebqbj3uv2HR8p+O9jGNSs3+Yg/FvQ20bJgeXhujnHBIBlLE6BSeNb3K0lF8OOxn/7HIRL9IlGmu6Lu6uxNFF3pWHBfysdUtNqPKjGIOWa+XDlopHmP7tJfZqK+QP66boRFfpyfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvkVI+ua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LckOLiSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvkVI+ua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LckOLiSa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKe7TG3423724
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmvyhwYgg5sbh027kGBFN4jtSaonNKU0CwrVCoo4oq0=; b=gvkVI+uaH1E+NajV
	hTPaghdnDsTmtV2C98OXXhTiAas4EnxSzMbI4TYYuQQrENumFJBf/LsjcEL2Lqcx
	hduKC2F1DxIUMNEJqxPFHquit7h1lFygrORU1tqlo/87YtwSDyOq21UKFQn1LLT0
	ig5v9yc47OmytOMP0OBlbPzyCIsm2XZiIdURB75I+ax7IEQCoDfHBf3n/a8zPdJe
	QvdDM/6hhD4J89bKjW7rnnNl8tafcHL4rLC5bYLYNOE+da370HnbKfkhFeJoNuUw
	rzcWAukzENJGi4Uj3OV40zv8hRTT6vKAFrqW/Kfd2nXiwVNcyiYQujIf1c/o9BBb
	ugk1RA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v514cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so448675a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790030107; x=1790634907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmvyhwYgg5sbh027kGBFN4jtSaonNKU0CwrVCoo4oq0=;
        b=LckOLiSaVPAXkVs/20IohK811l+5KNDou1POVnZ6ly96w6KIKlKT3VcdZF3ACcW0NW
         fVjaCiOI4QFbXjfIGB1kV7HkvLnjGhQa3QIwQLK9it8JsZjsOEfqVEi3aaHcmaACwGaT
         lUfLYwVr94FwIEDarxB9Fgd3de2Fx81tV77JXGG5Dh4BWLyOVRPNGwoqGOejjSussYy4
         Yh7qyzv/VURPGMkXhFMm/wpYYKMMLg9tozUYrI+SmZT+6sr6wRPcT+04mIY4lKPvcQol
         k313LTbDKlVINSIhdfQOg6oES3AnpLBljs8Eme+fAPJQVxkX2F+jR0Yq4M9/wkvOiqrc
         FX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790030107; x=1790634907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmvyhwYgg5sbh027kGBFN4jtSaonNKU0CwrVCoo4oq0=;
        b=huevHV4V3lzBCZi1CL+s77gU7D9su3sx81Nv8ljKmdklrRvwrfEWJou7NCg0PCkr8W
         TJ7mUc6y/cMIuXPGPt4XXjO9wHU7Xp4ab3SqsgZF/ZygRYVasoxSzq/pasvpEb+iC24L
         X4k69sbmfkyzsGLP5VSrE+ypdk3TEzVrN8jZPXYyJ9N2uDH6R5c+SvE6f6kyf6VxYN81
         vSxFMxaJVb9seUQD/eTLuMHl+G2DixuaeDb9BMt011mN/X1zntJK20/Gwo9w1cMvCGv+
         fW6ugoBMssT45aM049eMHmw5hffN/lwFolKzE6SYR8bPoq4r/oJtkYpmv7NDiBNuBOKU
         m1YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW9DOBABCFuDOBN7cwfj071iUXLWcC8MblFfmi3XgwbLD6oQUkBi8LOYnoQIdFb7Ybx7EhHs8n4WbX4aE=@vger.kernel.org
X-Gm-Message-State: AFuF++lwg4YtEJ+WPrVTlpM/Q1EBP9QKm9OOdLQsgyHqknpAnk0xph8M
	eIQW4H/I7Xx3DhDAug6oQiH8BW2Pph3hPydofvO89Hr6Zugee77uERMsQUbYNCWFduqZkMz5tKK
	8U+B2TeVzaZ1MeoUc/1zmp3NKlnGVpswZaKgqZDmaUSeuY4ZH2+3iZ+wfLIKZM8Jln7o=
X-Gm-Gg: AYBFou2R+4100JWGOnqmHll3E4gAVA+SdZWSKfo4h/9yocxhbzVmEOosvLEO5cRf6Jz
	BtWCwDySibPfYxRBy162Ag+lDqY2LF2Et2RV6FTkKRiq7I2uXYXT1qKlJ9wmexGUT3wjsooaktq
	D6RfanipMZ8T7020ZYPzJvtNRByM32H8o41OVl3aIwU6w8Vwdn/9DrWw4I4R24Jh8V7w2xY+CXQ
	tZosnuFQk7NfWopqS9njFikEeDzhXdpg/TQotWK+y8hCN366f0WmGWzjXROQ6YoCKaWsmlWZVzw
	B2XC5VbiAYDFObDRy2Dp9NQVgRsRZhEa1wh1wzGAAB4tbHp3ICIfB/vakLcHD/YLcoXLb0WcBeO
	hDb7HgW9p4ZSZjmKDut/f86Y8tquYN69lib5RakP60U10xpyxJLeOV6bUcg==
X-Received: by 2002:a17:90b:4b0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a0669c780amr868407a91.6.1790030107299;
        Mon, 21 Sep 2026 15:35:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a0669c780amr868387a91.6.1790030106661;
        Mon, 21 Sep 2026 15:35:06 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0cc3100sm681215c88.13.2026.09.21.15.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:35:05 -0700 (PDT)
Message-ID: <bcd5a280-8184-4457-ae52-47a9e0fe763c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:35:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] MAINTAINERS: add entry for the RTL8723B rtw88
 driver
To: Johannes Berg <johannes@sipsolutions.net>,
        Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Straube <straube.linux@gmail.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20260921154347.82317-1-luka.gejak@linux.dev>
 <20260921154347.82317-7-luka.gejak@linux.dev>
 <45eb7d5908f8fff9a18cba603fd3a4abfe8695f9.camel@sipsolutions.net>
 <31285267ebc43aab631a4199059a247a8d937814@linux.dev>
 <c208152fc5cb45e19ae7d4660394dbf2bc5e0271.camel@sipsolutions.net>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <c208152fc5cb45e19ae7d4660394dbf2bc5e0271.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eZCR7FqVcVHoHQAazACF3bwJ_z6zlG5t
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab1b11c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=b1gTVRIz6arP1Kg95IwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMzMCBTYWx0ZWRfXywN+tJ3yT5kc
 IiuWTwOQVbkm2R2PvweAChiZ4aFeW++WgHCtgtOMNRSw/YSldIr2AG4A5s2yMba1qPLaLzgrPej
 nKjbSjURocTrAaZiz7jRzktDdsx1Ffw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMzMCBTYWx0ZWRfX8alrkZTWA1bY
 hNoFmCgl1zCgCtnO2xDbNiEVm9nlFFMih+E2WXkpNOAQ2fUYmSXAdBe3a0WtomI8mpTdIh4/ebd
 TJwrSIlEk3E2eFYnjfM5wAZ5jHbtq3meEfKBy9tmmsPt3POZy6G2uShniVQ5Xj8cb4AirNa3KNl
 EGmBlGNC2jPwWolLyuafKf4SUrf5dfCodEDwSC3Oij0FnAYlKwIq65CvdWjD6h2ANtfUtXxJN1H
 W8rfZovQhjg6bwaHQ7lZzoJPHvE4gmb1GJKQ/ROLs0EdTjreNIa4yzmSnp1jtBIMDALCNDsvBFj
 9bM7AzXRrj5GfYn15ZoWTQ+qJHiYTe3S0X1uSIojFNQXSgD3IagO1hHWgl6k78jqc2IiiQz5uOk
 MyzlIlYMPGYGZz9orYE1l6FQig23Q1SAN5K12aTkXFGR+/iAV0lncZJDoR4WbMql+xikZ1HgGG9
 9yJZ791IJnYzZSyFUug==
X-Proofpoint-ORIG-GUID: eZCR7FqVcVHoHQAazACF3bwJ_z6zlG5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210330

On 9/21/2026 11:14 AM, Johannes Berg wrote:
> On Mon, 2026-09-21 at 16:49 +0000, Luka Gejak wrote:
>>
>> It is supposed to work in the same way it works for other driver
>> maintainers. I would review patches and provide my acked by or
>> reviewed by them and Ping-Ke would apply them to his rtw-next branch.
> 
> I don't think we have a lot of folks below the driver maintainers who s
> end me pull requests (except Toke maybe?) - but as long as I don't need
> to deal with it I'm happy, you can figure it out between yourselves :)
For ath.git there are sub-maintainers for ath5k (Multiple), ath9k (Toke),
carl9170 (Christian), and wcn36xx (Loic).

Toke has a linux-wireless patchwork account so the ath9k patches are initially
assigned to him in patchwork, and he Acks on the list and assigns the
patchwork records to me when he approves patches.

For the others the maintainers just Ack on the list, and I take them from there.

So the question is do how do you want to handle this in patchwork?

/jeff
