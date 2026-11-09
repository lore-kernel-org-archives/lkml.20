Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247134;
	b=3Dpt8JuRN9C/XcIJJ8+TzQqJbH4nvQJnsOy1B98wY2i3b2P4xiXuRpFLDaFTMEKhrzF3
	 WnCQFgDvn4zajVluZ4lKN5O6bi/BgXWirLTiYkXpJp3ZO7GLIMB4suZ7bJLo1Xazeqq9y
	 43gEVZV25mhlzWs2RTDO35zhmtHOboO72D0CofDQ8EEYR1awTa5tpna3TwhPZbzgLYDOH
	 Z2W+lTGL9ErDmH6Y5Rj8hgdeKQ7FpY52UyDxPO2+6E3j7teipXUPYMZTS2wEC3cXSebbP
	 2TvQ5N/JBk7IrlpFzLJjpbaNMwfAvGTNof6tloMPTxPcc+vqnzGr0iItyyV45k/2LGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9q75CrYbbx1raBGLb0OpIjYM8X7HXrQNmHLt90ZlSz8=;
	b=WnkfSW7KZprKLtRA9eCsVmih4yWy6vyBak6OlmsEvdZp+3pRpiw7+f6TrfHQxgCa6OF4
	 ImeR8CrK1eDhl5fRBpfoDPAlIZKn+G4eGGqe8E6sLlRqlork4/xhnFtlDN3mNVaBZABr+
	 OOtF4aX/ZsnikelifUHEl5lkgKzlxDBezrSagPBy8vjaLEfgtLgARU0ezqL0ysPHmtRD0
	 7jHv73bExm1LbJ/MVhgzYEsHtsRE8IvBIP5XdFy7DZaSKhWZXrjdkVXBp1v2omxzDc79p
	 Et0IXVZ0dYLTgEFAkKjSEn1j6tzogS5E6pj1FUELWB7IT6AsZuzQ/w8aGmumvK7ssHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Oblus5Sb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA08606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Oblus5Sb
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4c9abc1824so173294566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794247133; cv=none;
        d=google.com; s=arc-20260327;
        b=d8iJDbs9R5I2r7XaTvIBs8GOs2M482Ijviixh/MkxW6dEsgxMIpDbvxMkWE5O2aFeq
         5+jzPc8b/CSOK1JBRAnfHTE0q3W2cNzO3x8mz3ydso4JN2UNT5enXa7/XxCgHYJESR+A
         S7WZ2Q4g7dajUlPhXd5is4bo0NNnAW++DW+GloYfuU/FVYebPxgXu6PhWsJ7VlyiiZXE
         Q/h33FtUEIgm7QqBQ7aYBsq3vHKR/vezR4UM/pPeZfqN7j9Pgu+3rM370F12kVrUIXnP
         tu+xG/peKTr38OzPvKN4d0FJmpgao+KADtNjL4dmbLlLBZbCuwRamauSbLNyrOxh8SRI
         2mrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q75CrYbbx1raBGLb0OpIjYM8X7HXrQNmHLt90ZlSz8=;
        fh=9scdFsnSvSdYh+svxs3DNRHg081TDX/+cWt0jrhFxLM=;
        b=n7ICMs/C76yGTVuvPeYWltQT+VrAE2MvEHOLASMMCzfSQ1sKwL8cSbr1sekV5moiSe
         W82VUTY0/gNz6WW0JGyb6jNjYq0JPC+mOrYf0ZeVCtI2M9rfdlySMz62pzswdIwhu+vp
         uv7fvPIVCDlSQhdO8ovznEW91ALiqOKAuHcdZC0AKpXvbSeZ75LgGaHFZcOPYaAwibsG
         xyl0JUaDT/Nkh2BmeTKzoJ2NEiIbixa7Tqwmdh1fPxR+385Foi+SqEpR1XtIzNC0Y9Ak
         DX0B4Y99hksiDCGjQTdgMK0n14OClmLh/9ZyiWmP06/iNhcZu9IJlBru9rBEX+2+syyH
         goXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794247133; x=1794851933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9q75CrYbbx1raBGLb0OpIjYM8X7HXrQNmHLt90ZlSz8=;
        b=Oblus5SbQVYBivewi2nR7J8npdN1R80u7wbVSsZOQmK8ZH8yCyKoPL05M6qt+hDUQ4
         LJfsTf4kLBmDjBlL855mlvkiC59XkRJrDoPlUxjOGIpkrC0pxxlOs6DBqpALWznUttrO
         G9Uy2QeRDcyreaK3mon5vtQ4Y9mc6MiAnQqT9teafpaH7P4t1LcdyeqxBjSsTCzFp962
         Uki4ej9hjAvEip5q3I+FO1VGn0PC5Cr7EH5rWa6j0jbKxhJRYOXhBaKWLDwDaBuZM72u
         VOfTuGNivY+sXn4D2bfJ7De36GLPIyXhVS7Z+Mppq9GrG7HhO9ZwsMsTVfaLm+n/xvUU
         bPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247133; x=1794851933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q75CrYbbx1raBGLb0OpIjYM8X7HXrQNmHLt90ZlSz8=;
        b=efiDrG2Q2+rwViO4t8P2V3HHHP26HRMdWKUp7DGd9eQsKWuuYSkd6FvQSS3dRh1QZQ
         EXNglxCuQyi7gxinsiEv9wIWAqPjIh3L+zvfJI3ARJGjPWIkbkvknb7A8uTxTTcOC4i0
         qbDamYigC3eWaZLBUWtyOMRNgY7UIzhG17ZZNr7rQlL3SAWscYJjOa+1B3xjCScdHJm4
         pRvcw4rVucmIOeNYi9UqCe+wWvAdfUFwAqciRkcJ01XSA+dv2ZoojYJn4rhpwLCZLjA/
         QGMe61WjLRvrWTwtMbk3qjq7SIrdTsoD5LrKlwczk51BS5gcvHppke4bqzUBrYkLuja8
         WmGA==
X-Forwarded-Encrypted: i=1; AL+hErEyylr+G+GeZ6n1W5iGpfZvO1L51/Jbsbn7efQK+iLNpehXNgfZqI/9YcJZhAiRjuN6dO0P4bqkOWeS+Ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fl35OaQySPyFsJ8eA2xKj2arlJLGYVenkPzT2c7C4NsJNkl0D
	VTiiP3cNZ28bqXGE2vbn0Edse/oaFT7tjc+jjL7Up7KchW5Y4tJCWtJnX5Jg1i8QQ/8Yfl5SobA
	8jaLPvgzg49/R60q1kzHnsnWL8cRWY+GyTvS+/E0M
X-Gm-Gg: AYBFou0+vJC0VjStk4mx7KctQAC4hXqL/YUpI56NP8J5O2fp2sNtaly207s/OLGiZ/9
	pP9Y4n644/zcXXOTnqQsDNn4XDf1XM3I4Mn38kwwBdCZBADvWhSfV4VJyfF627tcLhVMRDGEzVM
	D1YWzQRRWIJirDjFgSQeU0z4D8B1p6CUY8QVLdn3X70eKmVKzxN3YgapqN0nUXy4vmVMFYZXfyn
	RLp+u/pEQRvMgI6WN25v/nIOihIdSdloY6U30VgabdocCIZEPK5rmQ2AsTLMAPxf5lkE5KK8nKQ
	boVlSgykuxv2DU3G2gbPJXm/ZP6RFJOgtAecK9JLt3nDuM4A3CnGJ00Fyxq8EGPDywRJeU556Nu
	hOz68ePhNdw1xxsF2g7zB6jzWG7wRXf0Up1Haw5YRnIsJ+ONSzx5YR3UIwItJUlLl3HfyrDiSQt
	Of/rQuS9+w6PB5pB0=
X-Received: by 2002:a17:907:7f9e:b0:c46:645f:cee2 with SMTP id
 a640c23a62f3a-c5049451e5fmr16322566b.4.1794247132202; Mon, 09 Nov 2026
 09:58:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018074528.974953-1-lalitmaganti@gmail.com>
In-Reply-To: <20261018074528.974953-1-lalitmaganti@gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 9 Nov 2026 09:58:40 -0800
X-Gm-Features: AclHuK_v7qaIr6WMYbYXezDLEd8d-dWLqSsdsr8a5s62qgaMbJAwuZ4_uyen8YQ
Message-ID: <CAG2KctqPvou3A_EGiov9yZJrCWMmoEX-k4-Or-RGj_Cxdtc7Fg@mail.gmail.com>
Subject: Re: [PATCH] perf python: Accept events larger than union perf_event
To: Lalit Maganti <lalitmaganti@gmail.com>
Cc: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	james.clark@linaro.org, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:45=E2=80=AFAM Lalit Maganti <lalitmaganti@gmail.=
com> wrote:
>
> Samples recorded with --call-graph dwarf carry a copy of the user stack
> and are larger than union perf_event, so session.process_events()
> fails on the first one:
>
>   $ perf record --call-graph dwarf -- ./workload
>   $ python3 tools/perf/python/stackcollapse.py
>   ...
>   TypeError: Unexpected event size: 4168 < 8424
>
> This makes all the standalone scripts unusable on such recordings.
>
> pyrf_event__new() rejects events larger than union perf_event, which
> guarded the copy into the union that pyrf_event used to embed. Since
> commit 2c672ffdad4b ("perf python: Lazily copy events and samples from
> process_events") the event is borrowed, or copied to a buffer of
> header.size bytes when a callback keeps it, so nothing depends on the
> event fitting in the union any more. Remove the check.
>
> With this, stackcollapse.py and flamegraph.py process a DWARF recording
> of a two-thread workload, with the same per-symbol sample counts as
> perf script, also when the callback keeps the events after returning.
>
> Assisted-by: LLM
> Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
> ---
>  tools/perf/util/python.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> index 60dbe2dad5eb..8b4b2f3d0926 100644
> --- a/tools/perf/util/python.c
> +++ b/tools/perf/util/python.c
> @@ -1792,11 +1792,6 @@ static PyObject *pyrf_event__new(const union perf_=
event *event, struct evsel *ev
>                                     event->header.size, event->header.typ=
e);
>         }
>
> -       if (event->header.size > sizeof(union perf_event)) {
> -               return PyErr_Format(PyExc_TypeError, "Unexpected event si=
ze: %zu < %u",
> -                                   sizeof(union perf_event), event->head=
er.size);
> -       }
> -
>         pevent =3D PyObject_New(struct pyrf_event, pyrf_event__type[event=
->header.type]);
>         if (pevent =3D=3D NULL)
>                 return PyErr_NoMemory();
>
> base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
> --
> 2.56.0
>

Reviewed-by: Samuel Wu <wusamuel@google.com>
