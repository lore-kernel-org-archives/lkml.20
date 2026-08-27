Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6D34D398
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834560; cv=none; b=GYIHahLiyoKdIKxM6T3xzxqo7PCtNGBhOjrEIoxhtEreehPn3bI41qTxspNFejf8Gsg1vQJ2nU7EbsMdN5DXl8pbZTv99oGbV9q8Tz86C8x/G8f1DI20kUifJEl7ONeJ+3ulCJcHXBfu8oHdfNdTILT0xddaGv6GpzhnoqbBR04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834560; c=relaxed/simple;
	bh=AI5d5IqzS7q4VBUwORDrMITMfMe6rIMabN1dcTG/2es=;
	h=From:Message-ID:Date:Subject:To:MIME-Version:Content-Type; b=kuYURrmtj31ISfBEn1wc5nq1kW7OJIMttMmQz3ZpQinBK9mVvYCM9VtroFV5AdcGoBp1gd0tulqDU4xBIN64gMNt3+eOyRHR+8JXEfhT4lwPclTTN7ltUkR3BShi79NWWq/KFN/9i3viMgjqI4GTnrgSREfl321i354qHL0fidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=Nf0gHpF0; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=aqU3vgLd; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="Nf0gHpF0";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="aqU3vgLd"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834554; x=1788439354; bh=qwcWHQkLh6sHsKv0PM
	ad8X2aksEimXW/29XeXlzbdw0=; b=Nf0gHpF0JCASxuujorGZEbQe4yGdo2mYTJFrmUCcywyFi
	Jikl+WCl88qYEvsiWDEqgNSj8y3I+517XSHYvTSHAmzXgIf+deOPZbCRjKiPgZcszNq89Ejfue+
	Vy/0dfCiYACFCjRcDfrOFsxrY9np0vd9gDTVdNyOaYzjYgvhWUyBKfOAIfTfG/Atv5mlwlrOUQO
	rxgCxj4DsIbxjkXg/tCQ914z9kuulBDxn6SWDk42aAtpNArIKOQVJxTAODGP2LuVSFRqV1EBra7
	1gRM199y6XOIsci+RLJv9E6JuJKBMkhJshw8InmdwcWAUO1q35vIcIaITGkU0t4aNiaDI0Dg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834554; x=1788439354; bh=qwcWHQkLh6sHsKv0PM
	ad8X2aksEimXW/29XeXlzbdw0=; b=aqU3vgLdS1mNtgDUnolZEooRaYuCdtQPcHryoGVhhsjRY
	X2gEjhAklAq5a/vk2JlMpnAdclNVRo25C14rWXbtvnZNDiKlYawg+6nBYy1LFi18NOcWrmKNOHN
	0gUeWs/2U4eSWViJ8hAk7OSh1Gp9naT4KuFp4cnWBi15dLlPzLcKFLUyJ4N/7YIFYGG4l9BEo/x
	r3MKXZbiUtd6bwQg803dkBrWc7SiBgtMpF5J40DcD0Cg5eUJN9x8qSjxwn0kATTYvGouVQdC/vn
	UvB9CljBfBqmRaduk5JjAeceNvSHT0JT8oX4s7Sn3IyGkQbuvb1nE+Oqhz1gw8LR2OTB5NPw==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+9d44b184bc8f410d@bugs.sh>
Message-ID: <1wU0VjMckz7b5ly5tzcr7MbjZKdV9kTFjcc4@bugs.sh>
Date: Thu, 27 Aug 2026 12:42:26 +0000
Subject: [BUG] drivers/misc: out-of-bounds in qp_memcpy_to_queue_iter()
To: "Bryan Tan" <bryan-bt.tan@broadcom.com>, "Vishnu Dasa" <vishnu.dasa@broadcom.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "George
 Zhang" <georgezhang@vmware.com>, "Dmitry Torokhov" <dtor@vmware.com>, "Andy
 king" <acking@vmware.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We found a bug reachable in:

    path    drivers/misc/vmw_vmci
    crash   out-of-bounds in qp_memcpy_to_queue_iter()
    commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/=
pub/scm/linux/kernel/git/soc/soc")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you patch the bug based on our artifacts, a tag would be
    appreciated:

Reported-by: co+9d44b184bc8f410d@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an LLM-generated root-cause analysis and a candidate
    patch. The patch passes an A/B test: the same reproducer panics the
    unpatched kernel and runs clean on the patched one. Neither has had
    human review, so both still require validation before you send or
    apply them. Available on:

        patch.diff  https://bugs.sh/b/9d44b184bc8f410d/patch.diff
        report.md   https://bugs.sh/b/9d44b184bc8f410d/report.md

    This is an open science project. The code and the full set of PoCs
    are not public at this moment, as we intend to disclose our findings
    in an ethical way.

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kern=
el.org/pub/scm/linux/kernel/git/soc/soc")
    VM setup       https://bugs.sh/b/9d44b184bc8f410d/run.sh
    config         https://bugs.sh/b/9d44b184bc8f410d/config.gz
    poc            https://bugs.sh/b/9d44b184bc8f410d/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in qp_memcpy_to_queue_iter.isra.0 (drivers/m=
isc/vmw_vmci/vmci_queue_pair.c:348)
Read of size 8 at addr ffff888013c2c568 by task exploit/145
CPU: 0 UID: 0 PID: 145 Comm: exploit Not tainted 7.2.0+ #9 PREEMPTLAZY
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
qp_memcpy_to_queue_iter.isra.0 (drivers/misc/vmw_vmci/vmci_queue_pair.c:348)
vmci_qpair_enquev (drivers/misc/vmw_vmci/vmci_queue_pair.c:2573 drivers/mis=
c/vmw_vmci/vmci_queue_pair.c:3049 drivers/misc/vmw_vmci/vmci_queue_pair.c:3=
036)
vmci_transport_stream_enqueue (net/vmw_vsock/vmci_transport.c:1866)
vsock_connectible_sendmsg (net/vmw_vsock/af_vsock.c:2305)
__sys_sendto (net/socket.c:800 (discriminator 1) net/socket.c:815 (discrimi=
nator 1) net/socket.c:2277 (discriminator 1))
__x64_sys_sendto (net/socket.c:2284 net/socket.c:2280 net/socket.c:2280)
do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:8=
4)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)


---
The report format is based on syzbot bug report.

This report is generated by a bot. It may contain errors.
See https://github.com/n132/cedalion for more information.

For any issue with this report, reach out to cedalion@bugs.sh

If the report is already addressed, let us know by replying with:
#co fix: <commit hash>

If the report is a duplicate of another one, reply with:
#co dup: <lore link>

If you want to undo deduplication, reply with:
#co undup


