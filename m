Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B034EF05;
	Fri, 16 Oct 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162012; cv=none; b=vFn2FWeNq6Dj8nRIlNenkXXd0M2YCdET50Yry+7/Ub3mOjTUpC01kc74x3jn3KGtsu4Ieu0tpo8ntA5F1ubmARjoU+oxsNIaMql9WqWZLoWHhiwIXYs7zGsxHikrvZT66OqTjixqrcSVCfRF2Cq4EFsFHa22OPvhr9YWfYKOwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162012; c=relaxed/simple;
	bh=eXJ3xKLCZxlKqKZKNob+04rGEdx4IpyxWqc+ruQwW90=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qsBPqTPsvrUXpgR7saG2AowzWwIWJAJga8Q62qYYY17krxKisrSSGoYTK9er57ISbOPpnWq1fgZYl44hHtdqnLXyM1wzE0zaEmXYwYAKL7xcJNRmLw7ttPbkhcn9ZcFTxWjDLAEQcutWXfIKZsDHLh/n0qIcKDT8Jg0x+uAhYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I0Zb1xQD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I0Zb1xQD"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8B29C82B6A;
	Fri, 16 Oct 2026 16:46:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejefj459Rafv; Fri, 16 Oct 2026 16:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792162007; bh=eXJ3xKLCZxlKqKZKNob+04rGEdx4IpyxWqc+ruQwW90=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=I0Zb1xQDXSOmVX9Kt6UYmVl8ebI547S78TXhZBSV1FE7eNu+tB0FCaGnlInm11Z1h
	 F8QWwm3ED0X7b1heqwXB1Ytv1boXBy9zFSvrFzdCSI9VvMKaVTawQg13BiPDv3oYWZ
	 A2ujhLwCN4Z559Kahxu6OUszf2eWMtLq2ZsTw5/Atu3KIT7AnoAc+7AbALOpR+ytX2
	 QWrSKZZ2xsZxWMIjafD6FC/iC2bzomAXD/56GGGVEO+ZwSd7e7ZFQwZZgSzttUQD2Z
	 vLX+T9OS94T+yYmu+QC/Zo2+toLAIazwGplBvhjNd6OsGkGZqv6/xiT7v+UmK5ZSUV
	 P/RmXLGHPMizQ==
Message-ID: <87c6cc21-dc1d-4d76-95e5-7cca12ce0930@disroot.org>
Date: Fri, 16 Oct 2026 16:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
From: Sven Jans <skbotnl@disroot.org>
To: Takashi Iwai <tiwai@suse.de>, Jon Harrison <jonerickharrison@gmail.com>
Cc: david.rhodes@cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, perex@perex.cz,
 rf@opensource.cirrus.com, tiwai@suse.com
References: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
 <87a4od3f4f.wl-tiwai@suse.de>
 <b474edba-33db-4892-b490-cd767211e4ad@disroot.org>
Content-Language: en-US
In-Reply-To: <b474edba-33db-4892-b490-cd767211e4ad@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2026 16:42, Sven wrote:
> On 16/10/2026 16:16, Takashi Iwai wrote:
>> On Fri, 16 Oct 2026 00:15:24 +0200,
>> Jon Harrison wrote:
>>>
>>> On Mon, 24 Aug 2026, Stefan Binding wrote:
>>>> We are currently awaiting confirmation of the correct settings 
>>>> before we do
>>>> so.
>>>
>>> I have another HP OmniBook 7 Laptop 16-bh0xxx, SKU D2KR6UA#ABA,
>>> BIOS F.12, subsystem 103c:8e60, running Linux 7.2.5. Both CS35L41
>>> amplifiers still fail to probe:
>>>
>>>    cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property
>>> cirrus,dev-index: -22
>>>    cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform
>>> not supported
>>>
>>> The speakers only play through the Realtek fallback and are very quiet.
>>> Has that settings confirmation arrived, and is there an expected time
>>> for the quirk?
>>
>> OK, we've waited enough long, so I take the patch to for-next branch
>> now (for 7.4-rc1).
>>
>> If this is really breaking something, let me know.  We'll fix up again
>> before 7.4 release.
>>
>>
>> thanks,
>>
>> Takashi
> 
> Hello,
> I saw the commit in tiwai/sound. I noticed that 3900 was used for the 
> boost_peak_milliamp value. I just wanted to note that as far as I can 
> remember that is the value that the Windows driver uses, while the 
> malformed but readable _DSD specifies 4500 (at least mine does). I don't 
> know which one is correct, but 3900 is probably on the safer side I guess.

Small correction, 3850 mA to be precise.
