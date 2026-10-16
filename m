Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5653E4112
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136336; cv=none; b=DfI7TWyMQ1equPVkFJ+l/iMkRAQNGeWZnSqfJokC5CnWssPEDSGh8oF9jJVxK1c7HcrVq3xOGuwNhP8XiYbJrTMXNN5fnAZaOhurE08+fhUk6365T6Zz87oqIrirKOIu5WEwIG9DO/QASIAmY7Rn0+bkDmBqnjg+aZVHT2u2+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136336; c=relaxed/simple;
	bh=y//couFlBXNz2/Zxu6hfeHUs70BmA157+for+pnBQo8=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Date:Subject; b=T+pp48TrMCmiU2dUQiwqayaCe85RV4Oat/cApO8xN4tjJo1Q3iAkfw4+s8Y7pCOGOUBpRZMFLj1+nFkJ04IdCnAh5GIeCxjrSul45mCEgXrF1FH1Gi4h98eT/cM8kMffDYlx0IJTXSIUHlypph4eyiGp9Bij0ANVHfnI6uX9od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3wCbKsG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3wCbKsG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so4575924a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136334; x=1792741134; darn=vger.kernel.org;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y//couFlBXNz2/Zxu6hfeHUs70BmA157+for+pnBQo8=;
        b=D3wCbKsGMDvfx/3te1VZX+4l/qY9USM1pezuHxb9YGNQXYlBF/VMVonIBZ5CR6g2TD
         AmQT7iGLjVfHil406Kk0cpFs4Lo9ONqvVtkU+CzhfRlm0G0pH/z7/EtaYPb2+D0XSsB/
         2NlL/5gLFzcYTAA/mKc6llrPmjJ51rDzvt8kpgCmYBS/WkWvrj10zWHnGTMWK5Evgbmv
         6YRwTMNmjcLae19e0+26kRHXqw7G8iOH2tshqqm5zLMCK46g3/aEw9Ci+d14zksXMODZ
         YdsyOalpofZcSqh0ElMFNP3sVTtwIJLxYwjcOheBCNgkhGC2m+OVmHIoHsjijUeLgoFy
         5arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136334; x=1792741134;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y//couFlBXNz2/Zxu6hfeHUs70BmA157+for+pnBQo8=;
        b=p7DjuVQ0lw/vSlLOyzYAi6H4XBc7uvfie0ERGj8CqFUgk1ywP+C350uaZNwS4/mgQZ
         WWYOw/N6rgLOhB4/qxAXCxaouJiIpe4AuJtNgRBUUlCTBJ6d0H/sjUl3LNkRfqOJignF
         UToru75wsZDgvlwQR9P8XsIvRa/4wFNlzyv1EJeBpbil38CUBKPs96TOBNAT/ReXREtq
         Y8sBiiqiM7g6cW7J4J1o5eCbtiua92bnsKOUCI4pglXfPzjt3kjyRcpx+3drfk8m5oB4
         qR8lKGeW0I6ISbN11j1kaMuRuSIHumJlz80mGoCn2knIlUI99iqA3YlQv94FZzVSxlwL
         7o4Q==
X-Gm-Message-State: AFq9FYLEkQolAD9uN8m8PWX61TjilgEGFipYj1dQ0h3XjcCHKo0mb1XU
	406NqmS+sW0ak7xvsVilxR7HUHXDiuQf0fs7LvhLSmK9ZleAZuUZX5T5
X-Gm-Gg: AYBFou2vOy3mTDWToT6KHp2+nbP4F7lk7NZRgLF68NtEY/rV9i78srCzYqfRoKpfZHf
	VXaGmRxcBmsmrkh1eba8dtRIfAcbrUxEkj0QST0XZyn50IfMZcK+bihTJpcc0wanuXocc59/PxV
	xK/TAv9ufGbjwvL0kAsmx13DyKq0bBiaHJDk5dL2G+ns+7sssTz/UaYVni1fka9Z3yd4dDAr8Uc
	Rn5dtS+JzZLDsQ3DNbCfIdtqPERKr7mbTVmE1wNmywo1hQ7LvO8dzmygseOtOdrYrcBhMKUsX6Y
	pt7LdbJD/eJHAqNl1lo8mYqG0zEe8jIlva40/j5FRJp6dxVySOVGivdW1oigRC4YGvlmK9IS26V
	dZOkkpSYpMBqPpU9czUHSDf3Po4V7Si8Wli2cxka26HS6EWdDBLJprFLg0z5WHnBtn3/oV6my4c
	AYYgHD7fSyJ92eDn9u8sb5fOb1UNn2yQI85VznJQZQuRfdhLbpJVM7+VjPi/rE/+SvFsvn0AKVS
	w7kQQ==
X-Received: by 2002:a17:90b:1c87:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3abd26bc3demr18665534a91.11.1792136334072;
        Fri, 16 Oct 2026 00:38:54 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a249f3sm705405a12.27.2026.10.16.00.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:38:53 -0700 (PDT)
Message-ID: <6ad1d48d.a461c41f.282b8.7a97@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Haoran Wang <haoranwangsec@gmail.com>
To: rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, haoranwangsec@gmail.com
Date: Fri, 16 Oct 2026 15:38:49 +0800
Subject: [PATCH] tracing: reject trace events with an empty TP_STRUCT__entry

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9yYW4gV2FuZyA8aGFvcmFud2FuZ3NlY0BnbWFpbC5jb20+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMTU6MTA6MDAgKzA4MDAKU3ViamVjdDogW1BBVENIXSB0
cmFjaW5nOiByZWplY3QgdHJhY2UgZXZlbnRzIHdpdGggYW4gZW1wdHkgVFBfU1RSVUNUX19lbnRy
eQoKdHJhY2VfZXZlbnRfZ2V0X29mZnNldHMoKSB1bmNvbmRpdGlvbmFsbHkgZGVyZWZlcmVuY2Vz
IHRoZSBmaXJzdCBlbnRyeSBvZgphbiBldmVudCBjbGFzcydzIGZpZWxkcyBsaXN0IHRocm91Z2gg
bGlzdF9maXJzdF9lbnRyeSgpLiAgQSB0cmFjZXBvaW50CnRoYXQgZGVjbGFyZXMgYW4gZW1wdHkg
VFBfU1RSVUNUX19lbnRyeSBuZXZlciBwb3B1bGF0ZXMgdGhhdCBsaXN0LiBJdHMKZmllbGRzX2Fy
cmF5IGhvbGRzIG9ubHkgdGhlIHRlcm1pbmF0aW5nIHNlbnRpbmVsLCBzbyBsaXN0X2ZpcnN0X2Vu
dHJ5KCkKcmV0dXJucyB0aGUgbGlzdCBoZWFkIGl0c2VsZiBhbmQgdGhlIGZvbGxvd2luZyB0YWls
LT5vZmZzZXQgKyB0YWlsLT5zaXplCnJlYWRzIG1lbW9yeSBwYXN0IHN0cnVjdCB0cmFjZV9ldmVu
dF9jbGFzcy4gIFRoZSBjb3JydXB0ZWQgcmVzdWx0IGlzCnRoZW4gdXNlZCBhcyB0aGUgQlBGIGNv
bnRleHQtc2l6ZSBib3VuZCBpbiBfX3BlcmZfZXZlbnRfc2V0X2JwZl9wcm9nKCksCndoaWNoIGxl
dHMgY29udGV4dC1yZWFkaW5nIEJQRiBwcm9ncmFtcyBhdHRhY2ggdG8gYSB6ZXJvLWZpZWxkIHRy
YWNlcG9pbnQKd2hlbiB0aGV5IHNob3VsZCBiZSByZWplY3RlZCB3aXRoIC1FQUNDRVMuCgpSZWpl
Y3Qgc3VjaCBldmVudHMgYXQgcmVnaXN0cmF0aW9uIGNhbiBmaXggdGhpcyBidWcuIGV2ZW50X2lu
aXQoKSBpcyB0aGUKdW5pdmVyc2FsIGNob2tlcG9pbnQgaW52b2tlZCBmb3IgYm90aCBlYXJseS1i
b290IGFuZCBtb2R1bGUgZXZlbnRzLCBhbmQKaXRzIHJldHVybiBpcyBlbmZvcmNlZCBieSBfX3Jl
Z2lzdGVyX2V2ZW50KCksIHdoaWNoIHJlZnVzZXMgdG8gYWRkIHRoZSBjYWxsCnRvIGZ0cmFjZV9l
dmVudHMuICBBbiBldmVudCB3aG9zZSBmaWVsZHNfYXJyYXlbMF0udHlwZSBpcyBOVUxMICh0aGUK
ZW1wdHktVFBfU1RSVUNUX19lbnRyeSBzZW50aW5lbCkgaXMgcmVqZWN0ZWQgd2l0aCAtRUlOVkFM
IGJlZm9yZQp0cmFjZV9ldmVudF9nZXRfb2Zmc2V0cygpIGNhbiBiZSByZWFjaGVkLiAgRHluYW1p
YyBldmVudHMsIHdoaWNoIGNhcnJ5CnRoZSBUUkFDRV9GVU5DVElPTl9UWVBFIG1hcmtlciBpbiBm
aWVsZHNfYXJyYXlbMF0udHlwZSBhbmQgcG9wdWxhdGUgdGhlCmZpZWxkcyBsaXN0IGxhemlseSB0
aHJvdWdoIGEgZGVmaW5lX2ZpZWxkcyBjYWxsYmFjaywgYXJlIHVuYWZmZWN0ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBIYW9yYW4gV2FuZyA8aGFvcmFud2FuZ3NlY0BnbWFpbC5jb20+Ci0tLQoga2VybmVs
L3RyYWNlL3RyYWNlX2V2ZW50cy5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC90cmFjZS90cmFjZV9ldmVudHMuYyBiL2tlcm5l
bC90cmFjZS90cmFjZV9ldmVudHMuYwotLS0gYS9rZXJuZWwvdHJhY2UvdHJhY2VfZXZlbnRzLmMK
KysrIGIva2VybmVsL3RyYWNlL3RyYWNlX2V2ZW50cy5jCkBAIC0zMjc5LDYgKzMyNzksMTEgQEAg
c3RhdGljIGludCBldmVudF9pbml0KHN0cnVjdCB0cmFjZV9ldmVudF9jYWxsICpjYWxsKQogCWlm
IChXQVJOX09OKCFuYW1lKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwlpZiAoY2FsbC0+Y2xhc3Mt
PmZpZWxkc19hcnJheSAmJgorCSAgICAhY2FsbC0+Y2xhc3MtPmZpZWxkc19hcnJheVswXS50eXBl
ICYmCisJICAgICFjYWxsLT5jbGFzcy0+Z2V0X2ZpZWxkcykKKwkJcmV0dXJuIC1FSU5WQUw7CisK
IAlpZiAoY2FsbC0+Y2xhc3MtPnJhd19pbml0KSB7CiAJCXJldCA9IGNhbGwtPmNsYXNzLT5yYXdf
aW5pdChjYWxsKTsKIAkJaWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FTk9TWVMpCi0tIAoyLjQzLjAK
