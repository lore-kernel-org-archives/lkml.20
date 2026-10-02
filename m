Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CA2874F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902310; cv=pass; b=TZ83XrRHM0mf5Zj12MNUc8MBmwwo6ZxBbaI5XDJF9MoJ0Cyk6saZhggX0UMYrXuRdv+Jz91uDsVWVDPOdnGBW383mmvRAkNcoDGOqWKbdXKIjl8freqj50dLQmzSts652JVZnmaP3hc7fG+0Imv0ZWD64LrPdynB12Xn0o0TaNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902310; c=relaxed/simple;
	bh=9QQqHOadwXuusF7gU35Z6uz7wb0aFhZEe5rXnNisqoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIn75ppvI+KITO5B4Q+Xb3bCWoSoLim3I9Aq03JbjLdQbq0nTpmdIG9NAKnji2KM9hermuPx7yCBE6kASiw9YOK9TIeTTliNsQnjGC9gd0+ELmZ78ZQipGiZfIa+TbBOJMw3JeOx5mWZGm9WKPvbW4nQ4QfpKt6CBuheG58G7Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGlBSW6t; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGlBSW6t"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so4431654c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790902308; cv=none;
        d=google.com; s=arc-20260327;
        b=cUk7jTkEBvE7gZedI3TjUJ6E96cP9vaYoGwZjDaKVanOFKVDFXsSf0Fv52gueVH+kW
         BY1raqmRev/FEGPstQF9vhIw/R0IIfcNTHvvR6+zRkLLLxLYgAtw5di/66hRtcz+KYgV
         P8PegPthqy9kDT30KavQEDTmK4UmB4iuqic3XHACHQtqDWOM9wzXtJKpMw1wRSzDpiWm
         WqWbWXbD14VyoJ+XpqX9oMXwdO1A1qeJ1+4qA/V27cidELu4tTbXoCAEhFNVFCJEn7nq
         zS5/CgG+E2MjNulbvPfr72Ls9wmzfk6aT+IZwu1PMn2+AiGP1U3ThgKOKumBwbdoPeZX
         323w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        fh=YDD7EnO8CkN0Dj3oAnWebSRiDID4Ov/EIiFrPUsPwek=;
        b=PKJBT7iZazCp/25kc5cMpLMG+wNI0nDLSBysGWgWTLuKV+Jgo1efEUyXefR0r8ihfp
         uAukZ0qcTFnrE11o4npKIojRHBbeaam2PMYuyGSYS3Fxh6tMa73ULbNfu+yAEad0s5iy
         eAidWjD+Kzf5VAWyDy1tWpR0C7utd5d8dc9EdR+GBwsY+ccStKRvtD5rRXxZMi7MS8jf
         6eF+3Lw88pOzt8RRFDfn7n6Sf/0+0ft51gZCN8khgsk0MVjvsww8Y4TDbwsoYgcThT9M
         VePQbUD2y72szT+McFMGQt68bA0OuvzTBnnq+P+sFFC+m1aLXIe83avsaFKtipcRq4sb
         72LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790902308; x=1791507108; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        b=DGlBSW6tbtzm8scziDGC/fo36r5objBX3C7/2/p/rD54/k+e06GxRfeUvRoK8UfWqW
         bLS6V1X4yDLuUUU/N47Jk00H7ciXYSmw9GjYP3YSZFVWlZFhAPNU0ahEq2kLSMBZAEAA
         QmTYcnKs2rFSEJPv6VueJRRXPLlbrVRbw4Q9hvo6cj6uHt2cbCuB1IbzrjGAEjQn91Xb
         9INTCTyT1xL0jKtkoUJhKMCy4bzcznRDVmE0h7yMx6NbvNw2XYxoEuMmyGNjeF2xehIU
         Q93GL8RxAY0+8Yss0tyt2F0Oxamk4E4OIlFLzeBydvfyawPSXlzxwfKRJJtR63GXwkLM
         RqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790902308; x=1791507108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        b=Pl7OB2FygRfn//bbf/lsEWOtV9UXfna6pFUzX0VWJph1vPoWVv+Egn5ebTrfQlZR6Z
         tSanim8B2u/XrBBZyZ2tLTTKN65TMyx/i8zQa6fBrL5qJTFFrlEzgW4CY81V6cFyUOmz
         9sue0LzCN4WRZ68Yg+2jgcWIS1SIHkLKFa68rgB/3VXK7CDFXJ9IK1xLi5khA/OFeM6H
         ewH1R+uOUzG2h6PfT207ruXgEu1mTQQmj6U3v83dy3OQ84JFdKfIELyjiiDfXcSae0LV
         a9bjUJhbQE8c1KDpYE1gg61g2yX7tCwLnwHsbEVLU5Fr+5a4QlZb9xQO6bbZBqei0++8
         EVkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuu+6bPBL8Zkjd5wfd0QS/wQSLaKxWAR1qPEVwwdSfPZKmwRwIAusxW9g3X/aNDP7ccETlXs8lzV6dqy0=@vger.kernel.org
X-Gm-Message-State: AFuF++n83YtFRjYk4UJ9J4QVbuu3svtNk1v38WduPXwIMVZizDcUuxL1
	l9J9tH3Ny9qwGM1DeZch78bZyvGjJ+zSplmeRp+p2Nx9RKLns2f5eL8L3E2gwljrWD+SzsO23jS
	YrQfE4jNFa2zLR2CGVToCbfop3djsyOU=
X-Gm-Gg: AYBFou0GV9YsH6Nd8qiQZwiZwziPzw6xcfJT6jv9V6naHnJojXF1Kk3Vax79KV5R77r
	XUVOVMzjzApOHDIKnLs7kLmEXPMe/8yiqp8YqtIVPX/hKjG3F6QRTDRV1O/0VGGxdtiOT7Qm1Wk
	yU0xf3OKbfxem+W5vmrXMUg0UYY/TiIugy9NZ/sOTIHq11W3whA4NYgFDH5nANhRSewkkMRYqdG
	kQI0NoCn1GrigedwooDCr2gwYWSQfSgmPtQlJSy6L1CLAbIoe+xa39pRyH5n+10+ENtYdYqsRKc
	XZaEcsrTQuQFFL4GBoQ5sdhs+e/Q26sy93+fkzXbnXDxLYBMtrqrkevhEOKepdL20Cp0ax/uyfW
	HIY9FNIe3u+omM0Y0YItI8A7WDNxqMjuGSZUGGU8=
X-Received: by 2002:a05:7022:b053:20b0:143:8865:cc7 with SMTP id
 a92af1059eb24-14f5b51545dmr1167883c88.21.1790902307643; Thu, 01 Oct 2026
 17:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
In-Reply-To: <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Fri, 2 Oct 2026 02:51:35 +0200
X-Gm-Features: AclHuK8cR2FAAtPPVrY8Kiipfv2sKqbjaHguEsz76PnmybJp07-9EQAMJkpjaMY
Message-ID: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: Anton Karasev <uselessfire@gmail.com>
Cc: qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, martiya.ar@gmail.com, aleksejirlik@gmail.com
Content-Type: multipart/mixed; boundary="000000000000e0cfcc065cd0ef84"

--000000000000e0cfcc065cd0ef84
Content-Type: text/plain; charset="UTF-8"

Follow-up to my own mail: I have now run those values rather than only
reading them out of the tables.

Built current pdx86 for-next with Chris's GET-only function-id change
and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
profiles apply and read back correctly, checked against the EC register
each time:

  low-power            -> QFAN 2
  balanced             -> QFAN 1
  balanced-performance -> QFAN 3
  performance          -> QFAN 4

All three power-profiles-daemon profiles work as well, so the desktop
slider works end to end on TM2307.

Two things fell out of that:

- Without Chris's change every one of those writes fails with -ENOMSG
  here, exactly as you described, and with it all of them succeed. So
  that is a Tested-by from a second board if it is useful.

- No machine-specific capability check is needed on this one.
  WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
  -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
  "skip the check". The stock one is fine as-is.

So the TM2307 entry comes out as just a mode map plus a DMI match.
Attached, against the v9 ops table and checkpatch-clean, in case it is
useful to have in hand while you write the TM2309 one. I will resend it
properly once that series settles -- posting it now mainly so the values
sit somewhere concrete, and Mingyou can fold it straight into v10 if
that is easier than carrying a separate patch.

Thanks,
Milos

--000000000000e0cfcc065cd0ef84
Content-Type: application/octet-stream; name="0001-tm2307-ops-entry.patch"
Content-Disposition: attachment; filename="0001-tm2307-ops-entry.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muq8xglt0>
X-Attachment-Id: f_muq8xglt0

RnJvbTogTWlsb8WhIFZsa3UgPHZsa3UubWlsb3MuZnVuQGdtYWlsLmNvbT4KRGF0ZTogVGh1LCAy
IE9jdCAyMDI2IDAyOjQ1OjAwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0veDg2OiBi
aXRsYW5kLW1pZnMtd21pOiBBZGQgWGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0CiAyMDI0CgpUaGUg
WGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0IDIwMjQgKGJvYXJkIFRNMjMwNykgc3BlYWtzIHRoZSBz
YW1lIE1JRlMKV01JIGludGVyZmFjZSBidXQgZW5jb2RlcyBXTUlfRk5fU1lTVEVNX1BFUl9NT0RF
IGRpZmZlcmVudGx5IGZyb20gdGhlCkJpdGxhbmQgZGVmYXVsdC4KCldNQUEgKFNTRFQgd2l0aCBP
RU0gVGFibGUgSUQgWE1DQzE4MDYpIHdyaXRlcyB0aGUgdmFsdWUgaGFuZGVkIHRvCldNSV9GTl9T
WVNURU1fUEVSX01PREUgc3RyYWlnaHQgaW50byB0aGUgRUMgcmVnaXN0ZXIgUUZBTiwgYW5kIE5U
RFAgaW4KdGhlIERTRFQgbWFwcyBRRkFOIG9udG8gdGhlIERQVEYgdmFyaWFibGUgT0RWMToKCiAg
UUZBTiAgbWVhbmluZyAgICAgICAgICAgICAgICAgIE9EVjEKICAxICAgICBiYWxhbmNlZCAgICAg
ICAgICAgICAgICAgMAogIDIgICAgIHF1aWV0ICAgICAgICAgICAgICAgICAgICAyCiAgMyAgICAg
cGVyZm9ybWFuY2UgICAgICAgICAgICAgIDEKICA0ICAgICBmdWxsIHNwZWVkICAgICAgICAgICAg
ICAgNAoKMCBpcyBub3QgYSBtb2RlLiBOZWl0aGVyIHRoZSBmbjggZ2V0dGVyIG5vciB0aGUgRm4r
ZmFuIGhvdGtleSBoYW5kbGVyCmVudW1lcmF0ZXMgaXQsIGFuZCB3cml0aW5nIGl0IGxlYXZlcyB0
aGUgRUMgd2l0aCBubyBmYW4gY3VydmUgYXQgYWxsOgptZWFzdXJlZCBvdmVyIGEgZml4ZWQgMTUw
IHMgd2luZG93IGZyb20gdGhlIHNhbWUgODAgQyBzdGFydCBhdCB0aGUgc2FtZQpwaW5uZWQgcG93
ZXIgbGltaXQsIHRoZSBwYWNrYWdlIHNoZWQgMTUuMiBDIChzZCAxLjQ4LCBuPTQpIGF0IFFGQU4g
MAphZ2FpbnN0IDI5LjUgQyAoc2QgMS4xMiwgbj00KSBhdCBRRkFOIDEsIHdpdGggbm8gb3Zlcmxh
cCBiZXR3ZWVuIHRoZQp0d28gcmFuZ2VzLCBhbmQgdGhlIGNoYXNzaXMgc2Vuc29ycyBlbmRlZCA4
LTEwIEMgaG90dGVyLiBUaGUgZGVmYXVsdApiaXRsYW5kX21vZGVfbWFwIHNlbmRzIDAgZm9yIFBM
QVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsIHdoaWNoIGlzIHRoZQpwcm9maWxlIHBvd2VyLXByb2Zp
bGVzLWRhZW1vbiBzZWxlY3RzIGF0IGV2ZXJ5IGJvb3QuCgpObyBtYWNoaW5lLXNwZWNpZmljIGNh
cGFiaWxpdHkgY2hlY2sgaXMgbmVlZGVkLiBUaGlzIGZpcm13YXJlIGRvZXMgbm90CmltcGxlbWVu
dCBXTUlfRk5fU1lTVEVNX0FDX1RZUEUsIGFuZCBzaW5jZSBjb21taXQgIkRldGVjdCBmYWlsZWQK
ZnVuY3Rpb24gY2FsbHMiIHRoYXQgaXMgcmVwb3J0ZWQgYXMgLUVPUE5PVFNVUFAsIHdoaWNoCmJp
dGxhbmRfcHBfY2hlY2tfY2FwYWJpbGl0eSgpIGFscmVhZHkgdHJlYXRzIGFzICJza2lwIHRoZSBj
aGVjayIuCgpUZXN0ZWQgb24gVE0yMzA3IChCSU9TIFJNQU1UNEIwUDBCMEIgMDYvMTAvMjAyNSwg
Ymlvc19yZWxlYXNlIGFuZAplY19maXJtd2FyZV9yZWxlYXNlIDEuMTEpOiBhbGwgZm91ciBwcm9m
aWxlcyBhcHBseSBhbmQgcmVhZCBiYWNrCmNvcnJlY3RseSwgdmVyaWZpZWQgYWdhaW5zdCB0aGUg
RUMgcmVnaXN0ZXIsIGFuZCB0aGUgdGhyZWUKcG93ZXItcHJvZmlsZXMtZGFlbW9uIHByb2ZpbGVz
IHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBNaWxvxaEgVmxrdSA8dmxrdS5taWxvcy5mdW5AZ21haWwu
Y29tPgotLS0KRGVwZW5kcyBvbiAiW1BBVENIIHY5IDUvNl0gcGxhdGZvcm0veDg2OiBiaXRsYW5k
LW1pZnMtd21pOiBBZGQKcGVyLW1hY2hpbmUgb3BzIHRhYmxlIiBhbmQgb24gQ2hyaXMncyAiT25s
eSBjaGVjayB0aGUgZnVuY3Rpb24gaWQgb2YKR0VUIHJlc3BvbnNlcyIgLS0gd2l0aG91dCB0aGUg
bGF0dGVyIGV2ZXJ5IFNFVCBvbiB0aGlzIGZpcm13YXJlIHJldHVybnMKLUVOT01TRywgYmVjYXVz
ZSBXTUFBIGZpbGxzIGluIHRoZSBmdW5jdGlvbiBpZCBvbmx5IG9uIEdFVCByZXNwb25zZXMuCgog
ZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdtaS5jIHwgMjkgKysrKysrKysrKysr
KysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21p
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21pLmMKLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdtaS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtOTcsNiArOTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBiaXRsYW5kX3Byb2ZpbGVfbW9kZV9tYXAgYml0bGFuZF9tb2RlX21hcCA9IHsKIAkuZnVs
bF9zcGVlZCA9IFdNSV9QUF9GVUxMX1NQRUVELAogfTsKIAorLyoKKyAqIFhpYW9taSBSZWRtaSBC
b29rIFBybyAxNCAyMDI0IChUTTIzMDcpLiBXTUFBIHdyaXRlcyB0aGUgdmFsdWUgc3RyYWlnaHQK
KyAqIGludG8gdGhlIEVDIFFGQU4gcmVnaXN0ZXIsIHdoaWNoIGVudW1lcmF0ZXMgMS00OyAwIGlz
IG5vdCBhIG1vZGUgYW5kCisgKiBsZWF2ZXMgdGhlIEVDIHdpdGhvdXQgYSBmYW4gY3VydmUuCisg
Ki8KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX21vZGVfbWFwIHJlZG1pX3Rt
MjMwN19tb2RlX21hcCA9IHsKKwkuYmFsYW5jZWQgPSAxLAorCS5wZXJmb3JtYW5jZSA9IDMsCisJ
LnF1aWV0ID0gMiwKKwkuZnVsbF9zcGVlZCA9IDQsCit9OworCiBzdGF0aWMgaW50IGJpdGxhbmRf
cHBfY2hlY2tfY2FwYWJpbGl0eShzdHJ1Y3QgYml0bGFuZF9taWZzX3dtaV9kYXRhICpkYXRhKTsK
IAogLyoKQEAgLTExOCw4ICsxMzMsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiaXRsYW5kX21p
ZnNfb3BzIGJpdGxhbmRfb3BzID0gewogCS5oYXNfZnVsbF9zcGVlZCA9IHRydWUsCiB9OwogCitz
dGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19vcHMgcmVkbWlfdG0yMzA3X29wcyA9IHsK
KwkubmFtZSA9ICJSZWRtaSBCb29rIFBybyAxNCAyMDI0IiwKKwkubW9kZV9tYXAgPSAmcmVkbWlf
dG0yMzA3X21vZGVfbWFwLAorCS5jaGVja19wZXJmb3JtYW5jZV9jYXBhYmlsaXR5ID0gYml0bGFu
ZF9wcF9jaGVja19jYXBhYmlsaXR5LAorCS5oYXNfZnVsbF9zcGVlZCA9IHRydWUsCit9OworCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgYml0bGFuZF9taWZzX2RtaV90YWJsZVtd
ID0geworCXsKKwkJLyogWGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0IDIwMjQgKi8KKwkJLm1hdGNo
ZXMgPSB7CisJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJYSUFPTUkiKSwKKwkJCURNSV9N
QVRDSChETUlfQk9BUkRfTkFNRSwgIlRNMjMwNyIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZyZWRtaV90bTIzMDdfb3BzLAorCX0sCiAJe30KIH07CiAK
--000000000000e0cfcc065cd0ef84--
