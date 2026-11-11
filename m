Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371010;
	b=WKfl+LHbRD86/7ItuLFbjSoNc8WzMpEu/TLKrse1xbWkYKfVIqZ8+yYtW+pqumNNewHO
	 AQlucaVcGmv5NYiRKI9zzGjTDkRFfDOWAMbCJRM8bR0uy4BpjzZuFkqOfjOtqEALrNo5Q
	 x4Op/D3JOnupkAaTwks2164I8CLwia8aNAa/iLpaFzs0bLl/9Y1Z0rTZc8Hj22y9/WI+V
	 Fo73QfXA3IeITVCbrrfZV2uWIx7DZlVjbWuTf5VCwFI9uuKSPRYvTJTQw7mKkBWX8mKPf
	 9pxYZHMBGfpjetGHKTbocxK/9SOdsTSkq0ayGPZVmYThcISETKqJze8kkGD/px6szrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
	b=Da4r1jZJqxlQzT5AsGpWN+CdWrvMXKc0vNcfQPPTYBvwaoDNm8FB2gdx6pxVu7ob1uAC
	 d5atpjJ+38wAeYf6k2AZPLs16XCv3wqh7Vcpr3VEOhUGZuVu9LYctSS5Rge3wLjU22geo
	 ibYn/7hCUDSi2E1/eDfiihvEgz3AYTZNRNrBAgthl4CCb6PEKIUZdU6bLRy++BLFgWhjv
	 q91SITUo2kN2a2kTYBaHrP1AT6PKsU3AD6nFRFLrfWps4Hi+Grlho6fbHD2U3ZWD2wBwO
	 MCoVnGHHFM+fHiixCkhvuqTqYfqmpRAcCB0eNexDRsHXxzN+0eOpWlvjtUPbE6nGuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fen0ScLX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C117D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fen0ScLX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18818daa3e7so893118c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371009; x=1794975809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
        b=Fen0ScLXmhaK+yaDIgQ136/qilWNldR7SWWcw78zV2UOs41dWlxU5iVusttf0r5HJp
         e+ZrS7twa4D/2I+09r5w5de2NN3wANmX4N7DXqTScWj/z0ZJ2nqISonJ7ErJK5h8ehaa
         OAtK80N04TyrtOc4k6zMsjLgWs7ZImMfj50wQRr3MDSedxKaTdN3vzRKqIfE0Zqx1aLW
         VTz8fQGGdOYEsABiOSkXYwZiX/+WwCUUZTg+oZ7pmMHKTjG4eBEDjhGiOkGq1m+YwPdQ
         2IFS10YKxd7Ig3kSNqhzoG0+eojfpPYh/fvbBt+SDxkdLqDBiF5OxPJ02P+uvzHbe/kR
         bpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371009; x=1794975809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
        b=LL9VzaDYxncM6AxOdzLRtp9s11Su06UDMypURa5i5Oe2NY9+SGYVsc1u8L+pb8eEQd
         fRl7qUsynhltj5xlHV0YpKCtmY5+sGaUQNZTkplh9+d4N+KAW5sRA1aUv6xA3lHOcR63
         YcIYEcY2fP6SB+M5kFrdaJn75u3ytyUv1BjMAjuf8TIG8e0NH++gAGLgL4EYFI0gSAUF
         tpxtQC5UoSmY350lbRoBOCbh++yUFwH5shB2S7Z3dX46d3LvEVEivPA5TobTkAYeYdla
         MPTnUupC5pZBB0VfVVGfZlurmyAziYFb+BDbUu3CSMBt0QG6WVAB9AiHI4Dh/R66WKca
         YaFQ==
X-Forwarded-Encrypted: i=1; AL+hErHD0CykM+daeAlHSE3SWZ3uMW0sbwp0aUJSg1Txr3Ap0/j7rtsSHo5yc4DEn5lRT6Zi+hcqzMUxGD6u0VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tk+FqSof+3UxxjTRiaeEkG0Qiv4nZjSP9FHQrK3cGrX14y5Ck
	Q9PvkGuCnftxzyNCDIqVsrLFgn1QSNLCGQj0HyRJ+4zMq7NP0ye3aXXp
X-Gm-Gg: AYBFou0FxGaXNAQ+AEkgPjm58rzxD8lt/8YN+ATYMg3R4PCn7rBCaLPTqjLrHF3hJa4
	I8NkqYfD6PUgoal0Z+d2Pfq1RLMk32kQi2jHxr/Qy4IyrPdoEcVLVmUUS+m78+uWRWoIx2r43ps
	TnY8Y15H7/7a5BKuVfzd6bZKW7Zi1JH/lbnw0+55KqAdnMzVvjE4ZzhFHNuKago/A0MCbxPiQ++
	e6v+Kk3T/8Q4mH5Z0HWsq1lCD4VnRDnKchXEJi7N0mN++RJGYTvPxvaoCboVF4+kV5PliHGv8gm
	z0WqYajcXiEDJ4vnHFdRy+J6pno80uQsRgu3VdTnLPdrwCPxU8I4EaPKMUBRmsEWjg6NSbNI29V
	i37pONTXV/gri8CHyoC/22g4CKRzg4fMmDom6aW8P1fWycL+aAdL/qbvC44aC8uMNQkvvjdFxTn
	vuVLiIjQzTHplq+5KcioAfw7qikF+l2yFpCm5I8A9CL1xlB22qE6gn0OO3Vn+UWzeWAj0kMWzjs
	Esay9HaOUdfkDfcfyjtBXSaFq3x+ZcDlyle1sg3lr4nqBnDRL9OvbZSegV46HGCjGhEtzzzYN8c
	N+vZBu0+4P4/U5p/49a1S3QtYuuIN9EuZ7c9B7Zxx8F2GoREz/68eJUHMiS7uaodnTYTpZpa3L1
	DVqAE39EjwzA=
X-Received: by 2002:a05:7022:130d:b0:1b2:3e1d:17ee with SMTP id a92af1059eb24-1b3bef0a955mr1889024c88.9.1794371008492;
        Tue, 10 Nov 2026 20:23:28 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm15985536c88.5.2026.11.10.20.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:23:27 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: alireza.haddadi@it.uu.se
Cc: jack@suse.cz,
	willy@infradead.org,
	akpm@linux-foundation.org,
	vishal.moola@gmail.com,
	fujunjie1@qq.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	tracekotae@gmail.com
Subject: Re: [PATCH] mm/filemap: let sequential faults restart mmap readahead
Date: Wed, 11 Nov 2026 04:23:10 +0000
Message-ID: <20261111042310.191979-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se>
References: <20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alireza,

I had sent a different fix for the same regression [1], reported by
Trace in [2]. Jan prefers yours, so I have dropped mine. I ran your
patch, also with the v2 change you describe to Jan, through the tests
I had: a KVM guest (x86_64, 2 vCPUs, 3 GiB), mm-hotfixes-unstable as
of 2026-11-08, ext4 and XFS with 16 KiB blocks on virtio-blk,
read_ahead_kb 128 unless noted.

The reproducer from [2] (2000 single-page faults 1 MiB apart, then a
64 MiB sequential read), major faults in the sequential part:

                       base   as posted   with v2 change
  ext4                16384           2                2
  XFS, 16 KiB blocks   4096        4096                2

Touching 1% of the pages of a cold 20 GiB file, larger than memory, in
random runs of 1, 2 or 4 adjacent pages, MiB read from disk with the
v2 change (first of two runs; the second was within 10%):

                       read_ahead_kb 128     read_ahead_kb 8192
                        base   with v2        base   with v2
  random                 259       234        1057      1070
  stride 2053 pages      271       236         992       992
  random 2-page runs     257       373        1135      2538
  random 4-page runs     240      1146        1200     57748

The 4-page runs at read_ahead_kb 8192, which is what this guest's
virtio-blk disk gets by default, read about 48 times more. As far as I
can tell, each run now has two misses and up to two hits on the new
window, so mmap_miss stays around MMAP_LOTSAMISS, and each time it is
back at the limit the next random miss gets the full 8 MiB
read-around. My patch ran into the same and kept mmap_miss at its cap
on that path; something like that may help here, but you and Jan know
this better.

On the Fixes tag: with the commits of the series built one by one,
commit 0b9c0aeba938 ("mm/filemap: count only the faulting address as
a mmap hit") alone does not show the problem (1 major fault with the
reproducer), and commit 9b0fcac3cfe7 ("mm/filemap: do not count
FAULT_FLAG_TRIED retries as mmap hits") does (16384). [2] is the same
regression, in case you want to add Reported-by and Closes tags for
regzbot.

I am happy to run these again on your v2. The tests were set up with
the help of an AI assistant.

[1] https://lore.kernel.org/all/20261109091444.128521-1-gopalmalaviya53@gmail.com/
[2] https://lore.kernel.org/all/20261105192517.228523-1-tracekotae@gmail.com/

Thanks,
Gopal
