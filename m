Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786572;
	b=YXVNwp6p2qVaFCaVFFRR7chIn9BZ6PNmCIvKSwF8BsRsktx1zOvu8HGNMjdwWvrzUmJB
	 rSftEs0oq5j9pApSh/Ljii0F84u8v5nHo6lwuyNjZ7OF8jvd1excX+JBxR6R1dl9Pthgi
	 tmvBA88H6ZKGujrVJeq009N9Cobrg5qNMzPqkarYhJZ8DBJUfxoOABGnXEnmoEA/e3tjm
	 Q+eTHmhTk9t6ntR9p8cX/WFIZn2+p4rlW6XiejHNAGt2A0L+t33yjkDicTD4nj/+NrKCu
	 LmrE6Vgs6KXZttmlfb0gvD0kqzR7milU4yxPKQOLRCtqvek2ogb9ms5S+uK2dcTZQ3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
	b=H2wA0PL855gVgIEK0osXV+wjJtv6p2Q98Jt9sN6A7FpQt0JnrAYvTyywIOcLdNE5fF8s
	 FRI07QYX9LcCo/Z+hTntpbCQAi5PTF2bgEsqVHBo21tZXGIXLBkU94VrupFbiO5klpzlJ
	 kaVmut+4UYHxi7Tj8ZeT3ZOWIYUlYJ39uE+0D5Mowy4/z/sJFhQT7uwBgqFo0AxfvHhqa
	 C3yU3WNQZ/CgsmZpi6DqcgMUJ/3JEkHEI7Voc0BbXNNWCSKNCAT9YTC41vOtVxRtxJmgS
	 hmhU1sXW89JJHInAGaIEptaloCUEarvyzDt/+IoIMC0Yv5H5g/z7FKw8VSj6KsrGYsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KrxN+6o4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FE606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E4FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KrxN+6o4
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed08b07213so1898485ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786571; cv=none;
        d=google.com; s=arc-20260327;
        b=sUXxvpQCaaiGO059CopQnhdfQSULHwwZ/jnSLdN9bLPttPDLzGpI2uHwnAe980ZbdG
         8Mn03v1xu/ZOwMDk1Ranqnahbd3A1i05bYXzozCORX6e+liKNX9ODGihDBc7iWbEVoHo
         KLLZpRYDFa6Ve1X2a1v3TfMOUQJPO8EgCgTNyN0AZyApQHrRSG0/ZbkZ+b6jt0eiR5Bs
         Xhyg9F0EaCQ32Y6JJEJFJ2M/sD+pHM8funcJVEYqg5ayVATBZKlEMkvlL1nFsxPxbQAM
         3uNtDkxf7SicCzNpjyHD5lWge6PIpHb7tohWPRCQVXznDQ5sP2L2Fc7wbkwQwzn2Zdfo
         dHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        fh=cZy1ik4o4Qwpkn6J9qjoLEIEuWDTts0y6zn6S2lGBzE=;
        b=ay3RYy8EepIK3okaINHyx70DqWKmtAHLXYVaJ7S+dbSbXhBw5XFMk+htVvL82t00iR
         w3JuaF252joYZSXldWXmwOm7fBWq0uqoQY/yL4VvOtXvqVlBYA1pCf7vputwusEbRCDe
         t+9vceVGMpzIGroFXL/YGZJiHa0Pj+Az9KfBayFlgPGlkZREqkyHVyMqDX6GfEZ9cbGc
         Uwh3cCm/2p9VgjoBxDFLYo+5dRlXkm9n9VwPnm9YugpZtwgzwjBla/ynn+iWM+CurBVD
         hPTgXIuSKTywpfll2ISA4hmq3Lw6FgZaaNNskV7w7rL5QDfUaAqauEmJlIV6VRmATkwY
         XVQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786571; x=1794391371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        b=KrxN+6o4IHY8RNtTcSiHD3iTj+yXo4Ls2jKgMMBGBL7DoQnuJWjkAGjJcV9bjsd037
         M5c/+Thb1cbOAkimPzeEJXYebN8rwUASzz19nWNdLtse+M0mot25EstNZZjI9Illn4Pr
         96peABaQWwfIJ72R+bUs5trcyCSktfugpC0Pm7CdFXeTcPzVaxTCwxh3QGPzshxYZ5Rt
         dROJSdpCGAPG/02WSHf0snb9LX2zkBeqsutxKhFxukRwKwv3YtLPx0NFuNqMQKtr/gmz
         uYK2IYs1skgjhqQgxJ/pGwuVXf0o6fEehugHzH3BYWPobmaBQGVUvKWX6C63+iX1j8Qk
         sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786571; x=1794391371;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        b=z/Z2af8voKjp4UeiT6UDcvvcSeyPAA2RhRhaOU2565waQ22TCM7TXkLEhr1MqMMwyJ
         aujyRLKVj3Uy9b0Lza77Va2yRpfADE2PZOXkWUaPCZpRC+WUKYQujbIf8jQ0kUYPlOOQ
         42Pg0Y4vri6ondD0/AS08y65a1jVFsXIots/NuYddT1/51Qb6/dArdytfuRM2cQzrKcn
         A7EYeoYnfuLkn5diNv++EVk6IcUsx0DiU/qopykV1up3mOhp9NMVvCZwZKi3zMJAx4VM
         zmUmiyF67zAwznp59a1TIICtCSr5qyE3BUVxAxOBPchfaNOTOr4tp6gAesJ9vj1b154y
         JiLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQhLhoycaUMBIFLLw/XwZn8v26TXrP/vPEVgfdpyY0WfSfCzMG+qva+WCI1xoUoeZtSQgpvwnKKZujVgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aPzzpfwzMcoTZRlSvoEj08VQU1PBh9vxsaZDSfqfpxP1idQIh
	Hid0RsmXitm/5woAEE+FI/uBH6/8rc605WZ6VwyPN0YFP2Rl/vRhWkdbHEeC5HtFj67KHV+ZALp
	2igrWC21MpA/1tyDCJ8druTKHB6eSEtUFIUPg
X-Gm-Gg: AYBFou3WGfyvax2De+8gGCpundMQZ11ld00/Xe9i/O2W4FBZjinh6EonK3TD7fhsiyS
	9oELO5LVbjY8MQCLNZCG/iBzCcn3F9jIO9/HAHn4z8n4Y5muy59cX1e5GQ23AuLXaFjRZA6Bm2Z
	DFCSLAU8HbN07sdYvPHeeFrVnzIzijpR9W0lbRcjDWsY0JqQcob41q0Aq6+ELomTcUUpojnF9K6
	gx55VX+lAKAhb4M70FA7PtKr/XvsgVivL4S1BMHn6wiBXgaEsrTtNaGH0B7mpuGvf1agWEa8yG1
	d2P++bibJgfaglk1xPTF+lR0j/gX+xDoXIYVPs1Zfx4w1rptmbpY7c1QR/dsGcnav/FRich1wk+
	tzBYAc/knV3Mz7uq7psJ1LcHsyGhYTIUHkK2I5ImtcPMOt7aMGxByxBuFSUbcZSWnxw==
X-Received: by 2002:a17:903:2a86:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2ed0acbcedfmr13163315ad.32.1793786571396; Wed, 04 Nov 2026
 02:02:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 02:02:49 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 02:02:49 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Pavel Zun <pavel.zun@gmail.com>
Date: Wed, 4 Nov 2026 02:02:49 -0800
X-Gm-Features: AclHuK-HMpmke_qng3LB-Hx29bUBWQIyqvZYp6J0_LRzwul-CpSli9OzlMcV_0U
Message-ID: <CADEvP=2NtUENNJyNeE3i1jqV56tTtL5x14fwE=1tFu_qqozBzQ@mail.gmail.com>
Subject: [RFC PATCH RESEND] fs/ntfs3: avoid recursive MFT bitmap locking for
 external attributes (patch attachment)
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006431bf065f707beb"

--0000000000006431bf065f707beb
Content-Type: text/plain; charset="UTF-8"

The previous resend reached the lists, but Gmail wrapped a long diff
header during outbound delivery. The attached patch preserves the
original diff bytes. The proposed change and RFC notes are unchanged.

Sorry for the mail-format noise.

--0000000000006431bf065f707beb
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-fs-ntfs3-avoid-recursive-MFT-bitmap-locking.patch"
Content-Disposition: attachment; 
	filename="0001-fs-ntfs3-avoid-recursive-MFT-bitmap-locking.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 77810fb52e3477ba_0.1

RnJvbTogUGF2ZWwgWnVuIDxwYXZlbC56dW5AZ21haWwuY29tPgpUbzogYWxtYXouYWxleGFuZHJv
dmljaEBwYXJhZ29uLXNvZnR3YXJlLmNvbQpDYzogbnRmczNAbGlzdHMubGludXguZGV2LCBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnClN1YmplY3Q6IFtSRkMgUEFUQ0ggUkVTRU5EXSBmcy9u
dGZzMzogYXZvaWQgcmVjdXJzaXZlIE1GVCBiaXRtYXAgbG9ja2luZyBmb3IgZXh0ZXJuYWwgYXR0
cmlidXRlcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKbnRmc19sb29rX2ZyZWVf
bWZ0KCkgaG9sZHMgdGhlIE1GVCBiaXRtYXAgd3JpdGUgbG9jayB3aGlsZSBleHRlbmRpbmcKJE1G
VC4gR3Jvd2luZyAkTUZUOjokQklUTUFQIGNhbiByZXF1aXJlIGFuIGV4dGVybmFsIGF0dHJpYnV0
ZSByZWNvcmQsCndoaWNoIG1ha2VzIG5pX2luc19hdHRyX2V4dCgpIGNhbGwgbnRmc19sb29rX2Zy
ZWVfbWZ0KCkgYWdhaW4uCgpuaV9pbnNfYXR0cl9leHQoKSBwYXNzZXMgaXNfbWZ0X2RhdGEgdG8g
dGhlIGFsbG9jYXRvciwgc28gdGhlIG5lc3RlZApjYWxsIGZvciBBVFRSX0JJVE1BUCB0YWtlcyB0
aGUgb3JkaW5hcnktZmlsZSBwYXRoIGFuZCBhdHRlbXB0cyB0bwphY3F1aXJlIHRoZSBzYW1lIHJ3
c2VtLiBUaGlzIGxlYXZlcyB0aGUgYWxsb2NhdGluZyB0YXNrIGJsb2NrZWQgb24KaXRzIG93biBs
b2NrIGFuZCBibG9ja3Mgb3RoZXIgdXNlcnMgb2YgdGhlIGZpbGVzeXN0ZW0gYmVoaW5kIGl0LgoK
VGhlIGZvbGxvd2luZyBzdGFjayB3YXMgb2JzZXJ2ZWQgb24gNy4xLjEzLTItTUFOSkFSTyBkdXJp
bmcgZmlsZQpjcmVhdGlvbiwgd2l0aCB0aGUgaHVuZy10YXNrIHJlcG9ydCBpZGVudGlmeWluZyB0
aGUgc2FtZSB0YXNrIGFzIHRoZQpsaWtlbHkgcndzZW0gb3duZXI6CgogIGRvd25fd3JpdGUKICBu
dGZzX2xvb2tfZnJlZV9tZnQrMHgxZTcKICBuaV9pbnNfYXR0cl9leHQrMHgxYWMKICBuaV9pbnNl
cnRfYXR0cgogIG5pX2luc2VydF9ub25yZXNpZGVudAogIGF0dHJfc2V0X3NpemVfZXgKICBudGZz
X2V4dGVuZF9tZnQrMHhlZgogIG50ZnNfbG9va19mcmVlX21mdCsweDI2MgogIG50ZnNfY3JlYXRl
X2lub2RlCgpEaXNhc3NlbWJseSBvZiB0aGUgbWF0Y2hpbmcgbnRmczMgbW9kdWxlIGlkZW50aWZp
ZXMgdGhlIGV4dGVuc2lvbiBhcwpBVFRSX0JJVE1BUCwgbm90IEFUVFJfREFUQS4KClBhc3MgaXNf
bWZ0IGluc3RlYWQuIFRoaXMgc2VsZWN0cyB0aGUgY2FsbGVyLWxvY2tlZCwgcmVzZXJ2ZWQtcmVj
b3JkCmFsbG9jYXRpb24gcGF0aCBmb3IgYWxsICRNRlQgYXR0cmlidXRlcywgbWF0Y2hpbmcgbmlf
Y3JlYXRlX2F0dHJfbGlzdCgpCmFuZCB0aGUgbnRmc19tYXJrX3JlY19mcmVlKCkgZXJyb3IgcGF0
aC4gS2VlcCBpc19tZnRfZGF0YSBmb3IgdGhlCnVubmFtZWQgJERBVEEgYm9vdHN0cmFwcGluZyBj
b25zdHJhaW50cywgd2hpY2ggZG8gbm90IGFwcGx5IHRvIEJJVE1BUC4KCkZpeGVzOiA0MzQyMzA2
ZjBmMGQgKCJmcy9udGZzMzogQWRkIGZpbGUgb3BlcmF0aW9ucyBhbmQgaW1wbGVtZW50YXRpb24i
KQotLS0KUkZDIG5vdGVzOgoKVGhpcyBpcyBhIHJlcXVlc3QgZm9yIHJldmlldyBvZiB0aGUgbG9j
a2luZy9yZWNvcmQtYWxsb2NhdGlvbiBmaXguCkkgaGF2ZSBub3QgeWV0IGJvb3RlZCBhIHBhdGNo
ZWQga2VybmVsIG9yIHJlcHJvZHVjZWQgdGhlIG9yaWdpbmFsCmZhaWx1cmUgb24gYSBkaXNwb3Nh
YmxlIE5URlMgaW1hZ2UuIFBsZWFzZSBkbyBub3QgdHJlYXQgdGhlIGZvbGxvd2luZwpob3N0LXNp
ZGUgY2hlY2tzIGFzIG5hdGl2ZSBmaWxlc3lzdGVtIHZhbGlkYXRpb24uCgpWYWxpZGF0aW9uIGNv
bXBsZXRlZCBvbiBtYWlubGluZSBhdAo3MzRiZWY1NDhhOTZlODc3NGQ2ZWVmNWRmYTIwMjZjNmVk
YzRlODBiIGFuZCBzdGFibGUgdjcuMS4xMzoKLSBDb21wbGV0ZSBmcy9udGZzMy8gb2JqZWN0IGJ1
aWxkcywgeDg2LTY0IGRlZmNvbmZpZyBwbHVzIE5URlMzLAogIFBPU0lYIEFDTCBhbmQgTFpYL1hQ
UkVTUywgR0NDIDE2LjIuMSwgVz0xOiBubyB3YXJuaW5ncy4KLSBBIGhvc3QgaGFybmVzcyBjb21w
aWxlZCB0aGUgYWN0dWFsIG5pX2luc19hdHRyX2V4dCgpLAogIG50ZnNfbG9va19mcmVlX21mdCgp
IGFuZCBudGZzX21hcmtfcmVjX2ZyZWUoKSBmdW5jdGlvbnMgd2l0aAogIGluc3RydW1lbnRlZCBs
b2NrL2JpdG1hcCBkZXBlbmRlbmNpZXMuIFNldmVuIHRhcmdldGVkIGNhc2VzIGRldGVjdAogIHJl
Y3Vyc2l2ZSBsb2NraW5nIGJlZm9yZSB0aGUgY2hhbmdlOyBhbGwgMTcgc2NlbmFyaW9zIHBhc3Mg
YWZ0ZXIgaXQuCiAgQ29udHJvbHMgY292ZXIgb3JkaW5hcnkgYWxsb2NhdGlvbnMsIERBVEEgYm9v
dHN0cmFwcGluZyBhbmQgY2xlYW51cC4KLSBjaGVja3BhdGNoIC0tc3RyaWN0IC0tbm8tc2lnbm9m
Zjogbm8gZXJyb3JzIG9yIHdhcm5pbmdzLgoKVGhlIGFmZmVjdGVkIG1vZHVsZSdzIGJ1aWxkIElE
IG1hdGNoZXMgdGhlIGh1bmctdGFzayB0cmFjZToKMWY2MDExMzUyZjE5NjE5NmQyNjYwNjkwMjM3
MDRmZGY2MTAzMDI0OC4gSXRzIGRpc2Fzc2VtYmx5IG1hcHMKbnRmc19leHRlbmRfbWZ0KzB4ZWYg
dG8gdGhlIEFUVFJfQklUTUFQIHJlc2l6ZSBjYWxsLCBhbmQgdGhlIGlubmVyCm50ZnNfbG9va19m
cmVlX21mdCsweDFlNyB0byB0aGUgcmVwZWF0ZWQgd3JpdGUtbG9jayBhY3F1aXNpdGlvbi4KVGhl
IG9yaWdpbmFsIGtlcm5lbCByZXBvcnRlZCB0YWludHMgUCBXIE8gRS4KClRoZSBpbnZlc3RpZ2F0
aW9uIGFuZCBwYXRjaCB3ZXJlIHByZXBhcmVkIHdpdGggQUkgYXNzaXN0YW5jZS4KVGhlIG9yaWdp
bmFsIHByb2R1Y3Rpb24gdm9sdW1lIHdhcyBub3QgdXNlZCBmb3IgZXhwZXJpbWVudGFsIHRlc3Rp
bmcuCkEgZGV0YWlsZWQgcmVwb3J0LCBzYW5pdGl6ZWQgdHJhY2UvZGlzYXNzZW1ibHkgYW5kIGhv
c3QgaGFybmVzcyBhcmUKYXZhaWxhYmxlIGZvciBmb2xsb3ctdXAuIFRoaXMgUkZDIGhhcyBubyBE
Q08gc2lnbi1vZmYgYW5kIGlzIGZvcgp0ZWNobmljYWwgZGlzY3Vzc2lvbiwgbm90IGEgcmVxdWVz
dCB0byBtZXJnZSBhcy1pcy4KCkRvZXMgdXNpbmcgdGhlIGV4aXN0aW5nIGlzX21mdCBhbGxvY2F0
aW9uIHBhdGggZm9yIEJJVE1BUCBtYXRjaCB0aGUKaW50ZW5kZWQgbG9ja2luZy9yZXNlcnZlZC1y
ZWNvcmQgY29udHJhY3QsIG9yIGlzIHRoZXJlIGFub3RoZXIgTUZUCmF0dHJpYnV0ZSBwYXRoIHRo
YXQgbmVlZHMgdG8gYmUgaGFuZGxlZCBiZWZvcmUgdGhpcyBpcyBzdWJtaXR0ZWQKZm9yIGluY2x1
c2lvbj8KCiBmcy9udGZzMy9mcmVjb3JkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9udGZzMy9mcmVjb3JkLmMg
Yi9mcy9udGZzMy9mcmVjb3JkLmMKaW5kZXggYmVhZDAxYTk1Li5hNGM2ZmEwMTkgMTAwNjQ0Ci0t
LSBhL2ZzL250ZnMzL2ZyZWNvcmQuYworKysgYi9mcy9udGZzMy9mcmVjb3JkLmMKQEAgLTEwMTks
NyArMTAxOSw3IEBAIHN0YXRpYyBpbnQgbmlfaW5zX2F0dHJfZXh0KHN0cnVjdCBudGZzX2lub2Rl
ICpuaSwgc3RydWN0IEFUVFJfTElTVF9FTlRSWSAqbGUsCiAKIGluc2VydF9leHQ6CiAJLyogV2Ug
aGF2ZSB0byBhbGxvY2F0ZSBhIG5ldyBjaGlsZCBzdWJyZWNvcmQuICovCi0JZXJyID0gbnRmc19s
b29rX2ZyZWVfbWZ0KHNiaSwgJnJubywgaXNfbWZ0X2RhdGEsIG5pLCAmbWkpOworCWVyciA9IG50
ZnNfbG9va19mcmVlX21mdChzYmksICZybm8sIGlzX21mdCwgbmksICZtaSk7CiAJaWYgKGVycikK
IAkJZ290byBvdXQ7CiAKLS0gCjIuNTUuMAoK
--0000000000006431bf065f707beb--
