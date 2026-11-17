Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923150;
	b=i12lj9gIQrkIoS5AH1+CZTAQgl+TRrxfI8rpSZB5TDG5cG4gg7OXPDzDsXrp/frCIbf2
	 BgYK9g0i8M5e8cOuNPHvRlE8RGAwKsBmKIcXBgge8uCpmuwWanTOVQOW++gt/GJ1yoaGR
	 pXlraq4ZkrRkjy9JhsyNFaSdIpq+YAd/ZZhAGxTPUOH7YokvPfH1DE79+0GisdBZtZ+Qi
	 f2WSelz4veFIBUxpZeBEIejPJUB1Y2k9zX6P7nzeUQqyU2M37Lhi+z736bjFgLUGp3dRr
	 7nuomnVIjlrjWWFDErNKH2Z8aGS79cq1dAsB3Ze27qlzF21T70dSO0E1p+qC9O+tInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923150;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6mppxd/cIrosW68+yt5S8ZWUvHuPMv66XkXmjT0w7js=;
	b=E+bo6zQ2Kzpf+eV8poYBU5qb03NPs+uRUWeZYYzpLCcGpoPibiJtOTgMsL2AEAvtiMNC
	 1MpDZ2GkvjL6Lh3EjlpznGva6WVQXZcZhxZuOznT5CHaKmdWgKOa2wPrRB9/AgoKSoVHn
	 +AVQrgXGs1N+gt9YDk23R39yu3FEsQTiJ2vopAS2V39Uy3YD/CHuPEhV6vou//V3q7pLg
	 E8RjRgQbW0zWgrfXVHnloh+05Gg1Jw9CjEdWh+Pa25DHYqzC7rVneFcvavjLDSjl+qe3g
	 4LGaxrrnV44JKJhIzVo4cBKh1RX0gNu/8eqqcd7m/6Pwt1EDF3KYh7Qvkglv5lgUczQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEZ20twJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD5606A31C;
	Tue, 17 Nov 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEZ20twJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81B21F000C4;
	Tue, 17 Nov 2026 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923150;
	bh=6mppxd/cIrosW68+yt5S8ZWUvHuPMv66XkXmjT0w7js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CEZ20twJbvLBrJB96ue7ccFjag31nbKICwoeE7hSJOyMMiIBSNk5ADPkLbpZ/EoCO
	 U1oHRyNvmV1xj6XrS3XygrfvwNq5rBdyNu9T6t1AUZKbvS40s/CjcSs7A6IgCoZ86k
	 2Bi5nPB0s0LfiJcBW73hOYYPilM0I0/cOeXyzBO+ana0RhkfSJgHYB/rPPy/6dhlxv
	 EgOuhM08gNIKg2mLOGu0LZXru39RQ8s3Cf9IiFpszlRBClFJFztS385bqxh4G3zlhu
	 ImFZwYpufXGf2WIDMWulZNwNApM/PMstmubHh2bzuFqFfRZNj1pHMbQYIGINaZQ0qQ
	 lQUwuvHpOhiRg==
Date: Tue, 17 Nov 2026 14:45:46 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Youling Tang <tangyouling@kylinos.cn>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat
 tree
Message-ID: <20261117-unfreiwillig-flohen-detonieren-3a5a97837345@brauner>
References: <avxQNpa-V0yefH6d@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avxQNpa-V0yefH6d@sirena.org.uk>

On Tue, Nov 17, 2026 at 01:01:42PM +0000, Mark Brown wrote:
> from the vfs-brauner tree.  A bit unsure about this one, the actual
> conflict is exfat_writepages().

Thanks for fixing this up. Dropping the check from exfat_writepages() is
right. There's a small fixup needed on top of your resolution:

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -1002,9 +1002,6 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	if (unlikely(err))
 		return vmf_fs_error(err);
 
-	if (exfat_forced_shutdown(inode->i_sb))
-		return vmf_fs_error(-EIO);
-
 	if (!inode_trylock(inode))
 		return VM_FAULT_RETRY;
 
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -250,9 +250,11 @@ static ssize_t exfat_writeback_range(struct iomap_writepage_ctx *wpc,
 		struct folio *folio, u64 offset, unsigned int len, u64 end_pos)
 {
 	struct inode *inode = wpc->inode;
+	int err;
 
-	if (exfat_forced_shutdown(inode->i_sb))
-		return -EIO;
+	err = exfat_emergency_state(inode->i_sb);
+	if (unlikely(err))
+		return err;
 
 	if (offset < wpc->iomap.offset ||
 	    offset >= wpc->iomap.offset + wpc->iomap.length) {

Thanks!

-- 
