Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616B35F602
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305036; cv=pass; b=ZD7AgcBpWWS4pSAXrgmdhE89o4p1hpOhf7KuGw9vFxZ/V8bLxhGmTzvUyaq/Q9V2HRPuGmXUx/IkwXH/uSbH9+DtN77qfpvRSbpjaAnHo5BNo2khsKEtonEg5kWth5zL9TGucZRDe7ETBgqxnbUADAyQVMZaWbBPNvQz+e+sOFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305036; c=relaxed/simple;
	bh=DPkD7DVA8Uhr057MSZ0h/t+/vtov+iXvDTMW1gZw9vY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pztSGShA92TILqFGtTREN5YAfeSf1/yxT7vT/k9stOyD8e2dwNdUp0OwvoifuM0QqreJ5DAmCCQkR8suMavm/cKXRd2Ch33mCIHmd0rP+IISMWYXwdycByPtgaZ5OknIAaqaQ5HQanHsQu0I9YLlSHvzAUMr+KbzSRE9/+cRvAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU+gBrYm; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU+gBrYm"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d06a12d360so256112eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790305034; cv=none;
        d=google.com; s=arc-20260327;
        b=fxSnq+IjfPuW94KWMmdx6QK90uAaUiXL9q889n7ZUFcQW2+Y6L3/2EMGu13WJWj/Dm
         vq36Lr/js1FgSWV9l2lXlnzSTzzfILs+3ih2tLiXIgCCYKcEQZl0k5Oovbd4hJFjKTLo
         1XTtF5GV+tyVOMurIRy77wyqKiDDsv+9Psgs2I9zVqT6L/90aQNOFVJsapnJwKcpCIqc
         yMsbua+8qhqjvxllFYlTepqP0ayZOeSZ9/BU0i5I9FoV4I8rzJPA8AExRNgwSM0332eW
         XiUGeY3nl/4JbMWolHFuUV5gwsCEHax1UDv0uj5kPquesHxX3K/JMHdoWaY3yyu/GX1y
         Q8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Eul3M/g4F1+fC+sh3LlhuJMDwBAdWyoZcUtrtdGOV1A=;
        fh=uCbFXPKO3ZCQjnYK91cuk1bQcYW34j29DyvtFZUb02U=;
        b=QX5qJxhjO8dFE5I5l7GV5yUqeWd9UX32QiZMLNzaHY3n/htaj6g0hcLqygjkCNbXiW
         pqUsLT68fjHFwYHW8FPv8VHPiWc+G4N1tp5GFX+rr5MUMsMl8e8dPGXEKpz4mDKlrixD
         e/i3adNelMeq6H/iUE9MCW4Hex2lk8GRrTSNOpLzsIbAmt5+mNDl31QYQWnAZSoeBQZN
         vU1/A7rc0EsTeiNw+tIczZWqlclta5yNUbuu+lpTzD3h4SLPO4R7FfrwSottdUbtNt4P
         Arpmz8wx5GboEgps/Pz0omZwiCeV5Rx4wRmXAA7w0u6iIiP6WYodJlr3S2hlzZqu0BkX
         a45Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790305034; x=1790909834; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eul3M/g4F1+fC+sh3LlhuJMDwBAdWyoZcUtrtdGOV1A=;
        b=VU+gBrYm1uzjz5lsTF91CH0pNsLiEQqtrVrz45W3oVg9EsagfQB47zsqMtzsRVxv1m
         b1RfROgTqo11nTVOvj+XNSO5zc6wYZ4TThR/3z05fLoikUJvW+88GdMiHQm2YiiluIym
         HJ0YrE+N3Jy1ZRaKeio33QbGhUJLDDqi81XfcV6RkmA0XKzh+toYamE0PpP6R25WDHjb
         9eXoGKEgdj4WcOHAOkG6YY0KAGi2472cgq6Q7I458OM6GUXlI+/1yVkMxKsnPO1ul1d/
         Z1uBRsVwUEUgFZ53S+t1yraUWM/0haWHNF3tyuniEhQ1Mvs1CZN7Q3W3p9Mx6upr6DA3
         nMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790305034; x=1790909834;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eul3M/g4F1+fC+sh3LlhuJMDwBAdWyoZcUtrtdGOV1A=;
        b=DOmIWafK1kZJhtJoJXCora90X5HWLNUvWq6yzxZ9NLvbL5vXNOFL1h/RUcLLb60mlR
         QBNFF+fDQ2KpeBZPfUo8lKZJiG+iLxh9RlQXMlSSQ09qrh4tOApH2SsnNXBgeifMZIu3
         YIx6RwC3I+O9lJEmJD2rBpNSJw7KUbwppuAqQowEJv8ssc45meW6MWBjwFlx5kllmyby
         6QQ2NIltxsV/eDVKJTMrf9nMWubX2DTORjuZhsfVAc1vJZyBvxM8yjojscOdwB5lM/8k
         F1SJWwyPeyx0aE3X+fYopgHcWBm8uWhlyX4G+tY1u5I/78eH9HsuGj0sRU2TnKCxFWL+
         joUw==
X-Forwarded-Encrypted: i=1; AKwUvBz4toNaJ10ydTn6ectvf5w4Il6v10Bpf58JLsDOpxhJq3JbfS4XrXgETYFFtiVtrZjyBGml5sf57Fbkh6s=@vger.kernel.org
X-Gm-Message-State: AFuF++nHdDfFe8mUiSsJpyyPQ4rbbBf+DBQX3dZ5LzFdDYHNrzqp+Uk2
	4Ub419bfOktVuTRxYl8f0fvwDAKtxs8SALLRKmR3RQDyDMU03Ffw/hZlznWRKQHBBvYoCwQXk1k
	QTnujJm3g/eA+N9Vrig8shuwO1LTbza1ADs/1
X-Gm-Gg: AYBFou3se71QotbHA17nHkl5Cj+Gc3SYDTbVIONPYXg8/lDJuUmS3kZmkoyrGZLKGJx
	tPWerGSlRDh7r7+nuoJqthRsE5OgSAIaCXyIf8ePt2jowEVOcK8c5Bpwr/2Ht59lrLFtwtDyryK
	togOqhLZK09sha6tOep1fajV2MDHwIqphTgWxHcktgWmdTUpXXtF+GrJEInXGvCRVW9Y3DIbtmc
	xAphNsXkhxSHmmmxIt60wuBBe8TRwykxoXEwZuRcAAT2PnjSS49irTzItkD5Sv5uLKONLwhk4j2
	AH+hZbIAdJrouy/Enh6jqKvTo0wU6eeRTTCwDSU2vVnuWlgIxXPs
X-Received: by 2002:a05:6820:150b:b0:6cd:3fbd:1d61 with SMTP id
 006d021491bc7-6d4414ba646mr3928149eaf.75.1790305033897; Thu, 24 Sep 2026
 19:57:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:57:13 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:57:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ROJOX <rojoxoficial@gmail.com>
Date: Thu, 24 Sep 2026 19:57:13 -0700
X-Gm-Features: AclHuK-C2suIJTIxGiJq1Z_5u3q9HxRxWw-9Y4Zc9j6OeaxiamlBLdlE9Z7jixU
Message-ID: <CAP8ibudQFpGuCo+Z97ozKySft0dZ40DWAqf4tUMEe2vrbtu6jA@mail.gmail.com>
Subject: [RFC] ALSA: hda: clarify unsol_event locking across driver unbind
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you advise on the lifetime and locking contract for
hdac_driver::unsol_event() relative to codec driver unbind?

In current torvalds/linux, snd_hdac_bus_process_unsol_events() looks up a
codec in bus->caddr_tbl under bus->reg_lock, checks codec->registered, and
then drops reg_lock. It subsequently reads codec->dev.driver and dispatches
drv->unsol_event(codec, res), without taking a codec device reference or
device_lock in that interval:

https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/core/bus.c#L173-L189

Separately, driver-core unbind acquires the device lock and calls the remove
path while that lock is held. The HDA reset path can initiate this through
device_release_driver():

https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/drivers/base/dd.c#L1315-L1374
https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810

This appears to permit the following source-level ordering:

unsol worker                         unbind task
------------                         -----------
lookup codec under reg_lock
drop reg_lock
read codec->dev.driver
enter unsol_event()
                                     acquire device_lock
                                     invoke remove
                                     tear down private state
callback continues using private state

I do not see the worker taking the device lock or another explicit
binding/private-state lifetime reference before dispatch. If the callback
uses state destroyed by the remove path, the unlocked dispatch therefore
appears able to overlap that teardown.

The codec/device object lifetime, driver binding lifetime, and
driver-private state lifetime are distinct here: get_device() alone would
pin the first, but would not by itself prevent unbind or preserve private
state.

The legacy HDA wrapper additionally checks shutdown and system-PM state
before calling the codec callback, but those checks do not appear to drain
a callback that has already passed them:

https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L42-L52

I also found the older unsolicited queue-index synchronization fix,
c637fa151259c0f74665fde7cba5b7eac1417ae5. That appears to address queue
consistency rather than this binding/private-state lifetime interval.

I tested one scratch proof candidate, not a proposed patch. It synchronizes
address-table lookup/removal, obtains a codec device reference while the
entry is protected, drops reg_lock, takes device_lock, revalidates the
current binding and codec registration state, and dispatches the callback
while that lock is held.

That closes the ordinary callback-versus-remove schedule in a deterministic
model, and the modified HDA objects build cleanly in a scratch Ubuntu
7.0.0-34.34 source tree. However, hdac_driver::unsol_event() currently does
not document callback-under-device_lock or reentry restrictions, so I am
not assuming that this is the correct fix.

Could you please clarify:

1. Is HDA core expected to serialize unsol_event() against unbind by holding
   the codec device_lock through dispatch, or is there another existing
   lifetime guarantee intended here?

2. If that lock context is acceptable, should the callback contract prohibit
   recursively taking the same device lock and synchronous same-codec
   unbind/reset/reprobe? I found no direct same-codec teardown call in the
   audited in-tree callback bodies, but indirect and out-of-tree behavior is
   not established.

3. Would callback-under-device_lock conflict with expected HDA runtime-PM or
   system-PM behavior? My source review did not establish a generic contract
   for this.

4. For an event queued before unbind/rebind, is it expected to be deliverable
   to the newly bound driver, or should it be discarded across the
   binding/reset boundary?

This came up while auditing HDA/CS8409 codec lifetime behavior; the question
is about the generic HDA unsolicited-callback contract.

No runtime crash has been reproduced. This is based on source/lifetime
analysis and deterministic concurrency modeling, not a runtime stress test.
I may be missing an existing lifetime guarantee or invariant, and would
appreciate correction.

The source snapshot checked is torvalds/linux master at
165768bb70265b5c38cf0b73fafd75be235f8b14. No patch is proposed or attached.

Thanks,
Rojox
iMac19,2 Linux audio project
