Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544420;
	b=PTsZ3FEU/nehC4Bs37LNPQE0QzocJm3aogG6THYQNLrhXJIvEJ8hwtTguDGiE2GLQ3Jn
	 FyfYBxifvOZzco2vDv4y1gHWtoRKhshO9BGNqxkJoj/oVhhkOcm7K57Mhwdqc4ubnoIWG
	 UoF5+EJzg+PYVMJXuxCN6MFc8ALmQCDM7fEy4D829xgCyiQlMPgumeWBYm3LV59GCboE1
	 R7Ym1FdtUy4b2eAl5LO6heDjhvbJMnaDN5QPIf50MZ8+LF2+0WwU3z5xXJ30vxDx3yY6/
	 GnnsGOPbtMFM9P4AbnpWfYyBpolXan72g/aLvbRtrOXPazcnDgWKFX+S/+quZifa2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
	b=D4yvKpmyqrt4Z7Q1ti/gDMhr1v+Z1MCj8Cs3ReLcmGk8C19lerIB7+9GvCV1cJgg+75p
	 ZNnt1kNLfEma2w0c+BGTUTAY+cP+G9XpOO3QX4T0GDViUk1pBRO2pDJhNUwW7GoWAtyns
	 w3Sle3YHPxuOCLFQZAnAeTJSeWNeziAMp940cI+0ph/vBXqrtuEI3Rl7d59OZIGWfhqDT
	 zBArfZyf9oMAbpGj8zVMKGtwmxbDz/n+OUjzAKSGGGdRnaPs9shr3/6zjrqnl9+88ThNU
	 US2+LqnDAhIpaSXay8+CwJrvTiSFTIiADTC6eVhCceynzUF9OKuDfOp274EXrnr1b3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLEo5URY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1KEIOpq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E5B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLEo5URY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1KEIOpq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2JvEp3116243
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=; b=pLEo5URYD/JpUWO3
	ZcOydo5NS7NewYrfU/DC5G9qaZO1D6XbPO06nX9SoG50AkvhBhfUQurdsagrlbP4
	w+2fK8K5ZrP02zcNyGbB95hT2h/uPSBt0hGti4dtpS3xXhgGAXBpFJ5krpR9FCgA
	Bl/hJMSuyj5bWpuIOkvVbB3u/dTX/bkO/0IqydI+zhL/jRhB3BB6izerqIkdYkdn
	293JVWUuUMKw+XUOYt8pea9ws4a2UFp9nF3PmjWJQFgHZSjRVdw99jF3WGJWQOnA
	rj0d6mF5C7nIzXrb7sd/CVmxlp2k5uZIVQJ0IQ0DLmMcGuKp9olV/hkBtBafo3p1
	9fB0WQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdhh0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:33:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so694945eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794544419; x=1795149219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
        b=W1KEIOpq8M/3xu0xVFX/dQZK5jgI+fMA3EhGQ1lxG4GtqpLjxBXm4SQSe0dScQ8+vP
         WkukR5fkEHB99ORLHXU5VuCrTzw+IKBGK1dBAPacjXeoS3u+TJ/2r2m1lM2xeoMgqAAm
         L3VzZxE/t3Ue0B2k7J0jHAW3BKfKf8nAepy8vpG+e4KbgXpHi0R5aMSMNxuwDHrnZT/i
         5JzBd0TWIp0Wn2KpMkO5TB0pe8jAyYrs5RujIA/n4DHPJBb4s5ZdD2tvVS1Pc5+4ZCDf
         QdtZaYELP4eOGvZTcdxXhStdi2RzMlK44+LjM/kmUrwNovt5qCpTPhx8kODAXgt7n+mt
         HyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544419; x=1795149219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KEaPhuXG72mBW8WdGwUc5nutV56+4/Q4XKgy03FL/k=;
        b=uwBa0nQR7aHbQLlbLXU8TIdP6u9fFiVJoqKBbMKiQbzMKEUtkZUQrdmIup/Fv5FMP0
         RS6R8PTAgLyBin9coS2NWNccxFzPUYEUAoPtvIARbSJGmFQOVdfFNqwNpjMPkuO64oM7
         Rf10Wdyr7TlTK+Zg1V9WVAUqEtHpi/0UNdVDLir5eu7/Qr1ZpWWM/3l86KS0ocbsYKI8
         RYjw2LDYRsjIeUDJ+7KSX2Q1NCCYWSpbCKlMeuuUCVc7+N0FV1eC7kzRnZK+6SXPTgNw
         Tj1S5EDmz20WXFmPqKzJ0Y4ipiUjhA4oPe/pylShDKR6qKcQyl+q3AcvYXtTkdO58b3O
         HPTg==
X-Forwarded-Encrypted: i=1; AL+hErE0A/28gku64u9G97nw/2K/fByBRs1oWsBWVm3cnwudp+uuOv77eHRlGA9e+NZ+pFCyfZSrPJO2mKdOhW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TJKgQRwNoDiyh6O9n89Z+bbizLuCBL5BoUy3SbU+csJWgXiNv
	05jwgYIfZ/z6Uqe1HR9ThgZ5iWpiGd2oSR8mE9t9kd9w/Xp2aWTybNLZ+QbCINA78DmzhHUVUM+
	N+qA6uT479hHCqoKP0WCErmfh5DWqLGAVaCPR+njB4W4kMgqsQUM26VOBW6tvt59nWK0=
X-Gm-Gg: AYBFou0cc5VDfmvqkWCn9673fB0bFs7RqViEpHDG8j8cEQNDitlnoCYtqmTOG+pd4Lj
	McYPGwWuw3vijoNJ0Y6Wn6kNeY+LioZS3BvgewT5dJxCPyibQmoRtst+qZJAknLzVaK/e+rcgFo
	bLE8Qqktex39W68hmZjcGKXMkD1XzkNIwOFqMxTBibhYzbmkCB7Ir+TI0rCuUGNIFnJYyFRgEhg
	lHgISauNjpZUKQoAt7O5DhWNPfjM/JQFDZkKBCQ2D4rjXEqq8Fe1SE3w07pPjsdYddJQyPzg8hE
	iP+Nlz/mr2PLNdnND3AMbefqDwbBD5sJRaFEvEGrwDsMZzVIM33iO151cAGlV6P3b3UCEvXxprf
	uQ7MB55IbzwU6aa9WOt0e8pfTUmjUBseRVAAIpiwMgXxiiqhA+TpuP/TI/YyTf5UiMkHLZpDWUF
	DunaU=
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr1208993eec.16.1794544418810;
        Thu, 12 Nov 2026 20:33:38 -0800 (PST)
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr1208959eec.16.1794544418106;
        Thu, 12 Nov 2026 20:33:38 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm6220492eec.21.2026.11.12.20.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:33:37 -0800 (PST)
Message-ID: <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:03:32 +0530
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
Subject: Re: [PATCH] soc: qcom: rpmh: Fix use-after-free on timed out blocking
 requests
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown
 <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNyBTYWx0ZWRfXx1b+JKRC/9Mr
 uybtzwRXPZNrWMn2HDQqNeFwRJtqlAyEp1xNrhyQzrSS58BOKBzwqWwmI8WupGxw94zyUQMyWiI
 pJwLKW6eQOr4BPm1zZU4rzBebMqYxI0=
X-Proofpoint-ORIG-GUID: 9ETex6WuLnBDMzMQt7QBnmqij9qBkNVK
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af69323 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N4WVbDJ3b7wuBwOiC88A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNyBTYWx0ZWRfX8a41yx7Nk1cG
 kiiEEcVeOZsT4YznGnrFsZj8e/DylZ0NSB8CJylFv5Ot0FrpcSzeSTdx2TEvtwoFVXMAmKhdRdn
 Q4yZJSB6g2EiMp5+TE6lkywy18ZvUmBjC72wqp56nnLIAB1E5VcMIbx/fWD14DK5qUiYStHHinf
 SZJiBy+67hDSyWq81io2PJxusdLnu5D8cHaX5dDK+QMRa0ZFuEDmCVDXVEiaPmccQ8ZTi2r5Xe+
 qZIFM3CqxB6uIUxUDa1CTcsyOBAy34RbB27oZXEVtBZjfZJFhwHIE/pMywxP8UkZTAxOBDGjSNu
 KPucY4UEgtrHQb0Oa0GpvHHNo5ZfM4ba4WMzzik/xqvW+HTAEytZV4fg5xYDlD/hDorI7blUc9b
 kEgBGc0LgFpInNxVHs+yOQkuRS/xt8hgv2xRmO1uIzdt+JcoS9bl0YGXl0YhmZxSgEenfjhvVhi
 40hOw6Ao/eK1llADNlg==
X-Proofpoint-GUID: 9ETex6WuLnBDMzMQt7QBnmqij9qBkNVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130017



On 02-11-2026 16:16, Abel Vesa wrote:
> rpmh_write(), rpmh_read() and the ACTIVE_ONLY path of rpmh_write_batch()
> hand a request to the RSC controller and wait for it to complete with
> wait_for_completion_timeout(). If the wait times out, they return to the
> caller, while the request is still owned by the TCS it was written to.
> For rpmh_write() and rpmh_read(), both the request and the completion
> live on the stack, while rpmh_write_batch() frees them on its way out.
>
> If the hardware completes the request after the timeout, tcs_tx_done()
> fetches the stale request from the TCS, passes it to the tracepoint and
> to rpmh_tx_done(), which then signals a completion that no longer
> exists. For reads, the response data is also written into the stale
> request first. This corrupts the stack of whatever the timed out caller
> went on to do, or freed memory. rpmh_write_batch() even documents this
> with a "Better hope they never finish" comment.
> Fix this by giving every request handed to the controller a reference
> count and by embedding the completion into the request. 

I would prefer to use BUG_ON() instead of WARN_ON() whenever timeout happens
just like downstream does rather than to handle the timeout cases.

In cases where interrupt never arrives, already HW is stuck with no way to recover,
so current implementation of having a WARN_ON() and allowing to continue to run
will eventually end up in BUG() or crash somewhere else.

Given the RPMH_TIMEOUT_MS is 10 seconds large and RPMH hardware transactions
expected to finish quick (within milli seconds), In cases where interrupts arrives but
CPU handling it after 10 seconds, there is something wrong. 

I have a series to print debug info when timeout happens at [1]
I can update WARN_ON() to BUG_ON() in v4.

[1] https://lore.kernel.org/linux-arm-msm/20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com/ <https://lore.kernel.org/linux-arm-msm/20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com/>

Thanks,
Maulik
