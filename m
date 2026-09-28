Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0638F62F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639087; cv=pass; b=d4JG9mkdXqVJ++gVxRipqgL7ko6diP2WYWgx9vrKb3jmSGqk9Ak8t3F3RuwCRWTummoUrT5qBPyrD4QIUMspA5J2ObfHTiQ66K5VRwF8T2ovHdmPSZ4KndNQd8jYKyd1+NStWWSnfMRHQb7ZxD8f5kgVRbEP3mn0st+RwemZiog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639087; c=relaxed/simple;
	bh=N8Ru2KZ4gnHPrAukAwiJge7OXCwCBTs64/BeOs5VIkw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HwZgBd5BISZJBSHsGCrnV26ZZy4p29uWZqHJOBEHT63xKtvWAMXSgmCyL4uGnWF3KS38Ipp2teJum9QSGj8L6D0kgKejnYGnktfxMseLHqZGzCygCHzB9Ja3hyuyiz4HyvGUkfWs3/yW3cAdQQKVtzejkbA3T/YfeViTeQU951g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9xfHsZk; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9xfHsZk"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a655c007efso22383861fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639084; cv=none;
        d=google.com; s=arc-20260327;
        b=oIqz/iDA8sH/4TZfXTu2GQuMu3VO6YXbSsN4uuOAykdQoC2hPaHzppkRASzboXdu+n
         Hoh9puXa7h6vKczKLYciLNx9pb67F4CvmEh5nfAjBiT87pGGPimbeZeWRkB+e2bYhxz6
         rAxLZXwOz7UmPYq9HITDiqtZo98hJPi52NBNe0XvLOInqGwbFGIkRAZkZuDkwb9VjQtI
         dnSYIrvo/CFtfa0xSLUvFG9ILzGSyB8242/afLFxVQqCmZDm/EQrJc6ix3aVvsAsSIPD
         JklEgVo4QeL4Ood9g8Xcif4tvlqog+MlfrHLqyEG7wkNp4vBAz2Oh9CV2g5bDfsdtW3T
         Vtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N8Ru2KZ4gnHPrAukAwiJge7OXCwCBTs64/BeOs5VIkw=;
        fh=yC+2TLdcvI6s0XNFWJayfXT0k+yLre+W8IB8CTgl2Ng=;
        b=UdLmJZLWHJGJBDXMdz8o+g/KrxUcfrpmLAzFOOYvNrYopopoSK9ClrCkWL/YAj53ug
         WoSYNJyveQNo/FlH1VUkw30V/ggElu36mXPSvZTcaTp3Fdl7r9snIpOgIOfSkUIyhilR
         TAjcts9RXAh8is+ExUdyFqKXW10oOerHlrcwIFcKa9RfT+dKdLYTtY4jRfkFWhupEiqA
         WDMdaEce2sWEcM3wEuGNFOIGgbTcwqnD/XOL0WIycuIB9bO7daDAm/HYSCoNwsw8dzLg
         R+UvuDrmpm45eqd6eBLlaaOlZ7fhhCSvy9aUSymM3TJh3TxgL1fJpR5tLli9dA1/HC0U
         KnPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639084; x=1791243884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8Ru2KZ4gnHPrAukAwiJge7OXCwCBTs64/BeOs5VIkw=;
        b=U9xfHsZktYUjcDNnHgiPXqk0uziSRSj6H7tXw10zBThOwv3HwKy30K1k7B2wOACgfU
         G9+XYl2CnhDqDQEOQ+4WiQsAetQUkkZPDB/9ko0NFpGwmKFM1sqljbjNbT7UGzN715Lf
         mauQsojCuxseN46ZHmOVBIgl0WZ16iO6zSJJB0tSva7SsEIa4beH3e2RcKyfGTyLj+rt
         l2WDFPjrng8qXlHoRWmXRMTpSXXRSD2GTb8IuK4KEIEjgr/HHkLRFIdduM7GkzmZW+00
         Jsyhlt9jpA1yPf/hCPrxqkfx6/JYQHwNxDW2agOoOIgfqqALTw8VbUbFLrVJGTMP413L
         h9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639084; x=1791243884;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N8Ru2KZ4gnHPrAukAwiJge7OXCwCBTs64/BeOs5VIkw=;
        b=Vrk+gGJZgU/w2RFhkNv5BR6UMk0LsJ+OW5Popu1hMJcX4nGvuDDEerBeZS6G7jwLeb
         Ro+IcNuGrclevoAJ0GE5bzJVObG0Gdu79EhcmpfOKgS7fAHaWCO6HgmJ0JhxxJWx7/Gk
         InaYyba2wxEydB/5ztOo2IoevlK7qlzATQZ6jYWU9cCaiuMBB4e9+W3kUBTlsOG5X+ce
         hulrnsyb3N6RnAqox+jrKQSzvrQNur0M3pWY4w4jG144hxmmNWXrjqviLBy3jH8bX36X
         ojq7AO0HPa/oUxyWpjIlmrrYN49W8Oki0QkgcaS3j3vaFvpsZ2+r55+5elWXqAA5RnVt
         3pow==
X-Forwarded-Encrypted: i=1; AKwUvByDqXuBgobJUGaFt1u5OmT6uBDHoE5idIxXp0+xqJROcaIlEdqnGdt5/uIPVZXSBjIn83rrtCe7Ovi1vqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD/fwcWddcqE6B0QQfSprZJqOSVfg7hDNY3+Nvv6naRpWHv7QS
	RCllJLZ0N4Sm3rnuCBjCL69OCjizUQ+wKmyhfuLEDq9skiA2Wu4sXJrZO/0cHRvQIUT0QmIvdHo
	vlkZ7gK1cL7L6lU6fYDQLxvZXitALHAU=
X-Gm-Gg: AYBFou2CdBvvM++8Lqc6pcnvWv5jbDjl3LMY2hhpzkpt0Mrm4rPs1cxPO5e7m5ZfS9n
	PcpSKjZAz49wlz07V+QrzZeC21t+oX7HVAerb7Q1krR+r9Yr2RCHyRPA3T4ekYBfysk/0naDuq4
	LfpaV1nm0CDgtD5FMjqsg9P1wktDbgI2QtrUUgvI9sQeOUHqxlG4blUTR3l2eG4qnbgpTmrKTHp
	nluozhn7BaOvrZc57euq7k8rrS0B1DI3qhTTyHSX9l0eB5DV1IA34XsprwG7bXZ5oCwuMlwtale
	iKWm5Qg1TjdLFnbu++v3SssRU0QiCa337AdEjMovM1rUG1VxETc5DJnrF2UiidyOnUevGJgE4Vl
	smC1OMHWBr9SKAhi/+qsmIk9VfH/WhDKHwGry4Mqs9IF8Lih2KBEqAZGiwJoTY8z4zBYLCGg=
X-Received: by 2002:a2e:b8c8:0:b0:3a6:772c:2763 with SMTP id
 38308e7fff4ca-3a6772c2ad3mr10310711fa.0.1790639083996; Mon, 28 Sep 2026
 16:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:44:32 -0400
X-Gm-Features: AclHuK_VsivwmfiG4mYbPPAahvGUwAEkm-1jf-dH6-g7RAdYNo4Yu9FnxlBZi20
Message-ID: <CAGLNFZes3CXA568n+5_rgoneDh7w-2=MS34ON7n1tq3ezeZzsw@mail.gmail.com>
Subject: [PATCH] check-uapi: reject zero and malformed job counts
To: akpm@linux-foundation.org
Cc: arnd@arndb.de, quic_johmoo@quicinc.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000085ee3a065c93a6a5"

--00000000000085ee3a065c93a6a5
Content-Type: text/plain; charset="UTF-8"

With -j 0, the per-header loop waits on an empty PID before any
worker starts. It counts that wait error as an ABI failure even when
the header passes. Reject non-positive or malformed job counts as
prerequisite errors before starting the check.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--00000000000085ee3a065c93a6a5
Content-Type: application/octet-stream; name="02-check-uapi-job-count.patch"
Content-Disposition: attachment; filename="02-check-uapi-job-count.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulw9q5i0>
X-Attachment-Id: f_mulw9q5i0

RnJvbSAzN2UwZDE4YjdhYWE2MjE5ODFhYzE0MzNmZDRkYmRhYzcyMTk0Njk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGNo
ZWNrLXVhcGk6IHJlamVjdCB6ZXJvIGFuZCBtYWxmb3JtZWQgam9iIGNvdW50cwpUbzogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+LCBKb2huIE1vb24gPHF1aWNfam9obW9vQHF1aWNpbmMuY29tPiwgbGludXgt
YXBpQHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwoKRnJvbTog
T21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+CgpXaXRoIC1qIDAsIHRoZSBwZXIt
aGVhZGVyIGxvb3Agd2FpdHMgb24gYW4gZW1wdHkgUElEIGJlZm9yZSBhbnkKd29ya2VyIHN0YXJ0
cy4gSXQgY291bnRzIHRoYXQgd2FpdCBlcnJvciBhcyBhbiBBQkkgZmFpbHVyZSBldmVuIHdoZW4K
dGhlIGhlYWRlciBwYXNzZXMuIFJlamVjdCBub24tcG9zaXRpdmUgb3IgbWFsZm9ybWVkIGpvYiBj
b3VudHMgYXMKcHJlcmVxdWlzaXRlIGVycm9ycyBiZWZvcmUgc3RhcnRpbmcgdGhlIGNoZWNrLgoK
U2lnbmVkLW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+Ci0tLQog
c2NyaXB0cy9jaGVjay11YXBpLnNoIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2stdWFwaS5zaCBiL3NjcmlwdHMvY2hl
Y2stdWFwaS5zaAppbmRleCBlMzQ5ZDFmLi5hNWI1OTk1IDEwMDY0NAotLS0gYS9zY3JpcHRzL2No
ZWNrLXVhcGkuc2gKKysrIGIvc2NyaXB0cy9jaGVjay11YXBpLnNoCkBAIC01NzUsNiArNTc1LDEx
IEBAIG1haW4oKSB7CiAJCWV4ZWMgPiAvZGV2L251bGwgMj4mMQogCWZpCiAKKwlpZiAhIFtbICIk
TUFYX1RIUkVBRFMiID1+IF4wKlsxLTldWzAtOV0qJCBdXTsgdGhlbgorCQllcHJpbnRmICdlcnJv
ciAtIEpPQlMgbXVzdCBiZSBhIHBvc2l0aXZlIGludGVnZXJcbicKKwkJZXhpdCAiJEZBSUxfUFJF
UkVRIgorCWZpCisKIAlydW4gIiRiYXNlX3JlZiIgIiRwYXN0X3JlZiIgIiRhYmlfZXJyb3JfbG9n
IiAiJEAiCiB9CiAK
--00000000000085ee3a065c93a6a5--
