Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558571;
	b=E+D9pq36HjH/WmRFV4KgG74mc492wxtDwQ/Q4n4ouiLvkEjxsqE1i33nz5iUdojzmdZs
	 lT2mAg50fE1aJW0OFWtQEHy6vj/Z9H6jv1R6Z46LzWL5NHgs0yhxH9e5YU0C7gKWSkF+n
	 kNiy7C8aITYCRoKH9bkaPkFoYIM571gKRG80c59fP71yGAViibaT4jGxTuLyobxh9oIO4
	 1XR64P0KSjkNkWAXHxaiP74+gtq4IiFg/OnLeWXeUFqcK+ot1GbbyyK28whl1z6auizG2
	 IoyAdI3JNpkhzzw26qM2NO0rObplnqmBl6dXXXk82zr3ZlcLS2ZME8C35mlnlSf/6CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
	b=nTusPR6K1i4a/FULArkGEODv+6yIVnlXP2lvE+NoDFN9KeF8p0YPVdAtHFzviFtIMsN4
	 qneBJ/tuzG8OxBOwCObuEfGZ5S7RRlYmZYSHZGK7e7tOEOA5qdTU+HtHXjVhdjfjD9HRC
	 V3IJtasVpatgNhtN7Vn6wlFuNgXqtsR1gGlLttFu93ZtoHpdZC+g+m/zIg1h43ziiKGfo
	 9YB+zcAXbVK7V0/1SuTIWAGKjoTcReWyovCUmLlTL1Dna6dXMDPX3cV3ftUSBaOMfDu6t
	 Xxu/aVIik3ut8OHG8YkWOca+LcsdTDhxZ30b5n6mMd0lffjszCwpIeZV26M8xdBEN3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anJkfSbj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B8A60A3813
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B8A60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anJkfSbj
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f2b826fe9so3705126d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558570; cv=none;
        d=google.com; s=arc-20260327;
        b=mNeE7HThsQaD43XD5A0S2wErMbemsvF1qcnq6puFq4SyjwHBcfTfygnZRvNiDUdt4h
         Mxjyu5WCW/V7U3sKn2HC9rZEWM0EWQX9o3b8ce5MLENKHOt9ciQgZc4s9yPEBzgD8gct
         WwoHvV+PHDWhvdRbgh9y8Kbe2/VfgBuUiun7osLNmx0btUlYJF7Rd/OzUPnYEbSiQTts
         5eFkvNm1s13v4lV3bfUqGkwPfvWwC+6G9NPaZPQFWZpHjNwiORBCvQshz48BSlUXznI+
         BGsNb9dyCqu6ib+f/tcY3n7fIPSiCYlF7f9RXV6TehJ30/1+D5BokqMBEF8zeQjXJn0b
         GlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        fh=udlsnKaMWna0pL12g1FsfksqE0z7In23Xd+fuexAnGs=;
        b=Z7KnkQEptvaHXLR7NyLOduzfTVqjSmP9guy8DZ2LEDNF76TfqpGso16JsXIhFRMw+9
         UbWPZpZA1fVTlahEDEM7OG3eu5aNlV/SOKYmc2oEFYalnm7yGbufueg5gug/dpmmTxWB
         Hr9KSrjbP3fdCCEAy+x1wsC3X1dPfajLLIc3opK0kvqFjQHp+van4rhuuAZQFN7Q6/fU
         zMNeW3poSKQRxaCy8Qyxu/U8GotyxzwLM1DSBMppRU+dlg4EQ0YjzB4jncec4I540LQe
         QdPzcgCbXRfE0oZFixDDviFQ6hKpLVLGUIQy5VTfhen/pxtUXxxnLHtz3DZANgoPD4yq
         cbKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558570; x=1795163370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        b=anJkfSbjYUXwP6C6W1cjkNevxRSKt+cHELYHE8aFEe9stpNFmIUMD0ZgyHtdZwzMec
         zc4/ZOAOhHNEjEYMueE1Df1xJEh2wtTOkKpCSK/nOVWQBhxf2wU6csV9ufWeXeo4Jcag
         Wp7s84Zh18VmVtIR8IMhatLzPyFIuFAAetuuzRPx4Rn5l858fzaHo5sZgglcsfkJile+
         OamVnOVDyGn8E4oXkV6F+6/ljjJbao+CHtkPk/jM2k/4TGKvc+kzlgMlR+ubJWqX+Is+
         2JQCV1otEY80zeU0+c65aR/UJ/O0o/liBXnukGW5yfVtsnthYEnEuIy9CltG3q2zffip
         NonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558570; x=1795163370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        b=zF2TwjhhL1TOmLcze5mVIUkXzqTxnoqsCi33wSsdufLpBqBj7oKcYIApJq/kGNE8w0
         NYnc2FJkKlfWfCHtfg127GU7boDIDYzZdvKwSUfN022pn9OtRAPXFAk0EzoPECGX7eOX
         A9xHe92csfWtUwQdVQV1ICrJNjAxkYm1nP+N0sM+MPQ/aW4OcoRSOnxnmGPQX1NbEYxx
         vnBs/ga3fDTO4AZoXtEt1s23A+nBgol3HqMJXaFf8evA5wqglYH5+ngxT0+GBDxiZdmQ
         0RB65o9QCuBFDCZpx/CQ9vyKCaYXSBq+g9W6vuB6dN5M8BuRDuRuZxnDNvznPvsek5WO
         4UiA==
X-Forwarded-Encrypted: i=1; AL+hErFDob7tRTVQPLqkjf5XzaNHdo+YXsHBVoDWjNG+v2iwdmE5K2ut8HxYEo4tc6tNNHPn8DYGXdHI150JNy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+roFS7mXUKGYkRYJoskEPAG13ucFiEN6gxnbyXIwCBkSrABNFP
	41glmytwL+qSzafIjUE42x0Yy8tuwtj80k6WDS+TUeX18bwR7XrVfE+nQamjXzxor+1AOVycl2S
	xfECmGcF0HRToOcGKkAG3lutt4wdCECM=
X-Gm-Gg: AYBFou1LYTIbWPAv1BGWUrVEIyMi8xbW2lrYZwQ6eQyZ0FPo4aO1qkkLlbBNNiIwICI
	yQH6TFC7d0dEQvnZEGPRs+XHL33qr9uhNai7SdjlujnigM/fF9kJR/VuKLAFflTTP4QbgBZd4/8
	hiBpP61EgtT2bEhx92RG5ent2OXkmy5Ho1rkQxaWaIAJBHaIpCJQQu2k8Vc0Ty5Mhk2dXiD3Dt1
	XfT87oyNB/50JM8Is9dvzX35tVYAM4JhXeroahhuAx+ib0++TMkqKEpAmkviKcapFt1zP7Z1QDp
	sOmWcKODx9OMEoimeFxrmd7jyu0rb94deidtLebhTmA8JQXueDRLtcY8/deScKM+bEC9Dh+nE0r
	ocw7iTok8DM+0z2xDQmPomUK9iOkQu+xCaavwBdntGd2ZS8tf4M/iXBaClQ==
X-Received: by 2002:a05:6214:c6f:b0:91c:133d:4916 with SMTP id
 6a1803df08f44-91f24258d3bmr27365136d6.57.1794558570089; Fri, 13 Nov 2026
 00:29:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112175624.40547-1-gonsolo@gmail.com>
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 13 Nov 2026 19:29:18 +1100
X-Gm-Features: AclHuK_22IBl1HM0EmP8TqULn6mARyFVsz-pBtAjutczCKWrwrUzs-czsdinmNg
Message-ID: <CAGRGNgVXgWeFVkTcFxYvGg-DOEsmpPQZ+atEF0fq4m=F+BHWjw@mail.gmail.com>
Subject: Re: [PATCH RFC wireless-next 0/3] wifi: b43: core revision 40 and 42
 MAC setup (series 2/4)
To: Andreas Wendleder <gonsolo@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	b43-dev@lists.infradead.org, Michael Buesch <m@bues.ch>, 
	Alessio Ferri <alessio.ferri@mythread.it>, kvalo@kernel.org, jpeisach@ubuntu.com, 
	rosenp@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Why am I being CC'd on these patches? I've never maintained or done
any significant review of patches for this driver, have barely been
active on this list in years, and am unsubscribed.

Could you please fix whatever script you're using that is spitting out
my email address? (Also Kalle Valo hasn't been working in the Linux
wireless space for a long time either)

Thanks,

Julian Calaby

On Fri, Nov 13, 2026 at 4:56=E2=80=AFAM Andreas Wendleder <gonsolo@gmail.co=
m> wrote:
>
> MAC core support for the BCM4352/BCM4360 core revisions 40 and 42. Things
> that depend on the core revision are gated on it (b43_is_ac_core()),
> things that depend on the microcode layout are gated on the microcode
> revision (b43_ucode_is_ac(), revision 784 and above, set once the
> microcode is loaded). The TX and RX formats and the PHY are not in this
> series. Based on series 1/4.
>
> This is posted as RFC so that people with these chips can use and test
> it now; b43 is orphaned and nobody is set to take these patches at the
> moment. Series 1/4 is on the list:
> https://lore.kernel.org/linux-wireless/20261014143225.82149-1-gonsolo@gma=
il.com/
>
> Where the values come from: the register sequences and table contents wer=
e
> taken from Broadcom's wl driver running on this MacBook, by tracing its
> register accesses (bpftrace on wl's MMIO accessors), and reduced to what
> the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
> init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
> Farrow resampler formula, the VHT fields of the TX descriptor, register
> and table names), and some formats follow brcmsmac.
> The result was tested on the hardware as described below.
>
> Each patch compiles on its own (kernel 7.2.10 headers). The four series
> together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 4=
2,
> microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC =
PHY
> only comes with series 4, so the earlier series cannot be exercised on th=
is
> hardware alone.
>
> Andreas Wendleder (3):
>   wifi: b43: set the DMA burst and prefetch bits of core revisions 40
>     and 42
>   wifi: b43: MAC core setup for core revisions 40 and 42
>   wifi: b43: address match table, templates and beacons for the AC
>     microcode
>
>  drivers/net/wireless/broadcom/b43/b43.h  |  14 ++
>  drivers/net/wireless/broadcom/b43/dma.c  |   4 +
>  drivers/net/wireless/broadcom/b43/dma.h  |   2 +
>  drivers/net/wireless/broadcom/b43/main.c | 242 +++++++++++++++++++++--
>  4 files changed, 246 insertions(+), 16 deletions(-)
>


--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
