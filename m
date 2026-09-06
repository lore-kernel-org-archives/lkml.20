Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6E3BC680
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714910; cv=pass; b=bS1K6eIqkQpJ3GZa9u4R1Q6Bp8n2T3ClzuZfLkKs/tfsz03oK/6s3qjwJADBrcKOvjFqktnc6jSxwHJdSLZLrgIY5GiWhPccPw2kipxoeJsAnH0PKT4ZocbAknQQ0AscWMGj6mHouREcEaLAcdGt3MVtAdsb5c/RFjlgHZuQHZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714910; c=relaxed/simple;
	bh=/NLEFD2U4DPqs+hPEKjeMU8yvviLwxMNcDiKHhsq30I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nc9VP6WBj2TJZ2zwTO//aQfGtx9RXlacdqv20p4Q92yZC+dGnxR3t5TULC1I1yzDTbP5hXdYaXeW1Mlh+bWCaK7nbkTSU8UhChvYrfo1KtdWqHEbUPu8gtUoFPmrfK2hzv0C1/v8eDdW/oKpyitPrebWxSgcUdpcr0ZpZfVMZxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOXMkTno; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOXMkTno"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so2099086e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788714906; cv=none;
        d=google.com; s=arc-20260327;
        b=s7w4T8znv6vFRdSDRkwqcH9Y7K/nslESpxgpxUJCQH1kxhXt6QMMr3sSyDzfQew6iP
         MOZZcZpd7HdP8rCAR9j4ssCGH+2hXiGTW45xr5y7VdlbeC5tNbeljw/d7F+gCO05UL0L
         zyt1d6TRKfuaeQDvbm3xPbIFWuqNrZW8id2cEPeVYr8mCiLnFBRbbp8rKbCAqAvunHiO
         XH+BbmNiVhv96QSQVTPaOAK4B5fjjSTEclorWySGAT3cT04qGhpqRzvwyIqbxmwsM7Dz
         OwuY4NVYPyeyvzjYD6xg9hPodpdGEyUF/0npG9Q17IPCWyp9ChSXBajEDo9o3pBp1e63
         yn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ybo9oFe6iDvjjcDhnYminurOrpz0f2+5WnEtJ/QJDZA=;
        fh=cqHALuw8OXy0PjQoRYoeXJL6p3A37Y+6mIWdh/o7Ghc=;
        b=QDzcx2BibqV7HJim/z38Q6uAGYg9RNVaATMmTcefAW/SXOPhI1Q39L8Se06G2IFCUx
         4h7gAfWBHHhGNTA27lLNZrSyAjaX1GTaxzvID/V6mLrl0ngbFlLNybJLkerZmG/oyD3x
         LfcKO984L8m4o0VKHhngqgxO6bEm60YuOmfS/jEV1p0xMKUVfUxem6+aHxWzui+pYx2u
         bRg2+RmSEkxRDRp40UeSekpUbNFN/ToUV8gmvsNitIKGmo64cPZQZGAzRVHhI+9rA+r2
         KDtD4tfPxs0hB4h7p+LihYPUttQ4JKAns5ooYVDgHRRydb3g+akOTHXWRe8vbx6Xuz+C
         weYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714906; x=1789319706; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybo9oFe6iDvjjcDhnYminurOrpz0f2+5WnEtJ/QJDZA=;
        b=nOXMkTno0/vYyzSCbiUfuOFjaAj1B/mJRUUP03hc6jfUWd8dTGwTz0NLwEGi9Ya9nZ
         2GrJDhJc3UfH+xT5TqlKPEtH8et5bLu6ENNmULb189RE/ZFf7ctrYe3U68rtbuyuUFO5
         redwncvhy+RkqyfLywNvm5wSV/yzKRwM1kzPk29bwj3B4MTOpBUGx2tXc197Ay2gk6OI
         s22hO9eWxdOtfVZtt0Nk1RPXLzZ00JVIl8iU8PMIupyezX36D1X9oH8mEXgvLU3gbP+Q
         bSkuml5N7wv9c60CqSF1ul0BMQOwIpPr6W/9ri9F+RJX1+HanEl7E2itIiGh26Mk5zWB
         QNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714906; x=1789319706;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybo9oFe6iDvjjcDhnYminurOrpz0f2+5WnEtJ/QJDZA=;
        b=Hd2CRQyK5NwqNcmOWD1Xr/ALOVw+rnaPlafC+NEHHMFuedd+GUUMHTjglSI+NzxPOk
         jhiJzyBYN0UYTf4IkVZBAeI3v0nYKbkfeWwmZ29mj7wAzMa833qxZp01dMoyVsPN6Z0p
         9v9mLqpY6arb01WjPkhCqnZw7ckeQCLPWq8XUVyaW4D4u9GORgpReJ4ZcWKS/Wd9WqJt
         bzz1okFvNAA9w8yZFUZucKiPwEwimPC1iPrWCFI9qLVOMGltua3c9QdAyMuIUypz44sE
         CExwgwjBhu0iwMfngx06T97mRgoR4r623kyRmylGmnTBm4RtBy64NQ0dzMiateX8N3Tf
         JUXA==
X-Forwarded-Encrypted: i=1; AKwUvByb2TL1RzNJW2DfVKyRF0PSV89hJ0kTRowYzPeuFR+z8WB8wt+Jx8bWht3V3xw3+J0E8nu4BUj7qPX+jek=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxLWKO2W2t9CKWRcDFUkVdMDKmIEigXtiOj1PrCu6XciYaWZ2
	alIZPbqimxn8rOkgDEpw1Rr/eiuS4BR8RK9sgqiyKF5dxl4L1iNlIaLHw99Fn8Pybpl/1TvZedY
	r5MjOSku3ImSE1VmdUAdEHcqmahbicWY=
X-Gm-Gg: AYBFou1YwLt+8XzuZKGACkY1PT/A3pwQ/goM78Ns48LgE0pYEhQZeeCv8x4NUm+AS5n
	UUQGX8Nuk7LwVfYuUHAYqmblgkuQ/uyZYxaLjIvBtskr/WkqliO0hNp2HGVEvGVHnK1EDLUbnpj
	ns/fGqmSCddLtDyex6GrYPmGO5RpmTL9xL1pA8ODHDHhWkto3VBYuf2H7tE00b70GJq8KjJj9B8
	Xax5haJ3gnZ0A1wGYWxto1IzrPPvpAsptJsLgAyTzCgN665ZTpa6HgbXcz17pvy/KbifwB79UJZ
	99FSRSTY8WsifQUt1rP0DC0fQbeGZtzCDA20baTLuf7/VCB8zmBGMAv2KSW5mLw3qzf8rzEy7GC
	5BVwEzv8zbgD+urQP1guY
X-Received: by 2002:a05:6512:234e:b0:5b6:1a7c:2c with SMTP id
 2adb3069b0e04-5b61a7c0178mr2265389e87.47.1788714906014; Sun, 06 Sep 2026
 10:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnMt5YMA70FJwH+ddo24Ejd8HbpFSgUv73Ybu-fu+F-gcoesQ@mail.gmail.com>
 <CAMnMt5Y_fL0cHQ1CjU9+vn0rZVO5eitL6h0dTQ5Wg48c68-yYg@mail.gmail.com>
In-Reply-To: <CAMnMt5Y_fL0cHQ1CjU9+vn0rZVO5eitL6h0dTQ5Wg48c68-yYg@mail.gmail.com>
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:14:58 +0300
X-Gm-Features: AcwNN1UHmL_20l79vWgk-QmH6vtnCXOWhhgvyhzIIbOddRbEr7UlXb4KcCfeXp8
Message-ID: <CAMnMt5Y5gKSYk3HjNhdBGZQCg3OwsZ714ZbROzuw_=KVaX0bHQ@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000093f229065ad3a478"

--00000000000093f229065ad3a478
Content-Type: multipart/alternative; boundary="00000000000093f228065ad3a476"

--00000000000093f228065ad3a476
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

--00000000000093f228065ad3a476
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
arget=3D"_blank">germanaizek0@gmail.com</a>&gt;</div></div>

--00000000000093f228065ad3a476--
--00000000000093f229065ad3a478
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq2nndb0>
X-Attachment-Id: f_mtq2nndb0

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
--00000000000093f229065ad3a478--
