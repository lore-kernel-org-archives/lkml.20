Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616464;
	b=RAbk1YvhGlxnJtNPt3IqqSLdhgpZXpIh31xF47Dy2aqfdMwNAgvM/cqLEE2SNHvmKHBO
	 dozNTf/cTuvR6yqjLPoAg+lsa15QRxrVKtlog9vy2okM0CXCoYhVC2vyzr4Ep11oAKL2E
	 o06bBBKoPJQdrWS9eJsWRgVqjlJGdXMZ2pQ5v4WXI05/YCPb+iDVqW7K3+B5TYZ73q6vF
	 FovCjyrtxEOInUCS+NdIWNL1QZeVR8mdVedDZm08lJbOKHu8y5x2Ndzw4QHQ52egyBeNv
	 nQj61m1KHuOUoGCiXAnHRulT7e6vDVckCSQYEAIJJVvSVm1NzOQysn2fbdKHIMkPESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyDSHSgspGUCXxBL33Pyf2fxt1FGBdRsUfgAbu0U2lg=;
	b=NgFwE6zxy0LsHTz4hxwZRANoMFmlVMx5GiKis93oe/gWqRGDt/QLrNMk/MULxZC9GM3w
	 8kZ0kELXu6fsZTz9DUYSKgB0yq6MnAYCxzSERQHkAEPj+6GkXcpRmZJGVtiNfUmjeopXL
	 AIAuxGB80Nwho5r4Ay+W6ObQfToxq7CBtZfAdnT3wQ1zdwCqc5OtJy5M6gum1G0AOx3Rh
	 90c9bpb25Gn35bN0BLnvEa7Wvqfz9dY/tox4QO9KymdT16DxH+nkyL8Zd8I0MNEvB09o7
	 17cdsEzUynG9ijFllGFYFjz4TYSp6CLnGPs/UXy71snjqKeIT79xFXAFvhv58oXZkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwhHSOkC;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B260A260E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450B260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwhHSOkC
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2849818f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616457; x=1794221257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyDSHSgspGUCXxBL33Pyf2fxt1FGBdRsUfgAbu0U2lg=;
        b=dwhHSOkCW0EVkEHrgtbCMeCdOHGQy01fUPv5J3FY36E/daOm4zYXJc2PleAINdu8Xi
         Wdl12oOh7Ocfjrcfhv9V7UDNOWqqOcvLtO2rYrJUornb9Q5RBayX0fsvdmvvVrBU362m
         PYnxt3rRIzf5HPJo2tGlNRx0vw1VHklNdGlnkaPIjWdt90K0KoipGzXWkBr3yhVQL1XB
         XSjtERdM7KFIU182twmGoa3ORD2QAp9VipCnlapwBbsqOKbGW9Uf7qVOZtz/xf/xlkp+
         q0zJYEbqonnd5ITGqxcZfZgJIBWH/lM9ni0/Ny9gftFWtImoJgWYGAwkhg8mKQ1lVw+m
         r3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616457; x=1794221257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyDSHSgspGUCXxBL33Pyf2fxt1FGBdRsUfgAbu0U2lg=;
        b=WFbQU0SY8NSMbS2t0B2Gtc7b7qhvxrQl2HL2pHa5zWx37MpXu/EBXvUEDsDMhR1yL7
         UBaSnizEpMXE7y22JWSeOhzpGA38pV1WJXSclic9cUTfq72y6Lb23MZPLo1DzrO/Ww+L
         r/t57Ay3em9fiQWvUdIFeyPyZwqY6+JaM4xCPyTYLn9rH3MkDL1dXtJrG5vSfSvgiigC
         SWU/QrZV1IKh5vH+kOk3fTuz98abR1ayc7TF0WosbXcqrk0gT/oCe198cM9A+zjOsgPL
         EhOX3tKR374x/cDPr8Px6Pl5SHtK8Tv24fq8B2ibHeRo/V+sxmBFX0La+s27KDVoI5QB
         xz1A==
X-Forwarded-Encrypted: i=1; AKwUvBzqUVswhjcFkRps+JhqfNqrRd8fOVuCk3ty0c74mFyxtbGFggZ9gUmfj0XFhv4pc51HPy2DyH9neMPCXCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk3tcYcuIB1qfFENMnDYwJq9rlUrHvln1W+CzXTeSpLWOIHi/d
	zTd+GBwPqZtIs/9TgGXx4OwVpsokD1HBc7b2UU7Ttm53WBn6mPGfOK7i
X-Gm-Gg: AYBFou36i2Txq6l5G48qa26CGbTVwER6lucDs/B8B3gS4xoKs26bw3KRIFTxLU8+Gn8
	tqB0BWxp6AJpfFaUELwoYU3Snu/TXZ1pgAat3lVtbgmHXeAxnzkZRTUTA3GB7hZEuYY9l63W3KP
	9jIMlMTzSzRcRLZvkFtxbPWcPNGKNZ/tMRMjeZOaVM/p8Qxmzu3ND2CAMm9HWvFv92AwVz1VyVa
	CpssMNKfEMeVtgxGIkPY86pLexcKiqamEzA6i4/Xuo1iG8ravjvpBHg9feHU4U9zhTzEvnja45E
	n++smL/OgVFeIAUn88QvNvSrX6Jy4VJj/+4al0jx5AQiuODEcwr7P7l3Wz/aFt10n8mKuAO7uEJ
	YrMNGKgXS+ebU0UhoJWc2kiRKZh9BrXS1AkbJDBpsh32LA+BkOrjc7wSA2ej2N1xrzA5+EF4GWz
	bUjaiPU7DF+HpPuhshc/kMpyjJwa7rP69qHi/uu7cpaunVThYF4CAuhUsmaUvi+6RthbiUg0MzH
	VmrsthVNd7ZPD2GSwD9qzoM1peSHUj0RP6UmhFrrmXRvG0/KPx3iq4L8mdXmJ+T6hRlyxUfYBID
	id/pCrj1qYT5ds9qlAiFhXNC6rtzS2+47FpO8YyVWtA=
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr220305825e9.18.1793616457546;
        Mon, 02 Nov 2026 02:47:37 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm248939695e9.11.2026.11.02.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:47:36 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: brauner@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH vfs-7.5.bpf v2 2/3] docs/bpf: Document bpf_path_getattr()
Date: Mon,  2 Nov 2026 12:46:54 +0200
Message-ID: <20261102104655.70901-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
References: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the VFS result, output buffer, and calling requirements.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 Documentation/bpf/fs_kfuncs.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/bpf/fs_kfuncs.rst b/Documentation/bpf/fs_kfuncs.rst
index 8762c3233a3d..05cc9b657a42 100644
--- a/Documentation/bpf/fs_kfuncs.rst
+++ b/Documentation/bpf/fs_kfuncs.rst
@@ -13,9 +13,22 @@ BPF kfuncs can be used to get these data.
 
  * ``bpf_get_fsverity_digest()``
 
+ * ``bpf_path_getattr()``
+
 To avoid recursions, these kfuncs follow the following rules:
 
 1. These kfuncs are only permitted from BPF LSM function.
 2. These kfuncs should not call into other LSM hooks, i.e. security_*(). For
    example, ``bpf_get_file_xattr()`` does not use ``vfs_getxattr()``, because
    the latter calls LSM hook ``security_inode_getxattr``.
+
+File attributes
+===============
+
+``bpf_path_getattr()`` queries filesystem attributes through
+``vfs_getattr_nosec()`` and returns ``struct kstat``. Use a trusted hook
+argument, such as the path in ``lsm.s/inode_getattr`` or
+``&file->f_path`` in ``lsm.s/file_open``.
+
+.. kernel-doc:: fs/bpf_fs_kfuncs.c
+   :identifiers: bpf_path_getattr
-- 
2.56.0

