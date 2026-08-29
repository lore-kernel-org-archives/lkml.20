Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87037F303
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787986794; cv=none; b=UTsG9kNStYxggR8dNYjtigauLV90A/mRCuCeQG9G/0+WL6zmYuErjthQE6XPK0DUzQ1tKnl+Wz9/aHTKkafSRL3Epu9zLNbFLoNETSzgjWhC58SndegMtbCnR5LnK5+7cf7HxzNJ7WvToprCpPA9Nc03YE7G4FfvlgMJPBr3vVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787986794; c=relaxed/simple;
	bh=5fMCBdzwLA5onSHUizBNdTx2ky5fA1AqgqfKUksyyvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=umc9uBCv5M3Y0Hg5P0Umx20zq3hfX/Yy0kHY6Znm0FbSpsMmla3f7gMfVIqnlxTim3q54ZykkEfpHw/gCerDGzc6g4LcQsOp0MCJJjjbypNfZND3gJ12P70OqRynWpIqmBScNHPQYY54zRbLYE4E9aUHq9Z6kL31reuUnMG/4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org; spf=pass smtp.mailfrom=skogtun.org; dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b=UXp2WnFp; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skogtun.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skogtun.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skogtun.org header.i=@skogtun.org header.b="UXp2WnFp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=skogtun.org
	; s=ds202512; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=BGdPJZoaHgFpDX/qpBzTnrtD0hg+72iqg/nLh6STzHU=; b=U
	Xp2WnFpdX3CicEDu2Swax9OLqI+1mzWsQAjgJCfTV0CM3LSPnLga2MfdSwM7hm2i8bZkDs4MU7Cht
	clIYzYzr/z8TFUEvlpHudajoviY5OczdMRm4v9YNYIM1pFTkShJ3BLHw9ojWKryuqAMledz+kl318
	Na/X+3DmHhO0WEmkmBy5uttekVZPmx1bCiSjjibQuLxvnm1Xi9dkErecEihCy/LyGX6IEEM5Cp6ee
	ZlczfE6wk408MMAxng+2iCQ65WVaEwXN1YNg4I2Nlt46dYEFblaBLyzx8EoDbRTyDuiaAVW6tQFmQ
	nJ8wYnJBZDArS+ScSe/vemCgWlAqLLFXw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1x0D2b-00A2s4-6N;
	Sat, 29 Aug 2026 08:59:49 +0200
Message-ID: <7a9796d7-5484-4369-a5c3-21a0b8127b08@skogtun.org>
Date: Sat, 29 Aug 2026 08:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Non-working USB mouse
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Harald Arnesen <linux@skogtun.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <e31cb69a-e5ff-4870-a9ab-8a8c4e35e445@skogtun.org>
 <09570109-8cb8-4c43-b3fb-d1dacf68c41f@intel.com>
Content-Language: nb-NO
From: Harald Arnesen <harald@skogtun.org>
Autocrypt: addr=harald@skogtun.org; keydata=
 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
In-Reply-To: <09570109-8cb8-4c43-b3fb-d1dacf68c41f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Wysocki, Rafael J [2026-08-28 22:16:23]:

> On 8/28/2026 1:21 PM, Harald Arnesen wrote:
>> My Logitech M350 USB mouse does not work with the latest kernel. 
>> Pointer doesn't move, buttons do not work.
>>
>> Bisected to commit dc948f8b384a516ac5c471eb9382959f838e02f4
>> (ACPI: scan: Defer device power initialization), which does not revert 
>> cleanly.
>>
>> Attached is output from dmesg, lsusb and lsmod, both for good and bad 
>> kernels.
> 
> That one has been reverted from the mainline already.
Right. I can confirm that 7.2.0-16172-gcf72cbb39da8 works again.
-- 
Hilsen Harald
Слава Україні!
