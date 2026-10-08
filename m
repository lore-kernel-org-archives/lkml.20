Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C286289E13
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439943; cv=none; b=gcYqzCHrMZ9vEyagXq6rEVknxvwIPFjKgHyyU9fK+DTaPMkLDmYl7GwV3YqrY6bQsc0yAbPFSwKJy0/vBxZpQCSwXtBrcEJ8SQoHou1IzMJxklDiTzSyyj/Lk3wxBbKRra9DDkJJbG5eUxtJNBHRiBCQznxNWI5PhPTelRlz7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439943; c=relaxed/simple;
	bh=j/KDA/fKy8xM9BodrXOY4A3YfMh6Tmd8iHDMZBRj+kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWPQhRsCNr+8oajF6EnC9f6uwq4TOb3tWA8G2p5fabTBkeaLuNrRsoDAoOpmzJ9cnN6HIJIVPgMWxpyek7YsG+Mydya+pwgIKsR6Rl038Z4/83zGgs06q/a1znvCo0Pm0F5ldanpyDBo2E0YlNxcS2CwxIl1ZKdq0tw/Eb9TivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1eCv3Pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4TX2reB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1eCv3Pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4TX2reB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZM4313878
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=; b=D1eCv3Pz/KiR4aJz
	ljFOxnwpD8ujjVEFmRhkMJJOVDMH2uesmmXaawHFNW1/QHCxRkiZbUfEku2jWqIL
	HYNt9ls1BrNYbV3iTREvMKmVnu/mZcZBvWze0zeNH8aVCoA9F4DZPgVWmqY+p1Lh
	6O9zF1Rpg+ivD0qZUCRznZZ0XReBLHENbOW5qQLKUz4Ezn920uPvIGxnTQaVRgFM
	ApM6DoUg0nozIkENTWxeH60GnNRoDenO/vn8Z9wyHIecSAlBYthJlZtXmakNAEPE
	WFJgZLf2woO+yvTdV9qEdCzy3mwqmkkRSd57KVmk6lKyMlDFyYdIkP3LLE3Xq5WV
	c9nvrQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31bx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:12:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso5031723a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439941; x=1792044741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=;
        b=L4TX2reBX+kMcpE7a573C3Nh5Moys4qbF8Ag//A1r3L3fc7cAhq2jklaTE5Cv4LuZv
         7uzcjleQH/wP954Xp+kwT6HYr6dy2SX+qCpmiMHV418nQa/ZJHDHMwWDpFLiowU27Gb6
         49HQR845NlZVPmE+XX7SOdfssuA2OWkd/NIoWP1tmFblNH8xDrNbmi80msCJ8YZ/8ewA
         gJ0sHZRnYWveDOZdBUlwFKuzpXIjf4fLbzlWV7zKQZ6qQWl7ddfjQK2K395uu6FvzG4X
         ynx7vhiRIu/ZcXX7KmfBnDTbEAPMJuMhZAmgnEE8J0w1MxdJ2kMQJTjqzSbTFeNb9P8H
         zCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439941; x=1792044741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=;
        b=gmFODUpoaN/Q+EM6tWHCutK0suCGMU/XJijWW+zkHgprAoz6mYO87E1MEmlesUZMQW
         Ba6uj5N0UKUcxX79bw5HrZCnWPaEFV2CFvsOUjcme/ozD4YKSe4vlgl6J4lwPnHVT25h
         M/YOVAmSF46dgmjFbDDzsi5kQStkvHVyWhjjnrTZ6i27UzpfXCNNl1oIN5NXgNRFtaiy
         sjaEqL5nM15tv9gj6tBDKJbMvaUZeTFlSbZ+Im/OHnpNMW+9TjEcPOtVTPf30OMuswOM
         yqKIi6KT6HGlEUU3S+kzpAR80odr6pUdYXo6U14Jg8T7nlbqjlIAgTOOYW9KMNjf0Gtd
         dAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcVL5f/Owt0JH2cUiWrL0adZtOHZ0SlcqxsGkD3Hp5D+Bdyaw+zcyg0LLtJL+Da3EezJI8+uSS+liVltY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsVu9WfoRWJRIoiMIbQJKfMYtZeEefIsSRPIVJz06r0a55g5Gq
	jFtNfS1ofH6E5VXvvbv4oESGmfUFwFqzU4uwJuVPW5vAWj7pSOWSCVn/+aqFqgWcKCMmLjEQwgn
	CPBQ6+RjXx+XZUnFWaOgaT686Rv9+Ac+7ojyUDLKeS6B2sTcmcfgSRCA+2lcQYJ1LE7zj9J0iqI
	A=
X-Gm-Gg: AYBFou1D8I/uI+n47G5djorYGf5GfMZRuiDcP2wBCyAct1MZe9iodnzrzLiJiNLVmoN
	cs2awRuw1+rVJCWyfM6Jvd1Xc8WMXrOmiYQqa8M/ZbabrrdfoWlJzPAx15EK1D7dKGBTAv94MB9
	cTQLIXPhH62Cxd3NFU7qr83gPjCbH1Jw+yFCkSfw+0lfY65MhLyddz38XUJ5U8aT6Y2jX0S2C5z
	/18/mVrtEtVWp74vUiM2BbXW8xhXR2WdZyXWwuJ+SJoV3SxHq2aOxiixo3RA0clLkt9DRAW/eGl
	TVlLeTJmdBzDInARdvqYhaJ7FUIrr1Xg+I05y+iOeyAfql5FzutOZvOK3YIOU+nWcjN/jkCq6VS
	jGy4ESWS8Y6Lp5MtHf9naIjtnQy532/E=
X-Received: by 2002:a17:90b:534c:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a8a1964d47mr3525631a91.23.1791439941077;
        Wed, 07 Oct 2026 23:12:21 -0700 (PDT)
X-Received: by 2002:a17:90b:534c:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a8a1964d47mr3525609a91.23.1791439940636;
        Wed, 07 Oct 2026 23:12:20 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm3393121a91.12.2026.10.07.23.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:20 -0700 (PDT)
Message-ID: <7127ab66-7413-4f54-837d-b773b75026e9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:42:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
 <fb34c262-5c91-4beb-a792-f00da203d1b6@oss.qualcomm.com>
 <wkuia7mvgcwtemuib4abzjffrceekzheuyksqdzrykusxzvgxe@77ggixknltoc>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <wkuia7mvgcwtemuib4abzjffrceekzheuyksqdzrykusxzvgxe@77ggixknltoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX53dEP+zs5VfH
 LjyieY4x2AOXzltn2aDnxzLAiUW1lqMeiDRFJLs5JATbyynxT/+G+nM0oItDFDtsfGuCBgODZWH
 qCtQfkaaOYili4jxTmgIPBxGKzGKB0T67qNrYAMNXzNC9yQklOMwkpH8xzk9dyDndze6lVouRce
 A0WrMF75mWEBCyumlekDYJyaCXyCYQGmruEnJOC+BYbkh0Fxv4m66Xn2IBJlq9zalh1jr/nhB7T
 ZZXpQYCbZLvseMoSrt7wPyg3rY/ZVTzY39DGUz8oAol1NKy8odwb3B1tGyty/EfgQc63NpyztjM
 YZ4c51Lt6FBzJ9VZAhmIXqKxxfwxiLPKgP7QXR1KrP4h9etmMk0YL1WD2BcCvC/qmUm5Y715VvZ
 j3nSxCbWIKk0JXcjm6z/16jbi9LI+MQdYwMK2M7tS5tYEo4FeaTEWDbYtq2CDBw46jlCGFQGHRm
 ikk5Cr/jgKnyhynA9AQ==
X-Proofpoint-ORIG-GUID: 3TKKd10JvxYH7vWseEoZ2Iu0uP38lLwE
X-Proofpoint-GUID: 3TKKd10JvxYH7vWseEoZ2Iu0uP38lLwE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX+tBy/2FVeBRd
 37ry/Yq7kirqHjdqOPE1OLtZllRw+9sYeqtnTr66O1PA34fkf0xCO4sCfVrPSdIpr+rj82A2PgJ
 nijwu7zfTvEp+mBfJ0eqFUj6EFgzzJs=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73445 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=J_FEIbamH7nEwTU2i4QA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/13/2026 10:38 PM, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 01:00:27PM +0530, Kishore Batta wrote:
>> On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>>>> DDR training data captured during Sahara command mode needs to be
>>>> accessible to userspace so it can be persisted and reused on subsequent
>>>> boots. Currently, the training data is stored internally in the driver
>>>> but has no external visibility once the Sahara channel is torn down.
>>>>
>>>> Expose the captured DDR training data via a read-only binary sysfs
>>>> attribute on the MHI controller device:
>>>>
>>>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>>>
>>>> The sysfs read callback serves data directly from controller scoped storage
>>>> and protects access with the controller training data lock. The attribute
>>>> lifetime is tied to the controller device via devres, allowing the data to
>>>> remain readable after Sahara channel teardown and ensuring automatic
>>>> cleanup when controller device is removed.
>>>>
>>> If this training data is RO, then what is the use of exposing it to userspace?
>>>
>>> - Mani
>> The userspace component will read this from sysfs and save it to a file
>> named mdmddr_0x<serial_no>.mbn.
>>
> You need to mention the exact file name for the read data.
>
> - Mani
The exact filename used by userspace is mdmddr0x<serial_no>.mbn. For 
example, for a device with serial number 0x12345678, userspace saves the 
data as mdmddr_0x12345678.mbn. The file is stored in the corresponding 
Sahara firmware directory. On the next boot, the driver first requests 
this serial number specific file and falls back to the default DDR 
training image if it is unavailable.
