Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB8D4E8E06
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366251; cv=pass; b=CvltkFCyhQ4JWzwvs2hIKBL6T6THGLxLY3dTR+SZLzUvdvjiMCwC6QwgmMIowru+q4ZUxFHAKdInPB5bTaBHVvxvHJ0s/x7nm7NS9z6dz+WryuHyNiHa/peH72ycF5uZMkog2KH1f3xnXY7Z2JF/1isK/2HxKtx0OAV8WrBN7Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366251; c=relaxed/simple;
	bh=EbQc/3HuMtKunmaCZG2UIb1wv+yZz9+14uXP/YSc3Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYAQyGV4byDyTnmJa90vLR5e0ruSsXr2shv3RQk3d3cHksV++brzxKiekqhrh2vWfgBobLdPtm6R9fejpW9aUk8FnsebVAnKUgMc/36gU7hnWzbAqCVrzJLbdEmNbdI/aPWUmnOrDh8R+94WUBLdgrsGFTP7i4pdIzL52KibRVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pREJPKoQ; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pREJPKoQ"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-141a5d476abso22789c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790366249; cv=none;
        d=google.com; s=arc-20260327;
        b=XRoFrgt6F+EOBNI2EvmcLSgIBtIDhK8wT2/iMF2nnFwSeC3CxEwZqr4UGeN0Y2DbFE
         daZk205w1QcqCG8yTHCxwmMq2AHX6haIday6nLVyWJ914jk0N9o7vUXqICZFkvIUvIw7
         W7w5x34+u4OATxz9RifM/P9ZBEFAJgd7KibJhvvzodTrVINbxs5vMUd6GJQzbMHoH7zN
         jB3heuk/OxkuW36HwUl1NNNMhys9Vg2/0AGZyiUIutVGjuX2vz4kJeJpMmb4VHkR6J7c
         TYMBwA5eJ6JeSE39jURihTkpmZ8/FUacWzb051kcG18Tf3IrA+xJjji4Ag8yqDlupQrT
         DsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        fh=TBWKNiUMkw52kKcoFUT3w7F15JTm9nwW1sKSyDApEzs=;
        b=KxBSSnLv+pvokvlu+OtH2eCHePstUsQ0l8UuvlnIyXehmhfm3vfDQ4BUJVa1xRjVSj
         BDIcMg2OCCnqqolvdDIBvjkAs3AjZ25t2m912oGSzpzDSs3BkS+57e8JESopnWMJZ+no
         YLbR+z9LTAy7twlZqrui/y5D69AgjfdJGOmatCanBBFSayihLU762YQwSA354ph1BbJ2
         qwtYv8qLnlxEKweGjke5iGLeelUJZZQy2F69zDbwv6U/hhqKoj6nF7rfzJLbu89Q87oO
         yCJ71Njd7aeIK5tFtscoZcIIdgLz5QJtM9OC5Yz7zCquefC/jOCLHyyOIrzD/s4IQiCY
         NWhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366249; x=1790971049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        b=pREJPKoQHWprmNNooo5CUCnKuH/+xq8i/UxuZvPQTabNxDDayHFZh931NsJrUQ+ZHv
         LxvUQSF8Ne06mpfIWHMPcRhN8uE2j1ra5JrjHUDcoReKyGAVSX/TPx1t2ROQptxPEzLU
         GfEPkQHOg01/zW1sCEcDgZbOwvD9LNYrazZnLqdNcAhaHAdN1h33yGZTxNEvDlCsohBh
         jrIEXtT7v9m3zqeNBt6aN/BmgSxuq/wphzWnlEvrvxSuhmBYEYm9LOkufSABY913BShg
         lalTTWlO8p0gQIy+XyKkMCChBqrmDa4773wdmlQ1Mo2HiXXsp9hHmvi9pBG5x2XuqsJu
         dKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366249; x=1790971049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        b=E2C/Td8CHPLjKQVsMN69hbnTagpLzrRGlN7SXopTaWuUgh827YHy4TFIm5cZW995HJ
         0FHzvZ43fxOXx7uvOo6QrxhupXFmXVv5LflQI1OOT4mWCUhmwZRL+CMheBI81Nu3QQQC
         ix4tFpgDfHm6AbxtDau4bFxVfN1gcrD+bXNse8yATberQbSl93iJD08z/2YE8GtVLis9
         wgKx4bMJ5ObRca2+Ar0oKhiEzRsdKLNGE8u6M0mG+Z1SgSV8r/dadwD4TiPYCv9+ep02
         wlwRYLx/DKmh9O/z5uhaTXQz86OmbVTqfffkIsW6845YhstIf0YvosiEpy/q+8CrrlfU
         v7wg==
X-Forwarded-Encrypted: i=1; AKwUvByQnu1SXH7QlgLfrWysBZmBB0gXcsV0elSHpafTH55rxne4OC6knT0/xudXGcxXDP5be4CX+KjAl5BqnNM=@vger.kernel.org
X-Gm-Message-State: AFuF++mcCxcLoooZEpvjLyANkXhZqf6zwj0vj/kZ8+jk4YK4gDFkwuIh
	rkjJLpbhp4FOK1rd+9iDyvcOcaneo/tQ/tzQfaff/kigyrxMwpQPp6pdu5LJrGRfSV3Tc4WU/N4
	QcWzDHx/h5/maqBtFrVaJTkFfK/+1pDg=
X-Gm-Gg: AYBFou12Y+SqafQegcKCe3BcXFXbRKnxLkq+3QXZ4aHRUNbkUYsX5ANtTyj24yFRVLR
	byf9VIU0raMm+14Fu7Y4RPTOO07ByUpXbwNcXYxIN7YjtilEcIAyRfuQ7vV0vxCGZ27LwSUes70
	h9I5kf50BNGCkEuqNfXnim6HDOcSt4jsXsAVacpLPBwsQO5iPXX45mvIckRQdZ3dnGPXvs0eOvb
	0PvvAAkbP0+kKfJPSxxTC9YPt40iROnWaPZi9cLqlTHMiQVrHpHTWPgplphxcQ7kaCapPOICo8k
	QnUm1IsKcc9nh7QDMrh2e9gQHgyPldvcJgSRxovTXC7Cff4008rr3x60xOgwJOqmSQ7Tokz17Dm
	bGqDPhDZNuQ/aFOtgc14jxs0BKn4mRSM1rQeN5bDIqw==
X-Received: by 2002:a05:7022:3c0f:b0:13e:5a51:148c with SMTP id
 a92af1059eb24-146cb31161fmr1265733c88.0.1790366249147; Fri, 25 Sep 2026
 12:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk> <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk> <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
 <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
In-Reply-To: <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:57:17 -0400
X-Gm-Features: AclHuK-Cq9d27p6uURRwzJuINctgLf65y86LjQs4-Pqe-rCewP5XBlqi-cNgrkE
Message-ID: <CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqdmDM6xQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 03:21:43PM -0400, Alex Deucher wrote:
> > On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > It seems everything built fine today, I'll try dropping the workaroun=
d
> > > commits for Monday.  The drm and drm-misc trees are still failing due=
 to
> > > the original issue.  Thanks for getting things sorted.
>
> > Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
> > that gets merged into drm-next, this should be resolved.
>
> Great.  Someone will still need to prod the drm-misc people once the
> merge is taken I guess?

Right.  It will be resolved when drm-next is subsequently merged into
drm-misc-next.

Alex
