Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED8418348
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388332; cv=pass; b=cEtTyjBQ/zcB0My2uSfc1KgY63HYL7DynNxTh2zOY8bIIGU2cNH2QraTqPmdSMu4EZW7pdFLRsf/GAa/QK31cTnbstaIS7SDY91BrRAdCa2hYlrOcMMiDlQh+1ly4NZ9BI5qBizCREDUqCwFSafz/GAWlj2jL11p2U+PfPmbvrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388332; c=relaxed/simple;
	bh=jpxAoOq2/WdvZ+jP8HvvkFrbkrstugSY6ujuNWoxIHM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pEjoFrYStYtXxVPE5SroKDrD2B1GcotIkTY1WoepgWJanhg5WWeTJoxTKWyafodfUWU3L7npAShgJ9pZvTkxs+78jB9avtYdVMXy494r4AeKFMbmeSXCkhA/DQX2+tYgg7Zsk2Ecjvhr2BiixpcSGZbhnB1c9bIyVlxflpjK70Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orlhDpaw; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orlhDpaw"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66fa996e65bso412220d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788388324; cv=none;
        d=google.com; s=arc-20260327;
        b=QTfWvWPz+RB0/3kiJIWZPdcGHvvnwerCqdlbclNVZZeRhf5y8j4KMpWEmywEtKe0Jw
         zMD+5cIffzIYsv3cEGf3oaqsiFMME0MfPqg0nsYa/IsGD5y5ZoOf5xbh3nFZ6j34HjSd
         gjfS4WlFTHIkXbTG69/S+FT2MCLUH93PBgI4FbUvfaAQ0OuYPa/bbu6VsTatsDmlKOZ0
         B5L3SDgwV6KDlxHVoArQckswyVZbIU9QSgviFeuNT7u7TmxoI1oMZTfM7rgkOh9pt41u
         EqRp0zzs6GXdKnW3mA6IbP+fYKNFrDpODvfA9LrceqqL0saiaAzWImeiM3HujUi4LcPs
         WB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+AGt0gHLT0g+cl7JRWIp/qBg8bwWi3hEDvesCPNnUHA=;
        fh=NZDX1OTN6aTzT6BxqWjrJGMVVMA5TAi/RwzWl9vn38s=;
        b=ih10onMoezwDsAjGroxfEVRLbpv84OuSUd95Sx3BSFAM1zqyYT6s8u7qfj/PF9MhSd
         UTQSUVZlWNRO1k6COxgUb3fveprDeu829zvZEHE377LfIk0RnfjF3iw2Q/FnBgTj+wu0
         XeJOZmmv8a1nEiz4QGpmxFaJiUK1d1QAEt9HZUgNFsZDM2LMI0glZMEHzICq+ZtwGYPL
         hsfjlbSFIUeYQ179xrtDIbOix1FUET+xCqw9Mi06YADdQCC7Ed0iNSeNatgNBtqF6ejR
         fhJQ1vJo1kuhipvEFB7kpVkcKQ61ZZ0lIk2OL2v998tMW/gzXTc30X2/VYJght38Ecmz
         yJ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788388324; x=1788993124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AGt0gHLT0g+cl7JRWIp/qBg8bwWi3hEDvesCPNnUHA=;
        b=orlhDpawa5a34cqwT0bazrxboVJ6VYchM9PoIdgzRKuIeKemNVd6Q0w9Sup6HCEwwB
         4ikwsMCEp6u/lEOVHNOFRxEleRwMuti+NLiOSIwDnXMannQAsJ7HkUATApL+sXFgCMtg
         NJ9tKTb4EXBXqTLrbUJItZD2nnuXAwP0bo9lSjc5tLcGVyKK6ceMNaUb7/EbV7SumgiX
         baNnfv5IlkfcyBMEPKn1O0qfxKfhDl9xIg7345ATb9WzVssVuKwstMlULwvt01zJLAhN
         0j5JET+fiyT9CEmbHBzS83EZkd5jXdMTYVfpBv+uAdx95ucxvMrWcrgsN8nBxrpZ11oq
         Ke5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388324; x=1788993124;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+AGt0gHLT0g+cl7JRWIp/qBg8bwWi3hEDvesCPNnUHA=;
        b=NDrFXoZJH9UzO39PzqYVRcy2T1LWrLm7ZQC1/2Z0nQs4TvvuF1/1bk1StqjTWrGIWs
         0XBxSle0C3RMUc58KxzYqReRweXHjTXlQqxF0+g7AmpoOuRpSbN7ih9Olj6YwrqSpmfw
         o8HZJ9FXklTkYKBz5szEsON7KR1iMxQ9kA8Pb+pkLheHsBhrxXYRtqkktk3dcTZtwVye
         a7m6l1qs96HzN01eTOVx9qHrSn/mri+PBJtzFr5A/FXWpDP5J/hwf8s+9u6cE/kImdP+
         gLl8GRRmP4H2BJHeK9sv2fdeYMROU8oCb2d/kODIEoQQap8TrY+EDdk3/HT2ooIUyGyF
         9ylQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6UJbewQrm+dzAps2cPm8UFb5x3IGzr0qqoQ0L3eU1RHBKQWJP1ylkn5MlvuY6Zhkg1YopE8WYCdDNu8I=@vger.kernel.org
X-Gm-Message-State: AFuF++me+GdWI3RVRd/cRSuEfF/IyZqeXtSr6sKE74aBlfejc5C5lQBZ
	K7UmZ0bS1AexXueFd2l50B6YRkUrg5K5ldYMJpCXu1BIr8TrbKZPSMpl8RcGvwmEHq/w2R83geX
	rvEfOQc+NcleDXq+n6OybW82tpLYakFn7j0Ei
X-Gm-Gg: AYBFou0cWxP9In5UqYteUDCoj+8WbHD47+tRFW+AJtsvDxHV/ELHJFoT8t/5+0f9isN
	EzFu7F/E6Z1EFy8WP8oMurrPZDFmAxRbJ4r6NrSzVlJmk84gT/rezIi9wxcm3vtlo07j6/tp8b+
	3YIoLTTtl1CUeE2Ayv59pSicrwq8jMY5tE2c5rENrOSgihMeUb8moge9SCGg290qZbuBA77L7MQ
	mRnBVx9qpye+Kn+8POf5s0fW+hK6+C2aDbvqhZyN7slXyC62ajBX/Xs8/IXB9Fi0gW415InqJrX
	elTyunKz0/zw5F/X8+6m58EovKmftcCrd8RUa6Xz0YaZYY5lQ06RCtP4X3s6O5DCuijLbLc=
X-Received: by 2002:a05:690e:12c4:b0:66d:1913:d40 with SMTP id
 956f58d0204a3-66f9bb5e1afmr2528594d50.19.1788388323569; Wed, 02 Sep 2026
 15:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Orson Peters <orsonpeters@gmail.com>
Date: Thu, 3 Sep 2026 00:31:51 +0200
X-Gm-Features: AcwNN1V60FGAsFXTdLKDMw3TertitPAE8Ih8JeKNL1i5S9CD6ZtphO7QhQuic6g
Message-ID: <CAJxLxMUGu1-L+O_nAONOwOXnS=cNbNApCWqdthRjd76LThtSPg@mail.gmail.com>
Subject: [BUG] mm: writes after MADV_FREE get lost in THP pages under cgroup limits
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear reader(s),

Below is a small user-space C reproducer that, when run with
transparent huge pages and under cgroup limits, causes writes after
MADV_FREE to be completely lost. I have reproduced this on
7.3.0-070300rc1-generic on an AWS c7a.8xlarge machine.


Best,

Orson Peters



// Reproducer showing writes to madvise(MADV_FREE) pages getting lost. Requires
// THP to be on and cgroup limits.
//
//   $ cat /sys/kernel/mm/transparent_hugepage/enabled
//   always [madvise] never
//   $ gcc -O2 -o madv_free_repro madv_free_repro.c
//   $ systemd-run --user --scope -p MemoryMax=2G -p MemorySwapMax=0
-p OOMPolicy=continue -- ./madv_free_repro

#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/wait.h>

#define SIZE     (768UL << 20)
#define PRESSURE (1536UL << 20)
#define PAGE     4096UL

// Touch PRESSURE bytes in a child so the cgroup has to reclaim the
parent's buffer.
// The child volunteers as the OOM victim, so it dies instead of us.
static void squeeze(void) {
    pid_t pid = fork();
    if (pid == 0) {
        int fd = open("/proc/self/oom_score_adj", O_WRONLY);
        if (fd >= 0 && write(fd, "1000", 4)) close(fd);
        for (size_t done = 0; done < PRESSURE; done += 64UL << 20) {
            void *p = mmap(NULL, 64UL << 20, PROT_READ | PROT_WRITE,
MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            if (p == MAP_FAILED) _exit(1);
            memset(p, 1, 64UL << 20);
        }
        _exit(0);
    }
    waitpid(pid, NULL, 0);
    sleep(1);
}

int main(void) {
    int bad_rounds = 0;

    for (int round = 0; round < 10; round++) {
        char *buf = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (buf == MAP_FAILED) return perror("mmap"), 1;
        madvise(buf, SIZE, MADV_HUGEPAGE);

        // Set buffer to 0x5a, again after hinting MADV_FREE.
        memset(buf, 0x5A, SIZE);
        madvise(buf, SIZE, MADV_FREE);
        memset(buf, 0x5A, SIZE);

        // Trigger the bug - on a multi-NUMA region machine simply
reading the buffer in a hot loop
        // for 2 seconds also worked, likely due to migration.
        mprotect(buf, SIZE, PROT_READ);
        mprotect(buf, SIZE, PROT_READ | PROT_WRITE);

        // Trigger cgroup oom killer.
        squeeze();

        size_t lost = 0;
        long first = -1;
        for (size_t off = 0; off < SIZE; off += PAGE)
            if (buf[off] != 0x5A) {
                if (first < 0) first = off / PAGE;
                lost++;
            }

        printf("round %d: %6zu of %zu pages are no longer 0x5A",
round, lost, SIZE / PAGE);
        if (lost) printf("  (from page %ld, they read 0x%02x)", first,
buf[first * PAGE]);
        printf("\n");
        fflush(stdout);

        bad_rounds += lost > 0;
        munmap(buf, SIZE);
    }

    printf("\n%d of 10 rounds lost data that had been written\n", bad_rounds);
    return bad_rounds != 0;
}
