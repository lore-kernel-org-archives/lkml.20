Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793058938;
	b=oyK7USB3P+kUouQbpVRmbmabRcP4NL9fDD5ahGFraunGG6iotQlio64i395Ha7yWx85x
	 NBHU6+UfvoGEqnZw0Q9V49XH15Uqf0kCbvPNJd1uXjNRsH7dmF6byysLF4+SbcleucGHY
	 U99EVLA6v+H6vACm7Q8eAuZaAUV1D0uK2h1LYIrIt0aRuhCavulCA56dtu9krfCccu5CD
	 12sQr5kDGblgkPJU54JMaw0wRU1uqX+xrsT5PQJxHsZxqS2MVovSoZ3/bYTI/Ve3JY7PZ
	 T3VSCk9yWZ/ROcfF1Yym2VLchUGVFuHvFjp+2zK2vgK6DM3AoYG+6/Z5NTKrx6piNsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
	b=P4sshkIvDwTcpti24z2uWxg8IvNvshrH4L5EIsZ8zbIoLosIMcAw/b1Qu+Q6qaTR3pS8
	 rutTxECxpjKx3hOVdXIX6F22QNZ6f+JmOzOBXf5KHHOZtPGOLiWySHqkDYElcucXx+AfI
	 I6XQZpP0LLwfOIe+2WoPX/+U5lSJQglTOtKSeL0f/y4Un5Ksc4oxkGkTZTjyfBmau3v3Z
	 rEFVDO5LaKMHRQe47yImmSExn7ttPxyQCum7BLUeekAJf2vSkqV4hs6FxUy5s8Uqn2Afz
	 IySSAQmz9pTMkjmO2SdT4ThPmYEs6bMUV5knRS/uiOaaaWQACsGgFTJ04nOIotzjfCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TQpGK3pm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C40606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C40606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TQpGK3pm
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917a707f37eso36144396d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793058937; cv=none;
        d=google.com; s=arc-20260327;
        b=Gmu/zOhewueibLnWIslIeMi7cy9cMpMzC61QGthf+WZBxQ2UFo6um9ytFPwP8PC9/B
         MP73grNQx2kd/xckwXesvcie0fK2/QkhFc7il5wxNz42cPzZa3PI07xoSt1+lbTrmzMi
         NcRkedIOAEVVe4tbcqtpo5B8fKJhEQXq2I2xgZB31WK8c7rLv3bDWtZfwTX0rOck5k1o
         eZH+FsLWCTMFrflQF3nGUzoZUh++0gEJkVo0nw5tVy6TyMSBADl1WyutQgEgVvkbywow
         fRpKBhaXiNPCYvQJbF/q5Ax/ctCQwn/7pR4Ace0PqdqquSdyI5nvpU8LS6aC0vi6qNxO
         pnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        fh=Id18WDwpAJFemU0SGZsgqfMJWn9b6U7IUVywlrdOX6M=;
        b=I6x9a7/GMu/3/eAoKTx+vh0S1yA7kJQKjAM3GUKXTjrV4zA37Bnhe1eSti6izL6k6V
         0PZsyjmc+3m6TQmZFfUZpTpDDJY/t6Qq99rj8IdXyBmYcjYm6CRcfYlEXe5sTlKoATgE
         AFMym35ca//oUKIGTndcdvUjwhcq+E+CNauTw8wW90M/XDvJ5sEtQ/g2hDrkkR596igl
         wejvF12uHii4Cn0FBbjSYSnSACWHXHXBfORkPdMvaF1BbTM4HP8BgjJrqMK+Sq0XBdoz
         a8e42kL5TQoXIS837l4k0t/TFyR4ruI4bKWlEl9GMKnk9y2uvzkfagyiXSV5BeJ/exoV
         ef2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793058937; x=1793663737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        b=TQpGK3pmnxF9Uh6mGxtTM0eoOIkxVBX4Wm6rLvp8nWLojE4nxAZMlCEmoVe/K7O1IT
         lwuyAQWdQRiI3GNV44n3R9H/UshrkWSTq6oD1vkhet1APzf+TpbIQ4vwSN3zzqTDfT37
         Ed1rwH91/BFSMotyBHUJ7VCOgLkpiakvPiEM36ophgmxm6mUSd1mvTljS0SC/rl5+410
         OK142PrbY9MR2EtBXmHC+KgoYWYfkAgFwgXH/cxyXo4KGJhsDsGJzkTrTuf2YDyiXvxq
         kGGTVutZxXnosvs8t+mP2Baw0iZzSIYryGRjIidYlNcspZDzGGY18sntryGZFSDAi7Ny
         3K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058937; x=1793663737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzMX7mFcIWh7Kuz+dntrLxcfYo0Pt/pLtJ3pm/q59a0=;
        b=Y9gSbLckx7cdfEaXBCU+NYvqYXtOWeDvFXvlqaUGNnn3NaQJR9rXoG1Kbogviz/W0l
         8onBa0C0Qg/ApyI9zovfbPp4HiqMcLHCXbSjXRihXi/zGhgte4xWJgbruMKksz5fMEtu
         jZGlApKZqoOMwLWnN6xLOJOReSHod9m3O4aNDA557mklf6McOkRnV7FTDGb4gs/H9Cvz
         ZeIqVcj0uWFIAzi2uxmxbuV+eTDlgnxvOVXKP6TyDVb4Tk0fwOrCNYednkxuPNx+W3+/
         zWGM0aORZPUMiRtlJuxO0onFLh01hXAhZJ0g0vDhoEZ2mLT783P4h0SmxCPAzSwS+qi4
         uhJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnofqhPoEQty+IzBP2jb3Ogbg7ZbvypimoX2jmLdGZeRO565xQPnwREux9dbAqTTelC8FQ49xDyOgrYec=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuh4HRDe3eRkWV8cMEOQ3zihI/pK5g8mzdeRS3o5WvBhrBLPDG
	OKgH4bERYje94wcjaFPz3f4w+ZHTQ1SCDaPzlG1UbaCcXx3Izn/f+dPcDczmN1/PPl1gizTmMTn
	ciZ3uyNUtQwhjhYrDb+SSbD41/bb5fr0=
X-Gm-Gg: AYBFou0mxmo7kNd38JFLc0sVLEGTV+WQzDC6NlKikSr+UkU95qpZCmPvvWiyluAjNAG
	jCc5nzlIluiDjdjjWiiiGz5vak2LKlLP7/xDdCo/fCTIYG+GpDVpGCLcDkzToOtMqbWRyNSdHDH
	fi0fSX59ICrxh+5NLaz7rKJin4vrecDgIenkQIVJjAISOZmCEpnyvZTnc+6djWPENe2aN0+wosY
	OvAmfJMe8uSsBYyySYzCW6iJdGOHcsuyRoTXzPFdX5/aBJVpbTdvppZL3koqZQMI24Xe4AU9kUO
	/sUOcll9T/uzevhoGJdv0zdYxza9W3MR10rA8f1xpXGJWa26zJSEke0HZaIOiTAtks3QiEJV/yj
	cWnr2OQX/8m7znJOubqeEQLU3fZzjznR7bfrqyQ==
X-Received: by 2002:a05:6214:3c9d:b0:91b:a702:cc5b with SMTP id
 6a1803df08f44-91c48d21df9mr142161736d6.7.1793058937159; Mon, 26 Oct 2026
 16:55:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
 <20261026-msm-dpu-res-clean-v2-1-3d864435186e@gmail.com> <498e2fa8-b707-4a06-9fe7-9e62253786c5@packett.cool>
In-Reply-To: <498e2fa8-b707-4a06-9fe7-9e62253786c5@packett.cool>
From: Xi Zhang <xz.ca.cn@gmail.com>
Date: Mon, 26 Oct 2026 20:55:20 -0300
X-Gm-Features: AclHuK8LbWKXuTefwbNDto9JuTcVHDIAbeMY8N4dmB0dUoKxhMwBSYQlkgp2Y_c
Message-ID: <CABxuLgMHx+ZvkL=Rs7R2N=cO8Vtyc8FktZ4nUzmCRD=WdorWMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: reset unassigned resource slots to
 NULL on topology update
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Xilin Wu <sophon@radxa.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:04=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 10/26/26 5:25 PM, Xi Zhang wrote:
> > While this is not currently the case, it may be possible that topology
> > for cwb and dsc resource requirements change between mode set in the
> > future.
> >
> > e.g. when dsc support is added to DisplayPort, dsc may be optionally
> > enabled and disabled between different modes due to
> > bandwidth requirements.
> >
> > Set unassigned resource slots to NULL on topology update to avoid
> > issues in the future. It's good practice to do so anyway.
> >
> > Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++++-----=
--
> >   1 file changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 0a6be69a3e83..8d2b4d2726f2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1205,9 +1205,13 @@ static void dpu_encoder_virt_atomic_mode_set(str=
uct drm_encoder *drm_enc,
> >                                                      ARRAY_SIZE(hw_pp))=
;
> >       }
> >
> > -     for (i =3D 0; i < num_cwb; i++) {
> > -             dpu_enc->hw_cwb[i] =3D to_dpu_hw_cwb(hw_cwb[i]);
> > -             cwb_mask |=3D BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> > +     for (i =3D 0; i < ARRAY_SIZE(dpu_enc->hw_cwb); i++) {
> > +             if (i < num_cwb) {
> > +                     dpu_enc->hw_cwb[i] =3D to_dpu_hw_cwb(hw_cwb[i]);
> > +                     cwb_mask |=3D BIT(dpu_enc->hw_cwb[i]->idx - CWB_0=
);
> > +             } else {
> > +                     dpu_enc->hw_cwb[i] =3D NULL;
> > +             }
> > [..]
>
> I've mentioned in a reply to v1 that this was indeed affected by the DSC
> changes in radxa's WIP, but missed the more relevant one:
>
> This is already handled by the "drm/msm: fix SMMU fault dumps" series:
>
> https://lore.kernel.org/all/20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@os=
s.qualcomm.com/
>
> Namely patches 5-8 ("drm/msm/dpu: clear the ... blocks ...")
>
> Thanks,
> ~val
>

Thank you for the reference link!

Also thanks for the radxa mention. I have some msm/dp dsc work
for the older v7.2 kernel and could use those code reference.

Awaiting comments before removing the overlapping patches
(1 and 5 of this series) which have more complete fixes in the
series you linked. There may be other issues with my series that
sashiko bot didn't find.

(I'm using the gmail web interface reply-all, hope it's doing the right thi=
ng.)
