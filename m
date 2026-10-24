Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792855945;
	b=c45fTP3ia0eCw5O4KjpMiBe+wAiiMoymi3xJ7F1PEAx2fvsi+03YEomxtG6TFCUL8Ewu
	 LHG6kb7SavFX7BbZnlwm3VG5aR2sqtEUN3J/MdlpJjKSQDGO2JaCahGwEHMx2oCr9LR1b
	 Kfip6WuIsUajs7S6/gE+UHJpVbjLdRYZCKIxZK5PcNPDPiD5BFLIQ7V7u9ZFmjbjA3YYH
	 W9NKjcBkorkosltKglGSwcKQTLijQpOcuHMILr5QcCrv5W+QBbFZWMdKeXhQSFcMCPIF2
	 kVzx21PmaXDKCGgO4IMpgTk7IYtECRcsAejO2z7MPS+yk+5rQa5Qr/MwuxvCI2VtoYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792855945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
	b=P3tzU1tehCPqYLEV6XIP95cKxPGMfLYCs4DJgR/JgFoASWmWE/lZ7jbtO/CbpR6ftOP4
	 1Hk3FHka9Yme3Bgb/3LxBBPxIjGYYz08M9RtHRlQeluf++kHrvQ8EPyeCkA4pr/MTzaL8
	 bK+8ojLvEs4YnKvg1sXrmoTLQIhUAbQsSsnoT8HDGdzmAJXfTj10iBT9Tf25a1xBTi3Ag
	 dy65EYXMDh/M2bMSN5Rb9nz1mheaM/aSYPjp9e9pz8hJWmM++HgkZGdkvNrY4BT/4q4+P
	 EKG3uROQ4voCg+GMSRTr/G0oeeFw8B209T/zrDCMtHAtqjrIZ8WEO3mMRMVu/+1U8Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SApMvrWE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B5606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SApMvrWE
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2455385a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792855943; cv=none;
        d=google.com; s=arc-20260327;
        b=kyGe1d5MLdst1Ag+uxwl9ku4SG7eAsfgwlyxSCDHghnJtckX8zXOaIY6cfnt08NKWA
         ZPyqyUGdtBR6/6k8QkOgxtKnlVMTWG1X4D5XxbXMKzxJTRVO1owvDwpNgkcAcDLb3wK1
         zY9SKeYZe08wpffvFWp+FNA19MOeeMKqdsry0MOsGdFuB29JeBjtnB32fV1UUoL1DApG
         TpI3nW7swNzKNko4w4xzQ43WtM+wci8r9PtEafjLt66IIl/1bVnYpCFEbEIcz1PjM/nP
         5iynrYBm3JOJDT+3ATosagFS7kY98WIazQ9SBPMfiS+Rd0RcuxhGCWQN4xADkLOvcKJ5
         GngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        fh=HaqBLHH1DWzs2JrPGs+ELH9zNJcmZKTMR0cT4PnQugY=;
        b=gD15zhpJo8M8WJOkbk3sqNWhO0RGSbqgJa5/rvRGg2E18i7AxZIlpXyHyJodD2x7DQ
         j7k8odu6w9exN6I9HJwpsvgz/plGm8JfYgL0IhTl1X3a2xOfZ1ITfJaZZu2FrquzV9Io
         ve4LlfOqMNffWm0EOrbeVSQSyAJDHvVXAy/hZp2u4kWeOKDb9PctRiyEyUmRKkLCi6Mr
         dYascEcTspwv/QEa/fnslKuXpY3D01mmR3w2BZ5UPbvR0HEwfNxmE6X9KTKIWQxgoH4L
         KvTh3dml+XJo2bObbC4NMto4lSJFFyDdBnTsKZC/9nfgq0q5SEPl6W9LUH/vvHB5I6rU
         dRjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792855943; x=1793460743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        b=SApMvrWEOo3SbIVhYSlC5ZBmjy79BCQcbqY+FZ9miSU2+CubFE5QcwgEpZrMr1U7os
         qCjYKzBzWjYEwzhhEhx6ADi1e9TWOk/iGe1Te+X2MkEFB1NK3merWE5ak4z6Ph7t/zZW
         lKyv1VR1rr6R+cq1yzBym8JQtNd+ALXf/KoFpRaOgYXU1QvsXX88aBsiCU11imeYYtEn
         aDvx4pHB013MW9tyzwNUIcvKjZpwk5Z0SuE9dcCGAreI/1hwtGOAAunx2H+wsykp+EpL
         JM8NZnZqQX9E2FgeBmUBZ4tACHydDKcGsBnssEj8AvECA8DdssS3ElyUETrKAvpt1qcK
         /yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792855943; x=1793460743;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        b=DpkSwothtR5E5HtBdWdrJ/ov1CznBuZ9PMYEBKMUuu5FHs9/hAvUQngkYepCW52dKr
         BMpFhByrOgDlF1WnjYcZ+t2bWpsuhYLn6wFGaR9KX84HBvz4zuYeLloBDsLnG1KV0ZMu
         O2KbAwhw1AioPHpDvgiB14P+xDssyPO3NMUlXuOyjxY8FdyKUSPO8Z0s7tVfdbXiW1uD
         yQqzM7Ckk7Xg4JqbX4XzLZ/1W8hTQ3owqxLkeSXQ6dMN0my6X/LQiNYHBOmcbVgHurDQ
         aycJ009sOFCxI9rOGRRJ5k7qkN24F9XOT6tR6JTW4YlnNi3Ne7Oqbc2M80mlCswRDELs
         6Dsw==
X-Forwarded-Encrypted: i=1; AKwUvBzfky99tNpb/rv3IEC1gLWqkY7XrMIZhOtXA3GvRtvAU4QfeHPlVvPlaR2Bjmp39ZTU7q7QXh61XrIJIO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3YXcU2/+MUCYX+f0tMxlL1HJIZ3ogR7yw+0ZywbOE3acW6y+N
	ADPCxosizwCYKrlNhF6WmkgupY1hMlCnVR+F9EDl7yFHfKm0m4IhNI8ijAaIQD28Mg15RpMvCyE
	WLM+JBH7cre1k2Btsn2dsYGrvt7G0UYQ=
X-Gm-Gg: AYBFou0kXICL4prdA0Gode2VHiSqZ3IJyZxNAl3r4Ko0bxRUaqFJ0qqXx3NE13+SX5W
	GDv4mBvnTIyEIlfycxMushMyv0hMYHNzh91LHS1YHxz+XSuMoJVUkL0xSFSnMubaP7iZrpFDLI/
	6QFoes2/3/AxLtLEu4t8KR6o/a5D3NbeREHkw/PfK1JHF6Wl/Eb67FcJo8iCpb1Cav7aWrYmZBi
	lFdfNpam3v5DPj/SDObHF7TIxn1BQOCbviH5J9DinyiuF3uOGok5SJMthMV/4uhl4Q8YumzuNLN
	k3ks4E/htcbapGj99PDL5g6c+Clrp+LQKbZCghJanNJO4Y1QE9QmsBLVwIw5XEzdqj2aqhFJuzU
	0wQHAjJhQg4pyEiPmhO3RD6wvGZtdEVH7ayXvQvE0x4negM91goWtd3WQIfvpDlurez1ytIVkJi
	Kk1MsyvHEgheXibSY=
X-Received: by 2002:a17:907:930a:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c46bde1c9acmr252909566b.21.1792855943476; Sat, 24 Oct 2026
 08:32:23 -0700 (PDT)
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
Date: Sat, 24 Oct 2026 16:32:11 +0100
X-Gm-Features: AclHuK9TU3AwsoiPULkfHVkczTh8p5LJGwDjkZKuc4re9S6dugKLiYK4K0vrngU
Message-ID: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
Subject: staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a53d1b065e97cd84"

--000000000000a53d1b065e97cd84
Content-Type: text/plain; charset="UTF-8"

Hi Andy and Greg,

Please find attached the patch that replaces non-atomic udelay()
instances with appropriate usleep_range() bounds in
drivers/staging/fbtft/fb_upd161704.c.

Thanks,

Abubakar Musa Samaila

--000000000000a53d1b065e97cd84
Content-Type: application/octet-stream; 
	name="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvmk3skb0>
X-Attachment-Id: f_mvmk3skb0

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
--000000000000a53d1b065e97cd84--
