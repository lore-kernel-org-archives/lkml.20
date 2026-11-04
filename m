Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821082;
	b=T8Bwkl5dQAemqEBmPACUGAQ7xIr+6aPHNKv8elMGuk5BuOJTzFFaFcXYgdZyz7Wugd1X
	 1QCdhWsFmIr+KUYCqZ9HlRP0LJD34GTEj/Pa+5p4WnLqodxXHyshEBgeWiAsZQFwOygK1
	 MY6Wezp+yYhYwiPzqNlDReFq31icwYFigPB+JmubASK7n0KxsMes75BvdjxClzrnlawH9
	 czo0gxzDZwhY3Q7MNvSZrskGpfPJGy6g9bn8krLUkRsbKZYNDHy3c0QnauDKQB5SP59rP
	 VHgEVUTPIV7+sHSEokI4TchROQnvmh2BDL6zodNm/nXH8xjAO9wojmgqDINMo2cIEmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
	b=X9za+5KTRTkKZwBPoDMgSoOMi9vmidJmGTmaAlPaavMhP00SENrq2lyJPYLYUfZBupgg
	 prAArhRDr2+DYrDU512DMigiQjHCaU2cuB+toCsswvqvpZC5aOOOOnIC8AjTqbXxzQSF3
	 aDGNmPi30tzZFpUybXdyYoclGertW5eNacXyWLxcHWO0c1YjRHCmm4D923SucrxNZCJxN
	 ZwTwTuUlspVetuFkhhuy6xFTNLQEV1e7gNBfM/wvGRcbmjgeYA6KoHQyzsccgvz9TAh+F
	 eXtlRBIqlOkRCtzGmaENMag93gtGTRf5oFRTWofWy1aMiDrLWcVA69po4ebaNwn5anA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A240607F954
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A240607F954
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so355976241.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821081; x=1794425881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=TJnxG9tUZrPoE5M3bA/Qth/IxImRtZ6ZkMq6PZ7AxPARnJxjkE6uy8PDC0QRGzKkSB
         elYXKbXAU1qgJmeMb4qGyjSeThpKbLb0Yi0WVcXpGBSoVRJ/r4fqm2IFP/kgV03Lu0Oq
         g1sHEZF1Qc7zHAWXnlT6K4sHkyT/rmCkscbyZ94x25Si4yeTdZ9RuHwcsPs53vXxUTEP
         fTXl66YSox2ZvpqrGc2tyR8PROaI5AT2J328hxLCMTkBv6amz9S5MBAHLtY8Ggf3obm6
         KE/iJbxoQ5Ov1xzUOHsepj+BfiVK2Eb0rr3Hm5xfME8cVGLzdFqlw2ULC41owtgjTu/8
         gRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821081; x=1794425881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=sjKppyd6PjLKXSJVh11DexUss7HRR+5LHrcdG3Tm16Zai+JZa7e1oTJCpANNloiTTv
         98KrzcQv2UMXUVb/Z8ERvblQBIMXmlheDSX7jdBDPWzn0I85I18Zjf/5memcWfZ6g3CT
         uWCAgLRPRVob8aHKO5qVU4uuKnJLf8XxLUMqpiE5fwK6w6El+07tk5X/yQyYGtgqZ9gp
         7t0pfOOcXOGDRfBOu6IDQhkXEcv5ELpzKoxdCR3bvi3erYEDhQMomVBDMouiaM47Fll9
         TofEbHn83ggrmIzLQskPnus2DvGhThWZ94Nh3Vm/1nDBKhg0vO1xpsyVHakq+ok8XDkV
         EBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvZZ1jl1Dqg3uM3AO5IsuKyGrzATgs22xV6tFwiT8B5Etu8pFWs85+lVletF/hq2tOb7RFghsd8QLkNDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/E6kqVJDnVuOxanRNGwB0mVC/EMT+i2tFPA+t/6Jx5xtI24bv
	pW+fuN1S3EnwtfOkdZ27GtTUZN2W5wd3pMtr3DVPvuNoFsftH9wtx9eJ/5fgI6zUR4A=
X-Gm-Gg: AYBFou203ht4tYnzFlmj0Nx8lYBOBxy4/PLcGkZhxAUXsVHfD/Nab2ZSN0NlOb/B9cm
	YfXsRe2zFSx8nWrdSsCV2+QguZT8jFY0S7gdQEd878NOHmmTM0v32tHLqHQ40BA6wBMmUvM7bQS
	X2ivu6+LXpWpgpXHMVJ3adMfBvDcmJ7Jc6j8TNaFavShx+Lo28ZgLjdSx4Rylz4QEtmiyuxUgHA
	X6hWkEM9Lkv27OIxj6okHAhhh1sns/Aqj4g9XuhF/78AuSDR2V9Lz4cYCHIXz+ubzoCHQ09Zwr9
	WQZTN/c+AGHcKMBwtBg46U91qx7kEjVel2g5BBAkjcz+U3Gi0m7+bbPdrRZ42avieonr+YcAGC+
	WRME+Zr1sm9cMs2yUObOZcTVtMPqWpciLqG0taqr+sLzrVsQi1YcvbsS7QFN9wJEr2QdJnM57AL
	auzr48mKBld3w2w42hICusN8mNZuuHAlug32qcxaodf7isQu0IdwVByfyTmBJtCYY+r7rb6LWKD
	ZCddxnNWs3d7V2aEzbINICDNwB6aEAT6tctDM3jlmw+zTgj9d6fKXcX3pPYz6FzpMoiIxxIy9BJ
	S/2+QedEsaNHydp5uHvMr9VCx+xD3yYE2+tOeWXwAOrpfSxuj8tfyiGDrAaBRiz5hK40PVONPX5
	S+mhVIQTVXdzNC8Uo5q3VgHyHcrtWms0fz4XnGKjekWbb1+mreQ==
X-Received: by 2002:a05:6102:6b0b:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d0726a9cd7mr6446000137.16.1793821080773;
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d2a3asm2569956241.8.2026.11.04.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Date: Wed, 4 Nov 2026 14:37:59 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auuJM8c-bE43NP54@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz1p90jzx4.fsf@kernel.org>

On 11-04 17:59, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Add luo_tmpfs, a kexec test for preserving tmpfs files and memfds, and
> > for retrieving tmpfs files onto a tmpfs mount with struct
> > liveupdate_shmem_retrieve_arg.
> >
> > Stage 1 preserves the source files of each test case. Stage 2 runs
> > each test case in its own directory, with its own tmpfs mounts, so that
> > block usage can be checked exactly with statfs() and st_blocks. The test
> > cases cover:
> >
> >  - The restored file: contents, size, position, seals and holes, for
> >    linked and unlinked source files.
> >
> >  - Creating the file: it is created like with open(O_TMPFILE), with the
> >    requested mode minus the umask, owned by the caller, and not linked
> >    until userspace links it, unless it asked for O_EXCL. Also O_RDONLY
> >    and O_WRONLY files, other open() flags such as O_APPEND, O_NONBLOCK
> >    and O_CLOEXEC, read-only mounts, and directories that the caller
> >    can't write to.
> >
> >  - Preserving files that can't be written to: a binary while it is
> >    executed, through a read-only fd, files on read-only mounts and
> >    superblocks, and immutable files, including sparse ones, whose holes
> >    are filled. Preserving someone else's file that the caller can't
> >    write to fails, and so does preserving a file through a write-only
> >    fd or an append-only file.
> >
> >  - Executing restored binaries: a restored binary can be executed
> >    before the session is finished if it was retrieved with O_RDONLY, but
> >    not if it was retrieved for writing, since LUO keeps the file open
> >    until then. These test cases execute copies of the test binary.
> >
> >  - Block accounting: the file fits a mount of exactly its size, and a
> >    large folio that extends past the end of the file is charged in full.
> >    Running out of space, or hitting the memcg limit, fails permanently,
> >    and leaves nothing charged to the mount or the memcg. The session can
> >    still be finished.
> >
> >  - memfds: they are only retrieved as memfds, with their seals, and
> >    files from tmpfs mounts only onto a tmpfs mount.
> >
> >  - Interactions with LUO: invalid arguments, which can be retried,
> >    retrieving a token twice, and outgoing sessions.
> >
> > Also check that the size of a preserved file is frozen, and that the
> > test doesn't trigger kernel warnings.
> >
> > Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases,
> > CONFIG_MEMCG for the memcg test case and CONFIG_TMPFS_XATTR for
> > FS_IOC_SETFLAGS. Those test cases are skipped without them.
> >
> > tmpfs quotas are not tested, since the test runs as root, which is not
> > subject to quota limits.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  tools/testing/selftests/liveupdate/Makefile   |    1 +
> >  tools/testing/selftests/liveupdate/config     |    4 +
> >  .../testing/selftests/liveupdate/luo_tmpfs.c  | 2055 +++++++++++++++++
> 
> Umm, no way I am reading all this...
> 
> LLMs are great at generating tests, and I'm not saying there is no value
> in this. It is just that this massive code dump is unreviewable by
> humans. It is also unfair to the human reviewer because it took many
> orders of magnitude less effort to _write_ them with an LLM.
> 
> What do you all reckon we should do about this? Trust the LLM to get the
> testing right? Do we give up human maintenance of tests entirely? Do we
> do fault injection to test the tests themselves?
> 
> Or do we make the tests smaller and more human reviewable?

We need good test coverage, but I believe we can break this patch down 
into smaller changes where tested features are incrementally added.

> 
> >  .../selftests/liveupdate/run-vmtests.sh       |    1 +
> >  4 files changed, 2061 insertions(+)
> >  create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c
> >
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
