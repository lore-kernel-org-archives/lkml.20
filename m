Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257495;
	b=TbmhjaTM+Yb4es5b5xlwm/LKHKF0BH5M5Hilz+o4MDhVGxnsaJcDHeRW37+m+mQ9iVp+
	 MLustd1oabh7sj/85/UrzrZXOA90IYgKkT2YA+LBA4rcyzjd3kdkjK34z81r7kvJGqNd9
	 ov2HBulUpV7xNrGPndAOqseqsg94F1jlamFBL/nDPp8QnC5T2YJs4AswqU1D7lN3bDymH
	 YzAC6lqtsbkYJ9RtWEeAC2bomeicSgQEV7/sfk5/U47GHjD1jMcJ22cTuDDIW3aer1u7/
	 Ri0plr95Yedq9Z8ctHkdbLfZZOiNu1ugSxwLsdy8S40pgd3Zvk21bllhOqzi9+IYe7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257495;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2EnKYM1O2foiG13flnejDTAFyfiNY9oWVxa4iq2fMgU=;
	b=HJzZUdWvo3ucZhZ2CiYITpRRJMKRWC2BZ3A5rUgW8fA+VC5ttTS/Ms1T5tezxj8K47w/
	 WgSECzk8Oh/D5N2wjPwnT/QUpDhGvF4O0Xoc3whCgHG6Cea/k0/UtQCDpPErmn5VSkTfF
	 Dpn2IK3xHjTPj9QuTwEeevg97ITNfJyhDr0kbaIha5VOD5SsH3HBJGth3UlxuWpKWcE0S
	 Jojn/KYtRyqe/XNx5gwOatBbxtra6ZspCp2f6HxB9LadlVNQ1TAHI7OUVB+d9Fg2ghnKv
	 r1bZoD+nlIqcLq2QqcJgpXUtRsTLCNsczh8DB88Tsi3Z53KWIFIoxuhsRKOpchy5qbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C334606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C334606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4682977f9aso166234866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257494; x=1794862294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EnKYM1O2foiG13flnejDTAFyfiNY9oWVxa4iq2fMgU=;
        b=M5boHGNiLflAIUAYQXWOCA0AfHcYx5S2CkexBPVskslSBO/Tp6QYwd9BvLZLC0sYKH
         gWocbc5vFR1aBR8K0pMzU0Mluhe51wREyU3sgju5DxzQanxUr4I+uvm293/TWfYdusGj
         0VM9vxkZbH7/0odPe84NHmT4NxXQd27kzZLHqyZYHQCLZZ28XF57AhEvcw7FtUymxXZn
         eaXUTNIR7SEovwBE/YP36gqu4KMyjeb9qKDAKcWHsfHK9UGibyOlG6Cy9I4LbLmKzVcN
         Afz15gzwmpyQqIApEKbAkHMdg6VLRQDW8L37pUK5bBsVrMqs7lmvag6lfQDTlXgnbGzl
         HsOQ==
X-Forwarded-Encrypted: i=1; AL+hErHC+qAcklOx5vr8mn0EJjfOwkbXMBb0/MEjp4ERyPJjEzY6XgMsJTG4qtou+wkTW+EBIJ4MNes4M+FdQfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q043ac/ATGi1ooqgwL/qT7K98qGDIe0C90AzLtyAwSIybhMkX
	0bL2z0MychVIFbFI+ZpA47buBfY/GLawH0Xc0X8iwUc9Ne71stKhInGaL55E2b/FAXI=
X-Gm-Gg: AYBFou0mcv4iDFvrVfcauZcjGj0/2DzDGxkokIvE20R8nb4AGAX3wLlUZNDt51R8J6p
	JOqk+iTycn+MahgrPvlmcdlPfWPSQMP6jLLHNVbx+Xd82ozYPuTeWWMASXrQxDFAVy/k8tBSAD1
	DMjj+7AalQTfxwZDn/cPxxveufZcsFUOlW920vImhDZgMS4xfwQ2N4T4koqFPGlQqNHVZavJJVf
	cNoZA/PYfKWU1ojsJgE07VJyyffjsVLQKX99mEwMcYN6SWJQ/nAHnkPZ1U7viIS0IS8xRDKJSB3
	+WNxMlKYOvnuqL/A5xZu8N5os0NBt2xATQlBp35mQExHjFwLiMXgZdqZzjCpX5OXRO6gimY4fpk
	mD5aUUUmWjsGqsqhRsZNbbPnITZ2E5aDfEh6B70Agh/PghzRivZgXMhDd9QW5xk0r14BYTr3IcL
	09fi7a8wHN+b1QV4fRcZ8isECyj8RW0nLJyRtWbR56a+4tAbaDuz1WY3iJ2y8muOEaSBdF3iz91
	nFBb92Dp4Y9t8nw0JaZqoQuVQHDMJGbC4nShgBRlmGqqzjWHNWKH/yDQZBcG8jMDDa4K/VWHyyh
	HghI9W8oza5vT8UltxCUKOJ6MB5bieeNu75Fh+MwmPzSwBCPk+OoeRdngng=
X-Received: by 2002:a17:907:3ea4:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c50495c8f3emr44871566b.27.1794257493501;
        Mon, 09 Nov 2026 12:51:33 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a683d72sm13911966b.81.2026.11.09.12.51.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:51:33 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso228732266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:51:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH2Txe4D9a4zVHpWvm1RN2tLW2CD0m2H7NoOOoIbDJxhak//eyB95nTSExDAniR6ekovnGC9s5u8dRtH5Q=@vger.kernel.org
X-Received: by 2002:a17:906:6205:b0:c4c:f85f:aa12 with SMTP id
 a640c23a62f3a-c50495f0330mr43846166b.31.1794257492995; Mon, 09 Nov 2026
 12:51:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105072708.30722-1-pepe.schlehofer@gmail.com>
In-Reply-To: <20261105072708.30722-1-pepe.schlehofer@gmail.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Mon, 9 Nov 2026 20:51:21 +0000
X-Gmail-Original-Message-ID: <CAOs+rJWmmUbYqU34Yb4qJvJsZ92=AztNwNsqX+xD8WaH8tVz-w@mail.gmail.com>
X-Gm-Features: AclHuK9En0QmOUBY4k-RnKbFBU3eXagm58QT4NOxyknJnRPCI_HjRETQwg25oKY
Message-ID: <CAOs+rJWmmUbYqU34Yb4qJvJsZ92=AztNwNsqX+xD8WaH8tVz-w@mail.gmail.com>
Subject: Re: [PATCH] dm-crypt: defer async write submission to write thread
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Damien Le Moal <dlemoal@kernel.org>, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:27=E2=80=AFAM Josef Schlehofer
<pepe.schlehofer@gmail.com> wrote:
>
> With no_write_workqueue, kcryptd_crypt_write_io_submit() submits the
> bio directly, even when called from kcryptd_async_done(). An async
> cipher may run this callback in softirq or with BH disabled, where
> submit_bio_noacct() must not be called because it can sleep.
>
> Submit inline only when async is false. Async completions are sent to
> the write thread, as is already done for submit_from_crypt_cpus. Use
> the async flag rather than in_interrupt(), since callback context
> depends on the cipher driver. Sync ciphers still submit inline.

At the very least I think it may be an unexpected/undesirable setup
for the user: they enable "no_write_workqueue" expecting a fully
inline setup, but still get io offloaded. Perhaps in such cases we can
do a pr_warn_once() to let the user know their setup is impossible?

>
> Tested with cryptd in QEMU (x86_64 and arm64) with
> CONFIG_DEBUG_ATOMIC_SLEEP, and on a P2020 running 6.18.55 without it.
>
> In QEMU:
>
> - 4k writes logging "sleeping function called from invalid context":
>   100/100 unpatched, 0/155 patched.
> - nr_requests=3D4 on a loop device: 0/6 unpatched runs completed,
>   4/4 patched runs completed.
>
> On the P2020, a warning in blk_mq_run_hw_queue() appeared in the
> 6th unpatched run and did not appear in 30 patched runs.
>
> Fixes: 39d42fa96ba1 ("dm crypt: add flags to optionally bypass kcryptd wo=
rkqueues")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> ---
> Based on dm-7.4 (dab527d83462).
>
> To reproduce, with CONFIG_DEBUG_ATOMIC_SLEEP, DM_CRYPT, BLK_DEV_LOOP,
> CRYPTO_CRYPTD, CRYPTO_XTS and CRYPTO_AES:
>
>   modprobe -a cryptd dm_crypt loop
>   truncate -s 256M /dev/shm/nowq.img
>   L=3D$(losetup -f)
>   losetup "$L" /dev/shm/nowq.img
>   KEY=3D$(od -An -v -tx1 -N64 /dev/urandom | tr -d ' \n')
>   dmsetup create nowq --table "0 $((256 * 2048)) crypt capi:cryptd(xts-ae=
s-lib)-plain64 $KEY 0 $L 0 2 no_read_workqueue no_write_workqueue"
>   D=3D/dev/dm-$(dmsetup info -c --noheadings -o minor nowq)
>   dd if=3D/dev/urandom of=3D"$D" bs=3D4k count=3D1 conv=3Dfsync
>   dmesg | grep 'sleeping function called'
>
> For the nr_requests=3D4 case, run this instead of the dd. The writes did
> not finish without this patch:
>
>   echo 4 > /sys/block/${L##*/}/queue/nr_requests
>   for i in 1 2 3 4; do dd if=3D/dev/urandom of=3D"$D" bs=3D64k count=3D51=
2 seek=3D$((i * 512)) conv=3Dfsync & done; wait
>
>  drivers/md/dm-crypt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 8853e9af1c3d..c0552a300e62 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1982,8 +1982,9 @@ static void kcryptd_crypt_write_io_submit(struct dm=
_crypt_io *io, int async)
>         /* crypt_convert should have filled the clone bio */
>         BUG_ON(io->ctx.iter_out.bi_size);
>
> -       if ((likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags))=
 ||
> -           test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags)) {
> +       if (likely(!async) &&
> +           (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags) ||
> +            test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags))) {
>                 dm_submit_bio_remap(io->base_bio, clone);
>                 return;
>         }
> --
> 2.54.0 (Apple Git-157)
>
>

Ignat
