Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D373E5598
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700809; cv=none; b=UyKlLjBp2qRRLhoBR7/VidlcUESq8JnIfIXyLBuGhmx7f44wY1nmOxAI3vZzVO1wTx3MnSKMH+lDfHu3xfcANSbyHYv2ESgs6Y5X1X/BSjGoD6uOxuj8FRv+qaFYqmYyBxQ7dnz0rAQ/56UEXq/pEbrT1EkqIfCLJVy7dENNNwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700809; c=relaxed/simple;
	bh=/ttv6f6dsluA5uZThmcG7fwuw5ldScTyjNi0Up5a3ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdWGHfhD1fa2r17acSdqKFaZQtFr5oeexWAnWgItua1QbfsvHAIpXX5FrKQaru1iBlp2+BC8u7amfM/v/7De9J0+jy0hnladTAZ1cRruuJaK4pZX2dyLzWsR6eQbs9Q9H0e3dQi4GH3BpmQ1NkpBSeEsVju4HozMR5FeHiAS8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2YPTxyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSROKTHQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2YPTxyF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSROKTHQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B50G1n2601986
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=; b=J2YPTxyFIOo2TrpD
	r6YHmsOhuEbaG2hf9Yvwb8aB4R8LB6HY5rgVme7XpOYln1z43cg7I+iuWtZQk2Iz
	aXOb0eyiKCqexF4Ysip33quqVJ1McbKX+5x8hcz+20uy+hOc78CQXYw7EIPo439/
	LZNCaem63jM+IKY9bkRmP28tguo8dXvztuoHTGy4ciAxtbQ+ZqCpym4xCQ/8wtE+
	sxsiiZY4u0q9BQMzGYLptCDIZrDe7mnqXjk4fPx2B1oQmTNxwWaqC2DNdgEmrFHs
	mUha1aWg/XI9Xy75N0rPjdA+//5OWw/jHjP8noDyqS9Zq10Kf2lrh1UD95YskNeA
	t3shVQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk22gd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:40:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so115135eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791700805; x=1792305605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=;
        b=WSROKTHQIT5OB0H9zCRSmMFt4qDNg048xKQgiTDQcMGTk6OShzz/fB8YREVs7U/Zv4
         XhTHFyZXuQmkEhgurUohTQjKY0ogZCEc+OvZLOFdgPtZflDcEvrOMOkyg4ow/ccbl6u/
         TdeKHsTugjTcJ0/y9byvfKBi83qf0CRUco4KCz1Jnd5aoaeC20vDyAaJyahCAjvmui8N
         yLHUTR1VUWZKns6RJSvbQQktU01QP5ewMOrwgtFzuxSDHS6ot8/zyL+if6KjN7Y068OT
         +l0K67LxZi2QvPpETn9fuqU7qOU276x9SMp9ldd90FqpOVpnG2zSzVPf+ksc9Twl/RIt
         MoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700805; x=1792305605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=;
        b=yjReAGoZEgHDHODbI1tdeeCqGlx/4ObmNHiKH2mWekENyiOjQCDje4V5539Vqt+FTo
         ZeKMy68lONcgacKIG+IiSdV3ZnvliR3KtzwaJm7pGOrMRI+ktgp+FaJYE7+RklKx3G1/
         v/EGOVjDN+2yLt/wLpEoQHoXJ7R0igkJqaZCp/+0tfmBDbiUuawRIUD6QLBzmDCl12oJ
         zqNSDQjeWBT1UlD4pxjoM4lSvW+BOvM0abEFObgXRfOmd2zNm6DgvIRWhpDTbwZPQJxw
         LYgVJzy1Kg29Cf2EiCGXWuBtkm6rlLTyprF4erg2qM9qlBUtGz7mcb1ph646XKCa/zPu
         hMUw==
X-Forwarded-Encrypted: i=1; AKwUvBw0X7g3XT8vMUNKS/VW/RbO1+3+IEEYJA5i0r5qUlpCzKf7k0LBQKR1YaTy22q/qWPFuZarBvU4hGQqCWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaokbY4Iw7x3yu/jOeqUcb0zHcK2dhf9SxW6MovXZguPlDRYo1
	fH3CQHBElZQZw4uBXarCvsEkV6mZlnle8HCGoFFPUStdSHTQ+fmghvYa8a3i76SJyF3JGkyDMq8
	gdcR0mvJ+/lv8pIDPTGDVAqcUN5xD2piQE0MMXhGLpeaG9RhPV2XybWnm0AVjxGZpDBw=
X-Gm-Gg: AYBFou0an4JUui1BX7Byo8CKED0qsx4yBKD/UIo2XptDqOhOOe6srJv1z7K3q8NjbYj
	g4MQ8fpYHv4JippyVunI7Je2INbPtyj+qlD3cljbI5UvcY+5p0MFqCPgushzaQH2BBVHsnwtizL
	Fn6ncXAlHxv5jMCisJ6mqYk6PCO48CF2J85inQwyoAqciAdprjVeC749JSOjL97gMdgRrdEz9A0
	8xG/YLPUYfoYHSnK/RqXsJqUmYoCB9hRXlnAbt7Sz7+iDVpcUZTDA4Cm6Yj4foRxOVPxz1KMIfn
	uIT2Im7Yeap+X4x+EnmaPZhHacMKtUmJboFwIL8aVKeKQHYWeSzCdLQ9aHLYLiX6nuCxeoij7YK
	IEaNa0oU9MxymQjOY5/EiNiZyRcIZnw==
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr11703227eec.0.1791700804435;
        Sat, 10 Oct 2026 23:40:04 -0700 (PDT)
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr11703162eec.0.1791700803560;
        Sat, 10 Oct 2026 23:40:03 -0700 (PDT)
Received: from [192.168.0.8] ([183.83.143.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm24442161eec.0.2026.10.10.23.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 23:40:03 -0700 (PDT)
Message-ID: <9eff23cd-9f9b-e57a-9e50-a09a9e3520ed@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 12:09:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
 <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mwf_bK7gYBoMwL9zwEQ96WOLciiHP7DC
X-Proofpoint-GUID: Mwf_bK7gYBoMwL9zwEQ96WOLciiHP7DC
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acb2f45 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ijl8aQlCsSTD5cfZelNzAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=wXOP9t3OkE-NeulZwrQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX8rn0Y3TYzPzM
 rXRD2oJOwDSFv41Uhq0BJxmm8pYaiNrJhTzkq2PYM0le8Atv2XUOTEVLbUeEe2aIJ+tIpASHk2d
 Tc30+QBi9v1ce1DjZLEcagF9visPZRGCpqEtqM76RYh3QU4s7jChkz2Q4QJgN3hdNtP7lekEX3e
 7iHDqFEb4dTjUVNH7AfXv+51r7rh/5er2vOD+kaS9wF+cMt5jyNW+sPIMUcAHB29J5LjYiYQFTC
 0RgzRhg7OJJfxjFeVGmM/5XWTZW9nZryeRcO79Ue4WZS7gTmp0azpg6Yznjl8oviekma1e4AV9e
 EaLaSWomPQRAV9F7CQ48MKd6D+Xs9EXFagXPzKtDVISFOQ5gqAj3qlY+Yq7xeLYlGiTO+l6snhB
 /R3p4nrnuKT7QQzWNLPeXhpujnLxpADqyJuZzWdkWcNAvdMnuq2PejSWbD2mn09oRn5Q4KBNsob
 aI6mXHWsr3J/0wnQuZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX175Ejdp7TGHb
 Zbc3YXr9z6/Ct7OSm2+FeHrU4U9piBsipn1RWSJvkWnll6nAiVUFEiBX8BX3iQ4ve2NHM6/kBKG
 W7ADKILOSA5opF/wH+9bB7W0n0fdQIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110026


On 10/7/2026 10:59 PM, Hungyu Lin wrote:
>> +       if (!iris_vpu_watchdog(core, core->intr_status))
>> +               iris_vpu_disable_irq(core);
> If the IRQ thread records a watchdog after this check, while
> disable_irq() is waiting, it skips enable_irq(). The hard handler and
> helper would then have disabled the IRQ twice, but the next power-on
> only enables it once.
>
> Could the helper recheck the watchdog after disable_irq() returns and
> core->lock is reacquired, then call enable_irq() once to balance its
> extra disable in that case?

This patch is not about the IRQ disable depth. Its purpose is to make sure
the threaded handler has finished before the VPU is powered down.

Re-enabling the IRQ here, during driver shutdown or removal, could let a
watchdog interrupt fire and reschedule the sys_error_handler work, which
can lead to a use-after-free once the core is torn down.

For that reason I would prefer not to add the enable_irq() recheck in this
patch.

Regards,
Vishnu Reddy.

> If you use this approach for the watchdog fix, could you also add:
>
> Suggested-by: Hungyu Lin <dennylin0707@gmail.com>
>
> Thanks,
> Hungyu
