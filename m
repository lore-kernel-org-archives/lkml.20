Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336991;
	b=cy0diLh/AaCC3Y/W6edqajb3fleUe1CBCgwbTJSBy5JiW0FIMER45r94rTkBB8P2en3F
	 a+1+zGMOG4jhh/vtxXdgdZsmU0LGFBgXBzh/vn95ezMqNrqv19FbxkWgyhWFUDtvicEuz
	 It97UxQoxU8gX8DcT27zy9NVv1OCyKBXe00dKtssDKdEZOKXGqcUSqNikeFyDkQwbawwq
	 TpgjdgCQ8G1DWKSDGGvsbF/2eGEoA9V9l57HaGmf6gyyvpyFEuEteuEqPELJ9DTrVoC8g
	 jh3I6HZL9hrdyZw/zo8mJCEs5lrFhVYl8wAcLkPNIKnyUZtVMwW5FaRnWLOYjFgJLcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
	b=zAmfihTFyaGec715hn4S3+UYIoeB1RfmPGvnDt6cuw4eGXQMLLGUw9eZiIM+oCTHlKoQ
	 Lt1THzp+vtcDtYdqH8jnFcsffMOYW3v+IVi/mpSYKS2Ht1KF1Ks26IYhBsA6CiB1cHEV0
	 HS+DZLhaPcGJxDDiWWsVMTJ3UXLNn0mNfLQcycf5Xk3pVb0grBawBE5xDK/HoawkaTZx4
	 xA/14E8pqD4R+5oCSn5D7+L2ustL7kAAGD+PQlaAwOOaqG3wt879FNXP0ZdUzDxfYQSM1
	 H+KLgDxs+TeaNu27jKu27OPK3/t29hEMerbK7Roqfgtu+DadhWkaryQZZy85SEkLDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EQjWlEJU;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C57C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EQjWlEJU
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1186132b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336990; x=1794941790; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
        b=EQjWlEJUTqlvye1bZ+asbnnQFPH4ejxzuEM2f296OL9owhnNQy78horLu34TH42Na8
         zbbjjim2s9YDMKlvERFXkEOfsjOBG4QU8ZC/vwzGPh5W199pxwr4yjhI+MnJg4pn5jkK
         PbzehPQM4G3nMyOxJVf2i2wBP71w5DFcV23m4791KCLy5Td9v9zfgcLll/QOBChumv0P
         XUZ2Gx1RuRQBIARaj0hh93NS2X1sppCBXz0tBj5SeGTIAS+TBqHIg0zt7Y9OyADXgniN
         5RtULOmYcIIXYBOm7cOJFX88LvezrB+xjLoa6OYo+Nz60GmKrvi3Qa6bQagNkCnnYCim
         NcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336990; x=1794941790;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
        b=eVPNY7BkvxYYWcJ0bx2X+UFD1g76vER0CHbLfI96qsgDl/joykYNK2hlDXDT0gq0um
         I5lG4oOOli25ygVHYNCbLASSCioeePhPE/DMQsTGHCPkXPRbgCNc36JmdycjcqR2PAr5
         xZJPOxWYjLs8bOfc9LrvscMqIRTK8rAy8CgJd8g3yHma5aHAm8eOdYNcf6RX8meA5e01
         SpIpGhQ4hfeXXUpC8QcrG+I/Dh9+BSf5+zHkHKnPajuPnghlL4rj+scS/ApPdlZIHjaG
         bJv2557x5vW397ZhR/SlaGatyvre5Z0hC/n5XzuVNRYqr2EhJoQdIGInC8NEp97x7XhJ
         IxlA==
X-Forwarded-Encrypted: i=1; AL+hErGtjgFrJNP5GzX30S3Tf4ZfmMr46JYb/eedVv/Yw1TlmhQc+f9fYhZ2GT/xnRvFEoUdFNrI0xX8HCKZjFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2tvBNSpLT1KVRHdVg948uox0abwg/5VwgI2x4K0CiCLqXwvJ0
	WKEMmPvEJzhZOiNO5V4s5pqJZX3wJkMR7VuY+6q+MAiPNaz1Umx2epkTqQlbPM8JWQ==
X-Gm-Gg: AYBFou2d8TCuOk4JxIece63hyRiVlmA6Xc/RFT3N/4Ue9vg8a6RfISDP38Aty77FBqE
	zszsNytnPRNS++M3O5Y1d9DMFIO0EBf8hTqlX8CmyBanCjDu+RIRO6Mkm2dQ+ZjpbLroXsBfXHd
	ZebGQGgIqEJ3kxpEj95fZUnVr70ZjQDPBeZe+E0u8oud3kDkkN2LKIeFX1938jY4enFUt9q9Wgm
	cQMYyOUoQtLc8P5U98EhFKxE8CqocOqCuItASqNOymS3eBc2hBSjfN+tVdZDW6xxJclz94zw3Ga
	YXj3N9LexM4RVnG/wHuTYYG93zv+fKG0gWhtOT8ySdv69TBHqT1ysPpVlMa+ELoPFIWbl9xYc9V
	FBltxdL8AZ3GEN+irKg+hQ7UIte2/Rg5tKtnYMjvs4GW3CGHmRzx14jK+FU59HtEF7lFa185W30
	+o8k7kxkvXIc7Xu6jMQqBZzcYA+5tlSaj7axZWU3XOmN+J54cMaS81HN/zm2HhR9vHhvBHG14rz
	3q3HxikVluLPax7QDRwplKt/TTIGHDOKo0K07qb7y79D3PQvCiuJTCJaeF1Y659tFET8xd1pfj1
	/J/pK7hP/elycMSouEX3YZ40KXa78iPNcnDLqAVGJNZZJ8o9BZF6TV8x5NZPrDa/
X-Received: by 2002:a05:6a00:2349:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8bc1b6feb8bmr5444b3a.16.1794336989281;
        Tue, 10 Nov 2026 10:56:29 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab21835fsm1302972b3a.42.2026.11.10.10.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:56:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:56:26 -0800
Message-Id: <DMRRDJZ8UQ2D.30SLE82GDTH48@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
Cc: "Christian Brauner" <brauner@kernel.org>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, "Alexander Graf"
 <graf@amazon.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live
 Update
X-Mailer: aerc 0.21.0
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>
 <auy0ThryqW5nVx20@google.com> <2vxzbj7witb7.fsf@kernel.org>
In-Reply-To: <2vxzbj7witb7.fsf@kernel.org>

On Tue Nov 10, 2026 at 7:45 AM PST, Pratyush Yadav wrote:
> On Thu, Nov 05 2026, David Matlack wrote:
>> On 2026-11-05 04:42 PM, Christian Brauner wrote:
>>> The checks on the target are trivial: a writable fd to an empty shmem
>>> file with the inode lock held while you fill it. A tmpfs file can't be
>>> sealed, it only ever has F_SEAL_SEAL, so there's nothing to restore but
>>> contents and size anyway.
>>
>> Sounds good. The one other check I plan to add is rejecting a target
>> that LUO is already managing, e.g. a file that is preserved in an
>> outgoing session and whose size is frozen.
>
> I have been playing with this idea too, and I also stumbled onto this
> problem.
>
> You also need to make sure a preserve doesn't race with a retrieve.
> Since userspace has access to the file, it can do both at the same time.
> I think LUO should expose a "register file" function that registers the
> file in luo_preserved_files. This should be the very first thing
> retrieve does.

Agreed, that's what I have queued up for v4, which I'm hoping to send by
tomorrow.

LUO gets two new functions for .retrieve() callbacks:

 - liveupdate_claim_file() inserts the target into luo_preserved_files,
   and fails with -EBUSY if it's already there, e.g. because it's
   preserved in an outgoing session or was retrieved before.

 - liveupdate_unclaim_file() undoes it. If .retrieve() claimed the file
   it returns, LUO doesn't insert it again after the callback, and a
   callback that fails after claiming must unclaim.

On the preserve side, LUO inserts the file into luo_preserved_files
before calling the file handler .preserve(), so whichever of the two
inserts first wins and the other fails with -EBUSY.

> Also, today LUO core expects a fresh file from file handlers, so it
> always installs a FD to that file in the task. When doing the "retrieve
> into FD" thing, that will result in two FDs to the same file. While it
> isn't a strict problem, it seems kinda ugly from a uAPI prespective.
>
> Perhaps we should let retrieve signal to LUO core that "I already
> installed the file", or a "I have no file to install", or something
> similar?

Makes sense, I'll do that in v4. The file handler will tell LUO that it
restored into an existing fd, and LIVEUPDATE_SESSION_RETRIEVE_FD will
return that fd instead of installing a new one. Retrieving the token
again later still returns a new fd for the same file, like it does today
for any file that was already retrieved.
