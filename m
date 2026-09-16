Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC154DE711
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593165; cv=pass; b=nJFYEGZVGodrbhwOcBgABZp5kwz4zI2fm9BwbMA5trGhWQ8hoF9jiHhh8oF/o03qNfyOS4xSTCP9AXd34ls9+i8zgPVlGoVeYzFl65pFUDAKINAW09X811RbSziM61yTJ30/n0qqDHT98rqxIGulWNObOF8V6cKMBNZz5DbRQSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593165; c=relaxed/simple;
	bh=nmn80pnTBOoxWCEtXBV3jxoVat5/maw/prS6XxHrE2E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bpWiQwK2E59fjJYClZV188QI4tbdcFSe7HrL4pTijih2XMJYiRGRyEte6Xfpp2ztk1GOiEZU5kQTQ6jgxxcGNoxwjfIULlE8zmm8WWtamybq6NGJul3t70VhwWyEMhIMtbbRPwbB4KWXj6BjhTkFupiQevEWc5bNhrGFoN9iIwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2KG3Lyg; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2KG3Lyg"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so1496095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593145; cv=none;
        d=google.com; s=arc-20260327;
        b=q2GiBV8tro7DQY7ATuTA8fi/vLtaNoP1A+is+FvKV65lCi5g3bv/4JFnHRK9DEn8tc
         qCTs/f59+5792fr8xZPYPHggJKUd6srKqBB8dPSVa50N5OCyBvXtpS/ORjbNovK5cEbA
         0HTJzGHQDjTog8zQDAgecAReXyqi4jMmjOnC6eLW5VPisGSHSecsnoVR37R4ITfQrIwI
         tIbzD0fC6KRAsFCcD0aDaOUGbx4VhGyY/SwbyWFnpAiaSxLEDg2UtSiwYu2iZTZ+kTB3
         G1rYtUu9fQ1KZxZuXmXc1udrchA/jiqEQ0VRLP/vcGjpq8jdAgMGOtC66e3iaIqNVqek
         ZZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jjZ/qCD1nUFEf29DWnyFe+t244ESnhGfT3N2ZNhhAEU=;
        fh=0WOJsuOLFxu9Gv1w9lRl/te/jA1p+wvHJT7BsR/XWz4=;
        b=KROFP9ufWjtCpyc6gxCLrAORHlc3UEVehZVbIOiyjr7+XbAf/DLs8VUG+PfQtpDLBR
         ydd1kzOy9KN3BTy6P2E49aGQVwpC+zOtsuBf5/0d9eo/l8YGgJvYJ0Bw11711YskwB1r
         Aihhyjrb5Qi8eoCsutCPELCnILr+5kHzInMhsLD82QquMq/L+oYFO6mwMOtuF0ZCCFmZ
         vyee4ZHGOUd/Fp8zmud0BzsuWt/H7T5nEUaX52Y4slZ3O4v8DeTh/9XgYL72Ph8UTRH+
         8aAcmqFB+2eQGv8xos9keS7LHl9GZKRsn8ft/WgGz2wkEk6kmzUedfRJMyZNGbiJjQwd
         vVLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593145; x=1790197945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjZ/qCD1nUFEf29DWnyFe+t244ESnhGfT3N2ZNhhAEU=;
        b=d2KG3LygvV52TEyHorBH1daMTjSbCbA39Ju/r2lLOwhaMaGPQyPjm6frgl37lGZVEZ
         1Bklyz5fY9yLAZVT44vPsNwmg++ii7+A+5Q1nNgkphB4kvvdt3bbEM4pgV+6aBLDHVsn
         9n8Bf/JCaKdFILGjtUVFlO8VZfenWHP5d4JUH0oHuB/DOof0Etcp6JmpBFILdTIOjc03
         rEs15zBe8wiAjqtKbgAWCpPQ9dbFwV7XwLV05IJJR8bsh5OSIce9v48xtFUNRh9BgBB9
         xXBaniCqrEgk/Cj+6gBnEhjaB4YubN0Fh0b5v4ZFJOvDd/i66hXno1iANWLQSBpy7H7z
         ac0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593145; x=1790197945;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjZ/qCD1nUFEf29DWnyFe+t244ESnhGfT3N2ZNhhAEU=;
        b=EXxzeodIXxV1SU2c8ypHDH9OtqkJSaRq4UCXiU6o6ZMvrsulQaGSjO8KBQTLIJbMZz
         s2fkaqrgfIS6SG/milAKHXhqn62dAQwh6LhtznG2lFbQSs25zkMOWBdb/kgffq9IhKHX
         5UMenyirLIAnbRu5EivVuIoPro1YzL0qQMlk6z30po/Knqvrg/6BALY3Ar8cmTnw9ekY
         N65cgb6OUPhJaiJ8yZtq5ohqHtY6cgtQBEgSHrSO5YAXDI9cCSdRAqSps4ImaPQlD39X
         Hs5MtBJeqmVz6sJIoZxZTAaOySqAbwUBx9I0i6WF2CXFB91U/HOh+XI5Efuewiwl2I5Q
         iVkw==
X-Forwarded-Encrypted: i=1; AKwUvBxUzVHeuGRAY9CbKINuvd6CuKL24k4CJUKu/Ckn6GKM8P2XqYrLEQJ3E2xggIt/LfifPANZWmXNLSxKjVo=@vger.kernel.org
X-Gm-Message-State: AFuF++kLq3PmECgF/jRq+OHInhQNZNdbEZQs+dRMvPFBxp7pIcFfc8D7
	yIIYIeXzYHYbicjhKIeHqRAiTFOmiogXCh2oV1idd4J4Z4SY9mJ8FiqCcoPBKF4JP1K6Lk7h6lK
	8h7G/kL6EtLeLIgyBRC1bJH0j2upEKBHtLonChiw=
X-Gm-Gg: AYBFou2iDpPVcGKrvF11E+t5r8yi92brKMXsScBlS/vYEPkbwU7SNQa+Kav3r869zfP
	NJ0RU/nu8FhLPMcrdy2qVIime8a74ApYztCNeDTKK8vNyGrdMGW2S4tb53s1wJ+isknKHxdHpNx
	75pGDw012Ma5zAvUpqtG+5ROTQBCuz9SE4wbEaNdggYDN6Tvf7yo2chYuq//xfA/9HTgy8t1Tsx
	BIob1OiirrVM3Eilgg8cVjcqgqYbWOcVtCE36jUadsE2K81DNsV4iB9TA1mSJfQUTq+vMFLgI77
	QXwHnLgzaGwf84DPRogykYPFbwq4S8LD1Nl4xi2BQFDkJKjmpOZ7FETBwZUd7+r3fskFtLG8t7d
	CaZ4cfAa2/i7J0EBgCYVcoQF45G7cSOc9QcBe6/mNi0ku65O/Un5Twq7rg/l4c+xtSSkxXALL3w
	==
X-Received: by 2002:a17:90b:2648:b0:39d:f70f:f034 with SMTP id
 98e67ed59e1d1-39e1e2f4d41mr13339286a91.10.1789593144694; Wed, 16 Sep 2026
 14:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Robert Viragh <rviragh@gmail.com>
Date: Wed, 16 Sep 2026 23:12:11 +0200
X-Gm-Features: AcwNN1X25YzCowFLUU-Gi7bW7in3pCWKwhzhXIRjCyM_lW-w5tfSgLPn_3YlJOk
Message-ID: <CAFwChBkUdgy5HkjqtZNG+6OY3zsOAxrpsxToxpQ=jt+wtvuHXw@mail.gmail.com>
Subject: [PATCH] random.c: add SP800-90B RCT/APT health tests before crediting sources
To: Jason@zx2c4.com, linux-kernel@vger.kernel.org
Cc: mpm@selenic.com
Content-Type: multipart/mixed; boundary="000000000000aeb774065ba01fc0"

--000000000000aeb774065ba01fc0
Content-Type: multipart/alternative; boundary="000000000000aeb773065ba01fbe"

--000000000000aeb773065ba01fbe
Content-Type: text/plain; charset="UTF-8"

Hi Jason and maintainer team,

I'm very impressed with random.c, it is a huge and clever application of
ChaCha20 with rekeying.  I was reading it to see if there are failure modes
from hardware errors. (I wanted to know if entropy sources that were stuck
high such as due to a wiring fault could cause an infinite loop freeze if
non-dyadic (not a power of two denominator) random value ranges are chosen,
since the usual algorithm rejects the excess, for example if one of three
values are needed with uniform randomness then it could read two bits,
assign 00, 01, and 10 to the three values and discard 11 and try again - so
getting stuck on 11 could freeze a system.)

Along the way I learned that there are some NIST recommendations for
testing against just such problems (stuck entropy sources), these are here:

https://csrc.nist.gov/pubs/sp/800/90/b/final

under Health Tests in Section 4 starting on page 22 of the document (page
30 of the PDF file.), the reasoning/discussion is provided on page 6 under
General Discussion.

These seem like really good recommendations.

I asked Grok to take a shot at proposing the changes, it produced the
attached patch. I asked it to try to encapsulate this guard behavior
correctly (so it doesn't repeat the code) and while respecting the layout
and architecture of the code.  I've read the diff and it seems to make
sense, it has also run some tests on it, but since this code is also used
in high security applications, I would submit it for a review process to
see if it is correct.  I don't know the details of the IRQ and other
entropy sources.

I think it would be nice to add this compliance with SP 800-90B which is a
thoughtful and good standard, though I don't know if it would really guard
code that much.  It's hard to see how these tests could ever fail, since
there are so many entropy sources in the pool.  But if they did fail, I
guess people would want to know!

Let me know what you think, and I hope you will consider carefully
reviewing and potentially adding the code below or a version of it.

Grok's notes are below.

Robert Viragh

Grok's notes:

This adds SP800-90B 4.3-4.4 startup (1024-sample discard) and continuous
RCT/APT on the raw symbols of credited sources only:

  add_interrupt_randomness
  add_timer_randomness  (input + disk)
  add_hwgenerator_randomness

Not on add_device_randomness / add_vmfork_randomness / bootloader seed.

A failed source is still mixed, but not credited. Other sources still
credit. getrandom(2) is unchanged.

Helper was unit-tested in userspace (startup discard, RCT C=31, APT
C=325, no credit after fail). Not booted in a kernel.

--000000000000aeb773065ba01fbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason and maintainer team,<br><br>I&#39;m very impresse=
d with random.c, it is a huge and clever application of ChaCha20 with rekey=
ing.=C2=A0 I was reading it to see if there are failure modes from hardware=
 errors. (I wanted to know if entropy sources that were stuck high such as =
due to a wiring fault could cause an infinite loop freeze if non-dyadic (no=
t a power of two denominator) random value ranges are chosen, since the usu=
al algorithm rejects the excess, for example if one of three values are nee=
ded with uniform randomness then it could read two bits, assign 00, 01, and=
 10 to the three values and discard 11 and try again - so getting stuck on =
11 could freeze a system.)<div><br></div><div>Along the way I learned that =
there are some NIST recommendations for testing against just such problems =
(stuck entropy sources), these are here:=C2=A0</div><div><br></div><div><a =
href=3D"https://csrc.nist.gov/pubs/sp/800/90/b/final">https://csrc.nist.gov=
/pubs/sp/800/90/b/final</a></div><div><br></div><div>under Health Tests in =
Section 4 starting on page 22 of the document (page 30 of the PDF file.), t=
he reasoning/discussion is provided on page 6 under General Discussion.</di=
v><div><br></div><div>These seem like really good recommendations.</div><di=
v><br></div><div>I asked Grok to take a shot at proposing the changes, it p=
roduced the attached patch. I asked it to try to encapsulate this guard beh=
avior correctly (so it doesn&#39;t repeat the code) and while respecting th=
e layout and architecture of the code.=C2=A0 I&#39;ve read the diff and it =
seems to make sense, it has also run some tests on it, but since this code =
is also used in high security applications, I would submit it for a review =
process to see if it is correct.=C2=A0 I don&#39;t know the details of the =
IRQ and other entropy sources.</div><div><br></div><div>I think it would be=
 nice to add this compliance with SP 800-90B which is a thoughtful and good=
 standard, though I don&#39;t know if it would really guard code that much.=
=C2=A0 It&#39;s hard to see how these tests could ever fail, since there ar=
e so many entropy sources in the pool.=C2=A0 But if they did fail, I guess =
people would want to know!</div><div><br></div><div>Let me know what you th=
ink, and I hope you will consider carefully reviewing and potentially addin=
g the code below or a version of it.</div><div><br></div><div>Grok&#39;s no=
tes are below.</div><div><br></div><div><div><div>Robert Viragh</div></div>=
</div><div><br></div><div>Grok&#39;s notes:</div><div><br></div><div><span =
style=3D"background-color:transparent">This adds SP800-90B 4.3-4.4 startup =
(1024-sample discard) and continuous</span></div><div>RCT/APT on the raw sy=
mbols of credited sources only:<br><br>=C2=A0 add_interrupt_randomness<br>=
=C2=A0 add_timer_randomness =C2=A0(input + disk)<br>=C2=A0 add_hwgenerator_=
randomness<br><br>Not on add_device_randomness / add_vmfork_randomness / bo=
otloader seed.<br><br>A failed source is still mixed, but not credited. Oth=
er sources still<br>credit. getrandom(2) is unchanged.<br><br>Helper was un=
it-tested in userspace (startup discard, RCT C=3D31, APT<br>C=3D325, no cre=
dit after fail). Not booted in a kernel.<br><br></div><div><br></div></div>

--000000000000aeb773065ba01fbe--
--000000000000aeb774065ba01fc0
Content-Type: application/octet-stream; 
	name="0001-random-add-SP800-90B-RCT-APT-health-tests.patch"
Content-Disposition: attachment; 
	filename="0001-random-add-SP800-90B-RCT-APT-health-tests.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu4lfd3r0>
X-Attachment-Id: f_mu4lfd3r0

RnJvbTogUm9iZXJ0IFZpcmFnaCA8cnZpcmFnaEBnbWFpbC5jb20+CkRhdGU6IFdlZCwgMTYgU2Vw
IDIwMjYgMjA6MDA6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSByYW5kb20uYzogYWRkIFNQODAw
LTkwQiBSQ1QvQVBUIGhlYWx0aCB0ZXN0cyBiZWZvcmUgY3JlZGl0aW5nIHNvdXJjZXMKCkhpIEph
c29uIGFuZCBtYWludGFpbmVyIHRlYW0sCgpJJ20gdmVyeSBpbXByZXNzZWQgd2l0aCByYW5kb20u
YywgaXQgaXMgYSBodWdlIGFuZCBjbGV2ZXIgYXBwbGljYXRpb24Kb2YgQ2hhQ2hhMjAgd2l0aCBy
ZWtleWluZy4gIEkgd2FzIHJlYWRpbmcgaXQgdG8gc2VlIGlmIHRoZXJlIGFyZQpmYWlsdXJlIG1v
ZGVzIGZyb20gaGFyZHdhcmUgZXJyb3JzLiAoSSB3YW50ZWQgdG8ga25vdyBpZiBlbnRyb3B5CnNv
dXJjZXMgdGhhdCB3ZXJlIHN0dWNrIGhpZ2ggc3VjaCBhcyBkdWUgdG8gYSB3aXJpbmcgZmF1bHQg
Y291bGQgY2F1c2UKYW4gaW5maW5pdGUgbG9vcCBmcmVlemUgaWYgbm9uLWR5YWRpYyAobm90IGEg
cG93ZXIgb2YgdHdvIGRlbm9taW5hdG9yKQpyYW5kb20gdmFsdWUgcmFuZ2VzIGFyZSBjaG9zZW4s
IHNpbmNlIHRoZSB1c3VhbCBhbGdvcml0aG0gcmVqZWN0cyB0aGUKZXhjZXNzLCBmb3IgZXhhbXBs
ZSBpZiBvbmUgb2YgdGhyZWUgdmFsdWVzIGFyZSBuZWVkZWQgd2l0aCB1bmlmb3JtCnJhbmRvbW5l
c3MgdGhlbiBpdCBjb3VsZCByZWFkIHR3byBiaXRzLCBhc3NpZ24gMDAsIDAxLCBhbmQgMTAgdG8g
dGhlCnRocmVlIHZhbHVlcyBhbmQgZGlzY2FyZCAxMSBhbmQgdHJ5IGFnYWluIC0gc28gZ2V0dGlu
ZyBzdHVjayBvbiAxMQpjb3VsZCBmcmVlemUgYSBzeXN0ZW0uKQoKQWxvbmcgdGhlIHdheSBJIGxl
YXJuZWQgdGhhdCB0aGVyZSBhcmUgc29tZSBOSVNUIHJlY29tbWVuZGF0aW9ucwpmb3IgdGVzdGlu
ZyBhZ2FpbnN0IGp1c3Qgc3VjaCBwcm9ibGVtcyAoc3R1Y2sgZW50cm9weSBzb3VyY2VzKSwKdGhl
c2UgYXJlIGhlcmU6IAoKaHR0cHM6Ly9jc3JjLm5pc3QuZ292L3B1YnMvc3AvODAwLzkwL2IvZmlu
YWwKCnVuZGVyIEhlYWx0aCBUZXN0cyBpbiBTZWN0aW9uIDQgc3RhcnRpbmcgb24gcGFnZSAyMiBv
ZiB0aGUKZG9jdW1lbnQgKHBhZ2UgMzAgb2YgdGhlIFBERiBmaWxlLiksIHRoZSByZWFzb25pbmcv
ZGlzY3Vzc2lvbgppcyBwcm92aWRlZCBvbiBwYWdlIDYgdW5kZXIgR2VuZXJhbCBEaXNjdXNzaW9u
LgoKVGhlc2Ugc2VlbSBsaWtlIHJlYWxseSBnb29kIHJlY29tbWVuZGF0aW9ucy4KCkkgYXNrZWQg
R3JvayB0byB0YWtlIGEgc2hvdCBhdCBwcm9wb3NpbmcgdGhlIGNoYW5nZXMsIGl0IHByb2R1Y2Vk
CnRoZSBhdHRhY2hlZCBwYXRjaC4gSSBhc2tlZCBpdCB0byB0cnkgdG8gZW5jYXBzdWxhdGUgdGhp
cyBndWFyZApiZWhhdmlvciBjb3JyZWN0bHkgKHNvIGl0IGRvZXNuJ3QgcmVwZWF0IHRoZSBjb2Rl
KSBhbmQgd2hpbGUKcmVzcGVjdGluZyB0aGUgbGF5b3V0IGFuZCBhcmNoaXRlY3R1cmUgb2YgdGhl
IGNvZGUuICBJJ3ZlIHJlYWQgdGhlCmRpZmYgYW5kIGl0IHNlZW1zIHRvIG1ha2Ugc2Vuc2UsIGl0
IGhhcyBhbHNvIHJ1biBzb21lIHRlc3RzIG9uIGl0LApidXQgc2luY2UgdGhpcyBjb2RlIGlzIGFs
c28gdXNlZCBpbiBoaWdoIHNlY3VyaXR5IGFwcGxpY2F0aW9ucywKSSB3b3VsZCBzdWJtaXQgaXQg
Zm9yIGEgcmV2aWV3IHByb2Nlc3MgdG8gc2VlIGlmIGl0IGlzIGNvcnJlY3QuCkkgZG9uJ3Qga25v
dyB0aGUgZGV0YWlscyBvZiB0aGUgSVJRIGFuZCBvdGhlciBlbnRyb3B5IHNvdXJjZXMuCgpJIHRo
aW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gYWRkIHRoaXMgY29tcGxpYW5jZSB3aXRoIFNQIDgwMC05
MEIKd2hpY2ggaXMgYSB0aG91Z2h0ZnVsIGFuZCBnb29kIHN0YW5kYXJkLCB0aG91Z2ggSSBkb24n
dCBrbm93IGlmCml0IHdvdWxkIHJlYWxseSBndWFyZCBjb2RlIHRoYXQgbXVjaC4gIEl0J3MgaGFy
ZCB0byBzZWUgaG93IHRoZXNlCnRlc3RzIGNvdWxkIGV2ZXIgZmFpbCwgc2luY2UgdGhlcmUgYXJl
IHNvIG1hbnkgZW50cm9weSBzb3VyY2VzIGluCnRoZSBwb29sLiAgQnV0IGlmIHRoZXkgZGlkIGZh
aWwsIEkgZ3Vlc3MgcGVvcGxlIHdvdWxkIHdhbnQgdG8ga25vdyEKCkxldCBtZSBrbm93IHdoYXQg
eW91IHRoaW5rLCBhbmQgSSBob3BlIHlvdSB3aWxsIGNvbnNpZGVyIGNhcmVmdWxseQpyZXZpZXdp
bmcgYW5kIHBvdGVudGlhbGx5IGFkZGluZyB0aGUgY29kZSBiZWxvdyBvciBhIHZlcnNpb24gb2Yg
aXQuCgpHcm9rJ3Mgbm90ZXMgYXJlIGJlbG93LgoKUm9iZXJ0IFZpcmFnaAoKR3JvaydzIG5vdGVz
OgoKU3VtbWFyeToKClRoaXMgYWRkcyBTUDgwMC05MEIgNC4zLTQuNCBzdGFydHVwICgxMDI0LXNh
bXBsZSBkaXNjYXJkKSBhbmQgY29udGludW91cwpSQ1QvQVBUIG9uIHRoZSByYXcgc3ltYm9scyBv
ZiBjcmVkaXRlZCBzb3VyY2VzIG9ubHk6CgogIGFkZF9pbnRlcnJ1cHRfcmFuZG9tbmVzcwogIGFk
ZF90aW1lcl9yYW5kb21uZXNzICAoaW5wdXQgKyBkaXNrKQogIGFkZF9od2dlbmVyYXRvcl9yYW5k
b21uZXNzCgpOb3Qgb24gYWRkX2RldmljZV9yYW5kb21uZXNzIC8gYWRkX3ZtZm9ya19yYW5kb21u
ZXNzIC8gYm9vdGxvYWRlciBzZWVkLgoKQSBmYWlsZWQgc291cmNlIGlzIHN0aWxsIG1peGVkLCBi
dXQgbm90IGNyZWRpdGVkLiBPdGhlciBzb3VyY2VzIHN0aWxsCmNyZWRpdC4gZ2V0cmFuZG9tKDIp
IGlzIHVuY2hhbmdlZC4KCkhlbHBlciB3YXMgdW5pdC10ZXN0ZWQgaW4gdXNlcnNwYWNlIChzdGFy
dHVwIGRpc2NhcmQsIFJDVCBDPTMxLCBBUFQKQz0zMjUsIG5vIGNyZWRpdCBhZnRlciBmYWlsKS4g
Tm90IGJvb3RlZCBpbiBhIGtlcm5lbC4KCkRldGFpbHM6CgoKQWRkIFNQODAwLTkwQiBzZWN0aW9u
IDQuMy00LjQgc3RhcnR1cCBhbmQgY29udGludW91cyBoZWFsdGggdGVzdHMKKHJlcGV0aXRpb24g
Y291bnQgYW5kIGFkYXB0aXZlIHByb3BvcnRpb24sIGFscGhhPTJeLTMwKSBvbiB0aGUgcmF3CnN5
bWJvbHMgb2YgY3JlZGl0ZWQgbm9pc2Ugc291cmNlczogSVJRIGN5Y2xlIGNvdW50ZXJzLCB0aW1l
ci9pbnB1dC9kaXNrCmN5Y2xlIGNvdW50ZXJzLCBhbmQgaHdybmcgYnl0ZXMuCgpUaGUgZmlyc3Qg
MTAyNCBzYW1wbGVzIHBlciBzb3VyY2UgYXJlIGRpc2NhcmRlZC4gQSBzb3VyY2UgdGhhdCBmYWls
cyBpcwpzdGlsbCBtaXhlZCBidXQgbm90IGNyZWRpdGVkOyBvdGhlciBzb3VyY2VzIHN0aWxsIGNy
ZWRpdC4KZ2V0cmFuZG9tKDIpIGFuZCBDUk5HX1JFQURZIGFyZSB1bmNoYW5nZWQ6IDI1NiBjcmVk
aXRlZCBiaXRzIGZyb20gdGhlCnVuaW9uIG9mIGhlYWx0aHkgc291cmNlcy4KCkN1dG9mZnMgdXNl
IEg9MSBiaXQgcGVyIElSUS90aW1lciBzYW1wbGUgc28gdGhlIG1hbmRhdG9yeSBub24tYmluYXJ5
CkFQVCB3aW5kb3cgVz01MTIgY2FuIG1lZXQgYWxwaGEgKEg9MS82NCBwb29sIGFjY291bnRpbmcg
Y2Fubm90OiBDPlcpLgpod3JuZyB1c2VzIEggPSBtaW4oOCwgZW50cm9weS9sZW4pIGJpdHMgcGVy
IGJ5dGUuCgpVbnRlc3RlZCBvbiBhIGJvb3RlZCBrZXJuZWwuIEhlbHBlciBsb2dpYyB1bml0LXRl
c3RlZCBpbiB1c2Vyc3BhY2UuCgpMaW5rOiBodHRwczovL2NzcmMubmlzdC5nb3YvcHVicy9zcC84
MDAvOTAvYi9maW5hbApTaWduZWQtb2ZmLWJ5OiBST0JFUlQgVklSQUdIIDxydmlyYWdoQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2NoYXIvcmFuZG9tLmMgfCAxIGZpbGUKIDEgZmlsZSBjaGFuZ2Vk
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL3JhbmRvbS5jIGIvZHJpdmVycy9jaGFyL3JhbmRv
bS5jCmluZGV4IDAwMDAwMDAwMDAwMC4uMTExMTExMTExMTExIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2NoYXIvcmFuZG9tLmMJMjAyNi0wOS0xNiAyMDoyMDo0NC41Mzk2NjM1OTIgKzAwMDAKKysrIGIv
ZHJpdmVycy9jaGFyL3JhbmRvbS5jCTIwMjYtMDktMTYgMjA6MjA6NDQuNTM5NjYzNTkyICswMDAw
CkBAIC05MzcsNiArOTM3LDEwMCBAQAogfQogRVhQT1JUX1NZTUJPTChhZGRfZGV2aWNlX3JhbmRv
bW5lc3MpOwogCisKKy8qCisgKiBUaGVzZSBoZWFsdGggY2hlY2tzIGF0dGVtcHQgdG8gaW1wbGVt
ZW50IHNlY3Rpb24gNCBvZgorICogICAgICAgICAgICAgICAgICAgICAgICAgICAgTklTVCBTUCA4
MDAtOTBCCisgKiBSZWNvbW1lbmRhdGlvbiBmb3IgdGhlIEVudHJvcHkgU291cmNlcyBVc2VkIGZv
ciBSYW5kb20gQml0IEdlbmVyYXRpb24KKyAqIGF2YWlsYWJsZSBhdDogaHR0cHM6Ly9jc3JjLm5p
c3QuZ292L3B1YnMvc3AvODAwLzkwL2IvZmluYWwKKyAqCisgKiBTUDgwMC05MEIgNC4zLTQuNCBo
ZWFsdGggdGVzdHMgb24gcmF3IG5vaXNlIHN5bWJvbHMgKGFscGhhID0gMl4tMzApLgorICogSCA9
IDEgYml0L3NhbXBsZSBmb3IgSVJRIGFuZCB0aW1lciBjeWNsZSBjb3VudGVycyAobm9uLWJpbmFy
eSBBUFQKKyAqIFc9NTEyIG5lZWRzIEMgPD0gVykuIEZpcnN0IDEwMjQgc2FtcGxlcyBhcmUgZGlz
Y2FyZGVkLiBBIGZhaWxlZCBzb3VyY2UKKyAqIGlzIHN0aWxsIGluY2x1ZGVkIGJ1dCBub3QgY3Jl
ZGl0ZWQ7IG90aGVyIHNvdXJjZXMgc3RpbGwgY3JlZGl0LgorICovCisjZGVmaW5lIEVIX1NUQVJU
VVAJMTAyNAorI2RlZmluZSBFSF9SQ1RfSDEJMzEKKyNkZWZpbmUgRUhfQVBUX1cJNTEyCisjZGVm
aW5lIEVIX0FQVF9IMQkzMjUKKworc3RydWN0IGVudHJvcHlfaGVhbHRoIHsKKwl1bnNpZ25lZCBs
b25nIGxhc3QsIGFwdF9iYXNlOworCXUxNiByY3QsIGFwdF9jb3VudCwgYXB0X29icywgc3RhcnR1
cDsKKwl1OCBhcHRfc2V0LCBmYWlsZWQ7Cit9OworCitzdGF0aWMgc3RydWN0IGVudHJvcHlfaGVh
bHRoIGh3Z2VuX2hlYWx0aDsKKworc3RhdGljIHVuc2lnbmVkIGludCByY3RfY3V0b2ZmX2godW5z
aWduZWQgaW50IGgpCit7CisJaWYgKGggPCAxKQorCQloID0gMTsKKwlyZXR1cm4gMSArICgzMCAr
IGggLSAxKSAvIGg7Cit9CisKK3N0YXRpYyB1bnNpZ25lZCBpbnQgYXB0X2N1dG9mZl9oKHVuc2ln
bmVkIGludCBoKQoreworCXN0YXRpYyBjb25zdCB1MTYgdFtdID0geyAzMjUsIDE5MCwgMTIyLCA3
MSwgNTAsIDM4LCAyOSwgMTYgfTsKKworCWlmIChoIDwgMSkKKwkJaCA9IDE7CisJaWYgKGggPiA4
KQorCQloID0gODsKKwlyZXR1cm4gdFtoIC0gMV07Cit9CisKKy8qIFJldHVybnMgdHJ1ZSBpZiB0
aGlzIHNhbXBsZSBtYXkgYmUgY3JlZGl0ZWQuICovCitzdGF0aWMgYm9vbCBlbnRyb3B5X2hlYWx0
aF9vYnNlcnZlKHN0cnVjdCBlbnRyb3B5X2hlYWx0aCAqaCwgdW5zaWduZWQgbG9uZyBzYW1wbGUs
CisJCQkJICB1bnNpZ25lZCBpbnQgcmN0X2MsIHVuc2lnbmVkIGludCBhcHRfYykKK3sKKwlpZiAo
IWgtPmZhaWxlZCkgeworCQlpZiAoIWgtPnJjdCkgeworCQkJaC0+cmN0ID0gMTsKKwkJfSBlbHNl
IGlmIChzYW1wbGUgPT0gaC0+bGFzdCkgeworCQkJaWYgKCsraC0+cmN0ID49IHJjdF9jKQorCQkJ
CWdvdG8gZmFpbDsKKwkJfSBlbHNlIHsKKwkJCWgtPnJjdCA9IDE7CisJCX0KKwkJaC0+bGFzdCA9
IHNhbXBsZTsKKworCQlpZiAoIWgtPmFwdF9zZXQpIHsKKwkJCWgtPmFwdF9iYXNlID0gc2FtcGxl
OworCQkJaC0+YXB0X3NldCA9IDE7CisJCQloLT5hcHRfY291bnQgPSAxOworCQkJaC0+YXB0X29i
cyA9IDE7CisJCX0gZWxzZSB7CisJCQlpZiAoc2FtcGxlID09IGgtPmFwdF9iYXNlKQorCQkJCWgt
PmFwdF9jb3VudCsrOworCQkJaWYgKCsraC0+YXB0X29icyA+PSBFSF9BUFRfVykgeworCQkJCWlm
IChoLT5hcHRfY291bnQgPj0gYXB0X2MpCisJCQkJCWdvdG8gZmFpbDsKKwkJCQloLT5hcHRfc2V0
ID0gMDsKKwkJCQloLT5hcHRfY291bnQgPSAwOworCQkJCWgtPmFwdF9vYnMgPSAwOworCQkJfQor
CQl9CisJfQorCisJaWYgKGgtPnN0YXJ0dXAgPCBFSF9TVEFSVFVQKSB7CisJCWgtPnN0YXJ0dXAr
KzsKKwkJcmV0dXJuIGZhbHNlOworCX0KKwlyZXR1cm4gIWgtPmZhaWxlZDsKK2ZhaWw6CisJaC0+
ZmFpbGVkID0gMTsKKwlwcl93YXJuX3JhdGVsaW1pdGVkKCJyYW5kb206IGVudHJvcHkgc291cmNl
IGZhaWxlZCBTUDgwMC05MEIgaGVhbHRoIHRlc3RcbiIpOworCWlmIChoLT5zdGFydHVwIDwgRUhf
U1RBUlRVUCkKKwkJaC0+c3RhcnR1cCsrOworCXJldHVybiBmYWxzZTsKK30KKworc3RhdGljIGJv
b2wgZW50cm9weV9oZWFsdGhfZGlzY2FyZGluZyhjb25zdCBzdHJ1Y3QgZW50cm9weV9oZWFsdGgg
KmgpCit7CisJcmV0dXJuIGgtPnN0YXJ0dXAgPCBFSF9TVEFSVFVQOworfQorCiAvKgogICogSW50
ZXJmYWNlIGZvciBpbi1rZXJuZWwgZHJpdmVycyBvZiB0cnVlIGhhcmR3YXJlIFJOR3MuIFRob3Nl
IGRldmljZXMKICAqIG1heSBwcm9kdWNlIGVuZGxlc3MgcmFuZG9tIGJpdHMsIHNvIHRoaXMgZnVu
Y3Rpb24gd2lsbCBzbGVlcCBmb3IKQEAgLTk0NCw4ICsxMDM4LDI0IEBACiAgKi8KIHZvaWQgYWRk
X2h3Z2VuZXJhdG9yX3JhbmRvbW5lc3MoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBzaXpl
X3QgZW50cm9weSwgYm9vbCBzbGVlcF9hZnRlcikKIHsKLQltaXhfcG9vbF9ieXRlcyhidWYsIGxl
bik7Ci0JY3JlZGl0X2luaXRfYml0cyhlbnRyb3B5KTsKKwl1bnNpZ25lZCBpbnQgaCA9IChsZW4g
JiYgZW50cm9weSkgPyBtaW5fdCh1bnNpZ25lZCBpbnQsIDgsIGVudHJvcHkgLyBsZW4pIDogMDsK
KwlzaXplX3QgaTsKKwlib29sIGNyZWRpdCA9IHRydWU7CisKKwlpZiAoaCkgeworCQl1bnNpZ25l
ZCBpbnQgcmN0X2MgPSByY3RfY3V0b2ZmX2goaCksIGFwdF9jID0gYXB0X2N1dG9mZl9oKGgpOwor
CisJCWZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykgeworCQkJaWYgKCFlbnRyb3B5X2hlYWx0aF9v
YnNlcnZlKCZod2dlbl9oZWFsdGgsICgoY29uc3QgdTggKilidWYpW2ldLAorCQkJCQkJICAgIHJj
dF9jLCBhcHRfYykpCisJCQkJY3JlZGl0ID0gZmFsc2U7CisJCX0KKwl9CisJaWYgKCFlbnRyb3B5
X2hlYWx0aF9kaXNjYXJkaW5nKCZod2dlbl9oZWFsdGgpKSB7CisJCW1peF9wb29sX2J5dGVzKGJ1
ZiwgbGVuKTsKKwkJaWYgKGNyZWRpdCkKKwkJCWNyZWRpdF9pbml0X2JpdHMoZW50cm9weSk7CisJ
fQogCiAJLyoKIAkgKiBUaHJvdHRsZSB3cml0aW5nIHRvIG9uY2UgZXZlcnkgcmVzZWVkIGludGVy
dmFsLCB1bmxlc3Mgd2UncmUgbm90IHlldApAQCAtMTAyMSw2ICsxMTMxLDggQEAKIAkubWl4ID0g
X19USU1FUl9JTklUSUFMSVpFUihtaXhfaW50ZXJydXB0X3JhbmRvbW5lc3MsIDApCiB9OwogCitz
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGVudHJvcHlfaGVhbHRoLCBpcnFfaGVhbHRoKTsK
KwogLyoKICAqIFRoaXMgaXMgW0hhbGZdU2lwSGFzaC0xLXgsIHN0YXJ0aW5nIGZyb20gYW4gZW1w
dHkga2V5LiBCZWNhdXNlCiAgKiB0aGUga2V5IGlzIGZpeGVkLCBpdCBhc3N1bWVzIHRoYXQgaXRz
IGlucHV0cyBhcmUgbm9uLW1hbGljaW91cywKQEAgLTEwNzIsNiArMTE4NCw4IEBACiAJICovCiAJ
dW5zaWduZWQgbG9uZyBwb29sWzJdOwogCXVuc2lnbmVkIGludCBjb3VudDsKKwlib29sIGNyZWRp
dDsKKwlzdHJ1Y3QgZW50cm9weV9oZWFsdGggKmVoOwogCiAJLyogQ2hlY2sgdG8gc2VlIGlmIHdl
J3JlIHJ1bm5pbmcgb24gdGhlIHdyb25nIENQVSBkdWUgdG8gaG90cGx1Zy4gKi8KIAlsb2NhbF9p
cnFfZGlzYWJsZSgpOwpAQCAtMTA4OCwxMCArMTIwMiwxMyBAQAogCWNvdW50ID0gZmFzdF9wb29s
LT5jb3VudDsKIAlmYXN0X3Bvb2wtPmNvdW50ID0gMDsKIAlmYXN0X3Bvb2wtPmxhc3QgPSBqaWZm
aWVzOworCWVoID0gdGhpc19jcHVfcHRyKCZpcnFfaGVhbHRoKTsKKwljcmVkaXQgPSAhZWgtPmZh
aWxlZCAmJiBlaC0+c3RhcnR1cCA+PSBFSF9TVEFSVFVQOwogCWxvY2FsX2lycV9lbmFibGUoKTsK
IAogCW1peF9wb29sX2J5dGVzKHBvb2wsIHNpemVvZihwb29sKSk7Ci0JY3JlZGl0X2luaXRfYml0
cyhjbGFtcF90KHVuc2lnbmVkIGludCwgKGNvdW50ICYgVTE2X01BWCkgLyA2NCwgMSwgc2l6ZW9m
KHBvb2wpICogOCkpOworCWlmIChjcmVkaXQpCisJCWNyZWRpdF9pbml0X2JpdHMoY2xhbXBfdCh1
bnNpZ25lZCBpbnQsIChjb3VudCAmIFUxNl9NQVgpIC8gNjQsIDEsIHNpemVvZihwb29sKSAqIDgp
KTsKIAogCW1lbXplcm9fZXhwbGljaXQocG9vbCwgc2l6ZW9mKHBvb2wpKTsKIH0KQEAgLTExMDMs
NiArMTIyMCwxMSBAQAogCXN0cnVjdCBmYXN0X3Bvb2wgKmZhc3RfcG9vbCA9IHRoaXNfY3B1X3B0
cigmaXJxX3JhbmRvbW5lc3MpOwogCXN0cnVjdCBwdF9yZWdzICpyZWdzID0gZ2V0X2lycV9yZWdz
KCk7CiAJdW5zaWduZWQgaW50IG5ld19jb3VudDsKKwlzdHJ1Y3QgZW50cm9weV9oZWFsdGggKmVo
ID0gdGhpc19jcHVfcHRyKCZpcnFfaGVhbHRoKTsKKworCWVudHJvcHlfaGVhbHRoX29ic2VydmUo
ZWgsIGVudHJvcHksIEVIX1JDVF9IMSwgRUhfQVBUX0gxKTsKKwlpZiAoZW50cm9weV9oZWFsdGhf
ZGlzY2FyZGluZyhlaCkpCisJCXJldHVybjsKIAogCWZhc3RfbWl4KGZhc3RfcG9vbC0+cG9vbCwg
ZW50cm9weSwKIAkJIChyZWdzID8gaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSA6IF9SRVRfSVBf
KSBeIHN3YWIoaXJxKSk7CkBAIC0xMTI2LDYgKzEyNDgsNyBAQAogc3RydWN0IHRpbWVyX3JhbmRf
c3RhdGUgewogCXVuc2lnbmVkIGxvbmcgbGFzdF90aW1lOwogCWxvbmcgbGFzdF9kZWx0YSwgbGFz
dF9kZWx0YTI7CisJc3RydWN0IGVudHJvcHlfaGVhbHRoIGhlYWx0aDsKIH07CiAKIC8qCkBAIC0x
MTQwLDYgKzEyNjMsMTEgQEAKIAl1bnNpZ25lZCBsb25nIGVudHJvcHkgPSByYW5kb21fZ2V0X2Vu
dHJvcHkoKSwgbm93ID0gamlmZmllcywgZmxhZ3M7CiAJbG9uZyBkZWx0YSwgZGVsdGEyLCBkZWx0
YTM7CiAJdW5zaWduZWQgaW50IGJpdHM7CisJYm9vbCBjcmVkaXQ7CisKKwljcmVkaXQgPSBlbnRy
b3B5X2hlYWx0aF9vYnNlcnZlKCZzdGF0ZS0+aGVhbHRoLCBlbnRyb3B5LCBFSF9SQ1RfSDEsIEVI
X0FQVF9IMSk7CisJaWYgKGVudHJvcHlfaGVhbHRoX2Rpc2NhcmRpbmcoJnN0YXRlLT5oZWFsdGgp
KQorCQlyZXR1cm47CiAKIAkvKgogCSAqIElmIHdlJ3JlIGluIGEgaGFyZCBJUlEsIGFkZF9pbnRl
cnJ1cHRfcmFuZG9tbmVzcygpIHdpbGwgYmUgY2FsbGVkCkBAIC0xMTU0LDcgKzEyODIsNyBAQAog
CQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbnB1dF9wb29sLmxvY2ssIGZsYWdzKTsKIAl9CiAK
LQlpZiAoY3JuZ19yZWFkeSgpKQorCWlmIChjcm5nX3JlYWR5KCkgfHwgIWNyZWRpdCkKIAkJcmV0
dXJuOwogCiAJLyoK
--000000000000aeb774065ba01fc0--
