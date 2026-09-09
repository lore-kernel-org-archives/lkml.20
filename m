Received: from mail-qk2-f6.google.com (mail-qk2-f6.google.com [74.125.230.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070753ED15
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967424; cv=pass; b=tThWF/cdaNaGQeuoXmC6otXs4bDnALUXkOfxVDo5iIlJ8Egoc5NaLyhmJxsUNxgfGlpC8EkNQb+yZtqNyeEzfx2y31gRu+Qw5QIepWXQIwx90XagjjuH22hM8i9u/CXji20Q5JAZYVkJkIM7fVbRJqTo6cz/Tk9c/QvKQ66+ncI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967424; c=relaxed/simple;
	bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCLBd9EAac+8J0p38DUiaaUEgGNnvn1U3bR5DtP+8YDxExZMPzk3orrTuaejUTNSkzmB9hrxpmyeMW7ms1oV86LJFoKfC5fALF8A2N57ROR4mGh1AJ2SYybbWTZZZxgvckIbRacKZw/frAG1hQTfaAW6XB9UEMW9SY2SpPDqHUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwBZXu+z; arc=pass smtp.client-ip=74.125.230.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwBZXu+z"
Received: by mail-qk2-f6.google.com with SMTP id d75a77b69052e-52ec554a864so33698681cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967422; cv=none;
        d=google.com; s=arc-20260327;
        b=hKBavkR7YSt8VMakGYu3NNcIhKrMGtWqwRLzgXe54K5i86/51GP6a09CXDxViEb4hw
         fV0pNUdIhTeOvd0xyWaZUef2Lpz+jn8o0olvp4T8zavMLZ8FsExBlr/CE/0LxX05Vo22
         6GjNdp63IsB3C+ZGitXo7ki1V9JnARH/mkeawWxpiXKMqxjaSK2fgCZG8YrNaFFKQoQT
         sJiyNv6i1POPHBwYUU3eOMCza42YXeE+WS3sTCcbSb+1RDKZB71GCE/OaVOZGZrozy9H
         +uee7JvhkL0XV9ADCa1inquqadq4CYJgK+D/yLzKo4Vk3cmLj7gmkL/sU3nW68NwAHz1
         NBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        fh=EqIl65+SUTKWTFo13+OSBE6PNLmweOiPHcaWerOFvBg=;
        b=I5PWlUjqAdxK+bDQvneVy3R533/x2ZeE+KxiGCsiMNB9LDdFp9Nad7qMZasi027Fj7
         Uq/9JxaR2qEvzPNWQ297tVf+IJ3kRAX80rrRpHqbrvaaivFIbnassHemVeUb1j/hFL8g
         vegwwjQLpvP1NvjaqvDdxpb0e9/rAHvaTv7k+RfgMRxB/o3TQlUnF9VjpGR/uuPgi31c
         NHDnTnY1cWHZ/rKAp9v3vi1ee4H6pITeBf04vP35f9zdMcNnZpzTjRiHGoWygwd6mPNU
         Oh51jExkDn41K6XxRN6FP+PsHF8Z/6UEYdvTCPAWgLaumR1MnkVsKOm7Hi3ltg2NTtTL
         WlSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967422; x=1789572222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        b=rwBZXu+zM5hHod+luLYt2+y3x9DO0Pt8xux2Gah9nNAyy3ETHjbUL1obDvpnAh5wkk
         oBxIzZug62dfqgsaDeIAfdU8H9E9Z/WF9JccEIPTya7jsWbn5vsB7Z67naz9z39dHr8x
         mNSGtZnUNdC9Nm0+0u77lBjLPy4QYdFS9ittiOcV9U38rzonjOmZLSGcNu8+gz+5YOnP
         2g+NQhjjkGk/LtAuDlYZrL8quHNAMwQ1KRkr3ZhTJwcnmQFqc/LVTdyV6u7EvkVSEWN3
         9BRQHdB04/jtfDg0cXhT04NiAbMnnDMXqOigcVYr3v7xzQxMMe+PZlzANBbMM28LCmrj
         I8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967422; x=1789572222;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        b=Vxbcxn440ZSA3O3oCuQegKMB1fPqHaILUn8fPnLlfEZXDnkFRLXJvd6tV7A9CH1Afb
         E6qBy8DbPMBXF5SjD/Je7VA+SN7kxqw7wfcAWTGsc8oXPh8hEfGlQs21Z/nC8dp2wySX
         SPzGdOW4u1tRZoVlL+ka+XCArD5IeGSpUOy1l9PEaQbTCbznOMnt2+Oone+Cba9EEZHq
         cO42c7IsVWD/OFMxC5ufVvdaRjsiLIakT0yR1b3BLudGFweTEo5OuZEDErrXS04cG3Mu
         UtANSg3qdB2cBc2ah+zJcKEMZzZqyhFV6+eQBvV6yZaSRw9aqR+B/SGe9aRYCWlTzpPQ
         kEGA==
X-Forwarded-Encrypted: i=1; AKwUvBxPdCA6Wkd/ZZzl0Qw41vw0uYxWs5Nncozy53dm/tzGCWuN3L4ynScYzLamLGTA8oLBTZjl2uS6wxETIeU=@vger.kernel.org
X-Gm-Message-State: AFuF++k9ab+79KfP896H9bOq3n2niVnp7UiELLjUzORqJr/EXPR9VPjg
	SAyKdM6thqnREK4UCHhyFnC4l45fGWPyv6lD29j5FycVj4MlCLDf/MaeauE4k0zyJpAYxTKaZOd
	/zFWI+FwZoEzeV4cKVSHnY1eE57N9JE4=
X-Gm-Gg: AYBFou3BTp0Gl7P3pbdN9xJRmXLBCAJSFk4kqT8ZLl5Ep2So7qTBBzg0RHBp1iDlY2b
	SheySdTb0Nb2WR+DeEJcO7A6hqBowjHD6C6clLstAGVymHH/dipExKE5r6Z8Aon7kBIOVd1NNTm
	RuEHPBPsoC93Yfa0ho0v9k1EIyjXnWxqf8ui04d1nOhoMpIxHLgoYZtqPCqamV0rIylbJvjk/HV
	o4uRjzKvKGCm9sgyYaFgODa6pT9eQRlLQbusZ8HUWO66x27pqTs6d6z8pwLpBD92NdZsN3lLFfV
	rqckcTmUDpQ/tRfEyzk2nXJOohSqkHgOvvPoLRVBjv2eyqzgh47lyw==
X-Received: by 2002:a05:6214:40a:b0:910:4a86:5975 with SMTP id
 6a1803df08f44-9104a865dafmr350346336d6.29.1788967421968; Wed, 09 Sep 2026
 08:23:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:23:41 -0700
X-Gm-Features: AcwNN1Xs_Ic-TFWEWYafDXq-QgNp-3x50hyH1ZaRfp2J0FhUBBGeyv5j7fMk6x0
Message-ID: <CACGbirT2U3gCWcYSTVTZrf2xey_D8H-s3oE8h2WW0YrDTV_Yqg@mail.gmail.com>
Subject: [PATCH RESEND v3 2/2] selftests/mm: Only prepare ptrace_scope when
 memfd_secret is selected
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000b3b768065b0e6fc9"

--000000000000b3b768065b0e6fc9
Content-Type: text/plain; charset="UTF-8"

The unchanged patch is attached as text/plain to preserve long lines
and whitespace during mail delivery.

--000000000000b3b768065b0e6fc9
Content-Type: text/plain; charset="us-ascii"; name="mm_patch2.patch"
Content-Disposition: attachment; filename="mm_patch2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 8474edae0c98aec2_0.1

RnJvbTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KRGF0ZTogVHVlLCAwOCBTZXAgMjAyNiAx
MToyMTo1MCArMDgwMAoKVGhlIG1lbWZkX3NlY3JldCBzZXR1cCBjbGVhcnMgcHRyYWNlX3Njb3Bl
IHdoZW5ldmVyIGl0cyB0ZXN0IGJpbmFyeSBpcwpleGVjdXRhYmxlLCBldmVuIHdoZW4gYSBkaWZm
ZXJlbnQgY2F0ZWdvcnkgd2FzIHNlbGVjdGVkLiBydW5fdGVzdCgpIGZpbHRlcnMKdGhlIHRlc3Qg
aW52b2NhdGlvbiwgYnV0IGl0IGRvZXMgbm90IHByb3RlY3QgdGhlIHByZWNlZGluZyBzZXR1cC4K
CkNoZWNrIHRoZSBjYXRlZ29yeSBzZWxlY3Rpb24gYmVmb3JlIGVudGVyaW5nIHRoZSBtZW1mZF9z
ZWNyZXQgYmxvY2sgc28KcnVubmluZyB1bnJlbGF0ZWQgY2F0ZWdvcmllcyBkb2VzIG5vdCBjaGFu
Z2UgcHRyYWNlX3Njb3BlLiBLZWVwIHRoZQpleGlzdGluZyBleGVjdXRhYmxlIGNoZWNrIGFuZCB0
aGUgYmVoYXZpb3Igd2hlbiBtZW1mZF9zZWNyZXQgaXMgc2VsZWN0ZWQuCgpBY2tlZC1ieTogRGF2
aWQgSGlsZGVuYnJhbmQgKEFybSkgPGRhdmlkQGtlcm5lbC5vcmc+CkFzc2lzdGVkLWJ5OiBMTE0K
U2lnbmVkLW9mZi1ieTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KLS0tCiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9tbS9ydW5fdm10ZXN0cy5zaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0v
cnVuX3ZtdGVzdHMuc2gKaW5kZXggOWU2MmFiNGM2Nzc1Li45YmJlZjk0MTBjY2MgMTAwNzU1Ci0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCkBAIC0zNzAsNyArMzcwLDcgQEAg
Q0FURUdPUlk9InByb2Nlc3NfbWFkdiIgcnVuX3Rlc3QgLi9wcm9jZXNzX21hZHYKIAogQ0FURUdP
Ulk9InZtYV9tZXJnZSIgcnVuX3Rlc3QgLi9tZXJnZQogCi1pZiBbIC14IC4vbWVtZmRfc2VjcmV0
IF0KK2lmIHRlc3Rfc2VsZWN0ZWQgIm1lbWZkX3NlY3JldCIgJiYgWyAteCAuL21lbWZkX3NlY3Jl
dCBdCiB0aGVuCiBpZiBbIC1mIC9wcm9jL3N5cy9rZXJuZWwveWFtYS9wdHJhY2Vfc2NvcGUgXTsg
dGhlbgogCShlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL3lhbWEvcHRyYWNlX3Njb3BlIDI+JjEp
IHwgdGFwX3ByZWZpeAo=
--000000000000b3b768065b0e6fc9--
