Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583581;
	b=w/nZYVl7rJXjFhBWqvH8uUCmIZ5Hg59hiaPUs63ml5jyjHLRXe15cZUcooIdkPTCbUXG
	 +Y2zh0Xze3Om5CBr5fexxbUsQ8dLrcI5su7q2tqvF1xFcBwUfQjbbFPI/xyOiIe1rP7Zj
	 nqNSO4YOAtyxDW3vq977WbFfPraK2ntBcDFFF5zZrqir1i4jBHbJlM//F8CHNDnvsjadA
	 Nzr66NAs+txT6mfkudX3TxKJISI9UCNCQ2Uy93Gc6NB9gt0Rm+NbtXQkhVGyyWPH+oCUJ
	 WeamfMpy5OcHI+0SUg1f2CqDmeohyqDdfg4i7TyfbP6yg7GvBxOBaO/abzvJdEtWTvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583581;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sOB5ovBIpBsovWpo0gXI1cKYhejjTCYu6APsHzA8QRI=;
	b=pder54GOcemkbZXwDZJsmYB48DER+1Ck+t/wNFvn2+mxJRM8XmBsNE5tNfZcn7OWLxhR
	 /sLyy7aSBFnvUcgsb0G8Wtts7sdk0f0KouDuhC6SZ3A6aETtbBawi8Zr2U4AMPu6fqMrt
	 OJdo02McvJQLwnoi7/AFYEg4UBZ3vw3nbikNtTWtTz4z9P9FhMd7kyyU1a3hpHOElXT0N
	 hIXmq438zzOignpiHn+ajSsMntXVlKLT3DzHUrgi0VIZ9kOmF/5VC0vaDAOycgUacZmir
	 BjitMnDqupduUcfldYP5myiXrKcJEPLz+ghJUvJ/nHKyX6lOlS4dy3lztYlk/g2M4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dH7Ask3l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A7606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dH7Ask3l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B301F000CC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794583581;
	bh=sOB5ovBIpBsovWpo0gXI1cKYhejjTCYu6APsHzA8QRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dH7Ask3l+k/REe9aTPcsIK/vfuL0IbidOce3L6SdZspkFHpvmgVWcGNkVUf99Y1nc
	 TXf2QOWrthiZ/ExXA/8ZgQTW9FiBQEnGTeZk1rbiqw2cwW9/2HVKCqjJQ86QA4TgZF
	 0apcD84Yocbfl787uSe1h69qK/XYUkiWnyAE2fAc2SO7CgBoXQSvDkRoMrMR+IUIKC
	 8NsYjxcbZzHARMPLI/zn+6UEBcClT73O7EF5lZCBytQpK6IxmQ57Ag6WZrzHextyyR
	 f5S+oiIwnQ3qY5GPcz/VCO3FLncrDBDkiAPsZJtjyT5EsTTHByX2NdziJKCADLycFS
	 ePXWAqCehRvsA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so1915697e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:26:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3Wf6MlScyKggHEqK/cx8IuEG5kaVgEywJibJMl0AYXXr6JipWu3KZYNPnA4miJZ/WLyH99apP4EsG6g4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZgtCja7E4jxxcehC4wA5wwJFQNZZxniFiTDYAkSyEs0BhBEeH
	nWZ5biAlt+01HJc9nfVq95+V175w8N7sptL8iBFe+Do8yDgLfEZvx+Ka2jvxGkZrLDPK1305RgI
	prAtBZZHPJVG5hO3ZhhyRnxCcT0TEQYg=
X-Received: by 2002:a05:6512:224e:b0:5c1:56e4:c705 with SMTP id
 2adb3069b0e04-5c164df77e6mr2164171e87.3.1794583579509; Fri, 13 Nov 2026
 07:26:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-hfi-kexec-v1-0-956234dcfb2b@sfcompute.com>
In-Reply-To: <20261028-hfi-kexec-v1-0-956234dcfb2b@sfcompute.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 16:26:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hf9odYCxz1r3Er5dh2tjXCtDwKuhdS1b3tP6MOMjQSeA@mail.gmail.com>
X-Gm-Features: AclHuK-hO1ifI3teYW-w4X0MV3oVYkEj5OoFMZDemnGHJmRLvJNDv0_SAtlZtmE
Message-ID: <CAJZ5v0hf9odYCxz1r3Er5dh2tjXCtDwKuhdS1b3tP6MOMjQSeA@mail.gmail.com>
Subject: Re: [PATCH 0/2] thermal: intel: hfi: Stop hardware writing to freed
 memory after kexec
To: jez@sfcompute.com, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Len Brown <len.brown@intel.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew James <ajames@sfcompute.com>, 
	John Ranzie <jranzie@sfcompute.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:20=E2=80=AFAM Jez Ng via B4 Relay
<devnull+jez.sfcompute.com@kernel.org> wrote:
>
> HFI hardware writes updates to a table at a physical address the kernel
> programs. Nothing disables HFI on shutdown, and since commit b33f3d2677b8
> ("thermal: intel: hfi: Enable HFI only when required") a kernel that
> starts without thermal netlink clients does not touch HFI at all. So
> after a kexec, hardware keeps writing into the previous kernel's table,
> which the new kernel treats as free memory.
>
> We hit this on dual-socket Sapphire Rapids hosts (Xeon Platinum 8462Y+)
> that boot a Debian 6.1 kernel and kexec into a 7.0 kernel. The new
> kernel crashed in find_inode_fast() when the inode hash table landed on
> one of the old table pages. Reading MSR 0x17d0 on the running 7.0
> kernel showed both packages still pointing at the 6.1 kernel's tables,
> and the corruption had the HFI table layout: a timestamp, a changed
> flag, then one row per CPU.
>
> Patch 1 disables HFI in a syscore shutdown callback, which covers
> reboot, power off and kexec, and keeps it disabled afterwards: on kexec,
> user space runs until machine_shutdown(), so a new thermal netlink
> client could otherwise enable HFI again. Patch 2 makes a starting kernel
> disable HFI if the previous kernel left it enabled. Patch 2 can only
> narrow the window: hardware can still write between kernel start and
> the moment the package's first CPU reaches the thermal online callback,
> which was about 30 seconds into boot on these hosts.
>
> This is the kexec counterpart of the hibernation corruption fixed by
> commit 97566d09fd02 ("thermal: intel: hfi: Add syscore callbacks for
> system-wide PM"), which disables HFI for suspend and hibernation but not
> for shutdown.
>
> Tested on one of the hosts above with both patches applied to this base,
> alternating 100 kexecs (kexec_file_load + reboot(LINUX_REBOOT_CMD_KEXEC))
> between the patched kernel and an unpatched 7.0 kernel. Before each
> kexec, a thermal netlink subscriber enabled HFI on both packages. All
> 100 passed:
>
>  - Patch 1: after each of the 50 kexecs out of the patched kernel, the
>    unpatched kernel read HW_FEEDBACK_CONFIG =3D 0 on both packages.
>
>  - Patch 2: after each of the 50 kexecs into the patched kernel, it
>    logged "HFI left enabled on package N, disabled" for both packages
>    and read HW_FEEDBACK_CONFIG =3D 0.

Ricardo, can you please have a look at this series and let me know
what you think about it?

> A test-only 5 second sleep after the shutdown callback, with a thermal
> netlink client subscribing during it, showed that patch 1 keeps HFI
> disabled. Without the hfi_shutdown_done check, the next kernel found HFI
> enabled again.
>
> Thanks to Andrew James and John Ranzie for reviewing.
>
> The investigation and testing were done via Opus 5.5, as were the
> drafting of the patches and changelogs. I reviewed all of it.
>
> ---
> Jez Ng (2):
>       thermal: intel: hfi: Disable HFI on shutdown and kexec
>       thermal: intel: hfi: Disable HFI left enabled by a previous kernel
>
>  drivers/thermal/intel/intel_hfi.c | 71 +++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 63 insertions(+), 8 deletions(-)
> ---
> base-commit: 70f331d89564126fdcaaa37f25194fe391d8f3fa
> change-id: 20261027-hfi-kexec-e7c4b7f584be
>
> Best regards,
> --
> Jez Ng <jez@sfcompute.com>
>
>
