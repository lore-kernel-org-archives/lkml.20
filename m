Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326A523792
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866542; cv=none; b=VMVpgOzyz+cLLYqBFrpS5xn0xcu7bUCU7UpRe04JUgURRPfUXibhIW8LNXuD7gFp28vvXwEvlrD+Bpi5XreohjFYpXykJYmCQ/d268yAl2Ba7ic6+I4qt3DRR7RdY/5HJmWfOuPssStnorf+t6bALbh4kJ0II4+9BYqOvq60CuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866542; c=relaxed/simple;
	bh=C4gaeTZalsqtkZFdJtQZggrTdbmWPAbpjwOdRZN5sUI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=u4nQAefJPI8xNB5bcvijUaG58S1nI/rci/mtL/ByxBWV/fwFQLw18n7xmqpSwJIzJXeFWW0AgJ1iRu5oQ+HAgC/FdcBmGx3lz8iGMy0HbvyN42qT0LokXl46rz/zn4BofGtE11cLKrblNRtYFfBA4T7EQ9AmD8XBvElYPSejlMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b=qa1QR7pP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="qa1QR7pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1790866535; x=1791471335; i=aros@gmx.com;
	bh=byFucyrrsVsJvQFPbn5EhHVlCXuV0fBLxBDwf7HnpTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qa1QR7pPif778OQtV+TqdptMiTF4e6OV4iVTDv7Eytj8MXZxliN1Z5e2GikVai/7
	 wvckfKD5P3SWVpr7iKC/TJqX+G8fan8gkMQSVGu1gzMDz95obKWwa8tYVmU36OyZg
	 X1dYUd2+REKey0NvmaFDuJ9e3fK9obn1uIwKZcT3wc9Ywb1J6ykBwjEjqHBva7C0y
	 b4SdSFSUfDjjgbXu16g8u6BLW4ecJ+pmlft2Un+cSkhgOG/q8objT5l22upEnEf2O
	 y5rMMDrVplHhD0zWe6h2KwGX0t2mbo9GegTay46IqK1lMoPDV/bygsqhXHmWfPWzL
	 Mu3cHb95+2u1Gle1oA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MZCbB-1xGqc33kaP-00OMwZ for
 <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:55:35 +0200
Message-ID: <1ff919c7-cec5-4e24-a196-709c0707cca4@gmx.com>
Date: Thu, 1 Oct 2026 14:55:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: [RFC] First-class compressed application images for Linux
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ifYLz0IsnOaEXUVq7ENhr6h95AoytfJXVr4xgPok/jXLOh5vRet
 5oq7InR79Ta/WwOtmWCEz5pQInJlklFCb+5wF0bW09KkaHhlYPxlCoyCx92v7pOxCFi0ZcB
 WGqb1DPuyxFHv0stdmUHkxB0si57HkVBszprsHM6HuneQkHtltIwcuOHoDBKOR9eQTJ1M2G
 reh9DDcA8oglo6VONsitQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ID2IW/96jQ=;JdNpkAetJkJFKXp15zUG8AyNwMi
 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
 HCd68QmjgH8enBHMkDdPcW

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

Is this something that has been discussed before in a comparable form?

If not, would there be any interest in exploring what the minimal kernel=
=20
mechanism could look like?

Regards,
Artem
