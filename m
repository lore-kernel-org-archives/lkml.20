Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789413546C8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717722; cv=pass; b=lC6KCTvkfTNH7Kh0KJtf9mp44UC4eD3LmdsPE8PE9f7g0OfjkPIHV7WOsAtqqkTQmUZrrP+xWqxAZ/Ml0f8lK00MFUIrbqGNAOrF1mz2rNSAuje0NqOWWuV0UlASdpsxmBV+YUS/2NlTsleYJCY1GcKczPGyTB0CtN2IGywPYvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717722; c=relaxed/simple;
	bh=xI31KzDmNebrs3Yun9Dmg4oEQQpO6zB1Vq9BpIgkwrQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eSjrUxxKR9XzMvVYhB7vfTo7KTN672TrseYlY1Mz3J5itngR9UZgaE8iU8VIr7Km1tyceMqh5l1QVwMf5SHTJw9Pbsf1I0cbLJT8e+I2TNRvR22vhRGWP6rjheaB8L4XHQAQLgMqb81uYMAXRrbyZYzus6gICFI0Qmn326vgexM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSUzZQxD; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSUzZQxD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so2315014a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788717716; cv=none;
        d=google.com; s=arc-20260327;
        b=IrvPWwnHsuynOtWv2e7h1ZabA0r8bgzAHX6kCthhYVF8uEY0fnsL9lRaF5kHx4Q2e4
         X7Rw11NoW+4n/fFI/UVX/IZBcFs+b452Nms4RUwCpSLRL00Zqq7YEUGJRJ95Vs3Ucl52
         +5riJ4Du2RB+tKh+HxCx4s/eaodLXM0KB7gJjZPpP+MSuQj5hbTwTxZIASbhwhKdFSj6
         v7hqjDWFHCtdQ3oK2qP2lrz/eOqXR0s8FHSM2l1j8s4fE0WeAUp90udOBRiLTKbAdRGp
         5ZJTswmvRIKSukRNTYuNZTJORjkyW2ktW/D310F/Tpl0VRJH8z2UA6MnKyNaSD0s9fud
         YLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Eiu6G9SJesOCocT4QwJEGZ7POy5rKPhjf69x2BmRzr0=;
        fh=dykaOziw1vD0gtjizr4y+VxfcnJpnwIj/6E5oUBO8eI=;
        b=pO1y2Oxs2NXzA6EiDHkQxkRjdmTXhp/bcxpJNpnntfdBNQ833W//CEn20ZKPdXLhfi
         /rZA7oRDvJDKFQ/YTdrVLHfK/kGomP+SCBt8zEQD8X0i1BBDXI+uPDLX/cnTBYmMQhmC
         sJOHSqTG3KqLgbasFMJvWVI3xvGs/V2DpraRr5j6EcQ8+MpdA6sKaHENKeIhCp5ituuo
         ns91srkYAHfSK1Kfe/Ua1r5/Z369BhwcvQX+XRqBvtaAfOc9DAYUsJFhNrcosUy/pCMc
         KWtHUEmYDFVdSgaaDTRvjQt0JSs8wCaR53CncL1k3k6gcSD2ltYlTBURUInuTURXjgmt
         0qig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788717716; x=1789322516; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Eiu6G9SJesOCocT4QwJEGZ7POy5rKPhjf69x2BmRzr0=;
        b=jSUzZQxDQc+1bkE3xdoZAY3OW8YeKgbG0qVJikqGe1nWPfIt466B75ZRxmcAw7Z/X0
         RxXFYGorHX4nsziGw3VhMNSSo2h18AKAz8VjKY6gcl4QjUZaCO6NBLQ1BFodQ8d3ZijG
         wjR3nLE8CedEPeyTk66tdiw0GWtwe1RsFa1Gf46rTSy8/mRmfphKKqXmrVvYbfujF3GK
         d4HHd8vZCRf6vYf+Z2mjF/8fQxMcSrif2VQUQPxhial18rOece/DceGAbOfjszkivVl4
         9NgKquQOS5nirw0ONBOQGsqWjfCWAe8pO6uz6gIgoa2U6MUqeqW5FiKYn/drkLNxOj2Z
         EVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717716; x=1789322516;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eiu6G9SJesOCocT4QwJEGZ7POy5rKPhjf69x2BmRzr0=;
        b=PQhTJQ2tOal1qC/g3BEif+Q+MrOynyaMkQQuS0p9DWOg+pm4a+TMG04iigNvIRIFsH
         g8xTMaP7a4bYpWlIG6vv9rVUncKUIlYg0g1o9yCENh+HFQBjPIzSt6Rjm/WiXwnhfFUM
         zbjBjkjWvnOITQB77P7O9VO++dCmg5Sk1OKLnC/jfZX05ExuAkUQGZ9e3gArp1mG1p0F
         NkJQY9cOzYgAotp/+xGl5BAFmyjUUR0kbrx13yqTA3pNcmTdRG3ApgxIK/ox4cH261xm
         4JqH9h/xRMU6JRdgdH3JPwIgoxQNsEPIPYKxpq8s9YwB09UPQCELqZI2gpJVBmekPfXS
         856g==
X-Forwarded-Encrypted: i=1; AKwUvBy1cx//gxFS1mbXjLmduO7OkD73Ebz4C21l0AyfWCdyjHIqaznQG8RGBa7LY3igkbJxaFrrdXVlI9Iv+24=@vger.kernel.org
X-Gm-Message-State: AFuF++lPRU2DPv75moq1ichG9C+Ua26qwbw3OelTw859AIVOVIxCbqc6
	Vh1ofoNgaxG6tague4JA+zaLAsz6krTgwQnpuzEMZQSnz8xTLj5NKw6+/7Ltl4Jx4HisL9dvpoR
	ZmPge0RxM/7homIBD/9HWbF/HoC3xHAyoEG+e
X-Gm-Gg: AYBFou3f+h3BE44sHarzPYk9/Ckplh3/n9X0TaM0V9VWQfrAPC2AphtrMtSXfbQeNfD
	Gd52GombLdAhWpe/Et+03uAv9AfxPRfrP+m/cwg73Azsea4RJp9oAVnCCHdHrj/MqT4iUxoqfw7
	E6xVXC2xUtossLoh64AfwTn1x6Knoxzg3Vod/NNtn/TizUNXe9dAG94K1puPMF+ONKb0rgRHsjw
	Z3Gcc9rouorRR6h+4/1UYFufsyds1weHfA9l/tMzzDjYrh/v2K0JqJ5UqZFt1wUkFTGNuLK3VoE
	fn0veEirCWTKjyBL+x6lCA43bxXfZKJOWfivsThv0j89d/YlSUyb5Eu1oHdFwtb1OBI7xLNBNod
	bBxVetBMF20OyppOJ9mVglQTjMC0fQ2Uj
X-Received: by 2002:a05:6402:5387:b0:6a6:1b08:3ab4 with SMTP id
 4fb4d7f45d1cf-6a7e8d79606mr6251850a12.2.1788717716348; Sun, 06 Sep 2026
 11:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 21:01:48 +0300
X-Gm-Features: AcwNN1U8NJLZdCx_d2FLiYUrdEo4QYSubggZvvOhj99L36jI6gqMcZ-T3eo-QOQ
Message-ID: <CAMnMt5a1PNfVPxYzPFfijj9-3NCX217cdKk1HpaxoGW9+BRtLg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000016603f065ad44cb7"

--00000000000016603f065ad44cb7
Content-Type: text/plain; charset="UTF-8"



--00000000000016603f065ad44cb7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq4c3em0>
X-Attachment-Id: f_mtq4c3em0

RnJvbSBjMDNkNzNkMzdkZjQ0MGQwMDQ2ZDY4NDA2ZmRlMmFhMWY2MmZlMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZXJtYW4gU2VtZW5vZmYgPEdlcm1hbkFpemVrQGFpemVrZ3Jv
dXAucnU+CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNzoxNDozMiArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIHdpZmk6IG10NzYwMXU6IGFkZCB2bmRfcmVzZXQgcGFyYW1ldGVyIHRvIGZpeCBwcm9iZSBm
YWlsdXJlIG9uIFRlbmRhIFUyCgpPbiBjZXJ0YWluIE1UNzYwMVUgYWRhcHRlcnMsIHN1Y2ggYXMg
VGVuZGEgVTIgYW5kIG90aGVyIG5ld2VyIGhhcmR3YXJlCnJldmlzaW9ucywgZHJpdmVyIGluaXRp
YWxpemF0aW9uIGNvbnNpc3RlbnRseSBmYWlscyBkdXJpbmcgcHJvYmUgd2l0aAp2ZW5kb3IgcmVx
dWVzdCB0aW1lb3V0cyAoLTExMCAvIC1FVElNRURPVVQpOgoKICBtdDc2MDF1IDMtMTQ6MS4wOiBB
U0lDIHJldmlzaW9uOiA3NjAxMDAwMSBNQUMgcmV2aXNpb246IDc2MDEwNTAwCiAgbXQ3NjAxdSAz
LTE0OjEuMDogRmlybXdhcmUgVmVyc2lvbjogMC4xLjAwIEJ1aWxkOiA3NjQwIEJ1aWxkIHRpbWU6
IDIwMTMwMjA1MjE0Nl9fX18KICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVzdCByZXE6
MDcgb2ZmOjA5YTggZmFpbGVkOi0xMTAKICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3IgcmVxdWVz
dCByZXE6MDIgb2ZmOjA5YTggZmFpbGVkOi0xMTAKICBtdDc2MDF1IDMtMTQ6MS4wOiBWZW5kb3Ig
cmVxdWVzdCByZXE6MDcgb2ZmOjA3MzQgZmFpbGVkOi0xMTAKICBtdDc2MDF1IDMtMTQ6MS4wOiBW
ZW5kb3IgcmVxdWVzdCByZXE6NDIgb2ZmOjAyMzAgZmFpbGVkOi0xMTAKICBtdDc2MDF1IDMtMTQ6
MS4wOiBwcm9iZSB3aXRoIGRyaXZlciBtdDc2MDF1IGZhaWxlZCB3aXRoIGVycm9yIC0xMTAKClRo
ZSBmYWlsdXJlIG9jY3VycyBiZWNhdXNlIG10NzYwMXVfbG9hZF9maXJtd2FyZSgpIHVuY29uZGl0
aW9uYWxseSBjYWxscwptdDc2MDF1X3ZlbmRvcl9yZXNldCgpIChNVF9WRU5EX0RFVl9NT0RFX1JF
U0VUKSBiZWZvcmUgdXBsb2FkaW5nIGZpcm13YXJlCmNodW5rcy4gT24gdGhlc2UgZGV2aWNlcywg
aXNzdWluZyB0aGlzIHZlbmRvciByZXNldCBsZWF2ZXMgdGhlIGludGVybmFsCk1DVSAvIEZDRSBE
TUEgZW5naW5lIGluIGFuIHVucmVzcG9uc2l2ZSBzdGF0ZSBhZnRlciB0aGUgZmlyc3QgZmlybXdh
cmUKVVJCIGlzIHN1Ym1pdHRlZC4gQXMgYSByZXN1bHQsIHJlYWRpbmcgTVRfVFhfQ1BVX0ZST01f
RkNFX0NQVV9ERVNDX0lEWAooMHgwOWE4KSBpbW1lZGlhdGVseSB0aW1lcyBvdXQuCgpJbnRyb2R1
Y2UgYSBib29sZWFuIG1vZHVsZSBwYXJhbWV0ZXIgJ3ZuZF9yZXNldCcgKGRlZmF1bHQ6IGZhbHNl
KSB0bwptYWtlIHRoaXMgdmVuZG9yIHJlc2V0IG9wdGlvbmFsLiBXaGVuIHRoZSB2ZW5kb3IgcmVz
ZXQgaXMgc2tpcHBlZCwKZmlybXdhcmUgdXBsb2FkIHN1Y2NlZWRzIGFuZCB0aGUgd2lyZWxlc3Mg
aW50ZXJmYWNlIGluaXRpYWxpemVzIG5vcm1hbGx5LgoKTGluazogaHR0cHM6Ly9idWdzLmxhdW5j
aHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xNzE2MzAxCkxpbms6IGh0dHBzOi8v
d3d3Lm9wZW5hLnR2L3ZpZXd0b3BpYy5waHA/dD02MzkxOQpMaW5rOiBodHRwczovL2Fza3VidW50
dS5jb20vcXVlc3Rpb25zLzE0MTg4NTAvdGhlLXByb2JsZW0td2l0aC13aS1maS11MgpMaW5rOiBo
dHRwczovL2Jicy5hcmNobGludXgub3JnL3ZpZXd0b3BpYy5waHA/aWQ9MjI0ODU5Ckxpbms6IGh0
dHBzOi8vcmVkZGl0LmNvbS9yL2FyY2hsaW51eC9jb21tZW50cy8xZDZkZnY1L210NzYwMXVfdXNi
X3dpZmlfbm90X3dvcmtpbmcvClNpZ25lZC1vZmYtYnk6IEhlcm1hbiBTZW1lbm9mZiA8R2VybWFu
QWl6ZWtAYWl6ZWtncm91cC5ydT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9t
dDc2MDF1L21jdS5jIHwgMTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3NjAxdS9tY3UuYwppbmRleCBiYWQ2Y2E4MjEuLmFiZjQ3NjdmMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYworKysgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jCkBAIC0xMCw2ICsxMCw3IEBACiAj
aW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC91c2IuaD4KICNpbmNsdWRl
IDxsaW51eC9za2J1ZmYuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogCiAjaW5j
bHVkZSAibXQ3NjAxdS5oIgogI2luY2x1ZGUgImRtYS5oIgpAQCAtMjEsNiArMjIsMTQgQEAKICNk
ZWZpbmUgTUNVX0ZXX1VSQl9TSVpFCQkJKE1DVV9GV19VUkJfTUFYX1BBWUxPQUQgKyAxMikKICNk
ZWZpbmUgTUNVX1JFU1BfVVJCX1NJWkUJCTEwMjQKIAorc3RhdGljIGJvb2wgdm5kX3Jlc2V0Owor
bW9kdWxlX3BhcmFtKHZuZF9yZXNldCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKHZu
ZF9yZXNldCwgIlBlcmZvcm0gdmVuZG9yIHJlc2V0IGR1cmluZyBmaXJtd2FyZSB1cGxvYWQgKGRl
ZmF1bHQ6IGZhbHNlKSIpOworCitzdGF0aWMgYm9vbCBkaXNhYmxlX3VzYl9zZzsKK21vZHVsZV9w
YXJhbShkaXNhYmxlX3VzYl9zZywgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGRpc2Fi
bGVfdXNiX3NnLCAiVW51c2VkIGNvbXBhdGliaWxpdHkgcGFyYW1ldGVyIik7CisKIHN0YXRpYyBp
bmxpbmUgaW50IGZpcm13YXJlX3J1bm5pbmcoc3RydWN0IG10NzYwMXVfZGV2ICpkZXYpCiB7CiAJ
cmV0dXJuIG10NzYwMXVfcnIoZGV2LCBNVF9NQ1VfQ09NX1JFRzApID09IDE7CkBAIC00NTksOCAr
NDY4LDEwIEBAIHN0YXRpYyBpbnQgbXQ3NjAxdV9sb2FkX2Zpcm13YXJlKHN0cnVjdCBtdDc2MDF1
X2RldiAqZGV2KQogCW10NzYwMXVfd3IoZGV2LCAweDk0YywgMCk7CiAJbXQ3NjAxdV93cihkZXYs
IE1UX0ZDRV9QU0VfQ1RSTCwgMCk7CiAKLQltdDc2MDF1X3ZlbmRvcl9yZXNldChkZXYpOwotCW1z
bGVlcCg1KTsKKwlpZiAodm5kX3Jlc2V0KSB7CisJCW10NzYwMXVfdmVuZG9yX3Jlc2V0KGRldik7
CisJCW1zbGVlcCg1KTsKKwl9CiAKIAltdDc2MDF1X3dyKGRldiwgMHhhNDQsIDApOwogCW10NzYw
MXVfd3IoZGV2LCAweDIzMCwgMHg4NDIxMCk7Ci0tIAoyLjU1LjAK
--00000000000016603f065ad44cb7--
