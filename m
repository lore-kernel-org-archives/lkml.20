Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC5F3AFB1C;
	Tue, 13 Oct 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881196; cv=none; b=DVWvrIld5ZrGrp79kN/YwwJZutRUxbHt50EO2RKGodCHi9kChV9NUJuDZP+Xas4OQ/n15xw3WFXlyVAnOcG3/IxlJhL8ZqQSo+rci0sPg/DHuxRFVaxV782GYmbOUvMsTCW8mCMbbWPi6dnlYgwQBgk4XVivUrwVAShI9iyB96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881196; c=relaxed/simple;
	bh=QghHZuYkzzo4O1ldvOEf7qc/O/NGTv3b+zl5T+xMEtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsenwlu4gl46L2Kzz5rEWM/zFeHRx1QuGfQ9r0Secz3HfjcOaGIsWrwbdSz4ROOV7JiY8Yr0nfiC05kyvRRL0v/YIsFQ9GT2biu5fkb2s57TVlWgSjsCgYc8ZDduX0Dl4yYzKodssXD/L/U37F7xBZJpmTyWKUlVhcJEw400K4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLE3Zavp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLE3Zavp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57451F000FF;
	Tue, 13 Oct 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791881194;
	bh=bHVkkN8eCTtzwFBd9kbxMcKpNMYWpEMSAZFlXFCPs+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bLE3ZavpnLs9a1lnbUYV3iSBWDsgYTtZeQxo4IyfYeQhp83gij5mZw0m+fD+oh1wA
	 kWKHcYbygxgF7mn8HpByGu8ZEi2zA4BnmVlMrtjqvJCXQy3Ia8E3R4kx2gvGRkh0Ip
	 5cRCIXE6qANcS0JR1d1ti5lYTAaIwiscMY85xsKcYdmQVdQSKmdm5hHnP/CyV8Bd3a
	 iqqKux/t97wyZy9ivDWoY+7JGGwaQKDiQxJtViB5CJjQ5aOmXsldYf7A1UVwSl8px0
	 L2So3hun30t+4Q7FXv9sWz0tfbTXuanvuHkFDu2H7eEWbMOoLNBcC8OqUk9uHKdDa4
	 nOdLfsq3g6ozw==
Message-ID: <44fe29ee-9692-49f4-aaa7-7201c9cdcaba@kernel.org>
Date: Tue, 13 Oct 2026 10:46:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the drivers-x86 tree
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Mark Gross <markgross@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
 <asOdosd0zROmuzu1@sirena.co.uk>
 <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
 <8f4e200a-c2fd-29c6-ee4d-a91137b90c12@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8f4e200a-c2fd-29c6-ee4d-a91137b90c12@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 13-Oct-26 10:34, Ilpo Järvinen wrote:
> On Mon, 12 Oct 2026, Mark Brown wrote:
> 
>> On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
>>> On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
>>>> On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
>>>>> Commits
>>>>>
>>>>>   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 support")
>>>>>   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()")
>>>>>
>>>>> are missing a Signed-off-by from their authors
>>>>
>>>> This issue is still present today.
>>>
>>> And today.
>>
>> And today - should Ilpo be added to the list of contacts for this tree?
> 
> Yeah, I'm in practice the person who is handling pdx86 patches these days 
> so it would be good.
> 
> ...Goes to do some massive history rewriting...

My bad, I missed you (Ilpo) were not getting these emails, sorry.

Regards,

Hans


