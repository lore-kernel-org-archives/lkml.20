Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634200;
	b=iMk/it4R6RVffyW7QfOZRFP26iPYj0AdHz+R5j203icD9Coz6T4YhzuxMrh49kMAuxPx
	 11ql5nA+F3ruKA5Dc8mDXMjcLBWZsr5HV2Mkpr6BZBRq4M8voRyDn0cT0EZj34HImmiAd
	 wAe5/ozMT25Ar291koK6M8ACcvIOzu96D5o/nncx/yHogT+yz/Mv970L86tHCrbzCbZ6J
	 L+2luPyFBys6DhjHyc0mGcFU7cxXmCrkKlfghfgAQRRS400jMUUewnSWspq6Ryke+fx9T
	 k4KQ2cf9KtSHou5o3GHQDmlqPAEuPepCrP4Jvn4NCpn61A2pbpiV7GVDcauAVNsLuGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
	b=Om04274fNJWsz9Z2lK9AtROiv3FLpY5Q0AvC+KTCzYFrd2NqnFNmf6JvO6Eyfy99K1ZW
	 rxAMu22bYGPkjZAfiE85aqa5rEgaNOZrgSj2d4lRMXlp4x4CZsEu+Fk25wvk4JcXhFO28
	 p5BNhZB+CH6/o3LPgTRKlkC4BmfFArxzoKWSxFYUyJkCz6+yMuG2o9dSX+j7hWSMBoV1Y
	 zflE+d4/7z9+6Bj3gG3u6epZjZQzZ7BLQyvnTxXDpKDRJh9Jkj/gmjBm5Mpv4vx+jOQLX
	 iZ0ghbeS9VnRjmBpHC41NX2LSpXRlUhFTxHAfhtrwC9dXPwzRHDqFIJvAwUvQJfANDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aff7W8dw;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F0606A884
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D63F0606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aff7W8dw
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so9783015ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634199; x=1795238999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
        b=Aff7W8dwRWUmPT5Z/fScXq1J+ef9a/+thKodDB2J31gBDrFhworS6ljAZGwSuP1JTE
         hHfBLHULz1oGj4MTOZs5BKkm6kx3vevdKWOh40j1rKyC0sU3T7liiqThcTBz9dfo0OV8
         4bkcT07UkQ2AZUHh9CiV02uEgV0RofPSr8EEg3aF8l29fhemK4zNPaU+tj1+ksdoXxfF
         UrI/Yl/fumBgqb/mUu0SzCa0QBsXB+3Dcct2+Ar2XfIV2y9JbTNuW96X5UfMhRLDUzVB
         F1hZ4855oCbECyOzbWgtUZE2F52ykmG2e4TU01lWjFwYcW2B0V8tcSIrpErA1+m1pM3K
         zE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634199; x=1795238999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
        b=wOx31FYESz4lbrdc3FdkTMKPPVAUet8KWmmHRehXaqOUGeUODHDu9+P7btJVm2uQWL
         8o0NVJ/1r8ziPMjVNf4cXjgKOznEunPSTqqoHuI/l5V6X5egdPbvtt4F5qrwSvKPQokh
         gpgXAOkkNz/i5J1GOCJTyP1cPHuPVOG9feiqQ25j+7/lrDVdUYipt8ptPJIrbI0LYy36
         B+qIaa6f3p0AYyaJpfZRmlyTfWB7wWU2nRs8F8Avhyy9Wwgb9irlDBXNt+wYsPwqGWmo
         fKGX99/e/4OVhjdtsV3ovlWzrLaVrY0yzgZV0FLAAo3agqC/j+ya27jATk3VrEBnyjxD
         4xiA==
X-Gm-Message-State: APuU4Z8ncAOKSDhU91yZ8KB17/EdgFVmX4vqAXNpvAsW62EQ0axsGSnD
	QI/U2Rkr74B91RHrppQ3heEGaK8AbrvcOTG+cZZ2WsCeHL1jhNH5juqgSTGxHxgX
X-Gm-Gg: AYBFou0+2B/20of2f4YhNEPm57Hlsi5bLCXjPwFasOXOMNmlAKsVGG5gYT46679tlLi
	Xj6Z9ma2Pk52OZfbNjHRlPaTNgDDlpq+Q00x6S/sp+wKu0PiknJAbOqrLgg1TLbboikkaOnqJSy
	jNF5qDd6h5SRsx6fUsM1O7eErztx1yL6Bz8soTFebbhJlk0ZPDLSA5NYbBNMga9IiiEsrCjPIZv
	CWI0L5zvc0loYARXhwmEz+YM4yLx366+DD5sKH1tDEU/n0nEOKKGKvMb453qq9l5lnrEgMNld8R
	H1QXO8bL3CIgJ2fxFMugAkjq0GfaN4QQEPA9pcMNaEG4pVu3w6ZRpql78DRlOLUrNoVSCUtO3eF
	EjeL8v5q/HzokNuWXAUBLfgTrCTettBD3rmSKmqRon5LFe+62seA9Iv4n16wcjBzwP/vYTzNuEK
	ZwO5Weqmr7FSZNmkBxRgZKQOCCzpqNuN1g36Ea4xLfiRwS/e+7RnThS5KEtLKUnAEq9f/9xrESN
	FrnQ/2ehenzASG1W8RGQNQlQ2U6XRQ4SM9din7c7CqJe6aTWteNLKVChZVcXO7rDYz+uPSeO+cT
	F0AIuxpN4n3XCLzWt87TsJjOOOCNlkBzzLMCNOJ+F7GqZ0vyyACvAdZVZ1pR44NrQ/cH4fYRtsg
	UoXpJiNn+rb9EwqXBueobY2ngJZhRRUcieWynDkrP3HpOjlmoicA17u4=
X-Received: by 2002:a17:902:c411:b0:2e5:debe:cb4b with SMTP id d9443c01a7336-2edf1e7b0a5mr61346585ad.10.1794634199067;
        Fri, 13 Nov 2026 21:29:59 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:29:58 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Date: Sat, 14 Nov 2026 13:29:46 +0800
Subject: [PATCH v2 1/2] configfs: fix use-after-free of default group in
 configfs_symlink()
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
Message-Id: <20261114-configfs-symlink-uaf-v2-1-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
In-Reply-To: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com, 
 linux-nvme@lists.infradead.org, Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634191; l=3255;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=BLAVQgSrEVNkosJ1RawvnEwRkMMxTH81O2DKWV4iSkg=;
 b=xwJeQRV6EtAOLyaWisKx2TbtvO1K9D6hg9FkRjY8VTX+fnyRwQVeAN35/0byNBdaNsvX7iYMl
 1rIG8bSOcNnCMtfjXczQrkkQiq5s1v3j5nv2pud5kUaBkDHcaEfyOI+
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() drops the parent directory's inode lock while it
resolves the link target, and keeps a reference to parent_item across
that window. When the parent is a default group, such as
ports/<n>/subsystems/ in the NVMe target, parent_item is embedded in
the containing object (struct nvmet_port). A reference on the embedded
item does not keep the containing object alive, so a concurrent rmdir of
the port can free it. allow_link() and the final config_item_put() then
touch freed memory:

  BUG: KASAN: slab-use-after-free in nvmet_port_subsys_allow_link+0x41/0x2e0
  Call Trace:
   nvmet_port_subsys_allow_link+0x41/0x2e0 drivers/nvme/target/configfs.c:1059
   configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
   vfs_symlink+0x18b/0x330 fs/namei.c:5794

detach_groups() marks a default group's directory S_DEAD while holding
that directory's inode lock, before the containing object can be freed.
So drop the parent_item reference before unlocking dir, and after
re-taking the lock return -ENOENT if dir is dead. Otherwise look
parent_item up again, which is safe while dir is locked and alive.

Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0996ac2197dd7420c3e
Cc: linux-nvme@lists.infradead.org
Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
---
 fs/configfs/symlink.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..1b2c9048a920 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -166,11 +166,11 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 
 	parent_item = configfs_get_config_item(dentry->d_parent);
 	type = parent_item->ci_type;
+	config_item_put(parent_item);
 
-	ret = -EPERM;
 	if (!type || !type->ct_item_ops ||
 	    !type->ct_item_ops->allow_link)
-		goto out_put;
+		return -EPERM;
 
 	/*
 	 * This is really sick.  What they wanted was a hybrid of
@@ -200,7 +200,20 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
 	inode_lock(dir);
 	if (ret)
-		goto out_put;
+		return ret;
+
+	/*
+	 * parent_item may be a default group embedded in an object that a
+	 * concurrent rmdir freed while dir was unlocked, so we dropped our
+	 * reference above.  detach_groups() marks dir S_DEAD under its inode
+	 * lock before the containing object can go away, so it is safe to
+	 * look parent_item up again only if dir is still alive.
+	 */
+	if (IS_DEADDIR(dir)) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+	parent_item = configfs_get_config_item(dentry->d_parent);
 
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
@@ -218,11 +231,10 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 						     target_item);
 	}
 
+	config_item_put(parent_item);
+out_put_target:
 	configfs_put(target_sd);
 	config_item_put(target_item);
-
-out_put:
-	config_item_put(parent_item);
 	return ret;
 }
 

-- 
Git-143)

