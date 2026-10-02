Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A821346E7A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936259; cv=pass; b=obGgebOlHl/g7aJJQkQEfocLZE+gDlBI2lBtIB6oG9nSzmAul4+bT3k32iM5erGGlUp1AN6FSwcm2fnIEU3MwYxTHSacpKU8O+Tbpwqv4Fj0+fdzFKFCZl5deySk6p/QE7OOgB0Yx8RVXEn1mOfeRcaXZZE6+Abq3Aa45iSCu9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936259; c=relaxed/simple;
	bh=zbxh97DfahtmVFw2yx/P+OI0PpzLVE463PD6gyDR+VQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t9B6vf9l8AfxzhLD8FQmgwMyOGWYTSgaEejc/0NVx1znGR5xdta6pEyFpwn14FjYVC3/v47UtDXA/P4BIoLrd4nXAtwpMUmW819XZaeW1fEctr+MsYfmfd47EfmSa7YpkmFCylj9fb8IIJF4BmcS5xq/sS3+lICXEosCaE8V12o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcOzz30+; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcOzz30+"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba447469b1so1546473e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936254; cv=none;
        d=google.com; s=arc-20260327;
        b=EF/J7QLoMvHwNeLZcB7SsNUOPL9OwmIFrhOmwoTf1YcCOCZpaapF/8YR/lHlZUv4ac
         uLPz32VeHV+JvKz48KJsLKPYBD0Fq048EHwsG+jRP6wJq80S5E5d7i6pbjEXK3ug2Zni
         ShrIOdjgcthajYebvXpMUmCANmnw+NMtwz67FmIup3VMfj9cEQhcXs0UMtiBMvc1KTYJ
         B6aDjTmW3dvbKnyOHJIpIUVeDUUr6kz7RA+i2SRVwZ5tunAjYlBx1eBcDK9z24qSNoK0
         Jfk4P8c4Ba9ERT7UqUix2S2hAtY1KDR33xpAqq1cw1E3DV+cHc0Uiw0HztxtrC4RfkMS
         m0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        fh=0uOQouCPKe9O1M7NHHwtSKCVBDaH2O3ehxVZj615eRM=;
        b=OG5arJ/VVi+zaVfDhkQQ0ZNTld6TBjpGqJ5zzgHygVgU4zLaRDu/+ClvtWnccJFwqE
         6ZtjxWSY76nNng8dboIyOQ9DoyiKzQPeqZz2unlaJkIybGQSWhva38huABJPEjP4d+4q
         KdqpEJhwYz2Kfu+Isfe7pUobkyeUrWVF/w9NoB4CzLG5jBwUNwKki0DILNZlua8eQ47z
         65J9L+k8jhyRuFILTWBYaWjEqSark8IVpduZu4s3qklRQcxVVrlRTSTAlROOZ1/iTmqn
         GCn/rvadvdpEAlxm3Tce1cUHiPRIOvTV1sulYiRV9PDtZ7qf8LgWtG+UxMwlz7e+DFIz
         tPvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936254; x=1791541054; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        b=FcOzz30+98AQjHVtR7UVXsOk65DwSxleNmU2lZyXW+69OCS8ZlgQPAarHp4ChW3oYq
         Yvr1pR2Mlh+QoKspvzNhNAlIjA+li3LBnxwitlOVvR2XR77Xh1aZYE831FLVJP+nuitn
         hjlpfgpGnWNCKi+t9JVxwDxkGD4sYOh9Ew5FSfEbKs0bgh8BHvrkRKcHMwAOSeOQ9P2O
         LShQ4VVUTfchQWAWWiEofa9S+bIzL7dMMInT01KRxprawGeQe7fpqH61zCulxVMQAUiZ
         xLQH5SL6Q02oqDthD2pqvjXUyj2cB/aLqFcKuEABXvKL5M4NtnD5eBDkzDbsYhm02Zz9
         +hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936254; x=1791541054;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        b=0PFIEnezXntiKK11V9I0sm8M8tSpwbXi5VHLrNmijZKJO14rD+BuwIMd4MwTlx+tp0
         y6UNstUVDav4aa3tUOzWC4yawNJZRFgEzjJvIU0Ozc4yolh2Q6GXZyiAV/eldRZ0r2Gc
         MAL6M4zE7nroVTabWOIh3IZ2e9GILI+AvchKc8ogBYlgCuJD/DGL0D/VNkYWaoxJUF0v
         lcU7nXaqnjJgOsQOFg3n3H25Ep8OqrLnT3Y/ec07bscCILTpHrHomqi0OLUL2uClaCTP
         g47YOo7BBf00FqccwjPwKgdhh7jQ80LqRyH3ZOYykFidnn124NgmR9iCMIQALiatwSSq
         4n+w==
X-Forwarded-Encrypted: i=1; AKwUvBwL8VQHPzWMmhc8Zxt7T33z7g6JI11n2XTc095AmX4S8wsqVk6HIjaBdsmyJafOvcAKukCCFok11BMEukE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8/fu1wnKbn0Cr6Zb53jvAe7m7ntJp7GqpiV4ijxinrv0yBsu/
	nBIo+PsGGirxQfXC2+wHlZ2/T02WoI2Y571i+nZ7eVLwo76IOoXXLx61gsOhi2rVbMRWtMoMJO/
	Wco+0IqXpzMCMVxP79l5wnNreSRl+bWE=
X-Gm-Gg: AYBFou1K4NwEkyyCouI/Ea8Rpj7JzChsXzHNl3plkUl+JEWSj0+YulCuyb44v9b5pPG
	3SDgrq8x71ZGZLEyIPqr0YVCdt/QqUm4X9ZFCex1iEQL1xlutmFpOq98QRsvEvWcNoCGBweHUUx
	euQdEmA6xLA/a+a5gAvda+gT98zTgC6jkEyPdrIcCX51UE94LtVT3KRAxUhr9Yi/BGdXLHuHvGc
	zTP/HLZP1JFFujwzobExLwGqrDm6J8QWIbjl15XmG8TQaqJkL51j9BOEuMXxmOfjPvadLWFEeyG
	rGHMw5D12TexmWUdAs8Q6gGQnENy3UCuVp57lHj9c5IHpUGXJUvOvI9p6nScp/oRhwLi2sM/+G4
	dK1v4+ZZvABrw
X-Received: by 2002:a05:6512:3b8a:b0:5b8:e94f:8d79 with SMTP id
 2adb3069b0e04-5bb9bc25b94mr598164e87.64.1790936253817; Fri, 02 Oct 2026
 03:17:33 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 05:17:32 -0500
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 05:17:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Fri, 2 Oct 2026 05:17:32 -0500
X-Google-Sender-Auth: rgVdU-Na-thylIHC_Y0SkBWvGuQ
X-Gm-Features: AclHuK-11oArOlh6vzmbSmxKA7acyV-S_yNov9Vtcz6DICtpbHOmyRBdRUJQ2o8
Message-ID: <CAANnmVDM9VBqwwDKC8kRn8zAP92e_STs=EVNRZtZKgqWaJaLNQ@mail.gmail.com>
Subject: [PATCH] fs/adfs: check name length of big directory entries
To: linux-fsdevel@vger.kernel.org
Cc: brauner@kernel.org, rmk+kernel@armlinux.org.uk, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The F+ (big directory) entry format stores the object name length on
disc as a 32-bit value, bigdirobnamelen.  adfs_fplus_getnext() stores
this value in struct object_info::name_len and then copies that many
bytes from the directory buffers into the fixed-size obj->name array
with adfs_dir_copyfrom(), which only validates the source range, not
the destination.

Nothing validates bigdirobnamelen, so a corrupt or maliciously
crafted filesystem image can specify a name length greater than
sizeof(obj->name), causing up to 4MB of attacker-controlled data to
be written past the end of the array.  Both callers of ->getnext()
instantiate struct object_info on their stacks - adfs_fplus_iterate()
via readdir() and adfs_lookup() via path resolution - so this is a
stack buffer overflow which is trivially triggered by listing or
stat'ing files on a crafted image.

adfs_object_fixup() also appends a four character ",xxx" filetype
suffix to the names of non-directory objects when the ftsuffix mount
option is enabled, so name lengths greater than ADFS_FPLUS_NAME_LEN
could still overflow the buffer by up to four bytes even when the
initial copy itself fits.

Reject entries whose name length exceeds the maximum defined for the
F+ format, which also leaves room for the filetype suffix.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 fs/adfs/dir_fplus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 4a15924014da..ec663bc12a92 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -192,6 +192,11 @@ adfs_fplus_getnext(struct adfs_dir *dir, struct
object_info *obj)
 	obj->indaddr  = le32_to_cpu(bde.bigdirindaddr);
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
+	if (obj->name_len > ADFS_FPLUS_NAME_LEN) {
+		adfs_error(dir->sb, "object name length %u exceeds maximum",
+			   obj->name_len);
+		return -ENAMETOOLONG;
+	}

 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);
-- 
2.47.3
