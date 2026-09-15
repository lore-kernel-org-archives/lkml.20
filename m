Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0894D0A19
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504612; cv=pass; b=irQCdEmDQ0kKq22yOcevKZuzcHfaG9wXS7d48+QoWfeyNzWQ4lce9SBdzFSLxfOO2KyWYrg+bb82o01JlSlgF612mlECFxqkgNmWNBp/awZz1P6HeVqk+TWkBb6FJeBmFBs8a+nn/JnRGNEU2C5xpAeedYxAX+IBAgainQ8ItOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504612; c=relaxed/simple;
	bh=9WcvYvFtOqMYK7EIn1YIdYN71/uEzIgCfxjX9fpWMcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eb7AMyDAZDaTcseNnvJGJgB682bx5AHqgz9gNZcybHU0zxZ11YwFHOn1wpqdFFk3RDpKuoRmZynyPUwcJSXCCNkDW7ue6kNbKyr/MXmIRNB61Btl56p30ynG3d4d6QZ/TVJoqQrGCR4HdpWXegmz9SLwjg/utc0ggaOeN2KVVsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KkdQ/Ire; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KkdQ/Ire"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so1732255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789504608; cv=none;
        d=google.com; s=arc-20260327;
        b=JL/mVxAkNzjJnK/NKvYsfLJB66eJtgLGPPLtPijgBzvfjoAiqgtxUa2O5hxy1BSMaV
         blOM4Oewq1v1k6Vo+OTRSA8NedyIjcEg3uk0W4ulPQAzVNdDrSCNvGm7+IG8GD0Dm5+7
         Ha9t9FcE3RKs3jpvD6bV681+p+SJMS0tyhQHgKqbrUMtQr4vEqPWEh/xZs+KCL7MSvT1
         GitImpJP+Zz4u+zOw0+de6NOa6Umfm2PvUl4QQ9r69b+0ZUKY8RAguU9ibqB8t1bhcJs
         wpwaBTsG+aHPVM1T4v8bnJYabS7Gwuxaafwn9EIowqIKUFO+cLROQ5sPi2jJ2oKPR2I3
         VC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUOmM8p23AWvA9rdklSg6OWCkYp4tYqVvEdtNkochK4=;
        fh=3c6GFfzDt9YmJrsuIow6dSwAcL3hPOhFKr8nEopEFIk=;
        b=I302vwGgm9nTl/Vb82lIl38c1xBiPTo9wflLDyiH9xBF3iMo+pBRrOSwdLdqDvzx4t
         VdZ3ARPjKU3/4Lc+3JevEeBSaEUGrxe2hM8l+KsVgNXpgiEckpWTW7LfEGXa+cpcaOWe
         dDfl4Zuxn8DaPpv1/J2lp+0jsi0YuiehiXMaWtbuKgLkZJCjmD2jLtFcCa9+FkVKtoch
         biWUDomlQiTTlZFVl4FVL8hQJAh7JuF7kQEz6CAa9up4PDpAV94CN0hsvHpZJjJLv6NF
         J7q/Qa07J+5KCIChhw2SW0+cdxWdpsdRoBAss+RQZ3ROwPewUKvqP+rQr42LuPNohswg
         ga5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789504608; x=1790109408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUOmM8p23AWvA9rdklSg6OWCkYp4tYqVvEdtNkochK4=;
        b=KkdQ/IretfrePX9PBVLRTMwQXzn2WX/3IRZxF6FcQ+fga7lynTB/dgppCVztU5Speu
         ir4hFnBUKAU4e33IVDJvwi8GyanD58F47I9Nphesb1udV6tMfWBQnMJ3ExLfihhZ5W63
         I538t+mK7dmkWXUgBWFXn92dKESqRhAfXGZTH1xfm+3sT27psWqLvPgz2317CRG508gZ
         THYbJSoPvU1MRFrHj47D0JmFRXNU9Ml+l3PrHcBQMHgvcFSEAjeEqz0upF75xVz6ze6t
         KOaVXQKnsT4x4t0bq6J5Qb/qtJAQV0bduRO1bSQiXDKoiDLMt65I4ac56a9YvXpSl3ZC
         s9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789504608; x=1790109408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUOmM8p23AWvA9rdklSg6OWCkYp4tYqVvEdtNkochK4=;
        b=Q2UBluWhdlTLVnBKFWRRW6/bNnsKhEkIXQaokOOW15nmqf+KN3mBsolH3/Zt74i+eR
         6ljB8Wp2drgq7MTEd5+0ujOPhOXhmM2XYyYNujIU4oB9p4eCgA5/JIBfwahhvvfndgwK
         yiqFsTla1yjwl4oRVM12WPs7PoTdu/4aP4ZXcyv5UFgsfFdFKilj7IWYZA6qEAZdV4ZU
         39Vro9y33DukEFSx09FAhjG9o6+pHTa7PrcfYmLL0xzlPu9Ud+g2yQHdWn6pgQGv8td6
         PsJTW0thKWy9zhaidkugq9cVUofzav4r1T6EuamG6zZdDyoO+c6sqoaRUDrLk9ltPJmK
         Ml1g==
X-Forwarded-Encrypted: i=1; AKwUvBwZMbO4RUyaBFad2yM+xKzL2ugWqcuHasljn7VNg5inYbPz1taIeoxBiMgazAbBuSrCipChe7KKnIyy1Ms=@vger.kernel.org
X-Gm-Message-State: AFuF++kj2r1foBG6MG3STb9xo/RvzUL+UBePJuklNm8m/YJj5eljzr9E
	thG61EPwXZDBR/coq/qjfs3E4o/z8AWwc1GC2nSRsADFI2sI182z5Mij4m/gOHkNjAguzcL9a5A
	YjX84INm++FOtBMgt8jzqHJHuQXCT8g5mGO8DmbUUIbgL2Y2/MZyMylDyRm4=
X-Gm-Gg: AYBFou2OI5psWX0KixbfR+ppDT3iUx8Q5xmGY5PMXidgTAW10RiCLeH0zlAM/s7V4bf
	hSsKlMoP5nCk6x+d2LkRQi2bUHzTLjeZa4BfI4VwOqz8+PJj5uPtqloEv2yMdb8HJYvm7rpQ4t8
	X3yatRxfizOJtjbk5C6mK1keBLX19xZUiRGUBXrXmhZJNpXGpCn0Y5Qz99KH9TmX4Fs9MhTk0Ur
	89DL9dnmtMIf7lgSWKg/zKRve0Jh1e1xslg3mxma9XikgWVFKhssSoxwwL67Qt0hkBJQsHeVpoP
	fe+QlqR6+CwtI53Drw/xg3I2cW/EulZ6kN9sO+HBHgAsSSTRa5Jf21ojyBKZwdCkTGmMM8fy7Cy
	O96l6F2gvhMU=
X-Received: by 2002:a17:903:2984:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2dd8384cf05mr46727925ad.11.1789504607574; Tue, 15 Sep 2026
 13:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915195728.3519469-1-arnd@kernel.org>
In-Reply-To: <20260915195728.3519469-1-arnd@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 15 Sep 2026 16:36:36 -0400
X-Gm-Features: AcwNN1V6m8jOnx9-xPyfQgHGwm7Z__xUNz7kqqwu2ohNObqJy8jRS_eFOlsi664
Message-ID: <CAHC9VhQwkwrEgnuyP-u_NJxmjgy3Zp9XN4cAqCMqH3ugV+jrsA@mail.gmail.com>
Subject: Re: [PATCH] selinux: use explicit 64-bit division
To: Arnd Bergmann <arnd@kernel.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> On 32-bit targets, the division of a 64-bit integer by 33 causes a
> function call:
>
> arm-linux-gnueabi-ld: security/selinux/selinuxfs.o: in function `sel_read=
_class':
> selinuxfs.c:(.text+0xdcc): undefined reference to `__aeabi_uldivmod'
> arm-linux-gnueabi-ld: security/selinux/selinuxfs.o: in function `sel_read=
_perm':
> selinuxfs.c:(.text+0xed0): undefined reference to `__aeabi_uldivmod'
>
> Replace this with an explicit call to div_u64() and div_u64_rem() to
> annotate that these are potentially very slow.
>
> Fixes: fc68b6a45f16 ("selinux: convert selinuxfs inode numbers from unsig=
ned long to u64")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  security/selinux/selinuxfs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Thanks Arnd.

As sashiko pointed out[1], since we don't really use the full 64-bit
inode space, what do you think about the following fix instead?

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 292302eb60f3..d864c314c873 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -1574,7 +1574,8 @@ static inline u64 sel_class_to_ino(u16 class)

 static inline u16 sel_ino_to_class(u64 ino)
 {
-       return (ino & SEL_INO_MASK) / (SEL_VEC_MAX + 1);
+       u32 ino_masked =3D ino & SEL_INO_MASK;
+       return ino_masked / (SEL_VEC_MAX + 1);
 }

 static inline u64 sel_perm_to_ino(u16 class, u32 perm)
@@ -1584,7 +1585,8 @@ static inline u64 sel_perm_to_ino(u16 class, u32 perm=
)

 static inline u32 sel_ino_to_perm(u64 ino)
 {
-       return (ino & SEL_INO_MASK) % (SEL_VEC_MAX + 1);
+       u32 ino_masked =3D ino & SEL_INO_MASK;
+       return ino_masked % (SEL_VEC_MAX + 1);
 }

[1] https://lore.kernel.org/selinux/20260915200522.BBC8A1F000FF@smtp.kernel=
.org/

--=20
paul-moore.com
