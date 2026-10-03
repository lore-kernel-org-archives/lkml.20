Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D29541CB5E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023422; cv=pass; b=d4UKK1JWAUG7XfgB9smzbN8hfgixee0ITPX9wYBmfSht4AwDTNcrAe7s/P1Rw094IXurlfV4RlMO8pfXdbLapSW0ycT5bEFI7zSMVrM1PmuqS8HYFMkHWcvqIDTqVepjCdFTldJJKN0cetvEXPs28KkfV9EY4hBV+/3VLmQbEAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023422; c=relaxed/simple;
	bh=fZx9lUdvWiwCkwZGkDZExytCPtdO6wfT6mLSmqlL+Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sxn0EDrTjWcNLQVj2nd3dl6O62IIC6z/vwCPVl7fbx6cuw1+YuDu5fbAIHrF8DL6gTrPT020zPJqpQlzEgE/s59/zrJFqrpliJWa8KhyJV6ykNUnblCxjx5c1WywsvVFQEukxyqcOss0NLlwpFPsvPiqrqxKRl7zoEDIzTtcsmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q84rEiGI; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q84rEiGI"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1419d3416ceso739187c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023417; cv=none;
        d=google.com; s=arc-20260327;
        b=iSP3ZEyymEbmTENUOERmiEeSIbABX5p3v0dcwBLJ9A/ROzjyRTucRVEqHVmNpFoERK
         1cgQYNcCmwYhKW1aM3z7hBWpIWjYLNEUuY4mfQ5xcePbgLs68PECWnzIs8cZGkH89FUm
         hpMYu0wYP0dJixhN9JSbzvZctgGTLVToD5sAMx+SQzdpPo6xVmh1ICkV8P2E/LVPSC2w
         SORu7O9tT9q1yWkAXZqLY/sBFJYROJzd2xohBik8NBBxj1ErA4rJUQ8pkd/B6ztoVWZz
         hLz7gIIf1fxkVypMWa/3s9auvX9MsatyXGLbe6T79DflKbOXZ3eQRK/uxFPCe7YSaH+E
         EyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZx9lUdvWiwCkwZGkDZExytCPtdO6wfT6mLSmqlL+Go=;
        fh=xPnkD2KsKr7vqAAac1Cat34JV1phq1hngE2Gq9doXZQ=;
        b=ZiINhJvknlbX3IuJfqxZ07lFzsQtK1q0kHQSdbXVUYjB5YUauKZAJytJXXFWp2yXLh
         LdN44q3qy6hh9VxD5Ja930zQukuHc/T8TFXUPh6hvsPfs0ZLbWchGXed13T0dW+kH3/l
         RTTOOKHl36EMf3MPD0a/u9dpKEShpyOpXWCua5uYHA1+qTU5+2qVyKpQzmjnQqgah+ta
         sZrD/vbADkJss8y0wpTAHUKZ2A5TK+SctBHywVW/mTZo0wlU6Bin0TAMacdvTxFhz82i
         fjMmqU28goqpyzTMN/TLI/iJLJotTlZAtwdCkSgtE5yZjHEKxohSFuVcep/UYXGbABCk
         gXVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023417; x=1791628217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZx9lUdvWiwCkwZGkDZExytCPtdO6wfT6mLSmqlL+Go=;
        b=Q84rEiGIDKbrq1iiU54NAt2uNKfrXMiYUi50UBIoel/z43SUoMyFVnyiPbh+S+fKik
         ZCt8Dr6uQiVWqc+ZKHQgRPpl+AbCjD9M4TJzgriG6zqkB5V1xT760UoygZ7g55JeVpNB
         IgWrE5vCmvMN2Bgw1WHGVmk77ecbSSmA4/5SCTKDevHrlkvLgqs2F1tHapeqrzRg+YCT
         sj+dMwPYARmnEij213Uxeo2F2vdEvUOAEzOCvaED9z52+Z5XbRllpjrIxN9M1VFUQ+YI
         rM10soOnlAIrNMJNw46WjyWC27bPwDACZC98PZheI/IoO/3/N4Ad9/wmTUPGrKoXGWKT
         FICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023417; x=1791628217;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZx9lUdvWiwCkwZGkDZExytCPtdO6wfT6mLSmqlL+Go=;
        b=Ka1A/eqfEgvTd+hgpoAZKT9x5PzpZguGBpCCFtVxTyb5QTGyhV0MjUdykJeKetYGOu
         wZuuFeL7CSiTRoSGzj4kDn4oxDQ0bm6TdicQkZjvK23hjlZYjLbtKluRuObjGf8mATxZ
         VJYwIY/d+9cnJLNj9ZjAZynYVc6cLBpSQhQ1oTjJNmjJpabHJjF31kf8ba409AleeNe8
         tes4zMwnyKL2LbldZsqtc7rSZp+Wkm1pkfgtTsAvcz0aqIy6yOHoUhvQ9B7xNLcoFhkX
         TVC8s1SVUPFPOvzOZyHJuWyk6grH02KZThlDt0djvEHJ6B318mrLz1pEy8l624D11Elx
         JZ7A==
X-Forwarded-Encrypted: i=1; AKwUvByAuQQewE7jslzQq4+rQsNvWy7cfsC0OF5DMQOAoFSwD1JIpyeDa+mPwD9DYw7rJqsiG9GGBuijhpn01C0=@vger.kernel.org
X-Gm-Message-State: AFuF++kRaWxh0aQmpjmzHoYbp1EPbAFOd+kBsiz71uwAiVIUUdphy6L3
	7n139bPDJsnpuSEwz0pVTCIsLFehBcaMS+2B5glxpscixTis7v9Hz6VKDvSNG7V81qPlwa0ok8d
	YBP/gQD55uSuI91ILjeTLBa0sueELdJY=
X-Gm-Gg: AYBFou2szLs+1XQVmaFD/KvKVX26bPwE4Evn51xnN06O0llQ+nPPelvx/9muSG+3hCb
	v4S7G9N5X9wdjFJeyMhYKgz8vsM1EuRwePLbYg8XjaAMI7hqQpyRXAAKsa1I0cIQgjRS8iTuLc/
	vkCeLRmM3SXOP3K883apbaqC/xnavQS0+kquU3x1DtbteiZe2hTqKOzsrf9TveBa1cjm+veF4W+
	ZwtWzhQ6P6oyCaUJER4fyCKu/HZnvhdeue5l9Nu3uio49ttCrtS0bLfjEXNLLWJcpSkXuDVSvFL
	s/dxwhpnOYP2tiG/iU+9EHOqIIQ/oXeR7AFuHF9T1oUz7Vv8A/06B/Pm1cpNmZd8TjjpmotXOjb
	puFkOUhZzlTsF
X-Received: by 2002:a05:701b:2506:b0:14d:ef19:246f with SMTP id
 a92af1059eb24-151c425f5e8mr2955545c88.45.1791023416729; Sat, 03 Oct 2026
 03:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar1xOV3x9ZMGx9XY@MacBookPro> <20261001060131.51103-1-l3b2w1@gmail.com>
 <ar_VWGhC1O6-4w0a@XiangdeMacBook-Pro.local>
In-Reply-To: <ar_VWGhC1O6-4w0a@XiangdeMacBook-Pro.local>
From: binglei wang <l3b2w1@gmail.com>
Date: Sat, 3 Oct 2026 18:30:04 +0800
X-Gm-Features: AclHuK_LxsbsKKpjJ7YEr_1aJWjHRX_PDMRNTW2QY9TLuY_nPhyJ5ArgFbn6088
Message-ID: <CAJ3C4KxhLQd+pOupWY+kbGerBpZM8nndKnZDGfv5oHw4Hw-1Aw@mail.gmail.com>
Subject: Re: [PATCH v2] erofs: fix folio reuse from a different address_space
 in erofs_bread()
To: Binglei Wang <l3b2w1@gmail.com>, xiang@kernel.org, chao@kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, happy National Day.

Gao Xiang <xiang@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=883=E6=97=A5=E5=
=91=A8=E5=85=AD 00:01=E5=86=99=E9=81=93=EF=BC=9A


>
> On Thu, Oct 01, 2026 at 02:01:31PM +0800, Binglei Wang wrote:
> > erofs_bread() reuses a cached folio on page index match without
> > checking folio->mapping.
> >
> > xattr.c calls erofs_init_metabuf() twice on the same buffer without
> > erofs_put_metabuf(); the two in_metabox sources differ, so buf->mapping
> > can switch while buf->page still belongs to the old address_space.
> > The next erofs_bread() then reads the wrong mapping, dropping shared
> > xattrs with METABOX.
> >
> > We require folio->mapping =3D=3D buf->mapping in the reuse check; other=
wise
> > drop the cached folio and re-read via the slow path.
> >
> > Fixes: 414091322c63 ("erofs: implement metadata compression")
> > Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> > Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
>
> I applied this patch with the updated subject:
>
> erofs: fix xattrs handling when metadata compression is used
>
> Reviewed-by: Gao Xiang <xiang@kernel.org>
>
> Thanks,
> Gao Xiang
