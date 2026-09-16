Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4051D50D;
	Wed, 16 Sep 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573006; cv=none; b=ZueifByjtTqxUaJMzl8EmaAWGlH1xsf4YDl/Kdl1DJee/9Rd1nAhHsmDcheXotAZ58f7qu5/JSCS6XR3Y7p1RorK9FPzfC8yO2OpjHn5b3vTs56Rh3YmJIZqtzS0j7zXAkiuduaDsLHi0dZqnOi1RFjoJVnaOhrycdQmSTT4TEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573006; c=relaxed/simple;
	bh=C1t6262uNf6MGZJFxfdTvfR246yobc29sgevU4AlPzI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hwRJRS9P7TfPZKXB+J2Y8wvQMkeafDdrELnwXny0Oz820qToRgdlE6ob8oFcr5aBmgv7oF+whA1tQL60Fw/xQs5AYDl+kik0TMEBEChwmS93NhK83v8zb77GzYtXVzEup/wVHPG+7PVwbXkXfKKbwMa/KRXakKI49AypEsapICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UsBXWGtR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ph3hkj7D; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UsBXWGtR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ph3hkj7D"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 225D41D0006C;
	Wed, 16 Sep 2026 11:36:31 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789572990;
	 x=1789659390; bh=L5DrRwjMGcZbnefFUaO+yUfJnxJIEZjt5fvM43LMLS8=; b=
	UsBXWGtRC2WWQ+STXVlGtGuppEEdlNl5Cxw5ZIuadQfYwu6fWKnSG1Ka+MpY3GDj
	qZt8YwXcAtHxCF5bp6HdfcXG7q/xkQWzWXqSfpSZDLjtuKi/u0J+yZlSXCikqMQn
	xtROIzKLK2yD0S0zUygr9fKdZnDEUIfBmjcr90aYuTS9YAc2EskarjzOBzotsjhm
	uymUqna0voKRLNBp+O1CptO397AtG5wXWCBmLjIL5uRvpt6ktw9Bp8lpb43obgN0
	TomcFXRswfUb/LdzQih618IOldY/vjOwhnL2Al+G6Ahs6Bs1mYspJwIFAtq9bs1O
	R+xbNAh06AgBsetu0lE6Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789572990; x=
	1789659390; bh=L5DrRwjMGcZbnefFUaO+yUfJnxJIEZjt5fvM43LMLS8=; b=P
	h3hkj7D6awaq4clhvRyc2pbEztJi2DhMKaTWn1Eir+/PkES5Hr7lKI4Gk3/OrIpo
	P6GlxW0iB8wLpSztJrjLP4uIuN6OUgW0tmmJgWHVWBv9yCY++E5TMFf39lKrIN+X
	fDLvO0FYv5nMSCKkFYA0faZ73RKjSlCgmIvLQC8MWpAXe0vodmFOiE/SJTnNgymV
	mA5d3n2W7RfHu0RJLZHIw5DG6HhYEqwceZiCLeWWh05GXajn17f/L4G57oiQKZ9g
	Sh4LnuLiGZo7JktzVkjYZNOmvYEc52LlNNuWG7B7i1hwTq06So7WD242XmF/p50z
	W8l1QBv50Ro4dTHoxegHQ==
X-ME-Sender: <xms:d7eqahRfP8bHPTLl80Bd_ksIxfYnCM3Td5koyyk5opQg5GXh4oqaNQ>
    <xme:d7eqallHZjJwQ1k1XqT5rMruPZojIXgfeSsEYw7nvaFc6tyBhw62ZiVoBlhZ0SfT_
    zMqodZS6YIIPLIcRrsCztLluvFPkdlk65b1HvISCE8ZKL8CRYbQuJbk>
X-ME-Proxy-Cause: dmFkZTEmEahFO8kEoqhJy3UtM6+cwfx33ul+Qlv598pOAUnDDLePRTF6ys9/wc1u4lgGYd
    KV06UTaoT4+0Yh05Ff0zgHgoM7EhG3SheAi9d/2jhc7WY1exSHV6KvJVHcUIRvc7vYDcz5
    fOjxCEDdl6PEgRQHwST8uKYG14+OI5SkPKZhutjbeZiexiwUbFvG9AFZajlod0/LJ9MUAv
    sqyxIeqA7wyFEAvEChGpuZvan7GuEHsn1rR7qBe54U8sdrxLOU7UaOrzUg4rHF96fDJtGl
    tC8Qgy5FeIcHStRJU4U6bvmu0qq97EGQvIu6FLlOuDuaq8946ePz1BcvGBbfdXtw4bKre4
    TgDaTf0uFrBktk+IlHAxKeVvVC5JpeKXxi7U7okIpXMovvx+IcXzMOKk0uOZfMqZeHc4C8
    20dpGCz1+GDV7gYc8w6mLC74nXiSsaccO1FAB/ecTZ/AstwUt3Pc5f5F/7u0F1TQI24JSW
    G/s3uT+thX7vjC96A4dSXh5XUsN/dosrMe6G1tNL/2Y5WvohYdTsTvyv1+jrIpdBWX6nVs
    JGITYmBLqn6E5mLiVDLRSLdWJL8Blh705xciZfYrHcleNveOT4aL/IE1GYgiscDpyIMX5d
    ZKFe3EukZ6zli+2HPF0P8SlyGQnQjuS0ZYhyusaYWNudDeNkiB/1CwblDaMA
X-ME-Proxy: <xmx:ereqaum7mOIPX8OBZbMzvdPFeQQ3x7Y9rpajILs-az8DTtozW3jafw>
    <xmx:ereqanPvwV6YILOJxCfDzjU4DT7SGe9T24QPDy5SmQNfV560Ob6VkA>
    <xmx:ereqal4Fb6nsPeBeBynNCPxqWqM0uxU77KiY5zc5gTTaVYTbI7eo8w>
    <xmx:ereqaq1ztl2zq6kBqfquYQj-re2HyoKWTWeEWAeSa-m9uK4DryLsrg>
    <xmx:freqagotqjoLguZVh1LNjr0XxSRtaXwpkXl_qfJrx64RHgySLoh_BC-w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 43C0432A0086; Wed, 16 Sep 2026 11:36:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Agz7qtOQI7DB
Date: Wed, 16 Sep 2026 17:36:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Shuming Fan" <shumingf@realtek.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 "Niranjan H Y" <niranjan.hy@ti.com>,
 "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>,
 "Julian Braha" <julianbraha@gmail.com>, "Peng Fan" <peng.fan@nxp.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d09d7709-e537-472c-82d6-e532e955f137@app.fastmail.com>
In-Reply-To: <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
References: <20260915211658.1671821-1-arnd@kernel.org>
 <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
Subject: Re: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 16, 2026, at 17:10, Mark Brown wrote:
> On Tue, Sep 15, 2026 at 11:16:34PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>
>> Selecting SND_SOC_SDCA_HID only works if HID is enabled:
>
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -1992,6 +1992,7 @@ config SND_SOC_RT766_SDCA_SDW
>>  	tristate "Realtek RT766 SDCA Codec - SDW"
>>  	depends on SOUNDWIRE
>>  	depends on SND_SOC_SDCA
>> +	depends on HID
>>  	select SND_SOC_SDCA_HID
>>  	select SND_SOC_SDCA_IRQ
>>  	select REGMAP_SOUNDWIRE
>
> Should that be HID=y || HID=SND_SOC_SDCA like for SND_SOC_SDCA_HID and
> SND_SOC_SDCA_CLASS?  The dependencies on _CLASS should stop the
> problematic cases from actually occurring but I'm not sure if it stops
> the warning.

Yes. Just as I was trying to write up my presentation slides for next
week trying to explain how nobody ever gets this right, you have reminded
me that I can't do it either ;-)

How about this version?

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 181ed1b8a6dc..f88381523ea3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1991,10 +1991,7 @@ config SND_SOC_RT715_SDCA_SDW
 config SND_SOC_RT766_SDCA_SDW
 	tristate "Realtek RT766 SDCA Codec - SDW"
 	depends on SOUNDWIRE
-	depends on SND_SOC_SDCA
-	depends on HID
-	select SND_SOC_SDCA_HID
-	select SND_SOC_SDCA_IRQ
+	depends on SND_SOC_SDCA_CLASS
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
I think this is much clearer than the original version or my
first patch, as it avoids the fragile 'select'. If you like this
one, I'll send a v2 after this passes some more randconfig testing,
or you can apply that directly.

      Arnd
