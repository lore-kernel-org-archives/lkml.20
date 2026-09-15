Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821721FF2A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435444; cv=pass; b=DxQPiu6LkPmAjh+QqLJe7qOUgmC/fcajqucIG2qQkya/4IPOfSCB+7p9fvurSDl2YIDxmMrtNrQmqiYIDP+6DbYxbZvUkd2fCj6TabK4vMSQh0OnsKXIG35INRmz7IFLL+rmys/2bCiY2cHYdzERYkrCZsGrh58cajAAqQVZHgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435444; c=relaxed/simple;
	bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcDAysTgdZG/hozAwXC3kIsMjccEQVc8GPSNQS9G51wRkJg6BMRcKvkPMCRYKvdzmMN16xHJEMk7j/YHjkJkXzNiqaaoso0GufKEQrkwCJrFmAboIL9CcDawADXJChIyO6C2XSSH8XckBtcCw4wGc8MLzRflkL0+FUOmO2GsLB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtTHbcrX; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtTHbcrX"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8871ada1a26so24079987b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435442; cv=none;
        d=google.com; s=arc-20260327;
        b=O2J9wTJEsxGCi4PRAbfREt55Rjxw/8b0MXl9GRBxUpG6P2gTkbk8oR8evcdW8rd7hr
         FA+y81akyFYDOCwoRYHxPLKVhCGT0T1KQDRXiYeT8pMMGzD0OyrjNRVdnZVISUEp9Icr
         5NsXinH+l5Xv5iYHh614Gg4mMULWvtfXfwNKJie97B70/Hl26KZ9FKQgxqOrlti+1ayu
         fh9CG2zV80oxMr9XB7HvZuJPIZgQGmxhvDHmdDjPfFCUS5t2CX9H4KsOFEU5yVg9cuV2
         MQIXXcPXSNQvuB7DKJ40NdtorPQ0daomwdCjOHV/JlC9T9bw3lnVGPeE2POPA7d8H+0z
         YUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        fh=5wYFl29zx1KaOlH3lRnbGCK+7RYYf8mOQKu3jZBOcO0=;
        b=gglXqXwrEWKvWfZODbWHpmNRiheZcRAoB5ZpSuTImXi5o+zRKs89sMyf1p4godbNW7
         D4aN8RQ/DJDbQYFoHshidNk+98IKvo5WWwgfM4aOjYPu4/jLr+WzKPdOXMHftxhUBzFF
         YEnbTCkXY57ODYH0KhKP3bUUpf4KHb24UBsTBEmys5tP49ecMxSAuqE9HPFSSfw3+0rb
         k5AQ9kzCZnUy1mlPiDOTKyZeMFZU85jOiNYQppPUKQOKHOdyQrh3jT95p/+VXNRqvXQZ
         d8288aXXWDYQ5eN0cQWBJGDDWi5ELhpLRO/uIP/umkUVnsyf3nkOqBjplfRZ0ByxgphX
         uvYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789435442; x=1790040242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        b=MtTHbcrX3KFaOZgVwApNIoukmqVZsaa1dUZYbkuMYf/cm+NyHUc7JkqW9OhkBiOKZo
         n4kLLtB3h7CmpXuDLCO2wbFAo4JQ8DrXJRZyyJfgXu+cRG71JNcWdAlEeYWB8hD9SIYT
         adqjo0APf0IQtIhrih2eLTrwCHSZxGF9IMPB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435442; x=1790040242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5UoK2kb1xkEY0f9fIegjJq7KUgHwF4qoCSG3hEbKmA=;
        b=zsjwDC4HtcAFvasdEgfh9dtBZQzUIs7mtUU1zHOxhYFO6w/4kVoWvDpHClPYitTo+9
         8U1/Oxdwk7oYhx2Cv7WALRgXXB11VArigmXR4lqIcek0QJf/IvRTVJYNTHTbkaR8gZRi
         1TjBWd6S9RDS5Xco0VekURqf1vSUIW6uJ6x5ByxrAaA3JTVWT7oP44QBjUGdGkVd286N
         E/LEC2cOtBgewadlzFI4S+uRIwt/GgXGXvB7itkF7hOV7VTdmb+RJJRqkbvQztKxqDJv
         9YlBSkBoOb0hyNPYGSpY2h+PSCv/fsrfQ5lfnrQ/o5yvrp1D4m1pvbJFOppVr66EZFOc
         4dFw==
X-Forwarded-Encrypted: i=1; AKwUvBzto6OzgVak+PplFlgZ4FmWdc1pWqGjQBZMEwOy58/FHzaNnl1Wi+8Rmy/l0Ie2Cs3987SW9QuTSPlkp6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mhEqAHkUYu6dto5/2uWDlZAX63wVDrLD4hUonewANlrIUxPg5M
	MOl8WMlueHntbq+KQ+MJCb7G5H/8UEf8R3HgsO+Pw7qcK3MsuZrI/aLvr1VmjiEewjsqn0dNcOD
	0gLLS45GnRwI7sVlvkmrHA9bthnXiHt8EBgZRndU2
X-Gm-Gg: AYBFou3Fdm3DcHM2EdBvrmEZ74hmPkODU+DyyfaLxso71LSKIOyzz4XDz5qtUYTrIxq
	zvMUNKTaz8mN6qyY/iPC2MyC05vg4ZHK0c2cw06EQYMWaUBOSJtoTyQ0JV6pIwSKAVON5B0sKdC
	8tCxj2I4mQm2u0/wnOdBCqLqzHy2vtZarQPv7VXwIgO2KH89db6qGIaLxe0lLUKtC1wKnt8gzxS
	+GWshkiI1xVPJq+u2FQ99THekg2YooxBZSJIZHJnBcHW91zn/ZJmkNWiQ3mOG4rKXM2jGBoS9ul
	yd3mTqtcxk8WGuTc0NdEjOL3NakBZWP67hLjfiZrULwHVBH8GUATl5vm
X-Received: by 2002:a05:690c:31a:b0:862:2e2b:8639 with SMTP id
 00721157ae682-88d22ed03f0mr20767597b3.33.1789435437168; Mon, 14 Sep 2026
 18:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
 <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com>
 <0921e5a2-f8f9-4802-b40b-ec332b1aa4b4@opensource.cirrus.com> <001a01dd299f$5aff42c0$10fdc840$@opensource.cirrus.com>
In-Reply-To: <001a01dd299f$5aff42c0$10fdc840$@opensource.cirrus.com>
From: Steven Kendall <skend@chromium.org>
Date: Mon, 14 Sep 2026 21:23:45 -0400
X-Gm-Features: AcwNN1UVshfbK9Z0ZQB7xd7ceNwFMzndUKjY-_AUYjnG6aBh1KikGWunGMZWEFQ
Message-ID: <CAB1bpFD1S_u6qfa1sGPbYz39DCzSqQjw_dM1erzMdf=_1M66Eg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We have retested the hardware using Ubuntu 26.04, and everything works as=
 expected.
> The behaviour you describe where ALSA doesn=E2=80=99t detect plug/unplug =
until playback is
> expected on this hardware, due to the way the CS8409 works.
>
> As for ChromeOS Flex, do you have any instructions for us to try and inst=
all this to be able
> for us to test this? Is there a particular image or version we should use=
?
>

Apologies for the delay getting back to you on this; I got pulled away
to some other work. To test Chrome OS Flex on the device I recommend
using https://dl.google.com/chromeos-flex/images/latest.bin.zip (which
can also be reached from the Flex main site, albeit with one or two
more clicks than would be ideal). I've reproduced the issue on that
build: audio at first only works through speakers and headphone
plug/unplug is not detected. However, by closing the lid and opening
it again (once already logged in or as guest) it fixes the issue and
plug/unplug works as expected and audio can be heard over headphones.
