Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE2420486
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233123; cv=none; b=e1ppYo/5YXPGNwEYH2biF7BvqN6kFEI5M0Uo594DvExigWKSIuo7e5W/PBfilwodCN68Xwk0jV0r5CA1IkCbYzhHbSkkGCe+vpZFsugrOVHjEMGFU80vZTraZEcNXPLM4ewCUlGU2lwwTXlhUe6jk6zdjGVL10V0c+ykatZepMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233123; c=relaxed/simple;
	bh=YDBDQKWwTnfXU0lY2HCpNNJNi8Swti4bu6+n9ynRa3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKJ29/fFmwMxu8S5qEyV4/18aHmPVOH4VGG4qL/1mPmDbP/89sit55IGKhIJnTSplI0N3OHBt2oyzWtKGL6wVUGBHRddH6ndI1a712RVK1wWhFAAXOykgXD7QwIzrqEctjijwNmspSVMOQRuwVuXcix3SDsPAnnTYEPu7NU7Uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7f7cc52efso691280e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233110; x=1790837910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AsOD4kyt+hzzfCvEUTDpQS2kId2vwVUhayZZQ24X9EM=;
        b=nne7GBx3Pf4BPh3Qe6rd7soWVb5aGKivl7vrkTdU8RGotXTL102TMxYVoM6UuCa96+
         Lb+X+oSoc0tfnbUNLZxgQeh9fQgp0e9rRihRDHHt/3It/eq6GtOXNATNjbiuxe7KzJor
         r6cirN8yDdI5UkYDsVRUhD+xaeYAgcvPeTVBwXl8ethtSwjDSzU69mo0SnJ/zkLA6XoT
         VRw/D6Fy8jOxZ4KcSLR0paFahcIeBszEAAxZddAYdFSQxU/qqnCqyvQ/McPt0ShipXU4
         TZg8V6HLFCNwFke3pasKuBhSoFmC9oRppxFp51HDlpCEXrRhx6txYAv4u7dfYJLKH703
         4Z7w==
X-Forwarded-Encrypted: i=1; AKwUvBymjSsIC3DLVUoeMtIVo+YqgqDZrmsAHk8OOoG+Ghr/VN9OK1nQgACg09xbjohI4HvLWJ6YQYGJdTsVjmg=@vger.kernel.org
X-Gm-Message-State: AFuF++mih0YBy+ZvKfT60c+bCqEWqT66Z0Q4S52XGklK+0ewhZ6nkNHv
	jWllSB5fB3mGwxSTfv8o2AuXCmihhOSYCao8JcXY3qZPpZDoTzlF01IQdO6YCQdO7vs=
X-Gm-Gg: AYBFou22fp6OHeLeuQDJ6N5XHtCjV+EaNYmnIESmnlk3Vlryv7L3NA4jm5DcYLS/f/t
	MdbYgq1RBCOYv9PGknzrFfgHlVBCk3QSGUM7fK/hWWaOcnwCG/vAt5bCjzZZsCL2lLqXMcMS6rl
	nz6lrjbenfHgNyw2QbwrWpZDWQKK7yo6G4ts9etPloGyoOxqEdjleL8615fkDj3Z1luB3V278os
	ZR8mulOUEnWH/Xg/X8elr2Gwje6JPnAv4Xbr0wrYApqWexOrTWsX6t6qF+dEmw2UiUw04KQThNw
	EHQ/B41lJcBZ4C2bNa+nCbpPG1Dja9/f7FgqQBEHgJSCtEkhsexalSImLK/Dk87lDV8ZUe4S+fD
	OSJwrd7nhjiA6cTbgom3p0+cUFcyZKan9nFQ06sRxBz4OQES9q24hpPLywdPy2hVl3dgZ/Q9M6o
	IknmEFkGmKSIW61yQ6+WiZgsa4U8FUdRr/2Gfyeoq2AyZn+9LYmwHmlmiz6P1k0xsak2xlqHnDb
	7M1eNQBO4Mpi6fXbc00FPhKKwKRQ4ynpl0z
X-Received: by 2002:a05:6122:6602:b0:5c9:c60e:f4b8 with SMTP id 71dfb90a1353d-5cb0bd5fa84mr1048395e0c.22.1790233110239;
        Wed, 23 Sep 2026 23:58:30 -0700 (PDT)
Received: from mail-vs2-f13.google.com (mail-vs2-f13.google.com. [74.125.227.13])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7966sm6092749e0c.2.2026.09.23.23.58.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:58:30 -0700 (PDT)
Received: by mail-vs2-f13.google.com with SMTP id ada2fe7eead31-795a0ab5227so650214137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlzveUVL95hoOz2XzXQwBTb3xEUki1U3YT//ykgZjGQhs8wfTru4YRU3fcpXz4DWyPibpdhszNv2362Jo=@vger.kernel.org
X-Received: by 2002:a05:6102:6882:b0:7a7:19aa:f0d5 with SMTP id
 ada2fe7eead31-7af1f617c78mr814288137.34.1790233109776; Wed, 23 Sep 2026
 23:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
 <CAMuHMdXASe0VkAwaKedwA_4R3y9ob+n61JBVYODOEves62K_Fw@mail.gmail.com>
 <7d0497bd-3946-47e0-aba9-143e16ba2631@kernel.org> <202609231704.266C331@keescook>
In-Reply-To: <202609231704.266C331@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:58:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_wx4WND=di+eBmN0nPB0nnvHVOwteg1w7Qkxz=C8WmA@mail.gmail.com>
X-Gm-Features: AclHuK8tXqaMKPuAhaqhieCntJStySKV-kjaj8sQb60Som_2iWg0zcCafsFO45k
Message-ID: <CAMuHMdW_wx4WND=di+eBmN0nPB0nnvHVOwteg1w7Qkxz=C8WmA@mail.gmail.com>
Subject: Re: 2026 LF Technical Advisory Board election - call for candidates
To: Kees Cook <kees@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, tab-elections@lists.linux.dev, 
	tech-board-discuss@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ksummit@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Thu, 24 Sept 2026 at 02:05, Kees Cook <kees@kernel.org> wrote:
> On Fri, Sep 18, 2026 at 10:55:02AM +0200, David Hildenbrand (Arm) wrote:
> > >> The public minutes from TAB meetings can be found in this repository:
> > >>
> > >>     https://git.kernel.org/pub/scm/docs/tab/tab.git/
> > >
> > > No minutes since last election?
> >
> > Ugh, apparently Sasha uploaded the public notes since 2020, and nobody realized
> > that this task would have to be taken over once his term ended ...
> >
> > Thanks for raising that!
> >
> > @Dave: we need someone to upload the public notes. I'm knee deep in preparing
> > the eligible voters and don't have any capacity for that right now.
>
> I'll take this; should have it updated shortly...

Thanks, they have materialized.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
