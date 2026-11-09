Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216542;
	b=bGXe/KN7fP6OHSJnZTJ0jZOB8UTTBPIG48ieQ3gno4WUvGaeUR+ztN9jvEUNILW0tqzj
	 BWbp3PuSqxmiWquOKfWIMP7yweWO5IPNMB1x3sRHZn9J5T1qRmX9Br8kT/yFJ+XRTqT81
	 mr3mxujAUFlPZ0dtrIkmHvwihPc04bLlGngOjH6KBgPkwaJIbqcYxwm3XS93wga3T1697
	 xJFvYL+F1NnC0/eGTTCcnA7Am3/1egkDGFpNXp+qQX9HRE5aZX2shY/AkCTSjD/NkHaN7
	 HLo5p9I+XiLrQ8/OZwJCXRJMgsu/pcnPjxfaZ1QZR75Xv1hQLWJ/k5Y4/PISZ6jSD3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216542;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=AmrTt/6pipZsJatMJSwh8md75Gn9+pghNgG0yVRFgvs=;
	b=nNHmY4NDux/T/TCHGfvG1OGw/Q7HH7nNiX2R0bw11WM2oSnxq85xwvq53qbHUVkhfz+L
	 qyHKNJFvXb/caVhPxhUe2MdfLTC7M7ZUc0BcBEJ0x+92PSGI+vk9OWccE+lL4Q8RdmeYv
	 BPX7YF0XWEbY8E98SLD9I5n+dfz9klc7hM9YGQwRjEwIsP3BjviM9Rdy7CONnXh46QIXH
	 VdK8QUQUZNban/cid9kWHZPWQeEPj/BTL1aOoCznNvCvznfiplwGUaoEcUUHJnKwRXRs5
	 JPA+lLIAaFUuDR8bjJn41SRLfcguvR5Qab5RKgpCjyUMSyJOWvEXsXNJsmYWv15ZQjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	arc=none smtp.remote-ip=62.149.155.149
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4A606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA4A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id QLgExbZPWb24ZQLgExoNEC; Mon, 09 Nov 2026 10:28:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1794216527; bh=1YKmB4/hQktR4bcr+eVoq+wNWQHNd4+yvTrBNPbK3s4=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=GJthTdsTGTPJ3qj15hERp4Xtmj6TUaxtk+VVh3MqzZ99tlMjXuSNLpN/CXtx9Pppb
	 kuWRz6WGbvGYtF4br+Os+/552Ut/OxJ+jqQkef4KlnUiIAb1cjwlWkTwZlvRvLE9GE
	 3vJCkI4nLjKB1wV3pLPqAs5p9bIo+wXKxGD5DlK4Aa76wpThS44hTzKHPLZsRWd3ZJ
	 dYH8D2faTaClEZ1Z+k2YjLFzSmp+KULNPxUf+K4K2DiMpH6djmBteU4Yg5XLDtLtWl
	 3vUMCgsH6k0YknwCYqQwf8/rw83oMJ/mddurcvdQ3i7M6F46c9RUfchA96KZn2uIKz
	 KahtSnve6jLxA==
Message-ID: <43045fee-e8e8-4f42-a535-8354a53680e8@enneenne.com>
Date: Mon, 9 Nov 2026 10:28:46 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pps: require CAP_SYS_TIME to attach N_PPS ldisc
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
References: <20261107211753.75932-1-dennylin0707@gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20261107211753.75932-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN2WTzEGkasPswpibo8NNWWx13DaxENherpwgOkzS0ty3n6fr8RDIjVCyFuBh/RHzTi5NXtQ+8JNIpbDEG6mfzxfPzTdID6D3UvO96Rllr99pgHMRFX3
 kHAo8twBenV/S2F5+0K7ux9H3zEbe9TOYkCqTSNBA6jh1uo8WeoYn2Y0HlT2g8j3PwZlF1MC7NiJTIT81Ipk/O0HC9eG29KEm/ZnG2nY3kqZ35MnaFMmK6+R
 oOyt+juVEbi7t5z9ChUUkjjmqGpo78SobDx9rpllmXo=

On 07/11/2026 22:17, Hungyu Lin wrote:
> Any unprivileged user can attach the N_PPS ldisc to a pty, and every
> attach registers a PPS source. At most PPS_MAX_SOURCES (256) sources can
> exist, so such a user can take all of them, after which registering a
> real PPS source fails with -EBUSY.
> 
> Require CAP_SYS_TIME to attach N_PPS, the capability that PPS_SETPARAMS
> already needs to configure a source.
> 
> Fixes: a0880df0ccde ("pps: serial clients support")
> Cc: stable@vger.kernel.org

Are you sure this is stable material? It changes what a user without
CAP_SYS_TIME can do, also on kernels already in the field.

> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/pps/clients/pps-ldisc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
> index fa5660f3c4b7..54678f20edd5 100644
> --- a/drivers/pps/clients/pps-ldisc.c
> +++ b/drivers/pps/clients/pps-ldisc.c
> @@ -46,6 +46,9 @@ static int pps_tty_open(struct tty_struct *tty)
>  	struct pps_device *pps;
>  	int ret;
> 
> +	if (!capable(CAP_SYS_TIME))
> +		return -EPERM;
> +

Did you check whether this breaks existing setups? Today whoever can
open the serial port can attach N_PPS (e.g. ldattach run by a user in
the dialout group), and with this change they get -EPERM.

Also, is pps_tty_open() called only from TIOCSETD? If it can also be
called when the tty is reopened after a hangup (tty_reopen()?), the
check would be done against whoever reopens the tty, not against
whoever attached N_PPS. Did you consider that case?

As you say, the cheap way to take all the sources is a pty. But can
N_PPS on a pty ever report a pulse? If pps_tty_dcd_change() is never
called there, wouldn't refusing N_PPS on a pty be enough, leaving the
real serial ports as they are today?

>  	info.owner = THIS_MODULE;
>  	info.dev = NULL;
>  	snprintf(info.name, PPS_MAX_NAME_LEN, "%s%d", drv->driver_name, index);
> --
> 2.43.0

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
