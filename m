Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D8348C63
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375227; cv=none; b=hco/ZL/tkgsYmsUXWmnYWoQTebcSXVo/OR0Mdi1j/CfN3GCBVlWEIqEkVkqLJsraojdUCbaKLTs8ijh27Zv0HiJPNTM4S8a4j/WcKN0bviFEs3W1Bm6sE8ID1mSmB1WjGoEq6eLuaO8Bl+srOLsDwxk1g74zVXgGKQc9tqXIEoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375227; c=relaxed/simple;
	bh=DVXQyIhY8nkQwuh62aEFyosJMFXKwj2WMhrrf3agrn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlpPtjdM+FhyRz+Rs520KgZFzwFo7vcq7vXLIxQa9K7FlZs0QP5ShB09wOKtnagpBs8eCS3I/7x81l/fC3yYzAUcnYgo3Bi7/ztpKCDoZX9ZqSRP+LCGlZCp8O6S0NZxcKePNeBMlSPTuvf04OynqmKdndWZwcYZf9Nc2uG3avM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egR9e4g3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egR9e4g3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7558E1F000C8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792375224;
	bh=KD7UwzXfOm4PXY6mh45NaHYnJinOcf0JwpEqw8Sab1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=egR9e4g36blwGaj9ytpdJLm/LCvacoX+WXrb+uOgziAFEkSaKWKjgrA/+hD3Qs7CI
	 D/gkcqO/oK5YDBAptSDINhLyJqdCtcWRQD38/T5UiVcdoEEXMKDG8+NYR1jzCdB7iA
	 72AHuHQvhEKMaqUpqXu4zJyOoP/MBTnh30/HY7G4iok7izu3NiB/S4f15snVNvz6u8
	 j2xvDixmsqPuWIX6RY4VPhtPTsSQhXFy9H52ZsCxGJ0pBKv+H7jM4lIA9c1RX/gsvs
	 mIJHtNHXXa9DuoePyWIDx6LhzcC/2eFeC26A/QsPK4wsXJ7Rf2xVswrWR+gjzPT+AK
	 M3B6+UJflK1xA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c423b145922so115051466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHqkXsJ0NaOU4BTFKUArpYX/Laph57R1B0PWgndeM4uffoMY7fD+F9ezqW8vtlD+U3spaDRSlWiBns8zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw0Kj+zSsJzHqmtW2wfIQ8YeiYq+rzp2W7l7xkCpcc0KA+E0zU
	u6zR494mH0zl81iVNc4MZsKRYzzHNK7MYO1W1AULZKhBF2Qtfv/0URee9/8jVRCz0JUDi8/1Wpr
	kxkZIQKSpR5QN4YVSFTnjiIDvCLpqv5I=
X-Received: by 2002:a17:907:9494:b0:c3f:7270:10ab with SMTP id
 a640c23a62f3a-c419d34f17fmr473204766b.14.1792375223084; Sun, 18 Oct 2026
 19:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792345559.git.jan.koester@gmx.net> <1861a1d193fc19a37cac28c3d3312046d69bf5bf.1792345559.git.jan.koester@gmx.net>
In-Reply-To: <1861a1d193fc19a37cac28c3d3312046d69bf5bf.1792345559.git.jan.koester@gmx.net>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 19 Oct 2026 11:00:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_PWD5+7P3H5mMpyhL+8fugriQxGLq3UjvdV2UZk0Oc7g@mail.gmail.com>
X-Gm-Features: AclHuK8A9hAbhSOIn70RmzLFuGS7zFENLkUdwmMvGTbHx6yjDB1UEMSEQxsLbQY
Message-ID: <CAKYAXd_PWD5+7P3H5mMpyhL+8fugriQxGLq3UjvdV2UZk0Oc7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ksmbd: put the workgroup into the NTLMSSP target
 info's domain names
To: Jan Koester <jan.koester@gmx.net>
Cc: Steve French <smfrench@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

---
 fs/smb/server/auth.c    | 41 ++++++++++++++++++++++++++++++++++-------
 fs/smb/server/smb2pdu.c | 21 +++++++++++++++++++--
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 9a2a3c6a37..8639997080 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -376,10 +376,10 @@ ksmbd_build_ntlmssp_challenge_blob(struct challenge_m=
essage *chgblob,
 =09=09=09=09   struct ksmbd_conn *conn)
 {
 =09struct target_info *tinfo;
-=09wchar_t *name;
+=09wchar_t *name, *domain;
 =09__u8 *target_name;
 =09unsigned int flags, blob_off, blob_len, type, target_info_len =3D 0;
-=09int len, uni_len, conv_len;
+=09int len, uni_len, dom_len, conv_len;
 =09int cflags =3D conn->ntlmssp.client_flags;
=20
 =09memcpy(chgblob->Signature, NTLMSSP_SIGNATURE, 8);
@@ -426,6 +426,23 @@ ksmbd_build_ntlmssp_challenge_blob(struct challenge_me=
ssage *chgblob,
=20
 =09uni_len =3D UNICODE_LEN(conv_len);
=20
+=09len =3D strlen(ksmbd_work_group());
+=09domain =3D kmalloc(2 + UNICODE_LEN(len), KSMBD_DEFAULT_GFP);
+=09if (!domain) {
+=09=09kfree(name);
+=09=09return -ENOMEM;
+=09}

The patch is quoted-printable encoded. Could you send it as plain text
when you submit the next version?
