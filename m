Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7088154EEB0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956284; cv=none; b=tN5uheGTUHWrxjdve4ysjC/zYVUWOB9ev4kYL7zUu6pGvUzezzljUA163TdgKiPLaihaSk4pM+dTz+0kTX34p28azQlL9sEd4dxf/8opHK+7lRRKUeSd9Jpcp85aJCq2KnOkpPyuFZpfm2T/sryBdz6CFTjPtz8kt6Z605aFosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956284; c=relaxed/simple;
	bh=/nKoyS4UDsRHs1CtjvkS7/wZgU8bLh2faCw9K/M/RSs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=YocVHrkvuHiB1hLAY0Sa4jNhylmRqr1iPPapfFJIkk3nGp4ClyG3xyLuai9+2QAEOJnzDQ0aHemuqqWhfovC+atsQXA32GJzv6Ky7QBn0jlc0lUKv1hs12AUXBLO9YAMtjBzrJdZqyyWkjp+2sQ/jR1CtEwFbYIBn44/HWLgcS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eIM7r85+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eIM7r85+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C60C1A1A77;
	Wed,  9 Sep 2026 12:17:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FCFF60448;
	Wed,  9 Sep 2026 12:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B712A11C7AF5C;
	Wed,  9 Sep 2026 14:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788956275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qNmFgKaHVTo7k1CnKTAIn7ZprlOPVp4A3LUpXlIcrXc=;
	b=eIM7r85+6AmEgK2fUiLaJyvkR/5roH31GPkXQTZWPiOPKZhYs0nO/2hNXGz8YcyIeEaGZn
	TKq8K8DyjPLEonUfq4cwDH+zdYmDasbjsFTLeIzJTvWjJTYMkcwIY3Ec5bXBd83hZcJV5R
	LuQtJ4/MSAangDrLBrE80NInJZXzpBrw8sRKn8aEUDpUn0CJKvwcFyHVwvP1T/c2s9J6te
	i019ybV9PKakwUGMNfxMSRBoKGzSUqX0BL32mw0EXG8aq4cySE/3wEU7teudHI8l4m5cfO
	nujv9hw9MxtqsKGoFyxlVo+3kkav/p72EpIxJQUvpWPPHA5pRBIjZLw2aLgeCw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 14:17:51 +0200
Message-Id: <DLAS2LIDY508.2EPVYDDW3ZEFA@bootlin.com>
To: "James Clark" <jjc@jclark.com>, <netdev@vger.kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [RFC PATCH net] net: macb: fix ordering around PTP timestamp
 read
Cc: "Richard Cochran" <richardcochran@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <linux-kernel@vger.kernel.org>, "Nicolai Buchwitz" <nb@tipi-net.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908053150.28694-1-jjc@jclark.com>
In-Reply-To: <20260908053150.28694-1-jjc@jclark.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello James,

(added Nicolai as Cc)

On Tue Sep 8, 2026 at 7:31 AM CEST, James Clark wrote:
> PTP_SYS_OFFSET_EXTENDED returns system timestamps that do not correctly
> bracket the PHC register read on MACB/GEM. On a Raspberry Pi 5, the
> returned interval can be as short as 37 ns, while an ordered register
> read takes approximately 1 us. This biases the midpoint used by phc2sys,
> causing CLOCK_REALTIME to run approximately 0.5 us ahead when synchronize=
d
> to the PHC.
>
> gem_tsu_get_time() reads the nanoseconds register using the driver's
> relaxed MMIO accessor. On weakly ordered systems, the subsequent system
> timestamp can be taken before the register read completes.
>
> Add rmb() after the bracketed nanoseconds read in both the normal and
> seconds rollover paths, ensuring that the read completes before the post
> timestamp is taken. With the fix, the minimum interval on the same
> Raspberry Pi 5 increases to approximately 1 us.

Thanks for the nice commit message!

> Fixes: e51bb5c2784c ("net: macb: ptp: Switch to gettimex64() interface")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
> This uses rmb() to preserve the existing accessor and endianness handling=
.
> Would an ordered MMIO accessor be preferable for these two reads?
>
> Reproducer:
>
> #include <fcntl.h>
> #include <linux/ptp_clock.h>
> #include <stdio.h>
> #include <sys/ioctl.h>
>
> #define DEVICE "/dev/ptp0"
>
> int main(void)
> {
> 	struct ptp_sys_offset_extended ex =3D { .n_samples =3D 25 };
> 	long long min =3D -1;
> 	int fd =3D open(DEVICE, O_RDONLY);
>
> 	if (fd < 0) {
> 		perror(DEVICE);
> 		return 1;
> 	}
> 	for (int batch =3D 0; batch < 40; batch++) {
> 		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED, &ex) < 0) {
> 			perror("PTP_SYS_OFFSET_EXTENDED");
> 			return 1;
> 		}
> 		for (unsigned int i =3D 0; i < ex.n_samples; i++) {
> 			long long bracket =3D (ex.ts[i][2].sec - ex.ts[i][0].sec) * 1000000000=
LL
> 				+ (long long)ex.ts[i][2].nsec - ex.ts[i][0].nsec;
> 			if (min < 0 || bracket < min)
> 				min =3D bracket;
> 		}
> 	}
> 	printf("min bracket: %lld ns\n", min);
> 	return 0;
> }
>
>  drivers/net/ethernet/cadence/macb_ptp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/ethernet/cadence/macb_ptp.c b/drivers/net/ethern=
et/cadence/macb_ptp.c
> index e5195d7da..8209ec190 100644
> --- a/drivers/net/ethernet/cadence/macb_ptp.c
> +++ b/drivers/net/ethernet/cadence/macb_ptp.c
> @@ -51,6 +51,8 @@ static int gem_tsu_get_time(struct ptp_clock_info *ptp,=
 struct timespec64 *ts,
>  	spin_lock_irqsave(&bp->tsu_clk_lock, flags);
>  	ptp_read_system_prets(sts);
>  	first =3D gem_readl(bp, TN);
> +	/* Ensure the PHC read completes before taking the post timestamp. */
> +	rmb();
>  	ptp_read_system_postts(sts);
>  	secl =3D gem_readl(bp, TSL);
>  	sech =3D gem_readl(bp, TSH);

I think we should also add a memory barrier inbetween the first
ptp_read_system_prets() and the gem_readl(). That requires ordering
which isn't guaranteed.

Asking an LLM to double check, it tells me that we might have one by
accident: ptp_read_system_prets()
       -> ktime_get_snapshot_id()
       -> read_seqcount_retry() in exit path, after clock->read() call
       -> smp_rmb()

Do you agree?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
