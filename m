Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79846EF6A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585108; cv=pass; b=LpKLojZId1NIsa2m0to/6rujqtX9Dga+BMittT8Uf26iD/XhQ4I4/idDXdriFzgjhLF5CZutsQV8Saqcj9XA3P5nxlEJVcMVkykskYO2uWGuWfkYU8WV/D5TgxjWMpARcNpGsIte9EQcpK54DiCKiP9MlKnVA9NAQuv52Xtr2hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585108; c=relaxed/simple;
	bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hioWpoed21kRikI1/3gHDgbxZK4e9m9YnG1Pz/XhdeSNE023/1WkXT3ogCgE9py4/FvXyG93isU6CU0vVhHFX8CPs5A8jcpHoaBCK11lzgzz3lwaIKpV0Z8F/fzA+TxuJts38HcKFoDgVaxmWTSp5eJqiAS9huxCXbEPV2J9i0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD9oztRV; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD9oztRV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso2623662b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585104; cv=none;
        d=google.com; s=arc-20260327;
        b=raZ3QOaiLTo8HciCc3YWANzuTpZ/Zb5w/HlBYRG+L7BZJ8RUr+fpKp+yV6nhcnUPF5
         3p1vBqm9TFjoZNYnbTEs2G3QCoAjA+LuqN3upT2OTl2/sSfiQn/75+skrt7Mj8pIfeUt
         ukQgLrbn6aiPoC4T6yUrK8gTAvJHND4ARG302390OUuGMGvCVi0+DMDRbaizlrUKzxbc
         27wymBQ42UVHFmce9Sm4UvmJ8EydQJSuGzmdBImpOeQxllW8ZEj6EO49EYqtNZYPFv3p
         s6GBzpi9ZaENtMvqMWDLBlE74nl46WLT0g2SymHxRXWmYIQH5aPQazoIzrp1NZDahSd7
         NeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        fh=XJ3thrxASJfLvlvud/EtcpPa/AJlaNFZzN3o+aRRtdo=;
        b=LE+NtWnLtb7f/uWQfQ2LVxhJA1I8TPuroXcl7nL3RAjDDKQx0mmIrz20WhVZuAWOii
         HeACwOALxTO9aUHmGk/sTVOG9Phc0NXeu0btO4ehH9R7bf1m02R58NcHXRco936jUBuU
         TZwcpQ6EUUdVTQbTxN/oyIU1kEbz2Z9qEq0tC2yWU3Q7gTK+7jD06dMMP/8AuBZRB/jz
         aCk+LMu1snw48Zvqcjyl4S2HhlMRTV8dS/Hsix0bKQ+VxHd82U1cEGdeoEkVT6eQ7u9y
         1x2AwpW1coYOdcqAw3g8eqdEOzPawpvEhofUh2Qcc711lT7C3AujtV4ZRCocfZCpKGfF
         S7Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585104; x=1791189904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        b=kD9oztRV+Dm8bDHS7OSE90nX7aRdn5rT/9HgZBbSMDtjkpxg8+itEaNdInVsTWI268
         w0cu33aI20eX3WKV5wy5YZTqqf/saVF+kKO6u+0g5jvO7Dt5UWSuVvbZccNfqoFvLP6g
         XPqSq3mYkICyV47MHUdKumXc/a81Vyt2O62LZrGwBOEciCghEe9qY/wwgV0FW1EndXaN
         TMZHBFnJ0eN112W5IInqJFQq4vLxPxsbjgvjvxQ2FtzNPVNmLsgKsBAA7LaNRjWgxpFR
         /VEPMnKAgIJdWZzUaZiQyjRo9mlwqj2u8B2SLpk8SwfXSCYe2g5BrXaLI1svDE5uxP+t
         PURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585104; x=1791189904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        b=EuPeEm725PZ60CkbDBcA16CrfVR5+MA+48iZBTONjqECL9gUTRFWwqq/A46SWQEEg0
         U5WZ10DY9VojjBJ2NJ9kaRQzkGmb/oRQkLd7x49ULyjMSvjszv53NRaQgxmL9wIQQVSL
         Nh464QAOKPTHtKSqGzT6yBrvnfAhsZQp744hykHDgZTwNv71ENlgcIfaWEsi5ewRBajh
         qmhT7jcnNil2K3SsGY/W3PW099sABsQn9J7MSihdb9m9ZfmVPeRpZPmH/R8vQmB3z4lY
         ek89Ya3NNNVYEFx4XsCBoCUnFO68sRalPr6HBAGPtGL3dymV1qhoS7ixMv3d5dfZ2JQ2
         Hjww==
X-Gm-Message-State: AFuF++lKuujnX8/45Wzh6IdfrdNXpiutCFcMsULfU9DyA9swRaB70H2v
	GMEasDLKV/ZiFAvxv57FwBgoariXE1ow0pqQ0HU+1mgsPDYxVWLD2QKWXJgyrzYa7+49PppXwQ9
	Ab52TM3XWb7pQU4tXMc2iZC4lSmFk2BBxLzii
X-Gm-Gg: AYBFou2X8I4mqUM5Gj3p1tffutz3dXXGWIloTitAq+ffONhKpPSp8w1o17Y+j5NGVUR
	K+Mj+j82+f6L4Zzq0+p5et/5twHIIzyEpKeDJ2o7IrNoVJdzeLYOBRNf2G001aPjyuhp5cE8niL
	Pg88TuVmt5GhsB0qkUAY6cc6HE7YBbgSwhuawwiNaUouVazx5XLRE9bxOQnqU8FCy83ZSrjXMrV
	kEBzaaJ8l67w/oDG9X9pJoRoDOt0af+WXoGAyk05cplUrW93xCImUraB+UlP0AfmdBCF3jgUrhm
	MMHoOn/POCKwoE0dL7FBgutUtYNY2nQn8P1ts2kX937Uk4Z+oxebCCU=
X-Received: by 2002:a05:6808:4fe0:b0:4d6:90d3:e18a with SMTP id
 5614622812f47-4d72ea5ce27mr14903663b6e.51.1790585104375; Mon, 28 Sep 2026
 01:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Mon, 28 Sep 2026 10:44:52 +0200
X-Gm-Features: AclHuK-Y3ao9DkHcmxm11GvE9FSK2VI8uvqNZ-SClsI94Z_taUUK5K7QciicvJ8
Message-ID: <CAMnqnYzG3EKaUr82NDuY4FG8ocFKj4Ccsqw0o3dmULbf+qM7sA@mail.gmail.com>
Subject: 
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, alexs@kernel.org, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Dongliang Mu <dzm91@hust.edu.cn>, rdunlap@infradead.org, 
	Weijie Yuan <wy@wyuan.org>, corbet@lwn.net, skhan@linuxfoundation.org, 
	si.yanteng@linux.dev, baikefan@leap-io-kernel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

W1BBVENIIHYyXSBkb2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3IgdXNiL29o
Y2kucnN0DQoNClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRvIENoaW5l
c2UgU2ltcGxpZmllZC4NCg0KVGhlIHRyYW5zbGF0aW9uIGNvdmVycyBPSENJIGRyaXZlciBvdmVy
dmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kpLCBpbXBy
b3ZlbWVudHMgc2luY2UgMi40IGtlcm5lbCwNCnF1ZXVlYWJsZSBpbnRlcnJ1cHQgdHJhbnNmZXJz
LCBhbmQgbm9uLVBDSSBzdXBwb3J0Lg0KDQotLS0NClNpZ25lZC1vZmYtYnk6IEppYW1pbmcgT3V5
YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KDQotLS0NCkNoYW5nZXMgaW4gdjI6DQot
IENvcnJlY3QgdGhlIGRhdGUNCi0gQ29ycmVjdCB0aGUgbGF5b3V0DQotIEFkZCBzcGVjaWZpYyBk
ZXRhaWxzIGZvciBpdCdzIGNvbnRyaWJ1dG9ycw0KLS0tDQogRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdXNiL29oY2kucnN0IHwgMzggKysrKysrKysrKysrKysrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KDQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwMC4uNWUzNjgzMWJmMzcwDQotLS0gL2Rldi9udWxsDQorKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0wLDAgKzEs
MzggQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QNCisNCis657+76K+ROiDmrKfpmLPlrrbpk60g
SmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09PT09PT0N
CitPSENJ6amx5YqoDQorPT09PT09PT0NCisNCisyMDAy5bm0OOaciDIz5pelDQorDQor4oCcT0hD
SS1IQ0TigJ3pqbHliqjnqIvluo/mmK/kuIDkuKpVU0LkuLvmnLrmjqfliLblmajnqIvluo/vvIhI
Q0TvvInvvIzlroPmupDoh6oyLjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKAnQ0KK+mp
seWKqOeoi+W6j+OAguKAnHVzYi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdlaXNzZ2Fl
cmJlciA8d2Vpc3NnQHZpZW5uYS5hdD7nvJblhpnkvYbkuZ/ojrcNCivlvpfkuobmnaXoh6pEYXZp
ZCBCcm93bmVsbCA8ZGJyb3duZWxsQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD7vvIxMaW51cyBUb3J2
YWxkcw0KK+WSjEdyZWdvcnkgUC4gU21pdGjnmoTmlK/mjIHjgIINCisNCivlroPmlK/mjIHigJzl
vIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j5qCH5YeG
5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+acuuaOp+WItuWZqOmAmuS/oeeahA0KK+ehrOS7tuWv
hOWtmOWZqOWNj+iuruOAguKAnOS4juiLseeJueWwlOaXqeacn+eahOKAnOmAmueUqOS4u+acuuaO
p+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbmm7TlpJrlj6rog73lip/o
g70NCivms6jlhaXliLDnoazku7bkuK3jgILpmaToi7HnibnlsJTlkozlqIHnm5vkuYvlpJbnmoTl
hbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfliLblmajpgJrluLjkvb/nlKhPSENJ44CCDQorDQor
6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousDQorDQorICAgICAgICAgLSDmj5Dpq5jk
uoblgaXlo67mgKc7IOS/ruWkjeS6humUmeivrzsg5YeP5bCR5LqG5byA6ZSADQorICAgICAgICAg
LSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1c2Jjb3JlIEFQSQ0KKyAgICAgICAgIC0g5Lit5pat
5Lyg6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorICAgICAgICAgLSDpgJro
v4fkvb/nlKjkuIrlsYLigJxoY2TigJ3moYbmnrbvvIzlh4/lsJHku6PnoIHph48NCisgICAgICAg
ICAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgICAgICAgICAtIC4uLiDku6Xl
j4rmm7TlpJoNCisNCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQhuaJgOaciVVTQiAx
LjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/ku6XmjpLpmJ/jgILl
nKjigJx1c2Itb2hjaeKAnQ0KK+S4reS5n+aYr+WmguatpO+8jOS9huS4reaWreS8oOi+k+mZpOWk
luOAguS7peWJje+8jOS9v+eUqOS4gOW4p+eahOWRqOacn+S8muWboOS4uklSUeWkhOeQhueahOW8
gOmUgOiAjOWvvOiHtOaVsOaNruS4og0KK+WkseeahOmjjumZqeOAguW9k+S4reaWreS8oOi+k+aO
kumYn+aXtu+8jOWPr+S7pemAmui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+WkhOeQhueb
uOWFs0lSUeaXtuWni+e7iOacieS8oOi+k+mcgOimgQ0KK+WkhOeQhu+8jOadpeacgOWkp+mZkOW6
pueahOmZjeS9jui/meS6m+mjjumZqeOAgg0KKw0KKy0gRGF2aWQgQnJvd25lbGwNCisgIDxkYnJv
d25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KKw0KLS0gDQoyLjUzLjANCg==
