Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310379;
	b=fZlKEKIwkB9+KwTL9ub5bvszewccjmuQ3By7qxLBtEYfvDBEGPDcU3gDkq6dVeyLYoFI
	 P0VwWTjwNRBAQX3UH0E3PPdoaZlGQRULUTy8kVnV2pEkMs3Zl5uqEr4Zf54EH/YX6cxSp
	 Nz7BDl1zRzySxNqs0orFhCOrBJI2j3sW/2lWPsZterXj55WXVNT34Sw0WsFGqRclN7lGk
	 Hko20FG9kP0MqMyw1NjgY29QchhfLf52djGylECXkaggf2tcIntbkT5dsOV8vsCN3NrN9
	 iDNWk8Qnp4hpGsosCkQvDj/7xb2y3uXI64wvwb5QFjew2GA7r5ru2utalL+cVpE2FjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:Cc:From:Subject;
	bh=G7y5ap0UpiAX7ANKtVUwj+JCu91Z72NxSUCCJSBkl34=;
	b=G9/fauzkNg+uxwwXMwbRMg6znBwn6NU2qKDtv7G3ubACtQFDySkXWYwSUdzhliWEi+NO
	 AEcz56ValIg0aJP9BliXIjuwUwpCVeQE8dwMugZsXstafDPhS6O9fEPoW/yq8HzNlaP+Z
	 hddEwn/y4FM0UwdDFXpgWtFkbNHtHWzdKfeR1YFbz/ttWtyg3Qpf2Z4XioA5UzeuG6+oK
	 Lqodq92/bU9JwqcgrD3qJ9+t1kgQEEJGFojI3B3x4L2mywVczfN4PJxzyjfhUF/uv7Cf8
	 FrSVMcaqb6yYJ0K77edpbVNelIaX0U3u2LqmogoScZXTU8slK2H71HWmPCZmu4V6FBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnZb5JRY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543F2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnZb5JRY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so928465e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793310377; x=1793915177; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7y5ap0UpiAX7ANKtVUwj+JCu91Z72NxSUCCJSBkl34=;
        b=jnZb5JRYzyu9/k1FMnH/Dl83saaSdd3g9raqsNuWv8TpFcbn6M8LPnQEy1LLXu3yx+
         c84b3bPfhrtI3baeHvuRaO3fVZ8euXQvbi4oufxG2US2oih93p4fkAUn1QA9KbZB6vLm
         CAUyOAHnrh9sITUznhi6KgsxKaF19E3c/ncTG8305LE6q4EA+NBmTS0s45ohBiPYyJ19
         DuofkUXxGUmZPCskP08gFbgvDjRu4KLwe89mayD5tOZnbrJYFfxRPH/Ynwj4wSkzW9MA
         to/TKxh6bbqu3+PpHrvFratCXbTJ35PVK7Y3z9IyR1oD2UNQinZcp2PR3DHd6AQmOAeT
         KuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310377; x=1793915177;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G7y5ap0UpiAX7ANKtVUwj+JCu91Z72NxSUCCJSBkl34=;
        b=YgOMabKkEmg5R8BCLRlccBGl1iDxS7lzY/cOFz4Wg2hsZOkbPvXmCjv8SjO9MNMO/V
         0hGE7PseLpDg4rHmu2KvDAxJvnN7t/ToGmOMe93FrarPEzQlPPhPpPA3LyhXmlwAmasA
         yVAgcmIEzM6hnEtEF1gPC7cRp0bgMz/To2/FoIJy114m4joomdt6bZknxz8z2J5P0zpx
         6X+gFwXiZZYtid+PoKUf5P4OYXVNR/W7btGHz2J5mhZa70OK7MNZTpMZENoGyG7xwfOX
         O6EUdTEm1kCLCGnqwk8WiG4puPsuEHrK/86Cqbm/Z5r/tOvaxjpVsdzq5KYQbW7arHDf
         WOuA==
X-Forwarded-Encrypted: i=1; AKwUvByCpFHr5lzViBZvtW/sCW+WP0Ys9WcM9sKahs6vBmhAzrj/hjOUx9YvyfXqHPq6YC6j7ialL+WBPEA4Ya8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK23YCIrsQpOPOUZkuDZQlfvbrYGbMuofuiFDFZSuSbK7HHZh6L
	N5kLhgHbmdZY/hftmrOP0JLZxjgqu2uescIbQ2DDurHuJe2cmVHgjr972BOk78Z46Jib+Q==
X-Gm-Gg: AYBFou2UX/R7AZ66+XUdALAXeaNMF3G9fB8S0ligVS48cp1yj6uTJzMh9r6w75eVv7g
	0biWgfxn4TdISTdW6RY/X4/O0+DCHrIYKVwzSf8n6UQ+L/0+mmPZI5exNmgIPn8zF91SEhxioAD
	eMDGnh51ul9fh8sBJVWyRKlD9v2Uuk19YrWEk5TwyWL2OpHyWj/h0Oq7Jbak1ujmMiqbUgDvlw6
	BEofi/JojTDErF+Rg0xAsuvPLrxprAk6nUH4jH+VdkgftpsHr3pc18CImGkUOzRvZ16BP+U0M3Z
	c/kIGXyFGn8Yr5KWdKlgIsulGmfhpIGRDDJ2z6W9hIXytjVa/gk2nAlnPHIIT09Wtuip2COHm5k
	r4is7FY+UpoY7+udUMPddsqtb7r1fzYwWbOptkOZuuSdo+P1XKpuhqHYD67FfEGMy+dYEXzBvl2
	z6HM/1elvRj6LO9fjzeXcj1VMkzSBMkPpa/4PMeW05Pe/SIviJ2Xe2d3kuub+dx7fmfuxWGlJ04
	7NboIatNuGIe8QEDvFnhwYQoRvZkClgkGmFXQhDBgsfuON25Pre6R546RMsXI/CV0tdapLFFuqp
	vNUoLk/GYlWNRXfuB3nSfUHEoO0hi7vWR0ol1dCFBiSLSG/+8AIpBTRtLePkLiJnhObO1OeYCw=
	=
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr93415325e9.2.1793310376609;
        Thu, 29 Oct 2026 14:46:16 -0700 (PDT)
Received: from ?IPV6:2601:206:877e:1a10:ed3b:2252:5293:eb20? ([2601:206:877e:1a10:ed3b:2252:5293:eb20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb9a2f7sm828775f8f.52.2026.10.29.14.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:46:16 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Pnx55i61WziYOmBZ1GEFn6mh"
Message-ID: <999a1a5b-bc16-465c-93af-bbb5357b22a8@gmail.com>
Date: Thu, 29 Oct 2026 22:46:11 +0100
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
Content-Language: en-US
To: hdegoede@redhat.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From: syphyr <syphyr@gmail.com>
Subject: [PATCH] media: pci: intel: ipu-bridge: Add rotation quirk for Dell
 XPS 14 DA14260

This is a multi-part message in MIME format.
--------------Pnx55i61WziYOmBZ1GEFn6mh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have isolated and resolved a hardware regression affecting the 
OmniVision camera module on the newer Intel-based Dell XPS 14 
configurations running under clean mainline kernels.

While testing against the upstream 7.2 release stack, applications 
interacting directly with raw libcamera pipelines (such as qcam) 
initialized successfully but rendered frames completely inverted. 
Furthermore, the mismatch between physical mounting and the factory ACPI 
SSDB buffer (which maps a hardcoded sensor rotation value of 0) 
triggered an internal driver stack trace during the subsystem boot phase.

This patch introduces an explicit DMI motherboard vendor and board ID 
matching rule ("0H2HX9") inside ipu_bridge_parse_ssdb() to override the 
faulty ACPI metadata, setting the property value to 180 degrees natively 
during initialization.

Testing confirms this entirely resolves the boot-time stack trace and 
successfully stabilizes the webcam feed inside qcam at full native 
frequency. Note that containerized/sandboxed GTK4 consumers under 
Wayland (such as gnome-snapshot) still encounter separate userspace 
format-negotiation deadlocks, but this patch successfully stabilizes the 
underlying kernel-side topology baseline.

Please review for inclusion into the staging media-tree.

Best regards,
syphyr

--------------Pnx55i61WziYOmBZ1GEFn6mh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-pci-intel-ipu-bridge-Add-rotation-quirk-for-De.patch"
Content-Disposition: attachment;
 filename*0="0001-media-pci-intel-ipu-bridge-Add-rotation-quirk-for-De.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkZjAyMTNkYTA1ZjY3NTY3NTg3ODQxZDVmZTMxNjkxMTQ2ZWY0ODZlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBzeXBoeXIgPHN5cGh5ckBnbWFpbC5jb20+CkRhdGU6
IFRodSwgMjkgT2N0IDIwMjYgMDI6NDA6NDIgKzAxMDAKU3ViamVjdDogW1BBVENIXSBtZWRp
YTogcGNpOiBpbnRlbDogaXB1LWJyaWRnZTogQWRkIHJvdGF0aW9uIHF1aXJrIGZvciBEZWxs
CiBYUFMgMTQgREExNDI2MAoKVGhlIE9tbmlWaXNpb24gT1YwOFg0MCBjYW1lcmEgc2Vuc29y
IG9uIHRoZSBEZWxsIFhQUyAxNCBEQTE0MjYwIGxhcHRvcAoobW90aGVyYm9hcmQgYm9hcmQg
SUQgMEgySFg5KSBpcyBwaHlzaWNhbGx5IG1vdW50ZWQgdXBzaWRlLWRvd24gaW5zaWRlCnRo
ZSBkaXNwbGF5IGJlemVsLiBIb3dldmVyLCB0aGUgc3lzdGVtJ3MgQUNQSSBTU0RCIGJ1ZmZl
ciBoYXJkY29kZXMgYQpyb3RhdGlvbiB2YWx1ZSBvZiAwLCBjYXVzaW5nIHRoZSBvcGVuLXNv
dXJjZSBsaWJjYW1lcmEgc3RhY2sgdG8gcmVuZGVyCnRoZSB2aWRlbyBzdHJlYW0gaW52ZXJ0
ZWQuCgpJbnRyb2R1Y2UgYSB0YXJnZXRlZCBETUkgbWF0Y2hpbmcgcXVpcmsgd2l0aGluIGlw
dV9icmlkZ2VfcGFyc2Vfc3NkYigpCnRvIGludGVyY2VwdCB0aGlzIHNwZWNpZmljIG1vdGhl
cmJvYXJkIHNpZ25hdHVyZS4gV2hlbiBtYXRjaGVkLCBmb3JjZQp0aGUgc2Vuc29yIHJvdGF0
aW9uIHByb3BlcnR5IHZhbHVlIHRvIDE4MCBkZWdyZWVzIGJlZm9yZSBpbml0aWFsaXppbmcK
dGhlIHN5c3RlbSB0b3BvbG9neSBub2Rlcy4KClRoaXMgY29ycmVjdHMgdGhlIGludmVyc2lv
biBidWcgaW5zaWRlIHFjYW0gYXQgbmF0aXZlIGxpbmsgZnJlcXVlbmNpZXMKYW5kIHJlc29s
dmVzIGFuIGludGVybmFsIGRyaXZlciBzdGFjayB0cmFjZSBlbmNvdW50ZXJlZCBkdXJpbmcg
Ym9vdHVwIHdoZW4KcGFyc2luZyB1bmFsaWduZWQgQUNQSSBwcm9wZXJ0aWVzLgoKU2lnbmVk
LW9mZi1ieTogc3lwaHlyIDxzeXBoeXJAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdS1icmlkZ2UuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lw
dS1icmlkZ2UuYyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdS1icmlkZ2UuYwppbmRl
eCA1MTBjMGVjYTQ0ODQuLjViYjlmNjQ0OWZlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRp
YS9wY2kvaW50ZWwvaXB1LWJyaWRnZS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVs
L2lwdS1icmlkZ2UuYwpAQCAtMTM0LDYgKzEzNCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRtaV9zeXN0ZW1faWQgdXBzaWRlX2Rvd25fc2Vuc29yX2RtaV9pZHNbXSA9IHsKIAkJfSwK
IAkJLmRyaXZlcl9kYXRhID0gIk9WVEkwMkMxIiwKIAl9LAorCXsKKwkJLm1hdGNoZXMgPSB7
CisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJEZWxsIEluYy4iKSwKKwkJ
CURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiWFBTIDE0IERBMTQyNjAiKSwK
KwkJfSwKKwkJLmRyaXZlcl9kYXRhID0gIk9WVEkwOEY0IiwKKwl9LAogCXt9IC8qIFRlcm1p
bmF0aW5nIGVudHJ5ICovCiB9OwogCi0tIAoyLjUzLjAKCg==

--------------Pnx55i61WziYOmBZ1GEFn6mh--
