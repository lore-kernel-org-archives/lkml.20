Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242579;
	b=Wd/7LO8/ZBB8d6ABBaIAi2y/9FbA96lAoNjgv/FhY2Hqs0ks3KeRqSQrp/5Rqe9VvzuO
	 +gNO1Sk560k640M1o2S3rzRuvK21HXN9NzAtgOjdSf3ViFwVYzPskU/U9SxHpM/ch2kxc
	 GojRpq4Nv7OGVD0sSgeWgYFYIdgVvuM+Kt5kaE3MXbjrmzI8Yl+bsd9V6ZU7tsk5O2TgV
	 9HL8ZBZXvyudmZnupijxW+T2FkCeg/Nl1IfPW5dMDVSq2n8ZecsiOuzzPG4t/6SwsKHVw
	 i8jBEvn4P0aUJpNUJRj+1VSl3qKb49Oas6fa/KFUmhFiR0TWuarLNsjcaV18AC96mKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
	b=N+jlm3n5PPlApJcSELeaeEgHlZPrYVhaKQo84gGIY+mwgQtELkTCQmpGz4QOiMUobSP+
	 TthbH2nbwEZtQV0pVa9W/1/D5KkgMzyVJrNZI4RnP0h9M2s48tf/MHbNPzhg9dXUSSq5X
	 ASsT//gE6kkZC4csUqP1JyogK5k/rg0V6hR2VVmcNe8Ccqivcgvk6q2li+tYw8mY4+D8C
	 l5CPAc313SpXcEZtVCVy5wXn74/uaPHWqFMGWIXxNs0REmt6+6NOBf989WgdLfpD6A/GI
	 9k8/BIYxxRgZkLhVlkZmI4QwqVc5mph4GbOHlburtpUILEwLr+L/P/deQKmNRvuLtNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Cx+s5D8P;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F30606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Cx+s5D8P
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c151178f0cso703858e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794242576; x=1794847376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
        b=Cx+s5D8PWndqfiYd7qPI21ly3YkjPJeojS1Yd/AIQimTwbC5s2IrtIMnZKkMVuJlQ7
         ChZGkQ63IsItUThjEUwAsnEVA8hkSq/IVxI0OhIkiqNFJdktJaD1fmaoN/MPL1bY/NzT
         0yZbQ4FB1WVkXV3ENIscUCFRxl+SgjfUBXSd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242576; x=1794847376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hck20NyvBqj3Ac8MLVTjPeq6/3Z/Gw267omoUWkMKcU=;
        b=jAX1V+NTQsTR6vkhYVS8p55ug2XyNMmjl94v6+B8nWav11tvCbqnkZ647cITK/mF9l
         LGbhXY3A9jo9J5AJxQ/q6cDHCTy0RrqV6G31p2d/oqxdP1tiIRmHb11Nc4sdS6ySR9wE
         xhE7YjOywXtVEpC6u9jUVvsrSjVK+y2ReL26Ljjfcb/oJz9L+weFEs4CaBLnTEE+1WZZ
         zZUzkB26LlglbcIgbsqnlCmj6BO7DYMTsNxJ23euF/+gt+mskq1G0InLIOPZWVu+/e0z
         BPsGtKwHGLrMrMDxLUs85kDCsCK60sH8bZqhkrBfTKr/6mB4vxT/YIHb+XNBZO+mKhWJ
         SIUA==
X-Forwarded-Encrypted: i=1; AL+hErGmPau1Nlnv3LWoTnXFXDA77u5GNGtV5LyMw73nnNd1Rx1s/6HZDVJy8nXTCD/JmW/iDvFZHZpLV3Gb4no=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xjcDKrW76Zf8WYlJO0myT8AQZ3/lc5wLKuXzCfxljyZ1JntyW
	0I0UqKFwwon7iM2KvSzx8IGJpkJhbb/D6HrlwWKFHKwPiXiJHddfeXQ2wdzQQFCooRIlmWW14MQ
	G65Ev97jbwA==
X-Gm-Gg: AYBFou3E+WIQF5faflp71IjZWq3NvwAzak7TfZ4InOAI94f9W4g0UhYcPnVtDfnlHdK
	6Tu7yIBPYmYRZsxtBFXQqWelZa2/uuL9/Bkq8ZJr/BrE5VFlPQ36cBukRom/QDIT3hri7vp98Wj
	Ku/ocz503QWODnxyQsqyiN2cYL8kuP9FocZ1xfCJe6HqvPDd3zkMvz53mMNaGTP0U5a/5MhUq0I
	ZCKOwItoqfpSD6YYVSpQC6So8tVUqQIuVUdLvhyczv7TmaJayT9i8oiBGm2qItQOUe4rtcNaNU4
	p7c03Hqy3IadvXwxFBT+NtqWsPO6w83oLf4OYAW0Y7fzZtdJ6y4HHjswO4FU5uI+uG/TXzbUnzA
	IKaVE+0gZ+IFE0KmQH2ZfwitEnmSS0F4XnUYC7ZiZhQoeILN4MzmSXtzqtg8I490PZkdOwK3gq0
	a6ztDyp5dbCBz+q7QJJioEuxVOeYq2O1VMImVNK2tmLjBdtLh9xcAkED+G7GXGNF65NcIpMxvDa
	+d0eZGu4uBM5oFqgSdaJawNdQoljPBRee2btgyAVnVRAVnhokDorRq6IFvPI17gl0iyNWbxwzNs
	tmYHXYs0pfaND555eMc1dcqpQb6nDoA1ZX/x8mghNbT5bRR6idaCGaxswd0q5IEJnqHya07LRMN
	2J/wR/A==
X-Received: by 2002:a05:6512:31c2:b0:5c1:4dbb:9ff8 with SMTP id 2adb3069b0e04-5c14dbba11dmr1209162e87.43.1794242576275;
        Mon, 09 Nov 2026 08:42:56 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b75acb9sm1038881e87.7.2026.11.09.08.42.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:42:55 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab53a99771so9114071fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEoLkJxbSrum90d2OGUzy2iXiMdzuMnqh2wLJSJASChKL/aYOFZOfQyQy5nOOE06UpbpAtsETNDZWhT1Hw=@vger.kernel.org
X-Received: by 2002:a17:907:9303:b0:c41:a5da:1511 with SMTP id
 a640c23a62f3a-c4d6d58b94dmr324648266b.25.1794242121304; Mon, 09 Nov 2026
 08:35:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-4-kas@kernel.org>
 <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org> <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
In-Reply-To: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 08:35:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whhp=Q8qR+wPoM9+mxYPQ_OXMOEoKmT7J0JZikFZusuqw@mail.gmail.com>
X-Gm-Features: AclHuK9Zg1YgOX8tZrGKznWYWBoZxGMj9dsb1Z1k4ney-3EhDZHB_lO5ezPS7Ak
Message-ID: <CAHk-=whhp=Q8qR+wPoM9+mxYPQ_OXMOEoKmT7J0JZikFZusuqw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/18] fuse: don't move a folio with PG_rcu_free
 into a fuse file
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 9 Nov 2026 at 06:46, David Hildenbrand (Arm) <david@kernel.org> wrote:
> >
> > Could we get rid of fuse_try_move_folio() entirely?
>
> Please. That would be great.

.. and in a similar vein, we should get rid of splice doing the same entirely.

Kirly's patch to just remove page_cache_pipe_buf_try_steal() entirely
(ok, it was originally mine, but Kiryl took ownership of that series:
"Tag, you're it") is worth doing, but I think worth doubling down on.
I think we sh ould just get rid of 'try_steal' entirely. I don't think
anybody really uses it. I think it exists in fuse and in the virtio
console, and neither is worth it.

Removing pipe_buf_try_steal() would basically remove all of
fuse_try_move_folio().

Conversely, removing fuse_try_move_folio() would make
pipe_buf_try_steal() even less useful than it is now.

Just remove them both. Good riddance.

                 Linus
