Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E94DA9AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401350; cv=none; b=bid45cEZIxPy+8KMbZ4qX92iYFDBI3H4uOurhmgmivTDuBAjHYZKRTzZXuSAerrn6OOWKRKs4ee/rextww81ZCux41S3lSTilbHb7hhY70s8Xvv2w8TWLI6bT3nVdVY/liN2hpl913U67m5JejAjQYqBvzxvqG4QTVhk9IBl2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401350; c=relaxed/simple;
	bh=3F2Wdj781elvux7E9fjP4am592WOvWvGPF+vk5BNmmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7qOmcq0/LY5PbcNQbGemxW7CbvCZAX/aXHB3+a2BoyjfzUlU67KbSVoTO0/3TUDYGimMexNWrcDu2y85T9Nc30H/+VzxNzl0vuSYGqVQysl2rm7v8kxGd0hRfMXqn5v1eHDqruJMUvbW7x1ZSAZ5edvs+aa9ueRFHVYdO4jLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ULEg2GC2; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ULEg2GC2"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1343140a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401348; x=1792006148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpZamiTSz/rlpZiIuxeNlptD6VaFljDNLg5uchdAZ8o=;
        b=A07sP2w9ESKpQs09Fn1yu/1LHCzXldoL2RjEG4xDOsSrOj00t+gWqoLeosJGw4LS6B
         976sEH7jynjohNyvy8J1xt9j12G3nMoDHGwApXdW4pBL2FT6gfCb7w42/QGqoEncqDMZ
         fPN18Qb/7ea/pT1frYssd7g3v/BmTE9m+TJeCKjMj7fiRJhUgoRHbyk2YgSyaCdT0FUo
         mk54zpYYhmojzQemOXDllWc4fmUOrkgueq7S/yaaMSxXSLgoAU+e5vINYPcT3XnAjVnL
         mqaYpNkBZuqMoRqtrPk0P4xL9n1u8JRuBpy9gWf7XsDYd9Jcdj6TlK2XSwWYWr8LGpkK
         DlDg==
X-Forwarded-Encrypted: i=1; AKwUvBzvsvP0QXyCZIeADJ6axmgia33Fv4ZSWYEJAXQ0kpDRGz6GcxVyPywosFAsAuK7GY2UFumB72lzvqxg5As=@vger.kernel.org
X-Gm-Message-State: AFuF++lDxp7Tih+3GBz2SGbQkaRC7vqDn8XQe/crNFXQDnXkT9XTkWR4
	jfvSTif3L4e5+dHYxASqdfvgKnTSeLC14EKdwLbFTTn7ML9Ioj6s6c9Vhhg72XK1zX5TlcApAYj
	c4iNsYLWBnl4xIW6g0eUJAAddI9CYkpvXwqYjbbbRzm6vxctaKbK4/ayR5DGp6WqDQ8MA/Fj57I
	8tR494xeG90mZFNT3FpTpuxsVVOTRHTzAEKSnH3a2vJpiSf6YIN7rTHYmfMiigz8fWzkAwYlH+R
	TWQgejx6uplxPPN
X-Gm-Gg: AYBFou07cEFTekr3+/MWsIA1Vwh4XYVFprRJOYI9A/JOSTtnTfhoLnkRJ9FZse5AewF
	O576rckEwR6rs5gsc7Nf21I2XLgibEw9EzMDs7qShWJAE3BYH9DbTQn4Yqp8QPP2qlFIdc2BWTm
	x6RlCn27TFaJNZ8fmek595cVqtn8FRZx4vPJJ2tyTjLDPOnd6AEzK3du6tJYtY3EaoxGpg6U/K4
	5FFoxrVdCKpPiYuUZUaoOGt/ntThOo+w1C0S5gq2rwFmMGxkRIZylvysa8WEr+lvsQeg8c+bbq2
	gcrI4JFFITdG1zOCp59WR+ALGoQKpGCGQBEaa2+aqjzp2VcX4ZNY8xGcYaJOw/Mexi2CemHSK+a
	8/zlEV6iQZgQUSXjWY1LNz9qjLbQYsPFQ1zCPBQgTLnLZelhUfGE49Cc5J/qRb+rBdxO+oxdAgk
	yOva0ZcF8cmOVOY9Ui4ZMMYnaIG2Qm3wjlVJY=
X-Received: by 2002:a05:6a21:7187:b0:3e1:282b:9aaa with SMTP id adf61e73a8af0-3e14c52cbbemr99383637.29.1791401348206;
        Wed, 07 Oct 2026 12:29:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd0ae858663sm432393a12.11.2026.10.07.12.29.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 12:29:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5bccbdf58e2so1163391e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791401346; x=1792006146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpZamiTSz/rlpZiIuxeNlptD6VaFljDNLg5uchdAZ8o=;
        b=ULEg2GC2yDGLOjhc5mZRnO2sJweHXO2r5HiZravbgSo8aYQAXTZmJKI9GfI4K4kL0/
         mOTLmcqpO2NaHf71tRB93B6g7yzlpA2FVB0OdvcGPfo6ar2XGg7mtobV8z+TIWbu+z1M
         GfI8e+pgEeh/BRK1VoVpIakjlASw+uNv1Hp+c=
X-Forwarded-Encrypted: i=1; AKwUvByi/dpLAbjvR4sgdbR+jpKv6eU4Ms6/WJrJCTA8/OaPA37k0KHvKadvYXR1OvzEo/lgqVsSomWoN+bobxk=@vger.kernel.org
X-Received: by 2002:a05:6512:6687:10b0:5bc:d17f:3889 with SMTP id 2adb3069b0e04-5bcd17f3b3fmr600951e87.20.1791401345884;
        Wed, 07 Oct 2026 12:29:05 -0700 (PDT)
X-Received: by 2002:a05:6512:6687:10b0:5bc:d17f:3889 with SMTP id
 2adb3069b0e04-5bcd17f3b3fmr600938e87.20.1791401345381; Wed, 07 Oct 2026
 12:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910165221.7558-1-michaltoma@sicoop.com> <20260910165221.7558-2-michaltoma@sicoop.com>
In-Reply-To: <20260910165221.7558-2-michaltoma@sicoop.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Oct 2026 15:28:52 -0400
X-Gm-Features: AclHuK-a9uLOB9y3ILL-Ku4Q_D3r9cWO-WEFl6kMb-MLKL108ZeqUfqXzNsufPE
Message-ID: <CABQX2QM7RJ6LjSpwYYNa3oVU6-N53UbbmW82OVdRv4un1s5ULg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/vmwgfx: Don't map or free the exporter's
 sg_table for imported BOs
To: Michal TOMA <michaltoma@sicoop.com>
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e3a30a065d4520c3"

--000000000000e3a30a065d4520c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:52=E2=80=AFPM Michal TOMA <michaltoma@sicoop.com=
> wrote:
> The exporter has already mapped the table for this device in
> dma_buf_map_attachment(), so there is nothing for vmwgfx to do here:
> use the table as it is, and leave mapping, unmapping and freeing to its
> owner.

Thanks, agreed, that part is right.

> Cc: stable@vger.kernel.org # v6.9+

b32233acceff went to stable as "# v6.6+", so this should probably be
v6.6+ like patch 2.

> +       if (vmw_tt->dma_ttm.page_flags & TTM_TT_FLAG_EXTERNAL) {
> +               /* The mapping and the table belong to the exporter. */
> +               vmw_tt->vsgt.sgt =3D NULL;
> +               vmw_tt->mapped =3D false;
> +               return;
> +       }
> +

There's one more problem this exposes. With this patch imported BOs
can actually be bound, but they're never unbound on destruction:
vmw_ttm_unpopulate() returns early for external TTs before it gets to
vmw_ttm_unbind(), and vmw_ttm_destroy() doesn't unbind either. So an
imported BO destroyed while in VMW_PL_MOB/GMR is never unbound from
the device, and its MOB/GMR id goes back to the allocator anyway. That
was already reachable in vmw_dma_alloc_coherent mode; this patch makes
it the default.

Could you add a patch ahead of this one that only skips the
ttm_pool_free() for external TTs? Something like:

      bool external =3D (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) !=3D 0;

-     if (external)
-             return;
-
      vmw_ttm_unbind(bdev, ttm);
      ...
      vmw_ttm_unmap_dma(vmw_tt);

+     /* The pages of an imported buffer belong to the exporter. */
+     if (external)
+             return;
+
      ttm_pool_free(&bdev->pool, ttm);


z

--000000000000e3a30a065d4520c3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIKRo
Y7GI5aNloNEG2ExEmwZ8NIWBxNRE6nWiK938tUl4MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAwNzE5MjkwNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAKzSLTyzeJmXgv+iwMoDaBIXt5MA0ZAvgcuXv8U
L7oIedQg5lDVoQ/7Lc1EUvsk+ts73+PFEcXcQ707glzeGbDrI6l8Davmmbx1RbuEKiSpDYCZJ+gx
lztxadqn1GXtrDfeEU4l7FZPiV4xMD/6zWD8vwOp+CMWXLi+fGHcVnRjpGcB1FAPj4ccgJIjWOS0
EzDLmQYrUSrjdQkn5DBiWBoq+kvzS0m85r/UnbJL8GCGmE3o2LgJGH+8oEX3j6KEEWJ5yqjljPjs
3QbjZESB639Dvi/7cKZVgVbboZnApG986BS0u5V8LpiyrfQU66HZPehQW28JP+f3o8zWR68Id7I=
--000000000000e3a30a065d4520c3--
