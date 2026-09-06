Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21A24EA90
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725880; cv=pass; b=GGLwj9T+oy6FkGd2HFCKjkzI2TsWBdu0H0ijqTGRGgKNDQ7qV3r07iGpJtSazojGa0GxyHBfFPzmD5gtdy4tDmtO4/+49G61HLdlTpgYQB0R7BcLTQckrwizD2TBjLijghszLGr3UKtcbAkVG7FDbNkMnXXX9v1yk0X5rh/Ql0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725880; c=relaxed/simple;
	bh=lyXZlgCF7BVVftsLxxxPxTCVdlePvzDal2dJg3r7ohA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=P4ww9q0as9sc1XGt0tSooCYxMTXADBPfgxfItNMbPD6AwhjjRNUE1y90tTXqtrtov/tPhj2Z2Zgg0x4EyRsKYHoSyeykr/1nikpQNcB+PXsa/FWOfVahqmLFSbnLzLPloZvfuDcBHuyfXqbmQ7EhwRt/59zDLn1kZo++4dG7Qv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuTZV0Vf; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuTZV0Vf"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so5756649a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788725877; cv=none;
        d=google.com; s=arc-20260327;
        b=MkXMWCPTSu37YPqbj5h+HPgz6qUxxVyRr2utfHZMPwDzjzFhq6yjvVk87t1l87eDlg
         1ofxRYaNPEKUGGfLPPcTiijN8p496wxBYylj9t9QA7geKpBHnj9LorKEBKPtB6LdspPc
         XHUbprWPWtwBySIgfrhsuC6j14uHHL+Osf/tLpr/KspsS5L9EiRKh0Py6Rc1mhlaPaU3
         nRLi1PqrItaO2+aKaHXtP2GiDY8TCBcf4Otthb3iMPi+0dVKqt5V1FG0PuQ1KWiaJDCE
         RxD2VNt77Mjtfsyr9UunyeE4duEkT6dxfqdS/1/xB93CPzuEep1FEyBBsz5mjJ19sSVq
         Wh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jAjjI82aHAkhJLWmgT8McMk47izfFq2ietX96dnVZrs=;
        fh=vtu5XNkBKNpjEYW52nIRQ5+eFgoT1Kmd3LXk9dGs4lY=;
        b=J3Qw/W4t6jD1uv9OwcggPwCRaQj0kPz/ovWXjfiPnb6x7JTqz84nNithMSesW4sNqw
         ZBZLcXR0nc+exr5UzpuoXk4TJN5sICw0nsvxmtqF3jRAJvP3FAlvGo4y15apYi9P3AS6
         0gZe/88lR19q6cPpsVW4OFYAavXG8yw2AOjUxRq/ykhOoyvI3gsrSiJKRyYtAl9aaDuK
         Nc/BnNzqfjxs74Olw/6ojxW0WsXhg8kil0ax8li3puMnEZ9FJg6AEXohVrO9UI6H68Oo
         IwFsgq7tfGDoX//y2qFMFumHP6q7284VhGaV5TL3Tw+DbonaNOYsbAJ5PXGoX5rjFJ3P
         v6rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725877; x=1789330677; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jAjjI82aHAkhJLWmgT8McMk47izfFq2ietX96dnVZrs=;
        b=ZuTZV0VfNnpoDbMTSLCwdxY7CSnsbkMH7Hy7t8NPiZMIxI320ZGS/EmfZegkARsaeX
         Wr9kvmxG7hY0QdLnX2PThhAkCNHtvDMWleFyWSHUvvkxzT+Vp6kn0f0FPh01toPAQZ00
         4Mps6kDHnjE5CbLavzPp4ZhNQvtji4OnydCWKpojWlNwY0T3W1tBnboYWku6p1e0ZFPb
         HSTwkrkScFeUl4pTKFXNVLLXGfV5rpU6c/hlKG5VFAgOwadOlhqmZBGwpfyCsocOcGSC
         vbgjt8djm/sVfjK087WRtpLc9BNWDqoje8RqH4GS63HcXqpCT1DAjssfgfU/aE4ausu1
         Zziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725877; x=1789330677;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAjjI82aHAkhJLWmgT8McMk47izfFq2ietX96dnVZrs=;
        b=NiptSus80HgvLh8U5xDG7UwzAQhOT/spLAuHRmuq8lMk2fhgKwKK/g08aKevAoIJBE
         QOAwPh6LJaAeWwik7OgTbvAnAwtZLfmn3JPnLtdHxL5fcv4cElBYUY/e++89fSGg1V/9
         LyeUxLAafBQgy35VhgTess6fE32JcoCTdmfT2F2TDjeTh53YM7lXFEUyBJRBsfjKgoY0
         mQD2KY2OoA8XeMargNyD5barMjySTPNjntJxvm+pRLl5LWmB5akx5K3sxzd2n/WZsuI2
         T4/m3M1kG/rbGVrCohpepPB5kqLFtxzfi3eLrIWsKu2ieILD1UfRX1/MSyqX9PcmW2GL
         ExoA==
X-Forwarded-Encrypted: i=1; AKwUvBwbUYPWP4W5PecFtLshY8kJfQDwquKrLYloTyJA4SAI+XuVIUTOZanndcte0lOc3A1sZ2smy/v1TvAW3Ng=@vger.kernel.org
X-Gm-Message-State: AFuF++nm5+eEFCAPdBtvxwZBcxp9Er55YhtI87ASb4fDw2bOAzhPnVvY
	AuD6NMohF2hbFP5ywqksmu5P8vCB/JUveOuqivj6Az/t1Inw2YJ9p6c5KSQ3jvYDSx2N6ksYsXy
	gH9rkNGbL6XJg2+FHut5lmEKLVFLJM9/oDuSf
X-Gm-Gg: AYBFou1jUxC08YpGO4raYxgnF09lQBgAK9iBwD9DdW4fKmCDAgpnoB2CPlcVYJx3pz8
	Zl/TWYdYdr05LgiALLk7g3LqhRLJgjpNXKzunXzhxmGWPmc69Ytkns25LcwZlWtgj4MhUgRkD8P
	7/Fx0thkeuwMzYxOlAYnoNFfdG+QMgUzdTwlcCL3VNUIDSgVtSJrgN29+DPLDOssG6v9+UfuMBW
	fTumD4vg+ndmuWfTUMOnCyBCR8WV6UYrF8d/Qd5HllnHkgsxM6K/pR/ElPaahmpqT+wXhb7oHUf
	J+lDa3G/ShCi2ZzWUpvR9Tz5qCaP59QGG6ZxTh1lIAf1r+D0XKfGmckmuANLN74W6IxquvmqykG
	MzjfA1DC2CSFo5v5ultA0hR82Qu/hinQ=
X-Received: by 2002:a05:6402:270c:b0:6a6:b2b9:61f9 with SMTP id
 4fb4d7f45d1cf-6a7e9520211mr5863212a12.13.1788725876598; Sun, 06 Sep 2026
 13:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 23:17:49 +0300
X-Gm-Features: AcwNN1XfTsYgOA2Z4O3BMhk2THXD-qKeJZKhwUVDjUFQUKn_MheadpRHqWnnvq0
Message-ID: <CAMnMt5bJr68_YMH5nA6Z7TvsjpHF674U8CBTCwME4vtgaVJ9cA@mail.gmail.com>
Subject: [PATCH wireless-next] wifi: mt7601u: add vnd_reset parameter to fix
 probe failure on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000079f912065ad632a1"

--00000000000079f912065ad632a1
Content-Type: text/plain; charset="UTF-8"



--00000000000079f912065ad632a1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.patch"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq970e40>
X-Attachment-Id: f_mtq970e40

RnJvbSBjMDNkNzNkMzdkZjQ0MGQwMDQ2ZDY4NDA2ZmRlMmFhMWY2MmZlMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZXJtYW4gU2VtZW5vZmYgPEdlcm1hbkFpemVrQGFpemVrZ3Jv
dXAucnU+CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNzoxNDozMiArMDMwMApTdWJqZWN0OiBbUEFU
Q0ggd2lyZWxlc3MtbmV4dF0gd2lmaTogbXQ3NjAxdTogYWRkIHZuZF9yZXNldCBwYXJhbWV0ZXIg
dG8gZml4IHByb2JlIGZhaWx1cmUgb24gVGVuZGEgVTIKCk9uIGNlcnRhaW4gTVQ3NjAxVSBhZGFw
dGVycywgc3VjaCBhcyBUZW5kYSBVMiBhbmQgb3RoZXIgbmV3ZXIgaGFyZHdhcmUKcmV2aXNpb25z
LCBkcml2ZXIgaW5pdGlhbGl6YXRpb24gY29uc2lzdGVudGx5IGZhaWxzIGR1cmluZyBwcm9iZSB3
aXRoCnZlbmRvciByZXF1ZXN0IHRpbWVvdXRzICgtMTEwIC8gLUVUSU1FRE9VVCk6CgogICAgbXQ3
NjAxdSAzLTE0OjEuMDogQVNJQyByZXZpc2lvbjogNzYwMTAwMDEgTUFDIHJldmlzaW9uOiA3NjAx
MDUwMAogICAgbXQ3NjAxdSAzLTE0OjEuMDogRmlybXdhcmUgVmVyc2lvbjogMC4xLjAwIEJ1aWxk
OiA3NjQwCiAgICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6MDcgb2ZmOjA5
YTggZmFpbGVkOi0xMTAKICAgIG10NzYwMXUgMy0xNDoxLjA6IFZlbmRvciByZXF1ZXN0IHJlcTow
MiBvZmY6MDlhOCBmYWlsZWQ6LTExMAogICAgbXQ3NjAxdSAzLTE0OjEuMDogVmVuZG9yIHJlcXVl
c3QgcmVxOjA3IG9mZjowNzM0IGZhaWxlZDotMTEwCiAgICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5k
b3IgcmVxdWVzdCByZXE6NDIgb2ZmOjAyMzAgZmFpbGVkOi0xMTAKICAgIG10NzYwMXUgMy0xNDox
LjA6IHByb2JlIHdpdGggZHJpdmVyIG10NzYwMXUgZmFpbGVkIHdpdGggZXJyb3IgLTExMAoKVGhl
IGZhaWx1cmUgb2NjdXJzIGJlY2F1c2UgbXQ3NjAxdV9sb2FkX2Zpcm13YXJlKCkgdW5jb25kaXRp
b25hbGx5IGNhbGxzCm10NzYwMXVfdmVuZG9yX3Jlc2V0KCkgKE1UX1ZFTkRfREVWX01PREVfUkVT
RVQpIGJlZm9yZSB1cGxvYWRpbmcgZmlybXdhcmUKY2h1bmtzLiBPbiB0aGVzZSBkZXZpY2VzLCBp
c3N1aW5nIHRoaXMgdmVuZG9yIHJlc2V0IGxlYXZlcyB0aGUgaW50ZXJuYWwKTUNVIC8gRkNFIERN
QSBlbmdpbmUgaW4gYW4gdW5yZXNwb25zaXZlIHN0YXRlIGFmdGVyIHRoZSBmaXJzdCBmaXJtd2Fy
ZQpVUkIgaXMgc3VibWl0dGVkLiBBcyBhIHJlc3VsdCwgcmVhZGluZyBNVF9UWF9DUFVfRlJPTV9G
Q0VfQ1BVX0RFU0NfSURYCigweDA5YTgpIGltbWVkaWF0ZWx5IHRpbWVzIG91dC4KCkludHJvZHVj
ZSBhIGJvb2xlYW4gbW9kdWxlIHBhcmFtZXRlciAndm5kX3Jlc2V0JyAoZGVmYXVsdDogZmFsc2Up
IHRvCm1ha2UgdGhpcyB2ZW5kb3IgcmVzZXQgb3B0aW9uYWwuIFdoZW4gdGhlIHZlbmRvciByZXNl
dCBpcyBza2lwcGVkLApmaXJtd2FyZSB1cGxvYWQgc3VjY2VlZHMgYW5kIHRoZSB3aXJlbGVzcyBp
bnRlcmZhY2UgaW5pdGlhbGl6ZXMgbm9ybWFsbHkuCgpMaW5rOiBodHRwczovL2J1Z3MubGF1bmNo
cGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51eC8rYnVnLzE3MTYzMDEKTGluazogaHR0cHM6Ly93
d3cub3BlbmEudHYvdmlld3RvcGljLnBocD90PTYzOTE5Ckxpbms6IGh0dHBzOi8vYXNrdWJ1bnR1
LmNvbS9xdWVzdGlvbnMvMTQxODg1MC90aGUtcHJvYmxlbS13aXRoLXdpLWZpLXUyCkxpbms6IGh0
dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld3RvcGljLnBocD9pZD0yMjQ4NTkKTGluazogaHR0
cHM6Ly9yZWRkaXQuY29tL3IvYXJjaGxpbnV4L2NvbW1lbnRzLzFkNmRmdjUvbXQ3NjAxdV91c2Jf
d2lmaV9ub3Rfd29ya2luZy8KU2lnbmVkLW9mZi1ieTogSGVybWFuIFNlbWVub2ZmIDxHZXJtYW5B
aXpla0BhaXpla2dyb3VwLnJ1PgotLS0KVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBsaW51eC1uZXh0
ICh0YWc6IG5leHQtMjAyNjA5MDQsIGNvbW1pdCBhZjVmMTI4MDVlNWMpCmFuZCB0YXJnZXRzIHRo
ZSB3aXJlbGVzcy1uZXh0IHRyZWUuCgpOb3RlOiBBbHRlcm5hdGl2ZWx5LCBpZiBtYWludGFpbmVy
cyBwcmVmZXIgdG8gYXZvaWQgYWRkaW5nIGEgbW9kdWxlCnBhcmFtZXRlciBhbmQgY2FuIGNvbmZp
cm0gdGhhdCBtdDc2MDF1X3ZlbmRvcl9yZXNldCgpIGlzIG5vdCByZXF1aXJlZApvbiBhbnkgc3Vw
cG9ydGVkIGhhcmR3YXJlLCB0aGUgdmVuZG9yIHJlc2V0IGNhbGwgY291bGQgaW5zdGVhZCBiZSBk
cm9wcGVkCmVudGlyZWx5LgoKIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYwMXUv
bWN1LmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2MDF1L21jdS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9t
Y3UuYwppbmRleCBiYWQ2Y2E4MjE0MDAuLmM3YzViZDliYjlkZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYworKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC91c2IuaD4KICNpbmNsdWRlIDxsaW51
eC9za2J1ZmYuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogCiAjaW5jbHVkZSAi
bXQ3NjAxdS5oIgogI2luY2x1ZGUgImRtYS5oIgpAQCAtMjEsNiArMjIsMTAgQEAKICNkZWZpbmUg
TUNVX0ZXX1VSQl9TSVpFCQkJKE1DVV9GV19VUkJfTUFYX1BBWUxPQUQgKyAxMikKICNkZWZpbmUg
TUNVX1JFU1BfVVJCX1NJWkUJCTEwMjQKIAorc3RhdGljIGJvb2wgdm5kX3Jlc2V0OworbW9kdWxl
X3BhcmFtKHZuZF9yZXNldCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKHZuZF9yZXNl
dCwgIlBlcmZvcm0gdmVuZG9yIHJlc2V0IGR1cmluZyBmaXJtd2FyZSB1cGxvYWQgKGRlZmF1bHQ6
IGZhbHNlKSIpOworCiBzdGF0aWMgaW5saW5lIGludCBmaXJtd2FyZV9ydW5uaW5nKHN0cnVjdCBt
dDc2MDF1X2RldiAqZGV2KQogewogCXJldHVybiBtdDc2MDF1X3JyKGRldiwgTVRfTUNVX0NPTV9S
RUcwKSA9PSAxOwpAQCAtNDU5LDggKzQ2NCwxMCBAQCBzdGF0aWMgaW50IG10NzYwMXVfbG9hZF9m
aXJtd2FyZShzdHJ1Y3QgbXQ3NjAxdV9kZXYgKmRldikKIAltdDc2MDF1X3dyKGRldiwgMHg5NGMs
IDApOwogCW10NzYwMXVfd3IoZGV2LCBNVF9GQ0VfUFNFX0NUUkwsIDApOwogCi0JbXQ3NjAxdV92
ZW5kb3JfcmVzZXQoZGV2KTsKLQltc2xlZXAoNSk7CisJaWYgKHZuZF9yZXNldCkgeworCQltdDc2
MDF1X3ZlbmRvcl9yZXNldChkZXYpOworCQl1c2xlZXBfcmFuZ2UoNTAwMCwgMTAwMDApOworCX0K
IAogCW10NzYwMXVfd3IoZGV2LCAweGE0NCwgMCk7CiAJbXQ3NjAxdV93cihkZXYsIDB4MjMwLCAw
eDg0MjEwKTsKLS0gCjIuNTUuMAoKYmFzZS1jb21taXQ6IGFmNWYxMjgwNWU1Y2VmYTRmZTY4ZDYx
MjdjN2UxZmI3OGNkNTUzNWMK
--00000000000079f912065ad632a1--
