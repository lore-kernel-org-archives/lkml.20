Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9D3AFAF8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977466; cv=pass; b=YVnjtWTFQWWHmbXB08CVjQr0bpP4It/ZhDY627/MQZNBU7lsP8MZ21MbC4La7ZbyFM364PmurZRy44NH+VKnvL78DQnDL2H4UPrRtkJ/zsleRxMuqPIwEQT2/eLGuFje/bR3hPY7wvUA2wJHCJyKGrPL5TBmdyiSz7MRC6fguRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977466; c=relaxed/simple;
	bh=wTKF3GJe24qvlJZnP3fb1zIfYdXZhI1ydDoNfbeg+Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViRwjgO/RbYEr3KqvyAyff89pTsJ9taMCcTMpcznGrfWkPBGv+FHiTqwRxHV5k3tbR9no/O17e1HK6aeH1psrFcqGaPl9XLKIFxjeNwNx/WlXzzpeG8UTQmPj2xqfeY0swtoj4kJxzq+B5cjZcvLj9kdZO22HpBe/NnCSlWBmf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyTFUwMD; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyTFUwMD"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so2183663e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977463; cv=none;
        d=google.com; s=arc-20260327;
        b=e6HfBgMhz4TaY2ieQCAN7/s+zPDD5ULsM92XRZ54iT1brLeXACXkSpiYrBR5g2jJly
         exZ0jVwkFnQlFiR4woplLy6zW0/gqYK3XoEEDXjqUbWWlRRoh0Gq+fR94bStBBv1S97U
         LxqVrXVVpeIzGwE3SiIHn3Yl4t9V7QkWzx4wdHJ8ozqg3KBczvWDJOm8uCZ7QkV5P9Zt
         VatvUsCKIXA8JDksazLQmAIy9ElFwyFWwHkcnE0UUidNHPAM90UtXr4rSSHL9FJ8Dijf
         QzCuD57R+XFxbXnSg3zSIxm/DtV0lH/M4e5qQJJx49CMT7N6BZtP3CDpfa4Zk1lpSaRW
         UBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        fh=oWXXT6AZo8Q01/dv8gKcVXh3M/i+ugn9Y4gcNOlVj34=;
        b=oCwdOGgojp7NfRra8+HSImWdDZ9k55U+DnDNBkUxa7DTIPPD6Rq6a205OYuJJRSKem
         LpUN5AshdxTxErLD54XTfdS1+UI7+TPJF9rmPzmJ+uwpxudKiV96QF5IUoF3Vh+b/6Hn
         JRUdUpIWXsBCqdG1OLyist3WcwjcpOBPx5ye1XyAUfcFRJduswoVOk0gJBdI/LNhHZZu
         tUQUBPtAA1mFIyHjfi44wSr44sM9+eC7pRthkK6tQn2xRf5dnD1Fzae5QvYqTkETvPQ1
         VxrNSgkyjup+tSyR+UrRgXMe7QcB6CSo3/RO67RjBPT7+xfZkhzsApiTMpBO4Xpt2Zt5
         14aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977463; x=1790582263; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        b=TyTFUwMD52pQ7pvfOyEWc8t0oxQfnnzHHwXPj/YQJnvHrnKVUsbyFk8nLSLZ1iAi6y
         jNxRCNTSD43Z5qnYVlt2kZA8fHuhrVHfY92UOvyWCi5yzuTzJm2snPzZUDzAJ7/yHjK9
         Sa36CZSjmjhYNRD2/x8ql0YAseikz+xopXGA0fJA7KOHLmArz5Bh35fYXi0qUmYmecF+
         tPjoVE+JZ9WCscOacYaGA/lfrRkUAQoMUMGfAvI78WiJcN/XcfCAuVZfq0TV46NxZBeR
         DoVJgFFV63pBFONub790eXeWkw0nKejfYG5+ccKCWLRkSsmO+8r6RB2mVC+4OzmUtCrB
         gwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977463; x=1790582263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        b=fWYPNeRgj4fSCyXzPYOOkrhDzGDAPwa/qwGZAj7kNH2zH9lcvOQCEnm7TJYCEu+p30
         9b0+86j6GT3i5DRDYmwz8RSp28YMSfhFfr9ME7Gfg3/oooUEAy6cXFu8PFwsbxjrhJWI
         JPC4jDluK/0BSC+C/H05JyCh5dA8AXfT1gHpj/Shu6agVBdR8IT+KTlEL6Ow4m0HHDVr
         u+DYpWZMos3DzKVRynI4IAw2pULjxPmsDUgTniXGs4QXKVkZ9awlJ3vjvBCIJPVlMs0G
         r/qRLJhuzAllAmZN7z+u10rtErQ5Ng1phq1m3skaRS3Qazc0KP6nbMtfUtxPIj23vRgD
         Efug==
X-Forwarded-Encrypted: i=1; AKwUvBxFfRk/szrVgBg998j7FlZtHKk/H9zaqtrOHKTLoJCiSJ43nUcI/2vdovSoKNoJ9Xm349jXtIS5csDhQEc=@vger.kernel.org
X-Gm-Message-State: AFuF++ls7RokeozglK8L43BXaemuBF/FpbTtLoFor+NVk2xQaeZ3FcFC
	YuOxwny8eHzknixnCW3H7OKy7GReI8QxHUsaa+2o3Xskdu50DBcC8JLEgzdmGBySh+RwVoOR+He
	WIFU346gub/UIBLQwC7PniztzmWFO2aI=
X-Gm-Gg: AYBFou1rsejrHdrBP82w/zvo1VAv4vbql51fHePwJnphTeff83MTgiBGAoUG+QwwfID
	1a5OMcK6AqQw8myuaekdDc8UPASFmpavHTLunK11QWGp/8vKtbWe6CBOUS8J8n2sC20NbZcMyxo
	kZXsCwYVzi8TvqgQXdxFUpsmb/lxe942QOOiwk9D5cN1Q29iFlGIXSBJWifl3iCkTznpnS6FVUe
	tRht0aOpMRXwWePW96FKOgALaGYhYGaTEpvs3UmzUwYQHQ9e5sNrHjRB75mgsevQ/g295eSrZtp
	DjF127Xc+dIx3G2lRaXSDuEtgIe+//sewG7lq5Y66t+UEcrjQTa+C14=
X-Received: by 2002:a05:6512:104c:b0:5b8:9ef4:2bdf with SMTP id
 2adb3069b0e04-5b8c1809487mr2756705e87.26.1789977462770; Mon, 21 Sep 2026
 00:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920025955.31209-1-zenghongling@kylinos.cn> <04255390-4133-4e8e-81ad-4d2402498431@163.com>
In-Reply-To: <04255390-4133-4e8e-81ad-4d2402498431@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 21 Sep 2026 16:57:29 +0900
X-Gm-Features: AcwNN1XT333aOgbhzPsm-JYe6T_jxFAvajhOncAJFvThd79_ZeNb3_O9r7eZWKk
Message-ID: <CANFS6bYLBPr+FmE_MVWxBBMw+Qz55EFfy1u6UmBgkTak2CMyvA@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: mount hibernated volumes read-only regardless of errors=
To: liubaolin <liubaolin12138@163.com>, Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Baolin, Hongling

>    If you agree with this approach, could you please incorporate it and
> send another revision? I'd appreciate feedback from you, Namjae, and
> Hyunchul.

I agree with this approach. It looks sound to me.

>
> feel free to add:
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
>
> Thanks,
> Baolin.
>
>
>
>
>
>
>
> >       if (unlikely(err)) {
> >               static const char *es1a = "Failed to determine if Windows is hibernated";
> >               static const char *es1b = "Windows is hibernated";
> > @@ -1581,12 +1594,25 @@ static bool load_system_files(struct ntfs_volume *vol)
> >               const char *es1;
> >
> >               es1 = err < 0 ? es1a : es1b;
> > -             /* If a read-write mount, convert it to a read-only mount. */
> > -             if (!sb_rdonly(sb) && vol->on_errors == ON_ERRORS_REMOUNT_RO) {
> > -                     sb->s_flags |= SB_RDONLY;
> > -                     ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> > -             }
> > +             /*
> > +              * A Windows hibernation image is not a filesystem error, so
> > +              * this is a safety interlock rather than something the
> > +              * errors= policy may downgrade.  The super block is already
> > +              * read-only here: the temporary flag taken for the check
> > +              * above is not restored when the check failed.
> > +              */
> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >               NVolSetErrors(vol);
> > +     } else if (unlikely(temporary_ro && sb_rdonly(sb))) {
> > +             static const char *es1 = "Errors were recorded during mount";
> > +             static const char *es2 = ".  Run chkdsk.";
> > +
> > +             /*
> > +              * Errors were recorded during the check or earlier, e.g. when
> > +              * loading the LogFile.  Stay read-only, like ntfs_reconfigure()
> > +              * does for volumes with recorded errors.
> > +              */
> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >       }
> >
> >       /* If (still) a read-write mount, empty the logfile. */
>


-- 
Thanks,
Hyunchul
