Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65D39A057
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866771; cv=none; b=MjMJ6VKdqsyW6N7vEZ73//fCpthLgcbWhuRzgUjlLNPxMxz7K6++eo6soDLMgQ9QLD79ml3vTW/rtWzaTVzxLLNVrJC5ODnlSr2LMs8sF9kIwVpBjyAdtNgkSxyveqaj+nQC65hAmYFAl4zGCZvV3jsnOB3T7ChQWc1aiu4thZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866771; c=relaxed/simple;
	bh=hgWKCOf/eN03RAsxd+30LvVO6OujKBt2mRMA9rl/iUM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=j2kjJlWxPuQEUQNquvqjyEFqRfEiLi+OboyQ4ufgw7UsEDIZoJT3vBUy6LoUafg81FJFeWKA7eoR1hzXsuQt7my5zh74OvdbcU3kZJalv3gyNWaJEtf3evplxW/R5vkg4ryuqe2RkVawpyMgbF40kQavopFLVaakFAT+yEVLYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b=QRhJ5sVW; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="QRhJ5sVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1790866766; x=1791471566; i=aros@gmx.com;
	bh=m3w3HTT/yRiQaqx+wGUKKRI08T9enNuY8yEpZB0zaAw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QRhJ5sVWnpvjGISLFtPUZ/R7Ohs5oipuPV3rBr4qoKtF0eDMxQ2fEOBvh0msD8LD
	 7Gb9isMZWtD4op1MOXpFKRKLL2sb2OdWfwb9lY0tUbvDu8LfKthWabIOAKcivdnAp
	 ZRFezko6JNWH9obe8oSMlEix6+BE0qaJUaytr3w3+HC9RZoC0qu3tLxuJ67S4jkho
	 jPUEm2xxIVebDPdg+njS4kn0zwnDTqxEJ59AapupltzfLRtwYkrAT5TyOek3qEY10
	 4ukE+sGA3CxsiRKtLp6kic0OKZiePz0rjCYZ05xnGQijl+clQjrz/nGzGAE+HQTAJ
	 9TY5eZz3RYH1i8QmlA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MbzuB-1wZfFJ1fnL-00jkoE for
 <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:59:26 +0200
Message-ID: <9eb0461b-491d-4205-83ef-a3ce3ce38c09@gmx.com>
Date: Thu, 1 Oct 2026 14:59:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: [RFC] First-class compressed application images for Linux
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qe2nAl4VTLS5XvApo8QtLLhVPfoACE+la+D1rIte4RjRbw5byob
 ol4sDbboDzfpzNYD/YT406WcIuHUHfiJxo0/pkECUbrv5lRkn3OKdesD/SEOp10huWutrej
 TUx0gjGvsjDnXXRVfDUzh6GlbMw6IP9Qh8DtrfJ0qzypvWZdVUEIsQ7Zup0UnrwrQWlLHQJ
 TBDIKYOH2k5zVCbFBYrkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:inWe0P5fDe0=;nASyQO0oNs/SG/hw07MUBw9itfD
 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
 6IzaUVZbOcLPQ8e1o9Kt6D

Hi,

I=E2=80=99d like to float an idea for discussion: first-class support for=
=20
compressed, read-only application images that can be executed directly,=20
without explicit mountpoints, systemd units, FUSE runtimes, or=20
application-specific unpacking.

The motivating case is simple.

Large desktop applications such as Firefox, Thunderbird, Telegram, IDEs,=
=20
etc. are mostly immutable application trees. Installing or updating them=
=20
traditionally means writing hundreds of megabytes of individual files,=20
metadata, inodes and directory entries to disk, even though the=20
application itself is effectively read-only.

Today there are several partial solutions, but none feels like the right=
=20
abstraction:

- **UPX and similar executable packers** reduce disk usage, but they=20
work against the VM subsystem. They interfere with normal demand paging=20
and file-backed executable mappings, often increasing memory usage and=20
startup cost.
- **AppImage** gets much closer architecturally, but brings a userspace=20
runtime, FUSE/mount machinery, `AppRun`, integration conventions, and=20
its own packaging ecosystem. It solves distribution, not merely=20
compressed execution.
- **SquashFS/EROFS mounted manually** work extremely well, but require=20
explicit mount management, namespace-visible mountpoints, boot=20
integration and external lifecycle logic.
- **Transparent filesystem compression** would solve the storage=20
problem, but ext4 still does not provide it, and application deployment=20
should arguably not depend on which writable filesystem happens to back=20
`/opt`.

What I have in mind is something closer to a new executable-container=20
abstraction.

For example:

     Telegram.app

could contain a small metadata header plus a SquashFS/EROFS-like=20
filesystem image and an entrypoint such as `/Telegram`.

Then:

     ./Telegram.app

would cause the kernel/binfmt/VFS machinery to instantiate an internal=20
read-only filesystem view and execute the entrypoint normally.

The important property is that files inside remain real file-backed=20
objects from the VM subsystem=E2=80=99s perspective. Executable and librar=
y=20
pages can still be mmap()ed, shared, reclaimed and faulted back in=20
normally. Compression exists only below the VFS layer.

Conceptually:

     execve("Telegram.app")
         -> recognize packaged application
         -> instantiate internal read-only filesystem
         -> resolve declared entrypoint
         -> ordinary ELF execution / mmap / page cache

No visible `/mnt/foo`, no loop-device choreography, no FUSE daemon, no=20
mandatory systemd unit.

I recently experimented with exactly this model manually by placing=20
Telegram, Firefox and Thunderbird into SquashFS images and mounting them=
=20
under `/opt`. The result is strikingly effective: dramatically less=20
persistent storage, lower write amplification during upgrades, and much=20
better runtime behavior than executable packing. In one case, Telegram=E2=
=80=99s=20
RSS dropped from over 1 GiB with UPX compression to roughly 400 MiB when=
=20
stored in SquashFS, while also starting faster.

That experiment mostly convinced me that the missing piece is not=20
compression technology; Linux already has excellent compressed read-only=
=20
filesystems. The missing piece is a first-class executable-container=20
interface tying binfmt, VFS and an internal mount together.

I=E2=80=99m not proposing that application distribution policy, update sys=
tems,=20
desktop integration or signing formats be baked into the kernel. Those=20
belong in userspace.

The kernel-side primitive could stay deliberately small:

- recognize a packaged executable format;
- instantiate its embedded read-only filesystem;
- expose a declared entrypoint;
- preserve normal file-backed VM semantics;
- allow the container file itself to remain the only externally visible=20
object.

The container ecosystem has independently moved toward directly=20
mountable, compressed filesystem images=E2=80=94eStargz, Nydus and EROFS=
=20
snapshotters exist largely to avoid eagerly unpacking application data.=20
This suggests that the underlying abstraction is useful beyond=20
containers. A normal Linux application could potentially benefit from=20
the same idea without requiring OCI, containerd, FUSE, overlayfs or a=20
container runtime at all.

Is this something that has been discussed before in a comparable form?

If not, would there be any interest in exploring what the minimal kernel=
=20
mechanism could look like?

Regards,
Artem
