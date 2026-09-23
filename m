Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B033B71DD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140932; cv=pass; b=rO/omEtQF5SdBH+tJkZ1mVSDGfkyn6hbxSiwehQaLn0T/g0qVB/jES5zaeVIo/hdn8DoHPGn1qqTIxDAPc1m5ci3+4cIz+9Wy/W73BHl54t6VcM4yRzIoY8Fg0rvhFmO30kTFgfjHQsJ/RVxJHcOaZlGCCZQaYzwx9hz30hAAQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140932; c=relaxed/simple;
	bh=mUZzwCb+JCrAlgwo8A+ZAuwL7uSnu1ruhJ42Saued10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGIVFWYI88nElLGCAR8tfv9NhYUg2Cs/jTNVLikPBtPhsm9Mo+HG3WSudwD0bHFRhwWW/YfagQWzsRJmmKTBjzYIhQde0ARwulGSlXMAeXtQaoEuMYeYe7QDd+6kO6pfBS4MX+Q7V5WCParbHuJuHmk09RvXBGK6AtdnBT7PgRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/rGF3iX; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/rGF3iX"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52faa58bff5so106831cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790140930; cv=none;
        d=google.com; s=arc-20260327;
        b=YIdOLRliRSj6P4cpFoyBYtvZmbEZ1w2SnhIxyR/2BZnGnNHGSCBjrl2eXhmHFmkYIn
         +tPjKvnHd3x2sOZ9QYkhZhxpJv6OKRcBtxCIIccIbOjaKcel0XzvlW6GKfLPPSD96H/v
         dtL8pY0d3a7HRPBX5VyEU6qmQllYyNf/hcMEFmpHLNsl7+tF5E1Rvyv/fzcH0Fqqur8P
         37Y0UCP6cxRxd7rMWQUF/AuH/qfLwTJQ25u/9+kiJTULWM8SMKGi7iZEeGB5aNS7cQxn
         R24iONPpUByfOPClzwsSvX3tNpxELsMR72p0pR5fOb/sx0csNO2xV+Fk97ok2dW/w+Th
         sG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M6himwR6bCyl5owXprR66gPCgX/tVDndxYCLaH1NDbI=;
        fh=QGhLrQXK5/lziXjWkSl2rrk8vQaVsLM9kDwNw94cI4k=;
        b=KF/96YL4SIJUa0LQIKrUqDiT4qRTStestx/IBVKn2VYvxhR4aSz7WJledQc2XamMFZ
         LnujlpsuH6ys3cR3cVlGxidzqBfK1aMvJflSwwknccLh2hO8KFMqTHb9bO181yODVgH/
         QUjiOyULeM86NGLGtWB7DEudQf5766mW+Q7nD5R3X4OOKOOxcZZMvRxPkA+mXBELPbqY
         RFY/ZGZ2ZeXT4ZNKe3ozj7KWP9s/HFgWz2fKTkTiST6cz+v0Ub3vkbr3fdOMbDyBv1ar
         NCghLEpfc7YtgGAUcU72zKRVn7SK7GTQKto/e0RXHl9tBno4R9FOA3pWsYMZwe6TJOTG
         DqKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790140930; x=1790745730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M6himwR6bCyl5owXprR66gPCgX/tVDndxYCLaH1NDbI=;
        b=r/rGF3iXlR7tiQWEtFgPbBj9+18Y6F//oIw67rhEsrgynE+gVmNmLeeR72vXO6Pcmu
         yU3v2GgWZAdVTrJR4zQldNFo0nrPCc3pozS6R3A3aDtu/v5XVIu0GSX2QWOfIC6cAK09
         EKa+t+AsHyMHYfY4W1TeZ05wWbO/+K1QBpCAzIxOz+SwwVpfo3G1fN7I8vBQqmZPbTTK
         BENbx7mUh2rdVvjZveQsMCMJhy9PAh2VPe7MBVvhbE0SSb3NMrAO+kUbJY892zcVTo04
         WWWnHxmGR0B/1XMEOJ1H2ZuJ6f5dZaNTP9K8VB0fSpg8/k2neHS8npG43kY5Z9uZREoT
         6qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790140930; x=1790745730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6himwR6bCyl5owXprR66gPCgX/tVDndxYCLaH1NDbI=;
        b=xIuFiXsi46v0hxlCaoK9JbRVv2aMG9uFy5Qw39LEaZ6dGToBejgm7+nM0jNuak6wQi
         aIQZ4iAhmXdi7xejyC3aOIrSj0kz/DSb65F/9teqyJYt1YAK9TkeSAalmVIWLUAv3P+f
         9ojupwer04zYOoUjlDTpivNUfY3VdtJut1amgorlpWPzZUve1+6htG+vRNrswH93TTLa
         UeETTVrssemtiugGhqWPUXoGlOzy60GsXxlZHQVlz+P3HY+4H/dqNuK/7cUUgTj7ZXH6
         vuyQJSCFH5hFGIaNSanKuDk/2aSu5j7eFDtYF7smYp7a/uiUoL7m4CvMkqz2nxeQOSMk
         7siA==
X-Forwarded-Encrypted: i=1; AKwUvBytQ8/B7Vn1scy0frW3b0+Z/UskKvMjHh5kU6G25LM7XKrVH+JBQiKZPT8ENCjOlSusKKlTGVaQ8MFkVhY=@vger.kernel.org
X-Gm-Message-State: AFuF++nja5s/n70rdZxnGln2u0YXdokl5IPpTo3IrFy+UX6wccRN0XzF
	pAaHmbECgB8Uq2brVP66nqkFT28ulDZqVqquveIRP77hi0teHyGorOirAdSpFYT9WwBvSfhmZ8O
	+BXhDXfWorh55D7lIyMM7Ir4Ld0g6E/Q+GQXIBUAe
X-Gm-Gg: AYBFou0VRZD1hGxrjUSPqdQIgpOcwRks5xdwPKWtejCB9XUvXO/mLdGfUJrWPui7HzH
	cjn4NYoFIuBZzX3zZXgrLTlBduCWyvZgDMCYiezVFqao9WY/8r0L04aBMWgl2WRbI+T4jhPIFUg
	WXBaLaUImzrhtL1dRlh3ogH2iuu5PuLmLW6fatGt8xGnU3841sscieRnqBmC88aLTGz1/AKgH5G
	mtb/B+1vYWpm6ZR+qImkZcZ0kUfzq4YZuELcOEWY2iWq243xoy8L4TM402RF5U2VzwE/tFRGzJ1
	A3oLHHNOq+u+I8TF/KqDtchrlgUydUKtXS8+y/48H/COQlJiPs+SXjr9w0bn69cvHgI=
X-Received: by 2002:a05:622a:1b90:b0:531:6de:6028 with SMTP id
 d75a77b69052e-532ef055b5bmr6402111cf.13.1790140929534; Tue, 22 Sep 2026
 22:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923015517.2665398-1-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260923015517.2665398-1-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Sep 2026 22:21:58 -0700
X-Gm-Features: AcwNN1XVFgegAHEHKvebKKbkGZKcMNpo-6604SB4clrIe7f2Jyta2VVGpQqOfb8
Message-ID: <CAP-5=fXaB9vvDGkT05kKtHfY3K-2sa5BzpZbKK5htVVtXBeTqQ@mail.gmail.com>
Subject: Re: [PATCH] perf jevents: Rename OMR offcore_rsp attribute to offmodule_rsp
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zide Chen <zide.chen@intel.com>, 
	Falcon Thomas <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 7:02=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.intel.c=
om> wrote:
>
> The kernel renamed the OMR data attribute from offcore_rsp to
> offmodule_rsp to avoid confusion and keep the naming consistent.
>
> So update the perf jevents msrmap accordingly.
>
> Link: https://lore.kernel.org/all/20260917015234.981153-12-dapeng1.mi@lin=
ux.intel.com/
> Link: https://lore.kernel.org/all/20260917015234.981153-13-dapeng1.mi@lin=
ux.intel.com/
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>
> Note: The dependent kernel patches have been queued into tip/perf/urgent
> tree.
>
>  tools/perf/pmu-events/jevents.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 860027bb71b2..93cf04fa8ca4 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -249,10 +249,10 @@ class JsonEvent:
>            0x3F6: 'ldlat=3D',
>            0x1A6: 'offcore_rsp=3D',
>            0x1A7: 'offcore_rsp=3D',
> -          0x3E0: 'offcore_rsp=3D',
> -          0x3E1: 'offcore_rsp=3D',
> -          0x3E2: 'offcore_rsp=3D',
> -          0x3E3: 'offcore_rsp=3D',
> +          0x3E0: 'offmodule_rsp=3D',
> +          0x3E1: 'offmodule_rsp=3D',
> +          0x3E2: 'offmodule_rsp=3D',
> +          0x3E3: 'offmodule_rsp=3D',
>            0x3F7: 'frontend=3D',
>        }
>        return msrmap[int(num.split(',', 1)[0], 0)]
>
> base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
> --
> 2.34.1
>
