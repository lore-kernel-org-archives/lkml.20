Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382814;
	b=oBOBhKNKskWcIWVrgiJjvfToV72dFIi/XhORbcquV3nIWw35kueqmo0FIyvoyuhH+jEJ
	 ARSF0HxY0kglvfRnf3Vxk0QQy36PcTC27EtAP2w2NETSCEr9llKc65K3U0YeZRvBhgEmt
	 9P+efCX9wGFl8aAOSDNlE9nsPIb08tq1Bktvh77PoSp1pCyA6pzKmJSTyIOMQMpkSmwgk
	 3SSa2cLUofKHjyDL9nEIHY4QyWG44F6tauOozNWS5gckiD6ncC9kfGHt25ZpvC5QukW5j
	 Sr2TI7BbySZlh66WRTFBVaOgr8UrI1f9zi581rEY75+x3l8197hfnBirfkc+ebGntBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
	b=nf+HXf6xKcBoL0G+7O6AOMqnrQkTlNwHMH0+04j/bEjGlT8VyG9yIFisMjCN20s/RUvP
	 633h87oreezlrer8bn8y+VgkQVyzZMrLYCSL1I9ZixFe+A/wHoGv4x1h667giJcsNqJaL
	 +H0XOexair8uyn821ywgbYeFXS2jX7rh2ZLqVXKQWYswwV2HKcZM8pXyZbm7XK8hhy3QB
	 sfU27LgwCx8qtSwQtwiqEgDFPgQnXwqmxNDBuUao0AckdulGcPXUbv0pZy9bkx5tIvMtk
	 k+lT24n2MQkQJd5jXJHmpN8Y3xhqpW4NFfgdP6nXQgi+89yjTxSa0rOColT52dmn6iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA85E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2275867a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=TWpY67BZyChTjTqHzcKY58JsJUHfRN5keFPuGuKF9omBPB4xdOZDmtanbTr2SZ4cA5
         MyjIacw2VyBSQVB/qen0L0WKL/yHsDVlCM0M5AamcDbU//1fcjuNLXHLkG8YLR2AIUn5
         mE1Z0XwEJIdzrbj+7tnoxoyx4UUNAmF1sjGcI1t3TfXtnAn21c89ZPvSlk7RO1kd8tFA
         ASlOINi0mAlrdl5wuDrh7LuzYgN4FXG58sdhilhYgwR+AcWygAI6x+eat0jIx8L3pupt
         dX6ABqy1HG32fGDNCfy351AiKTZXUQxdWeT05X3LRp43JnwLXRIbwnKFnWyZshpBSaw8
         klBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=9uLrPbuNRazYFQUnpqi9UN4uYSBoqU8MLYe8oAT1va0=;
        b=CQKT4CuqfLT9rEEVk2uTaLMGO+zhOozDKRwDPfvWt6R6e/xbpzJTM02i32OC9n9FTr
         70ome6p/9drjYrMh9PG/SOPHrY/qPcR3qMBBhJZeQ3T4cQTJoCoxFGh5ikPSS4Y+WOig
         SP35Uu5X5v2Iee6oclVRHTZGzpFgMKSXz4B0UbVTM0dxzB8Z/J6PJsEIRzsCtFf+bagv
         H0bo7GIp+FJHEd7OT10jj/sO01/2bxu23eAzDY426WaYVADfYXJnhZNqJXL2wsCC+iTF
         wc7w1QE2pd23xjyqbtgPECz/3RULFQKDU6aBpddioK7kgLujsIh9bXx3QFPBnHcxFBa+
         4dGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=VCD6QF64cq+6EajKVeH2KGvi/U5cBgOq2QaZUPujN9TUpScC8tW0bSWQt0oDUSy4JW
         S6Z8D6nWlIJvYo0C12W4DfrOkGdol86fJwYUUTyy4O1KRs5ZZZUMVLH5TcN2PkElzTMC
         CDPcO/9EjC2evHTSCepGDSbwuoSelf7KCGcOupsWhHmqIXstiHNkS+oNFTvRiDsE9USX
         LiWsrb9RYjjdGp3t/FMvX1MXOCXDbkNCM98PDcj50ceTD5evbGSrKBzvVmJsknTflsiz
         goYBb6lxDQzfivXfrbKsifTYJfLVgLYCutTWcyI9Jo7kHyPrf094IrOod562TSGGHij3
         JFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=M4WaNiGq2tFl8VcCOxtFEvG9L58XrIsaHA6Uup9sOEkFV8MKnOtQKkNbNENLtJcw0p
         //+WY4JOkiVBejXKhsdj3s0MzvGUb7vWvKiTmn42i6rZXXkITiFsCWJqcduredkv//LD
         Kkc3KgCWtaPvbTy+XDGXgGQTGroJ9jX6EpAj3tURffVX36BKe9QAlm6Bmkpf1mRVDVNU
         dPmE6Pk8DUTLac6GcKgeciZlHDtpAjuo88fZzSXBw4uEbLFFaCjHpvDAoAnQMe3CHW5v
         wYwzpZc7IPyM89hZX3nQvGGTnfRcjVRdz/E22M6QXn4vh5BuwiOJdDElMvutvZsdwHLX
         wqpg==
X-Forwarded-Encrypted: i=1; AL+hErFCyXgXWAES0UU2kxdHtonWaqrCJ096or6RWPJnAE8payAsDI3kJ2FY9asKM4k9Kkw1Fd7O2epO7rPVkNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w/FW+88Xob8cu4/teeh+2L015vr+4f0gV7mHjC1HbeT4pkCb3
	/JCn7wnOE56PpHCW/Lmz1QosILKHLKOSaGtfpjtck1zG7eone8GmR5cQZ/E2ROzQ0JKGzwUQsQa
	Ie4UXp9rijPrrQOaK6Fpg40B9Ix1dE64=
X-Gm-Gg: AYBFou11Mi5LhkMMQVoJL9YoyQC0bVZcf6maPDet2HZHAbJiQco4g7ufwDydJmnn/tf
	H27ZM25zIUx+uG4EXNQlvKtzp62cfr5s/nPxKVinSlwSKH97bHBGt05fabcpiagG12GISOrAtss
	YolWNcxGzv9DQhNTTn2BZ3CElju0jM2XStvwfkHQdDL/rjqaFaYeFr5zWuX6GNTDKcEQggorU8c
	D00J53MIecuWJ6vnTgnEuYf5YUInRgUGknkVZBEHxH99Z6ms6Nhtlc68jrdNt4VG6IKm1LU1/Zi
	hZVqVpY7ehwjMRtW/x5J83pUzgLWkEzuNXh0xFL9QU/mbeZhssE6HHrfM0NwGUI0xB+fnKfMuGq
	zbu5m5XdbbLlGcfBWa5UWQRQjBU+2nbXlr4jU23ZJVxNpANR7ayVXS/OY/y1peeZg3nXbQg==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus
