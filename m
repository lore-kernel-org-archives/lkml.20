Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53AA3016F1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639176; cv=pass; b=mEeoVoS40ApGeoGic9jTxfKDUPvAKp2DKaaGxFgNsxUwpCIbo4mkItfdSbFc+QSYNFmy1V05JriKizq7Srf4V5vrQ2wcbdKBCYiweTcEHOykZH4q5biyg/NdE1b/Yt6vS9jtpXrZAYABj0Kx+jwJ6paIlsJI3q+eZcx5ewQ7m40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639176; c=relaxed/simple;
	bh=mtsamemj69B3iRndW+JReJ4MdazWwyBzoeeClqSsfHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMm4Obxgd1bfTbtAm7D8gVhB4SLdNbfePwxwA+KHD6uLHj9i6LgNy++wcJb7cd4Hh7pw7cGjna11KuLiazTJW0slusVIrAhS21ORxwo5uJoV0yGNHI415kmE6snI5mECM7kiYOniWotCYciglRz9nT+t/31Sc5TpEqI6lZxKOBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th08GXw0; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th08GXw0"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9ad623098so5940981fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791639174; cv=none;
        d=google.com; s=arc-20260327;
        b=XONCTzM36cHcPziOHTOnq6p7OfBnP1tsq/gG+nRuLXEweQGFGyvEIeZCHQjK9GUAma
         MUsQDiXVRRgxPpHjDDSRuuJZ3mkWu/8xxb7PWMo6PQqPQr+dA1MzrAyocnmXXTUBmWwV
         3SXFtfEKveHUaMq+H/SxpaJrZ0FXglB8DnWrdhr3iRd+uy3D6l5a98lrC2/0lTbwtQqS
         H8+inCzY59jGEgGazh2VB9Q99+2i5M3lB6ucx2EW41Hol5M/zIF6tI/GTqX5bmL+7nUD
         VWxgj3XucDgUjw6E1XFj176xi0mI6S1iycg3zRYJq2pirgT0eSFU5G6Q7X+Ktb0MID/O
         OvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        fh=0npH6M9j5NR9ofC+5Rh/pWSvGpV4sFfRNBgTVeqmwgE=;
        b=p7scqJsoCGENzb5j1H041RCADFRPMtl9uYq0TbykbAXjKb2fdPAJWPHTymPqXIPZOr
         huiEVo+E9kWO6S8w0RT7O0QoFr7KNzDIknosfvsspivlkaU0mXKB095HQ2wWqHNnVh3Z
         OiFtC0WYD0EqtDvVWzIEvECQagrymtCVo7H0QmdH19FGBtv++6lsM7lmAgMJowN506Jm
         qukyvFJOEXzeEVHlXZurj3uCGPYbuhhGKthFmPD0JkdKpO9dh9DwTLnYl9+aHFOxor5r
         S246EizSNwhVskX48EvnKneSOvethL+lx8Vx7VMcqOMGF7G+K3seUGOwnbk02B/AuRWJ
         F8Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639174; x=1792243974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        b=Th08GXw04g5oyZOZrcolN6lkThyeSPl0uFs26ILwRvrekmRRyU/ak6jLJM+6GPYtVy
         wjg5O0m+/GNnWrRGiPlZYAUiw15NdoT5TwXam9XdcOhy/rQNY/29Tqr7AtUtnZJoVp+U
         Ml6ezJ1q2rFvqi8kWNoiYmDTpJF+M/esoF+IaT+vimu9y8wu+kayoSOJ55OkDQSei1W7
         WUDnx2hR/Zs1EulcVkkhMUt/ExN/VC3PJpXCZ37leVxP5vbP4ssU6AsKvKWIUablkjCf
         3EwdwDIwaLNqQ+9gOH1cA0n13/pW55YRnhaaPylYTl3dTZ/0gTzMMBStVWX58ZZ+3yIX
         2OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639174; x=1792243974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        b=2Xju+7MRx29tuO6R/HKnlxJfQHxz4NOIqZf4ifFoC7yKR/nT6/9WTq7VfWT/JPu2qI
         j/sevwjvqZgKFH8TVRFXpTvp63AMf4bVZ3xWd9mJ7qT8WDMWLzZdwN8E1Q/vYQhKXu06
         YpnvmdKcgNrHrey0AAXs3Wq4cXsfTy2wq9He398Bss0hhwQNRR13pdF2A5/NDdTxTKXS
         ZW6EizN8yAIrsTB1yUjEYW2MBuRTUGaYIfq/DcKmAl8JbZwB1EEHd3sYjBnHhjwXjzC/
         faMAdtK7wNSo+MeCGm8xrMH9gpdI+Z/63dTTG9B0uWA4lw5mlltgtrXo6N30Fl9nfA8l
         dAhw==
X-Forwarded-Encrypted: i=1; AKwUvBywANvhlj5e2jiq1f9OCD0ma3/1IZoTUrFNvBroAJ0/lhiz47zZXn59PVqmyXCSR5boWDKeGKG31knWd1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX/IUkAURAE9HIBAXl1uvsAlEsDovE2FEIsD8ABbpRrFJeXHn5
	H7zXdCMq5ZrQ3+KQ3VTuk15MRlHs3BYLEF1WmkyblyBSdVmuwReBbD99x2jKHLYD2VL/v7RyLrP
	EKO123aQ+/8TdusbhcV/+L0Nbdw2ARa2FCzQo
X-Gm-Gg: AYBFou1jg70Qm/Ukikn6snE5QGK5Jx4J3GfWoEOkqxyP+/XrPlHWGy87kjRcSE9P1wG
	uhsnOoQMIYqKra/pTKNS9CAPz4qqo5muePo5/TSUOqE7fN9+XIki5FtN/XtLYkuoEA6IFVgxvX/
	6oNTnQhWETo8ADrCRyzkCG3xKz5nP4xZjbjlIypKIuN6kzwDY5GvFnPnkYW6N8X7UESEoh5CVts
	gilzNnm9WcXwc5VUUc/0SrEgMQVAXBLRTx0jjlDg355WkYlxX0AwK57GFbPkn+y3zi02pyQijIl
	ZMddp60aBjtLmX1oqwHZNuHgNezYRwkmV3HKzfIDrREVs6jWkdeXs0IKwitmwSlbMM5Rk3TvFrv
	7p+dQwifzum3BoffvtY/Ui6QUYr3ZTj2uGto5LdV4NREaVqipJ+E6ixfg
X-Received: by 2002:a05:651c:144c:b0:3a9:707e:ad9c with SMTP id
 38308e7fff4ca-3a9c5399cb7mr11669841fa.4.1791639173378; Sat, 10 Oct 2026
 06:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-4-sigefriedhyy@gmail.com> <179154713053.434549.11454657718901075006@kernel.org>
In-Reply-To: <179154713053.434549.11454657718901075006@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:32:42 +0900
X-Gm-Features: AclHuK8XHLLXtzmhhgPNwPEtq6aAUTQyZKtjE1IommkdRmUGkoYJ9BfWJQP14DE
Message-ID: <CA+7S2v+=pQv4OGqcK5Gw=ZdnQJ9FAhsYXwdbichThiTd4sVH7A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/6] net: add a generation counter for
 dev->mc changes
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [Medium] netlink: AF_PACKET multicast dump misses changes due to
>   reading sequence after loop

This  seems real, I will send a v11 patch, will sample before the
walk, and once more after it for the
NLMSG_DONE check.

> - [Low] __hw_addr_changed() (net/core/dev_addr_lists.c) does
>   atomic_inc(&dev_net(list->mc_dev)->dev_mc_genid).

Same as every other dev->mc writer under the address lock, nothing new.
