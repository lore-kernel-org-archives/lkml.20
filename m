Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421C49F137
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265873; cv=pass; b=BySWb3bawskXTybIr0naoQCZDVeXC0j1MuE6P3FSD8pEg2gBcw4/NCz2CNV766BeRqeS2gXu8AgQInONXG3ftGYa3oKQI5yX79tD8lCyWiopCN7yvxnZwOSWDUpKuMs4XfSKMJ9KCOk1go6BIjv6sWqoO9If2OEGVfKUKQy4+e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265873; c=relaxed/simple;
	bh=gZF8zkyQLf5Xev3bWAPyj1qtK90ArpE+DTKbuJw8//Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUW2USgCf6+OBeV9n1ByQ6aGtp/kS1ZwdLoPD+K/P3pyFXOhzeL1OEBgaBrTBN495R3O4zYzyu6Q7ximu94jMCGeO6gjNPtM9LQ/vScp+4An+rIXzJ6jJUK3da28NHZA18pJJVW1WSgEwAE2DJt/ujpyprCtMK1fX4qeATJm7ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFN6aTJ7; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFN6aTJ7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so18248135ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790265871; cv=none;
        d=google.com; s=arc-20260327;
        b=mDdQFfnwcfQqj+sed4yd6ZgcfJw0FwBlIOlE0K1PEZzM0aAveULQFh+6COFoVXGZpg
         qqSp7mQojh4mmMpFL6/00D+Tim+akJ2qBK+02BHRhTkUdOB/o+sVuIKwXW+kXXtQIiUx
         bEQIz5DEtXiOsfeL8+c7v80xX7SQfCUQ0qJcl7O88woQT0SL2aQowwlMBR3iPgG6Fs3S
         Z0GaezGxlQ4DXXOVJDN+e+cU7Lr4X+SX+dpJuBa8FLjiPRNos0uApsIXrtn10CC2Q9ST
         Lysmx82vFnU4V+ft7D1EdDayeqZ3ERY6N5Y2CmaSXFumPWXjv6aSKrinzQAH7f2cglx2
         lBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        fh=TKiP6pbNvF7SpSAYZg3NO1wL6qcPu1qvG2/udlSaon4=;
        b=Prrme9prcmL/YgHEXVrV+VwAuiEmg3fo1qhqZhDCN/582QHhPYqA7pSfPQr6PvTZ8z
         9myqRE3Mp5qbJSloqkK7T9Oy8fL9TdX3eqjUaDkUn9ieoH555lLzjbjSFb8IC+utyo5t
         +hf15GB4br/fXxJ2fswCJ5AKNcoxQ9e4NHhi3UcO1GaFacb8OTUQcxf//nxIm3I+2LLm
         s+itFYS3g3pISttRhARDm41il58EO0u9dYb1fmKStafcbXlpYWTvnOVmfx3HKgFZfxkL
         WnMT/S+cK8xOfHCVDlJ2FxBedGC5zo3tngJ59JWpzyS/R0mSX3rx+eu0SEXIrs3/EpEP
         aJ4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265871; x=1790870671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        b=eFN6aTJ70TYDhj1BkFoNNdIk47QjXbap+W0+rB+PSxr1WEoO9vz5UsswJskpd1rZ5g
         WpNbkE6/TK8RIQy8PedJIyx47dTqUmw5XRFGCLkwUyDmssXLQOh9erGBDUgY1XjHRRVK
         62CBv7gzy77CXRoZxiQCQxLyGjviIu3qaedR2tp1iQxQP1OfLG3Sq8jupUWpz/ablccx
         YDH8ga+g+Q+S5bQjuM3rsFR0iK/nFnydAdCiUtCGvsNQVyEbDmCFFmOEeYCzVrV9q1Qm
         N3rwCKBCHERUhZjzWmk9524l4iSDjyZkv/M0LPmiqxQNgyTms8ZyKIMOGlEqBJ5x7vXi
         ITtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265871; x=1790870671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        b=sa5rMYwRB5b5HDIMW4lDQA/O7YhE34PRDygAVUeKL49nlldBAHzEpYbx3DUfJuJ/L/
         jlmqjxdtEq3VZeVqCJOj7h4ntN6BG5ZWuMzhQxDF9Hh+3pnDgmOb9MwInsoSVnu0J8St
         tAYQAfkaiXwQ8TLcQ+YSfuXtfXm1RnxhL3e0gMipIv6dkE9D0bZXTCtK5SVNY7WW1uBz
         2/6wXbntbhQf2+7IcfdeUkykzKhOyChDjCIhUB8K8tL1cZROA3Gjm1SiSYibRrNvSRxX
         iHp1pwrS2yjJXrb4/83HqxpXbwlFI+C6CGequ7kOuwc5zBUdEWQ9vxEJbqZEgHFAuWrC
         +fTg==
X-Forwarded-Encrypted: i=1; AKwUvBz5MNZ6263JZaEheMCGcpTzqL26kPZJNgdryT/HmlDtJwgwLZebBzGzWvhL6f6Yc8Ee3ikw509TH+Ex3W8=@vger.kernel.org
X-Gm-Message-State: AFuF++k74vxPiJMCM2if2fEw49Zn7r0U1B6nAn/xFq+33n60HXkBMAn/
	43O11VfvA+fqaoOqal1oeLGFO5a+8bJJYFaVTg+5cM/MPZ0A/WlPxW55EDlUnc1TVon2IEmCplp
	igNk3uThItjpTjF1LqEflHwsz3xBsbAg=
X-Gm-Gg: AYBFou2u72LIQ3cqmd9zdN8AXwvQkMNKJ3sh1frLLpDLluwd11IZViwcOuBDU+QRBx1
	zLpr9cnyxdFNpnA3ejn8loNukSBeMbXUDwX34nI79HHLM2Z6E05nCxkPLG36veDn+XtlC4MehbQ
	UrB3Ek50G4minxKE0iBvIKFrOAC97zLaTzNk4Nb0wN7dOy8emzgEjdgjm313CuK6faH++ZRji78
	rJJtyUT+3r/+xzYt+icjOeXzipI/kxeF0yZLkQ0wQiFgqcQ11/kifo06bJar/UsM1CH9IYQ3nVK
	gBPJE5+wVN1spFejEPugkZD74od5hrxvkSs7eosSK4jayUNsgOAafy5TX7apmC4TFfa0bzJ0NfL
	9HAShYQ+L7sk6B9uvSfT3ugt9P6UW6WaB9ed05mMz6ps1NbkiL0s=
X-Received: by 2002:a17:903:228c:b0:2dd:68a4:16f1 with SMTP id
 d9443c01a7336-2df7da5e2e2mr29161885ad.11.1790265867984; Thu, 24 Sep 2026
 09:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924110054.1553880-1-lgs201920130244@gmail.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 25 Sep 2026 00:04:16 +0800
X-Gm-Features: AclHuK-5-ik7DCNqbXRBBn79KX4N90FkMwdKIx-DAhcczRvnhM_JJvyNUphu-t0
Message-ID: <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guangshuo,

On Thu, Sep 24, 2026 at 7:01=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> After kref_init(), the device_get_match_data() failure path jumps to
> out_free_channel. That path frees the mailbox channel and then falls
> through to kfree(), bypassing mpfs_sys_controller_put() for the initial
> reference.
>
> Call mpfs_sys_controller_put() on that path and return immediately. The
> existing kref release callback then performs the matching cleanup, and
> the return prevents a second free through out_free. This is the minimal
> change needed to keep the initialized lifetime balanced.
>

I don't think this is a fix.  mpfs_sys_controller_put() does the same
mbox_free_channel() + kfree() the current path already does.

> Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource l=
eak on probe error")
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 0400a01b2338..379e4f649faa 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
>         return 0;
>
>  out_free_channel:
> -       mbox_free_channel(sys_controller->chan);
> +       mpfs_sys_controller_put(sys_controller);
> +       return ret;

If you do keep this, the out_free_channel label no longer fits.

Thanks,
Felix
