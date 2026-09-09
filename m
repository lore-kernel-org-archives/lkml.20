Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BE5650ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967428; cv=pass; b=mctyBv4X9336qVrtsbIrlXq5eRkR+frTEg+OodbEJNAk0JaFzalwc2ReDlY5u9NQGsK9sxBdSwdDOC4kh5yQ5wqTGsYSdBf9UwibrYwKDyMoXPFpAAEPgI/ed2b7Ke9fivbQ9U53J8zPhek6VUEjbAT5rnWekeR9xCJJ6nKBvVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967428; c=relaxed/simple;
	bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ws/AtNDEsna/22Ifr2kDztxOHzSxHDpAQLT2ukRhPlIkweM6+oghbC59uK9qyqBCkdTCWrQFE2F4NWgDYWj1ce1391x1VD3EPz+rjrL/pFwnlyFtPQjG7i/UmDg74M5yrSDbX8kxN/mPWDMIbqL7S2NqUmxTvqZD5VYPpJRHZ0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+Pgq2ad; arc=pass smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+Pgq2ad"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-66c70bc1c26so2007275d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967426; cv=none;
        d=google.com; s=arc-20260327;
        b=afNpnekUXMA7+AkED86YQZKaC/RuWpUK+Mr+SbnXbMLCNahj/bkEJHb7qyOUXQvn3I
         UVjWTRtJcNOUZOvIm8l/EC/g1m5fYDvA4dQXzULSsEkm/TMj9nFccrxuNuolshCPjhvX
         X/mOZZ65qjbmtqZ/UvBVxojI36bT5p5UA01l9cEIz2f+OQ3hZzz0J8TRMSqzfApbX+T/
         Ft3ZDLF50Ky5dh9A+nhbl0ytt4kVNstE5rhGV3baQRifcVFcbwGQOmbNsJKs3mDer4Lm
         iKrQnsMvlBevd0j+nYQ3Njva8N9oZLLX5iQGdwRobW03rSIvnYPl9gdn0gV1YdtoS/lY
         mU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        fh=9ZRpSVl7ZgrZgx9D3bUX19ZQwRUqbNbL7XkPmUTwYkI=;
        b=AOxiPL/fJNnBGjFXVFNYcXwbt6cJgdbDYY7CcP9XRRNE+z5j0bgWqalKENzLAozagD
         RMLV8u3T2Sm1hSeUtssYS+DaV2U5Enjc1w/GzGSLNAyewh+QEdZ5tTg88DHHcIBiRe1x
         vAean56nHiv7SR0B7YGp9YmYqYWD2v/8vHJ6h/Wv/qCPKK1lR9BL35UAGAmhLxy9VFAe
         FXq3nwzFTA+pOw+2NscchTRMptde+HPWz6ezT/NRea6SfuXq+VDiqfmcP5VqJm3xczzf
         0374xAE97CsrV2rwQkOVEdQoKmHNKrAxLzuesZz+i8OoNVK0lcl0+mqfKTczELzirFzo
         Qn5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967426; x=1789572226; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        b=T+Pgq2ad0xV5zOZG7mWZc+tXJvWwQbZn5vzujXdx/1YNI7mgQNKkFvM7V/v/MphiMg
         SH1nPZddeuuGyxHVli0epCPDE++PdQiRc83sXdi8wbdZTN/YlVE2l3mGYj0aRH6fKLxl
         uctAr49erN2gNsoNKnkPWikovrgC/IpGCcFSteIjIxMRBSgMfqFk1cddV4+nrGW7+zZ9
         s6NWI9JlgQiXdgubXzhl23lxkojsPpJ78pWCCb80m0hMujkQo7WzlfUofJq1b8IFKKs4
         U/wKIyQyjHVhNHJPq8m0nuY5pfvXSInSvzxCB3+pBvzvgqRbtLf0kNfYEV2NFCgZ0noE
         gWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967426; x=1789572226;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        b=beocELpyWIpURH95UHH1I6KZotNQ65rC7F6Qy4Ve23gMF9Eue/0nuE9rOkvDV+lnLe
         r83cETxIogOMlCFHC/VIb19C21CcPp0MLmj7hEtR0MKj8uiWZF0oG1lED3TCyS+DOhnz
         N+b/JtWGDCiKybEm2jOuJvLM826rB/jLQaZ+hKJ4bv36v5Eu5g8hfuRBcQ4bzF9O4iIT
         eO3+BQvglv+nMMgdIvHdwxwRbUvbzPVTgTmiHa5SJYFvwzunBn4OjL2Fdx13j+QBlA/k
         Vg55TkTmgIhOxbALg7crFflrkymocIAVix63MaaIRIdjhDOINzmhCbGLnSbBLBKKTkna
         96Yw==
X-Forwarded-Encrypted: i=1; AKwUvBwY9KdZTi7osGqewt/2gTB/Z1joVOVMOmwIiR1YC+aKz0kKpthRtRskz75pntMSicS+9uPERZ9JS9Naojs=@vger.kernel.org
X-Gm-Message-State: AFuF++lJFtWZNGNUmTAJ8u5Ikd7T3ycFqrHtptezt0eH2eJLuAefpGK8
	KoqhJ5302ODK71ZAji8tbhmhGyixYXb29T5S0jmWaWYrWmulSm1NI/wa1zRYs7KtrLDyA86ahjR
	GX1Io/r+53WxAK5kyKrAwOGkwkdnSxb0=
X-Gm-Gg: AYBFou1QLaR3YwBZx4ANjka0z1Zu8kC8agpX5OUPI/hBjJKA4/KXh0U+AVOYebBPOI7
	iqSv5c9tAzzgcM8x/fSvOzp/wp1/+og6ukZI7+KydZBLOPnljO8KvKWO03PJW+GXYeVEBsuiRwY
	Pad8ad8Y3yC7nkpM+ilLipmeEX/9n7sqrx07yT/2ctdGBL+swXY1i2tTnt7AQailrcc6YOq1mlI
	9cCPFBbg1WAeEqczEvX48NPBekbYc0c34uEEk3/a7HNYtnXgg305uHccmoKrbavzHzWK4ib0YAZ
	svSa+R5hlb/yLAsFYa93DEc8f3MoOdeT0SbShMkfNuOg7/nStMBASw==
X-Received: by 2002:a05:690e:4809:b0:66f:c1be:a641 with SMTP id
 956f58d0204a3-66fc1beb247mr6374583d50.51.1788967421093; Wed, 09 Sep 2026
 08:23:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:39 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:23:39 -0700
X-Gm-Features: AcwNN1XqW6dUN8Vb7KE_XG5Wlgt0dfTuo8v3RlFz25qPqa16OtVUGQTRkFzBqcc
Message-ID: <CACGbirSjNMD1mijDWRp4gLcw-6dJsErrF_jgjwr3nO-geBb1Sw@mail.gmail.com>
Subject: [PATCH RESEND v3 1/2] selftests/mm: Reject invalid test selections
 before running tests
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a66c78065b0e6fc8"

--000000000000a66c78065b0e6fc8
Content-Type: text/plain; charset="UTF-8"

The unchanged patch is attached as text/plain to preserve long lines
and whitespace during mail delivery.

--000000000000a66c78065b0e6fc8
Content-Type: text/plain; charset="us-ascii"; name="mm_patch1.patch"
Content-Disposition: attachment; filename="mm_patch1.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 62a76dec474c2618_0.1

RnJvbTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KRGF0ZTogVHVlLCAwOCBTZXAgMjAyNiAx
MToyMToyMSArMDgwMAoKZ2V0b3B0cyByZXBvcnRzIHVua25vd24gb3B0aW9ucyBhbmQgbWlzc2lu
ZyBhcmd1bWVudHMsIGJ1dCBydW5fdm10ZXN0cy5zaAppZ25vcmVzIGl0cyBlcnJvciByZXN1bHQg
YW5kIGNvbnRpbnVlcyB3aXRoIHRlc3Qgc2V0dXAuIEFuIGVtcHR5IC10CmFyZ3VtZW50IGFsc28g
ZmFsbHMgYmFjayB0byB0aGUgZGVmYXVsdCBzZWxlY3Rpb24sIHdoaWxlIHVua25vd24gY2F0ZWdv
cnkKbmFtZXMgY2FuIHNpbGVudGx5IHNlbGVjdCBubyB0ZXN0cyBhbmQgc3RpbGwgcmVhY2ggc2V0
dXAgY29kZS4KCkV4aXQgb24gZ2V0b3B0cyBlcnJvcnMgYW5kIHZhbGlkYXRlIGNhdGVnb3J5IG5h
bWVzIGFnYWluc3QgdGhlIGV4aXN0aW5nCmxpc3QgaW4gdXNhZ2UoKSBiZWZvcmUgYW55IHRlc3Qg
c2V0dXAuIFJlamVjdCBlbXB0eSBhbmQgd2hpdGVzcGFjZS1vbmx5CnNlbGVjdGlvbnMsIGFuZCBu
b3JtYWxpemUgY2F0ZWdvcnkgc2VwYXJhdG9ycyBzbyB2YWxpZGF0aW9uIGFuZCBleGVjdXRpb24K
YWdyZWUuIEluaXRpYWxpemUgdGhlIGRlZmF1bHQgc2VsZWN0aW9uIGJlZm9yZSBwYXJzaW5nIG9w
dGlvbnMgc28gb25seSAtdApjaGFuZ2VzIHRoZSBzZWxlY3Rpb24uCgpGaXhlczogODU0NjMzMjFl
NzI2ICgic2VsZnRlc3RzL3ZtOiBlbmFibGUgcnVubmluZyBzZWxlY3QgZ3JvdXBzIG9mIHRlc3Rz
IikKQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQtb2ZmLWJ5OiBUaWFueWkgQ2hlbiA8aGlAdHljaGVu
LmNjPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoIHwgMjYg
KysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21t
L3J1bl92bXRlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0vcnVuX3ZtdGVzdHMu
c2gKaW5kZXggZDA5ZjlmNmEzODRlLi45ZTYyYWI0YzY3NzUgMTAwNzU1Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCkBAIC05NiwyNiArOTYsNDQgQEAgc2VwYXJhdGVkIGJ5
IHNwYWNlczoKIAogZXhhbXBsZTogLi9ydW5fdm10ZXN0cy5zaCAtdCAiaG1tIG1tYXAga3NtIgog
RU9GCi0JZXhpdCAwCiB9CiAKIFJVTl9BTEw9ZmFsc2UKIFJVTl9ERVNUUlVDVElWRT1mYWxzZQog
VEFQX1BSRUZJWD0iIyAiCiAKK1ZNX1NFTEZURVNUX0lURU1TPSJkZWZhdWx0IgorCiB3aGlsZSBn
ZXRvcHRzICJhaHQ6bmQiIE9QVDsgZG8KIAljYXNlICR7T1BUfSBpbgogCQkiYSIpIFJVTl9BTEw9
dHJ1ZSA7OwotCQkiaCIpIHVzYWdlIDs7CisJCSJoIikgdXNhZ2U7IGV4aXQgMCA7OwogCQkidCIp
IFZNX1NFTEZURVNUX0lURU1TPSR7T1BUQVJHfSA7OwogCQkibiIpIFRBUF9QUkVGSVg9IDs7CiAJ
CSJkIikgUlVOX0RFU1RSVUNUSVZFPXRydWUgOzsKKwkJIj8iKSBleGl0IDEgOzsKIAllc2FjCiBk
b25lCiBzaGlmdCAkKChPUFRJTkQgLTEpKQogCi0jIGRlZmF1bHQgYmVoYXZpb3I6IHJ1biBhbGwg
dGVzdHMKLVZNX1NFTEZURVNUX0lURU1TPSR7Vk1fU0VMRlRFU1RfSVRFTVM6LWRlZmF1bHR9Cisj
IE5vcm1hbGl6ZSB3aGl0ZXNwYWNlIHNvIHZhbGlkYXRpb24gYW5kIHRlc3Rfc2VsZWN0ZWQoKSB1
c2UgdGhlIHNhbWUgbmFtZXMuCityZWFkIC1yIC1hIHNlbGVjdGVkX2NhdGVnb3JpZXMgPDw8ICIk
e1ZNX1NFTEZURVNUX0lURU1TLy8kJ1xuJy8gfSIKK1ZNX1NFTEZURVNUX0lURU1TPSIke3NlbGVj
dGVkX2NhdGVnb3JpZXNbKl19IgoraWYgWyAteiAiJFZNX1NFTEZURVNUX0lURU1TIiBdOyB0aGVu
CisJZWNobyAiTm8gdGVzdCBjYXRlZ29yaWVzIHNwZWNpZmllZCIgPiYyCisJZXhpdCAxCitmaQor
CitpZiBbICIkVk1fU0VMRlRFU1RfSVRFTVMiICE9ICJkZWZhdWx0IiBdOyB0aGVuCisJIyBLZWVw
IHRoZSBkb2N1bWVudGVkIGNhdGVnb3J5IGxpc3QgYXMgdGhlIHNvdXJjZSBvZiB2YWxpZCBuYW1l
cy4KKwl2YWxpZF9jYXRlZ29yaWVzPSQodXNhZ2UgfCBzZWQgLW4gJ3MvXi0gLy9wJykKKwlmb3Ig
Y2F0ZWdvcnkgaW4gIiR7c2VsZWN0ZWRfY2F0ZWdvcmllc1tAXX0iOyBkbworCQlpZiAhIGdyZXAg
LUZ4cSAtLSAiJGNhdGVnb3J5IiA8PDwgIiR2YWxpZF9jYXRlZ29yaWVzIjsgdGhlbgorCQkJZWNo
byAiVW5rbm93biB0ZXN0IGNhdGVnb3J5OiAkY2F0ZWdvcnkiID4mMgorCQkJZXhpdCAxCisJCWZp
CisJZG9uZQorZmkKIAogdGVzdF9zZWxlY3RlZCgpIHsKIAlpZiBbICIkVk1fU0VMRlRFU1RfSVRF
TVMiID09ICJkZWZhdWx0IiBdOyB0aGVuCg==
--000000000000a66c78065b0e6fc8--
