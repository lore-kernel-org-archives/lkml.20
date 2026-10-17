Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E848FF9C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248532; cv=none; b=XGJlJpZMZVtBFeSn/tWnQPF4H26TQWOEeWDvNPPxTTFseURnz4usHTcicPV4bt/x+twKGezO/qVgR8qR6YAKTB4mGBm9kSZ1vusAFO4vRMhGSsligMVJQYEVA4fCqXET+1YQQwQds3UgFyelewYIKxCH6nSFSMUcm/CAROuLBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248532; c=relaxed/simple;
	bh=L0SvlG0HgqpzEKFEwHq7wDfZkYZ0WTBPvieUdovJWzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ThmymEwrW7aVlvrqczZSBuc+vj7LRMrH+MUEwQ1l4t7s8tJEPLsfAAqMLAnnugWIHfG9FyLfv3uVX0y4X2eyhvrLo7xyEHHm/yLGhwATo2aGBg0LToo7FysbS5ojGV4I6K4qBoWRlXHbPsny//ap1V5SaNk6rQGtAsGYpODXDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JaIQeg2a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mwR2yhB8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JaIQeg2a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mwR2yhB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792248527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
	b=JaIQeg2a6RDpvNEt2MrRX+/q61RPED4XrgSR8TLP7ZsUsi7enNr6atQQzGXFMr8Rh8JB5Y
	6Asuf8ICaFqzXmQC3HUPbKenYDoJGhrNr5SSnBiPmUxjhavKW8CXQ+TXCmsrGTiI9+7hqc
	GSCvTb7WVdASWRn8kfu/tN+pIK4szi8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-D6gu4iFuOn-O0JxtV18feQ-1; Sat, 17 Oct 2026 14:48:46 +0000
X-MC-Unique: D6gu4iFuOn-O0JxtV18feQ-1
X-Mimecast-MFC-AGG-ID: D6gu4iFuOn-O0JxtV18feQ_1792248525
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42f98f354fso1256366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792248525; x=1792853325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
        b=mwR2yhB810IIeuLh271hyganFDEGKE/Imjam/DWVtpOjvNl/peSCXOovdayhhoYECC
         iR23dn0rrRItdLRzwtZpYsQQrCpRhAFZcMTmh+k81EtLg6j40+lVUP6yHDmVgj5xoLTl
         CCV362uHbBEyMNZx0HIcb509GsMnYdBNgntZfcUcpNpCGqHfDC5U/zQ5L2+EyVQFFdQD
         JSvYsjNlErEHqv6kSi/Tf3Ei/iAIOo/RekZBGlDjvSNZ791XOFR5Ump0D/5o0fGW/M21
         6eCKWDnPAAmSrtVFxTmzDTWnrLJ937LukuJvZyKebtex7FbYSd0U2yQKER6a2dMS/ZZo
         m4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248525; x=1792853325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
        b=cHiFh+pMl/hKoJ55Q6QKvG9bvNja6PT9NKOJEPwzchbuN0kHH9jPWjhz+tP2hDGoNf
         7XlUeWePz/BL47AVAOKl3p1mqUdRof8UIMpmdGw+5vZvP323NzJQAClGaKyuMV1+AloA
         ex7rT0hHttho5K9Xa8dGPB/r8HL9Qpxipkr5AQkG5PfK60bUw6gW2Zc+L8dE4ujI4beN
         6RvETcgrRBvfLYL/jWr00sXh1FD2QQcanzfMMfFcg7qoEMHTaPxgYnlHGletXoL9GxWq
         koTZUhD74teGMOUitzg5DPMFcP15vmZOoNXWf57Gs4Q8hsmY0MK81KWOHOTyij25Hr16
         bmng==
X-Forwarded-Encrypted: i=1; AKwUvBwlSUQ/umwYJqrC5isk2ROPAh+5E+eL7/HE+NzUxZf1UXCeP8jHHDyPbOpL6s6deekHDfdlX/pNxx7B9Nw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT+w4QHPlllI2j22ypbg8F9/SL1sBFLEV7C7A/JG7XtN83xXb9
	vFknaLSzEepUUeJ0ntcRg91aLbjU6imiszo5dS95MxRkozjPr1XcG4CjEVJj5WIoDTkAq82EVXs
	hI9HhxOJePfpeiaoFh3kDZRLAYY2THQKagsIcTLmo500esep+WQf7iRV+RK4StzZN4A==
X-Gm-Gg: AYBFou3+Vf7ddm1heiaPvVmy/E+DtlAfqB4ykevAZrAgzDYcc7V+2QJkOsC7pAmfn50
	wDEGe9aOibsbkMGPEzJle17oZA3hXOWLZo1PpujORTien/0Lk6HPLd32RLFKaq6CCmBevME2SLB
	kpiIMGLgD/hCwtj9CRo7qmI7umD7PNmZfYTuDu0/5rIcmoMMmqoIbqscOX86pRDm/O3oBOgigTJ
	TwxHfK4tvjmEryeO/3O7/zjr4lP/AcxnNWxNfnTgoLZDM2PiCjIjQZMGisEvEZlzJyaejDpClT4
	aUI+0MOjqvh8W8IveZoYGMhW+4cgwEhE3jYT2DMieZCo09YzvWDIJEQy28K/NmaaI/bFxi7FfZE
	F1P5PX+P5CDAlY4ZcRxmr4tQ3mjKoq3KgeQ7PEZpV2GaLQIZfS/iKFDwXRVpbQLYOquyEfp+i0B
	p3tnGwDHxEUh1/4kAP4tfpYV0bxqDmDNR4NimlljSo+nxNRWBNKLQIeNIaB8NpkRQzTFkLtXwHv
	No=
X-Received: by 2002:a17:907:c00d:b0:c40:80eb:c541 with SMTP id a640c23a62f3a-c419a05d6d0mr181163266b.2.1792248525260;
        Sat, 17 Oct 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a17:907:c00d:b0:c40:80eb:c541 with SMTP id a640c23a62f3a-c419a05d6d0mr181162766b.2.1792248524879;
        Sat, 17 Oct 2026 07:48:44 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32878bsm181645366b.12.2026.10.17.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:48:43 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 1/4] dcache: export d_find_alias_rcu() for modular filesystems
Date: Sat, 17 Oct 2026 14:48:36 +0000
Message-Id: <f93b4a902ed00af44019ca88eeffbf686d920e2c.1792248177.33a6e2db0a.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792248177.33a6e2db0a.git.amarkuze@redhat.com>
References: <cover.1792248177.33a6e2db0a.git.amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ceph subvolume quarantine ancestry walk needs to find a dentry
alias under RCU without taking a reference. d_find_alias_rcu() provides
these semantics, but it is not exported, so a modular Ceph client fails
at modpost with an undefined reference to the helper.

Export d_find_alias_rcu() to GPL modules so filesystem modules can use
the existing RCU lookup without changing its lifetime rules.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/
Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/dcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..13ba553081b3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1248,6 +1248,7 @@ struct dentry *d_find_alias_rcu(struct inode *inode)
 	spin_unlock(&inode->i_lock);
 	return de;
 }
+EXPORT_SYMBOL_GPL(d_find_alias_rcu);
 
 /*
  *	Try to kill dentries associated with this inode.
-- 
2.34.1

