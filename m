Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965054;
	b=Ve/wXtq3EV7neGaTN3L1dHmTBJ2P+11YK0dHu6T3+/Thp9kRTEbtgfrcs5saNr8XtNMU
	 lOz7+7HKFZhPGaOKeF1WAP6SouQpE9GJk3cXou/YQOmTqXx2llPX9u3Pv8ri5P0rw+5XZ
	 GXPqsxDK2bO4k8dWfAdCGE9EEXNHYYKAksyA+FlLEJCW5vdNmTdJaqLawdXBeAbxZL6bp
	 Ne2uWhDSqp3k6vuRRrOoRTG4SF3jLCwFji7RBfnHQNSfcv/pbl3+ElCWObopLvbfS3mIa
	 6k9RtpEKbULtPivDz0mUigrtiQNQiqC4exPjSRslwvwGmoPGGuC0Pb1d4ame8MbzlHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965054;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q5vDhha9k2TtVDKsmQFVY/wIbznxiix0TX92NWVOtSE=;
	b=kzSyH3DDQhk3/Lz74WYcMyKLkDoqQE65RVXNxbq/pb++/Saak0n8yqZYDvMXHctzYue+
	 JL6t4HyGaM/sawihgngMmsHoa2Q7ch7Dn9wlOnTsYSs36UoWIi4Y9HrVrb56IGmjheKl/
	 HKnWcYsVuU0qLHA4XaGYwPk7PaAmrstC8bBUO70rh3PCghBokYlMJ+4zM1BdXaDPLkdHM
	 IrjKBBpu2wr8+uPH3taK1TXBAVPzBgig3M/F45mrRiQhywJyE4gAGZEZUFA+5Y7E5vYOi
	 Mc9bQSkKwb2Vmm3ZB/tdWfui3Z6i/eHOvlouZkiU3R+y+rIA5OykXBJx5gg7RDhxY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWAEE05y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F90606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWAEE05y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89AA1F008A3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965053;
	bh=Q5vDhha9k2TtVDKsmQFVY/wIbznxiix0TX92NWVOtSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BWAEE05yHLR5HaHKRTx9ZFdNsjIl+dKu2dEgzAooIFMDECdjMc4PO86e4TdV6zVIX
	 BurOLIiK8gs6P5y54BxkVKSJzGzY3rxFLiImE5aGMubeO5BP8jzLDPJ2CtL3iKa1rp
	 4a9u6o+KZBUwJguj3wzgLOHhvxZJIsr58cRXcGSHlxgXz27jEycWTihFYAcFaJm4Wh
	 C1A46tQELellL/6Uqn77oT9xJz8QS9REKKvaBKS1G5QrTP2874yoKbdkx8uAQsMxq1
	 ZAvuflJ+YqgNZqk6Z6iayW3a/t5S3bn7mx8NhW26dGGXmrUa045HQCeEPFGVHSfOJG
	 XEuzTFoJ/+ofg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so74327066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw1L4LlSj/eWaPKomTqBJz6V9Cu1o5h/ybKqvRsXRrFzV4VrCvG+4EP1GKKX1in6aSbJGTF/T8mhVail2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q5fjA9mgSr6/RQ9UGVqbpiPcvfuKH5JTW5Y06mY/eUtS4ctki
	GZoAsdXpKOh1s02Je34dq0+nGKg8Hr4lK9NlIQ+BehybbuLoBlWyxUEPL9ENdQk5jVZKjIbshR6
	Zdva88/3T60Jy/NY7CCq6j9Ds7NF/nqk=
X-Received: by 2002:a17:907:94d1:b0:c4d:31ad:9de9 with SMTP id
 a640c23a62f3a-c4d3552e0fcmr223184466b.42.1793965052540; Fri, 06 Nov 2026
 03:37:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106063059.2904988-1-liubaolin12138@163.com>
In-Reply-To: <20261106063059.2904988-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 20:37:19 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8JHaJcs8j-Jbf3UecDD-SKEnhAsMd_7XJ1eh8HcC=UpA@mail.gmail.com>
X-Gm-Features: AclHuK-24WFzQvAxOc4B5VSNDDggIGmwCpTdCS96N05fR7zUzm5zFz5Cf6aIijU
Message-ID: <CAKYAXd8JHaJcs8j-Jbf3UecDD-SKEnhAsMd_7XJ1eh8HcC=UpA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ntfs: support O_TMPFILE
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:31=E2=80=AFPM Baolin Liu <liubaolin12138@163.com> =
wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
Hi Baolin,
>
> This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
> regular file's contents and metadata before publishing it with linkat().
> Unpublished files are reclaimed when their last reference is released.
> O_EXCL prevents publication.
>
> The series keeps the same five changes and ordering as v1 and v2:
>
>   1. Initialize inherited ACLs after allocating the new MFT record.
>      Anonymous creation needs its inherited ACL stored before returning.
>   2. Preserve prepared atime and mtime when publishing the inode through
>      the hard-link path.
>   3. Initialize the new FILE_NAME's packed EA size, since a temporary
>      file may already have EAs when it is published.
>   4. Complete unlinked-file attribute writes before dropping the cache,
>      including EAs and data copied during resident-to-nonresident
>      conversion before publication.
>   5. Add O_TMPFILE creation and publication support.
>
> As requested in review, patch 2 gives the new FILE_NAME and directory
> index entry the same ctime as the inode. The inode ctime is updated only
> after the link succeeds. Patch 1 also initializes a newly created
> FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
> caused by moving ACL initialization later in v1.
>
> In v3, patch 4 also preserves data copied by
> ntfs_attr_make_non_resident(). As reported in review, growing DATA in a
> nearly full MFT record can convert SECURITY_DESCRIPTOR and leave its
> contents only in a dirty folio. Evicting the zero-link attribute inode
> then discards those contents.
>
> Write the resident value to the newly allocated clusters before
> committing the conversion. If that write fails, release the new clusters
> and retain the original resident value. Propagate the error to the caller
> instead of continuing with another attribute. Patches 1-3 and 5 are
> unchanged in code from v2.
>
> While implementing and testing O_TMPFILE, we also found pre-existing
> NTFS bugs in attribute rollback and ACL lookup. These include stale
> attribute inodes left cached after failed creation, which can cause
> subsequent creation to return EIO even after space is freed, incorrect
> ACL inheritance when the default ACL is not cached, and a fixed-size
> read buffer that cannot handle larger ACL values. The underlying bugs
> predate this series.
>
> To keep this series focused on O_TMPFILE support and review
> feedback, we are leaving these existing bugs to a separate bug-fix
> series. We plan to submit those fixes after this series is accepted and
> merged. These issues remain present with this series applied.
>
> Tested this five-patch series in QEMU with four CPUs, NTFS debug and
> lockdep enabled. The requested unchanged xfstests generic/004 and
> generic/389 passed. Tests covered creation, publication, last-reference
> cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
> EAs, direct I/O, mmap, allocation and concurrent publication. Published
> data and metadata were checked after cache eviction, remount and reboot.
> Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
> the new FILE_NAME and the directory index.
>
> The conversion regression uses 1 KiB MFT records and varies EA sizes
> before writing 4 KiB to anonymous and ordinary files. Offline inspection
> compares SECURITY_DESCRIPTOR contents with the original resident value.
> The v2 kernel loses converted security descriptors and some EAs; v3
> preserves them with 512-byte, 4 KiB and 8 KiB clusters, including after a
> fresh boot. An injected block write error returns EIO and leaves the
> resident security descriptor and EA intact. Free space is unchanged after
> that failure, and retrying the write succeeds.
>
> Changes in v3:
> - Extend patch 4 to write converted attribute data before switching the
>   record to nonresident form, addressing the v2 review.
> - Preserve the resident value on conversion write failure and propagate
>   conversion errors.
> - Add conversion and I/O-error regression tests and rerun generic/004
>   and generic/389.
> - No code changes to patches 1-3 and 5; add Hyunchul Lee's Reviewed-by.
>
> Changes in v2:
> - Update FILE_NAME and index ctime as requested in review.
> - Set the source inode ctime only after successful hard-link creation.
> - Initialize creation FILE_NAME ctime after inherited ACL setup.
> - Run generic/004 and generic/389 on the standalone five-patch series.
> - Rebase onto ntfs-next commit
>   564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
>   tmpfile callback signature and documentation context.
> - Resolve patch 1 against the updated early ACL error handling in
>   __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
> - Keep the original five-patch scope; submit fixes for the pre-existing
>   attribute rollback and ACL lookup bugs separately after this series
>   is merged.
> - No functional changes to patches 3 and 4.
>
> Baolin Liu (2):
>   ntfs: initialize inherited ACLs after allocating the MFT record
>   ntfs: support O_TMPFILE
>
> Xuewen Wang (3):
>   ntfs: preserve timestamps when creating hard links
>   ntfs: initialize packed EA size when creating hard links
>   ntfs: write unlinked file attributes before dropping their cache

Can you check Sashiko's review comments? I think some of the points
raised in Sashiko=E2=80=99s review are worth looking into.

https://sashiko.dev/#/patchset/20261106063059.2904988-1-liubaolin12138%4016=
3.com

Thanks.
