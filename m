Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706967;
	b=zbEKc/FJSPJiqol4iqpgym0WKUryI3rZQJ8bGB08SNtaMSOfFw8CN5FLKmbMQqQt69IL
	 m6aEoTkLtkuQ62ePyJuxqtSb1dwLEjpWuFWA9rhcKNv9tWLak6dlGbo2yiY4mMGjgnObM
	 wbTzknzjakKeXHM/IKxpVyOobqzdj4xPNi0qw4QGrJP5wCjyuSzG5oxz1bzPKKOGfbB21
	 8RP2ZVTTZHL0ABmOGsw65hI0wvG9XGx2SBiAp8Bb4LOEdUpMNzH/XNmK0UzXheDzwbg5G
	 4crswWoW+Gv+YgMXlcWNP3dGgxguFEpzlmlpr9xfo1CJkfSY2K83ABszUe9lBai/5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
	b=RJJ+dbcRvCSWQRKywLmpNu2jUfXliZZz93pdjBR4vxIg14X7hFcvP4EOMk02NXJq8lm5
	 IgB+GE5kkUTyUmMLlPG/8baZWa3rrZKxEZmQ3ZtzigALtZIChbpnOJFZyOtSnvgG5oH92
	 7C0qEQU6zoi6PHGPuT/vL2jWfkk0rkgf671cBeFkMJX2kV7P37L+FjxLuQlfQoBHz5ZNh
	 j/0hC0Urc9Y1HE2dLNJOhwOaXAzO2aTxybEceLO67hnACzWg/y819PKjUJLgC6ctqfMbp
	 yFo/ZJj3Nbiwj2QClEaZRon91yVRMLUpwt9wkhKzxt8ECYWfw/Pnu7/NaY0kg9njonQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDoxvMNL;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CB606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDoxvMNL
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so13836415ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706967; x=1794311767; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
        b=lDoxvMNLfTfPxFe8IHFNe3DHmHNgCatUpfJIOzy8t2XSpCxlyg/qolVA52u19Hwb5c
         L5DTcJHoV1Ebi0ieNd3KR++C3RrDJzfdvd3CFrxvCjDfE0zKWAqCDriBn6EHb+l7jgdd
         c0VySSEGndg8Y16paAHpux4jdQeODtD+GfPsGddQNFbFIpag8uHJwEzcPbyHOxuVwPGu
         wyiI0bbiSztW/GLIe6eoPKK2PTucvPlGTvGAOuWmVLPADRyAESI/DgKLeR9S8zRm1Mdt
         sNu36q+EMN2xKf1+AjI+uH1YUzoFoX4sYPw1wB2U7USZedNwBNa2nM3/+4SmfP2DtP7I
         UzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706967; x=1794311767;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
        b=X02Ly4d4NFcUAO+0AL5nuqDZVOmhFwRF5JNwQvLd+ltQzzVEy89TZ0b75PH93SLALu
         dApW26d3wJxQf2edUzHBhSJR4AHLq2xhUS0hl2si2cmWWZd8wFJP8/tf0/9vhGRwtzn1
         lL9S094rYSfjgg6kh5IipsOTGXhdu3bGaViiQc2A6na8iZNWyIkzFMA0QyK2hvFHJd8N
         SRBeDR8XNsVfy1kGhLZIxshIZQMsqhqYMbratlMQWg7HjqgcqM5PK8tYmctIJmth7LyU
         dX/OjRuYqo1SecVjgexVZ6ViMJ2vdvMopwYqGCyszsoFMdjQw6vhhhHWOJp4wkrbkZkH
         MOKw==
X-Forwarded-Encrypted: i=1; AKwUvBw/Gt11pE0WXJtM8uI0tamniV7HtisC9DBm+eBDs/0RCeQMudrPSwnW5/1gwChiw6z/8rgYGa+DmBPTF2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P0jXrtSK9EAVpRnq52qSs0FwmC+RY03PNbK53yLOAyLzaCSSj
	mH3P4uTDtLJI1CQm/AU+thSntYwnqn51iOVFM/NNIQ9DMMIPN+tmEbwa
X-Gm-Gg: AYBFou2gN6/6amaNHmsR8lNn8T+ETNVckZ+hxiX4H5asN5aQ9VI3jKRyn+p4MPIGV+H
	E/JVu8ATEeSxWSpX2nz3RS3Ecl9Q+cAfvKZN0AEEvSNw4j/S1F1U1ObB4++nPRiJ5BiEAFXbL85
	g7ODtxGBcVJRE2OEp9lvim8bBYam21NiyeY1MZVmymwNOXAp2HYO6GyL3+QwNg+iixdDLOamcyI
	Yj8FNFy+q9oo7/LkD9DrZRDOzeIjJ98z0dX1KoAyYRDh2zXUbwy3Nqg6Sz9bSgPT72KOGqqLe42
	p5hje2EMIG3MWwEzn3un+Xq0s87lUH6UHSvj6x58bRQXZCc84iCHVq69shjDQTAuSDzI1IAev2S
	DvhSpipkUO0+c3lUmUKSYhdjmKO9nSsUa8ffVtXIWMTTlZhycHJ01UQ7rT+To7QUtE/xcl6xvvD
	Cmf7bM5pBJIPqrg68ADIR4vi5qM/PhaVrhRw8IF9+QgO89hT1chphDxyEwxSa9vhKI81P/PlZyB
	6g79117218O04apxPVrbDszxGvai6u2KCfqfQuB1qvX1EN9CyPGNmc6jpuHt5n5MzwfcK9xDAuV
	iGDq3zLsdK6w/hPdjYtsQ9BDDYY5gyQkHXMjONMdaRtBf6Yg3ke5jH4Q5UdFi6IalyqY3FWj1XK
	9C8Ga0rccFoRwWhZMlJhOZnJ4/N8=
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6987759a91.28.1793706966861;
        Tue, 03 Nov 2026 03:56:06 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc89475asm5134252a91.0.2026.11.03.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:56:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/damon/core: reject empty access pattern intervals
 on scheme commit
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 03 Nov 2026 22:44:03 +1100
Message-Id: <179370624368.195197.14262032219867976650.b4-reply@b4>
To: "Xiaolei Wang (Kaihong)" <xiaoleiwangxiaolei@gmail.com>
Cc: akpm@linux-foundation.org, damon@lists.linux.dev, david@kernel.org, 
 error27@gmail.com, "Liam R. Howlett" <liam@infradead.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, sj@kernel.org, 
 stable@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103105418.362459-1-xiaoleiwangxiaolei@gmail.com>
References: <20261103105418.362459-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: b4 0.16.0

Hi Xiaolei,

On Tue, 03 Nov 2026 18:54:18 +0800 Xiaolei Wang (Kaihong) wrote:

> At runtime __damos_valid_target() evaluates "min <= x <= max" for each
> of the three pattern dimensions.  A reversed interval is an empty set,
> so every region fails the check and the scheme silently never matches
> anything: nr_tried stays zero forever while the kdamond keeps running
> normally.

My understanding is that DAMON just does what the user asked for here,
so this looks more like an input validation improvement than a bug fix.
Since previously accepted input would now fail with -EINVAL, maybe drop
the Fixes: and Cc: stable tags, and mention the behavior change in the
changelog?

> The same holds for the watermarks thresholds, which must be monotonic
> (low <= mid <= high).

Not for all cases, I think.  With mid > high (and low <= high), the
scheme still works; mid just has no effect.  The subject would also
need to mention watermarks.

> +	if (p->min_sz_region > p->max_sz_region ||
> +	    p->min_nr_accesses > p->max_nr_accesses ||
> +	    p->min_age_region > p->max_age_region)
> +		return -EINVAL;

As Sashiko pointed out, this would break the DAMON sysfs.py selftest,
which uses size=[4096, 2**10].  Maybe update it together, and also add
a kunit case and a note in the DAMON usage document?

Thanks,
Aveline Noir
