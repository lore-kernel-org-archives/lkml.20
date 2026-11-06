Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793936582;
	b=Du2vdSAVFcjmE78+KasNs705apc7L/4pQTpb6jx5KrkEjY0pKHH0446Niz6P4JPqO1Ym
	 Kkfr20PGljtQTiN9ZFw9xxxRpNGYp8pB1i4hPjJvwJptywlC0OFlezqaf/VkTm3/ZvUnp
	 env3A9UpN/t11snMTtAjL84IvrsaAKi/I3iQzY5yygNvS2l2O+gC/c0AWPPJNu/dB/w9I
	 4Uc5c7gCZgVAHoUqYMaeLogoi3qnf6pOeQdn8mprhsYGbzjiq0iMItGr19ZEFoVb9I9vS
	 +3KLYmK1xti+c/nff99TJ/5Fota0oVxUCn9xCB4EM8FZ08QQUmxcCk741ziCCG9j0PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gzgmR8wgSiBd7YvDFgX7LeDtcmzhG2S+NinOJPtbciw=;
	b=mXNcIUL+ExrLEDEkILJnNz64A7T/WGf2e5tc1RcB+3YbLnXNhPMV3uVQk4gRHgf7raHh
	 FyIpn7Wh0piNTLqKVmefKeeYcRiqRmQXD/oF55Bsnd++hIoSAU9W4VQYq/EijjRQy28tr
	 fWaZxoqs36fgqjp6fVJxUdlFWwssEzC1XprDieLgPOyvWYNHzxYHFeBcXlMz7vycpOtKt
	 Bi4sD8XUAxLCF8kYEpH0YBugfjmKZcq7ppgV4vieninzr2knNQxfQKd7RGo8FzVWFmu+g
	 9eGOj56AO3OTbP7EP6/ZFrGuO000rl89gvFtPq/gFqSlC/pdEwV0//QB8ZWBprnPmwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPZFFpWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57CE606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPZFFpWJ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so66596b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793936581; cv=none;
        d=google.com; s=arc-20260327;
        b=KNvvUOi66HspyfxucuWzpLo8f9suxY7Xifjm5f5XW59RsFikO5O6LhOmoJ9lH8OPiX
         n3/mDSufJRb6apjJKRiOmDBht128raB/j1CBXD3TM8XQyZsHq5GNTvmgK5Bf9Tb8izK3
         w+K2VIBgKwBwBLmDlFjF+iJLVMHPLhg4KXX69HfBxJo01cJnS9B4apa2jDI5iXeJtlaq
         CSV0FCPYOlxocwPE7IdRPEUkdXcr9MQcv8FOXj65w0lhoVyjSGCupRl67MNc38keDq6c
         ZYdmSNFo9bsbfFGfEJYn4KGBhKHbwUqanpplWqAGNLF4rn4NBmOLJCn0F3nl7p1bT1ym
         8HMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzgmR8wgSiBd7YvDFgX7LeDtcmzhG2S+NinOJPtbciw=;
        fh=l2wJC2XKVUn6HSJPV4txUKV7+G3lkmtMTuKKQ7U05YI=;
        b=JROAlqCYTMXpTHHLqiivi/+l2XyOND0lG3lDZQpuwj7Qg26T5SqByUitOvBhN6Jq5w
         /Nism+//t8o5Evu5/Z3ZI8xW80MApB/dASlrLmNbV0C8O9P7qy4SCyXZvFT0zOPdVNvN
         cHB8sH0J2KibceaNeafjm/W67xsEAJdSlOgtD/6oyZ3InARXTDEBb0o94U6YV4l4b9xU
         qKFyWH72vY6IznCoHBTbb6qsJvmOVvR0vnULV4Bzpx0qkPno+wrZ5Wi4sgvUeZ2mnJeh
         rSTaOw1H9gLcNx4SAqz0UL72JthKL7ATJ0cSdEuiGRc6tCuFuY1Qxj3bPmA2fOtVDuZp
         5RPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793936581; x=1794541381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzgmR8wgSiBd7YvDFgX7LeDtcmzhG2S+NinOJPtbciw=;
        b=CPZFFpWJ51qkxgb4AnkFJz3oZP+V2FTLYH6xZrmstaXd7SqDqwhwEB/QN6z3PyTKcV
         hdJDDhRGhKcL88JE9yOv2p/aors8P2JlN0QHLP9BnvtBLihRQitHijEAuCsw+jCNh1nJ
         oPPDxz5uFD0J57cwQ2WyryKKeTdU9kqXCuw5XQC9mpVCv7qIoPdKGdDZz4N02Wf0g8OU
         nUoBAffsM0MawQPKIdlEe8GdKf5rNPV/AuOt8f8AJmwKRO2ThTlQ/lOzPJpWcQAMnqLx
         a+XeuW0MDfBGmjdjzNQeD0VuP/DXt764L0R9JfPJWrUKz8KTBlR5ZaB7s6eABsbc8bdU
         +yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793936581; x=1794541381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzgmR8wgSiBd7YvDFgX7LeDtcmzhG2S+NinOJPtbciw=;
        b=jt4UgDUYwPunNM3Z6e3bVzxDyzQaa7f1utrnUkPiLbNrR9PGQSYyopJzhupcErbj54
         aIGwgSsofLO2CFMZTrGq4tD1kQhvGrqH8Lk03EQN7rGthpMdhWQydMECpF6kCicEI0Eb
         i1SxKSS3wWZcpljgOddB4RYi3hShkUeAr4neTFhukkKb3oXeV5JTUe2wJvywKmt30gjj
         sDtur69CSSAgcznOO8gwwKGiFSawTYSNf34vRRj5vkr5YCdFHC9oA7xnaxKNr+p/AZP6
         Md2lNa4VCcAo7NiEFO29NMUA1arn/KrqQNn8jH11G0jhpxITMGI1/qJbVbUK0JI1PzsJ
         PoZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSRROooaRcYNs3cYLa9+HpTWqDQhhjtM6LrI8qAT4hLKBiA9v27rVOYluQlpXqI1p4kx6SppBT4Pq5UzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vSkW+e5SeYO2gweWoz1rTaS4RQx4iTGM3VYfxhw8I3xj8F75j
	jTr1H5dY+NWBejbtx0t12MFs+w15aPZzpiG9xw6JIvGqEyB6MaJKVjIkbo2LJzchZ5HPBrJk6x/
	pa8B2Mr658B5YnN85tn56Fq+IpJcAmH0=
X-Gm-Gg: AYBFou2WcsMyo1cr/KMSuPMlYciwy+zcOfpV1eUtmxWECh6YJeYt6vvmQJNmN3WZOwt
	4qxGY846lj3N1r/BzBoRD2zbxt4nQMhvZDeYMgm6wXzZmxlGxFYGRiOlc7bHJL0dNx5vjSjQWf9
	5ZdylmksWtVikDp4uw6ZedzKGD+cT50p7NgMffj/dVRWjsOvQWInwhgNjPHiJjl3hn//eRey6Wc
	Fkqpq/oEGYKhfBTf142ylAZUjP/5MJtTajGHjIg9Lke+qNrIWPC15sDaScWrzSz+00/bfONOcL2
	8C7r2I0McVrZt39JQ0EWqTCercEItxP8fWYG8oKbAh2BXkHzMv87lWaseqZZ9k+v0rHedATc/ZZ
	ObJrg9SYADn8uDNwdNxF3EcCrFNh7AwXWCUhA
X-Received: by 2002:a05:6a00:3a1d:b0:890:e6dd:52ca with SMTP id
 d2e1a72fcca58-8b37bb5e2demr1221064b3a.47.1793936581257; Thu, 05 Nov 2026
 19:43:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104033539.3031910-1-frankljpliu@gmail.com> <rszreimkiwsu3yrksfrjvalosmvhsybnfrabups7dv2jfmrkdc@qvzzx3sw67rp>
In-Reply-To: <rszreimkiwsu3yrksfrjvalosmvhsybnfrabups7dv2jfmrkdc@qvzzx3sw67rp>
From: frank jpliu <frankljpliu@gmail.com>
Date: Fri, 6 Nov 2026 11:42:49 +0800
X-Gm-Features: AclHuK9I5nbDfS0WLfo-rNHrPzRkiLGTMb7ir1H75XJTpxOH4q0VVTp6EwkC0hE
Message-ID: <CALqwsrA7ZqR47K+sKnfGHx6816QxPdBxoOJSRvQbRLD30XLgDQ@mail.gmail.com>
Subject: Re: [PATCH v2] ext4: fix soft lockup while shrinking the extent
 status cache
To: Jan Kara <jack@suse.cz>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com, 
	frankjpliu@tencent.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:30=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 04-11-26 11:35:39, Jianping Liu wrote:
> > From: Jianping Liu <frankjpliu@tencent.com>
> >
> > __es_shrink() walks sbi->s_es_list and reclaims extents from each
> > inode. On a non-preemptible kernel that walk never gives up the CPU.
> >
> > There is a soft lockup report on our company's machine. The machine
> > with millions of active inodes, 256 CPUs, and heavy memory pressure,
> > concurrent shrinkers run too long.
> >
> > i_es_lock is dropped after es_reclaim_extents(), and s_es_lock is not
> > taken again until the next inode. When nr_to_scan remains, call
> > cond_resched_tasks_rcu_qs() before continuing the scan.
> >
> > cond_resched() does not report the RCU quiescent state needed here.
> > It is compiled out when CONFIG_PREEMPTION=3Dy. Otherwise it schedules
> > through preempt_schedule(), and RCU records that switch as a
> > preemption. An RCU-tasks read-side section ends only at a voluntary
> > context switch, cond_resched_tasks_rcu_qs(), idle, or return to
> > userspace. The helper reports that voluntary quiescent state and still
> > lets a non-preemptible kernel reschedule.
> >
> > Changes from v1:
> > - Delete time out logic.
> > - Change "cond_resched" to "cond_resched_tasks_rcu_qs".
>
> These three lines belong below the ---. Otherwise feel free to add:

   Sorry, I had forgotten it.
   I have added  --- in the patch just now :
https://sashiko.dev/#/patchset/20261106033141.1509656-1-frankljpliu%40gmail=
.com

>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
>                                                                 Honza
>
> >
> > Link: https://patchwork.ozlabs.org/project/linux-ext4/patch/20261028061=
628.1209508-1-frankljpliu@gmail.com/
> > Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
> > ---
> >  fs/ext4/extents_status.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> > index 018b6146b9d8..62346eaf4350 100644
> > --- a/fs/ext4/extents_status.c
> > +++ b/fs/ext4/extents_status.c
> > @@ -1721,6 +1721,16 @@ static int __es_shrink(struct ext4_sb_info *sbi,=
 int nr_to_scan,
> >
> >               if (nr_to_scan <=3D 0)
> >                       goto out;
> > +
> > +             /*
> > +              * Report a voluntary RCU-tasks quiescent state before co=
ntinuing.
> > +              * cond_resched() is not enough: it is compiled out under
> > +              * CONFIG_PREEMPTION, and otherwise switches via preempti=
on, which
> > +              * does not end an RCU-tasks read-side section.
> > +              * This also lets a non-preemptible kernel reschedule.
> > +              */
> > +             cond_resched_tasks_rcu_qs();
> > +
> >               spin_lock(&sbi->s_es_lock);
> >       }
> >       spin_unlock(&sbi->s_es_lock);
> > --
> > 2.43.7
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
