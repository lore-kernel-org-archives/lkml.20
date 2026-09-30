Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB536F419
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739487; cv=pass; b=k4JLC6KTaThZiGO+WA58FeruKl5/Y80UB/vFlhom8kPTBWiSZE84fTxOCHXdysjlzf8QnoAiVQ6Poz3wGvAxqyMIBN3ZFVz1rx0ZscCVDpCwWuZhK2HfBnfgr8zCl/NgHRSPQc8x6fYxltazFGlTnJZcXiaaWoOtDp8n7S0RQj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739487; c=relaxed/simple;
	bh=yrPH5+9Fa98StjobtUiDayiS4Cf06izKvzRTp/usc0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qz5cnYTrskVYMZjYnuuuRBpSSV9hT8I8rJ/zRcGwAGenwNZPIUBufp8NaURWZeZTHINRw/HyB1n2i72EPVs0lZSzseaSd8pynmal6nhw19LwH9vxJnJcxJoKW2MINPuePgsG6f8un1z1/vmYB2LdtwoclVqHXONTaSurtCGJzus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5aV+GM1; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5aV+GM1"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so4451233c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790739485; cv=none;
        d=google.com; s=arc-20260327;
        b=OMxwXnMeeKpnGt2PpMk7O9OR2QEXQz3a5AfMWSciNhj+2QRUj5yvNxfuW1eDETK8NQ
         lZrNOcggwRhuGAa5Jck+/1jnHLJSYkDWEFgbVsMMCeW1SLdrs7STlH4TFhOH9nv0E0gw
         ZZqPjPWxHu3ZzQkMnCikcmvUJAw5klhvwvKc6hXrsFk8BRwCKnO0n2WXRfiXJ7+V8Mdp
         vZLMZwgeZ5efJXcjUy7uqGJPFh73oJgd+CIA7xq4IUmD/V9ZaixWDsMAD+xvstT3rda5
         wtjP4VCE/pD2R6OZ51KSPeLlEWOM3nQ3lcIACS71umvjfICbDAvLcLlL+8u24UU3Vvgi
         9teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+Hf5YnZpc1V7IGSMbtPymIkH7UZS8gGKRoIdelBrOCI=;
        fh=EgwnO/Q7gzhN8er7tZlc0ioRjIGPBYfEijDpp1LI2aU=;
        b=qMWWQoitLRi87KFFbN7JcsvSE6mdEXW0t1OVSyDfylZYg6FMJG3BGqZi0R8IevhqIz
         xjcY80Y+vLDJW4q7yTQwuP89GqM2l+AxThXyzouSVbz0y2Q0rmb0MCVU+gjr+2UAgwEO
         70Pui3To8i11cJYUa+8nm+j2p/xQz0ZDS4Kf4mu3yt8Fad6Ixo98plkUElqfmHEBLjxh
         1kCyOUneu2VFT/Vz0c7XE4gbNf0sNC2bkI2cPqjMEEP7cJB71vOEk0NTvzjnq8BnBIiH
         cQ5DFbbbtCSOdA9GcU+xcq0texjoYviVfNPZtMSTmv+ateyHljq0ZUOX0wHJogEIS+uU
         ji+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739485; x=1791344285; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Hf5YnZpc1V7IGSMbtPymIkH7UZS8gGKRoIdelBrOCI=;
        b=l5aV+GM11W7rHgtcC3ysLoWO6KXe7SGRsjY6WERGuVmoXqGG/mKS1r9MKVI92QelDd
         dHJMOrOXz4YOecGk3ZGy2rGHGEjKUs7mgqmZzI9R1YClutHKhKUXoyDAeuEeHvIFYMHi
         TrPdDobqTGV59Tgg8iook6mwmuAl6/wTTrg1lXeX3blXwGbMmalDI2AN05yWc8RXtyoo
         t+kzV2EAUhtp7as3QfJHLFBRd+RbJX86j97nLkcrHXcMdGDGw4X6PpZ3t3a2tv4OtMWq
         76SFKDRosXA2yME7f+gALCgOJJo21DkKctzOSsCSerm+Qel/uazTFNxb37SzcPzEfHZC
         xeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739485; x=1791344285;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Hf5YnZpc1V7IGSMbtPymIkH7UZS8gGKRoIdelBrOCI=;
        b=gVt1d3PaNiC98nuH9Lr86jY4xnMbHhCiOlqhvdUZ/3M2+IG4E1fUrNVU20hvoxnKu+
         biyZDRhvkqT8ZF+rlrjpFRn30Mos/q0JhhBdc4ujWMfHuOuTIP3vdiQE920QHRzVHnXI
         qboq3/FzP4NPSd0i/+vBELciF95CcB8UworClepGQRZLmoqhfH9sD8XPAp4Zq9qECEzG
         wDT/AIwFlTKRfW1pKaQstukVyXYPk1wrtAePumyUAKJS6SEldSIdvcdI8iMDcwQZ+4wf
         jJa52u1HjOEg8BPEuofpn4YKIosVgywZTPmFjHdNWxa2D2MgvoV8teKM8Y+Y2vii2Z6O
         FldQ==
X-Forwarded-Encrypted: i=1; AKwUvBzel7V4KKG3qPkH5mYwdZBmK6KFnEZyhbcaWT3bk23Tpt/B92lAnhdFOwIE8EYgti/aWaQoUUo4FVW88LY=@vger.kernel.org
X-Gm-Message-State: AFuF++n6zsV77OrqoIBu42V21nuLjf151aDQnBqX/1RnIab0BNor/zR+
	bjk31/P0vrjXev4+0l8+Cbp8gsArjo5gQQt8hMmdeS2jVeijCAmRTtbrDefP/U5o6Gza/Bw0Y1K
	wwHHBuxcmjDVF2Ic+9P9+Mq7RwvpoYlc=
X-Gm-Gg: AYBFou0v7aVTQGrhxUHc9yU/XLJ2q+PYL2oUsIJc4DJ21I4jc4mlvGvxKRCCK7G69Yk
	5ZX/WmSLvWq4xXBqVzIJ1uUqPySX4SBVqhLIXaRF46h+bDDKyEMellwjiXBh3aqPN0o1KG0RYo5
	cZV3QOhnyuUOxxZCP4kTo3YUlfBXx2Iq3TvSFSjUwL3unkdeSvcdax6MGe5jX1XpZfGDeSD+N8A
	sOsaGVm8Hc3A/b2V5zo9woCX6IEtIwQJQt2TorRYsPV3gOOayppT1PR2foMYnVYPOMmSB1OMv1K
	+IG9GaSkZte9oJ1JsxgW8KfUaGTkrLiLk04BvEcAIvWafZjhReHeyUtc
X-Received: by 2002:a05:701b:420d:10b0:148:4d6c:2018 with SMTP id
 a92af1059eb24-14c9ec43b4emr1371468c88.22.1790739485046; Tue, 29 Sep 2026
 20:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: binglei wang <l3b2w1@gmail.com>
Date: Wed, 30 Sep 2026 11:37:53 +0800
X-Gm-Features: AclHuK8mhsClsok-OH4eVXMSpnBvvb4uhzTatcayPdIhb6tlYUz196i8X08PhQU
Message-ID: <CAJ3C4KySUqKevOBn=CROzsWkaLdK_X241oLFXO26FKBVq73QJg@mail.gmail.com>
Subject: [PATCH] erofs: fix folio reuse from a different address_space in erofs_bread()
To: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org
Cc: zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	hongbohbli@tencent.com, guochunhai@vivo.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000e4ae4c065cab0633"

--000000000000e4ae4c065cab0633
Content-Type: text/plain; charset="UTF-8"

erofs_bread() caches the last folio in struct erofs_buf and reuses it when
the next request lands on the same folio, but the reuse predicate only
compares the page index; it never checks that the cached folio still
belongs to buf->mapping.  Correctness therefore relies on an invariant
that is nowhere enforced.

fs/erofs/xattr.c already breaks it: erofs_xattr_iter_inline() and
erofs_xattr_iter_shared() call erofs_init_metabuf() on the same buffer
with no intervening erofs_put_metabuf(), and their in_metabox arguments
come from different sources (per-inode vs per-fs).  When the two differ,
buf->mapping is switched while buf->page still holds a folio of the
previous address_space, so the next erofs_bread() can return data from
the wrong one.

This is observable with METABOX enabled, where shared xattrs silently
disappear on the mounted fs, while the same tree built without METABOX
reports them fine.

Fix it by validating the address_space in the reuse predicate too: if the
cached folio belongs to another mapping, drop it so that the existing
slow path re-reads from buf->mapping.  Reading folio->mapping is safe
here because a reference on the cached folio is still held; if the folio
was already truncated, folio->mapping is NULL and the slow path is taken,
which is the safe direction.

Fixes: 414091322c63 ("erofs: implement metadata compression")
Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
---
 fs/erofs/data.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index be63b89f0862..d8b6523bc218 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -33,8 +33,13 @@ void *erofs_bread(struct erofs_buf *buf,
erofs_off_t offset, bool need_kmap)

  if (buf->page) {
  folio = page_folio(buf->page);
- if (folio_file_page(folio, index) != buf->page)
+ if (folio->mapping != buf->mapping) {
+ /* the cached folio belongs to another address_space */
+ erofs_put_metabuf(buf);
+ folio = NULL;
+ } else if (folio_file_page(folio, index) != buf->page) {
  erofs_unmap_metabuf(buf);
+ }
  }
  if (!folio || !folio_contains(folio, index)) {
  erofs_put_metabuf(buf);
-- 
2.33.0

--000000000000e4ae4c065cab0633
Content-Type: text/x-diff; charset="US-ASCII"; 
	name="0001-erofs-fix-folio-reuse-from-a-different-address_space.patch"
Content-Disposition: attachment; 
	filename="0001-erofs-fix-folio-reuse-from-a-different-address_space.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_munk0zf80>
X-Attachment-Id: f_munk0zf80

RnJvbSBhMTdlYWY2YjQ3NmE2NmU2YmM2ZDg1YzU2OTU4NDkxMWFjY2IwNWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCaW5nbGVpIFdhbmcgPGwzYjJ3MUBnbWFpbC5jb20+CkRhdGU6
IFdlZCwgMzAgU2VwIDIwMjYgMTA6MzQ6NDggKzA4MDAKU3ViamVjdDogW1BBVENIXSBlcm9mczog
Zml4IGZvbGlvIHJldXNlIGZyb20gYSBkaWZmZXJlbnQgYWRkcmVzc19zcGFjZSBpbgogZXJvZnNf
YnJlYWQoKQoKZXJvZnNfYnJlYWQoKSBjYWNoZXMgdGhlIGxhc3QgZm9saW8gaW4gc3RydWN0IGVy
b2ZzX2J1ZiBhbmQgcmV1c2VzIGl0IHdoZW4KdGhlIG5leHQgcmVxdWVzdCBsYW5kcyBvbiB0aGUg
c2FtZSBmb2xpbywgYnV0IHRoZSByZXVzZSBwcmVkaWNhdGUgb25seQpjb21wYXJlcyB0aGUgcGFn
ZSBpbmRleDsgaXQgbmV2ZXIgY2hlY2tzIHRoYXQgdGhlIGNhY2hlZCBmb2xpbyBzdGlsbApiZWxv
bmdzIHRvIGJ1Zi0+bWFwcGluZy4gIENvcnJlY3RuZXNzIHRoZXJlZm9yZSByZWxpZXMgb24gYW4g
aW52YXJpYW50CnRoYXQgaXMgbm93aGVyZSBlbmZvcmNlZC4KCmZzL2Vyb2ZzL3hhdHRyLmMgYWxy
ZWFkeSBicmVha3MgaXQ6IGVyb2ZzX3hhdHRyX2l0ZXJfaW5saW5lKCkgYW5kCmVyb2ZzX3hhdHRy
X2l0ZXJfc2hhcmVkKCkgY2FsbCBlcm9mc19pbml0X21ldGFidWYoKSBvbiB0aGUgc2FtZSBidWZm
ZXIKd2l0aCBubyBpbnRlcnZlbmluZyBlcm9mc19wdXRfbWV0YWJ1ZigpLCBhbmQgdGhlaXIgaW5f
bWV0YWJveCBhcmd1bWVudHMKY29tZSBmcm9tIGRpZmZlcmVudCBzb3VyY2VzIChwZXItaW5vZGUg
dnMgcGVyLWZzKS4gIFdoZW4gdGhlIHR3byBkaWZmZXIsCmJ1Zi0+bWFwcGluZyBpcyBzd2l0Y2hl
ZCB3aGlsZSBidWYtPnBhZ2Ugc3RpbGwgaG9sZHMgYSBmb2xpbyBvZiB0aGUKcHJldmlvdXMgYWRk
cmVzc19zcGFjZSwgc28gdGhlIG5leHQgZXJvZnNfYnJlYWQoKSBjYW4gcmV0dXJuIGRhdGEgZnJv
bQp0aGUgd3Jvbmcgb25lLgoKVGhpcyBpcyBvYnNlcnZhYmxlIHdpdGggTUVUQUJPWCBlbmFibGVk
LCB3aGVyZSBzaGFyZWQgeGF0dHJzIHNpbGVudGx5CmRpc2FwcGVhciBvbiB0aGUgbW91bnRlZCBm
cywgd2hpbGUgdGhlIHNhbWUgdHJlZSBidWlsdCB3aXRob3V0IE1FVEFCT1gKcmVwb3J0cyB0aGVt
IGZpbmUuCgpGaXggaXQgYnkgdmFsaWRhdGluZyB0aGUgYWRkcmVzc19zcGFjZSBpbiB0aGUgcmV1
c2UgcHJlZGljYXRlIHRvbzogaWYgdGhlCmNhY2hlZCBmb2xpbyBiZWxvbmdzIHRvIGFub3RoZXIg
bWFwcGluZywgZHJvcCBpdCBzbyB0aGF0IHRoZSBleGlzdGluZwpzbG93IHBhdGggcmUtcmVhZHMg
ZnJvbSBidWYtPm1hcHBpbmcuICBSZWFkaW5nIGZvbGlvLT5tYXBwaW5nIGlzIHNhZmUKaGVyZSBi
ZWNhdXNlIGEgcmVmZXJlbmNlIG9uIHRoZSBjYWNoZWQgZm9saW8gaXMgc3RpbGwgaGVsZDsgaWYg
dGhlIGZvbGlvCndhcyBhbHJlYWR5IHRydW5jYXRlZCwgZm9saW8tPm1hcHBpbmcgaXMgTlVMTCBh
bmQgdGhlIHNsb3cgcGF0aCBpcyB0YWtlbiwKd2hpY2ggaXMgdGhlIHNhZmUgZGlyZWN0aW9uLgoK
Rml4ZXM6IDQxNDA5MTMyMmM2MyAoImVyb2ZzOiBpbXBsZW1lbnQgbWV0YWRhdGEgY29tcHJlc3Np
b24iKQpDYzogQm8gTGl1IChPcGVuQW5vbGlzKSA8bGl1Ym8wM0BpbnNwdXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBCaW5nbGVpIFdhbmcgPGwzYjJ3MUBnbWFpbC5jb20+Ci0tLQogZnMvZXJvZnMvZGF0
YS5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZXJvZnMvZGF0YS5jIGIvZnMvZXJvZnMvZGF0YS5jCmlu
ZGV4IGJlNjNiODlmMDg2Mi4uZDhiNjUyM2JjMjE4IDEwMDY0NAotLS0gYS9mcy9lcm9mcy9kYXRh
LmMKKysrIGIvZnMvZXJvZnMvZGF0YS5jCkBAIC0zMyw4ICszMywxMyBAQCB2b2lkICplcm9mc19i
cmVhZChzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIGVyb2ZzX29mZl90IG9mZnNldCwgYm9vbCBuZWVk
X2ttYXApCiAKIAlpZiAoYnVmLT5wYWdlKSB7CiAJCWZvbGlvID0gcGFnZV9mb2xpbyhidWYtPnBh
Z2UpOwotCQlpZiAoZm9saW9fZmlsZV9wYWdlKGZvbGlvLCBpbmRleCkgIT0gYnVmLT5wYWdlKQor
CQlpZiAoZm9saW8tPm1hcHBpbmcgIT0gYnVmLT5tYXBwaW5nKSB7CisJCQkvKiB0aGUgY2FjaGVk
IGZvbGlvIGJlbG9uZ3MgdG8gYW5vdGhlciBhZGRyZXNzX3NwYWNlICovCisJCQllcm9mc19wdXRf
bWV0YWJ1ZihidWYpOworCQkJZm9saW8gPSBOVUxMOworCQl9IGVsc2UgaWYgKGZvbGlvX2ZpbGVf
cGFnZShmb2xpbywgaW5kZXgpICE9IGJ1Zi0+cGFnZSkgewogCQkJZXJvZnNfdW5tYXBfbWV0YWJ1
ZihidWYpOworCQl9CiAJfQogCWlmICghZm9saW8gfHwgIWZvbGlvX2NvbnRhaW5zKGZvbGlvLCBp
bmRleCkpIHsKIAkJZXJvZnNfcHV0X21ldGFidWYoYnVmKTsKLS0gCjIuMzMuMAoK
--000000000000e4ae4c065cab0633--
