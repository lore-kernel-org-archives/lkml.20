Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7338B130
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077571; cv=pass; b=Q0d7Q4Y3jiZxprG3JXrUcxr67wce2QLiMysVfmjYKHkd8DPdLOTGetMBsGJ65JRTjPXvPXzrCp6m4qSWgkm2NYnlf+aDNCY1uABc3aUZOwSiR7Biu1HWox8cpDRIf+L7W5IAv8QtCe9KJZlw7fD7KGVLRpc7T6s2a1ooaaO+ciI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077571; c=relaxed/simple;
	bh=pKuJFFIObsTW8E1vxj5zIM7WjIDHbM6IQyGrRxGOuIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyNBNo+fmDgRndrPYLX+nuXyzGaqcY80gjANbxLdRk4CxXJupYVGXAvK53BBNSpWjCbFCJJM4sWAgjUA5Tw8RglNAGHkJugSCPAsNg4xOQQhpbZcG/wJY1vHImW6MdHfV0uFsOFyELbyRShtswniRwY9WWE7aTFRS3WqLLxg3O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWSVWed9; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWSVWed9"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798eb0d190so1642093d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077568; cv=none;
        d=google.com; s=arc-20260327;
        b=RxX/YgB5EO31wncooKGdI0tI9qzO0JlxnsNj2WfmHB+i/t3cfqtY3VBUcVDCXjfFxR
         mxNKlLE5+oPslOUxXnv6JU4raudGCX70jJQnZG1Hg51HnArPInkBAr2K9S5+r5XKQgkg
         rSojA+MaiJPpDHpjxDimkci73PFn51JPRXtIwy+SMZ1NE3912Hw/MloVK2ncQcaEnHST
         BWI7+wcUXQ+Sr/72LU2UTZIb7i6Ceb9ponVn5NMtljpRrLiWZhXjm/QZawsTBSZnLEOr
         ff6yB6AFZMkf1sKk5dFj2IiHeSXpx8/1kpCi6KFnHm3pCvJd5Kd0mJSvHRy7d9i/367T
         fNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        fh=H356RSeVf/ZWkyPhRuUhGbpa46ROplsBRmJdfwU82ss=;
        b=Xe3xoWvjlMHejOQ0TU/eJo3viK+HFGK/gdS1STFA9ZtN9VoDBo0vqTJIijY7+9j5gp
         v3iiQxKOuyIDMRFKg12yia04EfD9aFaABLskp0cDu/PtIESw03PDVuFyL2aR5ItyjFI+
         ix4mygPVlfkDBm4Il08OL6MKsmVCofIHtEkvSwXfNr5+ufZxobYFqQqA9UjwrU6Os5A9
         cln+n1zQ9+nJMkfEWSysagYdQ8Ov9DK3d4Bqzi4xZcpKkcdswZUGgdCKY4mSj/W5J5o6
         b4To1T3sduh/gpAawx373DJZ/YDOjSqCZpo6/obLRgvYs4bNpsKKG0SohpA9I4R1ghMt
         4qrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077568; x=1792682368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        b=NWSVWed9KFgjH3f2dPhgr7ler/WR0HEQl89IwDckl9+d+cZ1s+Ynesv/wAzEwOmsWw
         z1JckFWzrbl3S78krvLH285BXVhmjv/8yrEQfYeBJTzWez44hlt7lADATw4+VveaZ9nX
         iTKrhgO6Oc+5YT9JAbwrQOXV7oOjnG7GRVjXZuaZxeuhafTbymVgTBSD17Pmzju0Z4gB
         ei8/i6uN80waP5qWFOhUyFPuu9xkV2s6tILDw8uRSF5ikndj97mEekCZF0x6z66Cpcnp
         AggIQdMHKD2P5rzLu7T0c6Gcjc1AG3nbJxn41iowaDGYWAUMaKoNfEAqSoOjLQWk9QS3
         kpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077568; x=1792682368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        b=ssfF0T+pJsg7ZQgyNt6FiuzzG9CMLPt3eadpfH+MLnjn8/5SNHZMPR9pA2AVNq+Kab
         uQs2oo7ga6iW+jq+7yWkDMxk8X/6NZrW4qKDRqkLYfXEpc2e8oG2nhc+sU+TSmpKQEPW
         gONLaXo2dAB8JcGRuWcGMk3arpB+0ua9zIuAIesz7rUuC95/IpITXts7XW75p/GPXqLY
         YzjUZGhHR2LUct49kad9+6M44m3Dx3/EyHH4mAdpv42xwWAHJ4xgBXKDZYzxVz63ccTV
         /z7S6KtS0Rjnx3VMZ1yn42ps7tk4ecs6zPu0DrLGM3LTFvw3yxIYlE4HmsbgJo3hlEIs
         skNw==
X-Forwarded-Encrypted: i=1; AKwUvBzwnbO/7Yxl/9a2+grkGA9nBj5dZggJsVE0vn3z72OWRQFMWEBpbO4Z/HBk8x45mpwxjM7E5GR46vT5b3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQJOs65oNKImjJX3jaTdfe2dvNNWPjeOPbw1ycGzqKpTVzTxkT
	VZYJgJaJSQRCmcYDXF4cRqQqJMas+6OBZKd93McJGN0i8p4IW53/EXSSGmkA91usTDdMYK28fev
	M9qg8z3yY58jjXYDIoPkHE/hGvVR6UjA=
X-Gm-Gg: AYBFou3Cg2ST5H4gxyT/RqZjO6tjTsCOjNPFFN4eSX6X8MyNLRkJochYmVAlcILirgt
	c6ZjZCZjZ3aPQWAFW0PuRJGAnv6lfuYhiirOsmOJmo/8NbpcDDlwCJW+bKmuFYYTJ/3PnJ3SfZU
	kDMlATfyqYakoINrQ/f4n9CMRYLsz5OMiAYbuTg3N9qwak5/bjMM2AWewin9tV2GNGjWMc2Te9W
	Ksat5LCT1RKXrF5NHorNK2M9GLfY84JsFvoNqWO3OSFrnGS+MIIMyK80VrweHgp0kllKBW+9Z/5
	fo4SRBQBEbGynSUrGFyb4O6CELBgoieNnklUqS4wAKijwIA45B1uWoAJwQ==
X-Received: by 2002:a05:690c:698a:b0:891:c494:1a99 with SMTP id
 00721157ae682-8b07ed49b2emr78442367b3.24.1792077567764; Thu, 15 Oct 2026
 08:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de>
In-Reply-To: <87qzhrmnz3.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 23:19:16 +0800
X-Gm-Features: AclHuK876HwHtGIkGUp_g_PYTFsJH2TdNPY_O1Ztauu_w9Y_Sayq96gfdd5293s
Message-ID: <CAFRLqsUgiNEGPhfnUhTaSRjDKKo_7vc-gvyif=wyn1c2YTuRtg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

>
> The patch I submitted yesterday is such an attempt:
>   https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de
>
> Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
> latest tree.  And now I noticed that there is still a potential race,
> and fixed now.  Will resubmit v2 patch.
>
>
> thanks,
>
> Takashi

Thanks for the update. I=E2=80=99ll take a look at the v2.

Best regards,
Cen Zhang
