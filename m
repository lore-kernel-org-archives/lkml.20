Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51C376A0B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639139; cv=pass; b=pEpV6ZsZtM6ChqZjsAuaiNrswfbjfz0blnkeB0I7MIL7E1JH2dS/0vYK/YI1HUH4v94EpQ1LisdxGflCqB/17w9s+RzzCUB3xLFNp0dSMS9L8NTNEucONkD4iwYeTNse45PN7uQzeHfwiA3fHB50quZ0QJ1xtl03ErJS8+tzkcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639139; c=relaxed/simple;
	bh=kPt0aqOU/n4gdjbTJoki1cMSqFBO3bQbhyVv70dBjDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RJ8fdiv5q5w0GXwMpOaaMzcinKXKYRkVWpIhJT6/fhovjPfM3xMGTXvqKpc7zQ2kjIy3ntotbX+41UQkabb63NeTMV41UqZZnrpSGwa/k2k7ejAfWfIEyzPwjC3ndU/mvj6hgrP8hQgso2/slx1UZiDpUr0q30Y/7QHEFKciVPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJC1uc4M; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJC1uc4M"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a658f67032so20064241fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639136; cv=none;
        d=google.com; s=arc-20260327;
        b=LiququNq7RwlLu0iWTn2DJkxR6NoRCPuXfA3/7xXkaGHweaU+FHdHjdA0LwWQ8JYej
         p5/DHE8Bg1QfveCRLMoCbXmaQT1lb3xNqo24fRM01hyyeHqzG036dleiCBABkH2LZ/MA
         RV47sIhyxJ7rF54YhL5A/7vI6eP3osrl84gc5PF0FYoIlx6TpYrYt1WAnESsMLNXYfz0
         X1YNJvWR6jgZYhSkJ1p09B3X3RmOBYJlYVjGcmmxxF7RLKqGzzaCcSdJQHuTS/V1/oKg
         3S1snyBTI5Mw2hsFyYrBzGzn00ZPNMls7IiT56lqbT+Ftk35s593sSPoYfQ5h+e1RkNu
         DE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        fh=029064lTJOwbieShF2gd/o7yDqyQ55GoSM3n8BA3avc=;
        b=efN+Abbx0Jj+5jEz1kL1PJCwgbHq42GlazI96Uso6V3Nd7HpaMn4J19ytnQU7aiRS7
         /Okc/TzYJWg2sQcmIIOIAfa6wTsC5skXexGAPrDR+LmpVr5Fq/tJfWF3B3G1DvNyAB2d
         jbR31ffZ4H2KpeJ8nn7JdiyFGh+ZgcCJ1KFgw+hB7wCORQxfiXz5Gigywn2CknSN+TSH
         jGCJTjoyIyfiEDvkMWSJSoA442w2U25o2xroTMsv8QyJQbwDEl1dbePA11n4ZvWz5lQQ
         rxpYY3okJeIHZ26yN3C10YITflrM+5hilu/Ha/gnsexNvlYySjpzayb2Mn481UZx/Kop
         JRKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639136; x=1791243936; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        b=cJC1uc4MmurkcxezzyMTULikBkyvpVMG4v7vReRK+fnLhL3/7axAETRvX/u15yp6MR
         u9fwdNlZGWBw2FQuZiNAq2s23bieFDDJyRLxQa5nXxJpujTJD4llQuYXdZsFe3UfPsje
         hJjH/3JJ79VjdY2yWVjbVxcPeW64Pwn1eaf3j5N/kn0x6/JohL+JLyF8Oq2h5l6doL3K
         mnjBEzK5mfqftfyZhDhynBm3G1B2rS3VoWDNpq8WSnk1YRWtDHjbmNC611hLf1XJtCD+
         7VKOyYWEkgz81E06kpL0mAs21jKbpuZBA0PjXxIEB28dZyip8vIxguGb2fHI/Em5exSo
         M9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639136; x=1791243936;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        b=yl4MdYYA+Jdst2uzdZcRXrDvXBBW4OixI4Lf9hSliMw9nIMw3t7WKY+IZwDfW+bXFW
         is2CteJv1CUtXv/uvsbwwTPTr7DaZlJXTYKgXXIAkeO7zWqsRrjuMo8o44VEX6A8lpm5
         oAj4W5bmV7XF/7V/4D2/HFqOqFDM0C0JRmWpCCU2KUMSdmYZZ0XBaPEVPa6azOhswWaj
         oCQZUtP0lexAIrqv1nHuCjUeJ9pMkqWwFPM8Uq0FqR7R0q9cikYAgLqVAh4OZMRbPR97
         ZRuCo+/xFAEffYoAdamd/H1NetkJdegWhNGwIM6MWRxHu8ruAuxpBgdXz/rgFr4fqkKs
         nFyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwok41i9MlMslYMuG3uKVMxuGr0tZljNy1Nc6VBbLApMb+abVkdy6/uG1Mf6syxInKyHDeyWchxix663M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5515jJC9QXnuQnW0Xk6R25qaVDv96H3gMbh+a35OYaCcvlV2W
	pbEkNiGYutEUATTxhut9hTI6PJtrIunZRBr/Y0wMQ7pQ4Pdqhw4SY6Z3cI2GbJ/ibr6PwpMtKcx
	nsmnIDa9RF0UKuIKW1yjskjJe7GiHifs=
X-Gm-Gg: AYBFou2/yOCM6M9TLz2/LjEXrmCD429KXB7udjzJ0PWkxf7ARkzQlGA9r/BARKhsR/r
	tJmg+OkCeZ4xFkJ35D3ZcGUF1cnessy7X1tGn+6m9dt/tDGoYlEwYHTOusMRdEPFywT2VbSOr8Z
	EIUGaZ5d9AhNt317WNkp/9zerDmS0xyBqwKrGZTsUQqTKvceuji7rqci3F2S1U9qR3yhITvtslM
	C5Nk+kyqw6DUiv6a3JRCe4HWhJvZ2LA60wu5sjte+3jJHJdEOHtyx1qVHMErquUc5ULe9W4Qzo4
	+DDRNanWu/xQLI9MVFokS+iwaj2pzBmFKHtOtFg77wIaghbb/79zm/ayRkHSOM7OluOD9ZXCHnR
	bC8K+UmkxlA771i6vAVRE5TsdVpoXL+UbD5KLuQ0r9Vn1Wr2YwbeQ+u3Z/UppEvieAytL2A0=
X-Received: by 2002:a05:6512:b96:b0:5b8:9c46:d4d1 with SMTP id
 2adb3069b0e04-5b8df1f3d0bmr5168466e87.32.1790639135820; Mon, 28 Sep 2026
 16:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:45:22 -0400
X-Gm-Features: AclHuK-mvnM-4uImxnKIJOrGolLuZvCHcejArW2uJ2903EtNAjJ4_qYabJ1G3No
Message-ID: <CAGLNFZcFDMD7P3rwueV4eRQ4qvDU4ekyzLmYTFq==5fUZxMBmw@mail.gmail.com>
Subject: [PATCH] kconfig: keep builtin precedence with duplicate fragment entries
To: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000009ca7fc065c93a976"

--0000000000009ca7fc065c93a976
Content-Type: text/plain; charset="UTF-8"

The -y option is meant to preserve a builtin value when a fragment
requests a module. With duplicate CONFIG_FOO=m lines, only the last
fragment line is skipped; an earlier one remains after CONFIG_FOO=y.
Kconfig reads the later assignment and can demote the symbol. Track
the symbol instead of one line, and skip all of its assignments
when builtin precedence applies.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--0000000000009ca7fc065c93a976
Content-Type: application/octet-stream; 
	name="03-kconfig-duplicate-fragments.patch"
Content-Disposition: attachment; 
	filename="03-kconfig-duplicate-fragments.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwat900>
X-Attachment-Id: f_mulwat900

RnJvbSBlY2RhOTgxYTEwNmY3ZDk0YzZlNmZlYjE4NGNiY2ZlMmU3MGI5YzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGtj
b25maWc6IGtlZXAgYnVpbHRpbiBwcmVjZWRlbmNlIHdpdGggZHVwbGljYXRlIGZyYWdtZW50CiBl
bnRyaWVzClRvOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+LCBOaWNvbGFz
IFNjaGllciA8bnNjQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3Jn
LCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCgpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnph
bG1hbjQyQGdtYWlsLmNvbT4KClRoZSAteSBvcHRpb24gaXMgbWVhbnQgdG8gcHJlc2VydmUgYSBi
dWlsdGluIHZhbHVlIHdoZW4gYSBmcmFnbWVudApyZXF1ZXN0cyBhIG1vZHVsZS4gV2l0aCBkdXBs
aWNhdGUgQ09ORklHX0ZPTz1tIGxpbmVzLCBvbmx5IHRoZSBsYXN0CmZyYWdtZW50IGxpbmUgaXMg
c2tpcHBlZDsgYW4gZWFybGllciBvbmUgcmVtYWlucyBhZnRlciBDT05GSUdfRk9PPXkuCktjb25m
aWcgcmVhZHMgdGhlIGxhdGVyIGFzc2lnbm1lbnQgYW5kIGNhbiBkZW1vdGUgdGhlIHN5bWJvbC4g
VHJhY2sKdGhlIHN5bWJvbCBpbnN0ZWFkIG9mIG9uZSBsaW5lLCBhbmQgc2tpcCBhbGwgb2YgaXRz
IGFzc2lnbm1lbnRzCndoZW4gYnVpbHRpbiBwcmVjZWRlbmNlIGFwcGxpZXMuCgpTaWduZWQtb2Zm
LWJ5OiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4KLS0tCiBzY3JpcHRzL2tj
b25maWcvbWVyZ2VfY29uZmlnLnNoIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvbWVy
Z2VfY29uZmlnLnNoIGIvc2NyaXB0cy9rY29uZmlnL21lcmdlX2NvbmZpZy5zaAppbmRleCBlYzI0
MmUwLi44NmE0YWY4IDEwMDY0NAotLS0gYS9zY3JpcHRzL2tjb25maWcvbWVyZ2VfY29uZmlnLnNo
CisrKyBiL3NjcmlwdHMva2NvbmZpZy9tZXJnZV9jb25maWcuc2gKQEAgLTIwMiw3ICsyMDIsNiBA
QCBmb3IgT1JJR19NRVJHRV9GSUxFIGluICRNRVJHRV9MSVNUIDsgZG8KIAkJY2ZnID0gZ2V0X2Nm
ZygkMCkKIAkJaWYgKGNmZyAhPSAiIikgewogCQkJbWVyZ2VfY2ZnW2NmZ10gPSAkMAotCQkJbWVy
Z2VfY2ZnX2xpbmVbY2ZnXSA9IEZOUgogCQl9CiAJCW5leHQKIAl9CkBAIC0yMjQsNyArMjIzLDcg
QEAgZm9yIE9SSUdfTUVSR0VfRklMRSBpbiAkTUVSR0VfTElTVCA7IGRvCiAJCWlmIChidWlsdGlu
ID09ICJ0cnVlIiAmJiBuZXdfdmFsIH4gLz1tJC8gJiYgcHJldl92YWwgfiAvPXkkLykgewogCQkJ
d2Fybl9idWlsdGluKGNmZywgcHJldl92YWwsIG5ld192YWwpCiAJCQlwcmludCAkMCA+PiBvdXRm
aWxlCi0JCQlza2lwX21lcmdlW21lcmdlX2NmZ19saW5lW2NmZ11dID0gMQorCQkJc2tpcF9jZmdb
Y2ZnXSA9IDEKIAkJCW5leHQKIAkJfQogCkBAIC0yNTIsNyArMjUxLDcgQEAgZm9yIE9SSUdfTUVS
R0VfRklMRSBpbiAkTUVSR0VfTElTVCA7IGRvCiAJCXByaW50ICIiID4+IG91dGZpbGUKIAkJIyBB
cHBlbmQgbWVyZ2UgZmlsZSwgc2tpcHBpbmcgbGluZXMgbWFya2VkIGZvciBidWlsdGluIHByZXNl
cnZhdGlvbgogCQlmb3IgKGkgPSAxOyBpIDw9IG1lcmdlX3RvdGFsOyBpKyspIHsKLQkJCWlmICgh
KGkgaW4gc2tpcF9tZXJnZSkpIHsKKwkJCWlmICghKGdldF9jZmcobWVyZ2VfbGluZXNbaV0pIGlu
IHNraXBfY2ZnKSkgewogCQkJCXByaW50IG1lcmdlX2xpbmVzW2ldID4+IG91dGZpbGUKIAkJCX0K
IAkJfQo=
--0000000000009ca7fc065c93a976--
