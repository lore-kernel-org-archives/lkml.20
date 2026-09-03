Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411633939A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405834; cv=none; b=tBBGvuKuefkDoE0a17VL2XGxADf0x5rpJolI7JrzjDeH0EO3wkOIIlF5hdJPB7RFJ+CjifxSnfuTfThqxAGGOqSEZlaay19mNSOFpsEHYUsC6+ZXZQyGLkGNfd8wZG7WX6KcOc3LVIdrr1enHTWbLU9WmHOHVLLuZ7AGYuwY6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405834; c=relaxed/simple;
	bh=ijG93PryVpuTFR837HKMzAD1imoeaiLcbU/MWpXeCnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGmm+TYEzXeN4Mc9Ke3TzFi9avsvaEpa1HCNNz4bkm23XzqIMj5j93NeSR8Mdda3KvqJMvilNYcKZPiI3Az6zAkdOrlWPCgvUHKULSNRM6/t4MYXsx3yudsVFhNAdm7WJ4FlrKuEF3BYa5pCKrlBUacAHrRvdLBuEEgsCg0/MGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oy+euqJs; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy+euqJs"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2270466a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405832; x=1789010632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vo0koFGfaxAqi8e6JuPyVAjuicCs8xIC33S4fjg+MZc=;
        b=Oy+euqJsQdiL1lmdcpL0vXtKZNVPHunBoShPkSMT40arlOAOEHfetaJQtoz2pJ54+p
         NKhgIBUFYc/TYFgsDwz0y3riWZjcXlolx1/ZjkqotnR+Is/mw6Bghbl2K63uVMo+lo34
         wfP/Ixnli97Rl2U0ySbpAnfVgKdyfqUbjVmSxjhEq+V3X39n1CHrn+Y0L13+T0Mvc2vK
         JURb13zQhWUA53UZN1OvlpFVzS0pmbONtBoaWzk2lem3k2gLALpLOA2drW9XdRY/R5G9
         vwy2P43k5hi+hZOfEwpoN8Z+3bFg+FENTffkg1ZAJc3z3eQD6BMHcjHOtWovJt/HfHxa
         gXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405832; x=1789010632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vo0koFGfaxAqi8e6JuPyVAjuicCs8xIC33S4fjg+MZc=;
        b=e2miipTWZUsrX9q3hxrYEPYqFREddcQ8QW2nzDd78x0Oqg7GwYlzZZf/vpljtu4qTh
         1eRPWAOpRiknH2nJzAWZdATouVjY+j6fLJ4s9aIjcy/4YsS/CxGuDwQM3NP6TULsyk9/
         QEye0SK0xaZuGDQULzVLgyVUlKKmTqEAq44jaFRe6vTFooJWjKIwmT+DVuGXgyQOfCZJ
         cdX4g/4Aew5QpueEof9YvmIdCVmLAcbgYSepZnIwQhhjtxeJ4A7ADDeYhJ7ayfbPduoW
         GYvC+JN5NKp6V+wooJrDhd9sI3xDUxTXeU1iZ+hUZe61Yj8eaDd5OLbFgRyf4uaa/kye
         7EIA==
X-Forwarded-Encrypted: i=1; AKwUvBzIHPapCbAKVPsv1fyrET/Nv7rFKADWSNL7lnX2Lk3JzcZm9pARjRtMvhxZu8acrH9nM25mawawORjca/c=@vger.kernel.org
X-Gm-Message-State: AFuF++nlRvf/DfUF7I4tzlosuxwdukWR6SfGwofujVEJW/Cm+LJEBZkv
	VGzed/NsiPWr45D2/kNEglzPuW89QpzVA0LC9aJL9Is4KHj5iaS6VBo1
X-Gm-Gg: AYBFou3CmQhRRwsqhyHkNRTDkBz6jgw6RgbRL74OLauNRN2VYAG5xkf2GSJMHkJmCqX
	7Vp+BgB3wj26lUpR95SQbeo5phRKkZEQZ6SSmOdmUjx+oHadQwBIeTy3vcRcZra1xOMQFb9vL1j
	D3b3f5Au3+gjMRgz1MOSduRlgB1rA3uvGjfHPpJsQuxwrH/cQ2rD7/QRApNeVExkQ2cZzZKUtKO
	qv+p5ArcuGE0+RipgQ5fO3c1IfyYdZ98WbO36bu3nmbZONUYBQegAQ+m7jsoCDvLl7Xu5fpFiiD
	8D3Jr2tXXfLvtJ6rZNMEFXLOjEHFw7Dhm+W8EBzZj5E5fXFv0+toEcO9jniGECiRH6NFzfn3EqZ
	3s93lXwMuRKEfyEkUIUeUTJpz3s89Ztso2AAoevaSHW/S8eVXe5OM5ydbc5PP7uWDH4AnVZ2CfT
	Z6RUHBRyX5YNkrHjh6TrOtZkNP4BvZFZE1BtOAgOiOzRIjRQ+Q4ZblO7WV6gMPLu2NQ0s4rlKep
	e0=
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr15696992a91.24.1788405831849;
        Wed, 02 Sep 2026 20:23:51 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm2300735a91.10.2026.09.02.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:23:51 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:23:47 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Orson Peters <orsonpeters@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [BUG] mm: writes after MADV_FREE get lost in THP pages under
 cgroup limits
Message-ID: <f896d210-ceb6-4a28-9e57-63862203e3b4@gmail.com>
References: <CAJxLxMUGu1-L+O_nAONOwOXnS=cNbNApCWqdthRjd76LThtSPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJxLxMUGu1-L+O_nAONOwOXnS=cNbNApCWqdthRjd76LThtSPg@mail.gmail.com>

On Thu, Sep 03, 2026 at 12:31:51AM +0200, Orson Peters wrote:
> Dear reader(s),
>
> Below is a small user-space C reproducer that, when run with
> transparent huge pages and under cgroup limits, causes writes after
> MADV_FREE to be completely lost. I have reproduced this on
> 7.3.0-070300rc1-generic on an AWS c7a.8xlarge machine.
>
>
> Best,
>
> Orson Peters
>
>
>
> // Reproducer showing writes to madvise(MADV_FREE) pages getting lost. Requires
> // THP to be on and cgroup limits.
> //
> //   $ cat /sys/kernel/mm/transparent_hugepage/enabled
> //   always [madvise] never
> //   $ gcc -O2 -o madv_free_repro madv_free_repro.c
> //   $ systemd-run --user --scope -p MemoryMax=2G -p MemorySwapMax=0
> -p OOMPolicy=continue -- ./madv_free_repro
>
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <string.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <sys/mman.h>
> #include <sys/wait.h>
>
> #define SIZE     (768UL << 20)
> #define PRESSURE (1536UL << 20)
> #define PAGE     4096UL
>
> // Touch PRESSURE bytes in a child so the cgroup has to reclaim the
> parent's buffer.
> // The child volunteers as the OOM victim, so it dies instead of us.
> static void squeeze(void) {
>     pid_t pid = fork();
>     if (pid == 0) {
>         int fd = open("/proc/self/oom_score_adj", O_WRONLY);
>         if (fd >= 0 && write(fd, "1000", 4)) close(fd);
>         for (size_t done = 0; done < PRESSURE; done += 64UL << 20) {
>             void *p = mmap(NULL, 64UL << 20, PROT_READ | PROT_WRITE,
> MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>             if (p == MAP_FAILED) _exit(1);
>             memset(p, 1, 64UL << 20);
>         }
>         _exit(0);
>     }
>     waitpid(pid, NULL, 0);
>     sleep(1);
> }
>
> int main(void) {
>     int bad_rounds = 0;
>
>     for (int round = 0; round < 10; round++) {
>         char *buf = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
> MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (buf == MAP_FAILED) return perror("mmap"), 1;
>         madvise(buf, SIZE, MADV_HUGEPAGE);
>
>         // Set buffer to 0x5a, again after hinting MADV_FREE.
>         memset(buf, 0x5A, SIZE);
>         madvise(buf, SIZE, MADV_FREE);
>         memset(buf, 0x5A, SIZE);
>
>         // Trigger the bug - on a multi-NUMA region machine simply
> reading the buffer in a hot loop
>         // for 2 seconds also worked, likely due to migration.
>         mprotect(buf, SIZE, PROT_READ);
>         mprotect(buf, SIZE, PROT_READ | PROT_WRITE);
>
>         // Trigger cgroup oom killer.
>         squeeze();
>
>         size_t lost = 0;
>         long first = -1;
>         for (size_t off = 0; off < SIZE; off += PAGE)
>             if (buf[off] != 0x5A) {
>                 if (first < 0) first = off / PAGE;
>                 lost++;
>             }
>
>         printf("round %d: %6zu of %zu pages are no longer 0x5A",
> round, lost, SIZE / PAGE);
>         if (lost) printf("  (from page %ld, they read 0x%02x)", first,
> buf[first * PAGE]);
>         printf("\n");
>         fflush(stdout);
>
>         bad_rounds += lost > 0;
>         munmap(buf, SIZE);
>     }
>
>     printf("\n%d of 10 rounds lost data that had been written\n", bad_rounds);
>     return bad_rounds != 0;
> }
>

Hi Orson,

Thank you for your feedback. I have also reproduced this bug locally. I
am providing a fix patch [1] that can resolve this bug. Please test again to
see if it solves the issue on your end, Thanks!

[1] https://lore.kernel.org/linux-mm/20260903031608.1194238-1-vernon2gm@gmail.com/

--
Cheers,
Vernon
