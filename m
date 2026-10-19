Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A16C4A3F19
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400690; cv=none; b=ElGw7gLf+yUZAVT/DDVoESCm0OzJuEgwg36/vnrCXUjcF3UkVEpTjEKVhLyeWA/VNmOmyN5kJBZ6qob1HQhppoF5Sq0tfSm4dn79WYGe7b/HMZS3bckSHUCGanZUVQL5j1X0mbXT/SD9+cIzPY6pMl7PCfP8nQSF0AGdWsapWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400690; c=relaxed/simple;
	bh=Y5B7af39S0PXIow2GIvHf91bnE1IxdkmrtXfSPHBTq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JuTK1y1hW2ryo3u33ZN8G6/YK9lMp4Pa3FE5ymCR2rdJl42UvdykF8cHS5a/RyuOuT90661Q8pNmCahcvXRupHSfdc7BUC9EDx1AbmgkTvB8loVgwkNews+tisLrkTeUBOOyUs6RL/t1ADXfvn+zXm8/mhCw2K16U8yu8yuasAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4p+avsB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4p+avsB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1175151a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400688; x=1793005488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Z8XAyjygsOysLTl27UEsFrtu7w4obtpJ95lpSqv45w=;
        b=E4p+avsBAd651E5Iny497OXWQw1kiCit5TidSDQBPUOU/IbNvvu8oO1h9x+9rcpAS5
         qiE/jsXwugwlyMWJPs0FxQMozeDX10c/fIcrhRaM17PkeM1pRN1RbXMZPw/FFO7tSRE0
         Qi72SY5gbyT/cVat8997ueUc6YFDHzugGFVuv/nCs4I70f1x+2S4qsBFnsZ8jH+B7lFL
         a0pxvsY3dtkY8fr6ujPcHKLR3yl1kOYrtZR2JkvIvFRXHzk2MXcDbsTaujyy1AZPvn2h
         KO/qh8rWBKC92lXPeT35v8Q+VpB3snKnBaYo46mVeH5MhzysojeN4StrmuafhYhcRycW
         N1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400688; x=1793005488;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Z8XAyjygsOysLTl27UEsFrtu7w4obtpJ95lpSqv45w=;
        b=YmabdM56VoucUgeQ5HJck3YbE2HGIJOW4btViHNbRHl+v2RmBIS1mnMJxMTH+lu6pz
         U5OkV9cOhSEr/Uj+CuSVferYQRREiJDfK98Tjg2pUhgLCU74HTO3Yf/TSNM4P8SGJ7ix
         q+wHGuxk262qeHq3PXSxlEL/WO1QUu/IvBTeboj+2cUSA4En2Cyo2IQezGiHyHTr4Prj
         O/kSsXNwD7XjMCJXAtwoM4UMubojZL58VsiTNar1O+6UbXlsKI4xhTaPQHIHKNtzwC+9
         6Yj/aPhTBTH+M9rj0qtb+ePXu5kKey+7cxQIHaHRgdI13IWtp8T3Ur6XH+Q8BFaEPP/q
         ZCug==
X-Forwarded-Encrypted: i=1; AKwUvByCo/mlAL686mxCprrcj6MxEPfcPDn0JPs2CJXmNKHl/3dUKrRCzbFTXFNZop11AezZH8pFrRU5N5oQGi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxPlA9FLFapTW59UAotR9KxBI4oOjXFcDulp+obmgh20ys+NUP
	Pw8iHWu5GHIXGGKLHSfyjvXj1q8Lo159ryYsAwtC3tlbIDWdqs9qk2zD
X-Gm-Gg: AYBFou1Hqo0xt/BqwcNFKpaeDBPkjUQVDetJbmLmMfqpAnK0G/XCiOdSDpHX7wamtYM
	pIGCSvYUnvvxPmRIRVoegWklsh0meDa0D9IR6etxo9Hu9+q1jjzgZH30++tS9ElmJhkPCfGG6b8
	SIMxDNqKafbFsoCfE51/mDqTX/stI6uvrL9i5HZXSolFSsP+dL96epf434GsT8wbL7UIp0l2kF2
	P7nklksI78F8JWIBRNzmm/IFMyMTG1gb52VB4MvYYa1hK2x9agAkQmsJgEA0s+uc5Gv/iwugiEM
	KNcanvDx3GYinELCoi4UOIPZmKaTXdQ7Y7hGUyeHzoZlMpfBwWUzcYxGeWuOma9Ju8hR4fv/zIZ
	KEVbZhDVwMGH/vvoeRjiqkQiDX1e64ozThxiV7vuokcGe8PJ/uTtFaOteSyRBmBsR4LnzGugBRY
	fdq613BCFzrHYfiv/04wIy3t6FUqlYCVS6Gw4z4w7IHGCwp1Y88NRC4ZsELbCXaXFXEg==
X-Received: by 2002:a17:90b:4c0b:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3aceebfb121mr6084549a91.32.1792400688233;
        Mon, 19 Oct 2026 02:04:48 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm19541571a91.0.2026.10.19.02.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:04:47 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcmtest: Pin the module while pattern files are open
Date: Mon, 19 Oct 2026 17:04:42 +0800
Message-Id: <pm-pmb-1ce354e709dbab28e563-v2-6b2ea0aa16ec39442f6d@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fill_pattern_fops table must remain alive until the final release
of each pattern debugfs file. It has no .owner, so the fops_get() call
in full_proxy_open_regular() does not take a PCMTest module reference.

With snd-pcmtest loaded as a module, a user with permission to open a
fill_patternN file and unload the module can retain the descriptor
across normal unload, provided no PCM file or other module reference
prevents it. The following ordering is possible:

  Pattern file user                   Module unload
  -----------------                   -------------
  open(fill_patternN)
    full_proxy_open_regular()
      fops_get(fill_pattern_fops)
        owner == NULL: no module pin
  keep the descriptor open
                                      mod_exit()
                                        clear_debug_files()
                                          debugfs_remove_recursive()
                                          drain active operations
                                      return from mod_exit()
                                      free_module()
                                        free the module image
  close(fd)
    full_proxy_release()
      read real_fops->release -> UAF
      fops_put(real_fops)
        read real_fops->owner
      access freed module memory

Even though the table has no release callback, reading those fields
is a use-after-free and can fault. The retained dentry keeps the
proxy's bookkeeping alive, but does not retain the module storage.

Set .owner to THIS_MODULE so the existing fops_get()/fops_put() pair
pins PCMTest until final release has finished accessing the table.
Normal module unload is then blocked while any pattern file is open.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 393f132a438b343c156e4ab45cbce4d4e2230923..d1b0dff56cd9f67b2e32031a1ea62c9a268e5e71 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -633,6 +633,7 @@ static ssize_t pattern_read(struct file *file, char __user *u_buff, size_t len,
 }
 
 static const struct file_operations fill_pattern_fops = {
+	.owner = THIS_MODULE,
 	.read = pattern_read,
 	.write = pattern_write,
 };
