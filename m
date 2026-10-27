Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135393;
	b=XdLJH+Iw19vL6zhReggWUDLkClnexX8N+MXYXPFVpgpZNxuqRU29MruU/UWdL6ZR0Ehf
	 JxvRO0mHt78iKdpR+8YMBbMJXiMCd18RE46DiQwHd7rPnMK2N4+utqzV78NeKBqOjAy/z
	 mhbySP5Kra98GR9O+eThmKWZerhmqcDhxgyFTcZMF7Fs72HeScpWR/TxsOXiXM+peVx87
	 l6YhTG/CT7domavQr19mXl3U2p0BcCw4max99fidks9ENK1HBggyyN15tlOsygHFXtDAD
	 BcIwc5BouKNDY8rBzXMMl6+nEy9kluKhI8m0gg5uNFOIFaKrtZKE3pvbSW8iF24C6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HAhPDfSNI1m9jMsgOVCEGKYJnC7ZRumB7Co5M2j8QiA=;
	b=Khh1hE8yQkGaKHk4xGuAG2TmGN6hH1wnSpKiCeHTLIn54aUN/cFFArKVK5KaKVOhvBlr
	 hHJDS0qefm5H/MqBzE7z+z4FbNQvQS8HDtZUj7E8uGqqGduKrRd7hwin3erLgO1DlJF0z
	 9z7OjBfrl03CkdYixmnKY6X9VtCjJxxl4/LKGmbY+LdrimESFmfat5XYLjideUU88qZf8
	 gi6SIQkrLv3dxT0IERuw60tn841/cagKYSTol4mbl3NeP0Mt9JGgLpk73+xB3W9T4Si1r
	 OX3ps4OvOysLw5la+ng6kBAmcXcX+eWPsjAYdA2gkQ+kQewaa/5OE9ZIowFXcxDppvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hOU79HFU;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3060A262F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F3060A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hOU79HFU
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53bb57f1310so4194101cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793135392; x=1793740192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAhPDfSNI1m9jMsgOVCEGKYJnC7ZRumB7Co5M2j8QiA=;
        b=hOU79HFUF5XVQIP1i0LutIU/umJRpfeIAGlIU85PQ+VvN8AhJ2xV/+Ckj7hUn0FiXT
         Vo7Bqt5A2O7gVi2FXZ7LR1GJBkC3682be/KrfbJUx3Oze79iZ02cF+nWdL8HAMH+TkA/
         RqJRdc529Hs/8A6MizbL1tlCPDHiaNo4rAfVeS4PCd+pYvNB8GiE3hhXUKHhQVK+xtN8
         JXcziCJ3xyZB8L1d8uSyg8o8tM/93MhtFnhO+nATDdlG/gpAAJwbl8XdWTjLI3geZAFt
         Fqe9NEA86+d0c+71frtm+HrDiotx5CzEsaAF6tQp+yTnBApEwLxl6fqpDPD3/OU7RekT
         j33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135392; x=1793740192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAhPDfSNI1m9jMsgOVCEGKYJnC7ZRumB7Co5M2j8QiA=;
        b=VdGRAq/jVgV5G7Z3LZu5gWskaPo2LPn8UdWHj3Aqs17voKy2/4IChUwBM2xT5Z9/XB
         GRFOzUREBbrKIyRi1pOoQTIi9WaEw/NoV5jntUh9s0RRWANPyI/MMhiBR89yyqsXdVzb
         nelC+pC6nXn0weEDJIoxGDowc68mx7GXzhYakHY/MxbSA4dV4yw5k6hIX1qh0TtHs+7g
         AYlrBG5pMWCJ5VAJJbtTmoCrfmJak8zYcBwIPPCxo+auX0VwV2tIJP7o+0JIH9btUPlm
         4j60F0nXr3BpJPSKyF1ijXSnyO7A8smtauDlNWTlsWc/fnBNWlvjkZ3+ZR1wshbNl/xY
         urCw==
X-Forwarded-Encrypted: i=1; AKwUvBy76ZYVEaHfovZ7axmorlewe649stwwlaDrjV2XO9GuvJMvw3WtNqTFbi5d+YoXqwg/wVLyes/QAfXT0PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs2oUeTiv7OP6p1MW5o+HB6hVGpY0UrlgbG7UIH8Gi8CzpX+Lp
	GsWHsKOySnsYgzJj7LeYpppDhCf0ZBza/IyDSuBDI+MfYRJ76sAfFeBvEBo5WinUIxw=
X-Gm-Gg: AYBFou0QePb2GnEbVKEZxT4kpaSnxyOud4hupftzDwwkoIuBB8BgU/utVoUk+kXU8Nl
	ZSLEmCq7jBQYV1XV9ZJA6yxpQdZCNvmhm4Iy+VhOotZYH2Tf10Sa5NtWHR6V+JoAJy1kinY7J4Y
	u2VX1dars4Oixh0EbnEqXG5kY6idXTWCXfGqjYzn9y9cuTej7j/sARQ4h+MDJQ3NJZKAJstyO0j
	NOJJ1a+jllPtrcA4ChbOIVkqqOgMYk3dNtshb9/xH3DZAf2JHMn+Mk75WUrDgOBRoXMMbEIDGbl
	R0lc8lGAFi24KFZV7BzYoE2yau0ufH6Md593TGXaDx8mTikYsojZh8w5KQq4BJkDEWS9GVB9ftC
	gUM0t6Xje3fgxXlvMzPGnFDHVbg8YiLxhJG8myrnZy/qhue7+fmDBcxrnyCwBtZMbk08v2FMfgL
	T1QwlIjCm4VLKUXJ8CtppewssxjC3EGHGv8Gq4U9LgifMVPSW9P++DWhDsf5/aF/E8NetJ9nFgc
	laPwjkIYwwOITbTkTvP3yBOtcFyl+cNNXdJNu7PJWkUDwSx2uBb2U1sHOrUwL9+nzB8iSniTdst
	7Rq3Unr+hySNhSun0g==
X-Received: by 2002:a05:622a:8887:b0:535:92a6:22f2 with SMTP id d75a77b69052e-53fcb20dfd5mr9618051cf.15.1793135391683;
        Tue, 27 Oct 2026 14:09:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm88811961cf.6.2026.10.27.14.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:09:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 21:09:30 +0000
Subject: [PATCH 04/10] btrfs: set SB_I_OVL_USE_SYNC_FS
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-ovl-containerized-sync-v1-4-802e512379a6@toxicpanda.com>
References: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
In-Reply-To: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Theodore Ts'o <tytso@mit.edu>, Carlos Maiolino <cem@kernel.org>, 
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793135381; l=741;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=KS+Jdp4IcUSZ6tCav8kl7acTQpMUNvtXOKDv7b4wQHs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJlIHMWE4mD9Fg4D+/nCw/fqbncWcTX25kEPMy8XebnWW9mJFVsO6uNMHNrIavR2Gh6YLS/9QxQ
 cP8BX8zQgBQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Metadata is changed in a transaction, and btrfs_sync_fs() waits for the
ordered extents and commits it.  There is no ->write_inode().

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 7fabb775d4e3..cdecf90bdae0 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -981,7 +981,7 @@ static int btrfs_fill_super(struct super_block *sb,
 #endif
 	sb->s_xattr = btrfs_xattr_handlers;
 	sb->s_time_gran = 1;
-	sb->s_iflags |= SB_I_CGROUPWB | SB_I_ALLOW_HSM;
+	sb->s_iflags |= SB_I_CGROUPWB | SB_I_ALLOW_HSM | SB_I_OVL_USE_SYNC_FS;
 
 	ret = super_setup_bdi(sb);
 	if (ret) {

-- 
2.55.0

