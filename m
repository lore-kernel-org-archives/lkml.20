Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F64BA1F5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006856; cv=pass; b=KeNtln47FQQQOW19B57FIoziR3ILzk8DVXu20py8HdYuUAt8y2O98Y4FNuUzMiPfwnL86FT31tjRuaxrV3hk0kWKzzCKfSCkJqOTfd7IMftwEwizh5QYRN29rs3Ab7KHzpE1iwZEais4Lgt6T9H9iAzGgcggouY2CFmsgSTSsns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006856; c=relaxed/simple;
	bh=8U+Jq8fZFahjRXhXgyhKaNh5ZHD1oQFkV3wGoE2IZY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlpfKv8ULqc2p6JzPUnDujXSSIJOn7bVtJC4mw4F4+iG5vlLd0h8RO9QZwbSFh0bZTzAJ2qbVwYkstqE1rFpUfjsJfDSBSO/HR8UNuOS6KbEIo81N5HXYQ+SdUlBY+2+h3908kGgSS/ZzHwEM0yUdWkW1G/uDEPw4r3DPq3SCYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYYfbtD3; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYYfbtD3"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3147so2220750d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006854; cv=none;
        d=google.com; s=arc-20260327;
        b=iEt11Sce5V6vNu8UU5AD7yWt1HL8KSlfDXO6dJ+GqNars/AAwJBx6BuN5iMF1NLOwr
         8buOWqPG3FvmrOwoIiM9Ha3c0ZdQlLLRcXBqbGhm+8EQotRjzK+YiOsNrIB4l3zjl6Qh
         RqQNfP92lHQLqCoZRrB4EoXGJWNf+Xb7r+vPwhjp67JVBp+pZ91TnIAjEfg3xObAEWcr
         ebnXkNoB8xvjsehE/v72gHmmriByj5xr4g57rOaD+HTU4i040u8zheq/cuhtIT2YGdc9
         qY+e6BayROGQk0dHMwA24uYAGkFsB689PPAsdtUxwf+A7jGTm5sdbWu81mir1LZTLyyM
         IJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8U+Jq8fZFahjRXhXgyhKaNh5ZHD1oQFkV3wGoE2IZY4=;
        fh=ily61EF4bckQEbqwhtT6eHyFCmfDy7NfVvN0efQGKYI=;
        b=AXqb0WwU2dhAUOjfS2Q/Q+rp1QFfnG1L87eym3wBt53IsugUH+5YHbISNJEhs06PZ6
         YBHoo9+1InOfU/G+bTbrXk1vgu+pe3ce2Z0T/pMkRNCSi6iJmXZonVpbxTjYFVpI6EKB
         DAqmCAB8QGwqovq6gtXuVEn5wv3mfSoHD9d6ZrDPtRj+od4LjpFYOSAeG+oBV+XZhsh1
         /2KeQr/+93ic5/XcS5zcbGB23KO+C+cNs/RElEjtiPnY9fie6Gk/HxE9cJY9UOtyzBgo
         JroiDQspPxXFnq2LhBqVZjz1Vg92Lp3SQ/W5/yNO2HVv+gyENxFSDa+DTA9dBpQZ+xrd
         W00Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006854; x=1790611654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8U+Jq8fZFahjRXhXgyhKaNh5ZHD1oQFkV3wGoE2IZY4=;
        b=EYYfbtD3dV5+SV14zeQ9Wy/nYmH+E7XWarJbDpp1vKfzNRhKOwVSMHSQXcdVznjs6T
         jQ3cLaGkrE73u8mWkO9z3injieks5goluip64oH6W3vwbKE2yY3p7VVCTfya57RnY5FW
         JHdJ9fD100Z92T4b7gGnDMM3OwB3fRL1x39IdNsql5FiWrI4BIoaF209vCuMYkmbo3d9
         GI+1CWqDJmcy7WMuUXcFrqYkPiS1jLZFsLa6lWvkJY544mFxEBpN5J6QTU4DZ9mgbbPg
         wkSVVYxwVy8J8ERcNjdtAIoJTpEdyP4Wbc9fD9UqRLdAsyMb3dSdDIORykdXhEUqfKtM
         znpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006854; x=1790611654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U+Jq8fZFahjRXhXgyhKaNh5ZHD1oQFkV3wGoE2IZY4=;
        b=BhIpMJFUgqwMAYNX0/qKcGeZA/oVbRRQsrA1KW42WTbps79gkwelrXFeO9wfvBZ4XL
         OywTef5bdXOYbb4Bzg+rNTAXEndVOgFkzFokAc9b4NRIu7jZA8go/Uusq5EGj731y/o8
         METeRqndqKsm1asQ8ekMWIJjylWDceXy+mN5oH7n8I92XSueFxtpn9R8KY8Iz6rKAqA1
         uUbrZt4arTsdiEV0ef6mKL1jPKJrKtGgxzBHyu00i9RKQB4YBRefzqJIoRSWOAHvdwUV
         Jh9UxZPUpEXPEN6yzjhMZAkM6+5NrEK7vXtK60D3pIEaObeFo9GSjGHgfeoeOEE8xmq8
         Xd9g==
X-Forwarded-Encrypted: i=1; AKwUvBy/LbVc6m+jht5f22Y8H+cQGmBpVrnqtQo5qVNznjo9X7XUDWNqd1ijqBnnMIurpAoiweH3MSfl2+RXfTw=@vger.kernel.org
X-Gm-Message-State: AFuF++mIxVZ7jsPwb51cvjxXzI1DwP2FRRj0tBM5MOGAI9AwupgkkmMY
	u6HS+XckgDaqtZstwLoBvYWDBodJI86SXCuUB4XeUFaCk72+FxyuFxW1FXu3aNJ5blqh6Y9Q1Ji
	CpVH/exSRpw1pO2H7DZw60UBu+wztg0A=
X-Gm-Gg: AYBFou17IXTOkVcD8IPfwR+SvSjE+OilDqbonvhPUuaH2CTzuV9HFy3nDiiXQ8jmHtd
	j8RAd375jNpX+V1Crdtm/ySu90BLjCLEtOUlQVK0TqAiAWqil3qJUhO2iiFLAMeNOtO4GIT26Xf
	Jtt04WseGoRwm5OXIXNLrS1LYO8oUzmyrvhfng92ia0dW5LVWA9uQ0Or2+VA9otUwxRlGUqc3RD
	1eTtPTmUmLsMCKUIOubYyG2Cw9Zz2OIcl/U2/A5ypgcYhviN8rfe9TArChUyyPaxGGBu/QmcPvT
	JmyF3wrVNdU4aAciT4u0wmUA8iumEcyk9d1vVZVxX8621YeuVSnrsQUARhFDa0V+vxVk6LXjULK
	OZpR8t/LzF3yujVW+ezvh56J3EmC1cECMBlisO2k08Q==
X-Received: by 2002:a05:690e:128c:b0:66f:d9f8:dd29 with SMTP id
 956f58d0204a3-6717fdf95d6mr3615202d50.51.1790006854347; Mon, 21 Sep 2026
 09:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
In-Reply-To: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 21 Sep 2026 12:07:23 -0400
X-Gm-Features: AcwNN1WmkeWpi8m3H7d76vk_SIS_5wb-0CVhUhHUq4MeloT5gzQAsbG5yKchJ88
Message-ID: <CABBYNZK2fK_iPL3u5YC8msj853QeGgH1o2i=nPqDFKXMV9UVAw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Bluetooth: 6LoWPAN lifecycle fixes
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Marco Elver <elver@google.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cen,

On Mon, Sep 21, 2026 at 11:39=E2=80=AFAM Cen Zhang <zzzccc427@gmail.com> wr=
ote:
>
> 6LoWPAN shares L2CAP channels between connection setup, published peers
> and packet transmission, while teardown also schedules asynchronous
> cleanup. These paths currently disagree on when channel ownership, peer
> visibility and module lifetime end. The resulting failures range from
> leaked or unusable connections and peers surviving disable to transmit
> use-after-free and execution of unloaded module code.
>
> This series establishes a consistent ownership and teardown order across
> those paths. Shared L2CAP and workqueue changes provide the lifetime
> guarantees needed by the following 6LoWPAN changes, which make failed set=
up
> recoverable and stop users of a peer before releasing its resources.
> Keeping the changes together avoids fixing one lifetime while shortening
> another.
>
> The timer support adds one ordered workqueue per L2CAP connection and
> serializes that connection's channel timers.
>
> Assisted-by: LLM

Something suggests none of this was tested, as IPSP was never
mentioned once in this set.

--=20
Luiz Augusto von Dentz
