Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D353D954F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051036; cv=pass; b=PZtrUOJ5i+1rI2K2SpICmXIx4usQjfEYVRijUbCC8BQJmiOHF+/OX09hjtDG0l8AVXvY/VHGBor7Axk0vzaP9q9lTv7wj+mIqldRj/S62i96aSbNSABHYnvoNAxmBp/0RsttLRz7mj7SjEUpCW11/aQkmoPchaVV37SyTjJ7/F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051036; c=relaxed/simple;
	bh=7f7sfQlh7zgWV+V7b3mXETPDQ22iJskv8tJ/E7Q5QQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD1lwgmPZie/mbACGrEw8voBqf15Dy6mImgJ4N0lxO4D0jJL2PK8c3IBld9I6QkFkLQdf64C0UZlm9RVnYZeMlKsuVrc2D0N52We87eUOcwo9rIQQLwTrQs5szxCfNlV9Z/R/wu2tpl0CEIRS02SGa+3ZqxS/PISIb+VHQlgckM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kRs0HGYy; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kRs0HGYy"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4544a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792051032; cv=none;
        d=google.com; s=arc-20260327;
        b=YB3cRJ63Joq1znunHLzFvUBd7167ol0auiVNeUYm64R9n+VvQcSDsBTts2SdEJe+16
         Fc+Cy+JyyzTlA3TCp1liOWPKmT/LFiREv2WgoEV988xa6FnMw0w2FBYzXprw18Cj83Gq
         n/i8x40iZNwC11UCr6m4Dhb8iv/QtDg0vg2J8o5PMauznqnTEbjYzRQiSBbIrXinZNei
         z+kUeD/iqx+hvxLKGi/9gcnQGV5bgK6UPQTWnaptS4IqZV9pN0bKH40o33L0paSFsWaf
         OT69qo6Fgy211oIzPgWl8XTP5OvFzQrUQp4SopJPaMFQlDpGzlcglJdQU+uqVum2Fh9D
         sFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        fh=SC+GaYSb9QECQM4TT/FLPtF6IVDcjSgYZBRPGNzLxxQ=;
        b=swFBRHORu5Q9v6nt1ZcSj3YH5Ec9FmxSh40XYqx2abM/wp9x+YSGssmxn7ZtF3wwov
         FWCK+BvUYPglc2/M92Zmb1Qtkr+BNAJp0fnOamp0Ho2aFoTzOhX30hO/HxadXAQBXaeV
         WqUvOObxcpG/Ktcv+nVlMVqHOn496fjlZhMOk/wVIJyGVjWurQrllaar2MDA0BdGRlkn
         HFWpFLSJxr/HK95WYK7PKhlWFGnugrgsDVJIQ4w4D39r8nqagjGJz5qZIl/3Ms9bNxzB
         zMLqvZyHsBuuUbzaSzA3PaQ/BWcVDpvLYa4FONBkwoijXPbkjQE4hqf3/phvg5saTMKu
         rE7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792051032; x=1792655832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        b=kRs0HGYy1hviCGVNCB3IK8xTgTFuhCHkYMTjUA0QOJoGlldLWqLwJhl9BtRjf8SaH+
         fapb/1OknCoe0p1uyQCAiwxA9lGWplkceeGwf+4yBxp7q05nuwc6I0OgUtUcceDq3oX6
         +srzg7/gU1Uz16ODUeNbDwSKAWiZi9bJY9xTn56DG/rYcpe2AXSg7DfW1HvRetN8NCf7
         n0jypJlYBHpGi5TDt2F/3kkrfp9PMXQebd0xaFJpkJyOu0jsoYnGVyIjz57RwdDMxKZG
         wCiwttGWNHkd2XnLxatQDHLyXcNIEMyxOX0xmqP8W3QKvNWfKPDAJHJIm0ubzZf//+4u
         04tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051032; x=1792655832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        b=JymhOBdQssMen8cTzcnAEtUkyxpjx6zWmd0bejTvnkFGpBSztlk7i5HK1xVCV47noX
         93nS7B5ioLJs4ZOHL2bOTthSSUaJniO+zT+HW/pj3DnWOC1G4YyPDA0THxow0hYBPXiY
         zj3Bi5tLnu3F2GiLaHGEd7kEevfE6p+rT7bnmTrA9Rg+D1fMBXolNpKNIYPQ7CIary17
         UcDRVH3YxPy8OkD6m8nn+3KBw3LY7cQT+kv5aSZh0lL4nXyXroCuJfddn4B9A9U6VuLL
         DGq0UpyY0OrytkTOnRrLDAUi1juztCJ9GFEEo66abBv1YH36bmO5RVebq5gwu+t3hAOl
         KaQg==
X-Forwarded-Encrypted: i=1; AKwUvBxCT6R8yzKGb023yyHV1MkxctXBZQG6QPePRJgM/FogbM4utwDLZxzMRYk+AeoKF/KpaSsMvGkItEEdx/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFsTdPuX4PsXJQHY4QawSoKyXD9hvY1T4PfbMEcTty2uJZZWrX
	xjJacvlvBgxzgIkT60yAQqrO6jcg2veK+kOJXtUi9gy1s/trZvVXJCmgd7KED9JhRoDYKOrW/D/
	ckDG90ZMHAjvbxxDXgXCicOLHYs4E3U5BSIWApwfY
X-Gm-Gg: AYBFou0hhUC7BHz8uUVFUClvGcUkFY251+IQThWguLgvP3e+iUly5UHvTfgZKSB47/r
	k3ngpEZtCaV+yPU0aa3nB7ZjrRSPRzZgg/WyGQX3Sytw7Q+bSYKNIdowMyN2mnOnpWvW+ADr15l
	B7I8rKiF0IvJGH8Br3Es/qMGluwi4jpkiT1KrxBGU53XqD4S9nFXGJy6XWqYYzGfGDTdoOKCnmw
	ebUKjy650VAkSwVciJa0DDY3a1fbK53UiYymn9gRcfRJeLQl71IJakmtXDcE78uwV8sBYtPI+7K
	PoFIMVkwbsuPLz5KWUVFHYEhi7RwjnG87vvx41ocjU+QksIb7unuBdgiHu5sXAYVFZ38qOSMhdW
	muiCgZKQyEO8nlg==
X-Received: by 2002:a05:6402:a6c2:10b0:6af:8433:3c7e with SMTP id
 4fb4d7f45d1cf-6b32bb8bfcemr13427a12.2.1792051031273; Thu, 15 Oct 2026
 00:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <179205021846.408196.14808616314279740107@kernel.org>
In-Reply-To: <179205021846.408196.14808616314279740107@kernel.org>
From: Octavian Purdila <tavip@google.com>
Date: Thu, 15 Oct 2026 00:56:58 -0700
X-Gm-Features: AclHuK8v7XQtgecDV0jsO__BHD8YwxutmfG-K5IsGFWan04ZMe1cAcKU4mLeRAA
Message-ID: <CAGWr4cS1rmo9+6gT==D1FGb34K9KW+uPO=se8-WV8YE-SJP8pw@mail.gmail.com>
Subject: Re: [PATCH net 0/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:43=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>

The issue was discovered in production, here is an example warning:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249
tcp_sendmsg+0x10c1/0x1530
Modules linked in: kvm_amd hdi2_standard_ftl hdi2_megablocks hdi2
xenolith stg elephant_dev_num nv_p2p_glue vfat fat livepatch_v1(OEK)
k10temp i2c_piix4 i2c_via_ipmi i2c_mux_ltc4306 google_bmc_usb gq
cdc_acm xhci_pciJun 18 01:48:26.051200 rdht15 kernel: [66690.105140]
CPU: 1 UID: 368767421 PID: 939331 Comm: DefaultEventMan Kdump: loaded
Tainted: P S      W  OE K     6.12.63-smp-1400.86.0.0 #1
Tainted: [P]=3DPROPRIETARY_MODULE, [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN,
[O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE, [K]=3DLIVEPATCH
Hardware name: Google, Inc.
           Arcadia_IT_80/Arcadia_IT_80, BIOS 34.86.0-0 01/25/2026
RIP: 0010:tcp_sendmsg+0x10c1/0x1530
Code: ee 44 8b 64 24 3c 0f 84 ae f5 ff ff 48 8b 7c 24 48 e8 f3 a7 23
00 41 be f2 ff ff ff 4c 8b 6c 24 10 44 8b 24 24 e9 4a 03 00 00 <0f> 0b
31 c0 e9 7e f5 ff ff 41 80 8f 84 00 00 00 01 e9 00 f6 ff ff
RSP: 0018:ffffbaff64a6fc38 EFLAGS: 00010282
RAX: 0000000000000062 RBX: ffff9c45670d3c00 RCX: 25c2e5210d8ebf01
RDX: 0000000000600000 RSI: 00000000fff8427f RDI: ffff9c43f2fc0062
RBP: ffffffffffe4b17f R08: 0000000000000000 R09: 0000000000000002
R10: ffff9c4c187b6200 R11: 00000000000001b6 R12: 0000000000000000
R13: ffff9c4383ffc1e8 R14: 00000000ffe4b17f R15: ffff9c40fe838600
FS:  00007fe39fbaf700(0000) GS:ffff9c874ce40000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000010986487a238 CR3: 0000000973fb8006 CR4: 0000000000f70ef0
PKRU: 55555554
Call Trace:
 <TASK>
 [<ffffffffa5c218a2>] __sys_sendmsg+0x292/0x490
 [<ffffffffa5c6281f>] ? restore_sigcontext+0x15f/0x1c0
 [<ffffffffa5c6e1d0>] ? __pfx_flush_tlb_func+0x10/0x10
 [<ffffffffa5c6e965>] ? flush_tlb_local+0x285/0x2a0
 [<ffffffffa5ba1b29>] ? sched_clock+0x9/0x10
 [<ffffffffa5bd7900>] ? sched_clock_cpu+0x10/0x180
 [<ffffffffa5be362a>] ? generic_smp_call_function_single_interrupt+0x19a/0x=
430
 [<ffffffffa5f51848>] do_syscall_64+0x88/0x340
 [<ffffffffa6000136>] entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x5580e3f28a3d.
