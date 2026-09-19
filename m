Received: from mail-pz2-f27.google.com (mail-pz2-f27.google.com [74.125.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB6377EBC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832274; cv=none; b=uV3Jn9kfS6HaRpEMujh9/HSUxxtgiOpaxoKO90NUitrBfJEp3CykMhMNRdAu5DwDKpK3qTqh2SAIgR7PvVlHaOCdFeWyY+gPFJtHnn/s7MnNyJu+W0ticNkHPaYBSkO0hs/TYkgO6Ht4UyJ/hyZbTj+2KL9rsNN1abzTJhZGBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832274; c=relaxed/simple;
	bh=VxtObnIR9+/lrSuxuj2cUBhtAltwQ25kfN4SISLzGlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQhfIeKyUY/2/9qI/8cJtzgEr86L4OCjdIUleFqnNL3ZIIdPlhvcnfMZ9M/gFqpihA8ywrNF17RaTi3RkWTtW2XKIDTLffitjbHCuSdc35i/grb//KdeJ1/duHG/E/cCX6FS2aqu+1RCnnKWBJjKmh3ZSxB55fscpe6Q3wHDtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpkr9LV9; arc=none smtp.client-ip=74.125.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpkr9LV9"
Received: by mail-pz2-f27.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so1176223a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789832272; x=1790437072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHm/cbyd+HacQpj81iCFhijHKha34yDBdVzS7b1gwBY=;
        b=fpkr9LV9YRgno56S7+nJw+mnLZ486PPGrVBjvM808iSsVPppfAw5kl2fGx8blcP3j0
         3LVa5oYkFXt4vJLxH2c2t3wabqdncymeizuaAOAqnySCJiP1nEx3BLB8K+rv1k2eKnyC
         28r0ITPN2B3sFLxcMhOTd9lMloxAGy3Un7SzJ7xj7jk+B1zgEo6+4DCfG0Jwp/uJzkjG
         02NK/n/UvpebHTmVziNPXuFiuMLaVBl5WmCx0HkIpiiCc070/yuopzH2QvHYYrv90yYC
         4hrwwH8TPAc2NaQTdEQNGES4nf3yma7bL5mntvEL5ajxT80DKVhBRvuCA0ioLLm9y41N
         4RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789832272; x=1790437072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHm/cbyd+HacQpj81iCFhijHKha34yDBdVzS7b1gwBY=;
        b=Xkt5ccHJm6OxnOAnaYmVcf1EHoP80fxkttyEvMGBzSUp2OniCbPm8dDZIKxyPEbDgQ
         XsOKDlcMrwM9S0zbGyiryrQMBCVg1XcanKBpPLsc+GPKioh7SLa/i72FfAaqdoGgrNAz
         CE+JqFjob8ZgCRW7VF8XE5bakGVR7pGtP0P0VnOHDLG4dOWPfN7S7FXlAe6yLINbFMc+
         zBreymjOPVChhQlSlGYIqvPafhq3tw/cc5t0Xtj5SgtaKIhGYMG8bVGq8qujPAzWPAzz
         GJOQRDLHuWmuyHyqXcQbRxVPrIcVrFDHPzIWL7/FbdBfZQudKgH1ZZt9RISp4cdtkqK3
         fPvg==
X-Forwarded-Encrypted: i=1; AKwUvBxTb++8xr9Hmfy9XOD4OPf06UVLxVtL13557AeGLNItlxWAWxIVzGjhK1CCIqnedZabk5MSKb4i+4vKbH8=@vger.kernel.org
X-Gm-Message-State: AFuF++mL6Nv32OM4yb6ITU+QWrDuq/WRoH+FnFwlAHew7BFY9DBe8oAm
	4P1cK3xcFec7V4ZalJaT/QvT1Hdk6XShlzddKNIcoUfrGZ0c3HcTWXVS
X-Gm-Gg: AYBFou3jTpSd308KB4hTTVx960EaDGYb5ukaAKX2bXS+d6y8gLi8BpG8IwfhE8854e1
	xTmBN32cqxi6gDmRcTmwkZZh1KWrdeiIwFx13PzMyvRJgpptKA7k0xotIGyqPtIbSp2v2PFI/cM
	idDmrS+7CHXRnZcD7tJTLtsQJTsdmOFV7aYUo0+MVefgFCtuHDh9rqRBBvNKc2JKedUQRsVrG5T
	nOF2xE1/318oQ3AAzhOSA+t+1CyMn3V2DzAhorFBL98+D3wV3nOJIRIDtFTIv/8Zjo3MbBMtD5C
	uy2TxR7HVRzR5tKLVMJWotJeGBNlxvkZ3v9wfVTafCBTSUcUdhB7uXg6axuaxEf+KFUM57vnZcy
	zCN50y1A+TSz80XSRqKymdOCNg/IKMpgEiZBowEjlLSuu+CQdnOKUCMtm6KQS3ba7WjeEn0vmep
	FOWeaek4w+bCJUaC9qtmDUUBuAje5NGHw6a5GTBZmZOClNT4N16ASNgUkjNSDWba1rkDOnKh/FQ
	qPrr7YK1Oze
X-Received: by 2002:a05:6a21:7105:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3dd8c3d20d1mr9200557637.7.1789832272469;
        Sat, 19 Sep 2026 08:37:52 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aeda98csm1066618a12.23.2026.09.19.08.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:37:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v4 2/3] exfat: retain the next empty directory entry hint
Date: Sat, 19 Sep 2026 23:37:34 +0800
Message-Id: <20260919153734.1511310-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
References: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thank you for the careful review and for pointing out these issues.

> > @@ -1489,7 +1491,10 @@ int exfat_write_volume_label(struct super_block *sb,
> >                         goto unlock;
> >                 }
> >
> > -               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
> > +               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
> > +                                            &next_hint);
> > +               if (!ret)
> It should be if (ret >= 0) ?
exfat_find_empty_entry() returns a non-negative entry index on success.
I have changed the volume-label path to use ret >= 0.

> > +                       entry_allocated = true;
> >         }
> >
> > +static void exfat_set_next_empty_hint(struct inode *inode,
> > +                                     struct exfat_chain *p_dir, int dentry,
> > +                                     int num_entries,
> > +                                     struct exfat_entry_set_cache *es,
> > +                                     struct exfat_hint_femp *hint_femp)
> > +{
> Please check whether smaller holes can be skipped. For example, if
> there is a 3 entry hole near the beginning and a 4 entry name is
> appended, a subsequent 3entry name may skip the existing hole because
> the Bloom filter miss bypasses the name scan and allocation starts
> from the saved hint. Unless another deletion occurs, could this state
> persist and cause the directory to grow unnecessarily?
The smaller-hole example is also valid. A Bloom-filter miss can skip the
name scan that would otherwise rediscover an earlier hole, while the saved
hint points past it. In v5, the hint records the entry-set size that
justified advancing it. If a later request needs fewer entries, allocation
discards the hint and searches from the beginning. I have also kept the
hint invalidation on paths that free entries.

> And please create the patches against #dev branch.
I have rebased the series on the exFAT dev branch.

Thanks again.
