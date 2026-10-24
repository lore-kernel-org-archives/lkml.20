Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792854412;
	b=X7Tus+JnxscrbSz1/O5Wxqag5l4fJRiTghsWFgei4yTCV2jB14xyh3a5TOKahb6bFb60
	 yWEocUuniLYirEzM/3y7+FUVGTp+Avf/uXjCDwI0WVqdRhAPvv5UMvQaXrbzenJMmwvm7
	 49kdF+TNfWcS0F6jIoxgKwghvoc+Jsm3hWPK2ENu/AKLwV+tl1AV4wDuPthsBN3S+fzg7
	 VOpOPqLH1xvWLCkDKe9nt8bM+Iu+X8QtxbZNGYyH2gB9BIpk6IJbnwCBa4WEjRyy15Pck
	 WgFYmu+wUz/043FN0Y/rHxVILNa2OgOqy07fUHppLh6jRBpzjpWkK4J+S5UymGCzv+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
	b=YEXA1sqQBTIgYOsacRElLQkPd0K6map12wvDuV0pPCOwG6PBFBmXZHfPfK5s846WSQWg
	 RB4mfhun9RV2q3xZ3Xh42zF7Gu+tgzAatKcvkAM0uA7pdkH2JL3TbVyovyPKj0kMjJhcz
	 QCBb/bQ2BYj9RIhOwkDCQpD8ptdKgppP9evQqdzKXEMeNrMirSqoYO9nwughNHpk4OjPJ
	 7YhEH5L23X9ygHrkeVjXGIP7O4o+vhJt1qojTIUaNyrdKDxUhVKufaGF3NH8y+RlF/xoy
	 vF01NSOv9PTvTaDsLwlDAKuVA7jcXqqolfmHvEMSNweQGE5zcdzNZGeOspq4DkCoVXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gIYFHd8D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gIYFHd8D
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so2100731a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792854411; cv=none;
        d=google.com; s=arc-20260327;
        b=TIoaKUFI5+11hPYaMgzTXsTG/ugEkgdhq0WLW8ZNB/bv4gXdTksZamw0gV4bNji7RH
         ckHT8C0BWQqsFfxbUTmBDZVNH1rZ5ay2PFZrgJ4W8LDC1OMqNVt/9evTgXopY/AzofXL
         bEDyAPq3EVtxztfZsbeyb8+w0QKwdr8hwkO7T1Z1r0tCXSXnB53uhhSHMVJEFIYFU/bh
         s0z5ZtVLVEDc/hzaYiLJrpQzsOHhv8IMadXMEy7pD7EFbh/51einFnMoasYGiDrQJYJG
         WfJFKQuCJ8Ejg3ILl6qGWscknnEq8d+y4+5UaUPPbJcts+iiJPd94yjGC6IKwTQc7tl8
         O1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        fh=2WSE8byRlb/L1ftyh7KHfyBWmnuRnbzNB3roRPebAGs=;
        b=Q1daIoZitAYkgru7DG9PI4Ys4uKL+6H8Xrv24HPEBmmzc+f68qbfcOxeR6IrvAAafh
         kVjmm3j2kbS/wpTjZBuMrQQGRDi4NZe1ifh+R91mbo/+tvOG0TSKJwXgK/StLzenqXm/
         jd6I+Mus82d8J6InHGSgBmHREjVwc3yZ0cMARqyJy80zLDja6b3dyJEx9R/PNnTTiB3K
         lkX38asADTFgBZ9eNTTw+x3z0WmPPPDFftHFQmENutvAZF37lXau4Xmkgu+zZsZkXP/a
         6l0X53zyq/34eSGlC4D3S7gV+PUIW3SgVTlrCXWkFcHs/F+XNoJTWADZEles2LFP+wJf
         9Xcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792854411; x=1793459211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        b=gIYFHd8DsEXamix+NMalBmpbJ1aAc9wR8B4CGy892vSJyUNML2hmJ0NRacqctbZOjV
         uGG9hpaaDlxaNlh5gU5jYxYNW7B7z7iSnHn2vHk/uC15bzEKgFubDpuolsX2e6xeeH4M
         WaTEzDXQJjwrMtbb5JgtaorqWm9yVLEP9TMe8kHTqFdpAdaXn9dF0p79p5c2NCRiYfMa
         gCwVBW7TsCo4Nte/3NDWPMo9FpQIk+0q0a8ToklKUX8istFSWHB5YYkJ302D/B8Poegu
         uh51+1oBggN3VcM8XWNM1Bz44h2tRdlbsbRojMTcW2MvP7lCDFkNrzznE8+M8MXPXUms
         t0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854411; x=1793459211;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        b=SRcuf85qKmJbailffi+FodgEcCL2klQBBIrrqsUjQvhlqJhk3K3igE2mGg9Km29WPG
         oBCUH0b+QyZMTxH3STj6DMVwCDZ5z24HRclvV/NZ6Tfl8trm7by31SKYEMFd6nT6vQmQ
         ma6+mAkk6JNvukJwvJkitdLRLsO+SuYgDSvJuCOnvOpuXZmZlwHybeZTBfFLpDKXuKvU
         /BkW8zgtu0cZn5eGQhGU1FVeH2SxLIN5HiBMk5sktQs8nGJ1dSZ6vlC0Y/BIxqh34KIC
         UqxmrTp7d4Nj96UYTNonX+CTIsEPGG+SJMbV+sQrFF0ir2LqnSbFyaN0lJgOAviV+3Gc
         MPuA==
X-Forwarded-Encrypted: i=1; AKwUvBy6go8pUIypMm8tLnF6C/H49r2nEL46iN4QUedd2LXTqpsSl5Tf4wRGO37IUsyXq2mVufxp6/kfPrqXcK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYINYvIn7Vst2xmh7jziG4H87NRnAVZoJATiVOm2gZsS00j6z04Z
	VhLZpV104OGP6eX8F1ENil1HxMRQuOdXktvJQV0RfTWr5Nc4n2CZ7iI8ka9gXg4fflDikE3zgm/
	NTxQif410GCIDnrhgVirfLOW8Kvk3xvI=
X-Gm-Gg: AYBFou1kLK1NNCtLhTS+0Wxzc0J0oOnL4OXptNHn2q4msmJNNOyutOQOa9ioGe4XtwT
	PWHNaLxcqC6fA3rq9AK3n8fZC5AYUFnwSUw0pM136pa70QQYiRfVKs6BUlwzfQpiiTxK/fkQyyF
	AiF++QYxf9DyUeBboy4Z1+nk11dpDpcuK7zMByE10Bpo6FF0jqwURaGFWQaoRr3HSeVbScajE2Y
	6tcwr1aXER2DTCnhUOvCWAf0M/hOCjOuQVpn5IjgZj4WTKBfyqKAmBA43lHmiRHDgWPDI0QRcRu
	lnSFXo+9+3k2nQspdM5Ed9Epo9ngkaxvdCxTuwKYqZPffsqeGKDnUlxSb89hnQDtxcXxVIf3JCg
	CsYQN4GV5lW9YKjew8hQv/7WzfGKRTxtIQsrqrVTdtlHlPFIA5VoapGGvXsw/Z8ohp7Eg
X-Received: by 2002:a17:907:6d16:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c46bda69f8dmr291186666b.2.1792854410627; Sat, 24 Oct 2026
 08:06:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sat, 24 Oct 2026 16:06:36 +0100
X-Gm-Features: AclHuK99BklcQsEQBiE_tBGIeGBFoFNj7HpEgy0uA-KhpZyzNFx1YZjL5cBBczA
Message-ID: <CAHxSwT_gJbatihGE4DAu=JmSnvWXpguUq4Yzg7jreTRhqzdQhA@mail.gmail.com>
Subject: staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000047f7ec065e9772eb"

--00000000000047f7ec065e9772eb
Content-Type: text/plain; charset="UTF-8"

Hi Andy and Greg,

Please find attached the patch that replaces non-atomic udelay()
instances with appropriate usleep_range() bounds in
drivers/staging/fbtft/fb_upd161704.c.

Thanks,

Abubakar Musa Samaila

--00000000000047f7ec065e9772eb
Content-Type: application/octet-stream; 
	name="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvmj4hza0>
X-Attachment-Id: f_mvmj4hza0

RnJvbSA3NzgwMzBhYTkyOTFlM2E3ZDQwZmZiMDNiMTllNjg3NzA0MWNkZGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYnViYWthciBNdXNhIFNhbWFpbGEgPGFidWJha2FybXVzYXNh
bWFpbGFAZ21haWwuY29tPgpEYXRlOiBTYXQsIDI0IE9jdCAyMDI2IDEyOjAyOjI1ICswMTAwClN1
YmplY3Q6IFtQQVRDSF0gc3RhZ2luZzogZmJ0ZnQ6IGZiX3VwZDE2MTcwNDogUmVwbGFjZSB1ZGVs
YXkoKSB3aXRoCiB1c2xlZXBfcmFuZ2UoKQoKU2lnbmVkLW9mZi1ieTogQWJ1YmFrYXIgTXVzYSBT
YW1haWxhIDxhYnViYWthcm11c2FzYW1haWxhQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQvZmJfdXBkMTYxNzA0LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3VwZDE2MTcwNC5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L2ZiX3VwZDE2MTcwNC5jCmluZGV4IDcyODgxNDBlNy4uOTRhZTViYmYwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfdXBkMTYxNzA0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5n
L2ZidGZ0L2ZiX3VwZDE2MTcwNC5jCkBAIC0zMiwyNyArMzIsMjcgQEAgc3RhdGljIGludCBpbml0
X2Rpc3BsYXkoc3RydWN0IGZidGZ0X3BhciAqcGFyKQogCiAJLyogb3NjaWxsYXRvciBzdGFydCAq
LwogCXdyaXRlX3JlZyhwYXIsIDB4MDAzQSwgMHgwMDAxKTsJLypPc2NpbGxhdG9yIDA6IHN0b3As
IDE6IG9wZXJhdGlvbiAqLwotCXVkZWxheSgxMDApOworCXVzbGVlcF9yYW5nZSgxMDAsIDE1MCk7
CiAKIAkvKiB5LXNldHRpbmcgKi8KIAl3cml0ZV9yZWcocGFyLCAweDAwMjQsIDB4MDA3Qik7CS8q
IGFtcGxpdHVkZSBzZXR0aW5nICovCi0JdWRlbGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIw
KTsKIAl3cml0ZV9yZWcocGFyLCAweDAwMjUsIDB4MDAzQik7CS8qIGFtcGxpdHVkZSBzZXR0aW5n
ICovCiAJd3JpdGVfcmVnKHBhciwgMHgwMDI2LCAweDAwMzQpOwkvKiBhbXBsaXR1ZGUgc2V0dGlu
ZyAqLwotCXVkZWxheSgxMCk7CisJdXNsZWVwX3JhbmdlKDEwLCAyMCk7CiAJd3JpdGVfcmVnKHBh
ciwgMHgwMDI3LCAweDAwMDQpOwkvKiBhbXBsaXR1ZGUgc2V0dGluZyAqLwogCXdyaXRlX3JlZyhw
YXIsIDB4MDA1MiwgMHgwMDI1KTsJLyogY2lyY3VpdCBzZXR0aW5nIDEgKi8KLQl1ZGVsYXkoMTAp
OworCXVzbGVlcF9yYW5nZSgxMCwgMjApOwogCXdyaXRlX3JlZyhwYXIsIDB4MDA1MywgMHgwMDMz
KTsJLyogY2lyY3VpdCBzZXR0aW5nIDIgKi8KIAl3cml0ZV9yZWcocGFyLCAweDAwNjEsIDB4MDAx
Qyk7CS8qIGFkanVzdG1lbnQgVjEwIHBvc2l0aXZlIHBvbGFyaXR5ICovCi0JdWRlbGF5KDEwKTsK
Kwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjIsIDB4MDAyQyk7
CS8qIGFkanVzdG1lbnQgVjkgbmVnYXRpdmUgcG9sYXJpdHkgKi8KIAl3cml0ZV9yZWcocGFyLCAw
eDAwNjMsIDB4MDAyMik7CS8qIGFkanVzdG1lbnQgVjM0IHBvc2l0aXZlIHBvbGFyaXR5ICovCi0J
dWRlbGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAw
NjQsIDB4MDAyNyk7CS8qIGFkanVzdG1lbnQgVjMxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCi0JdWRl
bGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjUs
IDB4MDAxNCk7CS8qIGFkanVzdG1lbnQgVjYxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCi0JdWRlbGF5
KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjYsIDB4
MDAxMCk7CS8qIGFkanVzdG1lbnQgVjYxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCiAKIAkvKiBCYXNp
Y2FsIGNsb2NrIGZvciAxIGxpbmUgKEJBU0VDT1VOVFs3OjBdKSBudW1iZXIgc3BlY2lmaWVkICov
CkBAIC02MCw3ICs2MCw3IEBAIHN0YXRpYyBpbnQgaW5pdF9kaXNwbGF5KHN0cnVjdCBmYnRmdF9w
YXIgKnBhcikKIAogCS8qIFBvd2VyIHN1cHBseSBzZXR0aW5nICovCiAJd3JpdGVfcmVnKHBhciwg
MHgwMDE5LCAweDAwMDApOwkvKiBEQy9EQyBvdXRwdXQgc2V0dGluZyAqLwotCXVkZWxheSgyMDAp
OworCXVzbGVlcF9yYW5nZSgyMDAsIDI1MCk7CiAJd3JpdGVfcmVnKHBhciwgMHgwMDFBLCAweDEw
MDApOwkvKiBEQy9EQyBmcmVxdWVuY3kgc2V0dGluZyAqLwogCXdyaXRlX3JlZyhwYXIsIDB4MDAx
QiwgMHgwMDIzKTsJLyogREMvREMgcmlzaW5nIHNldHRpbmcgKi8KIAl3cml0ZV9yZWcocGFyLCAw
eDAwMUMsIDB4MEMwMSk7CS8qIFJlZ3VsYXRvciB2b2x0YWdlIHNldHRpbmcgKi8KLS0gCjIuMzQu
MQoK
--00000000000047f7ec065e9772eb--
