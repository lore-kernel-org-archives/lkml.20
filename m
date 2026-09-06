Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BA479DA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716907; cv=pass; b=aH4ljhe1k7YS2t9spSCnlDY3NPE/fT/fthfAGd/9i6o7lYzF8BIaKi/nWhxRrnglQhFQhSlBDC4CAlg3R5S5SNgTvOEWp5ORbKP8q1q4F05NTYeBusgMZa2sM94F1qEnmRvozb+EJ3mQ8ockJwIAwC+/nkxbBnoMv4HMYMYsur8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716907; c=relaxed/simple;
	bh=ovlhA+MIk7280wlcskFbOEAkUU3IAPDrHdY4d3F0vTs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kpD3wQOwqk5UNYfKxT7WpCKZToio4CRnPKANupiPWql2AD5NbqlWQKLLrIagOzw2uYHYEh9Ml3Wa65LBMLiquPTni9zCE+0homHJsMqfRA+PsN3xUOeSjasL+uY4StB9PIJ2yaSuFwakFrdTSJdtCPQoi2RnhN9pu6wi6KRrkxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM3P4A5+; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM3P4A5+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso4557909a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788716904; cv=none;
        d=google.com; s=arc-20260327;
        b=AuOsjw85piFKpu0yjeGK7TFAT15c7NIPEmFQcdpTpVri7c6rk/FgURfZ2j7OKsXhZx
         wQMjCLonSHQypmhFbRYGv4dV/7HlwHQLV3TqdjFrP5WvCkCdYNHoB2r8N+J7JUYvCeXH
         2vbkdPpniRTEOBYRq2AzIFgXh6kdCIAaYit6B+sgBDz2DEatnZo0O3HgM4Q98m4QI+fG
         dp5KizS7/yZ/5PKL3fgallnKagoHcuelnhU9RKbPdq31vE0BrYnz4WZgy79urqHMMhqo
         qv+RKy7xNOJ1yecY6QBpyT29k29DhKp/Cp2EzCp13x09e/SQ+Zo+2NCsXyLuaxlTUzyX
         av1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VoXlq/7Z5sou+7CbF11qCK5rmUwVZipwrVhxwgAt8yE=;
        fh=y5vSi+c3R8kfMxY4CKWEznxYXIQDJ0XGdJ/2AoyOj9M=;
        b=V5/BZb0JKvIRPHAu+H4gUS9rWY6NQqdPa4PjBEm0hvLYllFc4sj/OdbTcjRGiyTkEG
         BqOYEod6kvE9G+nOgMIaJebVfeC3YS1HnTbxm/5NKxDnV4eQ1jD2u08cPfQuVSJKmjBJ
         juiVcxNnS+qF/wcB/GStRJj/vgaQqjp05sbVwNe4G8RKCuIsmJOWUjmFjAIen//uM8NP
         6SwViaSI1pKimveZ1FDuDxe4YCXc6uw0VPTfEftxakunICyW6Cru7D7oxPye9AwFC9n6
         zCD7Cs3iENzso2ZGN9dtxHlIRqGvfjOd4GyWdLNwbzDnpHuL3spXeg229PpgooP82s8O
         lrBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788716904; x=1789321704; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VoXlq/7Z5sou+7CbF11qCK5rmUwVZipwrVhxwgAt8yE=;
        b=fM3P4A5+XIj/2p/OxVam5Q57B7cAhn9HA41R1kXRVTu+yBuIwV5aQXFL70MOKXkt3Z
         m/wQw6gc3+8fQ8SRlRBaZ8mubfvRDZW9tzJp4n2mZPbZo+N+pDVDtORA/tK93VKhdL1i
         hF1oH7xWM5wutnfwHwyiHkPyRA9yuSgyppjLXXkD/Rf6FEqMuq6vUg+L0voxPBoYwqM+
         rJbUe7qYO5JjB4ldRkK24afQengKQ215IELh9yke53/tGGiAr+gG7Q0V75rT0PHIjMr6
         YRea5JI8tAzOkILCG7lRfZ463rDlra3GcfLN6U13yLyWCtXxz+b1Mk6ELE5GBFP7lpVR
         FKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716904; x=1789321704;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoXlq/7Z5sou+7CbF11qCK5rmUwVZipwrVhxwgAt8yE=;
        b=fIAvDxC/HYgcpcgOZq4mS4TSX24TJYvVyaP4e1RXvCp07A34afBaxm5na5kkA1bdgy
         x42UgIlV6myOqCeqAK8wor7c8b8xP3zsg+EEBFqjX3pvxUUJKxb94u+ks0Bly74Gk7w0
         m9qEzFcjQxibOEspt+mC70MC1+ZMokwwCIhVna8ltUpLAN2qViW6HtmwMSagviCGtJ2I
         kvUOGhbqNZfzmnvMH32OlZeZD+m2P40YRm1G1yrKiZgB+rhvDDzqj+YxRa55X2qgMayj
         k5uvmn+an9Hn9G4RUKlW+6cjfvrAuYiFcNBlxf5X1mjh0LMprVJrEZ89LT9TsaWMdhxr
         FK4w==
X-Forwarded-Encrypted: i=1; AKwUvBz6TWTpki1YTzIF6ERQPYNwSx7hLcIkxsy6byKDcGTk5hgR5i22X+U7pEswW5sVfS9KQ7m6c3joBc9f78Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kiGSOxxJjsitNq0GHb6eSxTAKEnEC3DbFUQ7Pv7/mPwhT2kWy1
	gYXXTfDQZe+s3dJpBZ6nlFxPKO6ZxcwojD0YBezLJTBJXRFidjtO6LXAkEpTvpHKsZLHkaOU/2C
	y3Fhavs5Rp9x4z/p5gSDlmRWCBJllaQk=
X-Gm-Gg: AYBFou39dFX2j201Wi5mXb2RR6eoZqJz7bIZ+96euKXcX7yQmvmoKOCHlK9/EaJ+H88
	V2+VyMLw2Ch1rnWVAWSt3opymi3ipOBey8AiQuMQyGv3pQeav1VuBcfHkeBy0tFLz4tPZiz2ap5
	IZP3oD9ExSSEjjVUOsl3e35973MkHjYepReG5iJ1mf+pFvH6ff01x4iMq85hHXQdSQ1jL25wA/k
	eGroLdW/hBQtXE2wV40pxMsLqJDxF4o76DW0gY42z4VPkprPi31G5Avd0exM/UknrM/z60BRx6t
	UGdu8ufCJJXb++BAiI8hCBU7h2UoV5gCmvTh+EFR2oqrXMYj89I84HVX8NqkGzMnfstRnohiaMK
	rulT31rFaYcx/roD+57XU
X-Received: by 2002:a05:6402:210e:b0:6a7:ea53:f627 with SMTP id
 4fb4d7f45d1cf-6a7ea540c64mr5670808a12.38.1788716904287; Sun, 06 Sep 2026
 10:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:48:17 +0300
X-Gm-Features: AcwNN1WHuEebqIea3uwc4iHBnS8ftGoxWCfL7vOIhkb2CxOINShsY6xGifoWCY0
Message-ID: <CAMnMt5Y1cZXb8v0UTQkXwhXGkKPEuXPcxdHBDmru9p5hQ8a7hg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000af49aa065ad41b9d"

--000000000000af49aa065ad41b9d
Content-Type: text/plain; charset="UTF-8"



--000000000000af49aa065ad41b9d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq3uqto0>
X-Attachment-Id: f_mtq3uqto0

RnJvbSBjMDNkNzNkMzdkZjQ0MGQwMDQ2ZDY4NDA2ZmRlMmFhMWY2MmZlMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZXJtYW4gU2VtZW5vZmYgPEdlcm1hbkFpemVrQGFpemVrZ3Jv
dXAucnU+CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNzoxNDozMiArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIHdpZmk6IG10NzYwMXU6IGFkZCB2bmRfcmVzZXQgcGFyYW1ldGVyIHRvIGZpeCBwcm9iZQog
ZmFpbHVyZSBvbiBUZW5kYSBVMgoKd2lmaTogbXQ3NjAxdTogYWRkIHZuZF9yZXNldCBwYXJhbWV0
ZXIgdG8gZml4IHByb2JlIGZhaWx1cmUgb24gVGVuZGEgVTIKCk9uIGNlcnRhaW4gTVQ3NjAxVSBh
ZGFwdGVycywgc3VjaCBhcyBUZW5kYSBVMiBhbmQKb3RoZXIgbmV3ZXIgaGFyZHdhcmUgcmV2aXNp
b25zLCBkcml2ZXIgaW5pdGlhbGl6YXRpb24gY29uc2lzdGVudGx5IGZhaWxzCmR1cmluZyBwcm9i
ZSB3aXRoIHZlbmRvciByZXF1ZXN0IHRpbWVvdXRzICgtMTEwIC8gLUVUSU1FRE9VVCk6CiAgbXQ3
NjAxdSAzLTE0OjEuMDogQVNJQyByZXZpc2lvbjogNzYwMTAwMDEgTUFDIHJldmlzaW9uOiA3NjAx
MDUwMAogIG10NzYwMXUgMy0xNDoxLjA6IEZpcm13YXJlIFZlcnNpb246IDAuMS4wMCBCdWlsZDog
NzY0MCBCdWlsZCB0aW1lOiAyMDEzMDIwNTIxNDZfX19fCiAgbXQ3NjAxdSAzLTE0OjEuMDogVmVu
ZG9yIHJlcXVlc3QgcmVxOjA3IG9mZjowOWE4IGZhaWxlZDotMTEwCiAgbXQ3NjAxdSAzLTE0OjEu
MDogVmVuZG9yIHJlcXVlc3QgcmVxOjAyIG9mZjowOWE4IGZhaWxlZDotMTEwCiAgbXQ3NjAxdSAz
LTE0OjEuMDogVmVuZG9yIHJlcXVlc3QgcmVxOjA3IG9mZjowNzM0IGZhaWxlZDotMTEwCiAgbXQ3
NjAxdSAzLTE0OjEuMDogVmVuZG9yIHJlcXVlc3QgcmVxOjQyIG9mZjowMjMwIGZhaWxlZDotMTEw
CiAgbXQ3NjAxdSAzLTE0OjEuMDogcHJvYmUgd2l0aCBkcml2ZXIgbXQ3NjAxdSBmYWlsZWQgd2l0
aCBlcnJvciAtMTEwCgpUaGUgZmFpbHVyZSBvY2N1cnMgYmVjYXVzZSBtdDc2MDF1X2xvYWRfZmly
bXdhcmUoKSB1bmNvbmRpdGlvbmFsbHkgY2FsbHMKbXQ3NjAxdV92ZW5kb3JfcmVzZXQoKSAoTVRf
VkVORF9ERVZfTU9ERV9SRVNFVCkgYmVmb3JlIHVwbG9hZGluZyBmaXJtd2FyZQpjaHVua3MuIE9u
IHRoZXNlIGRldmljZXMsIGlzc3VpbmcgdGhpcyB2ZW5kb3IgcmVzZXQgbGVhdmVzIHRoZSBpbnRl
cm5hbApNQ1UgLyBGQ0UgRE1BIGVuZ2luZSBpbiBhbiB1bnJlc3BvbnNpdmUgc3RhdGUgYWZ0ZXIg
dGhlIGZpcnN0IGZpcm13YXJlClVSQiBpcyBzdWJtaXR0ZWQuIEFzIGEgcmVzdWx0LCByZWFkaW5n
IE1UX1RYX0NQVV9GUk9NX0ZDRV9DUFVfREVTQ19JRFgKKDB4MDlhOCkgaW1tZWRpYXRlbHkgdGlt
ZXMgb3V0LgpJbnRyb2R1Y2UgYSBib29sZWFuIG1vZHVsZSBwYXJhbWV0ZXIgJ3ZuZF9yZXNldCcg
KGRlZmF1bHQ6IGZhbHNlKSB0bwptYWtlIHRoaXMgdmVuZG9yIHJlc2V0IG9wdGlvbmFsLiBXaGVu
IHRoZSB2ZW5kb3IgcmVzZXQgaXMgc2tpcHBlZCwKZmlybXdhcmUgdXBsb2FkIHN1Y2NlZWRzIGFu
ZCB0aGUgd2lyZWxlc3MgaW50ZXJmYWNlIGluaXRpYWxpemVzIG5vcm1hbGx5LgoKTGluazogaHR0
cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xNzE2MzAx
CgpNb3JlIGlzc3VlcyB3aXRoIFRlbmRhIFUyIGFuZCBMaW51eDoKLSBodHRwczovL3d3dy5vcGVu
YS50di92aWV3dG9waWMucGhwP3Q9NjM5MTkKLSBodHRwczovL2Fza3VidW50dS5jb20vcXVlc3Rp
b25zLzE0MTg4NTAvdGhlLXByb2JsZW0td2l0aC13aS1maS11MgotIGh0dHBzOi8vYmJzLmFyY2hs
aW51eC5vcmcvdmlld3RvcGljLnBocD9pZD0yMjQ4NTkKLSBodHRwczovL3d3dy5yZWRkaXQuY29t
L3IvYXJjaGxpbnV4L2NvbW1lbnRzLzFkNmRmdjUvbXQ3NjAxdV91c2Jfd2lmaV9ub3Rfd29ya2lu
Zy8KClNpZ25lZC1vZmYtYnk6IEhlcm1hbiBTZW1lbm9mZiA8R2VybWFuQWl6ZWtAYWl6ZWtncm91
cC5ydT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jIHwg
MTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9t
dDc2MDF1L21jdS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3Uu
YwppbmRleCBiYWQ2Y2E4MjEuLmFiZjQ3NjdmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2MDF1L21jdS5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC91c2IuaD4KICNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogCiAjaW5jbHVkZSAibXQ3NjAxdS5o
IgogI2luY2x1ZGUgImRtYS5oIgpAQCAtMjEsNiArMjIsMTQgQEAKICNkZWZpbmUgTUNVX0ZXX1VS
Ql9TSVpFCQkJKE1DVV9GV19VUkJfTUFYX1BBWUxPQUQgKyAxMikKICNkZWZpbmUgTUNVX1JFU1Bf
VVJCX1NJWkUJCTEwMjQKIAorc3RhdGljIGJvb2wgdm5kX3Jlc2V0OworbW9kdWxlX3BhcmFtKHZu
ZF9yZXNldCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKHZuZF9yZXNldCwgIlBlcmZv
cm0gdmVuZG9yIHJlc2V0IGR1cmluZyBmaXJtd2FyZSB1cGxvYWQgKGRlZmF1bHQ6IGZhbHNlKSIp
OworCitzdGF0aWMgYm9vbCBkaXNhYmxlX3VzYl9zZzsKK21vZHVsZV9wYXJhbShkaXNhYmxlX3Vz
Yl9zZywgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGRpc2FibGVfdXNiX3NnLCAiVW51
c2VkIGNvbXBhdGliaWxpdHkgcGFyYW1ldGVyIik7CisKIHN0YXRpYyBpbmxpbmUgaW50IGZpcm13
YXJlX3J1bm5pbmcoc3RydWN0IG10NzYwMXVfZGV2ICpkZXYpCiB7CiAJcmV0dXJuIG10NzYwMXVf
cnIoZGV2LCBNVF9NQ1VfQ09NX1JFRzApID09IDE7CkBAIC00NTksOCArNDY4LDEwIEBAIHN0YXRp
YyBpbnQgbXQ3NjAxdV9sb2FkX2Zpcm13YXJlKHN0cnVjdCBtdDc2MDF1X2RldiAqZGV2KQogCW10
NzYwMXVfd3IoZGV2LCAweDk0YywgMCk7CiAJbXQ3NjAxdV93cihkZXYsIE1UX0ZDRV9QU0VfQ1RS
TCwgMCk7CiAKLQltdDc2MDF1X3ZlbmRvcl9yZXNldChkZXYpOwotCW1zbGVlcCg1KTsKKwlpZiAo
dm5kX3Jlc2V0KSB7CisJCW10NzYwMXVfdmVuZG9yX3Jlc2V0KGRldik7CisJCW1zbGVlcCg1KTsK
Kwl9CiAKIAltdDc2MDF1X3dyKGRldiwgMHhhNDQsIDApOwogCW10NzYwMXVfd3IoZGV2LCAweDIz
MCwgMHg4NDIxMCk7Ci0tIAoyLjU1LjAKCg==
--000000000000af49aa065ad41b9d--
