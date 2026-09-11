Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2F45C6E4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113587; cv=pass; b=ciz/+zcjKknkh5B31iQlxU0+XruUcdU5Bc3Bhirxd4a30/d1rZgDubbhknEMcznNFhjR7THglMMZW0xBfzP0C4KXuLuFPHzs2SjD+xv6mqjcZMCx1meioQEcDIuRAEPeQJfORwaoCVrS74JHnlJKhWA9BfUZio7tMayMKexo9ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113587; c=relaxed/simple;
	bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtakvcmRzq5nPAsYaI8CsxMpytu+cc8UEahZqTpoBd6BjbftrTQc/Orhn3coNTdgRHWY4d9EwP+3gaw9o2dvOfXgvvfCsiuKrni2OilTZc66CzG9Uk5vVG1KI/nnopyi28lBkTHMEtLTTL4Okmic7bnbyOikrPw+imHVRwGNQcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYm2gyA7; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYm2gyA7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d91ff7d9acso4757095ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789113585; cv=none;
        d=google.com; s=arc-20260327;
        b=Vhy4kPP+zyjIaBwMh4rCYEh6ZMDf7yIsaEebzkWA5ACW7IGrTZvAvI8j6+95dTkTRL
         gWZ68QiZYLzzwclL7FW3LNGrZfiRZ17INgH8YMRlOLOZeINA8K7vzUT+EldsJuq1bh03
         5R6JusZBqXo8HsWF9nTamY0Pl1p7O5kW4CDSjPUZjy/ay5b3gIuHQbo+F6C/KJVd/0ft
         CDSg5UqJ9WYGCp8sy0a8IOW+xhlseWEs2Yt+36Kmpepz8wFlYxTzjQqQ4BTTWQ586oDH
         QFCLybNFwSqJW1ks8gfNqywiHH/kEd2+ievwHcji+hVy40GFmOr9ylJl2OBEmk11a/r5
         OoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        fh=W4D29/sixweQPwZ/MLdYYtmukm3vjTsPShWj3uzsrF4=;
        b=iwbkblB36ZgyAI1Rirzx8059uroRBzHtL68f0VHqfYD7UCyMQVhjxGPmSsFl2hab8z
         4w80pbUGWjkTKBRvsMfzu4ELZ/jg3wuzV6/t71iALLU5tdKHO3x/xf1ZT/gzakSalZ0r
         r6ksm2KBs6SUo2RkD/koacrDxpbTjGGvnZx67b05nr6CLJpimAUtHSN1BeSIBtLoO+2E
         Twxb3ITSr5r5EtUjOOfW3PwOeCTns4BE/5DaN/ZSl7oH1VixRKwhw9kvn6vIrvno3tiJ
         GsnDA/PWeD4BOnJWDL1DEgCo2pUmLestbcx2Jjpeue2WfTWs+Hy7yXYyrH10xKcKQFfz
         xJyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789113585; x=1789718385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=PYm2gyA7Ej6+cFMrGoWhgez2LwX7YS1fFoi/eUc898ZMihGfaXWaLVb9nECUSeQE01
         axlxdwk78hOZDZxhBwc4Jylgmnh2k7Ntewp1rbqKsDgVRTPYxT6d8pBiu8z+CqlOFS7t
         n654Q5QrbqrfjO7JWLsajpol2LrCpNQljUW8nM+BeCyOWt/v0rX+lqp0LOzgrVTmGip7
         jyuR12xRu0IQAJy6cNzUJUfttbo8MD5dVQNaAmorFESPqTREoMYxxFT8TGnhf0dWQfFB
         7F5IIGcW0gvuRtJxeNTpkKllDS6YJCHEAF57VMPkDxwyex8DMk/3OriM8EiHL3fh/eoh
         P9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113585; x=1789718385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=QxG+ufyDzibhpxK6sV8qaPM3cSn+DFpnmASrBmyLD2if61E0WvfXy3EEhBtYZ6frV8
         fXGPhbhGUkvx7Ll+i9+DSE6pJyO4iZyw5Jepq8YLmI8poJP9pEsMOcKjqdavz3t00PzC
         pVua8mzKduAQLFehIm89wuXf3NMfBtnT7kCMlj3/qyQlOgfZF6kp9OVr4zRlvoMpNtWX
         fgX6+Pmt3kzyLZHE81+qqKHrM6xkZ2Oj8b+JrpcNcE37M3fODNy25CvtgAyJ/7727cDG
         odRsV9tJ1e4w1QFnTijz5MOkk8rfcxGat0pgzgvW1e1xlXXRbRuT4dxSRl4iEtNSngxq
         FDPA==
X-Forwarded-Encrypted: i=1; AKwUvBwPZIOSUeajz58WGcLtG5dRXZsQoQvqWU4rxOCJSEeuAvCHzjnK4XPPICHHhj2R5AFjLapVUGF/kADNnsY=@vger.kernel.org
X-Gm-Message-State: AFuF++kU150Ps1TFtlA1b4af7w5quEZP2h2CrJr9q2M8d2Ps8Nx4dxdn
	wZhMb9/fUVa5MOtf4qjzeFG3NATG5fFkDuHAD3Mkjx34ys0Hz5ArY1podK4RIXOZpU2bOSLOoBK
	hBh7mphzWx0Ln/7/cYrQRpoL78WghM1k=
X-Gm-Gg: AYBFou1jmwjpinVzA/OGhQLaIdUnoVBZZHodBDaaI17H7L1VJqzryEfdqi7mVqiKbpT
	aqwHhcAZm/gPT3q3N2lOx0dTqmIm0xuRF5VOiPMKovZB5t+sCWwBfSpMg1MtOGufcfOtYmz2E7h
	hwhfnQlN/yeAgBIhztvdCSEVhTUJA00ebu35TdoVmBLbMdY/UEhoWNH/GGhRok0qA1/z5zQVydD
	+ddGd3WSit7+kD0ph5tQD8joQkNYMDfvemQbdNfjhnxWhkEx0d2MhTVhgSTd6CZPJ8IcV3i3axN
	bP1s1eMG96lWu2ohl83YyMY26CPLZez0jmaAcPnRUEKb01xQurq9825Z362m59hNGT4m4WCkvc3
	5yxluImEMtEN/rpsVorzKPtqi3RKlv+hpQJSrgGaOGQI2iJ6h6dV0tntIh1KTEHsZNMAlr6D5o+
	6hbw==
X-Received: by 2002:a17:903:32ca:b0:2d6:f6ba:263d with SMTP id
 d9443c01a7336-2dd300d2dcamr38221965ad.7.1789113584990; Fri, 11 Sep 2026
 00:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com> <aqKxadkfX9Tqx8JR@stanley.mountain>
In-Reply-To: <aqKxadkfX9Tqx8JR@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:59:33 +0700
X-Gm-Features: AcwNN1Wl0GTh-Z2Qm9Mk1VLPm1ruxloX7-jtdmf-ROLjbwYmLn7UVqKFYyP_TdY
Message-ID: <CAABR9nHCK4X5iZORmHkN_jH62e34H2J_rBLiWLkwcg+5JAJJVg@mail.gmail.com>
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,


>
> Better to name it err_clear_mux_setting or something.
>

Thanks for pointing this out, I'll rename the labels accordingly.

>
> Since you can't test it, it's a bit risky to start caring about
> errors.
>

Fair point =E2=80=94 though ignoring all errors isn't ideal either.

Best regards,
Phuc
