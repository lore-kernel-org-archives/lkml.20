Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909323B1014
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841082; cv=pass; b=DC743MsdbpJX+G5WfZJHdAL0GgQlO5Ti1zzN5TUs5YW2q81h6Ln13Q3c9IsFVtjYy3IOTPD0XlhCLihSWF8Jv8YY862Smhj8ohD/drgMZEzXWRbALCDI89qvAil8onETVO37iZX2g1arLz59phX11nqxdvzZrZwcbFfPUICAkc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841082; c=relaxed/simple;
	bh=slDu1S3NEvxaLYJ/cgDIeepO5MtD/JMrBX12ULvCTZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcKhkjWhjRg8tj9qo0w+D48+uCCBrI+I2jJlH+Ledr31Gxx+fLl6EFW0VEd90/MGSUIIKIwjk3kSV5/KoVX2yv7Sdq7wxuhBvw66g3R5lonRjZqEM5nHLY1Jkmi0AmKwP5Aq1Tnbr94pIivohFsx2oWnuDrBZZS6CPdvD5HsVt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEKWTAMd; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEKWTAMd"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5337fa12431so562841cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841080; cv=none;
        d=google.com; s=arc-20260327;
        b=NNeM3lLz09U5OwSi+lek2kSvkr3thhRzznQwyWgVigBRFHkOo65OESFdlTPsZTM513
         deQRWILACHkfCusgnkfM3eRkaLXJgKpxnlm2nw1Uj+j7kp/v3FL0S1qRHafnmS+4DB9H
         TB5dtwq6niLCdia83V34yzoH3Tark7AXoPAqxomG2h/ZyT+S9aucEyk4MOgVXtpCoiL6
         JBycQ+RJrua3pBeyICaj0/trEbceRmOCla8SPG5xoWn2GDx03qa7nT0qgP9CTLH4TyXx
         j7S8TVS8v+0XfoOKmlQf/q/nBcObq66ymyDyZD/EXaYPyC/6lUMWJwpviCxzjfyxXaZf
         icPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfZ1pdxaSN0EWKS1LnjMwHylnXhOgM1cGgWdcIKxOvI=;
        fh=mIXt4nBCPYapIXYDbUwkBsw6tvIboNTryAf0M16YbZU=;
        b=UbIjFFQsMNTrw3+Gzsjd7yVGoA5ptvYKVZlLmkevmMwq3Th1h3zXleBgA68u/IAEuy
         zkpEHjA1IIRvek9ZWFa5tyXou0fQmka+psYBpVmAIc1YV70wkKhk3vP7zTZ1TiqG9lJT
         5YRtGzNNTWhCsCG3hZCwYcJLXlwJh7zqFWBs1291kiSy4HPsmGJ5Jo/jL280uQ8zZZfU
         17DshTgIvySGvU7WtlZZj3OV5gLoAJVhVgYOu4CCQJD0MnWtaLvd8YnVOs1Kuph4ebP/
         hVKYJz9ajNZ8icoc3e6hDBlECRh9Z5XWT1BNmtU2K2w5ennl33QNVMuTRLBVu4xgphDp
         jKyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841080; x=1792445880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfZ1pdxaSN0EWKS1LnjMwHylnXhOgM1cGgWdcIKxOvI=;
        b=LEKWTAMdf1ts+qM8WNq26PNyj/JkdXYh+96hDZ8Uae3+iOgAd00nM3Yb5isa8G1M2z
         5HyERb/GEyUu0SJKs5/GHnf39KwXonzXUQIeGWW6mkzj7I0JLDo1t6hP5lSPukn/0gYz
         TKNfi7pR//vLCvX2oMQ3nSIwB9I5XaUdtacpx3KFV39fw4PxUYFuR+TPACOfmOp1suWT
         fylATmq0KLXUn6DkQ+SQ1ZYLPFtBU3t5edJhlZuOIdnLQUy32KIzPt4Q9yiy1Esgxd4E
         DqC50BxuRsi4LZCoCYaNEVZ3c5R9f7bcdImk47mbePAGCdnuKTFBTZXbGm7M2Qlfy0j8
         oHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841080; x=1792445880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfZ1pdxaSN0EWKS1LnjMwHylnXhOgM1cGgWdcIKxOvI=;
        b=qLwkflbWhG7K59AXepM66xQpHcU81In/33fHN260mxo5YtAH9Qnb8vPHH7yGtdoMy9
         U4QWcyLfF2bkt8H3ZjSEFMhBmWwbU+NMt9zVBILKsc4CON3HSMN78TF4FFFv0R3XMxcf
         ytCPH84lxCP9KLLhTZN33uSVEIAKEtSeQzrYNB5pvLmOc6wi/c6D8RAVYKQ8AiCZvLC/
         n9myJIVJ7fbIkbZWj3cjrqi1DRPkaX8MrfoJBGsZ2JIWY/4ROFqFfiQ0cjzORbkXrQzK
         HcozpngT1i/Kw+LK9ml9YzKgbXnVV/dYlQ/WNaeu5BvYsAvzTg7ViMfo4zebBur+BPdw
         x31g==
X-Forwarded-Encrypted: i=1; AKwUvBx2Sh70swMAp0ZmwxvEHFB3K57or1icRbljMz0edaRGSRNhTjwJuJCLvMQUqF8LwGVsG4ODTXkWhPgxcXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZV3M18OeiNvy1emlg/MGji4/J/A2J9lME24FCxqzYDwSuh5Z
	ng+OawuBLAfOyEhqDRqr5c4V9F8TjFjze7saI1a/AI+nvAh11uKw+Uu0pzyf1tx+Jbof2tqYhCX
	Y+GhFm+3bp4OJYY2b7rjbQzbL3yoJbitNzYiMcneE
X-Gm-Gg: AYBFou1qkqZb0cgdoRHy5cCd4YaVylhqbGW6qjppTbuPUijO5XvuJRSdsmnoxxOtOMD
	pqWE5K3L2r358IgSayFThylVKDd/On0WpcLghRYHaDMX1Uj5ys5NIrC2OicdwsUF9q8PTZAxNed
	bVrbqmUXSuUSTJPOI5J/0SgsKaRdMaU7bUWF5Mp7UvSwe5iwwmnbFT+XcTv/JgqfiGrPfrcJG/U
	RdKVtxTbLrDKIyp3uWeR5XIA4QTTkh41wUJ4pLPJih9NKHLr/F0nfSF+eYmM5OJIGQfGEILtQzN
	h3s4H6yZYmDG0BXACJqGU8AiHgtI7dOrbMolwxUH3FtdsJPtXtMtwM9E5D08Kq9NX2JYW4PMw0t
	sGvekhoOJ7g==
X-Received: by 2002:a05:622a:1ba0:b0:534:313:9b4e with SMTP id
 d75a77b69052e-535b321298dmr37633311cf.5.1791841080036; Mon, 12 Oct 2026
 14:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012052601.13920-1-namhyung@kernel.org> <20261012052601.13920-7-namhyung@kernel.org>
In-Reply-To: <20261012052601.13920-7-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:37:48 -0700
X-Gm-Features: AclHuK_ZrNgnTBwqtkh3IwDmLF8XdwWV2jnDsPu1pqTS-JvqwyRdhfAiTlgo_50
Message-ID: <CAP-5=fWbYmbMv_7rCyWGsSmDA2S0q-z8=2h1W3NqMWCiAJqniA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] perf tools: Factor out dso__find_binary_type()
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 10:26=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Separate out the logic to detect binary type of a DSO.  It checks if the
> candidate file contains ".text" section.  It should be called under the
> dso lock.

Could we add an EXCLUSIVE_LOCKS_REQUIRED for this?

Thanks,
Ian
