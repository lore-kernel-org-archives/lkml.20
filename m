Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43A534479
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889104; cv=pass; b=Dq1/RZBktga5sABp1/2Ml6g/60sv9xK2YUtdvd3yZXEHtL69o9s2j0+nxeIsJOA483lk40h68njY8DiCsf1i0rvOsJ0NdC+THgyKFJ4twhzs3hCTClcsnqHRgwBpU0I1RuBd9i+33bOoDjP2FNORUz3Za39bIx9O9KNTqZatFkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889104; c=relaxed/simple;
	bh=Ik+DBM21R/jxw2hg5gwTR0MP605oy9En+2UQnCx6kfM=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7NxXePBpatDqV4fW5RkNkdwUecdciCVXf5zWSy9F3ot1G9o8dURMpflCDqqi6aREDQfNoiztkqGRZEejS6BPx1fu8sxlwEvIm5F4ET8m79hh0mtNfzWWL+FufY156o58Ypm9L8+ixjy1IZp8/AgbxlkQ8Zg3eb9JvhZj1wTWRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZf0oQes; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZf0oQes"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-8177a7fc354so3661068a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790889101; cv=none;
        d=google.com; s=arc-20260327;
        b=CipAmYQGkAZ4iCYmLSXwCtnN+OcHYMFOpl1kfk8VdZtWn1w9C4A45kXkCy0LgY68Ro
         oKv0Xa4gZ1hPtiqlfCu4lipGpn7uxEb9U9Yjm8LWHvDJFJBQnsC/xB51sPKVqr5I/v8U
         aEBskkq6OUJ54yRdiksA9x45hvpL8w7+ycuEwiHxT2kR6tEyNHDUKLn0VN5jOSH67Brd
         uaTzJXQ2TaMUvmQl725H0cZo4324VRJNjWeipCysXJKuSKRdi7UQYGsgsNXgD5swrK9F
         2vf/vCu5S61cLm3GdyDrzbk++bWf2GK7GEE0E1IDPeAKBAJnvJWaOm4N1DxDMLoJ/j0f
         +Z7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        fh=KUMx5f/VwtZTy4R99Dx15+9+qTL8SXNJRw+6uQFzJcQ=;
        b=VpxWMhbZM7aLGUGOBowD42k+42hYIWZiEFXo1HPA8v82C/boZj7JGdTRQO+yStFI/m
         YGEtu9uFQNNrLf4U7eOLuG6K8P3EbDvAggh9dIju10I7MgYdtT/C2br5LygNhmO5TydV
         OLOYQ8zLm6IyVDM+7qewCS0OprkRl6B1DJjuwDiz19bSQemFPR5tOPZRmnandZ/qM2ye
         DIgm3TtdIqctV7GCDkOAQFjuVJmRCp3P++q3FIGSxeFhOP8ayMSZa8haiIH4MhGZG/2x
         E1enneG6YVOaPxmnzM1lGftOOGXiuKGhGz+GqYstMc4CMRg0tGpqTjd6TY6BHv8kckDc
         ecDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790889101; x=1791493901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        b=VZf0oQesTgl69AMD6qkXGbjt+xJiF8eZGFOwCPZlJTfrGp1G+2akOMgJXPBOjJCNAG
         2xWNQEZwYOn1QBUrCQL/5+HD0AquYhAKAbE3mTKOVrE+2Ux3hQ/kOtKF0i8iN5M3U9/I
         C5AKdf8p0UwjqL3xebrldKTTBHTa2zc2ftd6VFMABKg2qoWHP0T0U+NL9b4z/SNgDIg9
         Ay1TI7S//TkzQ7cQv8nq636cufoyO1SRCXIr5yGb21Lre0zszERSbaSvTjYCSeBY9dli
         MyA5jKVjIuMcDPKLXZIjKtSYb3YX/owkA5jUZWMycaRyHu/U4zRD7Uo8UFQOrqSLqmfV
         ZPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889101; x=1791493901;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        b=TQKd4y08VfDTB/2Ivp13Tw0Mr70wJq+YLPutvWj2ecPxQWD3YxBlWy8lAjz9iGjzvK
         GOdRfu2W0CTZj4fsjo0Yr3ORbpk0bag02DWUGLA4Sx0YiOyJUKgPpcq4JFFA1mVEE36t
         0quICM6id9nRomtSm3LGgOBhcwfyR7h7rSiRfQ06GAIsiiwupMsAumblrr2kBUWxYvad
         t6qHs7vl0PlB/j8erdsp+0aUluZHTBzfsgqk4dvexk5n6O4h9Ywv/b7l6d0qw1od5W84
         EfEsaMHM8NRNZHY3Vl4USk0AyFkffEnR1wLu0IeRi0AVkvOhH4coCXWpaepL5G9HM3tK
         7uGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0Br/jaaeuRFWg5NbkFZY3hstTDKaMYUAv9ByBwEEn5gPa+7lK4CZZN7dyMIBQvg8RQDzzvw3dpkoYoPU=@vger.kernel.org
X-Gm-Message-State: AFuF++mhPTwJ+T9++ykMqgHLQ+pdx02+9FmWxGvmX2avrHMjjNWCnHhC
	dXjrzLw1ekLGif0J6U3QF3QVvBoOvrAWsU+XmXCZLQ0iIwtAVLLqZoYfHnTamJ+kbHr6OskQJ98
	EKWtjhL+iO0EevbY5fpOpFEZu5cjpa14=
X-Gm-Gg: AYBFou1TPdPvA18zB/2OULcdvaMbZmDyfaCLBKO5h73wuxTLpOM92sVQLTRGkReFuKm
	PVWH+tcQlvN0dne/n9lm6SnfIuqnUxi6t0Lmb5e8Wf6qaASKQFwKK6x+esWvLAWAv45pxnQTc7y
	NExCtLFsSB6qERZzbEiQQrdF+snOV9QH5+uEkXxlKx6qFSxe3OCu9d87h4wxaYaemSrSpH+I/2R
	n3Pko3WdaXliptBAotHBuhCj5V71bhAgfkYg7GvcM77jt7pR8aYpsVafU19ZpJNncBgiDtG4rLF
	EVyk84pHE30Z3nlkxV0Zj3wyltOmlCYnhDQ/iCyo5lfWQdMw1Glu+oyy6quag/taGNW1rBrQ1p0
	7W/A0Sau/gl/syx1/OWCpWynBTOByBkqf
X-Received: by 2002:a05:6820:1787:b0:6b7:46e9:970d with SMTP id
 006d021491bc7-6df34d68bf8mr574186eaf.61.1790889100787; Thu, 01 Oct 2026
 14:11:40 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 17:11:40 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 17:11:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
 <20260925003030.1077471-3-mauriziocasciano7@gmail.com> <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
Date: Thu, 1 Oct 2026 17:11:40 -0400
X-Gm-Features: AclHuK9Z9xOsdb809jMX0x6_UphEwJuuq2Ji_72Tc7ViJlwAlS411GWAZxH8rw0
Message-ID: <CAO7O_xiEx85cDEqF4e76Hy+J8e9jsBUaoY8G_We_JFcf4kFBBQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
To: bard.liao@intel.com, broonie@kernel.org, linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, perex@perex.cz, 
	tiwai@suse.com, jekhor@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bard, all,

The SOF topology pull request has been merged into the stable-v2.15
branch and is scheduled for SOF v2.15:

https://github.com/thesofproject/sof/pull/11129

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
