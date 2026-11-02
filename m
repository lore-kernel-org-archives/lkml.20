Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603162;
	b=hvm3/9bqO6g8e5kJlTWngxLFnER2r7AeRadCMb8zt3525DcPNnr+3m8KtVtTD8agKtwv
	 YPpdXZf5dEJwclSFx05gBk33s2LzyTef1mo7LhxPgLLljebJerFaFCHT5+ZkivlymOXSw
	 c9zzZ47upz72D2VkyWDa9380R54Ff1WQc/nvPgehdGNwNQO780yZkmANIAzttpBnekHaW
	 pEK4IEqswOfdcA+SF5Ii1EfmTtbpc2Rujorc0DPeLUkCHyJTSNBYz65YDolf/TbNJQXTz
	 Z6nXkjz6sDkan1OhswVupJ1UcsJIEIQBJ7vaz77BAmvpWoexNSct7IKigq/94rzF/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603162;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=fxvxOyfeL3TyWM0HpEr1pEAAoVWbYQM/Qjo+Zf2T8og=;
	b=orVsQvxyX3W0z1J3YHM1rB70W0JJ50nNg69igFUqkpXNUMJC+dCGBpwyASsaZQJo8r1g
	 3D88Ot3e1DMw7fUOew9uZmUNpfG+lIgW4o2BgOJOaenYLYrrnx89TqtnRHNFWz1Sn4er7
	 uSto6ciMWJpSkoGe8sAbWNXwtAeyV3U41l36jKOg4y28DldpUtuvxOPyn8jebrn3Zu5Mr
	 EnPDC53cQCI2YBPEKWXcFHd8E/7/SXFTBkocH1rqJHwVkYwduVyygBIDdv2CX4OwdZUHf
	 s5a8zwJYDbRabA8aneVUE8n9teUcPRWdfhyhXb1Yo9KtGVnCy5nlyLl2bfCdfwA26dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=sGnJcCUZ;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B563606A326;
	Mon,  2 Nov 2026 07:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B563606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=sGnJcCUZ
Received: from [10.94.176.45] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9BF4320B7166;
	Sun,  1 Nov 2026 23:05:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9BF4320B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793603147;
	bh=fxvxOyfeL3TyWM0HpEr1pEAAoVWbYQM/Qjo+Zf2T8og=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sGnJcCUZ7VkX7g3iow3/Sb4W7WNHZyE49vUZRRluiUCM+SPVRuMjClxkOeHYwnnLD
	 jrRADyKYJy+kZmeK2iB5TMCBG/Ii1zQsx8T1UeyxJ0+7BLiWviPvVQKMk1MFedE8oW
	 DR/4wYzsxJu/29ngx1zV4inNQ3vAo0znXUSs0hnI=
Message-ID: <133548dd-21de-4400-9acb-a424df75c90c@linux.microsoft.com>
Date: Mon, 2 Nov 2026 12:35:55 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
To: Borislav Petkov <bp@alien8.de>, Michal Simek <michal.simek@amd.com>
Cc: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
 "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Rob Herring <robh@kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "rric@kernel.org"
 <rric@kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
 <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
 <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rama Devi,
>> XILSEM edac device is present on Versal and Versal NET SOCs.
>> https://docs.amd.com/r/en-US/oslib_rm/Tool-Configuration-for-XilSEM
>> (Actually also on Versal Gen 2 but firmware interface is going to be different).
>>
>> I don't think we should try to integrate EDAC memory controller with EDAC
>> device because their usage is independent of each other.
> 
> Are you saying that you will have this XILSEM hw in different platforms?
> 
> IOW, you will have a Versal or Versalnet thing and then something else, and
> then XILSEM will be in all of them?
> 
> Then perhaps it is better to have it as a separate EDAC "driver". In air
> quotes because this is not really a driver but simply a wrapper so that it can
> be called an EDAC driver.
> 
> It all depends on what hw configurations will be built.

The v2 [1] had a separate XilSEM EDAC driver. Are you planning to revive 
this?
> But if you have XILSEM *only* with Versal, then I don't want a separate EDAC,
> hm, driver.
> 
1. 
https://lore.kernel.org/lkml/20250722160315.2979294-1-rama.devi.veggalam@amd.com/

Thanks,
Prasanna
