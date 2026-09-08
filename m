Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DB582B93
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885945; cv=pass; b=q7AwWHGl716BcOFAo0YL9Nk05OpcPAXW5MC0QVhc1lWeRmGrE3br7r3ecyudNMEwpV8dy8Xvn4Ox2oLQ+kvXmeFG5pDJj7zI4r0K8RR9wX7+SFmeoj8ryDfHOmpgtEWA9vWKjtHAzzHgDGN36e2lVZ5CWLxKEzF0gd8AcVKCJk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885945; c=relaxed/simple;
	bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfPLwAPRrs3gjaXPOsoLTKfxna6srNWF8Sb6yXo1cbEleUyyz41qILVYpi7pTpMJtk7OcugNGT+6edKcrSLXGuF7qSR/3St3QSHyn8vcJLvujCuiXhCif29uW862LUtlqWtFEzynHcvVycyLCJvZwfyEY5D5BggtZEDa6TJgck4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jivIW1l8; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jivIW1l8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dd6ee390so5556933f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885942; cv=none;
        d=google.com; s=arc-20260327;
        b=VKFnly2Jwn5FWG/6PaEMburjPvuXg+5yicWKnvNmiest601ncdkInY31V074K4gHWQ
         7PvRvUm9nDzqMDOAXodKpYqX4Grz4fDqiamo0/hv8BWu1VKoJ1NVsXfN1/VkrAVzirH+
         yMAppjyHN3gjUxk2b1cAS9RRYY5F3Bb4oCo89ZqkOa4ivCPLPGDBBrDZ7Tl/kFDKyqTg
         cXzCwuVtIQBJpwS3eVkO49H9x0g71CXlog54vIePCdX5oHCbqIsE03UjxVWIVDGcToo5
         FuBpJ8Jxw3Rjp0oVoI+TE/2mQCC4CrMKUIgR/mttVs2NPRErHssDE0STljwTkL9Un9OC
         D9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        fh=uMp3hs6VP6BsuxNZbimaJ+8uB005/PNj+l8LrwyB1TY=;
        b=qf3RL5sMuLlgc4XcVGIGbCHAvG2QpbN2V3KpYmWTkMe7rtQ3RJSKAM6ugIpQ/gUEFQ
         G25wanbgf9Nbm/1ok7OU/9jW3rLDTkSsOb5ltwn3P0bjC3/dgiLqJI3l1UKOo4fKU741
         cNstu9NJTp6rlPjZ07Nm0ZODfDFqWDN+ls5jVHJ2xhDSzen2feCo3n1lkf1SItjEu+0K
         RXoV2kfhMaX558onHI7QpgcdCM9bDfFMgFlQSN5TETicZPzW3PqrNcJ4iTTqbz8nhxXm
         BnKz2vG3jEDJfdrRh7GCZxNlC7X4+WKn3yZEMstCYMcTeuBTDbSGyclfRaip93N0gLIg
         2Yhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885942; x=1789490742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        b=jivIW1l8eDX8dT2akCqSRvFMHOK8/VvbyxR8aZJastkAAsRb0YC33lL8EB7FTKsjlo
         ipY7YN87/NSa4BMS/bQ93UNp/M/SR5lEXE//cVWGfTKTXjPyQ8QaPH9LI1+FcNdeqCp/
         oMK6sDLlc15tYdB1QHWmL7V73WGodJv2K9wH54p1R6pNPUb2795sH355wlIr0jTPZKeJ
         roznixBw1XdPcpZChiTgThuKtk9YpRr0SuyOHJhQ36qXaSX5aTtphoJDkjttmMDrC9MO
         4ZyFHu/wP5SV8lGJ4d1vnD9Mf5ci6tlYZD2QFRBU+fs3fjHL5JUZGFuSXX8PkW3i1FdI
         IjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885942; x=1789490742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        b=ZUD0KMd1PdECEQmFrRPqtdMcp3N8OA08C+41TMOZnXy7GSpdbJDKfb2MFm+e6eVDcC
         GgP1fZiezGhpd2F3u0t3adMghixEatT4DvvRN/l1i3d++iQ5HiQyFxaD8qjSS+bqc5Gy
         8uefz3GvqYIcLUrn+YU8TbQFAwSFiJoykNGgPVv5K7+ZJrGAqt+UgAPQ0bpOpF6XoAeG
         fugCd467japPX6lu0D2ppFj2Ou1bFEATT7q0lxeZkQ00SPGsx/n9cCEtI9WdOxzl509P
         8sfOjWAcUlbqZ+r6fCK6NT08UsGPr2MrN6/2zItvr9dDlDe2Fpo4mIgOStEvcHPfDyvn
         j8tw==
X-Forwarded-Encrypted: i=1; AKwUvByyvT25Wr3CE7QQmp6Jx4Wtd1SKZvtNQI1j5wI6Ym6Bd89QjasuEscdNnYFrkEivW2zby+EpQNfszw7a+s=@vger.kernel.org
X-Gm-Message-State: AFuF++mndVZMvY6E1zjWdW5E2nmT+rlu68+TqsKDIJrdPoBFgDtJsE89
	eZ2hNJsZ4mzwPsIWuU+oPrgyEy4l61gILxXTqydzlQ3uXhjf+lyypZWa67em/AHepIZpXQQtJW2
	SKEeBE9e9uM2kStaBCeOqxAPsBERACs0=
X-Gm-Gg: AYBFou3swRQAsiKWO76Pcdk3maadvGsLbBaGJFBUcOo1+wupR0LUq9Td9a+H+t0zucK
	YOlMc5EfngHHDqwRKefJnFbRydXjQNnhaNW0ZNN4fW5g7RdJrMFM4xlO5LIV+oTk3EAW2SOg91a
	nize03WyUFX80Ni8VXCaDkksfFanMNk4hbXyVAUOW8b6ntupLPBMkWsiA2T1YuSECZkfj9T5dFD
	c/z27JtJ5MOrS3gxKm40kK9EZ75r58LoKaEP+fNxVaWTIjsdIMTClEcYiJNV+pz1D8pRlxABrwY
	Yiat9IpazGyU68yzIdbjvsZiL/szMpwDS77AHPgSi597U1GlxG40u65ca3jMowJ6XamKDS69HDr
	B
X-Received: by 2002:a05:6000:288e:b0:485:8c16:a33f with SMTP id
 ffacd0b85a97d-4858c16a5d0mr27884309f8f.52.1788885941502; Tue, 08 Sep 2026
 09:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
In-Reply-To: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Sep 2026 09:45:29 -0700
X-Gm-Features: AcwNN1VKHJXv7OJIvb-6r4VRgrNUVYMe2NFk6RQyVFERhDXV76DkbFan7U8qPdI
Message-ID: <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:30=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/4/26 23:14, Nhat Pham wrote:
>
> Hi,
>
> > To Kairui, Johannes, Yosry, Chris, David, Andrew, and other (z)swap fol=
ks -
> > I need some help here.
>
> I'll mostly ignore swap-related stuff because (a) -EBUSY and (b) we have =
quite
> some swap experts around :)
>
> Reading below, I do wonder if the swap subsystem needs some more coordina=
tion
> and collaboration?
>
> For example, maybe having bi-weekly/monthly meetings to get everybody ali=
gned
> and uptodate could be something reasonable?
>
> This approach has proven fairly helpful in areas where (1) multiple compa=
nies
> are involved (2) many concurrent development is happening, and (3) people=
 have
> different priorities and requirements.
>
> Is there already something like that to organize development? Should we g=
et
> started with that?

Hi David!

Thank you for your suggestions :) More collaboration and communication
is definitely needed here. Conference is a good place for this, but
it's not something we can do very frequently, and many folks could not
attend (visa issues, etc.).

A bi-weekly/monthly series of meetings sound very appealing. Swap
contributors are very spread out (China, NorAm, Europe, etc.), so
coordination will be tricky, but let us figure out something.
