Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F154D794C;
	Fri, 16 Oct 2026 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161784; cv=none; b=qvoaDP/87YR7ihPyLHXggijt0m50khvFRhkyuzE9jCWeN4hJVOmEvkOOwfCTXrxSMhwqama345+W14XIjn3Rn05UGwW/bbBRpAH4mBNU1/BrXK7c3ljcPitS2SQQQT5s0Tii7kn1gHY5kbh20W4jc4hcr0toO1bI++PrnERcJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161784; c=relaxed/simple;
	bh=GNKrYVvIUcHDGigsc/8m91FuNewSDvpZXXab6be7tr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6/e+cO1f8XUwbhz4YlhkEA5uAedL5/vKG1aPMHttrkV/QJ4is+I5aPQjORtcLx6T+El5eece95v15GJD8Oq41GlMJ7jfxRddsbAjk5uqw7cfAkRdgoHYrj6BOa44w82lwpWyVisgupKbJM/5wF6j4pGgkjO+3MEmQo3iRdVbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=O+sy/lrA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="O+sy/lrA"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D6CC182A98;
	Fri, 16 Oct 2026 16:42:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spJcM5oqIzej; Fri, 16 Oct 2026 16:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792161779; bh=GNKrYVvIUcHDGigsc/8m91FuNewSDvpZXXab6be7tr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O+sy/lrAzjVg4l8yxi0Cua6MI9GttXQj1YYRuPQhyD5JEaUVOm3ex2lqzw3+SrAph
	 vP6xaSeh1iB5+sUpnJwWA6iZ9Z1gDIMw5OsggCyJpjH1mJcMp3meLWoKpU19xsqsa7
	 QavYPZ4a2Hfs/vFtpf1N54/ADKgiWVhVXQkUiddS3OzP/WewWu0qSHoHDeJ45YHu5x
	 2mQT8Af6abmdgfVYqLxJbCq9KywcohEa/9HKUbEDjKf5WQBezFLlxcMEwNwGfc8Z8g
	 cEiMsp4DoklS7rozueJ4aVrTFSSa2wrvfhcaX8hEKbE9+/OS9QS3A0+FsyEpbnBZAM
	 s4xSiMRo3YtBg==
Message-ID: <b474edba-33db-4892-b490-cd767211e4ad@disroot.org>
Date: Fri, 16 Oct 2026 16:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
To: Takashi Iwai <tiwai@suse.de>, Jon Harrison <jonerickharrison@gmail.com>
Cc: david.rhodes@cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, perex@perex.cz,
 rf@opensource.cirrus.com, tiwai@suse.com
References: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
 <87a4od3f4f.wl-tiwai@suse.de>
Content-Language: en-US
From: Sven <skbotnl@disroot.org>
In-Reply-To: <87a4od3f4f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 16:16, Takashi Iwai wrote:
> On Fri, 16 Oct 2026 00:15:24 +0200,
> Jon Harrison wrote:
>>
>> On Mon, 24 Aug 2026, Stefan Binding wrote:
>>> We are currently awaiting confirmation of the correct settings before we do
>>> so.
>>
>> I have another HP OmniBook 7 Laptop 16-bh0xxx, SKU D2KR6UA#ABA,
>> BIOS F.12, subsystem 103c:8e60, running Linux 7.2.5. Both CS35L41
>> amplifiers still fail to probe:
>>
>>    cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property
>> cirrus,dev-index: -22
>>    cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform
>> not supported
>>
>> The speakers only play through the Realtek fallback and are very quiet.
>> Has that settings confirmation arrived, and is there an expected time
>> for the quirk?
> 
> OK, we've waited enough long, so I take the patch to for-next branch
> now (for 7.4-rc1).
> 
> If this is really breaking something, let me know.  We'll fix up again
> before 7.4 release.
> 
> 
> thanks,
> 
> Takashi

Hello,
I saw the commit in tiwai/sound. I noticed that 3900 was used for the 
boost_peak_milliamp value. I just wanted to note that as far as I can 
remember that is the value that the Windows driver uses, while the 
malformed but readable _DSD specifies 4500 (at least mine does). I don't 
know which one is correct, but 3900 is probably on the safer side I guess.
