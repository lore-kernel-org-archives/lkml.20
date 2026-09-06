Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A8630C177
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714632; cv=pass; b=INeyyalhY3oBeoI3fmwuZBDrtGawbSub9T0PGWgrc7SSibXK9IDI/PFxUe9HuYW9vL9o3FkwQQxJLJ3a0wFBpaXtvp+TDwS9XoPiyquT6NHvTNJuSpBx7laC1GOUYfO5JwZcSXer514NC0zxomwPQnqhvVs6TCO75etY2uzs2NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714632; c=relaxed/simple;
	bh=HZEcyytTRfm6SobuhYkTk1dOEKPrzvjkXoMvjjO12rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WcVlIcOpDhbO1YR0kG93pkqyhxJCUrdWdPj1x6NqTcRTFFqaRa9zfnKcYyePkZTz9rz/+xTTxP1QN47DVF6ive43UhLU6+F7nA45g+9Kv3X1qV5/NcCK4cpsSXbg1U/yjQIV0WteTNb4TzzxK/F+H/x4YNy/ZW+c87K/23ANciI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcy/k/1k; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcy/k/1k"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso4528945a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788714626; cv=none;
        d=google.com; s=arc-20260327;
        b=VcumvZ8tTm9FlJRx0JahVSDU6AFFJk+Xw/b4+hN6iTUcSUa3eV3XHbfWRawHN4OFHZ
         iIzaQYEMrCAHHFbExKeA7tEB4WQtllIFrbq/LN+4VQw7ndsBYvLWy0PUCsa1rV1osULx
         KbI0uiu/tQOpigKNJSBDUPRz+uVyHiZlJvjoMcHVI+FlE8X28BKcppmSZlLSJ2GtYWKp
         Mi/3gksCa+7hDm9QBZsTDFbfw69Caz8inyXUVzbfzK4Uh17XuSXdu9q7w35Y29dv5v2e
         hQwshbfDV3Uxil1pKZDe9JRkttLPHqRUTXOkqJdND2abxpawZbr8/5fQ9Lm3nC7isv5I
         1vNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fivbRIV9F3sA2+obiII4BuUq9auchksRabMC3bMsek4=;
        fh=h6KoWAp437MApk4DYZWRBLKjZga5QcurWC5hnIZ2c/8=;
        b=amggsm6FY6SxewhVKDvKqLYAIOc/A7y4UMFOscxsi0bBeMYG8+rXPhjhmf2vDArTNH
         rdpY+yhQ46OmO/CqCKgzlziFK4PQ8nZcHkSZKSGkMiNSjW0NSxUO5RxN7XvL6emUKXSo
         h1AqxRfWSSV49PSIg+FGqZhpDwTEhbh6IGvGvRAtL6b4E7VzA2i0s1bWBLQq55zlgo3o
         d7egF64cNlaugNt75jMnI1y8/MoH7YPs/Ulai2ko46YSR+zD2Gtb71zAfU+2X5pW0P5G
         dz1sDbqO88pdcaSYrJctVWnHJkx6YIM+Griiw5Zm7myGqD3gosM856KR/zb1FZhENtSg
         wOGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714626; x=1789319426; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fivbRIV9F3sA2+obiII4BuUq9auchksRabMC3bMsek4=;
        b=lcy/k/1kJX9BJf9AGGq5piUPpDceGrmPmFBxKUrCUf+zcAy8yVENIZRnPvJEG/n4tb
         rOoQoBYm5qqcXxuy3c1YC7F0K9lqyZS63XGWyMH8xlwOLCoqJ9ashBPT7TYPl/FNrP7W
         R89oKSjR6eP6oVyhqaTQCD3x5qo0hC963/LUmw7FOJF0SgXuMN/2XPY7glJkRzj2wmzI
         ts/hBYzoFFeZHlHylAMBL4iBSBfysAhu2e+8LBiD7qZzNRdejTdRiFfoS9BoRLmsv+Be
         KT/zaw93vWk8S587V+4N7JMt57BInqaFGh29PgLM/LFGbRyYQsiBuQFRo2LFLRvHU1mz
         DMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714626; x=1789319426;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fivbRIV9F3sA2+obiII4BuUq9auchksRabMC3bMsek4=;
        b=mdGNq3uVQyl0YBCOFjji8F4TvawtQTiHqLiYRwapRjDm3OQgDYUcnJxDvXPK8G1xI6
         I07DSKwMMgPecLaihTIQxVr5I9josv9GSdm4xG3fELVb5fN8uD8i7QixIy/wqj3jgX9u
         rXY/Inrh91yIih6yJ+RAXpTcef/z4NsejEOTvZsxRHIOATcyBLDvvu9dU76wZFYgm8P5
         J3oMDHi9cbJlz0TD4qRLkoNzQBPYMy0e8x2VwO+X6lFdv8d6FO1QvvzRwG+OAB+KWIzN
         Y3GQVPc2IqL+77/LJMWA5n8Wja8hWyUJ8vhh6S9/naaGEZY36WlHWyb2A/7faye5pZT9
         ij4g==
X-Forwarded-Encrypted: i=1; AKwUvBwktGxYo4o3UsKBQzYpCJRQLX60CzpZrgXCRpaIXLTGokbbooz/oHCwcP6smU6HBdoL/jIxAxPtGFGA+D0=@vger.kernel.org
X-Gm-Message-State: AFuF++my/vsnTOJWnPdKvyspVAZJ/dVBYEN+TCNS0A3qmJD/jxMa+zWT
	RN4mc6mMu8GsnhKeYy10uSHG53PPWlPmJnoLxgefW3Ft5JVrlGIXbGttSBAOcFTUNeYXPUwkRAx
	qoz5vMMgwLu9FfsSUFmhBGOKY7L8zH3/GTfpm
X-Gm-Gg: AYBFou1FNq46hSFuHhwfrLBCJlourbLB76r2Zelk4DjEuw3ZuPlHHPltKuT5ue+NsAG
	qRVL1fFEV77yfDnexJFgq0S9Y+S/ft/2aoZmjA8rRdlIMZ1JSPUoQlNgtdzlVtD8okJd9l/lRfW
	++nEs2wEo+3HhbE3Mrho/47nAdzP/ZHAA6pY8SQb5OphSOwTO/UiUr6pjJAgDBaakv9mEmHwIYg
	lwz0OgNyPGS1sp8ill+p4ax2H4OXbMek+iEdZ/+PjTcPLGWyl/46LAfhoFmLsOBRbDK8irmBLGK
	sC7R3+7+80aTWwmIA5asS+sQC4qYnMe5IVJuxxUZb9VRaHwOhRX22XA1As4bRSXB0bqW2h6pZY1
	W8y0qTQL5W1S0xviYFFNb
X-Received: by 2002:a05:6402:538d:b0:6a0:ffb0:273b with SMTP id
 4fb4d7f45d1cf-6a7e8cb1346mr5411057a12.0.1788714625502; Sun, 06 Sep 2026
 10:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnMt5YMA70FJwH+ddo24Ejd8HbpFSgUv73Ybu-fu+F-gcoesQ@mail.gmail.com>
In-Reply-To: <CAMnMt5YMA70FJwH+ddo24Ejd8HbpFSgUv73Ybu-fu+F-gcoesQ@mail.gmail.com>
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:10:17 +0300
X-Gm-Features: AcwNN1VXTtuGEQ84iexSHIE7ObX1CHhpZMgUMkYX_Vj2dvKw3vvUbQHw3wdR13Y
Message-ID: <CAMnMt5Y_fL0cHQ1CjU9+vn0rZVO5eitL6h0dTQ5Wg48c68-yYg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000dbcb90065ad39355"

--000000000000dbcb90065ad39355
Content-Type: multipart/alternative; boundary="000000000000dbcb8e065ad39353"

--000000000000dbcb8e065ad39353
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 and
other newer hardware revisions, driver initialization consistently fails
during probe with vendor request timeouts (-110 / -ETIMEDOUT):
  mt7601u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500
  mt7601u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640 Build time:
201302052146____
  mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:07 off:0734 failed:-110
  mt7601u 3-14:1.0: Vendor request req:42 off:0230 failed:-110
  mt7601u 3-14:1.0: probe with driver mt7601u failed with error -110

The failure occurs because mt7601u_load_firmware() unconditionally calls
mt7601u_vendor_reset() (MT_VEND_DEV_MODE_RESET) before uploading firmware
chunks. On these devices, issuing this vendor reset leaves the internal
MCU / FCE DMA engine in an unresponsive state after the first firmware
URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX
(0x09a8) immediately times out.
Introduce a boolean module parameter 'vnd_reset' (default: false) to
make this vendor reset optional. When the vendor reset is skipped,
firmware upload succeeds and the wireless interface initializes normally.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301

More issues with Tenda U2 and Linux:
- https://www.opena.tv/viewtopic.php?t=63919
- https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
- https://bbs.archlinux.org/viewtopic.php?id=224859
-
https://www.reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru
<GermanAizek@yandex.ru>>
Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <germanaizek0@gmail.com
<GermanAizek@yandex.ru>>

--000000000000dbcb8e065ad39353
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On certain MT7601U adapters, such as Tenda U2 and</di=
v><div>other newer hardware revisions, driver initialization consistently f=
ails</div><div>during probe with vendor request timeouts (-110 / -ETIMEDOUT=
):</div><div>=C2=A0 mt7601u 3-14:1.0: ASIC revision: <span>76010001</span> =
MAC revision: <span>76010500</span></div><div>=C2=A0 mt7601u 3-14:1.0: Firm=
ware Version: 0.1.00 Build: 7640 Build time: <span>201302052146</span>____<=
/div><div>=C2=A0 mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-1=
10</div><div>=C2=A0 mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed=
:-110</div><div>=C2=A0 mt7601u 3-14:1.0: Vendor request req:07 off:0734 fai=
led:-110</div><div>=C2=A0 mt7601u 3-14:1.0: Vendor request req:42 off:0230 =
failed:-110</div><div>=C2=A0 mt7601u 3-14:1.0: probe with driver mt7601u fa=
iled with error -110</div><div>=C2=A0</div><div>The failure occurs because =
mt7601u_load_firmware() unconditionally calls</div><div>mt7601u_vendor_rese=
t() (MT_VEND_DEV_MODE_RESET) before uploading firmware</div><div>chunks. On=
 these devices, issuing this vendor reset leaves the internal</div><div>MCU=
 / FCE DMA engine in an unresponsive state after the first firmware</div><d=
iv>URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX</=
div><div>(0x09a8) immediately times out.</div><div>Introduce a boolean modu=
le parameter &#39;vnd_reset&#39; (default: false) to</div><div>make this ve=
ndor reset optional. When the vendor reset is skipped,</div><div>firmware u=
pload succeeds and the wireless interface initializes normally.</div><div>=
=C2=A0</div><div>Link: <a href=3D"https://bugs.launchpad.net/ubuntu/+source=
/linux/+bug/1716301" rel=3D"noopener noreferrer" target=3D"_blank">https://=
bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301</a></div><div>=C2=A0</=
div><div>More issues with Tenda U2 and Linux:</div><div>- <a href=3D"https:=
//www.opena.tv/viewtopic.php?t=3D63919" rel=3D"noopener noreferrer" target=
=3D"_blank">https://www.opena.tv/viewtopic.php?t=3D63919</a></div><div>- <a=
 href=3D"https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2"=
 rel=3D"noopener noreferrer" target=3D"_blank">https://askubuntu.com/questi=
ons/1418850/the-problem-with-wi-fi-u2</a></div><div>- <a href=3D"https://bb=
s.archlinux.org/viewtopic.php?id=3D224859" rel=3D"noopener noreferrer" targ=
et=3D"_blank">https://bbs.archlinux.org/viewtopic.php?id=3D224859</a></div>=
<div>- <a href=3D"https://www.reddit.com/r/archlinux/comments/1d6dfv5/mt760=
1u_usb_wifi_not_working/" rel=3D"noopener noreferrer" target=3D"_blank">htt=
ps://www.reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_worki=
ng/</a></div><div><br>Signed-off-by: Herman Semenoff &lt;<a href=3D"mailto:=
GermanAizek@yandex.ru" rel=3D"noopener noreferrer" target=3D"_blank">German=
Aizek@aizekgroup.ru</a>&gt;</div><div>Signed-off-by: Herman Semenoff &lt;<a=
 href=3D"mailto:GermanAizek@yandex.ru" rel=3D"noopener noreferrer" target=
=3D"_blank">GermanAizek@yandex.ru</a>&gt;<br>Signed-off-by: Herman Semenoff=
 &lt;<a href=3D"mailto:GermanAizek@yandex.ru" rel=3D"noopener noreferrer" t=
arget=3D"_blank">germanaizek0@gmail.com</a>&gt;</div><br></div>

--000000000000dbcb8e065ad39353--
--000000000000dbcb90065ad39355
Content-Type: application/x-patch; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.patch"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq2gtq80>
X-Attachment-Id: f_mtq2gtq80

RnJvbSBjMDNkNzNkMzdkZjQ0MGQwMDQ2ZDY4NDA2ZmRlMmFhMWY2MmZlMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZXJtYW4gU2VtZW5vZmYgPEdlcm1hbkFpemVrQGFpemVrZ3Jv
dXAucnU+CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNzoxNDozMiArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIFtQQVRDSF0gd2lmaTogbXQ3NjAxdTogYWRkIHZuZF9yZXNldCBwYXJhbWV0ZXIgdG8gZml4
IHByb2JlCiBmYWlsdXJlIG9uIFRlbmRhIFUyCgp3aWZpOiBtdDc2MDF1OiBhZGQgdm5kX3Jlc2V0
IHBhcmFtZXRlciB0byBmaXggcHJvYmUgZmFpbHVyZSBvbiBUZW5kYSBVMgoKT24gY2VydGFpbiBN
VDc2MDFVIGFkYXB0ZXJzLCBzdWNoIGFzIFRlbmRhIFUyIGFuZApvdGhlciBuZXdlciBoYXJkd2Fy
ZSByZXZpc2lvbnMsIGRyaXZlciBpbml0aWFsaXphdGlvbiBjb25zaXN0ZW50bHkgZmFpbHMKZHVy
aW5nIHByb2JlIHdpdGggdmVuZG9yIHJlcXVlc3QgdGltZW91dHMgKC0xMTAgLyAtRVRJTUVET1VU
KToKICBtdDc2MDF1IDMtMTQ6MS4wOiBBU0lDIHJldmlzaW9uOiA3NjAxMDAwMSBNQUMgcmV2aXNp
b246IDc2MDEwNTAwCiAgbXQ3NjAxdSAzLTE0OjEuMDogRmlybXdhcmUgVmVyc2lvbjogMC4xLjAw
IEJ1aWxkOiA3NjQwIEJ1aWxkIHRpbWU6IDIwMTMwMjA1MjE0Nl9fX18KICBtdDc2MDF1IDMtMTQ6
MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6MDcgb2ZmOjA5YTggZmFpbGVkOi0xMTAKICBtdDc2MDF1
IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6MDIgb2ZmOjA5YTggZmFpbGVkOi0xMTAKICBt
dDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6MDcgb2ZmOjA3MzQgZmFpbGVkOi0x
MTAKICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6NDIgb2ZmOjAyMzAgZmFp
bGVkOi0xMTAKICBtdDc2MDF1IDMtMTQ6MS4wOiBwcm9iZSB3aXRoIGRyaXZlciBtdDc2MDF1IGZh
aWxlZCB3aXRoIGVycm9yIC0xMTAKClRoZSBmYWlsdXJlIG9jY3VycyBiZWNhdXNlIG10NzYwMXVf
bG9hZF9maXJtd2FyZSgpIHVuY29uZGl0aW9uYWxseSBjYWxscwptdDc2MDF1X3ZlbmRvcl9yZXNl
dCgpIChNVF9WRU5EX0RFVl9NT0RFX1JFU0VUKSBiZWZvcmUgdXBsb2FkaW5nIGZpcm13YXJlCmNo
dW5rcy4gT24gdGhlc2UgZGV2aWNlcywgaXNzdWluZyB0aGlzIHZlbmRvciByZXNldCBsZWF2ZXMg
dGhlIGludGVybmFsCk1DVSAvIEZDRSBETUEgZW5naW5lIGluIGFuIHVucmVzcG9uc2l2ZSBzdGF0
ZSBhZnRlciB0aGUgZmlyc3QgZmlybXdhcmUKVVJCIGlzIHN1Ym1pdHRlZC4gQXMgYSByZXN1bHQs
IHJlYWRpbmcgTVRfVFhfQ1BVX0ZST01fRkNFX0NQVV9ERVNDX0lEWAooMHgwOWE4KSBpbW1lZGlh
dGVseSB0aW1lcyBvdXQuCkludHJvZHVjZSBhIGJvb2xlYW4gbW9kdWxlIHBhcmFtZXRlciAndm5k
X3Jlc2V0JyAoZGVmYXVsdDogZmFsc2UpIHRvCm1ha2UgdGhpcyB2ZW5kb3IgcmVzZXQgb3B0aW9u
YWwuIFdoZW4gdGhlIHZlbmRvciByZXNldCBpcyBza2lwcGVkLApmaXJtd2FyZSB1cGxvYWQgc3Vj
Y2VlZHMgYW5kIHRoZSB3aXJlbGVzcyBpbnRlcmZhY2UgaW5pdGlhbGl6ZXMgbm9ybWFsbHkuCgpM
aW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51eC8rYnVn
LzE3MTYzMDEKCk1vcmUgaXNzdWVzIHdpdGggVGVuZGEgVTIgYW5kIExpbnV4OgotIGh0dHBzOi8v
d3d3Lm9wZW5hLnR2L3ZpZXd0b3BpYy5waHA/dD02MzkxOQotIGh0dHBzOi8vYXNrdWJ1bnR1LmNv
bS9xdWVzdGlvbnMvMTQxODg1MC90aGUtcHJvYmxlbS13aXRoLXdpLWZpLXUyCi0gaHR0cHM6Ly9i
YnMuYXJjaGxpbnV4Lm9yZy92aWV3dG9waWMucGhwP2lkPTIyNDg1OQotIGh0dHBzOi8vd3d3LnJl
ZGRpdC5jb20vci9hcmNobGludXgvY29tbWVudHMvMWQ2ZGZ2NS9tdDc2MDF1X3VzYl93aWZpX25v
dF93b3JraW5nLwoKU2lnbmVkLW9mZi1ieTogSGVybWFuIFNlbWVub2ZmIDxHZXJtYW5BaXpla0Bh
aXpla2dyb3VwLnJ1PgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYwMXUv
bWN1LmMgfCAxNSArKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21l
ZGlhdGVrL210NzYwMXUvbWN1LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
MDF1L21jdS5jCmluZGV4IGJhZDZjYTgyMS4uYWJmNDc2N2YxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jCisrKyBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL21lZGlhdGVrL210NzYwMXUvbWN1LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L3VzYi5oPgogI2luY2x1ZGUgPGxpbnV4
L3NrYnVmZi5oPgorI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+CiAKICNpbmNsdWRlICJt
dDc2MDF1LmgiCiAjaW5jbHVkZSAiZG1hLmgiCkBAIC0yMSw2ICsyMiwxNCBAQAogI2RlZmluZSBN
Q1VfRldfVVJCX1NJWkUJCQkoTUNVX0ZXX1VSQl9NQVhfUEFZTE9BRCArIDEyKQogI2RlZmluZSBN
Q1VfUkVTUF9VUkJfU0laRQkJMTAyNAogCitzdGF0aWMgYm9vbCB2bmRfcmVzZXQ7Cittb2R1bGVf
cGFyYW0odm5kX3Jlc2V0LCBib29sLCAwNjQ0KTsKK01PRFVMRV9QQVJNX0RFU0Modm5kX3Jlc2V0
LCAiUGVyZm9ybSB2ZW5kb3IgcmVzZXQgZHVyaW5nIGZpcm13YXJlIHVwbG9hZCAoZGVmYXVsdDog
ZmFsc2UpIik7CisKK3N0YXRpYyBib29sIGRpc2FibGVfdXNiX3NnOworbW9kdWxlX3BhcmFtKGRp
c2FibGVfdXNiX3NnLCBib29sLCAwNjQ0KTsKK01PRFVMRV9QQVJNX0RFU0MoZGlzYWJsZV91c2Jf
c2csICJVbnVzZWQgY29tcGF0aWJpbGl0eSBwYXJhbWV0ZXIiKTsKKwogc3RhdGljIGlubGluZSBp
bnQgZmlybXdhcmVfcnVubmluZyhzdHJ1Y3QgbXQ3NjAxdV9kZXYgKmRldikKIHsKIAlyZXR1cm4g
bXQ3NjAxdV9ycihkZXYsIE1UX01DVV9DT01fUkVHMCkgPT0gMTsKQEAgLTQ1OSw4ICs0NjgsMTAg
QEAgc3RhdGljIGludCBtdDc2MDF1X2xvYWRfZmlybXdhcmUoc3RydWN0IG10NzYwMXVfZGV2ICpk
ZXYpCiAJbXQ3NjAxdV93cihkZXYsIDB4OTRjLCAwKTsKIAltdDc2MDF1X3dyKGRldiwgTVRfRkNF
X1BTRV9DVFJMLCAwKTsKIAotCW10NzYwMXVfdmVuZG9yX3Jlc2V0KGRldik7Ci0JbXNsZWVwKDUp
OworCWlmICh2bmRfcmVzZXQpIHsKKwkJbXQ3NjAxdV92ZW5kb3JfcmVzZXQoZGV2KTsKKwkJbXNs
ZWVwKDUpOworCX0KIAogCW10NzYwMXVfd3IoZGV2LCAweGE0NCwgMCk7CiAJbXQ3NjAxdV93cihk
ZXYsIDB4MjMwLCAweDg0MjEwKTsKLS0gCjIuNTUuMAoK
--000000000000dbcb90065ad39355--
