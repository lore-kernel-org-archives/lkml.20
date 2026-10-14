Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAF3BBFB2;
	Wed, 14 Oct 2026 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969157; cv=none; b=Ipq4Lc8ecNrJUfSQHyMGYkoWTS28nxNmoEwKVUMycnoNIlPM/1CbePytOCQf0bMBwbD55dY5lpC6QSr8H4L8sHtds6ec2U81jTuNmgZXZD1Bz9NxtomhSO9zSuRaWJv9kpLjljnENDavHjyDiWIcWW7SQ/tE16KQhXve7gGWV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969157; c=relaxed/simple;
	bh=hK91owu3CIMmiIzqFkzkSTbAGhIDGulLKvYuiZCJAGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVuwRItZK9rIbzHJM/tvludlOrAcGiArK+XForrU/QPdqMYbqIYZwUMqR0xT0s7GzJqDBxPtu2ebEnz2ykyTxlafkoZ5aODHAcLROTafoLBYFMiauwVUv/bd4IVqYSgUKXBrz4ZbrsLIMAgAD8yUiM+ajgfZ39gUw411H7KHZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1791969119tcb4ea60d
X-QQ-Originating-IP: SB5iD+s/jtIVlg3nPPo2Q5OGSv0OnUuvZDMVUw85Kwo=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Oct 2026 17:11:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4673881643528853335
EX-QQ-RecipientCnt: 10
Message-ID: <C40ED949A0A7F842+faa4a30f-d228-44de-977a-fa73723045f9@radxa.com>
Date: Wed, 14 Oct 2026 17:11:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: sophon@radxa.com
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
 <bf865b13-4773-45d6-a93b-4db4f77b1feb@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <bf865b13-4773-45d6-a93b-4db4f77b1feb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NhdiEwnVOUqE1gnLn6MZhwXs/7z7gAOsdYqoSGcOf0NvG7JgRzLE7NUx
	PsID5qYDIHuhtUaPEdxpUzD1Q4O+0hSBf9ovxDIsVOrtwXo9HgxxwFhYZ8N09BxgjYDqSfq
	62doNaHQXgL/oZQBRAx4Tle20EF1P+8lmXRLs0NHvY/MImn6fvXiE/qoGocVOXawgoaRfUC
	fww55LQrtpHUOeA+XPVDccCzvUlmRqUY7wprYuyOnw+mRDGsQ3iWvNJ7Y7GD6f8ZUnSE4Zy
	QwLO70KXt8bruyz+94UzpjpaSmPDnlw+T+vtdVhHGkGlzGuGbTbs+n1SQXuPIZKeHo2BD7O
	9d+oFFbcGJaZKOHnxNOPO2GDzG/Bxli/gn4ItHlG7wiuk1VKiN08X4qTZLkpszKTEvvRyEK
	AUX6HUuPACIjHqgMeVdTRvPb4PVqODu2OtTEvc9CV8AAu0ezO3oYJRQoKhsXYxGloTyWCpC
	MjMR5fzEKdOrwK1lH5NqqUrpAcZux/m111T5Qo6eG4cgjQJbMA1lye1O1Foshn8OsULrYZv
	aiwHUy1eijyHitmWx9SWEIldYsWMqcIL1GSikBnsm/IErseqY9RkHgNlwCkRarcqAgEGPbp
	wWyQY9oSuUt6i9KLJ897vkG6da8uR5MnFxnPpijt4AfJIIy8EttGFzXnKGTkGI/CvMuNNXB
	wNIE3/gonhbZRk+Tk58IWQaJfsrP+sC/Z9z/WbFfz/TV+HDtGWWG3Njw/Iho3uLLk+zy3D6
	xMU6L7urcyBqXwufh8H0JT5a5cf+MS7d5SX5s+PPxHSHvpj2H9ixJNbag0F4rMAV1pbs4pI
	zsSaF23bb4OTxLigmADddixTYIysDIl7cW2/JXGZGFPTxAMsgwHw0io9ed2C8fyFcnpxqde
	bCh6O8a/4SqRtOa2kE06L/ibcNBv8UfyJgNsRdQHA/3LHN0fZ2+neDe+fun2iuN2JtDGQxG
	ea6pLH7J/i2yOCSFGmR9g/dfxPdSDmk6u1GF9+XCzFCV9N8YQ82l2vldA0YpgSJxUyKckye
	mvhNvEusGi3v1dHq5jAksadIUK9X8X1Z8tp137cA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On 10/14/2026 4:59 PM, Konrad Dybcio wrote:
> On 10/13/26 11:59 AM, Xilin Wu wrote:
>> The GPU SMMU interrupt list includes PMU interrupts as the first two
>> context fault interrupts. This makes the driver register the fault
>> handlers for context banks 0 and 1 on SPIs 678 and 679 instead of 680
>> and 681. Translation faults are consequently left unhandled, which
>> can stall the GPU and prevent recovery.
> 
> the context interrupts are 680-688 and 703
> 
> Konrad

Thanks for the clarification. I limited the list to seven because IDR1 
reports NUMCB=7 on my board. However, DT should describe the full 
hardware interrupt list, and arm-smmu already ignores entries beyond the 
reported context-bank count. In EL2, IDR1 does report NUMCB=10. I'll 
include SPIs 680–688 and 703 in v2.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
