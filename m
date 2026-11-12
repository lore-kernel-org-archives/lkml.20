Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474501;
	b=bZ9XCsqxSnqzetYf6jq0BVUB0Hrxc/rt7OSGegYNaGDwsw/59oNu/oHIgWbKEQ+XJ5jj
	 ssoW1oATM+31RU9SDdZXMnoykXCIxusgXQD+MbaAkA2bf+7wkU44h0cnlA90SiCtilwSr
	 a8ZCiOPe3JJWLCptHPcVvFuAXzCZrIwvb2t7FiDUhs0tiXyu8nKafZN34aGkbrq+Z2tTd
	 MgeFm9JCkjN34UUlX0PpoQzsTdIB/y8g766TqwOeXllXEsutnWCDkpoi9l+lLlbkYBAxC
	 6avl59VI5AlxVNFipje5WQE8277SOvzQFR+I5qcnJy6ZLzDgyJCr3bKeves0u0eKqDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
	b=R6paTJE1lxMtrVJ6fYPzGeYfdh569nntW3fi3o6KrVQXpiXxSuyHBH7iChfwQ3kVPpZQ
	 0wUO6l/WBpbK2piyzYiWlB0acZ4nt7JBjDaXfkqMA203R0uy6w2UECR3PWBHz/mO8P4si
	 PxygYQynnAFV4ClkrfD6Ca62FetWFt2iQPtGj7vyBTfbAxfGpSMvLw8cQQp0zXcVRH2aw
	 t53QsLxTlU0sSaw0wLMHkSA5g+os7twDNOAeSQWBGvpHKRaKCzjwID79JcdTNHDI/KcCK
	 f3tqgiKh/r8/bIhiAzfKeq7YMqsJDk3zGCzYW0kXlnOc/ZvDyZ/lBCENKIxOj04o9tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzu5I8Ww;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A11A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A11A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzu5I8Ww
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2885378b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474499; cv=none;
        d=google.com; s=arc-20260327;
        b=YrF0SXXOD4vvFZbeqqB5i8mXAv00RwZBq0CCnH/Pt4M4i+8iUFlPFiJMGEuh6OvJQU
         Aakx2tkQ705Ia+SEfTiOkwkdjSVg+JrDiWInD3RjtPLd142mq4sN+ryaHrC2rMS1HAEQ
         cAxdyCkUZZCRURbtX8+EQ9qvkqOWESaTb5ZuLTlumsT9rVS+7OYaorXfEPeVMJRzkZNu
         iVOpDx+TgdNP7A7WDNadihhZx9JE/nwfyPd4+560XoAUdzWA9VsEzbM6zlt10A2qs6uK
         oXAOmKmGEXt5oM8+BWCDuPvWgyW3gWpFoV7Bg0JUMXqXMnIPf9IiMB5N6gHfbWz+YP63
         9l9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        fh=Ml5hHf+tHGswH5z8rqHog1b+hkU+CJkewMIvspi3YU8=;
        b=qsZLbZ5aqHZq15bw9EQLXP929hcPEYwivJW+m1i5HZxI1IH04RGbgcAdiAgfmBaRHf
         G9ZAFklQsFacSwHl4WJ/9NNToFAgTLJp8g9uzMWnej4+ADZwB6eduocZmJ90g1hnK+Xn
         4eECpea30D9LFHFQnORdxfFsxMGTMfcKnF2zrc4A/i5uDT2SMdtpdtfTluwrQWDUPcZE
         A1hkPDmHWLp4eujrUNjmdY3zgnPeXMQBObWOMfAC//zMUy7R3ZtoXbSEUT04uZRTFi7K
         WXqmF/iEL2c2S0Z1Qnr3O+N7/JJG7MiFC/VGQnkplXeiwqYR9NiyjrNxql2wEhKE/bR8
         T9Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474499; x=1795079299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        b=Pzu5I8WwfxebKK/7XUQN1OGkBPv/e2nHjUvWDEE9+hQLs6DhWWtdjkAMW7H27UrSSp
         sWr6KGDpYyJIZ29blg7Ujn2N1YsJcaLxcUgBLPzFag0sGhsWSjq89BYyMX0WmbMUnngA
         rL6rCDxYB6ya69fULB1N2xaPouPWrxOzd/ZjbN0396jLWUP11Sybv1db6OWipkc7Z7LC
         dzWi9BxZGGAMDLmbMFTZByNkHsKBcm4XpF9/MFyuazwOd7xdzwf2DeUagIdPs2FNsCCY
         pXreL4hwbnOSxsvWacY0x1PbQ1SxZeK2G8zHhXAdsOfhJ07pNlWlnHJnOU6Tox3PlAaC
         xv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474499; x=1795079299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        b=jDpURXfXWoRGB3iGMgs04d45JxhrHpw4+R7JNWNwxHRtgSOytfTyCdSmgp43HKc8C/
         EcSfE8CSQ2+AO1xEcDmTDCDdDri4PjPZuuhHpOvwfwGdrZ8IvCH73nOqDJFqtW2OLV6k
         TdFY1aaJnRnQIXQGNp0tvd1kpZqjCI/FsQ2+JsSerOAp6oYnft9IfGr++HBlZ05rTOGn
         Yv0Dwoh4e7glEmPuD6O7w3eYlg3QNGrEcIJRbbhf5bTy4OskeTZaiUuSzaiLgJrUn5rg
         ZAcAnO7lyz9RNclTO3/UgPwoQFI/yhi36H4ta5d55sS56Qvhxqwpc7dcRA41yxNBdURM
         zF+Q==
X-Forwarded-Encrypted: i=1; AL+hErFAanquoGnP/maNUPKoPah+35qWZMnowjTlj4zwUcEjdARCiKAj2Lh0r6++bRsC9tNQ8FE/4ROl3RrY844=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LeS+ifReuaAjqMx887f922mcXzsU+v4fxS6J5Eu+a19IV4K9Q
	7puKpRA9vGTiLV14CImKB1yws7HLDoejucToz9LZEMbjoQRGGRoFLkPLVPgVaLlhMfZJbqC7414
	DeVU5c5/YM/Bj9SnUWvCP/cnqLd4HygY=
X-Gm-Gg: AYBFou0svODt0h/CdtgY1JnSYXuw4QiRFJdSYaS5kGfIETILDNNegbpWyJ7C+rGT5rW
	5wB0tRaBXZs8VRZC97CyXYHuV4aBwWGu63QuVl1qiivjNuvWLChGw/TAX7gGt1M8Xne5az+bJMO
	93OF8bVvxwG53yX6Zza1jYFaLXKdMag5Hp46c6XkJhrjNUmtS40LtTf0IuGn8g0WxODIUGgBozA
	PBSTRLuR0003hL2Aaovbn8sB1PcZqpgYQyFgxvKBHkbShTEsSt1SbKKjk1rNBtVqIDxvY+aAts0
	/u8++3bGJx//NcMpXnHuX4DFwidp/XNb2CKX/hk11l04OaDCuHONPYw8P04l6u7s2DN+lBKpsyZ
	XCQJtOFXIqE8W20w05Hf47Kp4T9cFSAyI+SC/j0ZoygSbRLNk7T7quGr/eA==
X-Received: by 2002:a05:6a00:982:b0:886:3827:c4a2 with SMTP id
 d2e1a72fcca58-8bc19503fc2mr5293685b3a.3.1794474499419; Thu, 12 Nov 2026
 01:08:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-3-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-3-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:08:03 +0800
X-Gm-Features: AclHuK8OFan-61VHpWDbQwD5GQhW_fgRO4OvBxXWkrMrWUfYeFa8VUbGfv5vQOs
Message-ID: <CAA+D8ANdJCkf1i7MUJVh7z7tk3Ka6gWZ0ynMys_Qt70ZfaN0=g@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: fsl_asrc: fix pair ownership on repeated or failed
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> hw_params() can be called again without hw_free() in between, and
> hw_free() is also called after a failed hw_params().
>
> fsl_asrc_request_pair() always takes a new pair, so a second hw_params()
> leaves the stream in two asrc->pair[] entries. Only one is released, and
> after close the other points to freed memory, which is dereferenced by
> fsl_asrc_isr() and fsl_asrc_m2m_suspend(). After a failed hw_params(),
> fsl_asrc_release_pair() releases a stale index that may belong to
> another running stream.
>
> Keep the owned pair and only update its channels when it is requested
> again, and ignore a pair the stream does not own on release.
>
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform =
drivers")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index faf348dd582d..5d97789b5c36 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -216,6 +216,8 @@ static void fsl_asrc_sel_proc(int inrate, int outrate=
,
>   * It assigns pair by the order of A->C->B because allocation of pair B,
>   * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
>   * while pair A and pair C are comparatively independent.
> + *
> + * If @pair already owns a pair, it is kept and only its channels are up=
dated.
>   */
>  static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pai=
r)
>  {
> @@ -226,6 +228,19 @@ static int fsl_asrc_request_pair(int channels, struc=
t fsl_asrc_pair *pair)
>
>         guard(spinlock_irqsave)(&asrc->lock);
>
> +       if (asrc->pair[pair->index] =3D=3D pair) {
> +               if (asrc->channel_avail + pair->channels < channels) {
> +                       dev_err(dev, "can't afford required channels: %d\=
n", channels);
> +                       return -EINVAL;
> +               }
> +
> +               asrc->channel_avail +=3D pair->channels;
> +               asrc->channel_avail -=3D channels;
> +               pair->channels =3D channels;
> +
> +               return 0;
> +       }
> +
>         for (i =3D ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
>                 if (asrc->pair[i] !=3D NULL)
>                         continue;
> @@ -257,12 +272,19 @@ static int fsl_asrc_request_pair(int channels, stru=
ct fsl_asrc_pair *pair)
>   * @pair: pair to release
>   *
>   * It clears the resource from asrc and releases the occupied channels.
> + * Nothing is done if @pair does not own a pair.
>   */
>  static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
>
> +       /* Only the owner clears its entry, so it cannot change after thi=
s check */
> +       scoped_guard(spinlock_irqsave, &asrc->lock) {
> +               if (asrc->pair[index] !=3D pair)
> +                       return;
> +       }
> +
>         /* Make sure the pair is disabled */
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_MASK(index), 0);
> --
> 2.53.0
>
