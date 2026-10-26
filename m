Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010050;
	b=PvEwcYSepiF3o7ybC6U2Y9pULg/YZqGNMaHLGRk2gyoiaFhqf49yo6j6uSV19+MHaK1X
	 C018Lxfc0/GcBSxMpW3Omn8KN4FRXsuE+bBwQCuNPWrpZpX52NzNTBIiiBK5pndobCjII
	 guQ2LTwo+8pgoK2JgzDJkQrFB1wvyLEIpJ81fn6NzmgTJ9U9QPzJPeswnVjYthwwgvomr
	 qpLsIwaIewzkABd5uzLt4ld2Z5MYklobjAH9WvsZD8aO2cJQc6dszgCN+BLUJ0WJ0nD/b
	 Ym7vW9JtnkemwdqL7WiuynVUUEhoHjRp7lAjQty62816LUyHxslNeJFD4toCMO4561A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YMoH16GByyq7NDx7iz3VxCzQ2SdQTyZJ1IB1eadbd3Y=;
	b=BsbwlBYAMrbYhA/XNC1kYBuJIcoapxxpZi6WjzHLhYQ4TrOl30ygMR+gh2nWYDlqOFWb
	 2X8EoToivfQc1Ty4hbQesP53VJFDBqf/bnfeGx01/MJCrE6IHZ1kIRbcaL6Pao1/xCJNj
	 bZRQtxCnfXeEhVoIgeKvArFAH3c6PJsk+4X5b2HXLbSG1Dt1NwbpgmM6QgmboxNA16NOo
	 FgqZ7Sz97A7APlgFIXSj7cJvQbGE11xg2n1h/18wkClo+v7WqIRgLUhjEzOxlnuRM/+Rp
	 p7LlysCrLy2tQgM2+fsmuWMgEnAnUSuvJgL0XTsVy77zD7HlzfZSBx/l+OOlygPuYLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0LJqMHR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C2606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8C2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0LJqMHR
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so2101398c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010049; cv=none;
        d=google.com; s=arc-20260327;
        b=UrzjrL84RwhZHkHhThYuOSJKoDaG0YOv3J4vGiUuSPseegGRmvhXZtYONq1WK1mgkK
         NmcbEW6/LGlJDg/Ftp9948WPM5NQMQMY+dnOndQCilheAaqhLW7AdiVHTEEBwgIb3q8h
         dabmDXOaMYNU3dEPpi+wn2V+ggSvmpRU1lZYPR6I4OaNJa6hAg0hcgDjdVxq9Lud11Ga
         pWwyzmkHMIhoCqzCQlBd0/LWWanEnnu4AGPiOmCL3db5Yhdxc+rrzGuCfK9lb5QPvvd9
         76R1Ukw1aF6deQ8tirhDDju+P/2u9IxyYR6x7qVBjkTrE8dQMcLBClp4pZfkyod+7Fpk
         6iAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YMoH16GByyq7NDx7iz3VxCzQ2SdQTyZJ1IB1eadbd3Y=;
        fh=Bu+rhc3e6p2W5yxA2uUKYkf50Fxnl48mrIHt+OfSgJc=;
        b=ro6jSEPjWC5yLhi8BAoGgWQM0+RqAZi65YNg0VaZ3ezVUZPibuPQgctdbrXhrC94mi
         7GiqrN5OxMsi+0Ixo7jOk4H8+KVQ4qhlGrYcXdxkucNeQ/OCAB4ES93pm6BR9VHGpqUf
         CHGhO05ZL5L4khJpNLS7ESpxNkvPxgx3jb1/nduIRD9zrq9gzI9IIHQ4cMtp9Abz8qA6
         qGNBL22Y4z10Vwf8wMlpmRnTAmhunbsLgYcIO1KpYozcIbSlRC0ZcKOf71IwxMEFfPqC
         Vz06+B285nRGlaKMZC+xy2XciybWWyxPDdTT2ZYwwxQYNw0PgNbPk4nDJmTOy/pOHzPy
         70Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010049; x=1793614849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMoH16GByyq7NDx7iz3VxCzQ2SdQTyZJ1IB1eadbd3Y=;
        b=L0LJqMHRrDdRR+uolPuI/shEbdMcRl2jUTyD56QSTcxpjGfE1ewpBiR2YSZ/cYflZY
         I0U/0nT6O5qXh4X9N2/xi1l2blnB1rSl9cKCM3/ol7HCw47exR5o2nQQCzBul9Qsn4F2
         CaFLWyoI+yarQ2Dl8gxWPynUCqFYz9giuaaG8Jq/zihW1wpan3gJ2TLll3VKW5rUzw6L
         2+b4tRTc3pGEGzw0wEB75qQMYIvCNc8qTFMkU4/Z1OwmZCXyHBXbgh4oP31Dxqwa9Ojn
         2Jf5kw0SFngklP7JdhmVNB8vDUZaUb+nTbf5flsP3AFu5E+U2OUowrw65XuS9xde8GU8
         Dmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010049; x=1793614849;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YMoH16GByyq7NDx7iz3VxCzQ2SdQTyZJ1IB1eadbd3Y=;
        b=T6lmkomGwjE94ljfp3sHKaMItfFFroMErw0cC1eRctXnJGSEzeju6NqNXazA5YA5Hm
         zLkuw+7KR7VzbTrSnMqGvi7j8SbLHlbwrx0L6VANsOy4S+GvDtxG4l1OQvXI+OnIo1AX
         +J/2fFtfI4QgLfXKEcwD/wxkovUIb6j26AqtmrS9QjdpXA5jH2rED7aizoE1sz1Cj2pj
         6rSEXlEL246cuHD7qkyyuHiiGjm07UB0AkyR/1Xdx8Ecv7+bZojrpoNAA+9Zfk76Vj3/
         LU/kCDM6tQu9rWD24x3D/jruQL61FUBmYWuu5X/mNjj3FzruXYV55sBtG6ogOEWqUhW8
         J6jA==
X-Forwarded-Encrypted: i=1; AKwUvBzg7GGKK8wFZckfgr54EYEanSg6WwrsYSuZjRvBE1vvuP42gztpMXMi37SiTWIZZop9+RkJtfDVYxkx0js=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfZlBN5b4eLqsJL2jY8u8H940KwT5+uX1UMUWWZpxue7Lmmc9G
	6HnPTNTyb52YqIdz/FNvvl1q4SaSb1D25kV0qJg+6VfV8tTs9qsoSUijAJFheqchjPrGEZN4Dji
	6LT4JORPYg9tyl7M3EnNP+Kubmc+U8uU=
X-Gm-Gg: AYBFou3dj9fAJOWHG/WRrvEhGJU7C5/bakxVz3cLHVihC5briMGLw6OpgnzNY2q2cwa
	YqdlumAjxi7ITiwWIKzwxLvShkNVNBfckV7uZSAJ/fclAZ8tf5x/4RLel2qZuSh4frSXB/0uB9/
	nYqEaeP6agJtxnrXf3jpAM9wCxI873rrs0FnOHhXynNLk2YfmR05IploHNj+Y+fQimWsNSheZBs
	E7R/gkFHGbd8uiChZEuLepsGjOD2I6xhfiKSl2hFgpFI7Uim1bsJpHm0PaoNuZ3kLlGD6+dqnej
	2anc4+KlJAb1TvPf6nJBN5uMcPzlhszLtM2o4aN8Lp+VwHK9/Km+M18L+VraWf9m2T+LEKv4ZFU
	ENwWNK4U6G6v0vNdvftboOPVFQ8RkYdQpnGyW
X-Received: by 2002:a05:701b:204a:20b0:14d:c7ae:85df with SMTP id
 a92af1059eb24-1993505df63mr8729350c88.12.1793010048874; Mon, 26 Oct 2026
 03:20:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022103821.89552-1-timur.stukan.linux@gmail.com>
 <atsRW-aYHeB-cEgi@fedora> <CAF+_u5Byu9BccKQpZ9VcXAb-fMEhpKAD9A65LktLDJ77ng+KfQ@mail.gmail.com>
 <at6lTNHwA1V9Xja9@fedora>
In-Reply-To: <at6lTNHwA1V9Xja9@fedora>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Mon, 26 Oct 2026 12:20:37 +0200
X-Gm-Features: AclHuK8aVN00Mh9suAw-8_VhUq9Nba3PvRGqPy0j7Ezrj-pFXdmwKx2AZvyeAfA
Message-ID: <CAF+_u5Bo7_GySpNLv00omfAtKD++5DJYgriSO_=rwzNT7vrfyg@mail.gmail.com>
Subject: Re: [PATCH net] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 02:56, Hangbin Liu <hangbin.liu@linux.dev> wrote:
>
> On Fri, Oct 23, 2026 at 03:35:57PM +0300, Timur Stukan wrote:
> > On Fri, 23 Oct 2026 at 10:48, Hangbin Liu <hangbin.liu@linux.dev> wrote:
> >
> > > >  static void bond_miimon_commit(struct bonding *bond)
> > > >  {
> > > >       struct slave *slave, *primary, *active;
> > > > @@ -2807,10 +2828,21 @@ static void bond_miimon_commit(struct bonding *bond)
> > > >                       err = bond_update_speed_duplex(slave);
> > > >                       netdev_unlock_ops(slave->dev);
> > > >                       if (err && bond_needs_speed_duplex(bond)) {
> > > > -                             slave->link = BOND_LINK_DOWN;
> > >
> > > Hmm, this issue only happens when link_state is on
> > >
> > >         netif_running(slave->dev) && netif_carrier_ok(slave->dev);
> > >
> > > while !netif_device_present. Should we set the link up when device detached?
> >
> >
> > Hi Hangbin,
> >
> > Thanks for the review and the suggestion.
> >
> > A detached device is one way to get there, but it does not cover all
> > the ways to hit this bug. In particular, it does not cover the case i
> > reproduced: during inspect both link_state and netif_device_present()
> > are true, but the carrier is lost after inspect and before commit, so
> > reading speed/duplex fails in commit.
>
> Hi Timur,
>
> Thanks for the explain, but the same question to this patch. How do you
> make sure the carrier is not lost during bond_miimon_inspect() and
> this slave->link_prev_state setting?
>
> Thanks
> Hangbin

Hi Hangbin,

Thanks for the question. To answer directly: there is no way to make
sure the carrier is not lost between bond_miimon_inspect() and setting
link_prev_state, but the fix does not need that.

Let's split the miimon logic with this patch into 3 steps, executed in
this order:
- bond_miimon_inspect() - carrier is checked here and new state is proposed.
- setting slave->link_prev_state - just a copy of slave->link, it is
not read from the carrier.
- bond_miimon_commit(), case UP - speed/duplex check.

And there is the case where downdelay is set and active slave flaps,
so it is currently in FAIL. Possible scenarios:
a) The carrier is present during inspect, so bond_miimon_inspect()
proposes link_new_state as UP for active slave. Then the carrier is
lost somewhere between bond_miimon_inspect() and bond_miimon_commit().
It does not matter whether this happens before (your question) or
after setting link_prev_state, it is set to FAIL anyway. Then in
bond_miimon_commit() in case UP, speed/duplex check fails because
carrier is lost and because link_prev_state is FAIL, the active slave
goes through a regular down path with failover.
b) The carrier is lost before bond_miimon_inspect(), so UP is not
proposed at all, and after downdelay the slave goes DOWN through the
same regular down path.
c) The carrier is lost after bond_miimon_commit(), so the slave is
already UP. On the next miimon tick bond_miimon_inspect() proposes
FAIL and then it follows the same path as in b).

So slave->link_prev_state is not affected by carrier changes between
inspect and commit, that is just a copy of slave->link, needed to do
the right thing in bond_miimon_commit() if the speed/duplex check
fails (e.g. because the carrier is lost).

The same applies to the approach without link_prev_state I proposed to
Jay, since there slave->link itself still holds the previous state in
bond_miimon_commit().

Thanks,
Timur.
