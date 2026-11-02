Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611933;
	b=knHs40d89ZkXEs9/LX2/eD9bRCgeus5n4ercpvz06G9kcEKO5VYI2Sdv/ruofz7CLzV/
	 g4OGNm2QRJcgfAkWD7enl89KB15MUueowbZJyMqdjinjFBmpGbUel3+qK8i8MbTVFvToS
	 8Lgul5IPaLO2+zzd2p75zaWBmJTxL6SOGPbAAkOs6PT3JBv+1P3pboozdvCVbbnMrtSY7
	 ouBHvdoUTAuEBIvJFM32tVYe2sGWldu+GBaEXXDCsvy8M9Kj6LCRRkXLIACZdwFJohopx
	 HmbyH5WNwNrGgQRXYZum9VcKuz8f/4+8yUQjMgn2/vqYMIbTQfdnSHAeEfufVZG70vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
	b=uGoM0fsxFbCzmsijxTzwvAinMu0b9ugFPV7dmMHX19ltUUc89kkunuwzKom0ZGvnx341
	 Fg2lPJB2qjFtrmTBNdvmaLrvfzVT/FuS0q5iWM9AXEBQHv63f/AB/vRyMefcptdU82J2f
	 ufrLO+8Vd4ZXA55jqKUAAh9w4K609lak4BfBjGs00dAYzFhcEcS9ZM2XldUdZ4btMC0/z
	 RgF928UI56qxWN3UH/gK5XvNbSe7aTzauCeOPJNxXVAtMC8yoSJjPhs2N4F51lHvKLx3B
	 VbV79lOk3ZLPLj4ETvyhHxGP8ndWNyRElkeR9SKWPyuaQ+ZszspjhLj25kTyxshrYQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEpjqEmF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EEC606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09EEC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEpjqEmF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1247064f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611930; x=1794216730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
        b=oEpjqEmFsTTVnphOxajM27MUmU9VHtSQ9qLPvz1O/pZnaoSJXmeVH01y3CbaLFWc6c
         2BMvNkuAh2Pmx/RNEe06DxFSjMjDDnbhZIVKO09kqcvqqpceUCqEkYS3t12sfLKzUR0K
         CTcSnHe3Uo89zqz4H6yMqyymae9sKq//zdJYc4Gn/svz0Q2skD+XWZ7RTDyWA+J+PYnX
         YzwM9/+sYtVDCSeFvQVJAqAwTf+oo1GqaNRZtY0pdgMcHwt5sa/N5FKgmaMH1vJIuSeq
         shC2tGB2G4QptriloCMlBZiguw+sPj8dTweXqKmEHojyICQUR1ooGBnzvbVz/N/Dy2ax
         THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611930; x=1794216730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
        b=diQflEmA/FvNp2xTfufSrR9QItTdX3YLjzDQ9lwRb7yozSkUoXF9NqsyJE8bCJgl4e
         MJV9sMJUhjnICulOeJJ1dXu+Y5IxNo+Tyt1iYUdy4xP68NcYKObCIWjwfFdc5ihKLaUV
         VgA1gfxBZxUB3H7qyADXQ2Egu9etEKNjq+lKrvDOK9vOl7grZwVXgJ4tJceqJVk8/owo
         cU7TZT7AiAr+0wPegEz5/5ZL3AzRdJZeaIFHIE8cP9PEBf+FQGHKtNE1Dyf/9nAn5nd0
         yw/vXLSbHVVzED7WptSq5Ux3QF3gdxWhIsP9+VjQPTKy3FXAfdNigZcAyUxSGIz3eZTj
         yJVg==
X-Forwarded-Encrypted: i=1; AKwUvBzhm7tlDuQ6BvTUoHb4JVHe+9+sUZKynb8pDXpFahQ9hb8JV7rGz7trfGxpM2CS8uiIVNZex+zRRDNj9sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CXYEI93pg8QM2bmS9J5RQbrq1JnACZ2qsJC8VMDmBvN56hzm7
	r/wNamcFyTYzwtlB8m8B+iT4FmuTUB0brXgfaboPXDbsV+oOqgZePlPgOWsOoYP/
X-Gm-Gg: AYBFou3kV5Eissk9pZg62c+jovfnqnq6KVLtahF55fEnqRqO3DTDB6k69UyplGhoVJH
	7OwayO/UWo1mEtS8qXaqXz83IX6YtEHrlS7NPmoYagt8yXmTtGE0z0ZdzEAObDVXsZ4hb9VkCJ0
	fePPtbJHujoIE2Ve8RtbPIihXN9Rgb57zEO0NDvfz+9MDkr5Vdu/mdJg9/bMl3GDZYnKg/TPl9J
	I0oGZGgSAMN/LD4CQFUq33ULp46PZSW6lZMNv1Tt9AE08j3/t9sCn1G3zCjWhktveFd8U5zTslP
	/IEH46i8hvAgGkACXvVrFO60Xg5FKPOD4bLWcDLI5jthD4WhxeeYvq8f0KPnFS3BSMhHNHydHP/
	1dF41jng1HBZKhMk1+YZaQuz7pnn2C/sENFd6W+IvaWhznHmuwu1DhINmQorD3byNDnuVqCNTZU
	hZgZ5SFAlOCQCyjejDjQm4x+nUqSFGTSR9f4AUk4XbfXhGIHUxlm9pEzeXc7X53SfsOvbhEit8w
	LaoI90JVhwUjVrX/czg1cU+8CNwVjR+PFzcmY9dGm8KO4rSs07AjzmrdHhWTj9wYtiAXkc4NB7F
	bWOiebSpVUxKcIzgH8zwf7Slw22sp6xoVJ2VZwIQA5WE5PQeeZ1lIThGHqPgo3tt
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr19683105f8f.48.1793611930174;
        Mon, 02 Nov 2026 01:32:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm19441700f8f.1.2026.11.02.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:08 -0800 (PST)
Date: Mon, 2 Nov 2026 09:32:06 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102093206.50b6c9ad@pumpkin>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 11:35:24 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.

That sort of implies that 2100 people are happy to receive all the
patch emails.
Take them away and there won't be much left.
OTOH you can't subscribe a gmail address - you miss most of the emails.

> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.

Hmmm....

That means that changes that misuse standard functions (like min_t) won't
be spotted because they are hidden from anyone who might just spot from the
subject that something odd might be going on.

David

> 
> Several v1 reviewers asked for a catch-all list that would keep carrying
> every patch for those who want to follow all kernel development. That
> is a worthwhile discussion, but it is separate from this series, which
> only restores THE REST to its original role.
> 
> Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
> and zh_TW versions of submitting-patches.rst carry the same "send every
> patch to LKML" advice and will need a follow-up update once the English
> text is settled.
> 
> ---
> Changes in v2:
> - Don't count subscribers-only lists (or moderated lists with
>   --no-moderated) as a destination, since get_maintainer.pl doesn't
>   output them; v1 sent patches to e.g. fs/squashfs/ to no list at all
> - Add submitting-patches.rst update describing LKML as the list of last
>   resort (Petr Pavlu)
> - Rebase on v7.3
> - Link to v1: https://patch.msgid.link/20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org
> 
> ---
> Konstantin Ryabitsev (2):
>       get_maintainer: only use THE REST as a fallback
>       docs: submitting-patches: make LKML a list of last resort again
> 
>  Documentation/process/submitting-patches.rst |  9 ++++--
>  scripts/get_maintainer.pl                    | 43 ++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
> 
> Best regards,
> --  
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 
> 

