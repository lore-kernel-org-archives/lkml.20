Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFC4C2240
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348947; cv=pass; b=M8TI4aVe4b5+2Z7DU0P+zO3R/1erErxj6WGuMehIfYatB6jVbYLwhi/j2A/OS/wc2gKFgSh8Tumm+iH7Ozr4ukSS4u5McDyCa306N+NmdC51GM8SVBy+j9SGcVL+umEi8ky5qj8s7QRQfzb1LMpo81VWATcBP6nEthHzmdMi1ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348947; c=relaxed/simple;
	bh=vyFX1j7DijCsAY/7MwwO4APwu9RE+BzPBT/c1Ev0muQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESPcy5tb4FhDRNcO9/xD3OGoRHwGh6+02YnB8E1JNMLCy566SYxe5SXqNs/7uNYx3NC87MR30cEvgwNa1LUZyf01vDBvtaO2L6vtXgYv7352Wc4fEVOpdAwJ6HSuLCsxhbqhyUp4Ts4YnBMyfKpbD5FxN4rRNIIPX5NFlWzjfWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg0czSA4; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg0czSA4"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so636583a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348924; cv=none;
        d=google.com; s=arc-20260327;
        b=f4oxQhzPMUXUwBX5qgccnv3y9NNXfv26BmrZ3FsZ7tei3t2OBWemvmQZKOdi2JrJmg
         qcRDxqLU9l3c/9ZbH0ZXb1GREYqQGunDtsjEZuG0/Dd7oMth9D5wJHl1oiZBm1t3yZBS
         a3GHDj6oQcEE5TEowFV3XZGAgmGC6EY3/yoIcwyT9Jvd9gM98RADr0VV1ilwV3Zrztoo
         Yg4SGgeKVI65rlOiKPMSZWloDkszprTGLriDdQY6cLtt7AnUGxvtsm3ORroa2GwUp4g9
         VEh3UyP7VdBEOkKT1ojiP9B5t17C3judaB9xx9uN6eZEMQo4wVPY6gaA0HC3UJiq1JoD
         7zFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        fh=O4uSfM7CnmWxwczuURrBaNcLm67NNAlcaOy7x+3Mm9I=;
        b=CLvZcrbX5zjrADi2rt293UbUOiAP/rKHhZxv+z8KfIKgc6FzYhgy6/xK94K5T2YE57
         KEoIpOFvZ3gGafEwxXjJJ9dhVUEpgMYyqtaf70/kXou/h3UbGR5aD7uyhjOJ3TS9ZUUe
         el8i8WhNvus9qqRkqxRdOX6MNzovhatwCbJAD9IM9y0RZHMTo3PPPiNnGlAtGtsEHl8y
         GEJOhkQZHkU2VUV5NeJd7D4kYyoTd/uOSkgcpMVKXCje98M1IFed1uxAR7DnTFrB69U2
         W6op4p1dCLpDZbC+SSbnCigzqI0Bt/4hHW0dYtWWdl34Zi67mbTTNeuJNQtYaISiMk43
         QoZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348924; x=1790953724; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        b=Qg0czSA4qQVCK8LYsSi33+ottUBTR+ngsyyjD7hs5GP6jAeSQKvHzpgXoYpn9k65ma
         WFeqxqcafTRVWLd6Y4ybFeRM7bxsr4E8NazixiR1YFcTU0u6MVXmamw+npufv7n/VMhN
         PWbv3Cc6pFJ1UN8WQFva5wKrKVpyTdU1VHJjcAtdq9/ponunasIzxGcdg5pXZLL1oNeX
         gC036mSyGdSwQA2pjSLcL1jmyZ4YtDRaSqzZvqFXgLWOfBUOUJrJcqNlbxy5JbAgSaz2
         /PIS3uJVFPqzp9DZNzS5fB9a8K649yiiGqFvQV0U8X4dVHzvWor6h1tskTe4Nu2djKaz
         yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348924; x=1790953724;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=prht4RxpGxyY8/QaNwQuwo5UuI4a9fItRhn2JZ3BbMM=;
        b=MOvQr0d955Rc2v8ufsmdYgKaAihSuqpV6Ar3mh8S0Indf2AaMVLXAvWEfgJ7qmD2Go
         48pcbtO8hpt28E8HcrfFyb69hQiA15tODKA5Z8snKC+ixlux0SReOLHLq5uTlxXl7E6d
         WCoq2fS4UK+iBweVcLh7O7toJFdnTuGechqNZ4aO4p8tJz2WTqdJ9bjYVFoIHOI13M3j
         bb5GLzXapxtAt+yney/Rh8UvOK/JwjywA2q58daqoNmz9E/W9r/k51B5omPzDtR+SowP
         VX0/L4CJD/zgkqZV8FVMhWlo1c4MVpxrnrw2uhrcd/oO8cCPHpQKcLW2BfERLEPDGxGe
         gs9A==
X-Forwarded-Encrypted: i=1; AKwUvBx/UQqKQFcY6okAVR13T4rayM1p9As7boRcWRv2jw30/3qknBXD49rJRehSe7W9mOoCvWdYE+VRxu38oaI=@vger.kernel.org
X-Gm-Message-State: AFuF++mXtCD82HnoVO+6J+s+QE61k8qzwnmM00cZCGZ59GTwTtheEymE
	awYiAByX//4mvHYrLZiPiX185JhnxZ6ZTrAbqMaA7WCsHVJYxC1E/Q4NKR8UytC6PdZOGu6vs7Y
	IN2uxua/yCYW4laSHFwly2xEGiRURGIs=
X-Gm-Gg: AYBFou0bK6RWYIZqItK4yRDtAvxQRk8mNVLDG2uujidY3O5ggHJnan67bgQbGKIGlxa
	Gtd6cBWQWz4zTQuBJHlvpGjI+a8jEvmbERDz1K7h0frxko/v6+zptTnHm7L1OkJWWHJmckMRPXE
	xQ8iMWTDU3aEir0eFAHt6BB7m0lgr6JnhKe5vyl2HtTjUw+5dHGXiYkCPAJJ6eKXpzinyO/NHxC
	93tQEs4Yss0yYm13A2NqxuA7TrAsW7XqVrRqT247jxVNylt5FZ7DFQ4vfVabjiUseNVxpFtniAV
	KF/4TBu/itR2O3FOZ26uyXbfSedEJN9ybNHBEwcXsqBLeKJLv2id08DqWRy/9SAnonWhJhsQ8/v
	BGuhvdrBRa+GukFIWR8Ll734U+YAKLCHd9w==
X-Received: by 2002:a05:6830:620e:b0:7f4:bae7:b00d with SMTP id
 46e09a7af769-8177dac244amr8034887a34.0.1790348923768; Fri, 25 Sep 2026
 08:08:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 08:08:42 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 08:08:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
 <20260925003030.1077471-3-mauriziocasciano7@gmail.com> <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Fri, 25 Sep 2026 08:08:42 -0700
X-Gm-Features: AclHuK9PJSU9kqM48lGRC5SrS8qiO6GBOeVe8qPls3Qsq3dJ2is1CRYMGDcmEyk
Message-ID: <CAO7O_xg2qGhetLSuks52oVvcH=bruC5Nr5LQz2uAscBHQxPNNQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
To: bard.liao@intel.com, broonie@kernel.org, linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, perex@perex.cz, 
	tiwai@suse.com, jekhor@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bard,

The SOF topology PR was opened earlier here:

https://github.com/thesofproject/sof/pull/11129

It is assigned to the v2.15 milestone. I have now updated it for the
pending review comments, rebased it onto stable-v2.15, and resolved
the reported conflicts. GitHub currently reports it cleanly mergeable;
a fresh maintainer review and the external-contributor CI
authorization remain pending.

With Best Regards,
Maurizio Casciano

On Fri, 25 Sep 2026 14:05:57 +0000, "Liao, Bard" <bard.liao@intel.com> wrote:
> > -----Original Message-----
> > From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > Sent: Friday, September 25, 2026 8:31 AM
> > To: Mark Brown <broonie@kernel.org>; linux-sound@vger.kernel.org
> > Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Liam Girdwood
> > <liam.r.girdwood@linux.intel.com>; Peter Ujfalusi
> > <peter.ujfalusi@linux.intel.com>; Yung-Chuan Liao <yung-
> > chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> > Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; Jaroslav Kysela
> > <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Yauhen Kharuzhy
> > <jekhor@gmail.com>; linux-kernel@vger.kernel.org; Maurizio Casciano
> > <mauriziocasciano7@gmail.com>
> > Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
> >
> > The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
> > 10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
> > SST firmware and board names and the SOF topology name.
> >
> > The Intel DSP configuration selects one firmware path at probe time. SST
> > loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
> > sof-cht-rt5677.tplg through the standard firmware search path. The same
> > kernel and machine entry were boot-tested with both paths on a YB1-X91L.
> >
> > The SOF topology sources are maintained and distributed separately by the
> > SOF project.
>
> Please submit the topology PR on https://github.com/thesofproject/sof,
> too. Otherwise, there will be no topology available for the SOF.
>
> >
> > Assisted-by: LLM
> > Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > ---
> >  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
