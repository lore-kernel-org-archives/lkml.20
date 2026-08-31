Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA43B47FD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200703; cv=pass; b=AERoqRn8iFqQh5AQ2J3kGwfQPjkxQArbR9rwDNil7SfC6pNhZ3Jak6uTplZP8FINxYKZg0gEDTObx6XEaGQkQH1A586THOflij/RC2o4vmHPDV2xGGv4kFUXk9FAZkuQyYNL3Qr88FebqGs+7G6ipyJX+p4QntQZL3qNnijnIrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200703; c=relaxed/simple;
	bh=6r+BJPWVERiNLMS1CKAwGPYLRJVbPK90B4onWQeT+qY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oYeDkyZNSClS1RMh5JMdQfep8zEc8Lk/NOEBBCyi4u1khoc8cgJLVMd3XxMZUvIdLxAawzqost8YatXZ6dVVv/ady6Rrcdl5bcFmTq2W/klKPht8QModYka+wPVbx9PmCAeVE9eXDE0Y2uYGatW6kzUftBYA2ur6GCGhh4d3Y6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=recall.ai; spf=pass smtp.mailfrom=recall.ai; dkim=pass (2048-bit key) header.d=recall.ai header.i=@recall.ai header.b=RO5Z2t8G; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=recall.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=recall.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=recall.ai header.i=@recall.ai header.b="RO5Z2t8G"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2579462a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788200701; cv=none;
        d=google.com; s=arc-20260327;
        b=eJ3+RnolZuyk3FhOn4VjGImb1xfJw4gDV6pfRwB9Z5OHtr7EWxCjyNPXkv+eTT0TSY
         t33dPXabrnP4zXa3YQJ416x2Ae87yKyWdScl39gmEaklMJJqNYofXqfxMzVfqXcofvUc
         cyTXvh2Z1INbwSS++Y8iiuCDIx2KZUuFzRnuixMimCO8h+/6qqzgTR/XJhUinX4Y+ZO6
         wZsA+lAWmG75IIt2Xr3qrjVB7lLg4rxydQxb75GezbYR5lY0QELl6r4bwu2HbgtFdVPv
         ANqsP8js7IpYpgM5nbWiGP4wEnJ6xp7ExPQ+nKh+hNGcZpFc7ecwYaiMwYIgWgJUGlyo
         IgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hbV5Wg8l0nJ8T1Mygha+CfNYcTHfR/M+eEDDy9eLWnc=;
        fh=vQXvw7WiGQ9ewuzNBl3WVswNmgKGxBJw4lbk1Bw2FSk=;
        b=HS/RKoQ+Kkd79QkUad8R+AdB0bkQoXkjZ4zOpDEYzVxfOt2mgooNzLQgZp4CfsDrMo
         ES5+w2fyykaNj+OxCs8iFLaPYajFJZDSyp1TrINbB5A4xJK24HKz9H/WyTdp4a2eyBgH
         yVnd+WaXqRfZRbAHRMsT1JUte0SMWQEYeYfUDyNrkcqlEy0YGONhO0w+mly80AbFblvL
         au6HDfwWDYTJm4SDehH9Q9FvhUIhpL01/z4Pa2HQnf4EPNQTRL9jLvoJfIP2FUltideH
         hfFzQpRolrU0yIjDw/4MQ3d/FQXdBCLdkLyQRAj1f9RB1ZR3UeSwAQy3OtK+nLXbQJNT
         8YPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=recall.ai; s=google; t=1788200701; x=1788805501; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbV5Wg8l0nJ8T1Mygha+CfNYcTHfR/M+eEDDy9eLWnc=;
        b=RO5Z2t8G3WWpA8luZIKNu/Ipdq6dSO2j7V9756tbtBDVMZS0ECAeB+SDeBXrQk2cVg
         KXVNx9IQZ04A/L0OukbqoQuaruRlilhLjhzOeIBEPr10T9OqdZFTn7Xb8LcyIFN+1kfY
         vhloeB1b/9tge2bqfYi2NPmFyL0CkY3eGA1Iq4/63t1OkDfoS9DDHne11NYmk4yActhT
         kn3BaSq5QjPQOmhuThA83jfe/MxlxppxCAFEpvwZ5kLdizKdDEsIuf65gAJ7NBjbVcNT
         xml92uSyYnVX8pOeuK8AuRytHmhaWdMk6TskVqEA2JuP7KAObYMhrxWNasAjBHZafGLe
         xcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200701; x=1788805501;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbV5Wg8l0nJ8T1Mygha+CfNYcTHfR/M+eEDDy9eLWnc=;
        b=fMtQtQzCIfL8flM3eaS5rFSJ+8h1cEDfct0s1Eae0622muHIY32YrmtbZWfE4tlrRw
         h9uydwHvyLf4c6bRqi1OlafhPoRsVrO2Kot/0Grir+EHlx/5F83GSCtL3CLxWXytIDeF
         9Xn9+mKEFuRC3+Br90Y0nZmdqmIO99TiEyuWlDNKJvWDeMpEabllsl2dms9PRidvDEmk
         Qnux/9/m7iha32vHCnG3nn1tc+xyaUHawyN6eqyV6dBKGCQ63896WHDSk6MRsPXvXsUq
         rarGmVBmJVBf8GoUAuiBm4Fr/b33zDlbWiplEpcb6GsXHVa6VmWes8Um3UgQtlTww2f+
         QKvw==
X-Gm-Message-State: AFuF++nIWUyMe3anr1/pPmEFEBU3W1BK5ed67BfS48rvHvnXZLCjE6Zv
	Eti0ZOY7q/gdAbmus3gRronpnA9E6HPFKrvp5Vqdbb9t3eAx+DGxO6uy+/6Uhn0+s2gtx3iblEN
	9xC3B7p9GKZJOfbAoeqk1ufTj/QumNxfMdXfIIBLfNXDUvPRoX27EnuWAsN9S
X-Gm-Gg: AR+sD12iEBSq4mWwDbVFGaA4muHUhBFrQUQjgCd1+mEsUsSxhIB/JrD5OyRUoZGyIVK
	XHx4xnTgCzCj6IrtfxKCUXV7AeTi+a85SAZ81knXlIbpaE+/Ck26naNvsyca3E+rWa5eMLUcFL1
	Yb6mR/RwvF2Roo0Sti9Y4UDvfbLI70DtxcdClvncZGQXyOmQDamfq7efhfoD7yHiMlBIchNxKKq
	JK1WcsE7vE0yta/npKEpx4mKMlWVcEH8H5ttfG+jFjRf5YC9YEjpCRNlp2WcvM2JI3txG41B3i9
	W7WbVUpmZ51NvFOHVl+z/PdCSs4ISuktAsGE6UeaetDcVw==
X-Received: by 2002:a05:6a21:700d:b0:3d3:b00a:7082 with SMTP id
 adf61e73a8af0-3d3b00a77a9mr34040179637.28.1788200700253; Mon, 31 Aug 2026
 11:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mike Kaplinskiy <mike@recall.ai>
Date: Mon, 31 Aug 2026 11:24:48 -0700
X-Gm-Features: AcwNN1V4UKSJdBYkgpssMkmifC2j4_SqBsHSkI7X8KbOD1NWjz0zJyXnc6Ib_f0
Message-ID: <CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com>
Subject: [BUG/RFC] mm/madvise: MADV_WILLNEED skips swapped file-backed COW pages
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com
Content-Type: multipart/mixed; boundary="00000000000086d436065a5beb9a"

--00000000000086d436065a5beb9a
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing a strange behavior when using MADV_WILLNEED to schedule
swap page-in. It seems MADV_WILLNEED does not schedule swap reads for
swapped-out COW pages in an ordinary file-backed MAP_PRIVATE mapping.

I reproduced this on Linux 7.0.14 on aarch64, but I think this code
hasn't changed in a while. mm/madvise.c:madvise_willneed walks swap
PTEs only when vma->vm_file is NULL, and sends other file-backed
mappings to vfs_fadvise(POSIX_FADV_WILLNEED). This skips the case of
MAP_PRIVATE mappings with changes, which frequently happens for
libraries/binaries with relocations and/or writable globals.

The code is at the top of
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/madvise.c#n282
.

Minimal reproducer attached. Would there be interest in changing this
path to prefetch private copies in addition to the readahead?

Thanks,
Mike

--00000000000086d436065a5beb9a
Content-Type: text/x-csrc; charset="US-ASCII"; name="madvise-willneed-cow-repro.c"
Content-Disposition: attachment; filename="madvise-willneed-cow-repro.c"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

I2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8YXNzZXJ0Lmg+CiNpbmNsdWRlIDxmY250bC5o
PgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5n
Lmg+CiNpbmNsdWRlIDxzeXMvbW1hbi5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojZGVmaW5lIFNJ
WkUgKDY0VUwgPDwgMjApCgpzdGF0aWMgc2l6ZV90IHN3YXBfa2liKHZvaWQgKm1hcHBpbmcpCnsK
CUZJTEUgKmYgPSBmb3BlbigiL3Byb2Mvc2VsZi9zbWFwcyIsICJyIik7CgljaGFyIGxpbmVbMjU2
XSwgcGVybXNbNV07Cgl1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQsIHZhbHVlID0gMDsKCWludCBv
dXJzID0gMDsKCglhc3NlcnQoZik7Cgl3aGlsZSAoZmdldHMobGluZSwgc2l6ZW9mKGxpbmUpLCBm
KSkgewoJCWlmIChzc2NhbmYobGluZSwgIiVseC0lbHggJTRzIiwgJnN0YXJ0LCAmZW5kLCBwZXJt
cykgPT0gMykKCQkJb3VycyA9IHN0YXJ0ID09ICh1bnNpZ25lZCBsb25nKW1hcHBpbmc7CgkJZWxz
ZSBpZiAob3VycyAmJiBzc2NhbmYobGluZSwgIlN3YXA6ICVsdSBrQiIsICZ2YWx1ZSkgPT0gMSkK
CQkJYnJlYWs7Cgl9CglmY2xvc2UoZik7CglyZXR1cm4gdmFsdWU7Cn0KCnN0YXRpYyB1bnNpZ25l
ZCBsb25nIHBzd3Bpbih2b2lkKQp7CglGSUxFICpmID0gZm9wZW4oIi9wcm9jL3Ztc3RhdCIsICJy
Iik7CgljaGFyIG5hbWVbMzJdOwoJdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7CgoJYXNzZXJ0KGYp
OwoJd2hpbGUgKGZzY2FuZihmLCAiJTMxcyAlbHUiLCBuYW1lLCAmdmFsdWUpID09IDIpCgkJaWYg
KCFzdHJjbXAobmFtZSwgInBzd3BpbiIpKQoJCQlicmVhazsKCWZjbG9zZShmKTsKCXJldHVybiB2
YWx1ZTsKfQoKaW50IG1haW4odm9pZCkKewoJY2hhciBwYXRoW10gPSAiL3RtcC9tYWR2aXNlLWNv
dy1YWFhYWFgiOwoJaW50IGZkID0gbWtzdGVtcChwYXRoKTsKCWNoYXIgKnA7Cgl1bnNpZ25lZCBs
b25nIGJlZm9yZTsKCXZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgc3VtID0gMDsKCglhc3NlcnQoZmQg
Pj0gMCAmJiAhZnRydW5jYXRlKGZkLCBTSVpFKSk7CglwID0gbW1hcChOVUxMLCBTSVpFLCBQUk9U
X1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfUFJJVkFURSwgZmQsIDApOwoJYXNzZXJ0KHAgIT0gTUFQ
X0ZBSUxFRCk7Cgl1bmxpbmsocGF0aCk7CgoJZm9yIChzaXplX3QgaSA9IDA7IGkgPCBTSVpFOyBp
ICs9IGdldHBhZ2VzaXplKCkpCgkJcFtpXSA9IGkgLyBnZXRwYWdlc2l6ZSgpICsgMTsgLyogY3Jl
YXRlIHByaXZhdGUgQ09XIHBhZ2VzICovCglhc3NlcnQoIW1hZHZpc2UocCwgU0laRSwgTUFEVl9Q
QUdFT1VUKSk7Cgl1c2xlZXAoNTAwMDAwKTsKCXByaW50ZigiYWZ0ZXIgUEFHRU9VVDogIFN3YXA9
JXp1IGtCXG4iLCBzd2FwX2tpYihwKSk7CgoJYmVmb3JlID0gcHN3cGluKCk7Cglhc3NlcnQoIW1h
ZHZpc2UocCwgU0laRSwgTUFEVl9XSUxMTkVFRCkpOwoJc2xlZXAoMik7IC8qIFdJTExORUVEIGlz
IGFzeW5jaHJvbm91cyAqLwoJcHJpbnRmKCJhZnRlciBXSUxMTkVFRDogU3dhcD0lenUga0IsIHBz
d3Bpbj0rJWx1XG4iLAoJICAgICAgIHN3YXBfa2liKHApLCBwc3dwaW4oKSAtIGJlZm9yZSk7CgoJ
YmVmb3JlID0gcHN3cGluKCk7Cglmb3IgKHNpemVfdCBpID0gMDsgaSA8IFNJWkU7IGkgKz0gZ2V0
cGFnZXNpemUoKSkKCQlzdW0gKz0gcFtpXTsKCXByaW50ZigiYWZ0ZXIgdG91Y2g6ICAgIHBzd3Bp
bj0rJWx1IChzdW09JWx1KVxuIiwKCSAgICAgICBwc3dwaW4oKSAtIGJlZm9yZSwgc3VtKTsKfQo=
--00000000000086d436065a5beb9a--
