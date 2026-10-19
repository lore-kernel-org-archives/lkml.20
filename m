Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F944C4EB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382563; cv=none; b=cOHNrJgRV3WnyZmosT/hFpHNj44HgmnhxL+eHpNodZfCgoY7Gz8Q4fJJ7nEv7nfm8jtaPRZsOh8sv6+ypOrAZbypeCjRybOX3b52qASUCCnodzElEC4hMkvEzOYG3oHFne6A2qOBPv9xs+7738fS5XrjCHfJjtRZE/puhz5a8pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382563; c=relaxed/simple;
	bh=8HyH4hiRLSBHyUOKopJLJXhtJ2oPINPtD5k3v0yAruo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BBtj1HwrILxjCI+eMnJkY9vkuoao9xjoQnZ7jcDSa/xUO2Q1BaiCnV+hfKK289cnzx7ykyTTyaAIYLvSS9l9Be/Laf/f65oS3TuCkQcALUYVNdfEku3wlzAH3VBcoXPONnU7AnkJGhdZ1b4QirVD8IlOBMlZ1SnionCTudSR6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=aRTXI3H8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aRTXI3H8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so12270975e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792382560; x=1792987360; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HyH4hiRLSBHyUOKopJLJXhtJ2oPINPtD5k3v0yAruo=;
        b=aRTXI3H8Qy+uIUIiAbkRjNb8FQ+UtPU/sZW14SGZ585GFS9b81IwLncyUsJPQIVoT5
         KIV+hQLu5uHY7Q2ghgXR9+bbZ01W7VaWKSJ1DzWfS82e/27OLI9gFbndXe1NUXETJToF
         vZcWaAnhtxJC0kFjMMsR8PWRkDCbRCg9Bxu0Nmg667pGvLCM3fd+fl/JKAi+wqejg8dZ
         CDxCc60n0B7C1KMFv99yU0OEa1J52CvagE2PfNbIbVx7avnFU3jbTposcZGu1gaW3MbQ
         rLKWEyWRVxejvEEnZc63CxJcLvdSkK7W0Zo00Tlhep/0a/oPHImO55WB9Q/SOZEITNhe
         bEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382560; x=1792987360;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HyH4hiRLSBHyUOKopJLJXhtJ2oPINPtD5k3v0yAruo=;
        b=OuPUTotcClZiajB5f3FW9N/d/aD/eSwfqR3vSjW/hSdTilwhPTM36WYkZt/Vc0h6Hy
         iTx37JYpJ2OqFdgHRojkxQY4AKexFvld+Pm9PiXQ91lzqE+duhCMqp3TzrUglQsS8+PY
         ZOoJmcW/ty4UU1kDlyiUDOia7sK0tfkkvLgByul0g8l8saPOKm1q4MLB+71q2Bb62t/U
         hbIokVAs83HMWGg1U12bCtu81T682XpkGlDPDi8dNTXTLHYtrdQ22Cb7ERWZoxXKbaUd
         pWY4AMaqvKvUS/mutyloc9drTiHpHzpVtKIsDc0r1vw91eVpLzOZ1eVdQ8l/wd/CN8iN
         sBnw==
X-Forwarded-Encrypted: i=1; AKwUvBwDf21cafn8HeXKRzCYDntDGXFLPW3Sa9VRyb0TPx4cQ+E8Rt6tqFk17ZD6Y2Pmj3uHE77LkDkE2Wati9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZcehcA6s8BQwfdlPj6ugX1HrRjSFvvFrjzc+tfw2drwdn/2UY
	/qYMwDOMaMEbm7iAYB+wsgvGyPG7JRnXXTP7kWtbODttLuXj8JHlYq4=
X-Gm-Gg: AYBFou1KYfpbTvAZQfXBP5zV4LXKIjbpuXyGDnqurnElNmgnJx1YwcnunAI0tWfLKWN
	5NEMMIZqTP1+zADMe8+ltFdwueATIVlem5mMTaV3s4iKAFQzKyv9pj1OrlKPkoL4dp4rLyvFlAI
	JqKkCr1SQm4/W5rhKiPapUzVvGqmmCjZfxPlYBK4Av4Ucyzf/r9fM1RbJPNEEUuGwLbx532pXm3
	E2r0ngEKNDQYIU3vzoEZI+eAhQz1wKNIySdlJdST9I0zBMsy5OhCa3WGGuA3+oSFEjaz1aLnsu+
	rf630on17l3lIMF3mRhXwfHApcMbU8/r7e3B+3ICMcopLTFFCw1VBCEk7dZKSRNQzX51byKcJWV
	3A14fhEw4fcKO9UhBqt2hx4poJAJFWcQoGu3Jw7FxCU9KkintKA9THuN1/CteuoRCWW+5J333pa
	EzRYhdCd6Qy4UKE54Re7/OtdfCU+9JPGYQFWBO06sRi1sLIkCS2Lr+9Q7wP0035QsAq/X6Ufcsr
	JUwpdNhz630Ba6Iaue9gQk4D0Rouzr/81PPh44LpTZ8vs6N4PMlw6/lvIxY
X-Received: by 2002:a05:600c:4f06:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a1e69d931cmr51528215e9.22.1792382559519;
        Sun, 18 Oct 2026 21:02:39 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac02b.dip0.t-ipconnect.de. [91.42.192.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm17201395f8f.1.2026.10.18.21.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:02:38 -0700 (PDT)
Message-ID: <7201018c-20e8-4187-832a-aeb0e5db98ca@googlemail.com>
Date: Mon, 19 Oct 2026 06:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 0000/1674] 6.6.160-rc1 review
From: Peter Schneider <pschneider1968@googlemail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Dan Williams <dan.j.williams@intel.com>
References: <20261017160431.119607952@linuxfoundation.org>
 <827e9f8d-5654-4964-a999-5ce94bd98fd4@googlemail.com>
Content-Language: de-DE
Autocrypt: addr=pschneider1968@googlemail.com; keydata=
 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
 IX+NNrIwDpXrzCypeM2L5WtGyw==
In-Reply-To: <827e9f8d-5654-4964-a999-5ce94bd98fd4@googlemail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k6wfmZROyevBZLjrHxzAMsaf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k6wfmZROyevBZLjrHxzAMsaf
Content-Type: multipart/mixed; boundary="------------J0aiIChO0y7apIuBA0drCabD";
 protected-headers="v1"; hp="clear"
Message-ID: <7201018c-20e8-4187-832a-aeb0e5db98ca@googlemail.com>
Date: Mon, 19 Oct 2026 06:02:37 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 0000/1674] 6.6.160-rc1 review
From: Peter Schneider <pschneider1968@googlemail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Dan Williams <dan.j.williams@intel.com>
References: <20261017160431.119607952@linuxfoundation.org>
 <827e9f8d-5654-4964-a999-5ce94bd98fd4@googlemail.com>
Content-Language: de-DE
Autocrypt: addr=pschneider1968@googlemail.com; keydata=
 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
 IX+NNrIwDpXrzCypeM2L5WtGyw==
In-Reply-To: <827e9f8d-5654-4964-a999-5ce94bd98fd4@googlemail.com>

--------------J0aiIChO0y7apIuBA0drCabD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR3JlZyBhbmQgU2FzaGEsDQoNCkFtIDE4LjEwLjIwMjYgdW0gMDc6NTQgc2NocmllYiBQ
ZXRlciBTY2huZWlkZXI6DQo+IEFtIDE3LjEwLjIwMjYgdW0gMTc6Mzcgc2NocmllYiBHcmVn
IEtyb2FoLUhhcnRtYW46DQo+PiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJl
dmlldyBjeWNsZSBmb3IgdGhlIDYuNi4xNjAgcmVsZWFzZS4NCj4+IFRoZXJlIGFyZSAxNjc0
IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3RlZCBhcyBhIHJlc3Bv
bnNlDQo+PiB0byB0aGlzIG9uZS7CoCBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0
aGVzZSBiZWluZyBhcHBsaWVkLCBwbGVhc2UNCj4+IGxldCBtZSBrbm93Lg0KPiANCj4gVGhp
cyByYy1LZXJuZWwgY3Jhc2hlcyB3aXRoIGEga2VybmVsIHBhbmljIG9uIG15IDItc29ja2V0
IEl2eSBCcmlkZ2UgWGVvbiBFNS0yNjk3djIgc2VydmVyLCB3aGVuIEkgYm9vdCBpbnRvIGl0
LiBXaWxsIA0KPiBiaXNlY3QgdGhlIGlzc3VlLCBidXQgdW5mb3J0dW5hdGVseSBJIGhhdmUg
bm8gdGltZSBmb3IgdGhpcyB0b2RheSwgYmVjYXVzZSBJIHdpbGwgYmUgb2ZmIGZvciBwbGF5
aW5nIGEgY2hlc3MgdGVhbSBtYXRjaCANCj4gaW4gYW4gaG91ciwgYW5kIHRoYXQncyBhYm91
dCBhbGwgSSdsbCBkbyB0b2RheS4gV2lsbCBob3BlZnVsbHkgZG8gdGhlIGJpc2VjdCBvbiBN
b25kYXkuDQo+IA0KDQpTbyB0aGUga2VybmVsIGNyYXNoIEkgZW5jb3VudGVyZWQgb24gbXkg
Mi1zb2NrZXQgSXZ5IEJyaWRnZSBYZW9uIEU1LTI2OTd2MiBzZXJ2ZXIgd2FzIHRoaXMgb25l
IChzb3JyeSBmb3IgdGhlIGxvdyANCnF1YWxpdHkgc2NyZWVuc2hvdCksIHdpdGhpbiBmdW5j
dGlvbiBSSVA6IDAwMTA6ZXhyYV9pc192aXNpYmxlKzB4MTQvMHgyMA0KDQpodHRwczovL3d3
dy5wZXRlcnMtbmV0enBsYXR6LmRlL2Rvd25sb2FkL0tlcm5lbF9QYW5pY182LjYuMTYwLXJj
MS5qcGcNCg0KSSBiaXNlY3RlZCB0aGUgaXNzdWUsIGFuZCB0aGlzIHdhcyB0aGUgZmlyc3Qg
YmFkIGNvbW1pdDoNCg0KIyBmaXJzdCBiYWQgY29tbWl0OiBbN2MxZTEzMmIwOTY3MjEwNTI2
ZGUwNWU3YWY2ZjFjMjZhZDBjMTUxNl0gc3lzZnM6IEludHJvZHVjZSBhIG1lY2hhbmlzbSB0
byBoaWRlIHN0YXRpYyBhdHRyaWJ1dGVfZ3JvdXBzDQoNCndoaWNoIGlzIHVwc3RyZWFtIGNv
bW1pdCBbZDg3YzI5NWY1OTljYWIyYWIzYjNkZjUzYTkwOThhZGJhNGE2MDAyYl0uDQoNCkkg
dGhpbmsgdGhlIHByb2JsZW0gaXMsIHRoYXQgaWYgeW91IHRha2UgdGhpcyBwYXRjaCBmb3Ig
c3RhYmxlLCB5b3UgbmVlZCB0byBhbHNvIHRha2UgdGhlIHBhdGNoIHdoaWNoIGlzIHVwc3Ry
ZWFtIFsgDQpjZDY5ZmVkZjU4ZjhhYjFhYjUxMWY3YzZhYzE5NjljZWJmMWM5MzVmXSBzeXNm
czogRml4IGNyYXNoIG9uIGVtcHR5IGdyb3VwIGF0dHJpYnV0ZXMgYXJyYXkuIEl0IGFkZHJl
c3NlcyB0aGUgZXhhY3QgY3Jhc2ggDQp0aGF0IEkndmUgcnVuIGludG8uDQoNClBsZWFzZSBz
ZWUNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNzA4NjM0NDU0NDIuMTQ3OTg0MC4x
ODE4ODAxNzg3MjM5ODMxNjUwLnN0Z2l0QGR3aWxsaWEyLXhmaC5qZi5pbnRlbC5jb20vDQoN
Cg0KSSBhcHBsaWVkIHRoYXQgcGF0Y2ggb24gdG9wIG9mIDYuNi4xNjAtcmMxLCBhbmQgdGhp
cyBmaXhlZCB0aGUgaXNzdWUgZm9yIG1lOiBUaGUgcmVzdWx0aW5nIGtlcm5lbCBib290ZWQg
ZmluZSwgYW5kIHNlZW1zIA0KdG8gd29yayB3aXRob3V0IHByb2JsZW0uDQoNCk9yIG1heWJl
IHlvdSBzaG91bGQgZXZlbiBjb25zaWRlciB0byB0YWtlIHRoZSB3aG9sZSBzZXJpZXMgKDMg
cGF0Y2hlcyksIHdoaWNoIGFyZToNCg0KRGFuIFdpbGxpYW1zICgzKToNCiAgICAgICBzeXNm
czogRml4IGNyYXNoIG9uIGVtcHR5IGdyb3VwIGF0dHJpYnV0ZXMgYXJyYXkNCiAgICAgICBz
eXNmczogRG9jdW1lbnQgbmV3ICJncm91cCB2aXNpYmxlIiBoZWxwZXJzDQogICAgICAgc3lz
ZnM6IEludHJvZHVjZSBERUZJTkVfU0lNUExFX1NZU0ZTX0dST1VQX1ZJU0lCTEUoKQ0KDQoN
CiAgZnMvc3lzZnMvZ3JvdXAuYyAgICAgIHwgICAgNCArLQ0KICBpbmNsdWRlL2xpbnV4L3N5
c2ZzLmggfCAgIDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KDQpiYXNlLWNvbW1pdDogNzAzMTdmZDI0YjQxOTA5MWFhMGE2ZGMzZWEzZWM3
YmI1MGMzN2MzMg0KDQoNClBsZWFzZSBzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzE3MDg2MzQ0NDg1MS4xNDc5ODQwLjEwMjQ5NDEwODQyNDI4MTQwNTI2LnN0Z2l0QGR3aWxs
aWEyLXhmaC5qZi5pbnRlbC5jb20vDQoNCg0KQmVzdGXCoEdyw7zDn2UsDQpQZXRlcsKgU2No
bmVpZGVyDQoNCi0tIA0KQ2xpbWLCoHRoZcKgbW91bnRhaW7CoG5vdMKgdG/CoHBsYW50wqB5
b3VywqBmbGFnLMKgYnV0wqB0b8KgZW1icmFjZcKgdGhlwqBjaGFsbGVuZ2UsDQplbmpvecKg
dGhlwqBhaXLCoGFuZMKgYmVob2xkwqB0aGXCoHZpZXcuwqBDbGltYsKgaXTCoHNvwqB5b3XC
oGNhbsKgc2VlwqB0aGXCoHdvcmxkLA0Kbm90wqBzb8KgdGhlwqB3b3JsZMKgY2FuwqBzZWXC
oHlvdS7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLS3CoERhdmlk
wqBNY0N1bGxvdWdowqBKci4NCg0KT3BlblBHUDrCoMKgMHhBMzgyOEJENzk2Q0NFMTFBOENB
REU4ODY2RTNBOTJDOTJDM0ZGMjQ0DQpEb3dubG9hZDrCoGh0dHBzOi8vd3d3LnBldGVycy1u
ZXR6cGxhdHouZGUvZG93bmxvYWQvcHNjaG5laWRlcjE5NjhfcHViLmFzYw0KaHR0cHM6Ly9r
ZXlzLm1haWx2ZWxvcGUuY29tL3Brcy9sb29rdXA/b3A9Z2V0JnNlYXJjaD1wc2NobmVpZGVy
MTk2OEBnb29nbGVtYWlsLmNvbQ0KaHR0cHM6Ly9rZXlzLm1haWx2ZWxvcGUuY29tL3Brcy9s
b29rdXA/b3A9Z2V0JnNlYXJjaD1wc2NobmVpZGVyMTk2OEBnbWFpbC5jb20NCg0K

--------------J0aiIChO0y7apIuBA0drCabD--

--------------k6wfmZROyevBZLjrHxzAMsaf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJlc7Dq7rXmY041HeEaDYA0mmnLQFAmrVll4FAwAAAAAACgkQEaDYA0mmnLTV
bw/+NqPQPk5DtCi0D2VXzHTexz1cymGe7IL6Ip0EuP4Zma17ylUXp55rQ41hWkDuzMj48O2g/76a
tX+K2aWdyV7YXBQNUNiXfPn+4cLGpUS7aPP2YMnovRBluQ1+EZWgQF/L4IUQrV75YsKjk4rBmMVZ
m2UXx7d9i4klW1s0CAxXhtyck+as3O7Hwh43jNLVekNIv6SEPtf4mPOiz0i4dhzGTidcS3//ifeB
ag0/ysHqak667dVOuBdFyQt3iVU7mkm8q5zDe0EvdmIjfLD1Ty7ZkwD/Kkm9YDfFmnssrpV8s+3G
afhc3y2y8j/U1hAKxKg9VZOn3fcjkfrzwCjkXrZBYid5Q7w9P1gEgMO2KgcHfdo4WcqthWdVbtFw
PdNDTOvkTKTocJudTxzjdcgJCzoeN4T7EnRyuwhJtzzuaHQxtxWewolVQS6aIPrKJYpj+Yk3arTd
+bfwh/0CMbAkHkFuT6ZYGU21dRliXI3JW5etXTwPccaW2hpU468S1TeOfldFsJ9+JjRpj9N+VA4x
pqOENmUlMbutdK1TuXHcuqjp8e0O00QdB81obAqW6jmMzNyMnmcZRyHRK4Hvi/9J/ifJbXdZHDBG
5h4krojmZDpkzSiUm4OLLI5U98LWczP2aaUiOl5S5aqWIFS9PTlKcJ8roy7kcHEep1gLYKwmpGJI
Emo=
=1Kgx
-----END PGP SIGNATURE-----

--------------k6wfmZROyevBZLjrHxzAMsaf--
