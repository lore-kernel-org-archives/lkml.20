Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AD3DB97A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237877; cv=pass; b=uhaGSGVw+j4aJ3PNRowIdVLKUoQClei39GXkwyOTrXVESD9WcYd6bTfJSCsIrnSQicjNgUk5zgWoKh61e/2FahG+arjVj5Kf/Bi5Z6i0uhg4RHc6IHhSq8XwDir57Ag695OD0jS4HCm2R5vJ2/d16DWYzwzO4ubGdl9tPIWCu1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237877; c=relaxed/simple;
	bh=iQ6b+/zTo/QWlGjPARA1UZIAsmvKJ2duAXVjtpXsCFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ege3uRz9jPTI0USpezTT1Jmaw964V3PUBDUQtCrjjnnX3M63C6a+Y8Git3YJ4YcYoCKJnMH63Rwe2S8ZB2cF8B7TgaNKzx4WoiZrKkgUT5ZxMnYKZJYYPy0rCGoCEhnBRrzXSsPIKxUYZRVStaI7pZ2QQRa2UvxT+6VB8CPVPMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh2BDkSY; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh2BDkSY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so34407f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790237874; cv=none;
        d=google.com; s=arc-20260327;
        b=b82+gH1SPVs/Y+WQMxoI7NAmbMgwuIRobBiCg73JDuGvBrLlijp8uoHoawEQW1Up4B
         wfNcZ6cFAWiYQSuuZLxLOJ1L3UwO9YIJaa5cUtbP019jPB2/h5niKgrnngZ8+QUeJGpq
         UZPeTeOk7VGwJZJMayxoi75VBIP7I7hWF6KP3pfLKg4zI6/8DZ4nnqEfzAT9fSNO6Kg7
         nYvL13NHL5S6JnEq3IAYHX/aRJlt51TLqOPT2mYCq6Yw2B8aZ2sKzVLtTVynWV2xFUt+
         It2dMtnMqtRWiA/dFaRuZgwf+O7ro9cDADjb863HzO8fSDw1poHojVYUikXw2/o26CDl
         PlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJu/AuLG41tv3IGJK1rwhcStlwPDE3jmlfjcNPoALb4=;
        fh=iON+6CBmkt95CumqOtDhtnF45FjKqtiVufGpHIIYLlw=;
        b=aq9MBcXEUIszH4/HlCOxYpb6xGrAm7CuZ0OYwH5pTsVAkNy5cMBc5tcQPwaEbFlSvK
         PY+tLU0lLp/eGuNkGTNFN81a/0TT96YPBBzGgFpd3dtSgaFi8z970FL1/NVYirx8EN/Y
         MuCkX1veNyg6IXQrzFhTOAlKRiyEcnOr33qpuyut+IL+PCRp/7xMsykEShqrXJv0bBZj
         6JJx9YMb3X0Etz91MqA/ynaQVerk6Mkq52Y0MFCX0CUTk09iHKl2AI5iStAQgi/Oe7J/
         M7sPGGhaSRgDvEkrIfnibmrEdBnCt8aYseGU2f+uizgbk7dBYDsOcFbhOrCgOyK/iFPO
         UpgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790237874; x=1790842674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJu/AuLG41tv3IGJK1rwhcStlwPDE3jmlfjcNPoALb4=;
        b=Zh2BDkSYJ/ZFlHkcb0fhGkgSDPdsctMDt6UNrLCZXT+zpllaDl5n7gG2M3crfgM3Ic
         5hDblCcEBcIxrcckgkQRK6r+HMB7HI2KboiVNMYkpODd4XpVx0nMlm8YTLhIzU54TSVK
         m6b5086WZBDq7zsH/1y7ZRRtiOn/LHS3zB3tp2NpuRW+VB3Fb+JTpkadUIhD3a8ax2dG
         QT4qjWoiHm4fQktXpKEKnsGTNajuYM5nBZylDLnWx8itIxoHTAYbBJaO1bEhMeOzEc9b
         wYKn+CvvYE4mxUyL2Ff230yWr+mh3Hp/HF75wHDH2MQz2/atn839d8AXWajBBU4PZpvO
         XoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237874; x=1790842674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJu/AuLG41tv3IGJK1rwhcStlwPDE3jmlfjcNPoALb4=;
        b=Az/CpCbMbndbOEw4gTbdxZ+S2JRpSo5STQ/jH7kHA8zleG2dGGsXBBvHuxOu4reQ5Q
         Y3/DMAVJOUWzipHx3mdMLA7o2cUx3ALmUSTvS00oJvCxsWkQyrLa0joUuAemmkitTDZI
         B4Se/x8Gr4VScYaU09Zt9xgYYV81UxQpIcSczT8EjPWdysZTaRkrI7iUhh21pmGcXBx6
         QjUDsHDXMT8HdQVyux7Hzh+WauSYjCK6EIcjVv/Q+j86pf7uDh09aD6kbmKTPcY/rTgT
         etFhdGUK8GsQ56ni8lBcMSi6bdFPGucPlOwesiv3fKX4vk4m05h/jkDPdLE0NIDn3M5a
         gq7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwg27tQrDjXQn1YYpGNv2jzS6L+Jwhw40/E+wlYt1ces0TWQjHWoSwTsMo5nn51EVHSHRxSqt40F7/uoPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mai4KSd0INmjou9zQcDlKBznWDyqskSzA5eEBlXWZIcbnsjdIC
	8KAPtD3GPPx9RTy1emAGAxZYH/oMEgAiZBdeLpd1NuJtymjwtzKOd5dnT1HEuzO5O/BXea7oEPg
	ASeUFp3aVbpAjeXLsQuEMJcnDlGHMPbk=
X-Gm-Gg: AYBFou3EjqMqud1Z1v2GpWrvfJQnfCVkfO3s1pcCngV6B4JXTxpUKIZrQ+80jgAEduV
	ZNCyQ5iqNHu53JsJcBFqaLd7xhbeKdgxm+waeYMakxrBRZ8q+pEoqjJMTaAkxaWcYsZQzEXDuer
	etVLOVWrQ5AFEI+pbN5N5xCbxYaUvTHw/qcmvc/6cgE4nz+NIeTFKbBj276sdGX/jyKzPNHIRvk
	aKfet4f867OyN7Fv1Kejq51WpPMBz0ro55Kt3CLKIo3VFuNEhwXMULS0Cg7gytlknCAHyBfkR+j
	4BUIEBgL2bo5Uz4BneFIANiAnTh5Pbh2AttF0iVioxAsvhG3EGY09sJu
X-Received: by 2002:a5d:5d08:0:b0:487:981:4e07 with SMTP id
 ffacd0b85a97d-488716e720cmr2718944f8f.4.1790237873691; Thu, 24 Sep 2026
 01:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924015213.1196491-1-zhiguo.niu@unisoc.com> <20260924072315.57755-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20260924072315.57755-1-zhanxusheng@xiaomi.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 24 Sep 2026 16:17:17 +0800
X-Gm-Features: AclHuK8MlAR9NE9XSLRPlwO41-nSBJGfzUFuPyLjpLvxKU0346lg-LM-V_3sBYY
Message-ID: <CAHJ8P3+3NTEf0z1XyJ4PeHQru_XCzo37eHqvfJGoLHO8JHc-wA@mail.gmail.com>
Subject: Re: [PATCH 1/2] f2fs: simplify node footer check in f2fs_cache_write_end_io
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, jaegeuk@kernel.org, 
	chao@kernel.org, ke.wang@unisoc.com, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xusheng

Zhan Xusheng <zhanxusheng1024@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=
=E6=97=A5=E5=91=A8=E5=9B=9B 15:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Sep 24, 2026 at 09:52:12AM +0800, Zhiguo Niu wrote:
> > -             f2fs_bug_on(sbi, entry->index !=3D nid_of_node(sbi, entry=
));
> > +             f2fs_bug_on(sbi, f2fs_sanity_check_node_footer(sbi,
> > +                     entry, entry->index, NODE_TYPE_REGULAR, true));
>
> This also promotes every other footer inconsistency to an assertion.
> Before, only a nid mismatch reached f2fs_bug_on(); the rest went through
> the helper's own path, which sets SBI_NEED_FSCK, warns and calls
> f2fs_handle_error().  After, any of them BUG() under CONFIG_F2FS_CHECK_FS=
.
For NODE_TYPE_REGULAR,  add the  case of =E2=80=9Cif(is_inode && is_xnode)=
=E2=80=9D to
this flow,
aim to check return value  of f2fs_sanity_check_node_footer && remove
redundant  footer inconsistency check=E3=80=82
>
> The other two callers went the other way.  __write_node_cache():
>
>         if (f2fs_sanity_check_node_footer(sbi, entry, entry->index,
>                                         NODE_TYPE_REGULAR, false)) {
>                 fserror_report_metadata(sbi->sb, -EFSCORRUPTED, GFP_NOFS)=
;
>                 f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED=
_NID);
>                 goto redirty_out;
>         }
>
> and the read completion turns it into BLK_STS_IOERR.  Worth a line in the
> changelog either way.
>
> FAULT_INCONSISTENT_FOOTER is injected inside that helper, so with
> CONFIG_F2FS_CHECK_FS=3Dy injecting it now panics instead of exercising th=
e
> error path.  Deliberate?
oh ,sorry, I missed this, thansk for pointing it.
