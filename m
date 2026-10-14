Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905B4AAC50
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981565; cv=none; b=f4jgPUrzMhH8PKZJLNxK2RsVbmrpmgF4ISi9jyTX+6KDAatAF6o2l1c/yzjOW0z+ldSChLOk2iopqRMiWogaaotVC91vdA6AT7BBXIqzswSEBg+w8AI0cHxo1pbrRf3UsWmJh1lYbbLlmvXZljx9MHKWjyW/VjrUkBB9QZg1GmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981565; c=relaxed/simple;
	bh=VqCku/yr84+wi1BYtwWHIO+VixKt7ok+NpIkwDBqt8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGt5XOCBY9eP+UrEmjSq/j0i9BEIiWhQKdHh79kMdzFLpm8xlnBam6roxNuKblN2AGDVeicNaTmCSzPVLZ/iAxBIgvPuL3oEdvEgxY+3LJx15prVQ2NzvA+p1wckoD/mUMmqGKygaRLf/jP5DIZF9dJesMzzA7DgcYeJwyc49U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddG0OXR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddG0OXR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B221F000FF;
	Wed, 14 Oct 2026 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981563;
	bh=xs23ZCbOpRQvVMNf4hJDdJp9/IHWSovb0CNsgvI34vM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ddG0OXR/A06ko6m7Cvzkqe2iSqfekBlGQTdXas3ZQMkBtnbnkAjv6bd2iwlUQBiuy
	 6mRgYfOodX3xCjBnBGjWijIE/quWBn3s7q5X/a43dziXpACZNju9GhOdXJ+X6dd7Pa
	 johR6ztmFiyfqVs/Nz7g8phXGVDFA451KRYqGGUuou7CcQrBau4WhH/KCJvEzvsBe6
	 v2AA7a5dOR+ypmQ4vftqcAVlc3z8qGPhbYPnO/EAxN1YlnKKZB9SubSoMDFwF7UyDy
	 jNHoPEIZjDP4erNAqf1s6OUsg4wHrH7dwT5prBYHJBpWMQOxEVVa3uLdESgZHrbH77
	 i2Zux7wBr/CEw==
Message-ID: <c373cb30-a505-414b-850f-4356aa68595a@kernel.org>
Date: Wed, 14 Oct 2026 14:39:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/Kconfig: limit the PPC_85xx DATA_SHIFT range to
 STRICT_KERNEL_RWX
To: Julian Braha <julianbraha@gmail.com>, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20261011113108.539470-1-julianbraha@gmail.com>
 <af5559f0-89f8-42d7-a43b-068bbd183161@kernel.org>
 <7eafa839-ef4e-4856-be6d-d8e0a9ab3030@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <7eafa839-ef4e-4856-be6d-d8e0a9ab3030@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/10/2026 à 13:23, Julian Braha a écrit :
> On 10/12/26 11:28, Christophe Leroy (CS GROUP) wrote:
>> Le 11/10/2026 à 13:31, Julian Braha a écrit :
>>> On PPC_85xx, enabling DEBUG_PAGEALLOC without STRICT_KERNEL_RWX activates
>>> the DATA_SHIFT range of 20..24, but since the PAGE_SHIFT default is
>>> outside the range (12), kconfig adjusts it to 20, causing 1mb alignment
>>> instead of 4kb. However, the larger alignment is only needed for the
>>> separate kernel permissions provided by STRICT_KERNEL_RWX.
>>>
>>> Since PPC_85xx uses page poisoning for DEBUG_PAGEALLOC and does not
>>> support KFENCE, let's restrict this range to STRICT_KERNEL_RWX.
>>>
>>> This out-of-range default was detected by kconfirm, a static analysis
>>> tool
>>> for Kconfig.
>>
>> Looks like with this change I'm now able to set DATA_SHIFT to any value
>> when STRICT_KERNEL_RWX is not set and DEBUG_PAGEALLOC is set.
>>
>> The range used to protect against that.
> 
> Sorry, yeah kconfig can be tricky...
> 
>> +    range 20 24 if STRICT_KERNEL_RWX && PPC_85xx
> I think if we keep this ^ and then add another range:
> 
>      range PAGE_SHIFT 24 if !STRICT_KERNEL_RWX && PPC_85xx
> 
> this would cover your STRICT_KERNEL_RWX=n and DEBUG_PAGEALLOC=y
> configuration while resolving the 12 -> 20

Yes I think that should work.

Christophe
