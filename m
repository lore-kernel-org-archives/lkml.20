Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663660;
	b=Qp66s76xANAkW6zEJp5nsgV2bqlTwufVk8Be4hmx0pdgF4BjN/8HTiom2P3JUUfzp9HO
	 JKopwEOckypHiJU1Hx2TY4IIuLCzndemGX85jzEFqTqU7ILtVTtrQRHrT7KbJBS8wxNvf
	 T8NdQeQC4Sk/oXWP4qV7ELXNfKd3kZRqzYrEXphAz2yQD3LnMIkVad1/795wdVK7iI6Kv
	 QWYg59gr0OJJHpE94Daaimm7OFoulmMnzaGZFHM2e64Jpo8K7zJVickWMocMBVbRhJr2v
	 5+b4Kuq4hz6MhdcvDkqR8cNOH7Xx+4SkxF/wW5fraQBggHdNBe8kyg+NxUjdqUyn6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663660;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DRZUBsfLVs5ALhAcjOQBIw2GOcnXP13A4aZ3TqgnF6s=;
	b=X6T1g9sA3ixN0bfyte+4pdbHGHEZqRpvuK7kpu3JZdIlLCzrLUEHIi5RNhUMSiICJtcP
	 XI0G4WoEVGrW30+en+KM8SGSXX70SrDbq9fFK+W6PTJVrVZM9BCHWw3qBRYLRkDOq5yg/
	 DVsNvNQkMjdtkt2NP1GsUYjGCZYAyfDveQJ/6N6IMq/D5EqQlv36eTE0akhpT+9QAMSYM
	 73Q63nUVDdRbydDbCYQTj6uM87KIKaHb78ppWWivwHUhXSC87Wkr3a/hqEy9ENbbw0eOG
	 JecqirW5iYoR2OwHyV48Gp7srfhDFosYhPA5yh7Q3EijJWkQuAIHYWO8R9RJ6gxLEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IyjuVrfS;
	arc=none smtp.remote-ip=95.215.58.138
Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23490606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23490606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IyjuVrfS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5rwLWZUQEywqqEx+DZVIR9XTXe9WId4zBAGAoP+BUcM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793663657; v=1; x=1794268457;
 b=IyjuVrfSS4r0wp/Ziiw+LvVFLzuF3Pg2B5akppybrhfnpulTKjzzO+6JsY8PDM75+vvA1V76
 bfU+VwtKH4jyOn8pxX8WyHq9VB+vvZcfPjty2Uw5msgrvLrEVnuQYU/Er/bHFsRE4qK8AySpwBU
 Rot9RmSfW+21G/OrJB+HLDLE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb444f0ad2101dca;
	Mon, 02 Nov 2026 23:54:16 +0000
X-Mizu-Trace-ID: eb444f0ad2101dca
X-Migadu-Flow: FLOW_OUT
Message-ID: <b501e25d-022d-4f37-88f6-f82af3d101ff@linux.dev>
Date: Mon, 2 Nov 2026 15:54:12 -0800
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
Subject: Re: [PATCH 3/5] ASoC: tas2783-sdw: use the BIOS speaker ID in the
 firmware name
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-4-matthew.schwartz@linux.dev>
 <179366321499.2186205.14199496267448130552.b4-review@b4>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <179366321499.2186205.14199496267448130552.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 3:46 PM, Mark Brown wrote:
>> Some boards have TAS2783 firmware in linux-firmware named
>> SSID-SPKID-LINK-0xUID.bin, with a speaker ID ahead of the link ID (the
>> HP 8EA1 has its amps on link 0 and ships 8EA1-{0,1}-0-0x*.bin). The
>> driver only builds the three-field SSID-LINK-0xUID name, so these boards
>> never load firmware. On the ASUS ROG Xbox Ally X20 (SSID 1954) the BIOS
>> provides the speaker ID in a 4-byte SPEAKER_ID EFI variable, and only
>> the four-field 1954-*-*-0x*.bin files exist.
> 
>> Read SPEAKER_ID once and request the four-field name first when it is
>> present. Boards without the variable keep the current names, and the
>> unprefixed three-field name is still tried if the four-field file is
>> missing.
> 
>> +static int tas2783_get_spk_id(void)
>> +{
>> +	efi_guid_t guid = TAS2783_SPKID_GUID;
>> +	unsigned long size = sizeof(u32);
>> +	efi_status_t status;
>> +	u32 spk_id = 0;
>> +
>> +	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
>> +		return -ENOENT;
>> +
>> +	status = efi.get_variable(L"SPEAKER_ID", &guid, NULL, &size, &spk_id);
>> +	if (status != EFI_SUCCESS)
>> +		return -ENOENT;
>> +
>> +	return spk_id;
> 
> This returns a u32 as an int so if someone decides to pick a very large
> value it'll look like an error value.  That's likely unrealistic though.
> 
>>  	for (; dev; dev = dev->parent) {
>>  		if (dev->bus == &pci_bus_type) {
>>  			pci = to_pci_dev(dev);
>> -			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
>> -				  pci->subsystem_device, bus->link_id,
>> -				  fw_uid_prefix, unique_id);
>> +			if (!tas_dev->spk_id_read) {
>> +				tas_dev->spk_id = tas2783_get_spk_id();
>> +				tas_dev->spk_id_read = true;
>> +			}
>> +			if (tas_dev->spk_id >= 0 && !tas_dev->fw_use_fallback)
>> +				scnprintf(name, size, "%04X-%X-%1X-0x%1X.bin",
>> +					  pci->subsystem_device, tas_dev->spk_id,
>> +					  bus->link_id, unique_id);
>> +			else
>> +				scnprintf(name, size, "%04X-%1X-%s%1X.bin",
>> +					  pci->subsystem_device, bus->link_id,
>> +					  fw_uid_prefix, unique_id);
> 
> Mixing this in with the fallback decision seems confusing.  There's some
> cases generated in the Sashiko review which look plausible though I
> didn't fully work through everything:
> 
>    https://sashiko.dev/#/patchset/20261016232416.2628603-1-matthew.schwartz%40linux.dev

Thanks, didn't know Sashiko feedback wasn't in-line anymore. I'll take a look and send out a v2.

> 

