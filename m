Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708596;
	b=Zou7qkKP+ncm9aO0I1Peu8ERrk090zAr9AhUzy02aPxV/gidbucl8Wt51tRw40srZU5b
	 QRFTsUCVrNxQhX1CumTBVQ40I2YoTx6re2hJNtT/1p0edDbb1crfyppmm3Jv8y4PFgzVl
	 8jkjoqzPjCMhCXU0Hbyt3xfWjA/9aRsSW0QFS73o8t7ql/U3YuBvSb/ruRMrggO8XY5oB
	 R7N38lOxjgj86cd4pe97fTyz57BA7uKodZtCsNxWkLriUn6/HF64ecRNxeKgo9Pe/KUM5
	 tHyAaczuQJWwcI3GYkXkrYBOrEoCu3rD+zKWQXHTfXdC8ZwzIx9+wzF10gSgadMU+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708596;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CH7v1QYtuAIpGEme7SIV7J6uwrhadxjJXEqMvW5h55w=;
	b=L6jq6F2ab16w3br6XZdyCKAwFITBhpH2R17k1HjhZ7WPBs1vOeOG6sf+U1sTo4tug9C1
	 Y7ubJQkhVc8nYf7vSNVtI/4Kjxm83iYwevMI+ClvTs0dKSOS0CfWgtbXRuV0lbeGpawSo
	 H92svRn1KgY7+J52VKE0AVLWbl+76tRCfX/ClJlHeKqfRTV95RKDbBuKC6y0e82VUjX4T
	 HaO+9v882VTD8VYnhMAC1EZT1QEvM3z4QUl7cRDTDNoWokQDCZI4cLwmk5JaibXy543qe
	 0bzdS0AHFxQrextWjFqE5zSe7tuzJU5kLGh+CwJOUjf6ACFoVIZuK/ajEbP3sihDH9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jbF7EyAV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A191606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A191606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jbF7EyAV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14C11691;
	Tue,  3 Nov 2026 04:23:12 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9908A3F628;
	Tue,  3 Nov 2026 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708595; bh=S9BO58FYCbI1LYWmEmCYU6CXvki/lX9LlFi6yxqpDiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbF7EyAVJr6fqxqz3iev/lFhjI3sfdc7S6aXSUt7cdtglJ+kZYzv6Q5RRAstaWy6Y
	 PzukBrOhCYmQ0pZ7NlUgtLLrf94rKEQ5vJbIynQu5WOg9ECOoVO0CqbipqSwnGtQW6
	 QHs/dicXZGDzUYwV4lfuPBNTKekGnyifxq2zjguM=
Message-ID: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
Date: Tue, 3 Nov 2026 12:23:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: arm_mpam: plans for the SMMU integration series?
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.przywara@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261103121534.532108-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103121534.532108-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 03/11/2026 12:15, Ping Li wrote:
> Hi James, Ben,
> 
> I have recently been debugging SMMU MPAM support, and noticed the
> series James has on the mpam/snapshot+extras/v6.18-rc1 branch. Is
> there a plan to merge it upstream?

There is interest in getting SMMU for MPAM and more generally IOMMU and
device requestor in resctrl but I don't know if anyone is actively
working on that at the moment. The latest thread on this topic can be
found at:

https://lore.kernel.org/lkml/arKx__kOPe4B5gDW@agluck-desk3/

Thanks,

Ben

> 
> Thanks,
> Ping

