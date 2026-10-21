Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613580;
	b=Z+0wujU5I9fZCbwnONoiLjh9zOu9EUHk31h2yqbTMsWfh/AsaPseb4Sa2VkuFTKm6Jd7
	 VJw4cxto0ZkxJ5wiLRHyEgU1Ty2F+Ug2Bf2LIDcDHPjWrk9G2r+banlENr9r3dLD8uokh
	 Z5SZKeUfzpLSjo0YXnqE3h4pqGqUIpDHTz8Y7ouM1NbI/OSkLd8bLtGoT7DRhDEyUw8KY
	 om7ytNNMHF1PeOrfEZ0y+2UNungC15UuDPv1e1rTo3oJjtAGqC5BitWzlwJsmAmluttgN
	 c8+r3bEEYwTFm3biNYmppGTKdetDpyvBpcv73cR/2SrqzuyArjej/Ggz9nPqH+Yqs8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:Cc:From:Subject;
	bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
	b=laCVAzLgQVhi9SJmrvxOPLLtUb/BN6QsXfHTCrmyTap3qaFCuYqnyGepYrTt09MZVv58
	 sMG0GE/bOZn9QYnzggUK7bd28CInlHOFA9y8uXXiH8nUsN1IXogBkV7eyMZHk092bP1Li
	 EVPSLFh0Uq7TmpFS55HwUY30Xtup7HZEcdDX7/iL8xETsDbP02a7v4ILRXcbDPhXq1ZoF
	 pY1JJyWACL0EEnz4hKkHC8bEsOu0xyiZJmPa4RXik6GphKH1rtVJ/DCNh4SwSoDBDP4PP
	 SRgHrHRBCvfmfak6BvTURaW7A+/1yykTAQaw2kf7XC8fs1PeBRE1C38rjwdlMolTGaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E4F88Dn3;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A3D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A3D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E4F88Dn3
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so728182b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792613578; x=1793218378; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
        b=E4F88Dn3JkgX6pHRE2BGYX/OAWLL/yNWF4iB6wUNaKFZWr/YTyeYbIr9ePu1EozkDE
         Zm4lkf7oxG/HAoslNjdJfXx1Ps5m3AHfJPrWsdMC7MjpnFyW4TiLVJwbxvXT63zc3Ir1
         7wv6lcSLcDbS7pIbhwLElf3Rc6jgnIQlmiN5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613578; x=1793218378;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
        b=xm4yJEu46iXTZ9dJnbA8lMVk6gB5P5ZxHszhbvtuXFvflIa7mP/hc8YJL17UQ2jy1B
         jftBuUjFm7kcy9a/8HokR9dOJVTZMkTqAxkpY8vL/dYQ/anBgNXii4ol65SIexIhAQO7
         EjC7vjquHe684MQJKegm2qizzIwD0t8KqG6AKWgCifxQa2K0hoGGxuCp1YXNOeUuH+Np
         lhd2dEOQ6bdFsA2IJctxFOyMPE1OWseB74fFbid6Y3g6HqMwT3vxJN1RsTUo9bacNk3J
         1bbVw9kXUAa6OPf/e3jKyq85uoCMHLfHYGNBlM2pui/jmjZ9lDSN8li18Yg0G8tspPC2
         vyug==
X-Forwarded-Encrypted: i=1; AKwUvBxU+b+v3QfxIsiM8MoKmhzfhvDcB+ZTszsk0WfRjTjjaieloRGZ34lFCgkMGwHghyFo+9JIE4IOTp+ARrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK90lnNFuKGgNaTkCU73Nas8ot6D/pLMY/2SXw/xLn4VmSIq+X/
	tkyCmOpoqdZ39yYHe39+VS6vI3rdxKSzEy9wcMUgAVs1hgr/cpJ7gJpzwcWBaIhpqBH5h9nlhpx
	SwpsDlSY=
X-Gm-Gg: AYBFou24IsATuzmq5Jw8NLrxBhqtd4K8P5oS3m5xIi8gMBKLZylsmFOGH51DS7aN4N8
	PD0YkvwZVnN3SE0Qufi72Avd4opfMWVv9YokLv6gCSPx8K8GbK9o9QKoAhBi3znsICMaQO4ArA1
	eacCd/9x/fPDjChkyOvklhjZhgCbaJqb/W/XL+UbgRvf8yyTPsG0aQgk0RWO46q0fXPiNQttGMP
	hbL+usqY/kRzDG4ne13TDUJz1DfNRdLZmkxIhmdrCaPpYVhWie/8hKs23f9JiL4iP/PVnFouMb5
	fBbicW4rnlEOt36uGvfaeHMimuiLaqztIsteVVYkZQOvwuZackU4zqgf01xYK3rEipvHb6nFVoS
	JXuk1z2y5x6R42QlEzlc1pAzLQy/wzCQsWL5DMk7RuyFeWdbaONKTkXxY7hutxT4zgLMOGQr1lU
	ms5hAxP0uUy234TpzCxWb83q8uDWNVeIY3oOqemrr94recKHWSSJK3Nq6qo7SsG7Zrl9kMx/S1t
	o8gg5lmjgaKpuD6ce5sLVnpN0pv99/ZaW5R5GRzPbO8nuKgTqXfKTJmOmuyxkkD0A==
X-Received: by 2002:a05:6808:d4c:b0:4d6:92b3:5c8b with SMTP id 5614622812f47-5535d4dbdb9mr2097381b6e.65.1792613577939;
        Wed, 21 Oct 2026 13:12:57 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b8ba5107sm2820106b6e.17.2026.10.21.13.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:12:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------qggjQZhU0idK0x3lQ4VJK41Y"
Message-ID: <aacd551a-f512-499a-960e-585bce02dd12@linuxfoundation.org>
Date: Wed, 21 Oct 2026 14:12:53 -0600
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit next update for Linux 7.4-rc1

This is a multi-part message in MIME format.
--------------qggjQZhU0idK0x3lQ4VJK41Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the kunit next update for Linux 7.4-rc1.

A single fix to kunit_run_all_tests() to return void since callers
don't check the return value and the integer return type is a remnant
from when the function was executed as initcall which is no longer the
case.

- kunit: Return void from kunit_run_all_tests()

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.4-rc1

for you to fetch changes up to e38f53f0482468efd04397f66bda4648b70ac9fa:

   kunit: Return void from kunit_run_all_tests() (2026-09-02 09:19:48 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-7.4-rc1

A single fix to kunit_run_all_tests() to return void since callers
don't check the return value and the integer return type is a remnant
from when the function was executed as initcall which is no longer the
case.

- kunit: Return void from kunit_run_all_tests()

----------------------------------------------------------------
Thomas Weißschuh (1):
       kunit: Return void from kunit_run_all_tests()

  include/kunit/test.h | 5 ++---
  lib/kunit/executor.c | 5 ++---
  2 files changed, 4 insertions(+), 6 deletions(-)
----------------------------------------------------------------
--------------qggjQZhU0idK0x3lQ4VJK41Y
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-7.4-rc1.diff"
Content-Disposition: attachment; filename="linux_kselftest-kunit-7.4-rc1.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0
LmgKaW5kZXggZGE1MzEyZTBkZmE1Li4zMWQ1NDk1NzhmOGUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUva3VuaXQvdGVzdC5oCisrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCkBAIC00MDAsMTEg
KzQwMCwxMCBAQCBzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IGt1bml0X21lcmdlX3N1aXRlX3Nl
dHMoc3RydWN0IGt1bml0X3N1aXRlX3NldCBpbml0X3N1aXRlXwogY29uc3Qgdm9pZCAqa3Vu
aXRfYXJyYXlfZ2VuX3BhcmFtcyhzdHJ1Y3Qga3VuaXQgKnRlc3QsIGNvbnN0IHZvaWQgKnBy
ZXYsIGNoYXIgKmRlc2MpOwogCiAjaWYgSVNfQlVJTFRJTihDT05GSUdfS1VOSVQpCi1pbnQg
a3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKTsKK3ZvaWQga3VuaXRfcnVuX2FsbF90ZXN0cyh2
b2lkKTsKICNlbHNlCi1zdGF0aWMgaW5saW5lIGludCBrdW5pdF9ydW5fYWxsX3Rlc3RzKHZv
aWQpCitzdGF0aWMgaW5saW5lIHZvaWQga3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKQogewot
CXJldHVybiAwOwogfQogI2VuZGlmIC8qIElTX0JVSUxUSU4oQ09ORklHX0tVTklUKSAqLwog
CmRpZmYgLS1naXQgYS9saWIva3VuaXQvZXhlY3V0b3IuYyBiL2xpYi9rdW5pdC9leGVjdXRv
ci5jCmluZGV4IGIwZjhhNDFkNjFkMy4uYzc5OGEwMjQ3MGQ4IDEwMDY0NAotLS0gYS9saWIv
a3VuaXQvZXhlY3V0b3IuYworKysgYi9saWIva3VuaXQvZXhlY3V0b3IuYwpAQCAtMzcxLDcg
KzM3MSw3IEBAIHN0YXRpYyB2b2lkIGt1bml0X2hhbmRsZV9zaHV0ZG93bih2b2lkKQogCiB9
CiAKLWludCBrdW5pdF9ydW5fYWxsX3Rlc3RzKHZvaWQpCit2b2lkIGt1bml0X3J1bl9hbGxf
dGVzdHModm9pZCkKIHsKIAlzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IHN1aXRlX3NldCA9IHtO
VUxMLCBOVUxMfTsKIAlzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IGZpbHRlcmVkX3N1aXRlX3Nl
dCA9IHtOVUxMLCBOVUxMfTsKQEAgLTM4Miw3ICszODIsNyBAQCBpbnQga3VuaXRfcnVuX2Fs
bF90ZXN0cyh2b2lkKQogCQlfX2t1bml0X3N1aXRlc19zdGFydCwgX19rdW5pdF9zdWl0ZXNf
ZW5kLAogCX07CiAJc2l6ZV90IGluaXRfbnVtX3N1aXRlcyA9IGluaXRfc3VpdGVfc2V0LmVu
ZCAtIGluaXRfc3VpdGVfc2V0LnN0YXJ0OwotCWludCBlcnIgPSAwOworCWludCBlcnI7CiAK
IAlpZiAoaW5pdF9udW1fc3VpdGVzID4gMCkgewogCQlzdWl0ZV9zZXQgPSBrdW5pdF9tZXJn
ZV9zdWl0ZV9zZXRzKGluaXRfc3VpdGVfc2V0LCBub3JtYWxfc3VpdGVfc2V0KTsKQEAgLTQz
Miw3ICs0MzIsNiBAQCBpbnQga3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKQogCiBvdXQ6CiAJ
a3VuaXRfaGFuZGxlX3NodXRkb3duKCk7Ci0JcmV0dXJuIGVycjsKIH0KIAogI2lmIElTX0JV
SUxUSU4oQ09ORklHX0tVTklUX1RFU1QpCg==

--------------qggjQZhU0idK0x3lQ4VJK41Y--
