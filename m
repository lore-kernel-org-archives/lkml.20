Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921D253340
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876606; cv=pass; b=ja9oFuZvX6tZz2zvb/5uUBc321rihRGeoqyDP0Tr153qyCPp7KaBBr1KS6J2FxEqKPrMrQSQhIiumd900P8fQ7jEcPWFQGoEq2fEYmnjAi3eQZgtNJ4Zln8AUz+PPnqh1Knx9iFRSIj1r/RxmkskHZf/q4hB9sekL8nhXKeVDGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876606; c=relaxed/simple;
	bh=LMlaPCa3d/arWqeRwlC+t5cG3O6QIkmaLOfj2qxbG6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p00cgtCsGRrE1QuruxXogsGS0eN3xUSuadSOYNymU7vjdQPS/1ypaotvnvJCl4fFwdp4y7UDVGvo+sFV9KwOOw94c906lbkvZWP8SE8aOpqMmnXksKnpyMXrTyDxXefawWIEa7tz6tBDzWboipE/cmhkO4hMQlkBviQ252/hIo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=AiL9mRJC; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="AiL9mRJC"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-154e9d2d979so1776547c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791876604; cv=none;
        d=google.com; s=arc-20260327;
        b=mIHxOm0CKRz9FDnHaL7Ko5do44JD7ATZctZARSZMuuO3tVWpRHsoTVZLG3Kq1d9WeA
         hAhIpw/BPh9hM8OG1quXw9oQsabYv9CSwm1I+yiAzZ2bzvQdh27OqkvnRHWGchcnk6fJ
         wrAzovrVz7js1QUKkJ0omETWVtvTiT+qYLyaeGb9sS8DPTRiwGUHHfWZ6VFIDhKgMc1z
         0ScZupU10/5hPvesfohufCkTWSqmO0LkKPzuLOCmdUxHuaBEhX7gDMUh3urM8sO8z3qa
         tMsbLFSUO12cOBxcX910HhuFrIlrMGu5rwtfv+pHdvNtI6EnWcBp3xrNIEhLmW9945oP
         +xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tC8SBrxY9rjxL+sOaV51qeAfEaErpyiM6k+xmWhrmnM=;
        fh=vU2b18+BO4pzyAngDnaN6iJV/9+e4SO4RgpGCO4lZjg=;
        b=D7JJHymXyQSdy+JBRB1j9bGwnjSP2kxjSJNOG7SgbckFdCLSYplY7/NyOeEzxue5di
         vpgj/Z/Dl3FvDUV9DlMOmT5oPrnfCwCMq6DtjcUXmFqtUlZB1zHku7NsvqiRrqVueH5G
         HaaC2U6IO8YvaRoSlrTExPUQaTlOf6+OX+WHp6rrqs5+baUbRuiWVn5iITw9++LXigcs
         w8xpXa6YCMPyWQP8IrhRlHHLG+qnbQoZPDJTZfbNnCRagq9FbuyJS932zhirF55gUxlp
         RVe4Ah9CitmXQqGVt4QjEvnlCaBqRUuR+VyvFdK+vnE6CQd4egv0ayEaIJB8frjrpdRu
         3nKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1791876604; x=1792481404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tC8SBrxY9rjxL+sOaV51qeAfEaErpyiM6k+xmWhrmnM=;
        b=AiL9mRJCXWQwYZgE+5MoM/S/+uJyS0zvkq2vFUiijeRk0118mYdJjhowv3ClOsH12m
         I8isnGFv+FCZPo4p/QaqLLOiHwySQlH7LEKypcc75IqZulSlxeiYOHVQbmVCMpr0qVqt
         PcTBmhQ2/OW1/FN7J8tJxYdjuJe3vJnlI9qPo1xu5JJ0+1jUJ4yuOnGPKUeiAuii2mh7
         jeMCCBb3jUuZ2AxLzHwulaaxq+UQabRQy/eHUxGMJJBIHWyt0uWzIGO3NKBIK0wZ5hx2
         VJGmFhOTSgS+9y0FyEfzqXz8+xsHwR4w1Gs5NuRMl43T+Fi7kbYYaBIY4d3mp3y5SP89
         BS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876604; x=1792481404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tC8SBrxY9rjxL+sOaV51qeAfEaErpyiM6k+xmWhrmnM=;
        b=dANXwN0iQuip18cgnwDkeO9NspCsTZbP+dIVIWiKQw6knFi+XGo3m1iNGKgwZjcTZ9
         X9hGO5FeritChLnaVpCG/cgjPgvST6yc5ho9t/mdXkiCWxDKPEkrU1husdcSbxH4UPAA
         wYRX8okxeuGMOmugWfRlZJuJ1SAONIBrD7Eq/9IzFoRM0z8/dGQW7ZzN301zOonRdv5i
         0Yu1rkXC2Mj24mox+ZYaOj+6/2kyWmX6cKQDQu9yqlM9jOuwI56XphP52o18LozC35g9
         Lr8PDSzwJ9m0aBkwnzlZW7CDHe07qzGum2c3E7lxELmABipXsZARFIZRoAc6S8hd6APb
         Vr5A==
X-Forwarded-Encrypted: i=1; AKwUvBwePCzhSXb4VaRtbAMrIl8v+amuhLAjFgIdLe/NBylAD5BXn+0JbtZx8nln0o9UVW62tF5AQNn70mJ8jXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgC3vjZ1KBz2t6eDVG0F8eykVSYmeeRngb8/wBezhMhjY69UF3
	x4ZfhcbKYYn47ma/AcOh9JeLOe4S76qGr376J/RExV6j7UgAip4XV865WUkJHyZ1iX4zXnR9RVL
	C5DcbfWZKOCkwa9SAIOVZJ8w5yyiabxKnhfy27QmG9w==
X-Gm-Gg: AYBFou3obuApbqOj/i1Xm36QUPFIvZ/u6Eyjm4LZ/EnBQW4OqX1lT4hMP6ERZMVCJSB
	TPQknbZPg8VziMmDUcMwxa4WIwDvF7d3eKT0H6RsMrthgStQ6Po8GCW44fVQlavjK1EsEsL4Avs
	WkH2tJ7fTcI96EtaAxbyBFlSAiAgzpsgv+yvm1OZ1Qe9a9HKZUUvt9raySCRWEaH8RZLq4jTCzV
	GkKXSs7wnUJlejx7/dr5d+U4wONlHt1E+5iI1iZg9M0wBkUrEJZ7D8VFw584QbQmhNMaYNWaplC
	luUIcSuLFFH2wU4hkZONAMmWqqL/0KdCaZrphwXTzPFPz7Fnn/QrgxUxOqpXXpJdeQ==
X-Received: by 2002:a05:701b:42d3:20b0:156:d588:c881 with SMTP id
 a92af1059eb24-16a0adc14acmr16130258c88.2.1791876602347; Tue, 13 Oct 2026
 00:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911032905.63683-1-mingyu.he@shopee.com> <aqRXqcynCx88D2QK@linux.dev>
 <CAAoBcuS=sqOAPFr9Gda9aTwuCMHMPzBMEee8qvPNHtNxrRWKuw@mail.gmail.com> <asy_L2s1TNcN7bOK@linux.dev>
In-Reply-To: <asy_L2s1TNcN7bOK@linux.dev>
From: Mingyu He <mingyu.he@shopee.com>
Date: Tue, 13 Oct 2026 15:29:50 +0800
X-Gm-Features: AclHuK8tuWwzuYE6TAzFhuKrEA3w8k-lxLPcIe0Eb2-j98t5vXrnTNoFLto9mLE
Message-ID: <CAAoBcuS5VJwsYyw9=77SaBUf3N1hL8NfRtGwpBhmyUUhT4+T8w@mail.gmail.com>
Subject: Re: [PATCH] memcg: keep propagating stats updates to ancestors
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	littleswimmingwhale@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:08=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:

> Please share your custom in-kernel consumer. Let's not make changes in th=
e
> kernel for things which are not in upstreame kernel.

My custom kernel only has a few changes from upstream.
I just call mem_cgroup_flush_stats() and then call memcg_page_state() in
a kworker to judge whether to do a page cache shrinking.

> >   Regarding the BPF interface, the implementation in the tree I found i=
s:
> >
> >   __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
> >   {
> >           mem_cgroup_flush_stats(memcg);
>
> Let's make this force flush.

I am not sure what you mean. Do you mean that only change this bpf function=
 to
force flush, and keep memcg_rstat_updated unchanged?
If you mean that, I think this is a good approach.
But I think we also had better to add some comments to memcg_rstat_updated(=
)
to inform callers about this behavior ( maybe has a large data flush latenc=
y).

Thanks,
Runli
