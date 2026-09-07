Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717A448B84
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772264; cv=pass; b=T0jwiztcUDOUhXUVRssD+J5DjJOTno8XD+VjLk5XEwIEe6eHXQd7AzCZAK6MzVOmOIwTzgqvrddPZJEe4qF0Td1eg+yx6r+GWDoFbLerllB26d2SVRRTfq6h3zsDi+hS5URnyBclE2xxs7Lmc5BU8MB9j2xs4Nct8EoJ6nXwP8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772264; c=relaxed/simple;
	bh=fkDYfnpB/82JHIHK2bH6lv7ogS/1WhtQkaZX/r3FBjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOQBQy2FaFFnMDd7EYBhqzMv5o0n7jVLZ+Bzp0veUB9RRmVsRHwjwQRGqt5aDqxdlu3PBxRkeMQbo+22joL+B7nv1x7JacDUyPy+/+DEy3YnWJ30lygCli+ZvVpCdNBRg71eqgknhsz4Jo8dOvGmyAv19yS+c3th5W7XNDcTIBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZSyLfjC; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZSyLfjC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so20676991cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788772261; cv=none;
        d=google.com; s=arc-20260327;
        b=OM0ObbhvFoh7e20+fcru8swfs4FL0cVmTLj1fQ+t7nPUPVjDGg+FflGmU74q0Slb2r
         pQpi6u6Ax47DzZeKBtWsjMqirvunJgBG7Zpo9+Ggfui2pF6avl+WKN30caVJnJto6//8
         LLa9cJawgr1dCQfjEaRWfBnYPBlk7RdRLw6U0ELHAqK36p3Y8WbzxE4bJGgZGjLaBOPv
         1585PdGxCf651gbmMi4RVT/xH1o4vpt5Z6iKZJSZZof9g+P1MEJnWwC/re7LPPWC3DEB
         IKTGf7trxPYvjjwQBEcaQwxs6Tf5sGZQcgLIkci7obC9wTzcOfVoR6/FYeFpgAlrna/t
         JsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UZwlo/PrjG/2W937OF/VpXOZ3P+Hd3ZS4n/JefxcXek=;
        fh=8DYZWIOYfcrl00VmEauf1KrY6sFuHJFXomCUqG3lCoE=;
        b=HKnVQyIiN7VKjVSx1GoZJ65UAMPo695GHEetRrwxNooAsftbyzADDBajHqM30EyifA
         xBJA3gYeBa4+E5jFJRZUmnfUOdvcIpGOTFbGnqh3wlKK0ovCwfNiBb9YyJ43q9whZ1rX
         orDcvaQsqwosTtcKC4FXXM0riNl3D8hGVmzI9/faGzrrQoqpqE9LkYyuqyXEoebYtOaK
         ZWbVBwbm2rzUfHPJTMLnJ146wPBIzCl7OthJlOX1PMpKpr6qqoEBSB3rfUsUieedTGzj
         8hKugo4B5/+8r1ucMcd9ShI0V9tgnmeupvlt+XL3k4bi4Cman2f9fgzpJEc95wCUHlx+
         bPlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772261; x=1789377061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZwlo/PrjG/2W937OF/VpXOZ3P+Hd3ZS4n/JefxcXek=;
        b=GZSyLfjCrVegqg/gPJuG0zFAHKqmZo1qu1/Ytjsrjh3Tjz3vlXiKyyFxzvuZ+GAC/7
         +8Ey0rVo5AQECc9oxG58xzzZiYBq5tjJgk8Fui1DQIHpOEsZDnIX9pu+jYXVUsV8n0Dw
         gCLH1af2pMp6OpVE0kCq4gANkygNUWN+OjDwh8rYdeA0+cLi37p/I5wmSeo1HikNDMg2
         6tqIeuoqjd0wKDP2TnXPkCNEkXkHRPh4WVCpvlCbAwWz7oaQCdXQnRYV57pax6det9Ik
         BqmpaxQCPHpsiaeQ5/Io68IAhVcPm98jFLQrzlImLoM0C6eMgLwLPxfsr8mx8hznakcW
         b+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772261; x=1789377061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZwlo/PrjG/2W937OF/VpXOZ3P+Hd3ZS4n/JefxcXek=;
        b=ZNxCH5UWvgYLmegzqRgq07o1EyfpO3voafA/Wq1a4G7VJt4sOHtz9Z8oyFleJZucWb
         +cT4HSTGb2dWO9qXD6ylFVmM60VmqNFsJ7dmc4fDeWtsi6D6V1fxdGP4XQ4KgkRJbglE
         2bP7HFTI0TvEdeiMMeGPMiwTlkLZO3DA491qfmdmvaWFUTdiRqd3k8Xf0HrB5OTtl1sC
         BZfIZsP/PnurtNue9V5+fFPh6uR81Zui1w/NGOrFNdp2NWw5FxC2S9ZfT9NZYf8FGEHR
         Qvi+tDwxUJJkcdcEFy1upP8Aaz01Kbvm/xyd0b58EsN3zI6pOAy7ckxa3Jb/mXYDLjHh
         VRMw==
X-Forwarded-Encrypted: i=1; AKwUvBzuasAnLZhti+QK7BF0yK9TZrY3CTz29QZ2L0YH8RFUCkoW2ktwQLTF8pfhx7T/2XFQ8QM9G495OavCIMI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBbOFMdWApb2T5855atzeAZfYjbY3Fw2XJvxid+q7MLE/dltQC
	at5h8DmG0zGlyYvHj+mINWlo3IwmrS5mItV7yVqpa0Q7MnbaHYYpfGAtFAe65e+/0zJh1jyqnKl
	Lt7pBXjdyojgP8ERmnd8+53VVMkF8jro=
X-Gm-Gg: AYBFou06Fl68YQ6gkz/bBxTr0wja8qvhrpyw+aw86cbp7IAhk43aak79uN5z2+xBOpw
	VuKALKY4K6fAsZVcmQGij3n8G8u5GE6+bvVQ4nPlkoUxgPpx8vIYDmqciiPQzyXPPCT8AspCtw7
	2En6OyVponrYlEHgLIe7U2y+iHi+eIlfFpVBKvEnOog0H2ecyy5hPGdIL6r4z+6fVxa8RM6yVlr
	LptU+4J1lilsSsjQAGy1sUbZJwXpYs/e3O5fYZn6s7Q3h+oyWpH08mBmkI9wgFLRGMLJ8bCFyBC
	NxVJIkQ+1OJ0oCI4zr+bx3PWC+jH+tMOUr09XlkWUVpFQlmSHD6qj4mWWXUKmCAzKUhvoPyhRl6
	f2Q==
X-Received: by 2002:a05:622a:e113:10b0:530:6f9f:d4b9 with SMTP id
 d75a77b69052e-5306f9fe2fbmr77998031cf.20.1788772261584; Mon, 07 Sep 2026
 02:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
 <60a8cf51-1493-4dbd-8779-8f007f6783a0@kernel.org> <CAEO-viHe6hZaJzS3mjKtA8sq=tnuQOp4a_u1D56tuFx69F3N2w@mail.gmail.com>
In-Reply-To: <CAEO-viHe6hZaJzS3mjKtA8sq=tnuQOp4a_u1D56tuFx69F3N2w@mail.gmail.com>
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
Date: Mon, 7 Sep 2026 12:10:50 +0300
X-Gm-Features: AcwNN1VHz2Dx5JOhnvUzjOQL5MbqPSr2rrgIgq7g1Q4-0tJN6hN6Ipr9L7HFBoU
Message-ID: <CAEO-viEyRBBWGzs1kDv7tdzYwuS4b75jm6abU5WcLN5iUD+54g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mm: minor janitorial style cleanups
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev, 
	osalvador@suse.de, ljs@kernel.org, hannes@cmpxchg.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, jannh@google.com, 
	pfalcato@suse.de, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, mhocko@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Vlastimil ,
Understood. Thanks for taking the time to explain the proper scope of the
checkpathc.pl. I will drop this patch and keep the tool strictly for new co=
de
submissions moving forward.


=CE=A3=CF=84=CE=B9=CF=82 =CE=94=CE=B5=CF=85 7 =CE=A3=CE=B5=CF=80 2026 =CF=
=83=CF=84=CE=B9=CF=82 11:58=E2=80=AF=CF=80.=CE=BC., =CE=BF/=CE=B7 Christos =
Skarlos
<christosskarlos.kernel@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> Hey Vlastimil ,
> Understood. Thanks for taking the time to explain the proper scope of the
> checkpathc.pl. I will drop this patch and keep the tool strictly for new =
code
> submissions moving forward.
>
> =CE=A3=CF=84=CE=B9=CF=82 =CE=94=CE=B5=CF=85 7 =CE=A3=CE=B5=CF=80 2026 =CF=
=83=CF=84=CE=B9=CF=82 10:44=E2=80=AF=CF=80.=CE=BC., =CE=BF/=CE=B7 Vlastimil=
 Babka (SUSE) <vbabka@kernel.org> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>>
>> On 9/5/26 20:31, Christos Skarlos wrote:
>> > This patch series resolves various coding style issues flagged by
>> > checkpatch.pl across mmap.c , vmscan.c and hugetlb.c.
>>
>> Checkpatch is meant for avoiding the issues when submitting new patches,=
 not
>> to be run on the existing code to generate fixes just for the checkpatch
>> issues. NAK
>>
>> > Changes in v2:
>> > - Restored filename comment at the top of mmap.c.
>> > - Restore <asm/...> headers in mmap.c as they are architecture-specifi=
c.
>> > - Remove blank lines above VMA_ITERATORS and NODEMASK_ALLOC declaratio=
ns.
>> > - Fixed commit message typos.
>> >
>> >
>> > Thanks for the thorough review and guidance. As a newcomer every
>> > feedback and advice is really valuable to my workflow.
>> >
>> > (Note: Apologies for the stray huge_memory.c patch included in v1 by
>> > accident; this v2 series correctly focuses strictly on mmap, vmscan, a=
nd hugetlb.)
>> >
>> > No functional changes are introduced.
>> >
>> > Christos Skarlos (3):
>> >   mm/mmap: fix various coding style warnings
>> >   mm/vmscan: fix various coding style warnings and errors
>> >   mm/hugetlb: fix various coding style warnings.
>> >
>> >  mm/hugetlb.c | 16 ++++++++++------
>> >  mm/mmap.c    | 12 +++++++-----
>> >  mm/vmscan.c  | 11 ++++++-----
>> >  3 files changed, 23 insertions(+), 16 deletions(-)
>> >
>>
