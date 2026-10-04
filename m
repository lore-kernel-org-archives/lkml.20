Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E235E92F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127039; cv=none; b=s+GQX9WEZtPSZKVdk+bGdeJg3BYG58f8dxFCeWY4LWDzq7z8oTE2oZchB9DkIP+kJON0PEINOdb5j2UwZgP5GH/ot18Hq0ec8uOhEzFPRFOlW9ArmKDkyQaXzjV6cAGzt0wFMltnixtZygFp1mamhsYGR+bcjtKxwE1H4NbTlsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127039; c=relaxed/simple;
	bh=lCTrtLhr3Z5Si0YNt7XHi0cDL4mce6KWKT1snu/cC40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpkmOWJ78NQ4ySX0TPDpovPlxsvJylgb7AnP9KLuAQ+OT/7LD/Kqep2b+XoPXa1q8yznqaYWZFWd5UPo8fa5WI3J2PzsoBlCRYdtyMCmbyfT+Jy5wjChIfNdCavSlzwZtv5IjVEQfoc2kwxzC0K9VEbZZGkxmCxoflEdpyIfF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9CfEAsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYnWg4aQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9CfEAsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYnWg4aQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694Ee2Bw3032130
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWVnNLZ8wBkC28PmXBu8obcfbzjX+m7XPpwB3x8JuCU=; b=E9CfEAslMJtg1Ra5
	nzR7t+TtC1Sjqx4nCfS2lCHDxhdJ88Bp/yxA4hdhGO3CfNwbnCa3GgY2GSLpevn0
	mHxoMZdtBytrTZp4wXO3cWMQWSlG6ydDOo+HGdfenPyx2GawLDeKUviAZfiWTpAd
	p/NfOXiJRaA96gM7uV2JvjmajoepMUhFPm1JQmm472LcpYc+ViHqrt8kNPztPUaN
	58lLQ2l3GYhoAqdx/YHyeU1CX+htL9cfVz4MJckG49aLbLNZ/iaXr5IO0E/uqVVw
	rJsVJsctb5lZ+b6+bKss4Ai6vsHL4tfPfolDxL5gwvxLb+sXQ51cJWSmj5ntl1+S
	bRgYFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu38v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:17:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so1269844eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791127036; x=1791731836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWVnNLZ8wBkC28PmXBu8obcfbzjX+m7XPpwB3x8JuCU=;
        b=PYnWg4aQDV9b4Xi5+n4sDtMr5wULR8SLCyBQFwZK89DcivMmUi9QGkyNzIYLKikaVj
         qKfX3wX8veIrACqUduIHDcalh4onDnqoKkWTJERoqKrJng/JfGd/SreR/GQD/tf6RnGB
         sVbqbJIxuhhzOnRggoARvLCRuDb1OwTiaq0y+XK9VD0nuv+qfR0wiK+/F0lWdoph06n1
         mRvpefBOsGMTkrIPrWFi+/NGyi9chCUyaKJnpcF1PkGmXSt2aDrrKsPPc6H8XEY7rXub
         WcpxNwou2fSDdDYY1HRdMQBV5LOR1VwWYLgsfMmHB/LQBgZno36/nv8+Y6LcfcMo08Hl
         eq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127036; x=1791731836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWVnNLZ8wBkC28PmXBu8obcfbzjX+m7XPpwB3x8JuCU=;
        b=aNfI8WmxFSDGGXMSQgf6HsRMaJY4IAHneuhaI0YL7Ti6N/BMXnLlfzd9TbTU9mTMzI
         DxAS8APy9wXKUyTvPTdfRBRsZPR4dkOpHcfEyDJVsOT7aZ4AeKidUxfxd9b30IQMfGjb
         HEGLWLslVO/GlyrZIwVL9V+IDllWwTn19bI/Vj51KJlHuLHqwgOTRK+Lc2msKJ8LJK8H
         6L/+4j2eYn4SoTIUwtuByrMO4iVOJ6awmVdHqzL0+0C0t9fX9RPk8d/onF3EL0lQMj+4
         sdMncisZV1z2BXWgqw9Qt/ahiBse9mz5CSQvLdiVoWa3vZM53MW8FbNr8zx9yLkLOEhF
         KKgA==
X-Gm-Message-State: AFuF++mCt5D/rHIcT5z3wVTXMnLv9SADC80FOva1oetSuDhmIsb2aMqS
	GIRZp0OgZQCWvbAx4dE+iYyqL7UJ0yCV0dtrA0uiayWiNB1IXps0145fPcL5Bg7hgcb1sBqkNva
	C3bNuNYKBKtejUPb2+fQr3BmSVUl8EihG6D9a4ESPquYRQ38kGHlE9vfzYwu4KkRcXQQ=
X-Gm-Gg: AYBFou3m6SmZRAs5u1yOWukTOVgC7RSY5KW/o7LPiRl10JJUi08w9PHJrwzRvHcWQ3r
	h9w34+HTobXFq63azm082qIMXsbdCF2Sj6sTmRP8977CyQstPpOs0ZTnicPFc77brkbSYEOGomY
	UeUGJrpwKRjojcdlMnYDaCwslWRrTY2YbOMMmdsFxRuATEFgml2aDRumwyUnB5/BOVgOCengCbi
	LlWRypjSzkL4u3meQVkM5Tk3YGT4gnEtk4DFYBJ9O95u28dflXv6vSocPf6Yzm47ZFoTrzY9TY3
	eurA5rsLEoYvgcRu/0I3G4bX4YOE3yX9kzbUo/FF+j86W5SQ9hSuVl3iNQHW+GxZmRmgrpsRSCd
	5uH0mHFtwfyyvphKQQVXAwDxEQDXpkigi/fUVWSBgSF18BOZZGVazI+CUTA==
X-Received: by 2002:a05:7300:d407:b0:34e:cd68:4a9e with SMTP id 5a478bee46e88-3511147a75dmr7955765eec.22.1791127035769;
        Sun, 04 Oct 2026 08:17:15 -0700 (PDT)
X-Received: by 2002:a05:7300:d407:b0:34e:cd68:4a9e with SMTP id 5a478bee46e88-3511147a75dmr7955731eec.22.1791127035151;
        Sun, 04 Oct 2026 08:17:15 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713c9a6sm5547160eec.5.2026.10.04.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:17:14 -0700 (PDT)
Message-ID: <720d7a14-763e-42f1-b892-c5a22be4a8dc@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 08:17:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 ath-next] wifi: ath9k: delete channel-context timers on
 deinit
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: open list <linux-kernel@vger.kernel.org>
References: <20260911213144.130192-1-rosenp@gmail.com>
 <87eceydgiz.fsf@toke.dk>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <87eceydgiz.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MCBTYWx0ZWRfX2qsLYKC3a1uC
 9YvpoXTzxnW0sKqD9VK9qDc/+7rTwKUkPtzETaRgQP3G+Dan8mfLE/PRHWPRNLIn+FsDH4aCZnH
 BINATrs4N2bDqmEv/MGjY1+jAiXX4a5u4CqknoMJJ75abvV96eTV16zB7qzPKD84EwFKjV6+Kf+
 ILPlfJ3huIV78ch3lNgscOHMYax27McECEZ1VQmXH4R82ZqFqlU8j7Nm10WKnFI9MYRSCDuDJbh
 tS7YSYm+DEsO2fSdLcXIK6HiA2rwyOJWa59TR7T3xsmrMg972U5OGKTmoiVMpAHhfP6GvoMRbU8
 BTVJV3spRJzE8k6jTP6PlIK157abioCe9JX2hrOHCdKPrUMkWwLY84F+z8pfbgifpvP7Z+Hz/f5
 8FOGSwmQmDuOy2nZIJPpCf+J+Ss//C4gK/yqcmPSBlcebwyXe33ue9UWfiwPP/dK8XhnDJjCFRs
 LUtgq8RdSxTR93gLYbw==
X-Proofpoint-ORIG-GUID: J_FWSNRzHZD61x80Ltgpjcs9A_vFUo7x
X-Proofpoint-GUID: J_FWSNRzHZD61x80Ltgpjcs9A_vFUo7x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MCBTYWx0ZWRfX4RNRR6lGI/r2
 T2XD3REqCkW6eUHL4bs8t2tyFelvHf/Fv+S95eiL/V/zFEtnpCVBsnJ+vccxihG3+tw0LDCXGog
 DI9YaEYS1Q1V1jADalMx5F66UNTy7MU=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac26dfc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=-Ohwa1HQkvWuuYyCLrcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040060

On 9/12/2026 1:23 AM, Toke Høiland-Jørgensen wrote:
> Rosen Penev <rosenp@gmail.com> writes:
> 
>> ath9k_deinit_channel_context() cancels chanctx_work but does not delete
>> the offchannel and sched timers set up by ath9k_init_channel_context().
>> If either timer fires after deinit (e.g. during driver unload or
>> suspend), it accesses sc->sc_ah which may already be freed by
>> ath9k_hw_deinit(), causing a use-after-free.
>>
>> Delete both timers with timer_shutdown_sync() before cancelling the work
>> item.
>>
>> Assisted-by: LLM
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>

I'm picking this up now. Will add the following suggested by my review agent:

Fixes: 705d0bf83dbe ("ath9k: Add a routine for initializing channel contexts")
Cc: stable@vger.kernel.org # v6.2+

