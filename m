Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76136284880
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427168; cv=pass; b=mkPi2mPr0KQs4ls17MWEDlpc9dSd1a+kOtbViXVREvrif1nSJl2IX2qd1CUGlNbiTrTA0xrk34GDXUXB22gnuuoST/jOPfRwbZMOizimFYeLbZ9G7WIVSpkp5Ql0JlD0Lwo95cpn8UZifUHTlRW2cjwC3JKFJPoLNhPazIPgZQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427168; c=relaxed/simple;
	bh=Kvts8LNu+OWd966oIXmCICAbccRKosY/VKYtUxrxvVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmBFWWxJJsgckIuKOLZYvG8v+FX0fBye9ae9hwjUQA+5zSZ/Eb/38XUSP/TNVaOfIStqKiWNBALzPGTkvLdfqibtgIdLpTBtQD9g41v0MckUmm/ib4XaTJIrkJwj9+QVDs4Og9UMxT/VMBW7eBjNT631i8yDAC4o2arxhLix0BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hclHfs1m; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hclHfs1m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso18467785e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790427163; cv=none;
        d=google.com; s=arc-20260327;
        b=jDHe6YuRwsfDEGf5rUVmrpAh7xPegHiogak9B1yJ7Nfb2vMC2NmpIUu9doWq5mSpcQ
         FGKx5Ph6EdJdkXK50/s1tU0lxRdrqTkYYSFTPHQt9y5TS82jLKn4zpgvhqSGZKAId+q6
         5TT/SHjcRzrKISLRKGt98Ehkd4czSfNdAwPkSVWHbTwyTzDcb0WV+r8kCyaC7YfEtHJ+
         w0O3YtOghgaqG8kVYzDOdh8n2QFcbPpQSzX6cbn9l5gA+eJU4j0Lyxws7kQ1IPTC8SMY
         06VDrzpgMtczyM6KOvH/00MIdxQ6CDNYPs3sWIVKT7D3k/T0eP9w/cTxmfW+q0qmtvDO
         V4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kvts8LNu+OWd966oIXmCICAbccRKosY/VKYtUxrxvVQ=;
        fh=Taw8v9JnLjC0W5tn9IBMFaRqP4afTcZGLIMycrZNM/8=;
        b=Q+TG3sVC0mYonpEvOQwA915TH3qygc8zXYwBL694qcG8W1TGexhra1ZapzaYZqYs33
         9nLXKl/VRfKFVwSN60uq4ouhytTlpa8q1PIJS1xnrekjz4F3NrNFFQFXag0TM87veHBJ
         hnINQpNvdGcVVAUcFWtSrsWX653oYlXHsqSmFDRVtB4YEzvIQGsqnTpOtGF4YsutcKE6
         mRxw6HVVft9wQhr0SqrWLnxgFwgAUuFfmWBhi8zeZldRShVFHQbD66oTqN0wXrYPgnap
         C0NZ/t4jwCk/ecvBJZVTTMjk38zKPOvZsF/pDuUa5ilm+0okwbKvrQCRuV3Z0wSQzkqY
         ahUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790427163; x=1791031963; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvts8LNu+OWd966oIXmCICAbccRKosY/VKYtUxrxvVQ=;
        b=hclHfs1m/bCJgEcJZYiDFRPRQpnW10FD/B6dbCDq2Q3zVJx93wK40OwUzbFYFJygYF
         ijJX0eWvKjgncAbUhB/GLoGa+W2ztRsS2vGpyFFtHIHlC46isrDBPEFQo+PeJrKTKJp6
         x1XssO8i1UiiUrYSh+l6lciIeUaNkACs4jFV6Y7d+CR/iGL0ugfL2mphRdNGDuMBJNvi
         D7lnd/U9ZoQETXpEM9vh4kthE0bBhIb6ZzPFHQhY3867eTNqzGZPYKcM+QnE2/pXOHsb
         cd9chLwIWxLfzLQaqZwsC1FaCkvKZyc7aGbGoU12a1S2dIxzKQnylRqrHQ0JAYkD4gcO
         eUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427163; x=1791031963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kvts8LNu+OWd966oIXmCICAbccRKosY/VKYtUxrxvVQ=;
        b=n/mFF5RYZOd8EVkvuARaaLON3ZPRtv3/gU0ftSCtAzZo6J5mDSpEywlSt5eHM4XYpM
         mAnuSSnmwuUS5c0cSKHYugo51xtW+sOA8YMJcPjOBNBn3xVE1IDo3rImYYHEZnpnmTYu
         zVUHjFUHDBNwRYotnR9pJQIPFksf1e1dVrPyuXko/iXoDTiHN28ECIxbyvSVxC1rcn6q
         6q+AqVtUVamAyVSWOAITznZdDKNlFQCTIYihBBXA4G74YAf+yXPsQNRPPa8fvkzzJy7O
         TuId7qTBBGZkLCmHHbF89/nGHD0vfGZoeHCHLMqfymmfyBHDb5YffgbeRqcaw0oOICtF
         M0eg==
X-Forwarded-Encrypted: i=1; AKwUvBw0BHNyEJFgjB+hlNW+dYXGf+bWehmUKJb/gg49GRW+wwV9N4zeqo/om4pl0keegFqZp0wyHPyrOgGbKLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQh6ie350HMqv3JNxMtrI/PWyv/Rs3XZrLzIW04SoGG5VjCbjK
	JEvbwUSYsMpSMIi/IF5QRbjH+E9Zp0U2jxrgKq2tD4hXoSnOSI4CHCdqztuAVAgKvqAJFwsLX1m
	u/aWdek30S9VTEYQQH1YcFsalr+r8eET8OA==
X-Gm-Gg: AYBFou0/JpVjpRxmHJVpx+BdepeLSS/0xsRBl6P2DK6fPzSv68ZS6V4L9/iFOekO2Zb
	jgHi0CV0YmpMhzgUvPKjFn23Wn35Ir7KJA2zw3scslEd6lPjfVZvUA5U7iPB+iTxHKxhA7wtUp3
	FbNteVvJMm2KpMiwtOjvKlWiODsNoksRLP6qRhqFALYQ1CPcqDKiqwEC9JGHwjeOjdFNY8QuYfc
	SMoGek7CXqO5k60o7HPE6AInh7DwLAmQ/1c9sJ2Hd8SJ2bW2SOapjFsipaemY3MHMLA0O+/urZ2
	W3xZ9Rx4k9iXirAvNeYlDYl49nin+Jp/xTtkTPhY0u74uW450XYhvkGJzNvbWXAJIPSLwvLF7Lk
	gJ3tFUg3nGIs2bzNLFvJsGKup5b7SOXkPkXCWKoEixnOZW4qIs0FB0/MnpbvJmFEBMNKQvwicm2
	/YJbHcupKiyVz4J39Su7HTV6UjRAnn4EaQAYVpzsM6HNeQcv7djBap3sWNsUwrzxW07/+Pm5WP6
	hkMke/3jcxGZz7y/xy8CKhfJAV7VSndXkA=
X-Received: by 2002:a05:600c:1c1c:b0:49c:fa21:1c7d with SMTP id
 5b1f17b1804b1-49fe7babc98mr166966135e9.18.1790427163252; Sat, 26 Sep 2026
 05:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916124236.1389-1-joshua.crofts1@gmail.com>
 <DLIC0I1VQLHE.13KVAJJ5FUYZN@baylibre.com> <20260918131504.00005d2a@gmail.com>
 <DLMI87KFXHTQ.SWLSTWGCM2T4@baylibre.com> <20260923092437.00006b61@gmail.com>
In-Reply-To: <20260923092437.00006b61@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 26 Sep 2026 14:52:31 +0200
X-Gm-Features: AclHuK_D0j8esuuFZJv-lGLLnVq7Xcq0lvcWbnjnEOQaLlZlYUjvLFoeQECUknE
Message-ID: <CALoEA-zkr2sj5tvN8RGAGhaNQQLBjZMRY9nwTn=H1c895O_Wyg@mail.gmail.com>
Subject: Re: [PATCH] can: m_can: pci: add missing pm_runtime_dont_use_autosuspend()
 call
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sept 2026 at 09:24, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> On Wed, 23 Sep 2026 09:06:59 +0200
> "Markus Schneider-Pargmann" <msp@baylibre.com> wrote:
>
> > On Fri Sep 18, 2026 at 1:15 PM CEST, Joshua Crofts wrote:
> > > On Fri, 18 Sep 2026 11:24:09 +0200
> > > "Markus Schneider-Pargmann" <msp@baylibre.com> wrote:
> > >
> > >> Hi Joshua,
> > >>
> > >> On Wed Sep 16, 2026 at 2:42 PM CEST, Joshua Crofts wrote:
> > >> > m_can_pci_remove() forgets to call pm_runtime_dont_use_autosuspend() on
> > >> > teardown, even though autosuspend is enabled in m_can_pci_probe().
> > >> >
> > >> > Add the missing function call.
> > >> >
> > >>
> > >> Can you please add a Fixes: tag?
> > >
> > > I guess it's not a problem, however we had a discussion in the
> > > USB subsystem whether this type of patch is a fix and ended up
> > > agreeing that it's more hardening, hence no Fixes tag.
> > >
> > > Alright if I just append the tag here for b4 to collect?
> >
> > Yes, that's ok for me.
> >
>
> Fixes: cab7ffc0324f ("can: m_can: add PCI glue driver for Intel Elkhart Lake")
>

You can drop this patch, as I now have a patch queued for 7.4 that makes
PM runtime call this automatically on driver unbind [1].

[1] https://lore.kernel.org/all/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com/

--
Kind regards,
Joshua Crofts
