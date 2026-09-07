Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFC4052AA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809830; cv=pass; b=FtRilhKKTqy/1LjVUg9A8HnY9iM7uJcocd5qqOTbkz0ckg2p9OzTfK5PEq7stK43xHwvG0GezDzg6kz1YmNYAI9ZHYYKex5F92kwutB4tz7MH/phd/vcZDILwFLIL05cBKn8ll11syJHdhFJ23ERudUuIQCccx2bU7kpiqMZRYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809830; c=relaxed/simple;
	bh=pAmDg64TOE5VZzyufwgiqVMUbG4l1wO3gZod6MM4Li4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDgwNpnZD68N7QoKPcpLnPZ4tbigFP0n1mHU+M9cyYuCFsKWL3IAUQkfMtuHQC7ebVI05yxg5UV0zZNKobSmPVZ+CrZTqquNke69YraNXfOTdOsrZR15y/0P0TVHBRIhO087kk3joPD71RwPryes8ejTLYXjzxqraSXu4lAhX5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbGzL2Ns; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbGzL2Ns"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso5643734a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809827; cv=none;
        d=google.com; s=arc-20260327;
        b=kYwM/+FHTX3zGO8USEA4KVnah8nMFL9lahRC6NmIdIjCbzEAIZDEwYuWH+GHu63VIK
         ylb7xMsxlFArTAobcfKmuiFIjbbk9cy2Ryxp83MlCe5Vg0xaa/muuuqQl5NsVw90jjtc
         ICkf/rGtLTD9A9Ku2TgGu8I+014ruQJCHfbj7J8zvkOMszxi0WSI1GADhfaybsH+h3+S
         aM1Z+nBuokfa8Xgri3j5qLn0Escy5Qy3YyeZgrq8g/jN6RklA9C4qynYYkx3e6RXy115
         zqSwwMbG6c4Y+dHiLvgCwcbeX/lHqNvS2CN5OEl7hMYMVq9x6orFqCNLX3AdHCmHJ/Gd
         SAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rCDQa/mg3a9yMD9wIkpq0CYkOHi539ohf0EULzMvUjA=;
        fh=uAD/kYbb52s7fyNgeppJJ+fNCO4b1S8XktAWINlmR+k=;
        b=eKcInpKo529J72I7ESNmYQ+hkFdBodiU1m3CN0dkS1iUnoAuQowJ4VRAH7O3jMZRga
         bAtTNB/LrDZFsHNTwRbUjvu/dcavayOGPZh4I6Sdw4AVHUZLKqOdBaHmDimywvVnGwLs
         8tpK3VDEmKJAo+QfEl7y9nQj81deInBjU+2r7L1lFC3MPCosoaoNza3/tbiS1J3fSyW+
         Z4EDHxseXuabEO+nTk3d4k4qzv2cf/hFlCdJstOMMEuLVLY5zLR98ODmpk2haZmMd0yH
         R04OR4APqLUWwHbnwF9k00KaLl7S/fAybwpl318p/jGEih2r1cvO0sNQH7tpPcuJZvVY
         7YXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809827; x=1789414627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCDQa/mg3a9yMD9wIkpq0CYkOHi539ohf0EULzMvUjA=;
        b=kbGzL2Ns0CHUX3ICTGFl4SwKJZmIKamaMD71JSD7X8oogUBsFR0S/K1fivQSlYOQXy
         /JeqbVKvO1aXmRVW2pe3LMwILKLcMCCkD5Hve+w1oFyPCn27sTCjbZJBMPexVCs3jUcw
         Xm38mGZVlotx2PiKMztwu6ENPqjPU3U3LSpKysf1vKsRXIUUCLiRt+4O3nCdnmGdu46W
         77rsXx6dif9jWTG5xdcEPf1E/zPAjxp/Br/Fz+wkngv6icZ7hZgNFKuXfFdxzxzWh5w/
         mn1+GRd7lRmN8RQYg1jsloLNAceOKokjcSJ+aP27J+ktNWUgRlTicRNI0+7B+qYvliiV
         qIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809827; x=1789414627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCDQa/mg3a9yMD9wIkpq0CYkOHi539ohf0EULzMvUjA=;
        b=Cm8wcFlSlCknLcYt9apPRqHjya8k+0746WeNkd73vvFRmFQUldteP3gTp4YCVOOkX2
         Jftmu8gdI8oNXxIaKpz6kNmz3JJEKa2pzkaD4bw299NOnDYrYubioB5f2uOEBrvaXBql
         +T7lYPXVS68z5FrBQiIRIgMQd1gNgZBYUdZ8EPzJ8nqiVF0rOhObK1vcfiJqX14Mz7R2
         nDvC6LSiMv7+ExoSm58Ha18yPJZOo5QbCWfcVdIlaZZZ7ieykbERXvq4P4UoJY0543a0
         QLIZmFZflOOleWifwP6F3Gnm1YzLEuEYwfs2DsXa/ynqbz8kro/WSLvpxdOx+FchQs5M
         hUUw==
X-Forwarded-Encrypted: i=1; AKwUvBy831hXGcnB71gwVAeH8pFLzCw0W+r9wPAPA+crHPZaOeNrvM+ybKNMGbvz8UG0PO0OgEw4Riwo+7XG+Lc=@vger.kernel.org
X-Gm-Message-State: AFuF++m0NPRg4fTfXh6O5lzuopRTnxFL5tYzPUQqVHhIn41UeNR1SfIp
	ZcZJkWxeuqcSZOxLMGigrk4RKgm4k0iT5UozWKrMSkcK+qRw1Z5naz5IOrlKkTsr/lnSPykMVIl
	x1ct2LXKO1Wg8qL8mJwqn5/OegYdApX0=
X-Gm-Gg: AYBFou2cDhhB/WfL85Z1ED3AMBe5GOsgvkgMjYMB0fFwv0ThRfqXxdMCsBs14OIz/o6
	sBJjOdlzP66wr64FEj9oEqd211YSDc2XXcAnc2mBEg44d8UlcptNgKa/vlIkUDblozEMs9ZAyyj
	vUE3R4Ghatyc80y9MnJKZ5QRNSI1Q0AS8bqbaTcovPnwXSQ0pif1c3iQyXfwvHkWK7FyqCXnu40
	Ep9GVWy3aC4KznFmJNU+gC1EPdUxAZVRt9Ge1Ol6YV5fski98WZClLN6FGrecROXVjBU5AK9OtM
	zBCc+XlJiCHDJGyUE7OI+4MfNG1zUHPSR21SFNi1Vk5WnHihskzl8x5xL795lBG5gNVHexUP3Oc
	=
X-Received: by 2002:a05:6402:5113:b0:6a7:ee55:dcd7 with SMTP id
 4fb4d7f45d1cf-6a7ee55dde4mr6871345a12.38.1788809826547; Mon, 07 Sep 2026
 12:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904055359.327050-1-linmag7@gmail.com>
In-Reply-To: <20260904055359.327050-1-linmag7@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 7 Sep 2026 21:36:55 +0200
X-Gm-Features: AcwNN1XKNSsHfM35Gym2RgpjA4w21sbKhoTs4rKY8si_jlYcMqJSokUdV6gGC_M
Message-ID: <CA+=Fv5SvHh4Tjqchcfofi91ZArOGMROfVkKXDQCGrEwTUrwZgQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] sparc32: fix SuperSPARC SMP synchronization
To: davem@davemloft.net, andreas@gaisler.com
Cc: sam@ravnborg.org, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:54=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Fill two gaps in the SuperSPARC/Viking SMP synchronization paths.
>
> This series is based on the three sparc32 relocatable-kernel fixes which
> honour and derive phys_base and advertise the relocatable image. It does
> not include those prerequisite patches.
>
> These patches can be found here:
> Link: https://lore.kernel.org/sparclinux/20260816075141.3489194-1-linmag7=
@gmail.com/T/#t
>
> The SuperSPARC Family User's Manual requires software to keep at most one
> Demap operation in progress across the system. It also says that an MBus
> system must ask every processor which can retain a stale translation to
> perform its own local Demap [1, sections 8.5.3 and 9.8.2]. The Sun-4M
> architecture specification likewise describes SRMMU flushing as local to
> a module [2, section 7.1.4]. Patch 1 serializes each complete shootdown o=
n
> sun4m and invokes remote CPUs one at a time. sun4d already serializes its
> Viking Demap operations.
>
> SuperSPARC maintains I-cache coherence by snooping, but FLUSH is still
> required after modifying instructions. It drains the writer's unsnoopable
> store buffer and clears local pipeline and prefetch state [1, sections 7.=
4
> and 10.2.5; 3, section A.8.2]. Patch 2 executes FLUSH first on the writer
> and then on remote CPUs.
>
> The series was tested on a dual-CPU sun4m SPARCstation 20 with TI
> SuperSPARC processors and Viking/MXCC:
>
>   - boot to multi-user with both CPUs online;
>   - 200,000 concurrent mprotect iterations over a shared address space;
>   - 12,000 executable-code rewrites checked on both CPUs;
>   - removing flush_icache_range() reproduced a stale instruction on the
>     first rewrite.
>
> [1] SuperSPARC Family STP1020 & STP1090 Series User's Manual,
>     Revision 1.0, April 1994.
> [2] Sun-4M System Architecture, Specification 950-1373-01,
>     Revision 50, July 19, 1991.
> [3] SuperSPARC II Addendum, Revision 1.3, December 1994.
>
> Magnus Lindholm (2):
>   sparc32: serialize SuperSPARC demap operations
>   sparc32: synchronize SuperSPARC instruction updates
>
>  arch/sparc/include/asm/cacheflush_32.h |   2 +-
>  arch/sparc/mm/srmmu.c                  | 120 ++++++++++++++++++++++++-
>  arch/sparc/mm/viking.S                 |   4 +
>  3 files changed, 123 insertions(+), 3 deletions(-)
>
>
> base-commit: e6de5705a9f0d81f67bdb2917108784b5839cecd
> --
> 2.43.0

Hi,

I'll send a v2 of this series soon, simplifying patch 2 to use only
a local FLUSH.

SuperSPARC maintains instruction-cache coherence through snooping.
The writer's FLUSH provides the local synchronization needed after
modifying instructions, including draining its store buffer. Remote
FLUSH cross-calls are unnecessary.

My earlier justification based on instructions already in a remote
CPU's pipeline was insufficient: a cross-call cannot prevent an old
instruction from executing before it arrives. Callers modifying live
text must themselves arrange safe execution during the update.

The v2 will retain the local FLUSH implementations for
flush_icache_range() and viking_flush_sig_insns(), while dropping
the remote cross-calls introduced by patch 2.

Patch 1's TLB demap serialization is unchanged. Cache snooping does
not invalidate another processor's TLB entries.

Thanks,
Magnus
