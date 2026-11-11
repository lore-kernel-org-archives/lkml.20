Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364016;
	b=31bAeV9qwyVlz0tn273M03hi/rup6zf3mr/oEydEn4XI54MsvEUo3ue2pLXeRBuBc2DX
	 6aUJW1QAK8NpJtLbjvPmI0lTeEX4DLp16rwQqROg2MvMpVhRjogko9daE2YGHtFJA66f+
	 SY61nsF5UeJMHCAyTzX5xjxEwsVOUcoJ24NvnMcM9J4XRRBBzmPyVQ1y7nad0MRNU5+Tf
	 6ugagC58gP/7ar6LG8FxXa9W6cGpJugCXWvrWgbqUjR4kka2QProSbXrEX2mNsre6LDh8
	 r0+09b9pv/LiPGn2PlcMDqubKmYCa5G4/z38J6fFsg+Y2MtAq+EqSuwYm1meM1ogxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
	b=KQf1QbzTG9GVosi8745uStpC+2GlL6qpRzBozI7JmOa/hlokl7nWNBbKV02t2eiBYyNE
	 /wPDm3z03f1EF4a1GnQUd6R72PQF/RIbaIuGC05hkic7b3SuWfrY17ga9KqqXF+kWXQLK
	 pHZqIVMRHrBa8OqAdwTbgVaMtUoFyYEYGgE6rJl3TVTpjzDs1so/y4Pz0EqZoLIBNGm47
	 gSyxh/BKgjnbt2tAlEzqsuNovEY6kVdwy2f0q7TJFi/8/NbG0o8YNvIamx2eP0yr70WqL
	 5SDu79k3Nz4925DEcuM4jPN1+Ul9PIQLIkLhWdvs/tfKq5LZ19qkMoDeJTdBfogbw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pEbO+iE/";
	arc=none smtp.remote-ip=74.125.231.201
Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEbO+iE/
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-4f61e12e8e0so506488b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364015; x=1794968815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=pEbO+iE/MPg2zDij7Aje1g8wdN1YhFm7/BcmNNly+swHyJy22M3wDi6VoKS1P4CbOB
         2U/tzXhLQCQri98JFfW1VMGVLqmPefWFr0duquAf6kcwzMdIUJJwLJwhaJJO/zbmSFHB
         POO1mOgkMzPOrO5p+hoNaSTyMsvjnIHQb/fU7LLC3nr+1uz1RMf/j85gwHXxkmhDOcPK
         JmIXmxi/9mErtsSJ/7xlexfCeGRB9DG1yX3cztwH5QagzHP/A40dku03l3hv09pguhZV
         MpE0LfcChFyFvSww/eGoRZdzf+1VOVmTkz9F4LZqkKdFXTjxhXhLk+BMBd6hy7mqYxyp
         oR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364015; x=1794968815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7F3TwUQ6dGzsMiU+yMtMue/xeRnuQuD+BhRm+g4jhU=;
        b=ez68JxAoTu9Wwm5HmwHnoW6hokwnxwh4DYn8ShVw9rawlb1GR5BgYP/FrOhxmSMPW7
         vGMNt8NDf4p30zoAF5BQc9L7pV/kNeM+r1+TWT1B9oT23r/Bvf3CCBbGLqyYx5qDokzi
         HeJldQF9SgyH7KD+2BusFC6pQ6FzSrSmgCogVvV1ynoh/VYqVi0V1eqXpesJ1qRXJdQv
         fP8Q4OStFwhYp/heQs6SrRa+bRs+/XksH0u0X1BcC4meBapGpPcI1uHYB0CwLeRyiOYU
         sffOmwLSXJhwMozkJ8UD9ZY2ffvd/UUYB380aGXpHLHdjHXMHKpxyhTEuwDhIVeK2mnn
         WKZw==
X-Forwarded-Encrypted: i=1; AL+hErGHuyWlk0F6PFeutklOfBJ7bQ8xfmIjQWJcnm3lSTyV2TSVQM4jThkRH9LZPf9JxX2TnSe9l8iQRKO5rIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vxG9KXc9axl7W1DcEDKOk1dcu456fWMIXqMU/YchN6QP91gO9
	f+FBiSoLtYcSceAdYai9GWvQ8Uio9kqYOB0F+03eptXC4RuZjfWfqPW3OIduvt92aqRUOQ==
X-Gm-Gg: AYBFou2mIGIIjitka99JON+/YIIQE3iwwPDV3aexCA+tAnGZnK5LQ37XpVIjzU+yUrS
	byKESZSf1EEVPcjnSFOyGR5xP5RQcGtAjzvQ6a57pEOY7EJGkT0vLr1t5IdFlBYxXgMMxQ4Q3CA
	b1J6xVQTHp9yYFZLyhLSc4+2kH5jQc3vWMo6YPFATYp2Rxg27lsvp+pAkrp0IkWxrfX17uKwBMt
	Z8xlG9FEPBb40bsJXF1KOiZmCT70pkmuGxEOLG2mi+ABKQGXJ5qwQp2ZOlZ9xTzOEo/CD3XtgON
	l8BmNjAoFsRr2bsxNXur9TOaLeN+eNc1H5ZVDxMPY6+11B3gG4N7xdzVXkN8L9iXkFAVAr/rC4I
	l6WmPisTPgmyF+4YOaT47BeLWo3YlaKcjIWncE0iuDpAWhVKQSIDUe5OFpPJKaDDBNXanH6KbTN
	dYzeHXGnuqRLYDcqk4C/Z2T8rsckU4DXDahxDkv0XBoCBlAs+yWfi1tHBC0e6STMFNkU/qQTcPd
	Ba8TOzyJ9j0bDntOdG/ACuCfexc19O6BlDhJRfig9ifL1mCZ1bkiOGdQlaTS/uJ+fCMWRTnS7iS
	S3aGEJGKbwGJJxRWPBJtSoJyaVx3mQmt+/K1/7fc3oBBqA==
X-Received: by 2002:a05:6870:1649:b0:48f:e0f6:c45c with SMTP id 586e51a60fabf-4ae46c42d59mr1213442fac.42.1794364015190;
        Tue, 10 Nov 2026 18:26:55 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22d1d541sm2789026fac.2.2026.11.10.18.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:26:53 -0800 (PST)
Message-ID: <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com>
Date: Tue, 10 Nov 2026 20:26:51 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chun-Kuang,

Gentle ping on this one for mediatek-drm-next now that 7.4-rc1 is out. 
It has CK's Reviewed-by and Roman's Acked-by, and it still applies 
cleanly to v7.4-rc2 and mediatek-drm-next. I can resend it with the tags 
if that's easier.

Thanks,
Ryan Brue
