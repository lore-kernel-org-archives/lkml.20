Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C19397928
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789773233; cv=none; b=PtPnr82lP2jt+LdL1lBViDKOg+zKvkOa57OP22nZeJc12xDU1d4US9TRjQPrhyAmQUDhv43mQxxYSwbJQrzOogEAy7fER25g9rYmAZw1K98bCALK0YhGVkPU6xMP/l5fZaWLhzy7EOvWsrJG9JremD//2gpoIqybDo3vRj2qekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789773233; c=relaxed/simple;
	bh=6y+7czlKK/tta15hugGL0Z+zCEcp7uVIfBypdcFDsqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=daPoI2DZfamjiQzj23bsADyADInKYBQVqmeRuibPMeFidBic//4VxFIyTy73hIJHA+7a0jpZ/7oK8bjwHkSr+0AkNj+weFCpQ4P+cgg9nk86WNDchD8EKR9+IbRz36NlUcIBbgkRLGDe58GPBOjtgbVBit1m8je65dmmL3s6yNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaonM2oS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaonM2oS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1185940a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789773229; x=1790378029; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6y+7czlKK/tta15hugGL0Z+zCEcp7uVIfBypdcFDsqA=;
        b=qaonM2oSj9rA2vRwFBptu1pWvPBeFHJO8naAMlXCz2DklGd4IakjylA3t6RGSN2zQn
         0GbnXR9rAmJ3VzgYTk5wp98Fm3m4DzajbCfxLr/p/AesoRNEF25C+7A/QZNjexcQh5Zb
         z1yw2QpAAcc1X6T+x9377dPXOudWIYih/Su8DStT9sljgXqDCsyJ9xgSQkYki95YTKGJ
         AC+TZH7wftmcRFiCipP3UhpPmBlVBAp9QSaM4Jv2xG258fBC9/FhKdbeAQDCmCaJZRm3
         2upBg7KoUSGNPioQTTtN32x584ze20uhkHlLAQEkXPO2w9uOIQS+LwUjxhAy7Gqbe1N+
         TalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789773229; x=1790378029;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y+7czlKK/tta15hugGL0Z+zCEcp7uVIfBypdcFDsqA=;
        b=Z754BTcS10VY2xPc76p4yYyOPsNH698vdVgKjIWpw+rzBvm1s52Kz8sstFKwO66TiW
         CnaWhymJRxPf3ISlpOMrnCGzrGYCZXX/zbrOJFX3rqDTr+32529oeCz7nWtRpY05eH64
         zUJATCRS/rFgY/py4G0Z/8QL9VqPaWidP3A4tco2I1Tzy4Ep4ldR1SNftVwpIQeKSqL1
         ywcuDoik3tPZfL2Ydmnc6BLobWybvL2U1a0qIELRSFOzR0smwR5V6mFG9JLy46w5TPxX
         zPgoFVRjqkN2atEcfT35vwilstA9fFQY6opCczhaSmIyea7sMW943cXNuoW573dBuc+N
         8E4A==
X-Forwarded-Encrypted: i=1; AKwUvBz0GMO1fD5cMRRmV5QfCvWBBS0cSRtxOQQkAW8l+anl1k+lmC6zwyjgTx3f/ezGNaB4uEp8avMvp5onW7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kqoyD/VRWyCciXnWZOzmbcGQY36iiY4GYnEFmj533xLCIg3Urh
	MmyJ2E+hmHtTsA5jCxZ4MNbJIbkQeoL3YYKPSi5fN3dKUqI43Mr4Mwgw
X-Gm-Gg: AYBFou3ONxNvuKoE3fEduaWiUEvrs+FDo1HYd8cslURyX4BtUAkNunknFgFry+Y+etL
	jFh22CtB4dxzhfqSg6rJoM/ZaJr8XbsFCM68t05ovYyY8I0uMn/LyfBUPuwrGb3TnReJhuhdJ65
	xGm1wxmw9wmkCQuY6FNuLUi/W3UuXviAL6lpk0HU5T9ZYkinkRQIPE6TeVUxLJYCI7PQs29iGKu
	YkEAGvyVm8FfmzewETRWX7HoPEvfsxF57i+0KV9zjTyWyXsbx5XyEToZWjWeoHGEFD7wn6Cn//B
	I8P5/5pMkUWbFQC5oA5MNIeARVEIwn7QaWMwWKRHjrqUsr+V107b1DNvRz5FVc/LFmNL8GlQ+n7
	2DqyZKTBbhSqDEquJ5RePKhyPNuhbl3Le1FgZX6TrjYV63mnkhQkxpxKowlOxL/q+pQNIV5gpbQ
	2dnwXqrdfhk6NUwbqOmSTZIbrEvVka2bWqp/kZQhmqc3TiOydWhukUQlGTg+/1unut6+j0tJrqj
	FE5CdyJpfwEoAUSPM9At9nfg33VNCj4Pbk+jl22fB8p9kshy55/Q2LIJA==
X-Received: by 2002:a17:90b:4a4e:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-39e6c693665mr1503726a91.55.1789773228966;
        Fri, 18 Sep 2026 16:13:48 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:e136:8952:772a:93a4? ([2620:10d:c090:500::4:e681])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f16f9csm1690414eec.2.2026.09.18.16.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 16:13:48 -0700 (PDT)
Message-ID: <6289e47f004b8b0d5ce55143fb1d55f7306856c0.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 01/13] bpf: move linked-scalar flags out of
 bpf_reg_state->id [NFC]
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 18 Sep 2026 16:13:46 -0700
In-Reply-To: <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev>
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
	 <20260910164635.459558-2-vineet.gupta@linux.dev>
	 <DLDKB6BTHVXE.PFK87O3QY1J5@gmail.com>
	 <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-14 at 18:17 -0700, Vineet Gupta wrote:

...

> > =C2=A0 static bool regs_exact(const struct bpf_reg_state *rold,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const str=
uct bpf_reg_state *rcur,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bp=
f_idmap *idmap)
> > =C2=A0 {
> > =C2=A0 =C2=A0 =C2=A0 return memcmp(rold, rcur, offsetof(struct bpf_reg_=
state, id)) =3D=3D 0 &&
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_ids(rold->id, rcu=
r->id, idmap) &&
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_ids(rold->parent_=
id, rcur->parent_id, idmap);
> > =C2=A0 }
>=20
> > Also even after above change to check_scalar_ids() the check_scalar_ids=
() is still
> > no equivalent to check_ids() that regs_exact() is doing.
>=20
> ... Right: reverting back to what we had before.
> FWIW Eduard had suggested to use regs_exact; I'm not sure if he had=20
> something else in mind which we might be overlooking.

I missed the check_scalar_ids() vs check_ids() difference, sorry.
Also, yes, let's squash with patch #2.

...
