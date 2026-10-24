Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792857048;
	b=SId/GAgxwMOUSZ1hkPQc53P2l1LR7eS6oooyFxPr8CoI/Bwzp82STtEMX3XYYQzrEyrR
	 Yt4Jg4CU9xOvWWBRobA9O85M4hiVtt2EwXQS1/6vF4rBDZMFrUG7vYEDzmuSp3W6btEpN
	 tmo+ANYT/oEbuq+MC2hofU7dH+NLCfoP9/THHUkj01BQF45dn/svwQ06sVEN5vRz3e+fd
	 6xmaTeL69rljtjdY/7vWoLJvgVWnwZFRFVYhIYqGvx4Xz6yIQ1xF1vA+QLAf/YMFg6reN
	 ikSSI4P09cwaTfmuJ9Zs2DAkB4f5WkubD/Osrxq5knPANMLZ8ClApUEwu7l43BNN1pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
	b=IzTYFTOduMG+m8ZxeM4avwWl7sBOVVIxl30i2xDC5ng5m61G4LGZaI4k7ko0JDquAqLN
	 xfEQpt5trZiKBOzN9iBX3Kda7nFPxIoC5p4dIuGD2CgPZ7xqKAupF69jQKHqKQtrXMSyl
	 lzb+t3mBXgCZH/ZFxqjwnCofYok52QqtFYLDwbelIbMRxvDgMOE8R966MV2XA3S3GtLV/
	 BzvsgFbMarWaWjfBdr77Fel1XrWkneBspaRDqio1mYOrYh/3Q+F0FZ/7FiQzAd9p+OFGY
	 /uLSnDyFYW8X6UXNoFUjGYmi6ansP+Ln4Rp6RbL75+t6W3DwF2wXwb5GBy5NlN9ijDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vox89apY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E3606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 205E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vox89apY
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c414e5d282eso198635066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792857046; cv=none;
        d=google.com; s=arc-20260327;
        b=TWEolK2GkTnjNOJr2qNXuEKKH2d5Hs8mwUFmGysIMONOvT8t1CYd09qmy7kPz+L2wg
         YbSvUjRHtyGv10/Ed3kTxvjezi9Gtd5elsfDbJdb8b7WKWDakYzE7w6B/GLfywyTR9BP
         bO1PBdMN30P0vemKM18VXmWYUrEBQzH7CRdbw8ew/K9rJWLhH18n03U6y4zZABHcRGSz
         XF9EGRxfe7IGalKYTUj0Hh651BSHK68l6khjkaWZUKXLcIdgIV6hoE4fpv4AQIeoXmKg
         7LCPv5KtsElpPuuwxMbDbbDspMiaUGLWZPMClHupgwQPg6ryMO8T5Bizs3zQyn7zsHSW
         +25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        fh=md6ON9+uA25Ktu4PpPPy/jHV4ZJUVSdrnUHtR0h+sYo=;
        b=C8hOGCMpcSZpMCn8eS0LxZ1YcZN+yAY6AoiGHEy1HpG0K2Bp3SZSrdvZK6Ii2nt8I7
         tTWdawCGwZZcfqbBgmmfYMIJy2FewcC2YV9nG7xon7B7WRy9z2Cbf2yvBF4iza/HeFSP
         EOaBSfnvY3XQ0v1L2hInjIVwGpcSbUWxL1465pRpAVJsYmr23Ue3ZEOLp1HUjfg/KDIb
         T1OHgZeIg1FU32YC+K8CRHBHzO0Pdjxp5l+P4esWkoIsdzLyenhbEAXRwiXmWvhzrzQL
         9rvkXbyu9c6kuWDREdYuxIWLE9nDb0/DBnJ1mDhqBoiw7GRlamBnVhT3yPTzt9OD7ALP
         IaGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792857046; x=1793461846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        b=Vox89apYKkxzNP74T2aNak5u22twqgjwpHPx+TqfYVI0UJWK006HQLjZkZctsylKGW
         OdyR809srohJ5Y3qGxuK2W8T/C2JGVFF353PRQN8LnBXRXizIFOonARk9qtHVMvZAL5Y
         907gpDI0XshwymoUI4HpatxHpTmFpZFhnzlNOtKKaW8hh6T5743QXiv+E2sAh2Shrv6C
         lov+NAcVRKcR1cDfGudqJQcrkBkoELFFnrj/qGBSSCxAicpRfuMbh9dHP6x881FjA0rg
         5IQcjVKVNaHZPgBEDGmaSbyODaFxyys81Djm4kb1xFPSiNjkAE2s+VWYDsJ1qyCJ4wCe
         E1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792857046; x=1793461846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        b=Dd4FdhsmJWD3gLyEr1TtvxdJdmEPRXb6wYftsKmmwSTgnVMOkVdL6+6LdjfOFKpwLz
         9lBDNbkd26m3s9//ArchNHRXl0B9FQiKESU6yX1++foS+3Ys/oc1YTXhsUa4GG+eyW9F
         BkkKp3vBOLYdD6OV//8P1Elelsg+1yR8RXPj7jqiYtHkSXtK43psKrave1eToQWYd5Me
         ysYiJVTmpt8PYWvMFMYjJvCl9ovhDHdFjPLnW0XDKDlWbx+1H4dhLmMO27eDEwjjHeZy
         em4de8+J30q8kpZRMsnxWyORMwYfzcPQ03GCzpJ3WSAWthx/bZHOaqxIqDST1ywJQxcn
         q3gw==
X-Forwarded-Encrypted: i=1; AKwUvBzuvC2I2lEX6uZc1d6PhoNP7P6k/WsL3oo6VpO8b0yYXqw5YfNu8/S+tcX+VuIRkQAAtq7Z4qiK061cJ3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZxB99ropReHhqDF7lHlHYUzEhDUxxZ0F9WM2O1r5jSErk74S5
	sPBYzLqmaX3H+/bKxJ+eTITi4KJKEGASiQ+kxj2uQo3iAsx5NxFV6jyLcDbbbSALlz4TDYxJxMN
	GTG2n3CKpLwnl+XrtRcitcni7sEVbEoU=
X-Gm-Gg: AYBFou1qr2HwrmC2Oa+Rje8Th0ID4gGgvCCBICpgwaruoCKC+JQDCSQFtq8U4NL/3bH
	/6i6w0z/oE/CUYCwzd+QQV4QMk9Ibxxkz4InDSeRlJ0Rc7ODQMiB0drjiwlh6/r0js/G9nXi8xJ
	25/cCa6/a+owRc58pPVxbR9/vk0a97PqhSYik1X4JEesxLlwxBbybSVrFbrZfFDUs4Pk51aySA6
	Xckkhf9WxlZc5PH/LZHZCeLO66LRPGI5VeDV9haC2+uOQ2SYgXJQuxRibcji4bMWueVm4oIsQJR
	NpTfIp6dgRS+Av2y8xSgA6IKB/O6P668ALGbhzFDZ8T+/7baQCFl4FL4K31CxaUNTJzE11WmtlK
	zBDIurT3/5mwMrNUO9LNqvjBS2dxp4Gu9l/dnH2qA/TGVC0QMy/MFNxc0S7Wkj+e6zlWtYwvqiA
	n/Eh7h90Yb8qeHl2c=
X-Received: by 2002:a17:907:3f1e:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c46bdd97c19mr234177866b.10.1792857046023; Sat, 24 Oct 2026
 08:50:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com> <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
In-Reply-To: <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 24 Oct 2026 23:50:09 +0800
X-Gm-Features: AclHuK8EdrvPlNQOkv86BcPqxKsSvjXgFWnjUR3jEYoufbz3bHhkuKrZQsexIF0
Message-ID: <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.com> wro=
te:
>
> On Fri, 2026-10-23 at 10:24 -0700, Nhat Pham wrote:
> >
> > * Swapoff: this was brought up as a request, but we ran out of time
> > before we could discuss the motivations and use cases behind them.
> > Folks interested, could you explain as a follow-up?
>
> This is one that I really don't understand.
>
> In my mind, we have vswap sitting as kind
> of a swap VFS between the rest of the system
> and the swap devices:
>
> +-------+     +------------+
> | vswap |-----| swap cache |
> +---+---+     +------------+
>     |
>     +----------+-----------+
>     |          |           |
> +---+---+  +---+---+   +---+---+
> | swap  |  | zswap |   | zram  |
> | file  |  |       |   |       |
> +-------+  +-------+   +-------+
>
> When a page is unmapped from userspace by the
> reclaim code, it goes into the swap cache.
>
> The vswap layer then decides where to store it
> at eviction time. This is configurable by userspace.
>
> If the zswap pool is shrunk, the vswap layer knows
> where to put the data next. There is no need to
> change page table entries to indicate that the
> data was moved from zswap to a swap file.
>
> If we decide to disable one of the backing swap
> devices, the vswap layer can just move the data
> into the swap cache, and the page reclaim code
> can evict it into a different backing store, if
> needed.

And in this case we want to disable vswap itself.

> Using vswap as a swap VFS would also allow us to
> get rid of the page table and tmpfs scanning
> code we have in swapoff today.
>
> In that model, I really do not understand what
> "swapoff vswap" means.

...

> What exactly do people want to accomplish here?

One thing is, to prevent page fault (minor), not sure if everyone is
aware, but a page fault itself is sometimes slower than swap IO /
compression (especially for compressed swap backend).

There are suggestions to use MADV from userspace, which is not really
maintainable when you have thousands of different, opaque and dynamic
workload, and that is very common for cloud providers.

I also hope there is a way to release swap metadata completely too.
e.g. for fs, you at least have umount, and can rmmod the fs itself
afterwards. We also have many ways to bypass the page cache. In cases
where a virtual layer is just a burden, we want raw physical swap, and
the ability to swap off that too.
