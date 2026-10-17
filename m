Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500523EAAD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220465; cv=none; b=Aj/p2pa2oKfmW1B/oyJGmrmzdyunMyjS9N+HKKVPkeDy76xHYbExpQTjzFcRTcSXlrg7hc+jL3myRna53OCrtajdOr92ihpzGYfyNWCeYk38/GyqVV2/hgsWfMB129VLYZlnkRRmOJ7U1fWxfXqq3mPK7tC3hlihJ1Zhh1PMvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220465; c=relaxed/simple;
	bh=Ykfx0SMB+vs7928mQESl8JU5jg1mVkmDBYjT+l3yM0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=T78YPgW2f09NmORngxpDm5J0zH6xN3qeZ2aElEqeM4UvLoD+rlva2RWBHN+x3A9V8fDOTxaYksfK3E+AEqkoSPQtcKIF7mLOo1ptfmEOPTgKe2eu0HQ9ThVg26MQqrAp4+W9G4gxHkvttTsVwLuKRoSFxZ3/pSKi9S+1RWBxSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLkxDlg1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLkxDlg1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso2820155ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792220463; x=1792825263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqmf/gpLV/7FBGP+y0T4LAW9t6W7h08u10hqCEpMGqo=;
        b=bLkxDlg1LkR4bKJAP1isgQs92bj0EU6H3p0l7yLw2k301V9Z63Qi6zcY1Kw4/uy4dA
         w6HbpzDnLKq0/yIPz6UOr7V5qaYrV7mn2QimNndpQ3PG+I9/9SUOdbfbeRMgtBc1YQLR
         TRI0pKZM2P/VhCLgHf/tksiJjgUr8D/qRlYxZQrGtDQcpBiSMGToHDrGLK4fqm3BC7YC
         7KxptNgNuws6pXKkg63PaJfPZQGyfRc6D5e9LcwkWhh5RnOwR6AegracV6n1je+9Y5b7
         jciR4JPpvcbtIHtiDXVLzmD9nil5s5WCJEKFtWRKEAvaVr2p1eXdCE3hvjFimr2nPFrO
         oXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792220463; x=1792825263;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqmf/gpLV/7FBGP+y0T4LAW9t6W7h08u10hqCEpMGqo=;
        b=T8hJLYhvjIMwkSY97tjJEaY/rR/YaeoJXGf0MKRDF8kj2bV5xdowYdlEQxOBgorPOL
         5rdnZoZ2Es2HHshHhHj9ut7yBNUBCGJS0eaA9dDs/iXAaa1Hf+byGRnJm58za3ooZLiE
         Z2AbvbpCSzdQ6cs1ITN3m+NfF7tUfoMSoxs2EBtF5ErU+W8cTiGXAjYnV/vAH7UNiWq4
         cXYCl1Eocf8hPSKaMLu56tH6OiUauwODsHczWczTnbYMvNc4/Xzkmh8ioSRpVbpu/Ci2
         xhkmP6T5USrmpasdqd+G093Royap8x+A0VMQqMZKFjD8gt6vgVhQx9dH4X3bCrk+buQT
         oLkQ==
X-Forwarded-Encrypted: i=1; AKwUvByTpCkR3t6LeUsrXEeCMNxZHEfsCucJVgdgC1ovul+IF7TZ4bTYf/7ove24wn2qdhOd1GOBvuvbfp7Ni1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2wYSZTNrf6JE091n64pG9qu+MRl7ymBgi06Xx7H3JrzhhmN7+
	3RfrxTL4rslKqfxTW1Kyy2nzyhj6rX1ClobIpLFPbhvuEjpYhKQEb7hh
X-Gm-Gg: AYBFou2A/gPvOysGinBkcaZd6ab57HMLnwZUD0Wn+0M4pCzOZD3jTIctB8WUciUA9s7
	4a1yVBtd65aLHvEzOCGh0hwX86xFFogb500XN4BqLVD6bWyv/lbJRSbNoAJsxnVKPEsjh77RKLx
	RONYA1BUYLMiC+eG5fpqK3Ov8EGjvjVxcaVm22bpPNDkOU5Apflx7EyUrI18898Xp6Ff7oEUBWT
	17nnVDwA6DFV+8Z9m5fJny32nXIx+1kG/vJ68PgsN/pC9+yWD1HHFVVe4g0Ij5wW6nLesWC1ISR
	otV9eb106OectA2Y92T21sijvOdcJWbpp07lp+ffqlhdyuIB3/BHDFYuMMFCukdykR+sNC3J8Ad
	TUDwnSVmdPOx2t1eKVI5TY02P8SkZom4cHHXrRwoVobMDakrOqh4JE8T+Teb3G6vKJw6CsAqpgx
	AzrpvfCDTJgQL5Tt/EzPs7KyzqPjvYPvaHqhPXGrIong0nUQWmAht6Pre+os0nis7utQ==
X-Received: by 2002:a17:903:37cc:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2e9a6a0a794mr19030945ad.37.1792220462827;
        Sat, 17 Oct 2026 00:01:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804e80sm19807695ad.23.2026.10.17.00.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:01:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: jack: Protect the index scan against control removal
Date: Sat, 17 Oct 2026 15:00:58 +0800
Message-Id: <pm-pmb-f08c844bb1163c8d4fa1-v2-2f3c99e40f90134846ee@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A control found during a jack-name index scan must remain alive until
snd_ctl_find_id() finishes comparing its ID and count. However,
get_available_index() calls it without holding card->controls_rwsem.
With CONFIG_SND_CTL_FAST_LOOKUP enabled, the lookup loads a raw control
pointer from ctl_hash and dereferences it in elem_id_matches() without
any lock that excludes removal.

This can happen when a jack is created while a different jack owner on
the same card removes an existing control with the same name and index.
For example, probe and unbind of different HDA codecs can reach these
paths on a shared card if their generated jack names match.
The codec device locks do not serialize operations on different
codecs. The unbind path can free the control during the index scan:

  Codec A: probe                  Codec B: unbind
  --------------                  ---------------
  get_available_index()
    snd_ctl_find_id()
      kctl = xa_load(...)
                                  hda_codec_driver_remove()
                                    snd_hda_codec_cleanup_for_unbind()
                                      snd_hda_jack_tbl_clear()
                                        snd_device_free()
                                          __snd_device_free()
                                            snd_jack_dev_free()
                                              snd_ctl_remove()
                                                snd_ctl_remove_locked()
                                                  __snd_ctl_remove()
                                                    snd_ctl_free_one()
                                                      kfree(kctl)
      elem_id_matches(kctl, ...)
        read freed id/count -> UAF

Hold controls_rwsem for read across the index scan so removal cannot
free a control until the lookup has finished using it. Release the lock
when get_available_index() returns, before the caller adds the new
control under the write lock.

Fixes: 38ea4c3dc306 ("ALSA: control: Optimize locking for look-up")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
index 6b6ab34fbde89a6551eb634ce13c66922770d0e5..36700fda79f3c027e84bad416c4dcc3d5da1c6bd 100644
--- a/sound/core/ctljack.c
+++ b/sound/core/ctljack.c
@@ -38,6 +38,7 @@ static int get_available_index(struct snd_card *card, const char *name)
 	sid.iface = SNDRV_CTL_ELEM_IFACE_CARD;
 	strscpy(sid.name, name, sizeof(sid.name));
 
+	guard(rwsem_read)(&card->controls_rwsem);
 	while (snd_ctl_find_id(card, &sid)) {
 		sid.index++;
 		/* reset numid; otherwise snd_ctl_find_id() hits this again */
