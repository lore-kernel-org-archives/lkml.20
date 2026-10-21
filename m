Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792591259;
	b=wO9s+Z177wwlvByEV+R9AYIhzEBHkYJptaNSiRM9nJXVlEbCA0eqYG1mGOfmlN9QiDzk
	 f8m9bxWJ1o8LZLIEjw/0SHtRAxPpUXArDueJ1L0M4uB9kGy++Ru1h1dInsUCp3Piaz1Kj
	 6CO/Bq0FJLQKRBN3hO1FWe2J51hQc1ebOS08SSDgaXpNCnv3yAKs61cjtKLwpi9PnB96h
	 1dRRs2gWuRXjthF31aTC5OaOzrrRBDZJT/EFvhr6B/2ToDZU5DG6pb7+losidN7bm7Tsn
	 8d445ftOajyip9iOomKFLZbDShWjsuya/1OrSP9aNJXtcHfv8qNjJfWjjPMu99LhRhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FdVCBZfpYOZXVIwiE/Xpz5oZYVnx0Z/FsH1U5IHm83c=;
	b=Ag5/biGrbU2oy1s9xFeC0Jc6xj7FM9ksxuDyg0jL77Xc3x6HawMnucQ7vxp8gUwywVAs
	 IEl5sRNOC2/28qP4ifPpJYcHJh7x9vHm+7UCFwphc3hSkpvJhPA6xHmDEnFD62oRNUkZC
	 Rfhn5Y6HRZwxj3IflZhcpbvRzZenUqThJDNCpd62HWB3aJpcqw0VFgT8Lbajo36/4uq2j
	 sWgvyu3gPLG76nyaRGUBmTFRpETu0cJWNku8+BUrlUUUNSpWEyv9uoRQHDyhppTHt7TY2
	 LKOaaONG8GCK+MJLeoJlivxtsgtEspNApGMUOJl77d49xWkKHjD+NP7fFBSe03k/+CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZ1gLhql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE935606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE935606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZ1gLhql
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8aea7b7ca0cso6651937b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792591258; cv=none;
        d=google.com; s=arc-20260327;
        b=nMySOrNNf+NbWz96BaC/WG+91hahXGvLXLwmPAUO1jbbjn9VrUgz4GnZGtn9IOsh5e
         sXo4vvzLDq85W4rAFLbBpDj39zWe5a7I51vN3e5faB4wIXRzZ+w7wWNVrIAywn07sgP7
         6HgrnJvSaoic1dWnzZZop0pvg6AivSDIFhZ8ZmAZuxRtwQsD/oGf8ss6t3xKL8v3HfEq
         BEeZTQsD/iYXalAmF2vIyuXcLnkEj8ICKdxkb2VUwAOa8uRviGSL4L1boEt9R+DsTdgy
         b1Hp7sm96ClPEY/5YaBk1A76nWjmA2fASlhCLEBI6SlyG42JjmD2BduKLMk7mLGEd2Yh
         BDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FdVCBZfpYOZXVIwiE/Xpz5oZYVnx0Z/FsH1U5IHm83c=;
        fh=hBgoWM4JE+c4M31Q7N65yrg/ATGcOfOM6sIZm4MPtLM=;
        b=QbFFzZlv7F4xTTrwYZXO+lEwdtsm2bo+f85EvdW/HWf6afS7hhpa9O2FKMrC5W1zK5
         YLs7fybc2AjZg0UFwXAyWysIPyNhJRsOOyKce/7OCCnpAvvWQiktL1IPHWXAExuEULZZ
         9UJlIoM/+DvKpBwwItiAKzXaOoBmKpqQB/m2MIuXFZAJFeH83zYIa/W4jvWdvu3OhPyg
         Kf+7wwoRLF3q9f1NP1/EoV86fXlT+N+UI0HQdHUG6BFLNOqvhntqVW+usgl0Z6J3Tvi8
         MHoUGhlegsTJb1mv/NjpdWfarVhFWYQHeLAGtOd2gGT740ITfySFpiScf6Rcx1GnxcJS
         pMRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591258; x=1793196058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FdVCBZfpYOZXVIwiE/Xpz5oZYVnx0Z/FsH1U5IHm83c=;
        b=HZ1gLhql6N+gklXAjjUUDwVl35mWU0cIK8IMcVFumBzOC8upIWjfAFLoLUuWd6BFdk
         JR+yuiSYLlfj6dqkBN8C7xRiEkmFabiwvq7xPPvn+YoAs8SGtMUO37u47GTGcpzyAXIV
         PspO7M8qdHM5lsQsTb3Vkj0Du//Lw4u3PaHUv70DA0O0JWZi8mxkK9HdmN+2NE5T6V+5
         832/eYsWMNEq/232HOpTKmpRQ9FHEj6E9XFUDdzrWzGzSnvUd3UYHdWnIp9Pi9QDUEch
         ZtyaI/j7DeedwmqgtPyEJLjewcWYXlUxyGOiIILw5h8+zoO7KYSmKL1HoFNxK1IQHtU1
         zurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591258; x=1793196058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdVCBZfpYOZXVIwiE/Xpz5oZYVnx0Z/FsH1U5IHm83c=;
        b=gBUNYMNiF5cqCNYTPgaztptru41okTiTV8wGWgwY11ZD1/kyCIYeMsvo8XdVYfz3j/
         SE0r2PXsYwxkRjpZjQ+QDm6kBvTRilAcjhNFqF5XDqi+N8AUvihrAmuxK5mGWaSL2psH
         Zym4cZcQO4AwBxz1sHepKgqBmBnrh5N5zf4GKA3MO11a6Q6xBUhAPndsz1V8pNNMpHMo
         A3S2KLKX6QHQOEYc4FmTEZR5029M55Y6BkbU5hRAhozKon10TF895GmFCOcMPW2PYvt4
         TT4tUSOc0NXPsknd7zWBJ5xMXdrRrGkJA6aZn3VFTvoAtV/su3MWVEDvcH6l5cge/kAI
         2slQ==
X-Gm-Message-State: AFq9FYKnFgN+9PanNfBj5cxc0o+d5gGejygr5aDMaeTo5FRK69fo0+vE
	S1dV2Ayg1YxQSSt4/jdFL6+g8g71yclSDcXgsDWFMyyk0N0q+46V4oFIfchCzxhMFj5OBTLP7mg
	tsJRD6n8xu9QjiqNn+eh25rxAstqdqqE=
X-Gm-Gg: AYBFou2Y5ZhlmBhimsF6RjVNoqIGMCEaLOyL3P8d+Lc/vGhZuuTqE61v4cilBrjyU6U
	VxleG7qQKI1SdsAAxKM1bQKjQ1UjuDn5t14cjoTvH1Y+5H02NHMUahaotVF6ZwesBmc4yAqoiLX
	W2gZcCP2gA+EryExNLWxNeyD+IqQ3MQ9aOcg7z+U21Q0/C8/UxaCHhHuGLjz3U+YrgBh06sjOXO
	nWTv+eTtF9agpuWXVxg6dLcpUvq7XUhaZqTfwPXCxpU6myWW5azJtIaGXO1tqL48r4jd0hqPvwI
	Kg6Hhgs0EN5rU+8tnT6kM3lShO9N08gq9JLwpFehxMyboE8ULC3PoHBmkkewuf4/1XANNY9xWvk
	MCqiJ9VPZ6WaldC1kz/xyu4V+Sk3xyPTpvmmyFnFA+G7RBboAsQ6mbA3iepKsquKa7z/hBuqDZu
	o6ulWJKlXyZeLutloVuLf9q/g=
X-Received: by 2002:a05:690c:102:b0:8b0:5847:8829 with SMTP id
 00721157ae682-8b1340b4359mr10303147b3.56.1792591253005; Wed, 21 Oct 2026
 07:00:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021093522.3536051-1-jlee@suse.com>
In-Reply-To: <20261021093522.3536051-1-jlee@suse.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 21 Oct 2026 10:00:41 -0400
X-Gm-Features: AclHuK_pJcfVEZxvIrbjkfK0WdK1MAInOAt5cac-VrQ-ZEp57W-cMFA67ddroTs
Message-ID: <CABBYNZ+7ro4EHt8DXL-Oo_tgN1bn5av_KkGtaXXU7YqoQ0vDxQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: SMP: Fail if the X coordinate of remote and
 local public keys are identical
To: Chun-Yi Lee <joeyli.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	Chun-Yi Lee <jlee@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chun-Yi,

On Wed, Oct 21, 2026 at 5:35=E2=80=AFAM Chun-Yi Lee <joeyli.kernel@gmail.co=
m> wrote:
>
> The 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys
> are identical") patch be introduced since v5.13. Looks this patch can
> handle the CVE-2021-37577 issue. However, it only checks if the full
> 64-byte public key (X and Y coordinates) is identical, which is
> insufficient.
>
> In CVE-2021-37577:
> Bluetooth LE and BR/EDR Secure Connections pairing and Secure Simple
> Pairing using the Passkey entry protocol in Bluetooth Core
> Specifications 2.1 through 5.3 may permit an unauthenticated
> man-in-the-middle attacker to identify the Passkey used during pairing
> by reflection of a crafted public key with the same X coordinate as the
> offered public key and by reflection of the authentication evidence of
> the initiating device, potentially permitting this attacker to complete
> authenticated pairing with the responding device using the correct
> Passkey for the pairing session. This is a related issue to
> CVE-2020-26558.
>
> And base on spec, the remote and local public key should not have
> the same X coordinate:
>
> Bluetooth Core Specification Version: v5.4
> (7.1 PHASE 1: PUBLIC KEY EXCHANGE)
> "If the two public keys have the same X coordinate and neither is the
> debug key (see [Vol 4] Part E, Section 7.6.4), each device should fail
> the pairing process."
>
> Bluetooth Core Specification Version: v6.0
> (7.1 Phase 1: Public key exchange)
> "If the two public keys have the same X coordinate and neither is the
> debug key (see [Vol 4] Part E, Section 7.6.4), each device shall fail
> the pairing process."
>
> Update the check in smp_cmd_public_key() to only compare the 32-byte X
> coordinate of the public keys, making the validation strictly compliant
> with the specification and effectively mitigating CVE-2021-37577.
>
> Fixes: 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public key=
s are identical")
> Link: https://nvd.nist.gov/vuln/detail/cve-2021-37577
> Signed-off-by: Chun-Yi Lee <jlee@suse.com>
> ---
>  net/bluetooth/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> index 2df303f6a38f..80128b31e631 100644
> --- a/net/bluetooth/smp.c
> +++ b/net/bluetooth/smp.c
> @@ -2734,7 +2734,7 @@ static int smp_cmd_public_key(struct l2cap_conn *co=
nn, struct sk_buff *skb)
>          * not in use.
>          */
>         if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
> -           !crypto_memneq(key, smp->local_pk, 64)) {
> +           !crypto_memneq(key, smp->local_pk, 32)) {
>                 bt_dev_err(hdev, "Remote and local public keys are identi=
cal");
>                 return SMP_DHKEY_CHECK_FAILED;
>         }
> --
> 2.51.0

Sashiko is flagging a problem:

https://sashiko.dev/#/patchset/20261021093522.3536051-1-jlee%40suse.com

That said I do wonder if the check is only truly valid as an
initiator, since as a responder, this could be checked before
responding in the unlikely event that the X coordinate happens to be
the exact same as the initiator's (if that is even possible).


--=20
Luiz Augusto von Dentz
