Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440432D1F77;
	Sun, 18 Oct 2026 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313461; cv=none; b=pu1KHbgGzD7cI6Htt7l2jMpy+U7Jm/qc55ftAFr2lhcnDbO4trJjwn6lG1TbEhicWER7seLFqF68yT566JM1E5gbu0x8COsrJPEkRY0wCMn92aKahbOYhuTNcroEapmduukHyNZ7i0i6DOJ90uEYhTtunqYHHG/c0W51dSNQNY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313461; c=relaxed/simple;
	bh=bVVdyHVgkiFrgBLqqHKDjV5WEVr5MNmWngF9NzQ3Dew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhzQGgPnksTDXevGaeKlelUMzbeuboCkA4bNOz/tF5/KLR6hlf1rEDrBV8LPSHiDnryKsQFb9IIF9zcZZnoQPjGEzZe4Pu0nTbedU/H9awlwcM3VjeOBrkgYosVqUzZprKHeKQlLTU5KeZdABcrSdbY1bitS5hzK9SOmOs15I6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from [10.88.16.11] (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 6985F2336E;
	Sun, 18 Oct 2026 11:50:54 +0300 (MSK)
Message-ID: <ffd3e030-c056-da1e-0549-c41d7681abc2@basealt.ru>
Date: Sun, 18 Oct 2026 11:50:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: hda/via: Apply runtime PM workaround for ASUS X55A
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nikita Maksimov <nickstogramm@yandex.ru>
References: <20261017101257.215166-1-kovalev@altlinux.org>
 <874iej1k7q.wl-tiwai@suse.de>
From: Vasiliy Kovalev <kovalev@altlinux.org>
In-Reply-To: <874iej1k7q.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/18/26 11:33, Takashi Iwai wrote:
> On Sat, 17 Oct 2026 12:12:57 +0200,
> Vasiliy Kovalev wrote:
>>
>> ASUS X55A requires the same workaround like other machines with
>> VT1802, otherwise it loses the codec power on a few nodes and the
>> sound stays silent.
>>
>> Fixes: a0645daf1610 ("ALSA: HDA: Early Forbid of runtime PM")
>> Link: https://bugzilla.altlinux.org/45606
>> Cc: <stable@vger.kernel.org>
>> Tested-by: Nikita Maksimov <nickstogramm@yandex.ru>
>> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> 
> The addition of a quirk is OK, but is Fixes tag really pointing to the
> culprit?  The commit is for forbidding the runtime PM, and I see no
> clear reason how this commit breaks.

I followed the precedent of your B23E patch[1], which carried the
same Fixes tag. If you don't think it applies here, happy to drop
it - let me know if you'd rather remove it yourself or have me
send a v2 without it (keeping Cc: stable).

[1] https://lore.kernel.org/all/20210817052432.14751-1-tiwai@suse.de/

> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/hda/codecs/via.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/hda/codecs/via.c b/sound/hda/codecs/via.c
>> index 807312cffd35..0641fc14b346 100644
>> --- a/sound/hda/codecs/via.c
>> +++ b/sound/hda/codecs/via.c
>> @@ -933,6 +933,7 @@ static const struct hda_fixup via_fixups[] = {
>>   static const struct hda_quirk vt2002p_fixups[] = {
>>   	SND_PCI_QUIRK(0x1043, 0x13f7, "Asus B23E", VIA_FIXUP_POWER_SAVE),
>>   	SND_PCI_QUIRK(0x1043, 0x1487, "Asus G75", VIA_FIXUP_ASUS_G75),
>> +	SND_PCI_QUIRK(0x1043, 0x1c33, "Asus X55A", VIA_FIXUP_POWER_SAVE),
>>   	SND_PCI_QUIRK(0x1043, 0x8532, "Asus X202E", VIA_FIXUP_INTMIC_BOOST),
>>   	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", VIA_FIXUP_POWER_SAVE),
>>   	{}
>> -- 
>> 2.50.1
>>

-- 
Thanks,
Vasiliy
