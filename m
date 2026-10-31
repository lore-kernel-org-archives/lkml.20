Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440817;
	b=x/YBrL2PTLx3YjCmwIwiDIZYHVKMVvVWW7AhW5+cOqvchCVYPsyYYIU7DT9n/eh2effM
	 TRDZHpFqE/rJk3T5x7VEbmFKPWsD57POA46jIpBn18ucL1B0ScDxAMBsHy65NYgBqq/d0
	 NyP8d4RAckkcOQPrKQJiUMtsXI39mvgAaXuXGfwe7THcWbAWP0i6p4sJUq3/IJcOW2nI1
	 FTf7Jg9vNcQ5Fx4vuhGpavx7I7P9ZhIeuuncKVmP/2u+5R6RuxuOMVKvLDkcGRFIM9hvF
	 CGJAFQmBCBQTvRgizJRUVM7+Ix9Vk4vMD15qpAOqWK+N2KktkmbRQ1c9AU+5Q+Dvj1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
	b=ZwayqZ9Ad7UbFckETFR5d9un5CoIOYAwv708lCKg7IkcdsjyspP9ogRhigF8Tjd4pwd1
	 jSMD948XJ5kGMBMaxmIBF2GWJ04t3WUCXX2fwSPb0KmZfFg7DEDafGQcPS3J+VknGowkY
	 suZ1x6hD13KNkIdkjTfH19pe0twtVaCZrQXVlyKWv0X3QcYblJBAqrQCatZLku/Cy47n7
	 uVIvwKmEhjGKKDQDEY04rO5RLpNcXqIum86CVEyj/jwL5JQ8HczKWFhsnbUu6nkmruaJT
	 vtJbedB3Gj8W9E5s636/m3oXi7JgHUANB6QbV1XSGQLxG/zeZz7p+73861a7AOBI5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AXQT73/b";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAEB606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAEB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXQT73/b
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso773977f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440815; x=1794045615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
        b=AXQT73/bVTn0IzAc+bFC0/l/P1Qfemy/r1WVQ7Wv9dUuZUKTZWBfejgkXUjiIOSxOp
         OjkgVd8a4Fzg0fTMZkeh6UODjJ0geUP1Le6FnO6MRGzMzlJ4Nn0sChoiByWJnkbZ/n3K
         lgq5Gk23a0mL4PyssgUM8xEz5t4FXamzPySfL9xB0U8TT2JA4rZzoQXyjDdBM9m0wnqi
         NHtshHFK7GCrzd3x9FzpsmJc887A3GyqFm2yRHQWQnnOmAnNwmSxvqo0Gh5pjWhTZIFx
         QEIW3zamH9rNgKMeQA02Xg59I4kPQUf3FphERzpqs+PbZZh6w7rXi8nTHAqKosoMi8Xu
         /tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440815; x=1794045615;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
        b=p260GPu3k/8gkXnbsG1Zk8K/sgONWXnQX1sHi28stB3SpJQjm70duzKVmYRNaQaUOt
         iIzzqG6Dtm9BRayC9hBa5gwpeFDsxkZiRsWnu2MWUXT2lTJcjlzmZ8OzKipSNRek5qkJ
         /7RDzS6UDIbd3As1ItdywmKwVMvz7srVbcHWDU+/YkrmVbfDrSo+it6vutnQe1wOKI28
         LyapnmWiOHTjJjCobxIfXalzbRIVlBAqQoJkZe2RtZFkDkVQPKfz8MyvBUyhsf65Y8ZD
         eV3NgQWrVXGvJbkQpZJAJAkDtTO8LlKw4UfL6uf2vDh+b+RscyH4gdybJhxlXYjhAkPm
         kE+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjOzhxPQ9cTl2hIQA4TWAdmZZ7F4lH3BdN8KDfui54T/i1ciuSw3J43k+jRd767H2rt+SfOXBAnD7iEdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzA5ZtnptVcx709044ponfFK9mY79thD+fkTt6K7MLUvHuxxDC
	hDJVYH1qe32GmArMzvS6xZhF3u1K09mq/PZSWyks/T14FxfcfU3tOrtSinCtKjrGDNs=
X-Gm-Gg: AYBFou0mef8r0lCfdDkwNX9YeEe22+XNroE5JqUWEAYuTWT+7R0ryRYN/g8as2fpZw3
	Oqw+ZwBv2aiLB7SG0xxmHswSMU44rcMT9vCar8dCGaUMKiioe2JndDL+RBlA6rYpCXqPs75Gv+t
	a/OFDwgUUy0q6zODvuNuldefAzxQDsYZNcmxSUjBi+HpcfLmUFNes2wc89JO4sEv2saa6OTPtJ2
	vZ5Ns0AU/fgfuVy6Trr4kiEYAH4XzpEQnQoWX1Bks28e5EwEYPmZddBM4b8abnN6TCCAzybv8hT
	qgZwBZyc/D9/J3ZAQBKyo/qxHsckqWgCMErL+4fG+ogLDIYQuMmG//saLIbgJy/CQm+Hl/6jURu
	KO+UUF1+RVgbUOdQQEDGZFo7o/BY/IWu29PN+ILHEsiWDhgeWJAJZzqHf++YSgFJQjb2iQuGQeU
	NG7xehDIC6MOiaGNS03Snd51BE71Sq9KVyc9/gKeeTet6+GVzlGqHiHtpJ08XZLBC5rqiOhL3IW
	DlYhtyl9qbfsl/eYRxNZxrP9ll/Nz1V3AH8bkq7uhLMxTLbxupu5zlti/+cCjw4vyWBYaGmtJLk
	33vkEBOZi4AtuXE4uCu+i8aJzLPZuW4VhWcL4a19498KVz31qaLUmptIXU0p719tKf34qwM=
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr9638269f8f.50.1793440814932;
        Sat, 31 Oct 2026 03:00:14 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm8352456f8f.30.2026.10.31.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:00:12 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: index root entries lost if indx_new() fails
Date: Sat, 31 Oct 2026 11:00:12 +0100
Message-ID: <20261031100012.1533166-1-m.sadowniczyk@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

If indx_insert_into_root() fails after it has shrunk the $INDEX_ROOT
and allocated the new index block, the entries that were in the root
are lost: the files disappear from the directory, also after a
remount. In the case I reproduced, the create only returns ENOMEM and
ntfs3 logs nothing. I can reproduce it with failslab (script below). I
do not have a simple fix and would like to ask which direction you
prefer.

This is separate from "[PATCH] fs/ntfs3: fix loss of index entries in
indx_insert_into_root()" [2], which fixes a stale hdr_used check that
reaches the same unrestored-root state deterministically with
4096-byte MFT records. This report is about the remaining error paths.

Tree: ntfs3 devel ee1cb3443cff ("ntfs3: add file I/O tracepoints");
fs/ntfs3/index.c is identical in current mainline. The order of
operations below goes back to 82cae269cfa9 ("fs/ntfs3: Add
initialization of super block").

What happens
------------
Line numbers are from fs/ntfs3/index.c in devel. When the new entry
does not fit into the root, indx_insert_into_root():

  1. copies the root attribute (a_root, 1687) and its entries (re, 1713),
  2. shrinks the root to a single END entry with the subnode flag and
     sets mi->dirty (1736-1750),
  3. creates $INDEX_ALLOCATION and $BITMAP (indx_create_allocate()) or
     takes a free block in, or extends, the existing allocation
     (indx_add_allocate()) (1753-1755),
  4. looks the root up again (1758) and sets the subnode VCN in it
     (1778),
  5. creates the new index block with indx_new() (1782) and copies the
     saved entries into it.

Only a failure in step 3 restores the root (1766-1775). These leave it
shrunk:

  - the root lookup in step 4 fails (1758-1764; the VCN is not set),
  - indx_new() fails (1782): one of its two kzalloc()s, or
    ntfs_get_bh() with -ENOENT (fixed for reused blocks by [1]), -EIO,
    -EINVAL or -ENOMEM,
  - the to_move check fails (1802; a crafted image),
  - hdr_insert_de() fails (1838), after indx_mark_used(). This is what
    the stale hdr_used check makes happen with 4096-byte MFT records.

In the last three cases the root points at an index block that was
never written. re and a_root, the only copies of the entries, are then
freed, and the shrunk root is written back with the MFT record.

When the root already had subnodes (indx_insert_into_buffer()
promoting a key after a split), re and t_vbn also hold the VCNs of all
child blocks, so no lookup can reach any existing index block;
readdir, which walks $BITMAP, still lists the entries of the child
blocks. I reproduced this with 4096-byte MFT records on devel with [2]
applied (without it the 7th create already fails and loses the first
six files; the test kernel also had a debug printk and a local
stand-in for the pending ntfs_readdir() unlock fix): 247-character names,
failslab failing indx_new() when the 25th create pushes down a root
with subnodes. After a remount, readdir lists 18 of the 24 existing
files and the lookups of all 24 fail. Every index insert can get here:
create, mkdir, link and rename in $I30, the re-inserts in
indx_delete_entry() and ni_remove_name_undo(), $Secure ($SII, $SDH)
and $Reparse. I only tested $I30 creates.

How likely it is outside fault injection: the two kzalloc()s are small
GFP_NOFS allocations. As far as I can tell, the page allocator keeps
retrying them rather than failing them (out_of_memory() kills nothing
for a !__GFP_FS allocation but reports progress), unless the task is
an OOM victim, which includes a task that already has a fatal signal
pending. ntfs_get_bh() gets its buffers through sb_getblk() with
__GFP_NOFAIL. So I expect this to be rare now, apart from the
4096-byte MFT record case fixed by [2]. When it happens, though, the
loss is silent: nothing calls ntfs_set_state(NTFS_DIRTY_ERROR), and the
volume is marked clean at umount.

Reproducer output
-----------------
Environment: virtme-ng VM, x86_64, KASAN and lockdep enabled (no
reports), mkntfs from ntfs-3g 2026.9.28, 1 KiB MFT records.

  7.3.0-rc1-virtme
  n=1: create B: errno 12, 0 entries in d1
  n=2: create B: errno 12, 0 entries in d2
  n=3: create B: ok, 2 entries in d3
  n=4: create B: ok, 2 entries in d4
  after remount:
    d0: 1 entries
    d1: 0 entries
    d2: 0 entries
    d3: 2 entries
    d4: 2 entries

d0 is a reference directory with one file A (201 characters). Each
other dN is a fresh directory with the same file A, then file B (same
length) is created with failslab failing the n-th allocation made with
indx_new() on the stack. Creating B moves the root to a new index
block, because two such entries do not fit into a 1 KiB MFT record.
According to the failslab stack traces, n = 1 is the kzalloc() of the
node and n = 2 the kzalloc() of the index buffer; both lose A. n = 3
is not logged because that allocation has __GFP_NOWARN, and creating
B succeeds; most likely it is the GFP_NOWAIT xarray node allocation
under sb_getblk(), which is retried with __GFP_NOFAIL. n = 4 injects
nothing and ends the loop. The results for n = 1 to 4 were the same in
eight runs on this kernel; whether a silent n = 3 appears presumably
depends on the page cache.

In earlier runs with an older version of the script, which filtered
on indx_insert_into_root() and did not exclude SLUB sheaf refills,
failures in the two kmemdup()s and in attr_allocate_clusters() under
indx_create_allocate() left A in place, as expected. The failed
kmalloc() of an empty sheaf in __pcs_replace_empty_main() falls back
without an error but made n vary between runs, so the script now
rejects it.

Excerpt of ntfsinfo -F /dN (ntfs-3g) on the image afterwards, and the
stack of the failure at n = 1 (failslab verbose output; fault-injection,
syscall-entry and "?" frames removed):

  === d0
  Bytes Used:              936 (0x3a8) bytes
  Bytes Allocated:         1024 (0x400) bytes
  Dumping attribute $INDEX_ROOT (0x90) from mft record 27 (0x1b)
          Index Size:              520 (0x208)
          Index header flags:      0x00
          Index entries total:     2
  === d1
  Bytes Used:              576 (0x240) bytes
  Bytes Allocated:         1024 (0x400) bytes
  Dumping attribute $INDEX_ROOT (0x90) from mft record 29 (0x1d)
          Index Size:              40 (0x28)
          Index header flags:      0x01
          Index entries total:     1
  Dumping attribute $INDEX_ALLOCATION (0xa0) from mft record 29 (0x1d)
          Index entries total:     0
          INDX blocks total:       0
  Dumping attribute $BITMAP (0xb0) from mft record 29 (0x1d)
  === stack of injected failure n=1
  __kmalloc_cache_noprof+0x89/0x5b0
  indx_new+0xcc/0x5c0
  indx_insert_into_root+0xbc4/0x1800
  indx_insert_entry+0x546/0x760
  ntfs_create_inode+0x1b2f/0x5780
  ntfs_create+0x22/0x30
  lookup_open+0xcf9/0x16e0
  path_openat+0xe6b/0x2070
  do_file_open+0x209/0x480

"Index entries total" includes the END entry; "INDX blocks total"
counts blocks whose $BITMAP bit is set.

Why restoring the root is not enough
------------------------------------
I first tried to route the later error paths through the existing
"Restore root." code. That did not help for the case above: in the
failed directory the MFT record has 576 of 1024 bytes in use after the
shrink and the new $INDEX_ALLOCATION and $BITMAP attributes. Growing
the root back from 40 to 520 bytes needs 480 more, 1056 > 1024, so
mi_resize_attr() fails. Its fallback, ntfs_set_state(NTFS_DIRTY_ERROR),
does nothing here either: ntfs_create_inode() has already set
NTFS_DIRTY_DIRTY, so ntfs_set_state() returns early on the cached flag,
and the volume is marked clean again at the next sync or umount. (That
early return seems to drop any NTFS_DIRTY_ERROR raised after a write
has marked the volume dirty, which may deserve a look of its own.)

Presumably the root is shrunk first to make room for the new
attributes; in this case, once indx_create_allocate() has succeeded,
the old root no longer fits.

The undo added to indx_insert_into_buffer() in 63e92a0c5a0d ("fs/ntfs3:
Undo critial modificatins to keep directory consistency") restores the
split buffer from its saved copy and frees the new buffer's bit when
indx_insert_into_root() fails, which assumes the root was left as it
was. The subnode case above goes through this undo: the split block is
restored, but the root stays shrunk.

Possible directions
-------------------
  a) On failure after indx_create_allocate(), undo it: remove the
     $INDEX_ALLOCATION and $BITMAP it added, free the clusters, reset
     indx->alloc_run and the inode sizes, then restore the root. For
     indx_add_allocate() the plain restore fits unless the attributes
     grew in the same record.
  b) Change the order as ntfs-3g does in ntfs_ir_reparent(): add the
     allocation while the full root is still in place, build and write
     the new index block, and only then shrink the root. In the case
     above the full root leaves no room for the two new attributes
     (936 + 120 > 1024), so they would go to an extension record with
     an $ATTRIBUTE_LIST, and with 1 KiB records that would happen to
     most directories that outgrow their root. A variant: allocate the
     clusters and write the block first, then shrink the root and add
     the attributes; a failure there still leaves room to restore the
     root.
  c) A smaller step: do indx_new()'s two kzalloc()s, the to_move check
     and the copy into the new buffer before shrinking the root. That
     removes the allocation failures from the window, but not
     ntfs_get_bh() errors.

There is no patch for this because the simple restore does not work
and the real fix is a design choice; I can write and test whichever
direction you prefer.

Reproducer
----------
Needs root, cc, mkntfs and a v6.2+ kernel with CONFIG_FAULT_INJECTION,
CONFIG_FAILSLAB, CONFIG_FAULT_INJECTION_DEBUG_FS and
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER (FRAME_POINTER on some
architectures),
ntfs3, loop devices and kptr_restrict <= 1. The stack filter limits
failslab to allocations with indx_new() on the stack, and fail-nth
only counts allocations that pass it. Without the filter the injection
also hits ntfs_new_inode() and triggers the al_destroy() oops that
"[PATCH v2] fs/ntfs3: Refine the ni cleanup" (Edward Adam Davis,
2026-08-27) fixes. The script restores the failslab settings it
changes.

---- repro-root.sh ----
#!/bin/sh
# ntfs3: a create that fails in indx_new() under indx_insert_into_root()
# loses the entries that were in a directory's $INDEX_ROOT.
#
# Needs root, cc, mkntfs (ntfs-3g) and a v6.2+ kernel with
# CONFIG_FAULT_INJECTION, CONFIG_FAILSLAB, CONFIG_FAULT_INJECTION_DEBUG_FS
# and CONFIG_FAULT_INJECTION_STACKTRACE_FILTER, kptr_restrict <= 1. Uses a
# 64 MiB image in a temporary directory (or in $1).
#
# A fresh directory gets one file with a 201-character name. Creating a
# second one does not fit in the $INDEX_ROOT, so indx_insert_into_root()
# shrinks the root and creates a new index block with indx_new(). That
# create runs with /proc/thread-self/fail-nth = n; failslab applies the
# stack filter before counting, so only allocations with indx_new() on
# the stack count and the n-th of them fails (SLUB sheaf refills, which
# fall back without an error, are excluded). n goes up until nothing is
# injected.
set -eu
trap 'exit 130' INT TERM
w=$(mktemp -d "${1:-/tmp}/ntfs3-root.XXXXXX")
fs=/sys/kernel/debug/failslab

# open(O_CREAT) with fail-nth set; reads fail-nth back afterwards.
# Prints "<created 0|1> <errno> <fail-nth left>" (left 0: injected).
cat > "$w/failnth-open.c" <<'EOF'
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	char nbuf[16], rbuf[32] = "";
	int nth, fd, err, len;

	if (argc != 3)
		return 2;
	len = snprintf(nbuf, sizeof(nbuf), "%d", atoi(argv[2]));
	nth = open("/proc/thread-self/fail-nth", O_RDWR);
	if (nth < 0 || pwrite(nth, nbuf, len, 0) != len)
		return 3;
	fd = open(argv[1], O_CREAT | O_WRONLY, 0644);
	err = fd < 0 ? errno : 0;
	if (pread(nth, rbuf, sizeof(rbuf) - 1, 0) < 0 ||
	    pwrite(nth, "0", 1, 0) != 1)
		return 4;
	if (fd >= 0)
		close(fd);
	printf("%d %d %d\n", fd >= 0, err, atoi(rbuf));
	return 0;
}
EOF
cc -O2 -o "$w/failnth-open" "$w/failnth-open.c"

modprobe ntfs3 2>/dev/null || :
mountpoint -q /sys/kernel/debug || mount -t debugfs none /sys/kernel/debug
# Restore the failslab settings this script changes when it exits.
saved=
for k in ignore-gfp-wait require-start require-end reject-start reject-end \
	 stacktrace-depth verbose times; do
	saved="$saved $k=$(cat $fs/$k)"
done
trap 'for kv in $saved; do echo "${kv#*=}" > "$fs/${kv%%=*}"; done' EXIT

sym_range() { # sym_range <symbol>: start and end address, nothing if unknown
	LC_ALL=C sort /proc/kallsyms |
	awk -v s="$1" '$3 == s && a == "" {a = $1; next} a != "" && e == "" {e = $1}
	    END {if (a ~ /[1-9a-f]/ && e != "") print a, e}'
}
set -- $(sym_range indx_new)
[ $# = 2 ] || { echo "indx_new not in /proc/kallsyms (ntfs3 not loaded," \
	"kptr_restrict=2, or inlined in this build)" >&2; exit 1; }
echo 0x$1 > $fs/require-start
echo 0x$2 > $fs/require-end
set -- $(sym_range __pcs_replace_empty_main)  # SLUB sheaves, v6.18+
if [ $# = 2 ]; then
	echo 0x$1 > $fs/reject-start
	echo 0x$2 > $fs/reject-end
fi
echo N > $fs/ignore-gfp-wait
echo 32 > $fs/stacktrace-depth
echo 2 > $fs/verbose

img=$w/img
mnt=$w/mnt
truncate -s 64M "$img"
mkntfs -F -Q "$img" >"$w/mkntfs.log" 2>&1 || { cat "$w/mkntfs.log"; exit 1; }
loop=$(losetup --find --show "$img")
mkdir "$mnt"
mount -t ntfs3 "$loop" "$mnt"
uname -r

x=$(printf '%0200d' 0)
# d0: reference directory with A only.
mkdir "$mnt/d0"
: > "$mnt/d0/A$x"
n=1
while :; do
	d=$mnt/d$n
	mkdir "$d"
	: > "$d/A$x"
	r=$("$w/failnth-open" "$d/B$x" $n) || { echo "helper failed"; exit 1; }
	set -- $r
	res=$([ "$1" = 1 ] && echo ok || echo "errno $2")
	echo "n=$n: create B: $res, $(ls "$d" | wc -l) entries in d$n"
	[ "$3" = 0 ] || break
	n=$((n + 1))
done

umount "$mnt"
mount -t ntfs3 "$loop" "$mnt"
echo "after remount:"
for d in "$mnt"/d*; do
	echo "  ${d##*/}: $(ls "$d" | wc -l) entries"
done
umount "$mnt"
losetup -d "$loop"
echo "image kept in $img"
---- end ----

I used an AI assistant (Claude Code with Claude Opus 5.5) to analyse
the code, write the reproducer, run it in a VM on unmodified devel and
draft this report; I reviewed its output, the ntfsinfo dumps and the
failslab stacks. The GFP_NOFS and OOM statements, the statements about
the volume's dirty flag and the proposed directions come from reading
the code and are not tested.

[1] https://lore.kernel.org/ntfs3/20261030155631.953779-1-m.sadowniczyk@gmail.com/
[2] https://lore.kernel.org/ntfs3/20261031095944.1532712-1-m.sadowniczyk@gmail.com/

Thanks,
Maciej
