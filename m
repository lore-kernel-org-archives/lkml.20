Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682681;
	b=ls5XcvyPyrnfHk2tGdXZsaI7tlgx6WCHMhqBWZQgX4Pu8yN7FEBq5RoWEtx/NxnupTh/
	 cLZWaE0p+HoHQTACRf5yRT4s3TalcEHdvUha5aL2ufTND38zQsNdRXqD/0L1UvrCkGS6G
	 Aes9AHGj8YjsHvZjVBkaRDRSBsnsvyox04oBoGe+dhPPBtwdA16HuxoBpAEax33Tyqswj
	 vVf3tXQTSfaNzkVCw+zmC8ZROz5dk19LhyouTUcyNiIxEs0FDJb7/uoXEi+o4KDTG7CEI
	 2lHvntuNAHd4oqrfmYQAEKVPMQhJbOV5EEiJP+LQWVAJZpwm4PFNXuvz4btxHR/fO9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=ULgRB/f/0nMMgaVufow+n/zddXTXxzXvwgPanbaVK50=;
	b=2DeVR2hn2TtgsQUTqglX/BdMPeO1UvxPcYGV0SWckVDRS8W0Fl/urKAZvQWBRCeejpcW
	 1FtPDrTojFVqTO1WAE8qEYE/jhxhQasysAD7L5lUqEv/y7hqyvcGue3IQjAhDo/Hidm34
	 6zzjO0QrNxiymQKtV/+HP46opIzDJGT+takBpY4CLbLn6T27LMLOW92nQPCa9c3k4znEl
	 aDZTw9oNLQsaB+02vMNOzHEog+khdKAfpIng1A3PKJCpqsedKP7b0z5SeNzCyafRYDxsL
	 cRhG2V4O+sYZuFkqHkaxIQZlLuMEgjOiOipERqZp8aX2aj5vuR0sWIl0t7cXKX0sPlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iCZ9Ekr+;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CE5606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CE5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iCZ9Ekr+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3372230eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682680; x=1793287480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULgRB/f/0nMMgaVufow+n/zddXTXxzXvwgPanbaVK50=;
        b=iCZ9Ekr+4ODTg9sNbwPHDffrwMUb0YnY1YblLdZnY4zsGOOSyC2kPtauwrM7wAmkVT
         5lzEnsw7khWX9DWSjEHZeI5Kl2N7WlC5653hh/umA+IKMEQbgXENSqt4yppiJqJmXy0J
         mmqQM9u5e3lI3bM+xSom0Z8pX9uOdcYaPRjy3ZAapFLfQH7MRzvfqSKvfVvXEZWzH2vE
         x1XkwqqzjA1TukLyA2ov3d1YS2vI39I/VmxPAbdAjZA8213oS3FmrOqz/gP0Jnyc/nRm
         Ezqgw4IJihSbM6r8ApjwF6rYjoIfOLspKB8l8mLpa9i8RiwmjVd78GC3ajq6xYaPMOmQ
         fPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682680; x=1793287480;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ULgRB/f/0nMMgaVufow+n/zddXTXxzXvwgPanbaVK50=;
        b=CqERNPtlmaDe4bjW84bp7DqlmpeJMXo1j4uNOXQS//M3TD9wcJXkCABwepwYf83VF0
         YBVPhhn0u6+Q11DYjxgpT3tQyVEWvaTRHy37Erypx6C26APqjhnYaL+RDxeHy316a8wd
         YQdbZv1GUh7l47S+p/ZD+WcJZ3hHvhWdlhGrouZ96OG3LzBRslYO67OyuUF39SIFMBv+
         TPq0rjnFkxiwD0NcK+E9eS+BlmOGxizSK1qUedXvLVP9RfLAiQV4lgxq2g2muG83kNSZ
         5Be97VrykhGVbUQemz162pGxIKjBsEP+oRxS+3QRZnNMn9lTTfE5WmXsGK0hZ5CwSJne
         lsFw==
X-Forwarded-Encrypted: i=1; AKwUvBwZOuATlZaFfKnJIpOqVWgTLYkTY6lNsTnVPltOtbB1yOq3aLQvy50Ace3ovaFuqr7pJuKLpIOUhkD6dWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaXLF3aA6mADOJgfGdxB+EWvIZhV3RBW8nyozJcIpVRpLYBP5v
	35jX+kLk2+8eZ28RI5z/GfpEOMoD64nx+soaftmFJMmAiZqcDIqUor8A
X-Gm-Gg: AYBFou0hW/RZqo0OudUL9O8MbOPoaXeMD1LfCOdBRlQ95EGnpoz12A1hOrxItAlIcXk
	rDGFzPFvSfTFYl/nZFTmsrKqkTEkkM9hOPD4MzpAoAC2yAivDxlZeMxso1QRFte2kZfxkWQFwZQ
	S2o3cegylXFDaMk2EI5JztbM+/YmPGv6wsx9kDwoFPngkPUCIE3SK+XYqDPo69p2m4vVCNUO2jg
	7ZqQrhP4dHEXWTWXKGodeFZX04wSRrG3g/z03LaiJjNUFptigYWqnJok3PNsZWmUtgUsvQe5BZX
	kVjP6X1DjnZ3D92xCe1HC53tyXehHZeGMTUPAnCaPQJRp0WwB1S1by6uyb5t0yoaXQN2s73o8+g
	cBUht4HkZ//dJeZMT46oMf4Bw2rWWTkWXnmzb/iU91vJev2EcEstO6EVVHTsWohOS6kCzPRRmMi
	TXnsvWqcPIEzsCBmTctnNJceVqTnXQ0Zo+x2aaeXagLK099owCAnFlQCRI0N5LE+QOGN8tpRGSh
	cM5+hd+924NJ489UuS0sTG35zbbEMycE2gnlKxq3VP6rI9NE6w=
X-Received: by 2002:a05:701b:418a:20b0:151:7f08:5961 with SMTP id a92af1059eb24-190a03341d1mr7652600c88.4.1792682679689;
        Thu, 22 Oct 2026 08:24:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm13984187c88.6.2026.10.22.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:24:39 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 23:24:33 +0800
Subject: [PATCH] mm/readahead: look two windows ahead for the hole on a
 marker hit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-bug-mm-readahead-async-overtaken-v1-1-c05b8d8bd2da@gmail.com>
X-B4-Tracking: v=1; b=H4sIALEq2moC/x2NwQqDMBAFf0X23AWz0B78ldLDJnnqIsayaaVF/
 PeGXgbmMnNQhRsqDd1Bjt2qbaVJuHSUZi0T2HJzkl5uoRfh+J54XdmhWecG1votibcd/tIFhaO
 k8RqRoRKoZZ6O0T7/xf1xnj+OvnebcgAAAA==
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

When a reader hits a folio marked for readahead that the readahead
state does not expect, page_cache_async_ra() starts the next readahead
at the first hole within one window after the folio. If that window is
fully cached, it reads nothing.

memcpy() in glibc loads the end of a large source before copying it
forward, so a loader that copies a file mapping out in pieces of a few
megabytes faults at the end of each piece first. mmap read-around then
reads a window centered on that fault, which reaches more than one
window past the readahead marker the copy has yet to hit. When the copy
reaches the marker, there is no hole within a window, no readahead is
issued, and the next piece faults on its end again. Every piece then
gets a synchronous read-around of order-0 folios, and threads copying
parts of one file also contend on the i_pages lock to insert them. A
copy from offset 0 avoids this as its first read-around is clamped to
the start of the file.

Look up to two windows ahead for the hole, which reaches past such a
read-around, so the reader keeps an asynchronous window and its folio
order keeps ramping up.

Copying a 16 GiB file out of a private mapping with memcpy() in 8 MiB
pieces, read_ahead_kb 8192, cold page cache, 32 vCPU VM, mean of two
runs:

                                  before    after
  1 thread from offset 2 GiB     7.62 s    2.00 s
  8 threads, one range each      3.26 s    1.08 s
  32 threads, one range each     4.05 s    1.34 s

Random touches read the same amount, and pread() copies and copies that
interleave 7 MiB chunks across threads take the same time within
run-to-run noise.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
The program below copies FILE out of a mapping in 8 MiB pieces, each
thread taking one range. With a cold page cache, run as "pcopy FILE 1
2048" (one thread starting at 2 GiB) and "pcopy FILE 8" on a 16 GiB file:

                        7be4bc52fd9e    patched
  1 thread from 2 GiB      6.92 s        1.57 s
  8 threads                4.00 s        1.04 s

  /* pcopy FILE THREADS [SKIP_MB]: copy FILE out of a mapping */
  #include <fcntl.h>
  #include <pthread.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <sys/mman.h>
  #include <sys/stat.h>
  #include <time.h>

  #define PIECE (8UL << 20)

  static char *map;
  static size_t skip, per;

  static void *copy(void *arg)
  {
  	size_t off = skip + (long)arg * per, end = off + per;
  	char *buf = malloc(PIECE);

  	for (; off < end; off += PIECE) {
  		memcpy(buf, map + off, PIECE);
  		asm volatile("" : : "r" (buf) : "memory");
  	}
  	free(buf);
  	return NULL;
  }

  int main(int argc, char **argv)
  {
  	int fd = open(argv[1], O_RDONLY), n = atoi(argv[2]);
  	struct timespec t0, t1;
  	pthread_t th[64];
  	struct stat st;

  	fstat(fd, &st);
  	skip = argc > 3 ? atol(argv[3]) << 20 : 0;
  	per = (st.st_size - skip) / n / PIECE * PIECE;
  	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
  	posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
  	clock_gettime(CLOCK_MONOTONIC, &t0);
  	for (long i = 0; i < n; i++)
  		pthread_create(&th[i], NULL, copy, (void *)i);
  	for (int i = 0; i < n; i++)
  		pthread_join(th[i], NULL);
  	clock_gettime(CLOCK_MONOTONIC, &t1);
  	printf("%.2f s\n", t1.tv_sec - t0.tv_sec + (t1.tv_nsec - t0.tv_nsec) / 1e9);
  	return 0;
  }
---
 mm/readahead.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 6e5563290287e..d7a511a9fdcbf 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -696,12 +696,15 @@ void page_cache_async_ra(struct readahead_control *ractl,
 	 * E.g. interleaved reads.
 	 * Query the pagecache for async_size, which normally equals to
 	 * readahead size. Ramp it up and use it as the new readahead size.
+	 * Look up to two windows ahead: read-around for a fault further on,
+	 * such as from a memcpy() that touches the end of its source first,
+	 * may already have filled the next one.
 	 */
 	rcu_read_lock();
-	start = page_cache_next_miss(ractl->mapping, index + 1, max_pages);
+	start = page_cache_next_miss(ractl->mapping, index + 1, 2 * max_pages);
 	rcu_read_unlock();
 
-	if (!start || start - index > max_pages)
+	if (!start || start - index > 2 * max_pages)
 		return;
 
 	ra->start = start;

---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261022-bug-mm-readahead-async-overtaken-b2cf5bedea21

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

