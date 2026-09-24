Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714F485505
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276545; cv=none; b=blRLsjozMAKeZTsHO6xULWmK47IKq9k9XpRTW72Q34443Qn837wPqEwg+dS5Q6oggY9fRDqzodlv85YE8pLd68QvN5NSRwlzf/LAi3jwUo1W9Z4O6iJvh9ToX0QOmrhQkLlUID3GHzhNFpiu/YwOGDchlEyjJgByI+8BLNx4P+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276545; c=relaxed/simple;
	bh=I9rjMdylwRXMbZI50fmpd3PtoFlN+qirBSdlSQ+FEgg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qgQ2OaB+9NXajb0k9Tu8Tz+IS9UT7OuLBk9m5iL1kbSHWi898CFFsFXIkCcBeVuuVRGxTOzNSo2wouJZIIpg09PrackXksnYj6Op/UeD3IOV+1cR2CIBUB4BLJmgw1HP8Q8om2N+r4qUI1YwNiWstc5Hty/U9Pjctf67yPy0RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ARqz6Czv; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ARqz6Czv"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so163511241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1790276536; x=1790881336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWQWTkpRc4mjMwr+vW7xfwNCAyBMZNGtR2Jki2MQhHc=;
        b=ARqz6CzvBJHEdx5GkyMPwb5HgkwVuHhCUBU2C4uKpjxxodRk9ko6nIfHGSoXOzCRe3
         3MWjHj9npWLFN02JRMwOSymEe9gPdj5FvEX8mSu/Swo2h5hnlK21UPtKlo/Fvo+SN8SN
         U1cYlmfV7ULFXk38xNY3Mkmo0OwcRG7XDseg9qPiOg2+Cl4Iz86tB245zwvYBL49e+Dr
         BdN874tZ2dadCH98HCAjHI7qwAriRqXUT+8ZNmS+NqlutvdvLfBpMLCynOtjrMzZz4+M
         Ky/mxdiIvrX3rFXZwlWC5qrJkeadad3vjtj6uLFQ7MaS/uhNUUbXh5wK/0kNioOb/myG
         +OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276536; x=1790881336;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWQWTkpRc4mjMwr+vW7xfwNCAyBMZNGtR2Jki2MQhHc=;
        b=PNCvdlqZg4+xffo3dz7K/dRd++16cY7+ZKzWNZtnguYntxGV6HsNPNy/Nx6BqAL1uT
         1geknMVD1bSLm2C3Z7vdcHNVWdJimvyNMhshqVJXUyBLpIJ4kzQLfrs1HFvpVAft/t6Q
         UTYG8BOAdg3oJtCiadUrPgNoua+pluf9m6j5HytcwM/I4nd+QPogQ2sS8Kuh1PCi4Z67
         6MqznWrQIQa44K+6HqXIYQKbd3jhJlB6ZObca9BtyqN1CGodySRE95eey/oJ69MnMP6Q
         CyJCDrICBxl0QzDBvqF9FA3e6QIGlKRu481VNTkud97OCofwR28bWA9TkHFBVus55zYV
         dgLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgGTgpUq6QY7Th2NE1BzyohryMsvreGzY1Tshh9KyPB4/3Mf8yERQq/kj+3ZWTclBC8UsMm8TMmnn/Nv4=@vger.kernel.org
X-Gm-Message-State: AFuF++kxqEEdUTWK9PwZJSxzxOLhhPDFycoBN5asUdSDeAy+cmh7GCYe
	XLUWXGQKlWwLj+taWrd0j/8/8DrNL1mA0QnnnLcomnfyqB7ifS3PBn2SCjJ5KkN9N6I9I2tYzCu
	vsy0o
X-Gm-Gg: AYBFou2FGbhVQM6y9OlY/0QHh5imEZujM36zwH+t9GcPO92PeXmSqB1K0Igl84n/b+G
	aZ6lQKOmCJHF1PABkebcHp4222qGleCt/50wLsY5B5OBKjoUJ144RP0hUVv1gqB95rntOtQBeiy
	CHNKdHK3O5h61Nm1p2AjW63H3yf6pe9Q9YqKnuytIbsVn5L6kA02C+TcQQL+LX3fgkPAFt4aCg4
	uUoIisnAIlhxSrupz59QsHqdXfKBeZaO3lOWeO4X9uWQjqoYqKMMMcGiZlfOKYHQfrilnuEpjzU
	STHGSEl0y/2byLHdah+aS5xjVnVhgOBVR3ky4Y3zPBZ+TctD6iyFU6/ESCsBScxXYDRZb/hbjS0
	ECCPzrT58A9QdCAvXsFw/Q2XGuExCm8HGTNomiKzmMMyMJHr3SyLb8jJHIc1xThlxxYOYZXUCgQ
	eo4ZrbWOWGFleC7jvSmJN262u+zMQ1r2wN/q8YqofkFirdEwcVmJMvBO61+sHn7SF6D1Bq7Sq/V
	hAUvZeR5KFakTPkSiYpo8bbO0lT4UK9FNNJWR8EH8yy
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr1958653137.7.1790276535690;
        Thu, 24 Sep 2026 12:02:15 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851e8c4f2csm5199683241.10.2026.09.24.12.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 12:02:15 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Liviu Nicoara <lnicoara@thinkoid.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924125940.22665-1-lnicoara@thinkoid.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
Date: Thu, 24 Sep 2026 14:57:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260924125940.22665-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

this is just papering over the real problem, which would be the regmap 
cache being out of sync with the HW registers. there's no requirement 
that the volume register be written after the int/path clock enable

(fwiw, this problem doesn't reproduce on my setup, where this driver 
does not autosuspend and the regmap doesn't go into cache-only mode)

On 9/24/26 8:59 AM, Liviu Nicoara wrote:
> Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
> gain read/write sequence") removed the read and write of the digital
> volume register in wsa_macro_enable_interpolator(), on the grounds that
> writing back the value just read does nothing. The comment above it,
> "apply gain after int clk is enabled", was left in place.
> 
> On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
> macros) the write does something: a volume change made while the path
> is idle does not take effect when playback starts. Lowering the digital
> volume from 81 to 63 with nothing playing, then playing a test tone,
> gave about the same level as before the change. With the rewrite
> restored, lowering it from 81 to 69 while idle played audibly quieter,
> and restoring 81 while idle brought the level back. Changes made during
> playback take effect with or without the rewrite.
> 
> This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
> lpass-wsa-macro: fix compander volume hack"): "the volume registers
> still need to be written after enabling clocks in order for any prior
> updates to take effect." The value read comes from the register cache,
> so the write pushes the last requested volume to the hardware once its
> clock runs.
> 
> Restore the rewrite in the interpolator's POST_PMU event only. The mix
> path event removed later in the same series is not brought back.
> 
> Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---
> 
> Notes:
>      Tested on v7.2.6 on the machine above, by listening. This function is
>      unchanged between v7.2 and for-next; the driver's clocks moved to the
>      PM clock framework in cd054a6e272c after v7.2, which was not tested
>      here. Build-tested on broonie/for-next (arm64 defconfig).
> 
>   sound/soc/codecs/lpass-wsa-macro.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 4242366601a5..899c8bee4645 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1849,6 +1849,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					 int event)
>   {
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	unsigned int gain;
>   	u16 gain_reg;
>   	u16 reg;
>   	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> @@ -1890,6 +1891,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
>   		}
> +		gain = snd_soc_component_read(component, gain_reg);
> +		snd_soc_component_write(component, gain_reg, gain);
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
>   		break;
> 
