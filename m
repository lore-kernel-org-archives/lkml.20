Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257304;
	b=UC9PMVrsXsYIhbp43KyUBI82KctYh9QXXxuDYYjhGAqVCMgxVMlTsHbBYzqMq0BG63T6
	 0epie+zbYlwaoJREve7sdwup21fBWILKfyL/005/OcJcXcbXOSjPbefmw+WpB81lPzadF
	 7dIf6nkDJjW4FEduTwarl5sKDTXO7xbbCkg89kM6o11DQW5ZKXBsWgoN/hPM8q9SsJfmL
	 gGID4xqE6K6QwUaB2XS58ulcxggPZjCbLWeN54TiV7nwNH1pdAD3mhXMKYIsMfp0MDns2
	 TLF5Sow7E+Gutiw/lL/nsOfzoRNFs6rh+q3TnJA//Nz3f92xClggx72Ufcj2KCQSh8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257304;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TP0p+gw2NtY8DtFZrnMf1yHjdZHitLSYQV57c8ydShM=;
	b=xHL6MVh8KHaY6aV/I6InzAHdgqzr95NWEiY8XyTzfNOY9JtJEgH+pOKiLlqiUzk1yIvX
	 NPv0YJ09KfNOaIkk63UX+zLwz1SOc/psxuSopxC9t+RrEhe4eF5lJy35fUIkrLL/cQCWr
	 rrk530AKnOGoA9o6aUwUp5hfH4yYFBxJDHafmzZPCMbay5aw2TsrP2d7ri32CniQAJ5DH
	 iOTNFh15RotF6NRleDLAT3PxCjKlLYmc4249su1hG0qaAHDgR/Tx9Svr0z6f2ckiGSuNf
	 cQB9nlUSDaOC8+paElh7hkUCSC1I4QFOaDs5E6AMe9DO0q2PI1VpCjeI/fDYRimpiqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=iAhH31w5;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB92606A31C;
	Mon,  9 Nov 2026 20:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=iAhH31w5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794257301; x=1794516501;
	bh=TP0p+gw2NtY8DtFZrnMf1yHjdZHitLSYQV57c8ydShM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iAhH31w5NuQdUOt1S1JeM2wCJN02fk2PMoAK2tymKZauEb6R+kbbiqjZalbwx37jn
	 L3FQEXalCiro3OY40Gfmpw2y3/4rfEx14ChkiJ8tzSayQtz+L3iMdDxE2DlVp3eMvq
	 LQEwybUR3B7dZmKdDOUB5SNyYSrVN8Jv0rj7sBXdbcUBP7pEjXtpPfxaTn0uZqeZhY
	 soCss6YDdjpPkVOADA941Yog2KZ86/5TIlAeAgMIjCIQ/TXrEvgNJuLrnsiAO+V9lR
	 Dt/n45OvzxVwBB2HrCZT92IBYQw7RRVgzd4qhxx+/ZO4rhNRYWtDJkK3IPpPi/8FoT
	 jW/M7HTs0yGjA==
Date: Mon, 09 Nov 2026 20:48:15 +0000
To: corbet@lwn.net
From: Mauro Codella <mauro.codella@pm.me>
Cc: Mauro Codella <mauro.codella@pm.me>, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: sysfs: Align example callback names with __ATTR_RW
Message-ID: <20261109204724.37838-1-mauro.codella@pm.me>
Feedback-ID: 135342123:user:proton
X-Pm-Message-ID: 34e2b86c320db1e0a81e0100bb28b1244e3d1b3f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The sysfs guide presents __ATTR_RW(foo) as a shorthand for the preceding
DEVICE_ATTR declaration and explicit struct device_attribute initializer.
Both preceding examples use show_foo and store_foo, but __ATTR_RW(_name)
uses token pasting with _name##_show and _name##_store, so __ATTR_RW(foo)
references foo_show and foo_store instead. Switching to the shorthand
without renaming the callbacks would fail to compile.

Rename the callbacks in both preceding examples to foo_show and foo_store
so all three examples agree. No kernel behavior is changed.

Codex identified the mismatch and assisted with the change and commit
message after a request to find a small kernel contribution.

Fixes: 44a47f0e3ec2 ("sysfs.txt: add note on available attribute macros")
Signed-off-by: Mauro Codella <mauro.codella@pm.me>
---
 Documentation/filesystems/sysfs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystem=
s/sysfs.rst
index ffcef4d6b..94329668c 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -107,7 +107,7 @@ It also defines this helper for defining device attribu=
tes::
=20
 For example, declaring::
=20
-    static DEVICE_ATTR(foo, S_IWUSR | S_IRUGO, show_foo, store_foo);
+    static DEVICE_ATTR(foo, S_IWUSR | S_IRUGO, foo_show, foo_store);
=20
 is equivalent to doing::
=20
@@ -116,8 +116,8 @@ is equivalent to doing::
 =09=09    .name =3D "foo",
 =09=09    .mode =3D S_IWUSR | S_IRUGO,
 =09    },
-=09    .show =3D show_foo,
-=09    .store =3D store_foo,
+=09    .show =3D foo_show,
+=09    .store =3D foo_store,
     };
=20
 Note as stated in include/linux/sysfs.h "OTHER_WRITABLE?  Generally

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
--=20
2.56.0


