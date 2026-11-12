Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486841;
	b=EuYfJAdpYku1whgXKbSp9XjspJjfAThsSGXKNxRVuYl19S+n0n2ZsBe5ISsGWAHjcq6H
	 NzdTB+EsJqhUjf1yy9t+AYabRGl2Q6yc81sVBK4hJ1GxvjuR3jdzVLWsUukPH55yBID+/
	 pPIZZ/ssZAFHp1ck/OqZ7Da7Ay1VZL34uZBzZiFB0qBeL2/+3pCpAcuojGBelpS3OvTle
	 2j1LxLIYFnTZ4Ve4aEfHv3+i9zxOt4zKUk3iIQYwr+8cHY7Kv9zxXqWnCBmTGiyB3v8Ya
	 +2Z8D73htXKDHW7BWIAbOc4XBOvQdhh6rh9msgICfvwimb2NLFH7UXC0/ErcEhjhCBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nKmlHtAvoB0yUtbhRvNeCYmD52AQBw/3HL4TeYlZEfM=;
	b=40rgcJ6dOe9rwkuKsYom6LC0kb6uG++SJ7O2DZwSgHyb6bCONTFsH3U5YpilIFrIxzf4
	 C7Nvamc+Z4+QDaJQ2bOWh34BZOKs9GfEGYSwj4h+6AhzP6njX9s3agmVU1rrilgb6fdWq
	 KmEPT6zAJGrp2Mr3pUtVhNQSmwjHq4Ar+RYLyCJOwoZ4bFVZy9nAEMsL1vln02dllH1aC
	 b81o5GdT2WUhEwdBnZBeNRcMerSXJQiKMjaw7+qPPUa/wfyRwC6QfrS/y7rAL7KXryBGN
	 wqqFR7EHnyoLFfO4RBfc8wBHWlI7rvwht31DNUBg/ZekK8+XZt2AGa/AwtRtbQOPE/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukDlUA80;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDE6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukDlUA80
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so3906052f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:34:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486839; cv=none;
        d=google.com; s=arc-20260327;
        b=Js9QjWkvmx+h4nXUHSVMKmXoygU3WzpB2UNcnzDJAfNWz/HeV5lzffWy5NTVdN8WXO
         HebZWMy8CLIbWvRlm6hzZ5iqJAH1aN+uIhHCQBQkbBcmGJVQuk4Z+hgqz4Dv1EIkf2z8
         sbTVcsdE2GU24JGrmFy1VGd7yjf2VoTzmjP08N+NrSjQO2fq1SQpha+QAF0qM5oGvOEo
         Y6kRdHl/CKTHduu5KhDMiCwk7nyv2sqDZFVhqMU1h8cBp+XMa5ueeRYRhMrCX9ySSOhM
         qxYiJjG45GWm86ubO4FqYalNH/s1sXdyQdgEwhQAzVhIjm6rHtYP4QeoM/QBHqeeTFNv
         0I5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nKmlHtAvoB0yUtbhRvNeCYmD52AQBw/3HL4TeYlZEfM=;
        fh=xxio0uQdBa43KL99f9qHxAOMQlD7XhgQar1crupx9tE=;
        b=ApfZ8OzJ3T5J+ZegyOR1/14rIU+tk0+xQ2Rz6QOKOAeUdZnSgUW9vAPxzwh5l3016U
         C0njiuy3wNOVFuFsSCMMTZDnJ/ETbYw88L5XqMj0tx3zj/fkUsR1qf64vTyiFV5ddJqd
         FHJ7S4BallhnoynJMvSGIAHytqP7VuTn92trEP9ah1FZAylUu7EI72Qbymq2aUhroXDd
         q2/d9wU9QGa6GaS1Kr5/5xPGwTYv8Wfmh99Z2swuLN5Ilb38wpnOqX578gKymq43inXG
         v6qyTnz/BPB90a4Hmno+exjQSZ19ZCg94tFrV8b8BTeW7EG6pC25UOJWecgTCh/L02p2
         0pCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486839; x=1795091639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKmlHtAvoB0yUtbhRvNeCYmD52AQBw/3HL4TeYlZEfM=;
        b=ukDlUA80+m/vZiV/Ig5PjyV4dpsLQJVhgoByqqX7Na9XtPRe96KKXgb2FAld3B5vxD
         7o7gfyFGeLIu/DFnp89aiUdKjvy8Zq0qFDCcxIwKrdBasaQYYVPWRCWXYt0+VtbUBXeO
         XMauR/2pmRNb0HqxiNROjPKs3GsqcbRyr8Z9488y1RJhXHYKOBALi+wz7wYiv/AHcxtX
         /DQ7dm064H/WLAsFXzKl3piUg5KbukdCRuFLVXxO3JQdsw1VEV47FQFWRBZNB/4rOWs1
         //V3d+Q2UcDrxr5nvPd99RmB9dBOwGrgEtKy74YkGOob3GjE0C4aVgdV7Uc4x62Yn7l5
         4d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486839; x=1795091639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKmlHtAvoB0yUtbhRvNeCYmD52AQBw/3HL4TeYlZEfM=;
        b=1numEdgONVrG2TufMoxZSRfRaWuX+drZaB0vRXq0Igv4vHcBhJAbK5uZi/FuXcQzlF
         5+bmpVKlLmUdpWC3lNNnCQIivIjnjVAzrW5qLLDSSexkCFzZ6Qn2NoAE4niW6iyiCGlr
         DWA+UfdX2wUMwYSGG/IJMPUg2Pqf19Zp7/bJfVYzsUYN6vOZ1OotDXpIX2YFtRzyzL8p
         xevD8pZkxjuA1zDqttO3aqoUCnr7Bk28FdWXbgaiLogPFvueKflWHoTeg9eWjSPGLLpZ
         u26Zg4Czx7cYYIza1M2oyRI5cs4ghpulAYFsnktdxh6l2PsXt7Ut7L6YU3cOzAavuYno
         TH8A==
X-Forwarded-Encrypted: i=1; AL+hErF3Jp+6DgTWQwbknjSdVoRr2yGG8L4l2v2SmKjJ58/oCNGQwpMXq9TBO1WzjNw6Vl+m55Wxu64YKZIFjOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6vwYRi4sjFi3tlGVXxI3PC3j+9sTRoRXqToXm1LqWsYXGotK
	EaingCiOezo0OxOy8J3LcXpBnnp7cEQBrVqlWy1oTNC4Qhc4OBV9D3ceZdYG7U1SiquoBt9g6hl
	uIliRXkxEdW9FjhQ+kuinpspMphf9Qc4=
X-Gm-Gg: AYBFou3qMq10psZJs5+XxtG3q8f/B9pyD5cYiK+ta7mZ+tOUBJdXd3D/pJ0WWgheJlT
	BrUg+pXlCr/C9bIlYoqT0WorHnOrRQeqSz/yiggXp0zFD/jUUgHnWxUnbupl06zsSDdRnx8qJiC
	D8qNNq3pO0qz9D/S89f5iBxGlwjLhTIsz7hrEXVpwJkhooGBIS47diC6x1/Igjqsy47uJqyZtnk
	mvWmKDaHd5/JgvmyQ53nou5FIyAfiJc3OeFFvl6CbKlq5pYZkA5U7k51QJdE6jbiBa9AfDQORxF
	hCRR8dkzdgVxf5a3HF9JBIpY3iC4zNOiQ9Cu23ajxqLFhchlF67s4O84XWH/a4SbQkNhP7ToEZx
	frSiJYoiueYkx9zg5WVGZWi7nJjaiUPVu4VzVYQON/BlWiR+e7oY/NBFoP2xX34diqUDv4GMDdf
	oJw7tlcT301pzc2NhNbbImy0iv+qUdngbrgFbR7hPUE51Oek++wa+KVJgnijek547PpePkf3hNu
	g==
X-Received: by 2002:a05:6000:4310:b0:48e:870:7791 with SMTP id
 ffacd0b85a97d-499c6e96824mr9018890f8f.26.1794486839273; Thu, 12 Nov 2026
 04:33:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org> <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Nov 2026 05:33:47 -0700
X-Gm-Features: AclHuK_RzWviJR9jmvlK9oBAFygOMVFIIWMHi8nCFGJAgeBhxOkAfyb2dvI3XUA
Message-ID: <CAKEwX=N-YqgrZTpoxLoKYTnxT2QR4Z4_ohw+SBR+M7CErBDbOA@mail.gmail.com>
Subject: Re: [PATCH 03/13] mm: cachestat: restart the walk after each entry
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	David Rientjes <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Balbir Singh <balbirs@nvidia.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>, 
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:14=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> From: Chris Mason <mason@kernel.org>
>
> cachestat() can leave cached pages out of its counts. This happens if
> the entry that the call has just counted is replaced by a larger folio
> that starts in the same XArray slot.
>
> The issue is that filemap_cachestat() walks the page cache under the RCU
> read lock, so racing concurrent collapse/split is possible.
>
> Thus, an entry can be replaced immediately after the walk has returned
> it. When that happens, the next xas_find() skips the sibling entries that
> point to the slot of that entry, since ordinarily they belong to that
> entry.
>
> However a concurrent collapse_file() or __filemap_add_folio() (when
> replacing a shadow entry) can store a larger folio in the slot, in which
> case the sibling entries belong to the new folio and the walk still skips
> them.
>
> Consider:
>
>     cachestat                         collapse
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D                         =3D=3D=3D=3D=3D=
=3D=3D=3D
>     count a 64-page folio in slot 8
>                                       store a 512-page folio in slot 8,
>                                       with sibling entries in slots 9-15
>     xas_find() starts at slot 8
>     and skips slots 9-15
>       /* 448 pages are never counted */
>
> Also consider:
>
>     filemap_cachestat()                  __filemap_add_folio()
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     counts the shadow entry in slot 0
>                                          slot 0: a folio of 32 pages
>                                          slots 1-31: siblings of slot 0
>     xas_find() skips slots 1-31
>       /* 31 pages are never counted */
>
> Essentially the fact that large folios might be present means we cannot
> safely continue the XArray walk, and must reset the iterator each time.

Hmmm, cachestat is inherently racy, for performance's sake.

OTOH, it does seem a bit silly to undercount purely because we race
with an operation that does not change the answer (collapse/split).

Johannes, how do you feel about this tradeoff?
