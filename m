Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920457;
	b=DOWT8kMVSg7GBXr8CoLbzDfIXW27bzs/335ASlqACgXS9ezZYexmEENC2N7qy68ycJlU
	 JIKRd8wIBjyHz0IYCf0pnQ7wM4iaNR6/VtK3SoAOBQBaIG4FRZzp3jESxsCk0vynErBwU
	 PaOtbmqjoQGYNdMEM75BkDheXbcflkm/spPk34lkzUS0Eme0XYWR0WDJlCIgdmkglIBQu
	 b+scFPCa58TObCeFzvXWI4cnxYfmPpOXlB0SsqqAl1vdxvPFE1JKAQFcGDRRSvaXNFxw4
	 UfOIu8D0zxmJ/MsdWIixCeZhbtenn+WiyefdIKJUaKljI1zVcjIhGcj+28GuJf1u43w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
	b=dJpcmHCkqxdfFkr62Zxk57MoOsPbV+LmSEpu3lLzA3xcYkV6+YIUwa81GV/uW58kUup+
	 fM2L/8ZUzJlIPEMAOTuBV5Lb8XosH/NcVj3fN5pRltuJdMEU+7v0X0Oz1Hbgs1pT/lEic
	 txK3zP8ta/hCySI9IvdIEh4kGm3NM7ENycRm/naD7+HYWbQ2YO94Sc/qiFeyxfqPDdIOA
	 CpX+JrtY2pPSImUEn2I4N/Cxkl82PydHwjkhtcWrVYI5Lpa0Wg04R2BfF7ZPkBvL1cNKy
	 cXColrghDQnbWmTdO3faEE6v5YdBj2Mvd2mzmr6GXF7fIA8rWHcqoJJaZwgR8JC4LUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IU6i1Fwv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A2606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IU6i1Fwv
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so60761a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793920456; cv=none;
        d=google.com; s=arc-20260327;
        b=EhHktoJ3cSub1+hnmG//5UwRQ8KjV5KbyvuqBz4rFixLfIBYQa8AR7eTASIfQHDEd+
         c02TADpesxlCMwzlhuROiMnAAL3ALIpE4vl2bxdCnSBwKQKiYLDwlY+k3awObkUkdlt6
         +Yh4rt8dm92gRVSB/sKD6r+smDMCQZnpxVcwalA8jF6wM4vuVzfN3u0qmMqhv+PJqYaa
         7iTwhgFd6ByMpP2p67K98ydH26hOZllQolKdtofpCqvh3zeq4lp4bfzpJsXx52i+dRZr
         GPHdMyr8Z7tKzVgwOY42DfuMpl79q0c85JvpbhDLiRu8pkIn4LmaboF83QwmT9w05Dne
         YTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        fh=3JLQP0QOrTfVWjya8p81qOpeuPUaxHb3cgwv1WfPk1Y=;
        b=RagcEvqbNJQ+SqnUHZEYirrVi90CPuFUlXaTuw2DTydQ3TvhwPqHrFlczj4zWJus2j
         5twQjIS7WeajJMvTjeahRHVGdQJI538aRqRUdd6+9NxwdfCrqSOUD7Jxbnc7CVRIqvfn
         7bkCXSneVJDNFUyCDJn4NGU2UTb0V88mqhVgUuwU4kqVwk77g1/DXNJYurObQu7VfLJa
         bffctlywZGFnqkqRAt8CgY+sFzOSq36XqCAOe1IsiDimbg8unUDLw6SuwfIJUCEZ6seY
         ztuTe24qNKqtB/Xv+tLzwGV1BxQEpvoUSXVOzMsNnHC5Vt5xSrzyuF8pM3Eq1CmFgu8W
         nZZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920456; x=1794525256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=IU6i1Fwv/0w/cks1e2nfs6t6sk022zL/8GvQwys2lPo33xKyfU4+rlcYd/DQAZEHG/
         pOKIazGTVuNB5nr366kMh62Z8mKuK+0wykvjpk6nMnF62dQEPqXhVYv3AiAUQh2yheQg
         Wv57SCnVaPWXfP0Spf5ZrgQ+6Qros/0dGKzT5Ct8KPvTnGxmERS9srU07KlGSKT3u7rc
         WSDGWK1HJ7ZHGpFoQ0kLcdKEj3NsCe6oNqECA6Dmye2YgKsYtmlI/U8g/CwAwltsgKHy
         7lk6f9CpVk0uzXD9qAsG8lDByv90XfisBUHNR3hzhw22DDDhGO8biMGoTBxSg1pPVUNx
         pPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920456; x=1794525256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=NsGdZaQtKluqLpDwZ+Zl8VSVa+rXHtMJueWYpEv6a9jkpMlpBE6+UmBbjUAaBKRJIv
         8fdx1eh1xBJ0RsMms5Fk9G/Tn+39gC4e+Iul2Xz370ZSqJWLj+PM5f7iH2t72OTWAa2w
         QkmMXGEZmBjIcUuhaHY+wnBA31VTZiBcKqz3enspfACHiil5tdVzw9Ek8BSPWDhF29yu
         ObKoEbiLqr8ri2LPfBNr87tXyTkgKKdx/brTXGzQeH69YijksSLJ4hKQqule53/3+2UV
         clcamDkocS8gM697hQZM7wa85mlngDgUOQeoDqwIlhm+Eamlkd82dniDYFso/ru3qIh7
         IBxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQxCJSVp0wGcNAW3U09dhrcE2oP/wd5F+JAPi8dNhbWSmdAAHrx1gMeJ8lopQimeDPL08NRNYPvMbiE+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z82+bGsGiQ7Z1WXNML9rpH+oejNV8VSNQKtVeASWNPSDzkEUt+9
	+BVWDklFnq4eEi2ABanRkTkRWye1ALZFHovHwVNPJ7VConUfo61KZ1zXpNFXo2k6DAIQNv3bOXq
	gmcwbz1sJ5gmf4FKEojrNVAJsNEMVCkZrhWbLf1XC
X-Gm-Gg: AYBFou2MW3mEA4+3oDe4yXKbHXUPxTeecIWRjCO53+SU9aIcRqN3WwOtbY72z9FTmjh
	CddJALvaZAYgMmKDkQNnx9YR6lkdhite3O9zq2HVrOYwwuTTMcyGRbrzxZDhIeyoH/BT65GpWoW
	VaJOH4736fbapMqClGt7zygocVQEz/72axDcX9p05a78MHols/9doQdZyXMQopJ8kyCUPe7CW8c
	W7/D065sIkAyC/xK0P/fOTV5Br79k4eHUVrsKKPMxVgtf8lcB1MtNmtiRLHyo5IeMA+njWklriH
	exc1gDyMvm7L2xaBPBpV2QVPmL5aUgEzrYZs4xxudt/x/V3sTBYIEv3rhvesneET7WxBo6jYIhE
	+yxit8Op5zwgUVMvkaIrqDrF6GKGLYyvVKJ7VMQF9ZT482nCaZRSQDVFaFDF6ateTPPsI
X-Received: by 2002:a17:90b:48cf:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3b0db6e8ca3mr534231a91.45.1793920456567; Thu, 05 Nov 2026
 15:14:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:14:04 -0500
X-Gm-Features: AclHuK-Yq9Ya_gmjsTlhf760be1vg51BQVbAOtNinoyo6VpZvAmG2k73A1wV2Mc
Message-ID: <CAHC9VhQcmX09Do8BmY-HYJEWKiw7Tf-ZB=EEr9K6t5dBzk0SSQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] selinuxfs: convert mmap hooks to mmap_prepare
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

On Thu, Nov 5, 2026 at 4:07=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook for the
> policy and status files.
>
> The policy file only sets VMA flags and operations. The status file remap=
s
> a single page, so use the PFN remap mmap action to do so.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)

See my comment in the cover letter.  I'd prefer to take this via the
SELinux tree so it can be included in all of our SELinux testing for
v7.5, but if this has to go through a single tree with the rest of the
changes, here is my ACK.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
