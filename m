Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920343;
	b=BP0skDB1QqeYHqzxV/MTF0CKrWU2PQEUZCNMwBvkrNgeOrk41EH5rC6JwjBF4eiRtHUo
	 vQWTHlrL06opAW2tbQR/lK7+R5YBzVd7Byfy2btX2dd0cckD13e8evU0Upn6nMTyoC9Do
	 Um+MKda1A0hWH9ObKj3zloFPFegSzO+b/BzACKzqREIMye2supKSd/jzhguvjr46kEo0/
	 zvg3Ech/FfacH9o3bE83LTfP45LDfDL8UgK+/tv/hC0Lg/eC9gz3xpiIGKQOD7CdPnoW5
	 y1j8sLTMJNEKMW9D2cpfxDGtbG9CMQDJ+Hz6skw8jDX8D7jBvKX+fbmnWBfbB/u6QPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
	b=MSuGDEj9J3rOYMPyHOhMXlZqf+jOu3OKmgESkuruDTtLnBHROLxHHJimwr6XUocSBZrh
	 Do4dKM93p+dXConqec2dAvrvZZlygTxd7rJ82qDnMesCLXBNcJvxxJmFfuEENUNcC/lN1
	 UAZ8TgOnF8LGOZVWuJVKvdqUpgSZt27lSl9zTOTwJ6DWPhNuFMFGr5InHp0vUPT7AZNg3
	 ukBb4awardTvsmboSTGjc3iQwrsvHbcpn4qQ2bqh/Bb+lQlMJZPYipkkb9TXHUlpoNRBJ
	 MsYGB9pm4CWTFD1BEA5nz1lM5PLs4f41y2h7UFd3W+MavfwPH/+kvp1FNy4SarnxuhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=ePSbskAw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06909606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06909606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=ePSbskAw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso33112a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793920341; cv=none;
        d=google.com; s=arc-20260327;
        b=dKjL4XkMeRpe6fC++FKLrw27G8btPWFeZBZs4vJ1uW34vG/cO/f2q9pRbjACSUOROw
         oxw8IqrqxJiqBks4gMgFEAhGkk4CoJWzZtCW19ceYsxRc5RQSpRIMfq2tzd+lhvq1549
         lzV2JJtfbjzmgMvFQFE9ds56cIal1i/G7sVsn56tNIQOkaGSnvnflJeYJE/5fUgPdI3U
         wgImUK4Xhp9FMy+bwG6Q8CV47YpVm3VokZ/MJCL1+ff3dvzXvuWvaE595CjIJaNb56sH
         JCkuStrDc7gLw4C8Bxk0n266rFslDVbtgSjp+WxqawgvbDHfEGGnJ+0En3+uAH4Q4FTr
         PECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        fh=Z2qT6owH8C6KXdYJ1WzDHoPWsDTdcAnTVBjBrL9S4cA=;
        b=hdToLnT5QH+iGCkxgvyxYn4Hs4v9d/QEyXUaZpq4I3vH2cvX6EX2mESNsw+KAiMxLm
         VLZ2cIoT4c6NuF/Sloxf9Vp6qufmDlXpB0OHkiN4+8UQWSfHAoi1d5dlhp476RtLH8Uy
         jIEiBmJHc0ZB0rGaQaGtre/9Oio3sXPspRn1vM0TQNarZYGk5xq8rBiSksJtZsJ5P5Ld
         SdevFoz/L8vvuBUg+vIQGoWlwob1AL/6TU8bY5ifk/QiX67YcvBNogz/437mZ+qHn4KQ
         Bys5fyO/96hl/CRwsmViebM0ylcuHO9F9wYe0HeBVN77Ad0hObj6wiV92qnJWhwIkl/n
         hUPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920341; x=1794525141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=ePSbskAwea0d9B6NpBdXuFYsWvLDCToKGcxFrN9C/fQLJKxAOsbctr8qBrrZUslJXJ
         9CLcMCSIkKD7ZW5JSZB/FlpnXL7wVvbFlxAaV35NsJbH9Ct+Vj1AE0PSCxPZMXuxmspf
         S8DzKorUUKYgddL+oYJfDiSPHAXfQ8DdRb1gIJCpXWqjafW5TeuSLk2tBK8Xu5u2Toof
         wmqoUSerZIxxVmbDxgyvtDxt3hKRgQ27SfmnssLj7BFyrZUgbmKG7qeTDPokQzsw8F3e
         sMOi8Cm8Fp7SxcfGGOrWu3vbz980QOeeJXGWbY7zrPoyxcb1MpuMc94aw2AmHxsi0GQi
         jm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920341; x=1794525141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=pwiyuz8q11Ar2YaTBsvVC7Bga5Rlc+fSraaFNLJKYY9/cWFdeRA9PBSof2qnCvv3lv
         X8DkOAgKjqxK9jBUDTobWXvgMIg6JYxI8PqJFNuRs/3bHKU0J46x8/LlPQWxmxg6NsUk
         k9ecDrfq4HTuPQb5rmzKpZv75WLxq4ntfRmlHn+ge+/TlNcJnJJ2mIqRsUnp+VrDxix9
         cWmP8VPN+6zex++x2g0Kc5wvX6+lf6ViXD+YOPXYczQNyJqrvnJCbt04rQBqsaZ764n1
         Y7jpCRJYj27wF8ZF5S2OZjoc+SMu+rIrLabu5nGEnXmqKyItdkteLN3IfL/zbFZZwtlW
         h6sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkBf7hHpzcpGAY1UJB9BpBHGVWvnr+JIzADpZodgYPUQ2/ft9GNGbPFMtMrRIGXsGPiGmLXh+iAPhluMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bIprhVpIXTknpR2LCSYShDq1cYVxafq+zXX+fvKQpetXgTAUU
	WU/Z0wJI6OjLx1jtFi10Xi2N1x7lrIhL9eQEZqwiFP64sWmjR6UTu85nijIWwcP1iXd55vkLbcZ
	gsB9JNJXqE4HYxubEengywxXWyz8VGXTo2snLyaEt
X-Gm-Gg: AYBFou2EBB7Moh9w5x7EkS0rGikQXvMWchWfWepaNbi0hxwmHBsSD612xFBdeWoZpQJ
	nVyor4jdzyVez9IajBJV63JE1wAaG/nD/rIOZpyKNjZGRBhOwu2cxTvIy/R+SzVy8HG4h81MIVe
	GfGybxLdJMcRVCvmW/0dUYRXqEui+9Vjf16941kJrEbJk2tm95W/5hmanHAdKm42cGLmGdVa8aH
	rH/cBC5kngPVHsOkJud1A9K5VbbdnroJ5yc4aX67tVZJLavZ4SpQU4WCHzPna+cgh8QgQvaWeDd
	dWdM4Qj9D42BpiNmUTBOLwnFx1Pgcotf7OSHSCUA/e7mfCX1W5VslPj6wCL7iDVkFBaB1wb9q+p
	So9AOHpD9guu7RWpH2Oe90DXCQ2zuZvTRbbSuLg2jUUnrlejp38YFGAI8oKFyM02wtRy9
X-Received: by 2002:a17:90a:d88f:b0:3ac:b867:81df with SMTP id
 98e67ed59e1d1-3b0db6fbe69mr555739a91.39.1793920341210; Thu, 05 Nov 2026
 15:12:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:12:09 -0500
X-Gm-Features: AclHuK9SAmQ1s59IzUj_GoyUW49QmobrDei9zDR78OY4d10Tcv8mWs8d-l1JUg8
Message-ID: <CAHC9VhQvpFeEJaEyPDaqj8_S752puSaNe0Rn-hxjh=ugCoFsxA@mail.gmail.com>
Subject: Re: [PATCH 00/14] mm: convert further simple mmap hooks to mmap_prepare
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Scott Branden <scott.branden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Cochran <richardcochran@gmail.com>, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-sgx@vger.kernel.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:06=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Continue the conversion of users of the deprecated f_op->mmap callback to
> f_op->mmap_prepare. Keep things gentle this cycle by targeting simple
> cases.
>
> No functional change intended.
>
> Build tested on x86-64 (allmodconfig, each patch individually), i386,
> arm64 and ppc64le.
>
> <<>>
>
> David, Andrew - I wonder whether one of you guys could take this series
> through your tree? Since it's kernel-wide it seems sensible to take it
> through an mm tree.

Granted I've only properly looked at the SELinux patch (7/14), the
rest I've just skimmed through, but these are all independent patches,
right?  Is there any reason why individual subsystem maintainers
shouldn't just pick up their associated patch?  Yes, perhaps chasing
down individual maintainers is a bit more work, but isn't that the way
this should work?

> Lorenzo Stoakes (ARM) (14):
>       xen/privcmd: convert mmap hook to mmap_prepare
>       KVM: PPC: Book3S: convert spapr TCE mmap hook to mmap_prepare
>       mshv_vtl: convert mmap hooks to mmap_prepare
>       vduse: convert IOVA domain mmap hook to mmap_prepare
>       x86/sgx: convert vepc mmap hook to mmap_prepare
>       udf: convert mmap hook to mmap_prepare
>       selinuxfs: convert mmap hooks to mmap_prepare
>       xen: convert xenstore interface mmap hooks to mmap_prepare
>       soc: aspeed: convert LPC and P2A control mmap hooks to mmap_prepare
>       soc: qcom: rmtfs_mem: convert mmap hook to mmap_prepare
>       tee: convert shm mmap hook to mmap_prepare
>       misc: bcm-vk: convert mmap hook to mmap_prepare
>       ptp: vmclock: convert mmap hook to mmap_prepare
>       vhost-vdpa: convert mmap hook to mmap_prepare
>
>  arch/powerpc/kvm/book3s_64_vio.c        |  6 +++---
>  arch/x86/kernel/cpu/sgx/virt.c          | 15 ++++++++-------
>  drivers/hv/mshv_vtl_main.c              | 14 +++++++-------
>  drivers/misc/bcm-vk/bcm_vk_dev.c        | 20 ++++++++++----------
>  drivers/ptp/ptp_vmclock.c               | 19 +++++++++----------
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c    | 20 +++++++++-----------
>  drivers/soc/aspeed/aspeed-p2a-ctrl.c    | 22 ++++++++--------------
>  drivers/soc/qcom/rmtfs_mem.c            | 22 ++++++++++------------
>  drivers/tee/tee_shm.c                   | 14 +++++++-------
>  drivers/vdpa/vdpa_user/iova_domain.c    | 12 ++++++------
>  drivers/vhost/vdpa.c                    | 23 ++++++++++++-----------
>  drivers/xen/privcmd.c                   | 11 +++++------
>  drivers/xen/xenbus/xenbus_dev_backend.c | 14 ++++++--------
>  drivers/xen/xenfs/xenstored.c           | 14 ++++++--------
>  fs/udf/file.c                           |  8 ++++----
>  security/selinux/selinuxfs.c            | 24 +++++++++++-------------
>  16 files changed, 121 insertions(+), 137 deletions(-)

--=20
paul-moore.com
