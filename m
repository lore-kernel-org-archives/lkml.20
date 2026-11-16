Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820943;
	b=jG0llurG1JZgfhNUQtlJ5tcPiIH+NNOQCo4XqeQOZDE/EhOje6DvovzTrLP3p/7OnKID
	 mV80AtH+Xqi2qofT+Z75/+4Ue4zuZIum1lzzKMx4vmZ/QE6MewjxcwlA1vg2yNJVFQBwb
	 4XwL1Cz6P2u7Uxnr0OIQ3r2NiJBmFaDZsrrqKYIAECcwQi386fbhLSYihmUbMyA7oRkaB
	 t1Hyz1AZzRUmbkJ+Vkh5ClEC1YfFwaUz8ycmOsyeCP6VR9IwtmN+uv+f/jG6n4oX1FxWQ
	 0C3MKnafDibOvu1Ihd2f71L4WMFHlqKaxjeM+j7ZSHIQCPrVFWsVtg8F7sArsubXgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820943;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=Y6QRPXFup/9XWuMG6qmhWGclh7A4WKa63q/MtCTrYJ4=;
	b=T/b011UwLav+9wM35noG3BvaSpQv/MsEqNVchokoVhOExyY6NYdluLd/VQiqWl3OiFiw
	 mMcGR+jYgWXICfhqqpOa/kwTMoX1w5irsgixwUTDv/2fOYnpC8YVEVE/tmAs8BENiUnkP
	 OTiDHPgA4q9fLm4Y/0tSVu3VDsWKeceIAqBX886jg0lZC3BCJ59Fjvo5Udzd91BXmx2AT
	 DBE8w6R36A2cyEuzSm6NxYI/sw0Ma1IcjMfhDF3u/YhUnsEMVKZxqwuSTVKtuf38xxVH4
	 Pdv1/SGPpFZxfvn+KtaKGnNYjYkySQU4jgUn3YmFAEa5A9MApVwwHsZvWFF43Qn4N5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b="kQBYJq/y";
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FE606A32C;
	Mon, 16 Nov 2026 09:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kQBYJq/y
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jSj7F4j94zMlJh;
	Mon, 16 Nov 2026 10:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794820937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6QRPXFup/9XWuMG6qmhWGclh7A4WKa63q/MtCTrYJ4=;
	b=kQBYJq/yUy5/67zh6X5VKjbF2EPNVuL/az7R+I8hZi2PJrrGifKhxhPOQjSYdRU29UiL9l
	OL3jqqLS3ihMDxzW0WVnKYFOZeACvbzOEds8kr7LHYW/ExcwfNrtllrjRXEVrgEAamCTRi
	PEuVk8SaPzrocXohnkfowet0qnQQe7ODvEor3Yo8mhoH0tko8d9jR5lIUAPljsrkYRt1nK
	9eQAZXo1toqrt3FJCzhGC9nv3dY8OCWUR45hCP/71vq+h1GSX9dcrGv4bRp3EribvaEXOY
	pIxk8blwuv39NVwSj9KbnVhyH9oLVye0k4Kzi4bcqOxU4MJIbQeuoIK/8G2Hsg==
Message-ID: <fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
Date: Mon, 16 Nov 2026 10:22:14 +0100
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
Subject: Re: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware
 repository
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5f70c5e78e4e3c85d5b
X-MBO-RS-META: jx3otgz355xkrtsxxwdwbsfbnfho5qyn

On 9/14/26 5:12 AM, Marek Vasut wrote:
> Use the primary mirror of linux-firmware at kernel.org.
> No functional change.
> 
> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Rhodes <david.rhodes@cirrus.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: patches@opensource.cirrus.com
> ---
>   Documentation/sound/codecs/cs35l56.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
> index b3f8c1c238518..4a246f535d260 100644
> --- a/Documentation/sound/codecs/cs35l56.rst
> +++ b/Documentation/sound/codecs/cs35l56.rst
> @@ -50,7 +50,7 @@ DSP. Firmware files are essential to enable the full capabilities of the
>   amplifier.
>   
>   Firmware is distributed in the linux-firmware repository:
> -https://gitlab.com/kernel-firmware/linux-firmware.git
> +https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
>   
>   On most SoundWire systems the amplifier has a default minimum capability to
>   produce audio. However this will be

Is there anything left over to do with this change ?

Thank you for your help !
