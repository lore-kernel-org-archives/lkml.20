Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E14E73AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677216; cv=none; b=bn93r1sKxrhl9liiLji3Po/T4rUDWRAkztdHzwjR/kwpBq1Ng5vSxUtFWuUZDkNjEx3/BxDzaoI9BgcHs2hifRUSJnrsC5mWeTE0jQee90ofIpjG1D65c7bSB5YIQzdgZu+EgQmBBKeGm2rqmeotsL2RoxU5HxSoWW/KjtuvKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677216; c=relaxed/simple;
	bh=Is+lHiAImJP4njetw1RNIkDlKPu3XtLpipofyQnPd04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKs9EnsyRhTV6nSpS8hvcQPSIkjZvDbEwQ2B1hoXiiTIIysqKtG2rK+URpKLiEneAcw/7+XvxwpPew2UFvaZyUI+6/q3gYSFre+i9YnVVhEqoNC3lFM04S90sSyCT8PIKIELnmWK8wH8LIQu1e7FAnINz7pgRTQfhxSrOHGtw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOHehtqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQcU3jRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOHehtqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQcU3jRW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U0FD4087146
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=; b=KOHehtqrVzWVW9G2
	CctEaHyqTg7r/dA3sEvAde5DDdhBr93n10NEeVhJLGAMXnFrAulfn5JeFAxwGLPo
	SG722N5GH61W+2rwGnjp1mlCin7g8F/zY9dY23kZ+n5+5HVJmtsLpMHLOlsKqtmi
	cQ8mMmGD4PHPTdC8YSbuDKCOHo4LehWyx69dFnLH8ZB55JEM1tKOhay9TZSbPjrJ
	ALKC7Hv/pGypCyr2Es8bCb4YF6qeZopBztATKWQzt9MqePgP2v1KANkAvXi+m8e/
	RcFxu5HhygGzSLCpapgkyxWX1ettiG+4fgGOH+5V9+JYGp/gEB+1Eq+PdaZhd9C+
	Fctd5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4tgk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:20:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9007047a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677205; x=1791282005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=;
        b=jQcU3jRW2r2gKkTiA9dkoThuMS1mCjhOan+BqFtC1L0/DN2HcGi3Grd1xhUmLHUm0l
         DBDVXgrY4ExrUxdBl5XCzYXp7WzUU4yHkz3D/tp1rLvUjmVDjbjYIfnHMiclm2erAAhL
         zOXxZsxMbtWwWkRJdKOSXkHi2QOce+ly92mP0scuzmyI80fKO4P+0ilmUHwkMOudKxh/
         T8GYzgB0RI/vgPS5KdCxVI0mSteXz74PRLiaNNs7yTqi1sa+9RExSgh384fRyAn3pH4l
         oLa29ACf8mpQEAdE7yoX2ShHnlBa03PVBztKviA0o+sAeV9dJJoP4aGKHiYvmnXQ/sFH
         GRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677205; x=1791282005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=;
        b=ohrKB4vopQIS/75J71qwfac0BP+/H8ucvxCnVWfv36ErvedbiU4tVQkYELD922h9eB
         Ln5J7TJbd3fb3FTwweG+5uVerRTGofF0iQB1R34oq055ly+G9h61bF3h7A4neLsQeqlo
         lmcbYEfnS92Fpb9YEAMxFyqiSqBKaMRQk3Y/qBy6jwynFCDdKLq5C5ocgTkRll26fWI4
         9gMBUO0MUbN6CrSoJ8jAUsBkrOG9GuowQ8OCJyPbOsP68QCs8PmEJAQqKcxo3RltNrCQ
         vhhe5MYkuf3UhOno4PqS8enYJXxqHMpjMkEW6IcheXipbXhVooAnjAqYTNqHF0AuzMRi
         I/9g==
X-Forwarded-Encrypted: i=1; AKwUvBz4A2T7uhfmIRXk8bcuSLfW36B8RkvZ6DLeXGiRz+aElMVg0ctEZNvq+hGqIAK6gQSKWdflyDmJl5U2sgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqwKdjigvOMYiOkXelzotfipSHH6qoc874j9URtTKtyHn2aAI3
	jMsetOYbUGMzpFdxub8pnpMhBrAiMhkZs4ogYEn1sMu4cmudhrH7KKvj40J+ORo4xGfGGRi4HuU
	5miapZS1xzAG4Zkg8IVuaAxP+ryOrNNGxRvqpro4oxgsYbtI2XlbSoHxuFEFMUaCs5PY=
X-Gm-Gg: AYBFou3sDGfeYI1wnHb87l8bMOTn7XOBC9PTKkzBX7af8gFZAAlxdKGQy24aWaqVvhf
	LO5cBgLaVFQuZjEhCXKEhnQFhUrZyMh0ei3ghrs5/SiNdgfid6M+skpi9U6K7MylF1YivS67hnR
	yS30AANG+o+vEgSpm4vxmX9ECXVDlZ+si0cTYqGlOjJc/eRsprcqBOq0JzblO4KbE3fHegTRjSq
	fPRMf1US9K6l0RWFcjyah0Iq8tS7AOSvbYCoAFdYsygJr4RzzXVXlZmeePBUCkfQLmbvlHystGi
	CuDeyAXY7kftUXVBg2LYmf6rGpTstSn5yXJiyFcqZb+fy0OuUMwkGbR4LO/rzPKRXVTY7AVAtaH
	WQpvlKZbt3AYeajow60R01SC9
X-Received: by 2002:a17:90b:17ce:b0:39e:4c80:44be with SMTP id 98e67ed59e1d1-3a0bb60b2ddmr10202075a91.33.1790677205204;
        Tue, 29 Sep 2026 03:20:05 -0700 (PDT)
X-Received: by 2002:a17:90b:17ce:b0:39e:4c80:44be with SMTP id 98e67ed59e1d1-3a0bb60b2ddmr10202042a91.33.1790677204730;
        Tue, 29 Sep 2026 03:20:04 -0700 (PDT)
Received: from [10.219.1.5] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c072sm5997988a12.15.2026.09.29.03.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:20:04 -0700 (PDT)
Message-ID: <e3ae21db-b777-4d3f-9587-50687d297abc@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:49:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
 <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
 <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX0wf9h2i8+W8j
 VXL5WaiKmq9Hxcws9RGsmwTfgJshuF3d3prUjc2RL5IDXh7nr/dqeqcIGcmfJ2ZyrmJeyZAeKXf
 dSr3H819WfmMy5oWX0NWZtjaf6HdpA8=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb90d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aVxM1FiM0cXrEgfon2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX+I69Ex55enPz
 8vP6wXFf3vD7bbzfmjwFOKHaO48cv0GOPzQh4RTbjmvpGiOWG71Yl518WPH93nNZgYQP4qvRlwv
 zUlBi6b4tloiZ5NdtswwDglvDjM1zJ5ILBFt8ZOnqxf9A7MW0mtDsoESFFr8HxKaWt94E7BFpP3
 dAfOZeBaA+Vyx8aSFUlvYy51KKzy3Ku3z8GEbwFjBbm9Y9WWdDCCcLijzGz3k5D1Nvy3eFzCJdQ
 i/Vl9r8Hpzb7+TDZRds2pgmlSzHekwWQcN4o69kBnd4pLIf7vP09hmxltpfDIB7SpN7dQhDa2nF
 eWLfvzjYQzSvTwL56RfhMtKhB/2Ag395x3baryHMJhQ6Gcg5M8/6a5MJ3Widq+VQIBcNVKiFNRp
 A3KrTRkn83gbG/ULiZVlq8hoONCD7nyOSLpEYuoKTcsuk+sJ8djTR/qDk+DRd9sJUkwzcCf065R
 tgsU4wZxpf/UhLj4KVQ==
X-Proofpoint-GUID: rYZERM9DXs2alf-hPpMuTjF0Hjge7c4t
X-Proofpoint-ORIG-GUID: rYZERM9DXs2alf-hPpMuTjF0Hjge7c4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041



On 9/29/2026 3:33 PM, Loic Poulain wrote:
> On Fri, Sep 25, 2026 at 8:21 AM Yepuri Siddu
> <yepuri.siddu@oss.qualcomm.com> wrote:
>>
>> RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
>> power path in hci_qca did not need to explicitly manage the clock.
>> With proxy vote removal, each consumer must explicitly enable and disable
>> its required clocks.
>>
>> Extend the pwrseq-based power path to acquire and manage an optional
>> WCN clock. In qca_serdev_probe(), acquire the clock using
>> devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
>> after a successful pwrseq_enable() with proper rollback on failure.
>> In qca_power_off(), disable the clock before pwrseq_disable().
>>
>> Targets that do not define a clock in DTS are unaffected since
>> devm_clk_get_optional() returns NULL and all clock operations are
>> guarded accordingly.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 7089e9b639b2..489a059e519a 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>>          }
>>
>>          if (power && power->pwrseq) {
>> +               if (qcadev->susclk)
>> +                       clk_disable_unprepare(qcadev->susclk);
>>                  pwrseq_disable(power->pwrseq);
>>                  set_bit(QCA_BT_OFF, &qca->flags);
>>                  return;
>> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
>>          struct qca_power *power = qcadev->bt_power;
>>          int ret;
>>
>> -       if (power->pwrseq)
>> -               return pwrseq_enable(power->pwrseq);
>> +       if (power->pwrseq) {
>> +               ret = pwrseq_enable(power->pwrseq);
>> +               if (ret)
>> +                       return ret;
>> +               if (qcadev->susclk) {
>> +                       ret = clk_prepare_enable(qcadev->susclk);
> 
> Why is susclk guarded by the pwrseq? They seem unrelated to me.

You are right. On further thought, the clock belongs to the WCN hardware
and its power sequencing is already handled by the wcn3988-pmu driver.
So the hci_qca driver does not need to manage it at all.

In v2 we dropped the hci_qca changes and moved the clock property to the
wcn3988-pmu node in DTS instead:
https://lore.kernel.org/all/20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com/

Thanks,
Siddu
