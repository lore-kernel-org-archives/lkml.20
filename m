Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632814;
	b=38NLqtdnmgk56+Mn8eR5jW1vW54Vwch38l+2m989wmTqslLyF8+O67fwcggQFvJ9+eaj
	 4yN0PL/lMJNv6FmivpIPWQcFX3o5+8Y1KS0YupWt35m/fVe1jCDAG+uUj+6rblUBWKDWo
	 xDZH3TtgK34vG8GiXQX7gpEWtiY3toCx78yKMDZAXwNdz7m3bgkohHN48ubA2W4KGzKUo
	 0CWCihVDAcEFjA9ZpK3FO8NGUg2+XZkYXodlryELyAOVoTWZ6mpM4FUrmAx2AEPERoBW9
	 mZ6P/Bx80PSdcVeAxIWV0QLw+fd9OZaIo+Rop4HMmjbGYejxqElaS2H9TBOspkZhe9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
	b=cMfeZQWLodx8dEVRn2orwyF0My001Bq334o1YhQB/pmVKTWY28bbnUeB+CRPx3ye7pLm
	 BtXjzgRYYkpSLZoq4JAh6m7D/S7nLy678zk8YmLNzbIu6cUcRfkKGsVyVYF0u9NiLU6yE
	 K11YJQ9FzP05M/n+KxPRVjUMY6hkBqvNHQRMFKk8j7uXQwP79FRRm49R54OmZppptxlRs
	 8LwrU5J+tLhEfavEah+1vqq99miN7wAVjIW30CKjyv2fUcv2ibDz5xHyMRbg41iKFtqE+
	 0sTifYiwioRRXGAXwNkA/S5SwK4mtOZ6y+Om4L9FcFn16JDNX8CEXO8PXDcoXgBCywQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=biwTMdef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495560810E3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A495560810E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=biwTMdef
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so30124711fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632811; cv=none;
        d=google.com; s=arc-20260327;
        b=QdXmVRN9mTHCZG86EjFOb5zQ8Q3sigEopLH96n5dQiAjQEx6PvCcR3xuzl6UWxcveY
         SEfMuhAN9zitHWa48P8lRDd28+F42onNcJOBdK/104YKiSbuL4vA2C6G7c0spamV2mIw
         YxfeQoNgh3shUuBBZGTH2a3bOoYhuIEJvgcxOMTJPlm18z9kWe5NnQCc7xxK8V7iYCGj
         hmHBC4cLKKfRjOmhBn61b9/NiOQ4jcNnEq5PtTTScgcyz9Pl1umPBEdVA6CdZIS4AUPM
         Vi4vz+Oq93eKapXaqh15YC7SFQc2ej9OgI0gLXLMlmsJkZqQEHQCN1GfhKhuSZiC78HX
         e1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        fh=ZPqTgMu43xslTGIWP5qW8+UtJbUskjXF86rZ2EOqesU=;
        b=Wsimv2uOMihfeU757jBX/xXAKzjxUApu0IlpS1jV7DxzcKZ1QcRkrXQVMNgFOaIyzX
         hX84itVdMwqs9dl4LbVHhskAIuJCckhY3M//kycpjvjb1MkqZnQxncBIf2r4KsCpYvZ0
         MJ/pMpiNEWGsaugn8P+SQJn+DG0BA0xEjv/oP3T5WqcF0UbHaMieMS1B+wVibXt4RxQJ
         4XD6hcAE+U2cXYE4OCrr1aAI9ULwcggmu5ePiZ8ZTYHm/BNeKZl6Kt0SbGAMa8/G2OGq
         JkdZJZ8fBtTHF2wZ8saEOK+qlrtdryMsrIt51AWmdpUiTDnCnTDpw24LuCehzu4YVaUP
         8BVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793632811; x=1794237611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        b=biwTMdef9br+a5+3ikgcd/pCJW9yjvLw9qBaakNup5zoRbqXeNeg1oQA23KF0Yi4on
         O/XLBuuNCPeZgnOh3InHWcZjUnR997m9nUuuz4fTWtC7oDRI8CCy5gJAqg6pJIBB/8F7
         dpmVnymz/lsX9M/pAaRCOgBnmd9hGwxBoMM6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632811; x=1794237611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        b=zd5dmisGnPdFp+eftWuNFWZNM1DmO55maEu/QyAUZsgRG21uuzvpHH5uIfOwY5XpEj
         tKKtTPq8nSiBs2i+w1ZlAdiVIR1mnKxLOpbmpQvt/U7rppSkISFYEiMjvqECUYe3f2/l
         bWi8M1rHqu/F0/P0rlWfOwA9PAjCdy3yy2Qh1Es37/ZvYeT/8S//thvpW/b06vlhsit8
         /fwsFQh8RlvifjPObHaHkXEvAbdtebgbWM99lC6u3PAgOGvjNkrmRyx6eX7j9ME6dzzk
         XvaWcGVqGPJMn7EGXeAW2aHlsBWtVMBkwSTdvG5c5VNunbFHGksvYjMo1Vf+Z7/sOg38
         EsCg==
X-Forwarded-Encrypted: i=1; AKwUvByKgzsgUzpnMgc/v/19Ms66ovjIrdWlf9CR55RwlII1G2PZfXgVcsseEKavYXB6/Ehy4EAx4X9wNWAcIp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WfqHjZRvyHxxgWnblFHSVeOJX9iSZayDdT+aX+2DvjO9dsqwv
	OGT5obTrfmNyNIHmYKvFgwrZ8qk1z29LEqO1H9fhIxXYYEpr+accXnAvxCJ+IFEfsj+W56ffHEg
	am8jEIw/Uqgqm+c2ZUItSPYtqDiW3DjW/II+Nda5G
X-Gm-Gg: AYBFou0N3gnDMoErtVsqyMgQSTK27ZYyj30jNu4ArGCooej1JLxt2PL7N7PK2Qe/TYY
	OVJX7rzuxKX6YqfFTd0Lfy7V9uD826cJozIMvgzIzxKSsMF4MSue7imSYFlPg6M9zdsgLdesKyR
	wPwdQJ39Lxng44vZne5eUoUQ0O7G0UYNv40ftuEJ4taL4BIdQvw1I3+jaTODsuh+IWHdPCGgM1A
	NuN7DvcrwAvhxqfNvRL1kBV8eL6M6we7F7DhPhJ6ZnkYdkk3raBo96GjG/wJdwMhGSxqiisdYP5
	T+rJeOham8slztUQN6hEfBuh1IfGwIOgnyHTnZ0XANN0E/Gh/GcnInvBLmATew/lIVtyPffnIv1
	Ki8r/3zdT8jZGc9RbZ9lTp8mu0FSMcqIPUu9P
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr26393441fa.22.1793632810735; Mon, 02 Nov 2026
 07:20:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain>
In-Reply-To: <auihq9nm86d6D3MW@stanley.mountain>
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 20:49:58 +0530
X-Gm-Features: AclHuK_VfT4FJjU6g92l9xx4wu9FH1YpyYCN2gnLejd3kEhEM3Icra10HG6srbg
Message-ID: <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware sample
To: Dan Carpenter <error27@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000008ad07d065f4cae10"

--0000000000008ad07d065f4cae10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:13=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Mon, Nov 02, 2026 at 07:44:09PM +0530, Kurmapu Sai Devansh Prasad wrot=
e:
> > >From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
> > From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> > Date: Mon, 2 Nov 2026 19:11:09 +0530
> > Subject: [PATCH] staging: greybus: fix string termination in firmware s=
ample
> >
> > The firmware_tag string copied via strncpy() is not guaranteed to be
> > NUL-terminated if the source string is exactly the size of the destinat=
ion
> > buffer. This can lead to a buffer over-read.
> >
> >  Since alternatives like strscpy_pad cannot be used in user space
> > sample code, we can make it  safer by limiting the copy size to
> > MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
> > terminator. This ensures the string is always
> > safely terminated before being passed to the ioctl.
>
> In user space, using strncpy() is fine.
>
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings
> >
> > This is my very first patch to the Linux kernel! I've been learning the
> > process and would deeply appreciate any feedback from the maintainers.
>
> Put this sort of unrelated conversational stuff under the --- cut off
>
> >
> > Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in=
>
> > ---
>   ^^^
> here.  So that it doesn't get saved into the kernel git log.
>
> The patch is pretty badly corrupted and doesn't apply.  Read the first
> two paragraph of Documentation/process/email-clients.rst
>
> regards,
> dan carpenter
>

--0000000000008ad07d065f4cae10
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="v2-0001-staging-greybus-fix-string-termination-in-firmwar.patch"
Content-Disposition: attachment; 
	filename="v2-0001-staging-greybus-fix-string-termination-in-firmwar.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvzelf7f0>
X-Attachment-Id: f_mvzelf7f0

RnJvbSA4YWMxYjgxM2E1MjAzN2EzNjBkNThlOGUzNDViNjYxMTkzMjU4YjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLdXJtYXB1IFNhaSBEZXZhbnNoIFByYXNhZCA8YnRlY2gxMDQ4
Ny4yNkBiaXRtZXNyYS5hYy5pbj4KRGF0ZTogTW9uLCAyIE5vdiAyMDI2IDE5OjExOjA5ICswNTMw
ClN1YmplY3Q6IFtQQVRDSCB2Ml0gc3RhZ2luZzogZ3JleWJ1czogZml4IHN0cmluZyB0ZXJtaW5h
dGlvbiBpbiBmaXJtd2FyZQogc2FtcGxlCgpUaGUgZmlybXdhcmVfdGFnIHN0cmluZyBjb3BpZWQg
dmlhIHN0cm5jcHkoKSBpcyBub3QgZ3VhcmFudGVlZCB0byBiZQpOVUwtdGVybWluYXRlZCBpZiB0
aGUgc291cmNlIHN0cmluZyBpcyBleGFjdGx5IHRoZSBzaXplIG9mIHRoZSBkZXN0aW5hdGlvbgpi
dWZmZXIuIFRoaXMgY2FuIGxlYWQgdG8gYSBidWZmZXIgb3Zlci1yZWFkLgoKU2luY2UgYWx0ZXJu
YXRpdmVzIGxpa2Ugc3Ryc2NweV9wYWQgY2Fubm90IGJlIHVzZWQgaW4gdXNlciBzcGFjZSBzYW1w
bGUgY29kZSwgd2UgY2FuIG1ha2UgaXQgc2FmZXIgYnkgbGltaXRpbmcKdGhlIGNvcHkgc2l6ZSB0
byBNQVhfU0laRSAtIDEgYW5kIGV4cGxpY2l0bHkgYnkgYXNzaWduaW5nIHRoZSBsYXN0IGJ5dGUg
dG8gYmUgYSBOVUwgdGVybWluYXRvci4KCkxpbms6IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3N0cm5jcHktb24tbnVsLXRlcm1p
bmF0ZWQtc3RyaW5ncwoKU2lnbmVkLW9mZi1ieTogS3VybWFwdSBTYWkgRGV2YW5zaCBQcmFzYWQg
PGJ0ZWNoMTA0ODcuMjZAYml0bWVzcmEuYWMuaW4+Ci0tLQpIZWxsbyAgRGFuLCB0aGFua3MgZm9y
IHRoZSBhZHZpY2UuIEkndmUgYXR0YWNoZWQgdGhlIHBhdGNoIHRoaXMgdGltZSB0byBhdm9pZCB0
aGUgR21haWwgZm9ybWF0dGluZyBpc3N1ZXMuCiBJIGFsc28gcmVtb3ZlZCB0aGUgZXh0cmEgY29t
bWVudGFyeSBmcm9tIHRoZSBjb21taXQgbWVzc2FnZS4KLS0tCiAuLi4vZ3JleWJ1cy9Eb2N1bWVu
dGF0aW9uL2Zpcm13YXJlL2Zpcm13YXJlLmMgICAgICAgIHwgMTIgKysrKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUu
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdh
cmUuYwppbmRleCAzYjM1ZWY2ZDRhZGIuLmE2YTA5ODhhZDZmZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJtd2FyZS5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUu
YwpAQCAtNjQsNyArNjQsOSBAQCBzdGF0aWMgaW50IHVwZGF0ZV9pbnRmX2Zpcm13YXJlKGludCBm
ZCkKIAlpbnRmX2xvYWQubWlub3IgPSAwOwogCiAJc3RybmNweSgoY2hhciAqKSZpbnRmX2xvYWQu
ZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsCi0JCUdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpF
KTsKKwkJR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxKTsKKwkoKGNoYXIgKikmaW50Zl9s
b2FkLmZpcm13YXJlX3RhZylbR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxXSA9CisJCSdc
MCc7CiAKIAlyZXQgPSBpb2N0bChmZCwgRldfTUdNVF9JT0NfSU5URl9MT0FEX0FORF9WQUxJREFU
RSwgJmludGZfbG9hZCk7CiAJaWYgKHJldCA8IDApIHsKQEAgLTEwMiw3ICsxMDQsOSBAQCBzdGF0
aWMgaW50IHVwZGF0ZV9iYWNrZW5kX2Zpcm13YXJlKGludCBmZCkKIAlwcmludGYoIkdldHRpbmcg
QmFja2VuZCBGaXJtd2FyZSBWZXJzaW9uXG4iKTsKIAogCXN0cm5jcHkoKGNoYXIgKikmYmFja2Vu
ZF9md19pbmZvLmZpcm13YXJlX3RhZywgZmlybXdhcmVfdGFnLAotCQlHQl9GSVJNV0FSRV9VX1RB
R19NQVhfU0laRSk7CisJCUdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFIC0gMSk7CisJKChjaGFy
ICopJmJhY2tlbmRfZndfaW5mby5maXJtd2FyZV90YWcpW0dCX0ZJUk1XQVJFX1VfVEFHX01BWF9T
SVpFIC0gMV0gPQorCQknXDAnOwogCiByZXRyeV9md192ZXJzaW9uOgogCXJldCA9IGlvY3RsKGZk
LCBGV19NR01UX0lPQ19HRVRfQkFDS0VORF9GVywgJmJhY2tlbmRfZndfaW5mbyk7CkBAIC0xMzAs
NyArMTM0LDkgQEAgc3RhdGljIGludCB1cGRhdGVfYmFja2VuZF9maXJtd2FyZShpbnQgZmQpCiAJ
cHJpbnRmKCJVcGRhdGluZyBCYWNrZW5kIEZpcm13YXJlXG4iKTsKIAogCXN0cm5jcHkoKGNoYXIg
KikmYmFja2VuZF91cGRhdGUuZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsCi0JCUdCX0ZJUk1X
QVJFX1VfVEFHX01BWF9TSVpFKTsKKwkJR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxKTsK
KwkoKGNoYXIgKikmYmFja2VuZF91cGRhdGUuZmlybXdhcmVfdGFnKVtHQl9GSVJNV0FSRV9VX1RB
R19NQVhfU0laRSAtIDFdID0KKwkJJ1wwJzsKIAogcmV0cnlfZndfdXBkYXRlOgogCWJhY2tlbmRf
dXBkYXRlLnN0YXR1cyA9IDA7Ci0tIAoyLjU2LjAKCg==
--0000000000008ad07d065f4cae10--
