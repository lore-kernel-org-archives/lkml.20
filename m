Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824730;
	b=n0nxK+XR4lwn/jgl/RqAlILkTayMJ0HJ3ZcKJL8I371t0umhNtw7wC7WWoGw9KM0nObC
	 BcMTxCBYdKQZDlJhfUIFsB0N+j+j4vQ/DaGiSVPM71Uh+v0Y1kR7ZAMxJlXf3zcMYeTBn
	 qXaO54GyUKmH3ArF1RRkv4jEREMcAmbd/FlEdxHwZqbdELEjSDJUjC9uBYYwqOKrEci3+
	 Qqx3aYOIjBkVaem1yb1GwnGWBQqIKBcfOkG6nSy65kRc+c5e2pk3QOTnvW3S/Ny5uVvcN
	 xnWZ6X+c+k3X9wARFrie9SjeytJvgNVBcNRxShS4G6AhYQbbbHRXjYffu48gv4MTDUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824730;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GN0m2ePdXDvVZP6JO8tBb1gyGs8KxUGYFzEjJvxHmQg=;
	b=K/ySbm/84tXrC0FGBbqVh9n9PgwKNMuDIxfiIt9lXOLHF4kAXtw9p9FCDf5fiSdVP9fE
	 DGePcYlrLQiCuo8XGhH1Nob0oLWXHmPVnVQjU28dJK9l3GmB04klnkzVN7JjEnFwjnFrs
	 XRFec9pbsxNUL8SUzDJX8A8SmOlc5JTGeHjSUWDN2fUtiHYUCxak2J1rYzpM4bO4/+yGt
	 /OBSfDuT9moJWZ/HpOMMWusqwQE5Z3QCaBn7Vsib2K8v6G7Rj7YoBt5LxrCKg05F4vNg5
	 vg7PvW6LTI9EatWbZChbJP4yfSV+kEWbtKIaKABbTilVx6A70PWOxMLqFyiXX44RCAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWlcRarH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A4606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWlcRarH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE41B1F000C4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824729;
	bh=GN0m2ePdXDvVZP6JO8tBb1gyGs8KxUGYFzEjJvxHmQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jWlcRarHvSaH9/gcmamwJbhOM3vro8st5UkW6E39dOLLvDgXeKCZj5GUovK59a50A
	 4XI1kcfwPLtopQvRfs8W69+MHUcWXAOSfLt4PT/IUab1ezJKyaboayBmgq15p/sG6z
	 pTK9Xqw708uFfxP9eGwWxOVhr+9lfvVphEn4kj7OdJE23exKv8RVoD2Vl2LTp5mqcA
	 N8FtoUVP5la6YiOlmuPxJgdwHkp7NRx51Gpo9OHHjayZod1VA3vkbp1UVdgD4YXiRa
	 OVXbI7yGJsnSEKbzI/UoA+Zrs0gI5+drg4ehEgw9GIJROIhs+iG4CAD8lSGeTsQ6Mk
	 XODh8ZvDeV0GA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3005332d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:25:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHe/N653zD7gwhRLwvq1gzLLcwk8UKsbXwDtM9P936Kunh9Ucpe1n6Dm/ZhENUK7dNLngI9cfbPDFgcmg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YJnNvnPe/GGawAEOqV4S0L0QBGFDXSz4expxIRI60+qofDHN0
	SpGhrlvkzGwBmNKepPa6zYTuFuPywxpKoamiKkXwD+aacqZQXzJJyUfIgWerU6Iymi+P6hoe2Fi
	VOropudgIKbMiOT8Tvi315bdYYhAm4bA=
X-Received: by 2002:a05:690e:4281:20b0:679:b16a:8dae with SMTP id
 956f58d0204a3-67d897be771mr3663304d50.103.1794824729191; Mon, 16 Nov 2026
 02:25:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132609.209957-1-liubaolin12138@163.com>
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 16 Nov 2026 19:25:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9dDbh3ZrjhfzwtujeKmXwGZb0LgFnfQUP_gAvT7P=k3g@mail.gmail.com>
X-Gm-Features: AclHuK9TVKUtMTvgG-DPhFvxb21axi8lz6DK-kjpvhgHHQAy0KIn2Kr-quYRgyg
Message-ID: <CAKYAXd9dDbh3ZrjhfzwtujeKmXwGZb0LgFnfQUP_gAvT7P=k3g@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] ntfs: support O_TMPFILE
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:26=E2=80=AFPM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> This series adds O_TMPFILE support to fs/ntfs. Applications can prepare
> a regular file's data and metadata before publishing it with linkat().
> Unpublished files are reclaimed when their last reference is released;
> O_EXCL prevents publication.
>
> Patches 1-4 fix creation rollback; patch 5 moves ACL initialization after
> MFT allocation. Patches 6-7 fix large ACL reads and cold-cache ACL lookup=
.
> These changes make inherited ACLs persistent and clean up failed creation=
.
> Patches 8-9 preserve timestamps and packed EA size when publishing a file=
.
> Patch 10 writes internal attributes before zero-link inode eviction.
> Patch 11 flushes previously dirtied attributes before ordinary unlink or
> rename-overwrite; patch 12 adds anonymous creation. The five v3 patches
> are now numbered 5, 8, 9, 10 and 12.
>
> Changes since v3:
> - Include the six cleanup and ACL lookup fixes to address the review
>   concerns about the creation path.
> - Also fix the preexisting loss of dirty internal attributes on unlink:
>   flush before removing names, rescan under the MFT locks, and return
>   writeback errors before changing the namespace.
> - Guard writeback with I_CREATING after failed creation clears I_NEW.
> - Check the attribute inode's own link count for synchronous writes and
>   conversion, since it can remain zero after the base file is published.
> - Rebase onto b028412297e6, which includes Wahid Khan's named-stream v9.
>   Retain its NOWAIT and zero-link protections and propagate conversion
>   I/O errors while skipping busy candidates.
> - Add Fixes tags. Drop Reviewed-by from the changed ACL initialization
>   patch; retain it on the unchanged hard-link, packed-EA and O_TMPFILE
>   code. The FILE_NAME/index ctime update requested in v1 review is retain=
ed.
>
> The final series was tested in QEMU with four CPUs, NTFS debug and lockde=
p.
> generic/004 and generic/389 passed, along with creation, publication,
> cleanup, permissions, idmapped mounts, EAs, streams, mmap, direct I/O,
> concurrency, full-volume retries, and persistence checks.
>
> Unlink and rename-overwrite preserved dirty EAs with 512-byte/4 KiB/8 KiB
> clusters. Directory removal/replacement, hard links and concurrent EA/fsy=
nc
> tests passed. Injected EA writeback EIO left names and link counts unchan=
ged;
> writing new data and retrying succeeded.
>
> Earlier validation of the preceding fixes covered cold-cache/large ACLs,
> 1536 injected creation failures, offline reclamation, failed-creation
> writeback, publication with a retained zero-link EA inode, SD/EA conversi=
on
> and block-write EIO, and the named-stream conversion paths. These patches
> are unchanged in this update. Test-only hooks are not included.
>
> v3: https://lore.kernel.org/r/20261106063059.2904988-1-liubaolin12138@163=
.com
> v3 review: https://sashiko.dev/#/patchset/20261106063059.2904988-1-liubao=
lin12138%40163.com
>
> Baolin Liu (5):
>   ntfs: initialize inherited ACLs after allocating the MFT record
>   ntfs: read ACLs using their stored size
>   ntfs: load uncached ACLs through get_inode_acl
>   ntfs: flush internal attributes before unlinking a file
>   ntfs: support O_TMPFILE
>
> Dandan Wu (2):
>   ntfs: return zero after removing nonresident attributes
>   ntfs: discard attribute inodes after failed initialization
>
> Xuewen Wang (5):
>   ntfs: discard reparse attributes when creation fails
>   ntfs: remove remaining attribute lists on creation failure
>   ntfs: preserve timestamps when creating hard links
>   ntfs: initialize packed EA size when creating hard links
>   ntfs: write unlinked file attributes before dropping their cache
Applied them to #ntfs-next.
Thanks!
