Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559660;
	b=abQ1wI60uL95xwCKg7x98Q+E+wdApWWQ7eeyD/2ScsyPhIMUCMoFbgofmJarpzy+mpL7
	 aUAoYgLry7DY2LE72pKX9AS3lb2gjwMmWPNiZciKS2Yt4mkRT20PGfaGBOxhRrhu3OcKJ
	 ok+W1kzfG0duCUv5vDpCvC1pHNj3xZfyh4DFt4kM1AU8pzZlOD88kuLpjbO0BBlF48Bzc
	 9wchUJfUUE1qdRMH6q6RH1/HFWi6FBi3GI51M61u1GMJBD6NrZBDb1BXZX7asCqh9fd4W
	 ot5aHdnJ5MqjVTdHGkB+uWAAbKFKoDDTdMyayv5p78a0IdQmiezGU9rbUoITuSFOXTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
	b=KK3nbx56K7CR36a3DNyhvNH5GFowCCVeppOQ/Lh8GjqbzQUZA2DTipE6zz/Jn5EgmQXj
	 Ip5uKJbv2NMMd7EvNPCGD+uYiCTEj0If1V2MzhfLbmnfJaZPKeZOFKauLfCX3EccSlOys
	 PzEMBYF6w4W3bs1qkrjLYpgOP/IlzvqrlhtTi4NVEFYNJJ0bPu/PkUMtFs9QP/xak6udc
	 f1fTqppD6cEkwcGUWPEvLX41CqJW2+S2Xm3J/cwJf2BnlPuUIncfpjABWWzQ91MDDYn53
	 DWNJyOin2VKr/bHR90WBCdwz8Ga72r8WmIl9kvHsXh3fCnjeiyFtEUIAIqiaGVAz3Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8DsRapK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C317F606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C317F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8DsRapK
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so67566e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559658; cv=none;
        d=google.com; s=arc-20260327;
        b=B/Qq8czXRjIUDSfn8wwtRMKihR3zrY2WfMfsWotXfvinxO56wwPkubWMZuYbbfBNMf
         vVXSSkGzh/HtmuagUrZtMHbLej1oAgqiE5Gc4Nf6iFSDyZg3RmBTkcXIaqR6FqUmuSK7
         9pE8I0TEgfsqGwN5GegJQTqrDDEjOSQxMxXhQX2hqH3PZr0CT85NAKyk4jQN1UHPf12n
         FnHZRIDQ7QNGuASQw757J3ufV6/Bws1B8UFQfDr/1eJmyJsdwaDSHH9q3PfXDU7ZzIhh
         Vv7ldMTgDHhvyPgsflfcLwY9gDwrplcb2IHBSPJFHLFhpS0OLUeSnXj2Iiwb8eNJ7+ty
         pVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        fh=4VTxDM1aTUVyA8O/znPB8J3liCjpPb2VLOv7JFIsyC4=;
        b=fRR9z8pxWfdV58hV8ob98VAQ4fx9IBcleX3z2bPe7HXrCVbJ3eLwEMJWl5nB2o2VFJ
         N2My0h5PTWSi+zSOUjwl8dNmb/e0bKXydzVb2HDPIvjcdlQyq6Hu3cIOK08xhg67hiew
         J8WboILR/4q97EsNmEKaht2UkC7+tXCHSrvjqVqqBPSunbB06ft404Xb/7Iacxsn4wzS
         eXexhkC56JY6Q5WQWLxib5r0xo1P/HovFaVnb1MD7nNvhCZnksYZP7u8i8ppqd33BpNa
         IcaT1vFOKLduEKdKT7A+qYgW5PXrc1Ppk5GcRhBpky0OxcAz9+n3EIEwKOuOMy1CUUkn
         wB+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559658; x=1795164458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        b=U8DsRapKhGR6vBtLH1thXXwXyZpaVgkNx8gLA7G5QxxwXy5dWJLb9CQIMb5BJC35RT
         bDaw69HrTzEuzwNOehQ4t8T00pBe9GeGgw1AUYbdrmG9cGfby6iYukW2MLBHkvVxIH43
         U+pgoZCY4d6k5uAI9Pv5Ip41cayoxBkROgo3e+1kMwLbNzEtgThbZnJEcPWt3/5/dgVv
         AY1r2y7PFPZ9oPtFSjiZDnVwQ1IMMFFZmcIhJEKydSJir0H9dkM8jmuX/CQP4WozFXR5
         79bl+iZSliQBaiAFbeIETVsBaizYJWDFJNyzPR3x0jV/BRjbAHLnTJdH5lmoxqza/kOR
         Orgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559658; x=1795164458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=azSFDpVZXB51eI+O+xnDaQ8WpvOeiqvQIg1S+9gDSz0=;
        b=Q+IcvcjfSe4Y8EVEV1cRgZmWrdZ3109Myue3EvFQPA3MbO27QyCZHA3qs25K5BBTAU
         M7mwCEUxxGAWgBl1ZVb14+GlCs+QFy6O6WTkqigXLVw34IpDQ1NpvdXLpPQloKQnX5zy
         PCIesLpniKEuAvB4eY6ZYXzn+2dMTN3Kma9XSVZmI/ErKm2jFS9RL48Z7Ztxscntr2dB
         ZhWVGrzjjCJITxj3eR62nWclScLC50qZLTOM+dWPS6/feKYXmkYK8y451jZdr3QWSKLn
         RbYQwwlE6jMtDSEPpr/4/5N+DP32tX2sGqmg8gTwaKEI03umhXv7mlWcBAb+wysVVQjC
         HqdA==
X-Forwarded-Encrypted: i=1; AL+hErFVjI+1nbnwaRDJJB1OwaG9ZnxgwakUMOs52BGjopq3WGKviuP/32uH+dLJ9r8ebtVTko2vi2cdOo/tLGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SAk5hxDQDj0Y5a2WuP+TV9bdjkwTwpk3FSs4W/7Z1gWJxTdSg
	HcN7fQOAARCMrwSfTpw72cexf3J7bDY1Zk8UiXqNUW+ZpFqbNK7LRYzGqR5DE8CWwU0/kde5Mz2
	4TJG0/tF7XYOc5If6TWtYjSQQTgsbsxs=
X-Gm-Gg: AYBFou0RHmq4wNjNyWrWCOBf1qpLg7etGG7rez9nEZMn7ebIMR610tUMPIrZr7RoV6d
	tGeihjEXLXutYD4+SRNYJfLN/yg7Lcw7BdWo0dIxvn05fc+LXf0qmYv2Vd40La1ryJwCvqDbpkY
	NEpHyyGPPjaAZYByALO2mM8XCi+sHJ7GIgDeokZ5yxHEPpEvyvHTJDAqTmlyKznvC6QwE0AWaEo
	2+QcHDE5SZGnmHwXnIcbl63ztMxn1Pm8py/wce9xgs8tn08uXCvEU5znvJPxK8leU3mZ3sSYgow
	tG6JYEfQd59lvXgyaPAqd6EZDfjnUQ7xRpI8Yf6LW5TnQKuWfibjtT2bGRg7kDiQ/1nh5HBeDrs
	lwJLp/xf6IS6/E0+x6PBLjNvmlT2/VJrpc02lH5v/BnhaVvjUjXVaJVkLmjRrurUQ+djVXc5jRD
	mWuJ4Ym5uB5B3cBtzZ
X-Received: by 2002:a05:6512:1313:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c1707406cfmr1016874e87.2.1794559657809; Fri, 13 Nov 2026
 00:47:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
 <22f2ec2c4994b36850656dfcb4dc5de09a22afa7.camel@collabora.com> <avXnVapZS61WzrIT@collins>
In-Reply-To: <avXnVapZS61WzrIT@collins>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:47:26 -0800
X-Gm-Features: AclHuK8Y7JXh7pq7VFgpfhfudyX5K_zDruS8BAn8__lqy64gnN7bBE__xRZhpbo
Message-ID: <CAEy9hNV6zDBE9HJ+sRfTTMy+FBnwWaYXf8UuGUCNq4CeQgczZg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/11] media: h264: Stateless encode core follow-ups:
 parameter sets, POC type 2, CBR and VBR
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

> Maybe next time just share a summary email with different findings
> and ideas for improvements on the active series, instead of patches?

Will do, sorry for the noise. I'll drop this RFC. Findings on v1, in
case they still apply to your v2:

1. rbsp_update(): the SPS/PPS change check is inverted, so the parameter
   sets are written for every picture.
2. SPS and PPS are written with nal_ref_idc 0; H.264 7.4.1 forbids that.
3. Only pic_order_cnt_type 0 is accepted. Hardware that writes the slice
   header itself (Hantro H1, Rockchip VEPU1/VEPU2) has no
   pic_order_cnt_lsb there and needs type 2.
4. state_commit() publishes the encode params before rc_step() sets
   slice_qp_delta, so userspace reads the value from before rate control.
5. CBR on a VEPU2 (1080p60, 2-16 Mbit/s): bitrate off by -8.3% to +2.3%,
   and the first P picture after an IDR up to 20 times the median P
   size. Causes: the P target is 0.8 times the average left in the
   budget, a size ratio of 0.8-1.25 changes no QP, and I and P keep
   separate QP histories. A model after Rockchip MPP's frame-level
   control (one QP state, size targets from a GOP plan with the
   measured I/P ratio, error spread over 8 pictures) gave +0.3% to
   +2.3% and at most 1.4 times.

Arun
