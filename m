Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3B39FCB4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791835139; cv=none; b=MdeL/7OEWK1WM/FxLPvHAvdmzXppBLuj0sFHh4yT4o7EQJAO7JhfPadJJ8GyswAwAnQpYPFQOHrK3/rFuGIdaZ06dvi4bviVq6pXOj51RHTXiPKSPzELXh8O5vHIxxWQP0bH3LgxIfSbes5ICBIRPjCqRIrNfMV0n4gAcMSnk5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791835139; c=relaxed/simple;
	bh=lpb+82MjAgQXyYSp9xzweM/Khz/Et/3JlhtdJq1vP8Y=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=lMlsbbpXkJP1yOh3VXhBemSOv9hMVyYDzL4GdMVI6OFSSPhGk9VJNcgQ7+2H9gUlaN/Do07AaGFAG5OOnYnLl0L6xken5v59Nml3OklCb4C29tmA0xRKGNoPuQT4NbmfOcUn3svISNR0ZBMd3rGVEghWjkrLIZAuNC4R9q6PvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=w3nqMXLT; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=HuheKo65; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="w3nqMXLT";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="HuheKo65"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791834979; bh=suzyxHEwPNR4eX+WAHR3lNn
	UOrfGQSownd3tU1/1O5g=; b=w3nqMXLT9Mr6Dxu6KK7T+0tmnP6tjX6Zz91gqBjw6+1tHPCWB+
	GVdftQnYAhxUDMuQRvfboR8BE22nILVMCLAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791834979; bh=suzyxHEwPNR4eX+WAHR3lNn
	UOrfGQSownd3tU1/1O5g=; b=HuheKo65C9HsmI7xfVlhSdUF5kppcP58tDXwRU8M5baQpodS6D
	j9JcE37HvE80Mv2EzYFB9NVO3ih0Ax0XnY3Ylh6GAhei+wE9DfZIOkbtl/wRIR3ddkBDCeV/8AK
	rPOYtCMl0s3d+9+fJYisC17/eocSHzNXuRlDxt4xW6qgjHKdysxdZxFf2wCpJ2kvCKogF9aUGuK
	Tey779BtFD44vgkfDqXYl8cBO+mAwqS3pTJGiIgsp0ZjY+nd0uIJx21TtohQdeJX/e/iaaqZRGs
	nRDif2vMrm5Ycrled/69Hy/Kt5mRAemy371F7zFRcSY0qaMStUhvGxxXnzGXQSbn0oQ==;
From: "Richard Weinberger" <richard@nod.at>
To: "Nan Lin" <lin.nan@h3c.com>, <chengzhihao1@huawei.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: AW: [PATCH] ubifs: fix host inode TNC offset when deleting an xattr
Message-ID: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
In-Reply-To: <20261012075046.1268480-1-lin.nan@h3c.com>
References: <20261012075046.1268480-1-lin.nan@h3c.com>
Date: Mon, 12 Oct 2026 19:56:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Mon, Oct 12, 2026, 09:58 schrieb Nan Lin <lin.nan@h3c.com>:
> When ubifs_jnl_delete_xattr() deletes an extended attribute, it writes
> a group of three nodes to the base head: the xent node, the xattr
> inode node and the host inode node. The host inode node is actually
> packed at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but the
> position registered into TNC is computed backwards as
> xent_offs + len - hlen. The two differ by the group tail padding,
> ALIGN(hlen, 8) - hlen.
>=20
> Whenever the host inode's data_len is not a multiple of 8, the offset
> registered in TNC points 1 to 7 bytes past the real node header. The
> wrong offset gets committed into the on-flash index, and on the next
> mount read_znode() fails the offs & 7 alignment check, returns -EINVAL
> and switches the filesystem to read-only mode, reporting
> "bad indexing node ... error 2".
>=20
> Which inodes are affected depends on data_len:
>  - block/character devices always carry data_len =3D 4 and are always
>    affected;
>  - symlinks carry data_len =3D strlen(target) and are affected unless
>    the target length happens to be a multiple of 8;
>  - regular files, FIFOs and sockets carry data_len =3D 0 and are
>    unaffected.
>=20
> The bug reproduces by setting an xattr on a symlink with attr -Rs and
> removing it with attr -Rr: after unmount and remount, readlink()
> fails, the index node is rejected with error 2 (bad branch offset) and
> the filesystem turns read-only.
>=20
> Fix the offset computation by accumulating the group layout forward
> instead of subtracting from the total length: register the host inode
> at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, which matches the
> packed position exactly. The host node length hlen is already correct
> and stays unchanged.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org

> Signed-off-by: Nan Lin <lin.nan@h3c.com>
> ---
>  fs/ubifs/journal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Good catch!

Please ask your LLM to write less wordy commit messages.
How about something like that:

ubifs: fix host inode TNC offset when deleting an xattr

ubifs_jnl_delete_xattr() writes a group of three nodes: the xent, the
xattr inode and the host inode. The host inode is packed at
xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but its TNC position is
computed backwards as xent_offs + len - hlen. Since len includes the
group's tail padding, ALIGN(hlen, 8) - hlen, the two differ whenever
the host inode's inline data length is not a multiple of 8. This
affects symlinks and device nodes.

The unaligned offset ends up in the on-flash index and the next mount
rejects the index node, turning the filesystem read-only.

> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 40a95a2fad50..1a32d641e658 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1943,7 +1943,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, co=
nst struct inode *host,
> =20
>  	/* And update TNC with the new host inode position */
>  	ino_key_init(c, &key1, host->i_ino);
> -	err =3D ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, has=
h);
> +	err =3D ubifs_tnc_add(c, &key1, lnum,
> +				xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ,
> +				hlen, hash);

How about adding a new variable instead of open coding the offset?
The offsets are already super hard to understand, more magic doesn't
make it better.

e.g.
host_offs =3D xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ;

Thanks,
//richard
