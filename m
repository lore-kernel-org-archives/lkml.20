Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563717;
	b=5mos/P/j12QNekjSniiluuyIoO3GH/qE1q9PkM+/INJ2fqmu6wVo4zmN6NX0aEEi+qzJ
	 Bd5esvDUVfc7kMv0gexOHyHqUnZEbdjmOtUvJb2DfRAv1EI6GGKujIQr04UmYfl4nlUSH
	 2jrmIveshuwplsZru1d9ixpTs5UTXakHltElu72uftZX6gZ/v3jXPiN2xcZw4r16qQcpw
	 cJ4I8Y6tHaRI4ZypO3JPAc40qqMN/H9c3cC7V8BQeBWNnHgrmtp4fKY699RcjkLOfwHZ1
	 i8Fz4abaokH2oqTEHp0nAOxOq9WtRDwnS/aCnARsQ5w78LhlCZMJHfzh891IaxpkZnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
	b=UWmEsmJr9+GeGgYtpSCuwRWaYhotDUUzY5qyy2eCNMxSUk1YxXSPTN15hgDfNSjj5jFm
	 rSLBv2dJW5RE7nlT+uREHgIXJ5rczdPuaIOjeWRF6paNm/yfagXMlB3E2WcDz20jXJ89g
	 trybvzz6BuC1tWrPgnvh91Ozh1hP03XkXwaGxj9cs5xscs1YSL6VAt9yGSkNJ3fVSBLZZ
	 gaV8eCgU3NbpSUQUe2Q1jxMKDAFMrbmRdoHcrcNEyg6gtlNG3Zm1brNWWbKQ8uaGb2zby
	 8AZR0VCrPjj740cB7aPT0zZ+mZhyCsv34wM8Rbr6706LPIE+HBRaqe891UzEfsQJ+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DLnXQk6X;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7321606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7321606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DLnXQk6X
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c423b145922so306043966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793563714; x=1794168514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
        b=DLnXQk6XKZ64IABAAoSw9d1BlXAckM9SQ24EFduZQcitlL+KFnGTjwZ2FGBuTR/TzH
         uIqJ7o3yaKrc2ox3IyZmJ+AuLaVuATen4B3e1Zw4JNMUmr5VMRoeh06oFsTrryjcB73C
         o88ClbBATw/RzDRixy9VuFLG0TN7zsvLZB8Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563714; x=1794168514;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
        b=JfWNyAUTTwkfArEgc1zUhPgWxxsUwQDO6Jl2C9E+mAUibPjnD9ZAkpfVyBWhsNbLom
         DydVkIcbFBX/7964gScSaY7fnygf8vuU7lwtv+jyY63MweOV/5lpZLWrVk7hVI+5P94n
         ohkB/sARVh5kh0J9RL+aumyhyZR/UXyf70X4Tx156W+IpmsbE64zYaJCh5TufxEk8OZg
         m6HptTWAD6EKuycxcVzrxQfCvy9KJ8mCwt/lc794bJP+WDqNJhoxckxt6cpyEBVNVJhg
         yYekjko6DGABUC1Sa7sODBQWWMBrNStfGg2F96PJPzL4v7YgT33KIVtgVOdCuQT+K41z
         AUxw==
X-Forwarded-Encrypted: i=1; AKwUvBx0KrPWtVdN/Gt2oewAIZZaJQjOlGt2kV9aoCre4iqRcQ4d0obUfKcQ+nYg+LSdrg7fqbbkwGdfZcQURAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzz9on4xOLjIofZxYAnFoJRM/a5+vzwE9qgw1IHkY8YksZhTb
	+QOKBqzlLRNWjISzkEImjSF2qc6rsKszEC38/SSvabB8bUvlpqH9kxR25jNkvt8eejcPHegPGXx
	MCe5wIAM=
X-Gm-Gg: AYBFou3zqlYJLLUYqKNdcrM0vGbifo8OGZC2ISFaLDDtuclNw/7+6TRCYW8x5KspN3n
	MlCJFP3MalJT7phq9nz21zDcmL4PJPIBtcW7P2qnBxkuYwCgell622EFErdD90yKuWKxodBd8B2
	bribo+CFHFzj9eDymwQVaLn7I4CzlkHJhV1wf1EcfkoiFDtcTCxsWd6xcAWNr+7qQnRJeX5JlAp
	zjRN5m1RUMSNcHdjufA7HwJXHvycDnDkJ8jo/Wjsa4DPdrp20gj+2qrEf2U1eXcNBNSj/ZOsY4p
	YQOFd4cUtbPm/DytqY+J2laiqiwRlL3QywqvJm0MeXyc7m6vp1d2s3aKO8xaqXn16SBUelV87Nz
	8ekJQ4wfrW3US9mI3pdKSljsbt+14o1EopU5vnc9VT94Zv1EhMF4dKrmoZiduf8hX+HGZXLGjlm
	eB0RqJVtcr5udVfDb/wABy6LGwtJSPK3SF53DzojR6kAH/FqijjUBKZSuQFWEE7ukB54KE1BT2m
	grvxnqPHIV9TiJw23HBuc3cEDFXgFkLSh73kHpBdZh+FSPHES6lzOeXPmzy9/aEN4l6iF6RrRYH
	U1HC5lnikd18k4XOOTZQB0bw8+ZACu81HnwuYv7cJFaRKjWuuDLMv/UWi20XY+Qxr/R3JBHx0TN
	QAQ==
X-Received: by 2002:a17:906:604c:b0:c3f:55e6:83e6 with SMTP id a640c23a62f3a-c4cc399b6f7mr163609666b.15.1793563714070;
        Sun, 01 Nov 2026 12:08:34 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe992c7sm297941766b.69.2026.11.01.12.08.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 12:08:32 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso2594815a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:08:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy10p2euDtg4NHuMA1QK2al1dRjj8I35wgHsbpcrHGifQxiLbaIsr/B2yEizcWQhtyAkKee/IMUy3kZND4=@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5f9a:528b with SMTP id
 4fb4d7f45d1cf-6b4d5ce83f4mr4075395a12.36.1793563712541; Sun, 01 Nov 2026
 12:08:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Nov 2026 12:08:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
X-Gm-Features: AclHuK8ONZxEYl50IOYsDjuY-ouTirbn0Imtlr8QIkehP_x1qvA-yrP0t0sfR2g
Message-ID: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Subject: Speed up KConfig - fix hashtable confusion
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000f84be3065f3c97cd"

--000000000000f84be3065f3c97cd
Content-Type: text/plain; charset="UTF-8"

So the Kconfig 'expr_lookup()' function is criminally slow and takes
over 10% of the time of "make oldconfig".

The reason is that it's called just a lot, but it *really* doesn't
help that the scripting versions of the hashtable functions has not
understood the subtler issues of the hashing code that it took from
the kernel side, and in the process got things very very wrong.

The "hash_32()" function is a perfectly fine hashing function - there
are better ones around, but it's fast and "good enough". But when you
use it, you need to understand that it puts the significant bits in
the *high* bits of the result.

The kernel uses a model where you give it the number of bits you want,
and it will pick out those high bits, which makes it all work right.

But the simplified hashtable code for the host code didn't use those
high bits of the key. It just did

    (key) % HASH_SIZE(table)

to pick the hash table entry, and that's basically pessimal. When
hashing an address that typically has the low bits clear, the low bits
of "hash_32()" will *also* be clear. So the hash table ended up being
mostly empty! So even though the hash table was sized appropriately,
it wasn't being very efficient. And while making the hash table larger
mostly hides the problem, it's the wrong solution, because the cache
footprint gets worse.

Teach "hash_head()" to use the high bits of the key. Because the users
don't pass in the number of bits they want, this is pretty hacky:

    #define HASH_KEY(key,size) \
        (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))

but at least this improves on things.

I also stopped the expr_lookup() key generation from using XOR of two
pointers, which I suspect just ended up clearing most of the shared
bits. I doubt that makes a difference, but XOR of thigns that may have
shared bits really isn't great.

The cost of 'expr_lookup()' drops by a about factor of four on my
machine, and it's no longer the hottest function in all of 'make
oldconfig'.

No, "make oldconfig" still isn't the fastest thing around, but at
least this removes on particularly stupid reason for it being slower
than it needs to be.

Somebody needs to double-check this. I don't love my HASH_KEY() macro,
but it should work for power-of-2 sizes. And as far as I can tell, all
the hash tables are powers of two.

Comments?

                Linus

--000000000000f84be3065f3c97cd
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mvy9gli10>
X-Attachment-Id: f_mvy9gli10

IHNjcmlwdHMvaW5jbHVkZS9oYXNodGFibGUuaCB8IDQgKysrLQogc2NyaXB0cy9rY29uZmlnL2V4
cHIuYyAgICAgIHwgNSArKystLQogc2NyaXB0cy9rY29uZmlnL2ludGVybmFsLmggIHwgNCAtLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9zY3JpcHRzL2luY2x1ZGUvaGFzaHRhYmxlLmggYi9zY3JpcHRzL2luY2x1ZGUvaGFz
aHRhYmxlLmgKaW5kZXggNDVhYmNiMTJiZmNlLi5hNjkzMzJjY2ZmY2QgMTAwNjQ0Ci0tLSBhL3Nj
cmlwdHMvaW5jbHVkZS9oYXNodGFibGUuaAorKysgYi9zY3JpcHRzL2luY2x1ZGUvaGFzaHRhYmxl
LmgKQEAgLTEzLDcgKzEzLDkgQEAKIAlIQVNIVEFCTEVfREVDTEFSRShuYW1lLCBzaXplKSA9CQkJ
CQkJXAogCQkJeyBbMCAuLi4gKChzaXplKSAtIDEpXSA9IEhMSVNUX0hFQURfSU5JVCB9CiAKLSNk
ZWZpbmUgaGFzaF9oZWFkKHRhYmxlLCBrZXkpCQkoJih0YWJsZSlbKGtleSkgJSBIQVNIX1NJWkUo
dGFibGUpXSkKKyNkZWZpbmUgSEFTSF9LRVkoa2V5LHNpemUpICh1bnNpZ25lZCBpbnQpKCh1bnNp
Z25lZCBpbnQpKGtleSkvKDB4MTAwMDAwMDAwdWxsLyhzaXplKSkpCisKKyNkZWZpbmUgaGFzaF9o
ZWFkKHRhYmxlLCBrZXkpCQkoJih0YWJsZSlbSEFTSF9LRVkoa2V5LEhBU0hfU0laRSh0YWJsZSkp
XSkKIAogc3RhdGljIGlubGluZSB2b2lkIF9faGFzaF9pbml0KHN0cnVjdCBobGlzdF9oZWFkICpo
dCwgdW5zaWduZWQgaW50IHN6KQogewpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL2V4cHIu
YyBiL3NjcmlwdHMva2NvbmZpZy9leHByLmMKaW5kZXggMmI5MWQxNmJmMTRmLi4xOWNhMmFkMTA0
MjUgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9leHByLmMKKysrIGIvc2NyaXB0cy9rY29u
ZmlnL2V4cHIuYwpAQCAtMTYsNyArMTYsOCBAQAogCiAjZGVmaW5lIERFQlVHX0VYUFIJMAogCi1I
QVNIVEFCTEVfREVGSU5FKGV4cHJfaGFzaHRhYmxlLCBFWFBSX0hBU0hTSVpFKTsKKyNkZWZpbmUg
RVhQUl9IQVNIU0laRQkJKDFVIDw8IDE0KQorc3RhdGljIEhBU0hUQUJMRV9ERUZJTkUoZXhwcl9o
YXNodGFibGUsIEVYUFJfSEFTSFNJWkUpOwogCiBzdGF0aWMgc3RydWN0IGV4cHIgKmV4cHJfZWxp
bWluYXRlX3luKHN0cnVjdCBleHByICplKTsKIApAQCAtMzUsNyArMzYsNyBAQCBzdGF0aWMgc3Ry
dWN0IGV4cHIgKmV4cHJfbG9va3VwKGVudW0gZXhwcl90eXBlIHR5cGUsIHZvaWQgKmwsIHZvaWQg
KnIpCiAJc3RydWN0IGV4cHIgKmU7CiAJaW50IGhhc2g7CiAKLQloYXNoID0gaGFzaF8zMigodW5z
aWduZWQgaW50KXR5cGUgXiBoYXNoX3B0cihsKSBeIGhhc2hfcHRyKHIpKTsKKwloYXNoID0gaGFz
aF8zMigodW5zaWduZWQgaW50KXR5cGUgKyBoYXNoX3B0cihsKSArIGhhc2hfcHRyKHIpKTsKIAog
CWhhc2hfZm9yX2VhY2hfcG9zc2libGUoZXhwcl9oYXNodGFibGUsIGUsIG5vZGUsIGhhc2gpIHsK
IAkJaWYgKGUtPnR5cGUgPT0gdHlwZSAmJiBlLT5sZWZ0Ll9pbml0ZGF0YSA9PSBsICYmCmRpZmYg
LS1naXQgYS9zY3JpcHRzL2tjb25maWcvaW50ZXJuYWwuaCBiL3NjcmlwdHMva2NvbmZpZy9pbnRl
cm5hbC5oCmluZGV4IGQwZmZjZTJkZmJiYS4uZjI0NDk1MjQ5NmViIDEwMDY0NAotLS0gYS9zY3Jp
cHRzL2tjb25maWcvaW50ZXJuYWwuaAorKysgYi9zY3JpcHRzL2tjb25maWcvaW50ZXJuYWwuaApA
QCAtMTEsMTAgKzExLDYgQEAgZXh0ZXJuIEhBU0hUQUJMRV9ERUNMQVJFKHN5bV9oYXNodGFibGUs
IFNZTUJPTF9IQVNIU0laRSk7CiAjZGVmaW5lIGZvcl9hbGxfc3ltYm9scyhzeW0pIFwKIAloYXNo
X2Zvcl9lYWNoKHN5bV9oYXNodGFibGUsIHN5bSwgbm9kZSkKIAotI2RlZmluZSBFWFBSX0hBU0hT
SVpFCQkoMVUgPDwgMTQpCi0KLWV4dGVybiBIQVNIVEFCTEVfREVDTEFSRShleHByX2hhc2h0YWJs
ZSwgRVhQUl9IQVNIU0laRSk7Ci0KIHZvaWQgZXhwcl9pbnZhbGlkYXRlX2FsbCh2b2lkKTsKIAog
c3RydWN0IG1lbnU7Cg==
--000000000000f84be3065f3c97cd--
